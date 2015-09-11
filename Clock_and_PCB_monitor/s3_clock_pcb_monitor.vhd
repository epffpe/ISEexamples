--
-- KCPSM3 reference design - Real Time Digital Clock and PCB monitor with UART communications
--
-- Design provided for Spartan-3 Starter Board (rev E).
--
-- Ken Chapman - Xilinx Ltd - March 2003
--
-- The design demonstrates the following:-
--           Connection of KCPSM3 to Program ROM
--           Connection of UART macros supplied with PicoBlaze with
--                Baud rate generation
--           Definition of input and output ports with 
--                Minimum decoding
--                Pipelining where appropriate
--           Interrupt circuit with
--                Simple fixed period timer
--                Automatic clearing using interrupt acknowledge from KCPSM3
--
-- The design is set up for a 50MHz system clock and UART communications rate of 9600 baud,
-- 8-bit, no parity.
--
------------------------------------------------------------------------------------
--
-- NOTICE:
--
-- Copyright Xilinx, Inc. 2004.   This code may be contain portions patented by other 
-- third parties.  By providing this core as one possible implementation of a standard,
-- Xilinx is making no representation that the provided implementation of this standard 
-- is free from any claims of infringement by any third party.  Xilinx expressly 
-- disclaims any warranty with respect to the adequacy of the implementation, including 
-- but not limited to any warranty or representation that the implementation is free 
-- from claims of any third party.  Furthermore, Xilinx is providing this core as a 
-- courtesy to you and suggests that you contact all third parties to obtain the 
-- necessary rights to use this implementation.
--
------------------------------------------------------------------------------------
--
-- Library declarations
--
-- Standard IEEE libraries
--
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
--
-- The Unisim Library is used to define Xilinx primitives. It is also used during
-- simulation. The source can be viewed at %XILINX%\vhdl\src\unisims\unisim_VCOMP.vhd
--
library unisim;
use unisim.vcomponents.all;
--
------------------------------------------------------------------------------------
--
--
entity s3_clock_pcb_monitor is
    Port (         tx : out std_logic;
                   rx : in std_logic;
               switch : in std_logic_vector(7 downto 0);
               button : in std_logic_vector(3 downto 0);
                  led : out std_logic_vector(7 downto 0);
            segment_a : out std_logic;
            segment_b : out std_logic;
            segment_c : out std_logic;
            segment_d : out std_logic;
            segment_e : out std_logic;
            segment_f : out std_logic;
            segment_g : out std_logic;
           segment_dp : out std_logic;
          digit_anode : out std_logic_vector(3 downto 0);
             ram_addr : out std_logic_vector(17 downto 0);
           ram_a_data : inout std_logic_vector(15 downto 0);
               ram_we : out std_logic;
               ram_oe : out std_logic;
             ram_a_ce : out std_logic;
             ram_a_lb : out std_logic;
             ram_a_ub : out std_logic;
           ram_b_data : inout std_logic_vector(15 downto 0);
             ram_b_ce : out std_logic;
             ram_b_lb : out std_logic;
             ram_b_ub : out std_logic;
                  din : in std_logic;
                 cclk : out std_logic;
           reset_prom : out std_logic;
                  clk : in std_logic);
    end s3_clock_pcb_monitor;
--
------------------------------------------------------------------------------------
--
-- Start of test architecture
--
architecture Behavioral of s3_clock_pcb_monitor is
--
------------------------------------------------------------------------------------
--
-- declaration of KCPSM3
--
  component kcpsm3 
    Port (      address : out std_logic_vector(9 downto 0);
            instruction : in std_logic_vector(17 downto 0);
                port_id : out std_logic_vector(7 downto 0);
           write_strobe : out std_logic;
               out_port : out std_logic_vector(7 downto 0);
            read_strobe : out std_logic;
                in_port : in std_logic_vector(7 downto 0);
              interrupt : in std_logic;
          interrupt_ack : out std_logic;
                  reset : in std_logic;
                    clk : in std_logic);
    end component;
--
-- declaration of program ROM
--
  component monitor
    Port (      address : in std_logic_vector(9 downto 0);
            instruction : out std_logic_vector(17 downto 0);
                    clk : in std_logic);
    end component;
--
-- declaration of UART transmitter with integral 16 byte FIFO buffer
--
  component uart_tx
    Port (            data_in : in std_logic_vector(7 downto 0);
                 write_buffer : in std_logic;
                 reset_buffer : in std_logic;
                 en_16_x_baud : in std_logic;
                   serial_out : out std_logic;
                  buffer_full : out std_logic;
             buffer_half_full : out std_logic;
                          clk : in std_logic);
    end component;
