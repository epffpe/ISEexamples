--------------------------------------------------------------------------------
--     This file is owned and controlled by Xilinx and must be used           --
--     solely for design, simulation, implementation and creation of          --
--     design files limited to Xilinx devices or technologies. Use            --
--     with non-Xilinx devices or technologies is expressly prohibited        --
--     and immediately terminates your license.                               --
--                                                                            --
--     XILINX IS PROVIDING THIS DESIGN, CODE, OR INFORMATION "AS IS"          --
--     SOLELY FOR USE IN DEVELOPING PROGRAMS AND SOLUTIONS FOR                --
--     XILINX DEVICES.  BY PROVIDING THIS DESIGN, CODE, OR INFORMATION        --
--     AS ONE POSSIBLE IMPLEMENTATION OF THIS FEATURE, APPLICATION            --
--     OR STANDARD, XILINX IS MAKING NO REPRESENTATION THAT THIS              --
--     IMPLEMENTATION IS FREE FROM ANY CLAIMS OF INFRINGEMENT,                --
--     AND YOU ARE RESPONSIBLE FOR OBTAINING ANY RIGHTS YOU MAY REQUIRE       --
--     FOR YOUR IMPLEMENTATION.  XILINX EXPRESSLY DISCLAIMS ANY               --
--     WARRANTY WHATSOEVER WITH RESPECT TO THE ADEQUACY OF THE                --
--     IMPLEMENTATION, INCLUDING BUT NOT LIMITED TO ANY WARRANTIES OR         --
--     REPRESENTATIONS THAT THIS IMPLEMENTATION IS FREE FROM CLAIMS OF        --
--     INFRINGEMENT, IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS        --
--     FOR A PARTICULAR PURPOSE.                                              --
--                                                                            --
--     Xilinx products are not intended for use in life support               --
--     appliances, devices, or systems. Use in such applications are          --
--     expressly prohibited.                                                  --
--                                                                            --
--     (c) Copyright 1995-2006 Xilinx, Inc.                                   --
--     All rights reserved.                                                   --
--------------------------------------------------------------------------------
-- You must compile the wrapper file ten_cnt.vhd when simulating
-- the core, ten_cnt. When compiling the wrapper file, be sure to
-- reference the XilinxCoreLib VHDL simulation library. For detailed
-- instructions, please refer to the "CORE Generator Help".

-- The synopsys directives "translate_off/translate_on" specified
-- below are supported by XST, FPGA Compiler II, Mentor Graphics and Synplicity
-- synthesis tools. Ensure they are correct for your synthesis tool(s).

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
-- synopsys translate_off
Library XilinxCoreLib;
-- synopsys translate_on
ENTITY ten_cnt IS
	port (
	clk: IN std_logic;
	ce: IN std_logic;
	ainit: IN std_logic;
	thresh0: OUT std_logic;
	q: OUT std_logic_VECTOR(3 downto 0));
END ten_cnt;

ARCHITECTURE ten_cnt_a OF ten_cnt IS
-- synopsys translate_off
component wrapped_ten_cnt
	port (
	clk: IN std_logic;
	ce: IN std_logic;
	ainit: IN std_logic;
	thresh0: OUT std_logic;
	q: OUT std_logic_VECTOR(3 downto 0));
end component;

-- Configuration specification 
	for all : wrapped_ten_cnt use entity XilinxCoreLib.c_counter_binary_v9_0(behavioral)
		generic map(
			c_count_mode => 0,
			c_has_aset => 0,
			c_load_enable => 0,
			c_load_low => 0,
			c_count_to => "1001",
			c_sync_priority => 1,
			c_has_iv => 0,
			c_has_sclr => 0,
			c_restrict_count => 1,
			c_width => 4,
			c_has_q_thresh1 => 0,
			c_enable_rlocs => 0,
			c_has_q_thresh0 => 0,
			c_thresh1_value => "0",
			c_has_load => 0,
			c_has_up => 0,
			c_thresh_early => 1,
			c_has_thresh1 => 0,
			c_has_thresh0 => 1,
			c_ainit_val => "0",
			c_has_ce => 1,
			c_pipe_stages => 0,
			c_has_aclr => 0,
			c_sync_enable => 1,
			c_has_ainit => 1,
			c_sinit_val => "0",
			c_has_sset => 0,
			c_has_sinit => 0,
			c_count_by => "1",
			c_has_l => 0,
			c_thresh0_value => "1");
-- synopsys translate_on
BEGIN
-- synopsys translate_off
U0 : wrapped_ten_cnt
		port map (
			clk => clk,
			ce => ce,
			ainit => ainit,
			thresh0 => thresh0,
			q => q);
-- synopsys translate_on

END ten_cnt_a;