--
-- declaration of UART Receiver with integral 16 byte FIFO buffer
--
  component uart_rx
    Port (            serial_in : in std_logic;
                       data_out : out std_logic_vector(7 downto 0);
                    read_buffer : in std_logic;
                   reset_buffer : in std_logic;
                   en_16_x_baud : in std_logic;
            buffer_data_present : out std_logic;
                    buffer_full : out std_logic;
               buffer_half_full : out std_logic;
                            clk : in std_logic);
  end component;
--
-- declaration of serial configuration PROM reading interface
--
  component prom_reader_serial
    generic(    length : integer := 5;                      --sync pattern 2^length
             frequency : integer := 50 );                   --system clock speed in MHz
    port(        clock : in std_logic; 
                 reset : in std_logic;                      --active high
                  read : in std_logic;                      --active low single cycle pulse
             next_sync : in std_logic;                      --active low single cycle pulse
                   din : in std_logic;
          sync_pattern : in std_logic_vector((2**length) - 1 downto 0);
                  cclk : out std_logic;
                  sync : out std_logic;                     --active low single cycle pulse
            data_ready : out std_logic;                     --active low single cycle pulse
            reset_prom : out std_logic;                     --active high to /OE of PROM (reset when high)
                  dout : out std_logic_vector(7 downto 0));
  end component;
--
------------------------------------------------------------------------------------
--
-- Signals used to connect KCPSM3 to program ROM and I/O logic
--
signal address         : std_logic_vector(9 downto 0);
signal instruction     : std_logic_vector(17 downto 0);
signal port_id         : std_logic_vector(7 downto 0);
signal out_port        : std_logic_vector(7 downto 0);
signal in_port         : std_logic_vector(7 downto 0);
signal write_strobe    : std_logic;
signal read_strobe     : std_logic;
signal interrupt       : std_logic;
signal interrupt_ack   : std_logic;
--
-- Signals for connection of peripherals
--
signal uart_status_port : std_logic_vector(7 downto 0);
--
-- Signals to form an timer generating an interrupt every microsecond
--
signal timer_count   : integer range 0 to 63 :=0;
signal timer_pulse   : std_logic;
--
-- Signals for UART connections
--
signal          baud_count : integer range 0 to 511 :=0;
signal        en_16_x_baud : std_logic;
signal       write_to_uart : std_logic;
signal             tx_full : std_logic;
signal        tx_half_full : std_logic;
signal      read_from_uart : std_logic;
signal             rx_data : std_logic_vector(7 downto 0);
signal     rx_data_present : std_logic;
signal             rx_full : std_logic;
signal        rx_half_full : std_logic;
--
-- Signals for 7-segment display driver
--
signal           digit_ram : std_logic_vector(7 downto 0);
signal          digit_data : std_logic_vector(7 downto 0);
signal          digit_scan : std_logic_vector(19 downto 0);
signal  write_to_digit_ram : std_logic;
--
-- Signals for SRAM memory 
--
signal          ram_a_byte : std_logic_vector(7 downto 0);
signal          ram_b_byte : std_logic_vector(7 downto 0);
signal         ram_data_in : std_logic_vector(7 downto 0);
signal        ram_data_out : std_logic_vector(7 downto 0);
signal         ctrl_ram_we : std_logic;
signal         ctrl_ram_oe : std_logic;
signal       ctrl_ram_a_ce : std_logic;
signal       ctrl_ram_a_ub : std_logic;
signal       ctrl_ram_a_lb : std_logic;
signal       ctrl_ram_b_ce : std_logic;
signal       ctrl_ram_b_ub : std_logic;
signal       ctrl_ram_b_lb : std_logic;
--
-- Signals for serial PROM reader 
--
signal             prom_data : std_logic_vector(7 downto 0);
signal     reset_prom_reader : std_logic;
signal       prom_read_pulse : std_logic;
signal       prom_sync_pulse : std_logic;
signal             prom_sync : std_logic;
signal prom_data_ready_pulse : std_logic;
signal       prom_data_ready : std_logic;
--
------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--
-- Start of circuit description
--
begin
  --
  ----------------------------------------------------------------------------------------------------------------------------------
  -- KCPSM3 and the program memory 
  ----------------------------------------------------------------------------------------------------------------------------------
  --

  processor: kcpsm3
    port map(      address => address,
               instruction => instruction,
                   port_id => port_id,
              write_strobe => write_strobe,
                  out_port => out_port,
               read_strobe => read_strobe,
                   in_port => in_port,
                 interrupt => interrupt,
             interrupt_ack => interrupt_ack,
                     reset => '0',
                       clk => clk);
 
  program_rom: monitor
    port map(      address => address,
               instruction => instruction,
             -- proc_reset => processor_reset,                   --additional port for JTAG loader version
                       clk => clk);

  --
  ----------------------------------------------------------------------------------------------------------------------------------
  -- Interrupt 
  ----------------------------------------------------------------------------------------------------------------------------------
  --
  --
  -- Interrupt is a generated once every 50 clock cycles to provide a 1us reference. 
  -- Interrupt is automatically cleared by interrupt acknowledgment from KCPSM3.
  --

  Timer: process(clk)
  begin

    if clk'event and clk='1' then
      
      if timer_count=49 then
         timer_count <= 0;
         timer_pulse <= '1';
       else
         timer_count <= timer_count + 1;
         timer_pulse <= '0';
      end if;

      if interrupt_ack = '1' then
         interrupt <= '0';
       elsif timer_pulse = '1' then 
         interrupt <= '1';
        else
         interrupt <= interrupt;
      end if;
     
    end if;
    
  end process Timer;



  --
  -- UART FIFO status signals and PROM reader status signals to form a bus
  --

  uart_status_port <= '0' & prom_sync & prom_data_ready & rx_data_present & rx_full & rx_half_full & tx_full & tx_half_full ;


  --
  -- SRAM control signals
  --

  ram_we <= ctrl_ram_we; 
  ram_oe <= ctrl_ram_oe; 
  ram_a_ce <= ctrl_ram_a_ce; 
  ram_a_ub <= ctrl_ram_a_ub; 
  ram_a_lb <= ctrl_ram_a_lb; 
  ram_b_ce <= ctrl_ram_b_ce; 
  ram_b_ub <= ctrl_ram_b_ub; 
  ram_b_lb <= ctrl_ram_b_lb; 

  --
  -- SRAM data selection based on RAM controls
  --

  ram_a_byte <= ram_a_data(7 downto 0) when ctrl_ram_a_lb='0' else ram_a_data(15 downto 8);
  ram_b_byte <= ram_b_data(7 downto 0) when ctrl_ram_b_lb='0' else ram_b_data(15 downto 8);
  ram_data_in <= ram_a_byte when ctrl_ram_a_ce='0' else ram_b_byte;

  --
  -- SRAM bidirectional data busses
  --
  -- The upper and lower bytes of the 16-bit data ports are provided with the same 
  -- information and the lower and upper byte controls will be used to write the 
  -- data appropreately.
  --

  ram_a_data <= (ram_data_out & ram_data_out) when ctrl_ram_oe='1' else "ZZZZZZZZZZZZZZZZ";
  ram_b_data <= (ram_data_out & ram_data_out) when ctrl_ram_oe='1' else "ZZZZZZZZZZZZZZZZ";



  --
  ----------------------------------------------------------------------------------------------------------------------------------
  -- KCPSM3 input ports 
  ----------------------------------------------------------------------------------------------------------------------------------
  --
  --
  -- The inputs connect via a pipelined multiplexer
  --

  input_ports: process(clk)
  begin
    if clk'event and clk='1' then

      case port_id(2 downto 0) is

        
        -- read UART status and PROM reader status at address 00 hex
        when "000" =>    in_port <= uart_status_port;

        -- read UART receive data at address 01 hex
        when "001" =>    in_port <= rx_data;

        -- read switches at address 02 hex
        when "010" =>    in_port <= switch;
 
        -- read press buttons at address 03 hex
        when "011" =>    in_port <= "0000" & button;  

        -- read SRAM data at address 04 hex
        when "100" =>    in_port <= ram_data_in; 

        -- read serial PROM data at address 05 hex
        -- Note that reading this port will automatically generate a pulse to fetch the next byte from the PROM reader.
        when "101" =>    in_port <= prom_data; 

        -- Don't care used to access the 7-segment digit memory with LSB's providing address
        when others =>    in_port <= digit_ram;  

      end case;

      -- Form read strobe for UART receiver FIFO buffer for address 01 hex (lower 3 bits only).
      -- The fact that the read strobe will occur after the actual data is read by 
      -- the KCPSM3 is acceptable because it is really means 'I have read you'!

      read_from_uart <= read_strobe and (not port_id(2)) and (not port_id(1)) and port_id(0)  ; 

    end if;

  end process input_ports;


  --
  ----------------------------------------------------------------------------------------------------------------------------------
  -- KCPSM3 output ports 
  ----------------------------------------------------------------------------------------------------------------------------------
  --

  -- adding the output registers to the clock processor
   
  output_ports: process(clk)
  begin

    if clk'event and clk='1' then
      if write_strobe='1' then

        -- LED register at address A0 hex 

        if port_id(7)='1' and port_id(6)='0'and port_id(5)='1' then
          led <= out_port;
        end if;

        -- SRAM controls address 80 hex  

        if port_id(7)='1' and port_id(6)='0'and port_id(5)='0' then
          ctrl_ram_we <= out_port(7); 
          ctrl_ram_oe <= out_port(6); 
          ctrl_ram_a_ce <= out_port(5); 
          ctrl_ram_a_ub <= out_port(4); 
          ctrl_ram_a_lb <= out_port(3); 
          ctrl_ram_b_ce <= out_port(2); 
          ctrl_ram_b_ub <= out_port(1); 
          ctrl_ram_b_lb <= out_port(0); 
        end if;

        -- SRAM data at addresses 60 hex  

        if port_id(7)='0' and port_id(6)='1'and port_id(5)='1' then
          ram_data_out <= out_port; 
        end if;

        -- Serial PROM reset control at addresses 40 hex (bit 0)  

        if port_id(7)='0' and port_id(6)='1'and port_id(5)='0' then
          reset_prom_reader <= out_port(0); 
        end if;

        -- Reserved at addresses 20 hex  

        --if port_id(7)='0' and port_id(6)='0'and port_id(5)='1' then
        --  ??????? <= out_port; 
        --end if;


        -- SRAM address requires 3 addresses.....
        --
        -- Lowest byte address 11 hex

        if port_id(4)='1' and port_id(0)='1' then
          ram_addr(7 downto 0) <= out_port;
        end if;

        -- Middle byte address 12 hex

        if port_id(4)='1' and  port_id(1)='1' then
          ram_addr(15 downto 8) <= out_port;
        end if;

        -- Upper bits byte address 14 hex

        if port_id(4)='1' and port_id(2)='1' then
          ram_addr(17 downto 16) <= out_port(1 downto 0);
        end if;

      end if;

    end if; 

  end process output_ports;

  --
  -- write to UART transmitter FIFO buffer at address C0 hex.
  -- This is a combinatorial decode because the FIFO is the 'port register'.
  --

  write_to_uart <= write_strobe and port_id(7) and port_id(6) and (not(port_id(5)));

  --
  -- write to 7-segment displays at addresses E0 to E3 hex.
  -- This is a combinatorial decode because the memories used are synchronous.
  --
  -- The 7-segment display is time multiplexed at a rate of 25Hz. 
  -- Dual port memory is used to inteface to the processor using one 
  -- location per digit. This acatually provides 16 locations which are read/write
  -- and can be used as further sratch pad memory locations (E0 to EF).
  --
  
  write_to_digit_ram <= write_strobe and port_id(7) and port_id(6) and port_id(5);

  digit_loop: for i in 0 to 7 generate
  --
  -- Insert 16x1 dual port memory using primitives
  -- Attribute to define RAM contents during implementation 
  -- The information is repeated in the generic map for functional simulation
  --
  attribute INIT : string; 
  attribute INIT of digit_bit       : label is "0000"; 
  --
  begin

    digit_bit: RAM16X1D
    --synthesis translate_off
    generic map(INIT => X"0000")
    --synthesis translate_on
    port map (       D => out_port(i),
                    WE => write_to_digit_ram,
                  WCLK => clk,
                    A0 => port_id(0),
                    A1 => port_id(1),
                    A2 => port_id(2),
                    A3 => port_id(3),
                 DPRA0 => digit_scan(18),
                 DPRA1 => digit_scan(19),
                 DPRA2 => '0',
                 DPRA3 => '0',
                   SPO => digit_ram(i),
                   DPO => digit_data(i));

  end generate digit_loop;

  --
  -- Counter to scan memory locations 
  --

  scan_counter: process(clk)
  begin
    if clk'event and clk='1' then
      --increment scan counter
      digit_scan <= digit_scan + 1;

      --decode anodes for correct digit (active low)

      case digit_scan (19 downto 18) is
        when "00" => digit_anode <= "1110";
        when "01" => digit_anode <= "1101";
        when "10" => digit_anode <= "1011";
        when "11" => digit_anode <= "0111";
        when others => digit_anode <= "XXXX"; 
      end case;

      --register and assign segment drivers  
      segment_a <= digit_data(0);
      segment_b <= digit_data(1);
      segment_c <= digit_data(2);
      segment_d <= digit_data(3);
      segment_e <= digit_data(4);
      segment_f <= digit_data(5);
      segment_g <= digit_data(6);
      segment_dp <= digit_data(7);

    end if;
  end process scan_counter;




  --
  ----------------------------------------------------------------------------------------------------------------------------------
  -- UART  
  ----------------------------------------------------------------------------------------------------------------------------------
  --
  -- Connect the 8-bit, 1 stop-bit, no parity transmit and receive macros.
  -- Each contains an embedded 16-byte FIFO buffer.
  --

  transmit: uart_tx 
  port map (            data_in => out_port, 
                   write_buffer => write_to_uart,
                   reset_buffer => '0',
                   en_16_x_baud => en_16_x_baud,
                     serial_out => tx,
                    buffer_full => tx_full,
               buffer_half_full => tx_half_full,
                            clk => clk );

  receive: uart_rx
  port map (            serial_in => rx,
                         data_out => rx_data,
                      read_buffer => read_from_uart,
                     reset_buffer => '0',
                     en_16_x_baud => en_16_x_baud,
              buffer_data_present => rx_data_present,
                      buffer_full => rx_full,
                 buffer_half_full => rx_half_full,
                              clk => clk );  
  
  --
  -- Set baud rate to 9600 for the UART communications
  --
  -- For 50MHz clock the 'en_16_x_baud' is 153600Hz and means a pulse required every 326 cycles 
  --

  baud_timer: process(clk)
  begin
    if clk'event and clk='1' then
      if baud_count=325 then
           baud_count <= 0;
         en_16_x_baud <= '1';
       else
           baud_count <= baud_count + 1;
         en_16_x_baud <= '0';
      end if;
    end if;
  end process baud_timer;

  --
  ----------------------------------------------------------------------------------------------------------------------------------
  -- Serial configuration PROM reader  
  ----------------------------------------------------------------------------------------------------------------------------------
  --
  -- This macro enables data stored afater the Spartan-3 configuration data to be located and then read
  -- sequentially.
  --

  prom_access: prom_reader_serial
  generic map(    length => 5,                      --Synchronisation pattern is 2^5 = 32 bits
               frequency => 50)                     --System clock rate is 50MHz
  port map(        clock => clk,  
                   reset => reset_prom_reader,      --reset reader and initiates search for sysnc pattern         
                    read => prom_read_pulse,        --active low pulse initiates retrieval of next byte
               next_sync => '1',                    --would be used to find another sync pattern
                     din => din,                    --from XCF02S device
            sync_pattern => X"8F9FAFBF",            --32bit synchronisation pattern is constant in this application
                    cclk => cclk,                   --to XCF02S device
                    sync => prom_sync_pulse,        --active low pulse indicates sync pattern located
              data_ready => prom_data_ready_pulse,  --active low pulse indicates data byte received
              reset_prom => reset_prom,             --to XCF02S device
                    dout => prom_data);             --byte received from serial prom

  --
  --Need to 'latch' (synchronously) the status pulses so they can be read by the processor using polling.
  --These are cleared by a prom reset or read.
  --

  prom_interface_logic: process(clk)
  begin
    if clk'event and clk='1' then

      if prom_read_pulse='0' or reset_prom_reader='1' then
           prom_data_ready <= '0';
        elsif prom_data_ready_pulse='0' then
           prom_data_ready <= '1';
        else
           prom_data_ready <= prom_data_ready;
      end if;

      if prom_read_pulse='0' or reset_prom_reader='1' then
           prom_sync <= '0';
        elsif prom_sync_pulse='0' then
           prom_sync <= '1';
        else
           prom_sync <= prom_sync;
      end if;


      --
      -- The act of reading a byte of data will cause a single cycle active low pulse to generated
      -- to instigate the read of the next byte from serial PROM.
      -- This is a read port address 05 hex.
      --

      prom_read_pulse <= not( read_strobe and port_id(2) and (not(port_id(1))) and port_id(0) );


    end if;
  end process prom_interface_logic;



------------------------------------------------------------------------------------------------------------------------------------

end Behavioral;

------------------------------------------------------------------------------------------------------------------------------------
--
-- END OF FILE s3_clock_pcb_monitor.vhd
--
------------------------------------------------------------------------------------------------------------------------------------

