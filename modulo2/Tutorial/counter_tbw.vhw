--------------------------------------------------------------------------------
-- Copyright (c) 1995-2003 Xilinx, Inc.
-- All Right Reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 8.2i
--  \   \         Application : ISE
--  /   /         Filename : counter_tbw.vhw
-- /___/   /\     Timestamp : Fri Jan 19 16:37:45 2007
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: 
--Design Name: counter_tbw
--Device: Xilinx
--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.STD_LOGIC_TEXTIO.ALL;
USE STD.TEXTIO.ALL;

ENTITY counter_tbw IS
END counter_tbw;

ARCHITECTURE testbench_arch OF counter_tbw IS
    FILE RESULTS: TEXT OPEN WRITE_MODE IS "results.txt";

    COMPONENT counter
        PORT (
            CLOCK : In std_logic;
            DIRECTION : In std_logic;
            COUNT_OUT : Out std_logic_vector (3 DownTo 0)
        );
    END COMPONENT;

    SIGNAL CLOCK : std_logic := '0';
    SIGNAL DIRECTION : std_logic := '0';
    SIGNAL COUNT_OUT : std_logic_vector (3 DownTo 0) := "0000";

    SHARED VARIABLE TX_ERROR : INTEGER := 0;
    SHARED VARIABLE TX_OUT : LINE;

    constant PERIOD : time := 40 ns;
    constant DUTY_CYCLE : real := 0.5;
    constant OFFSET : time := 200 ns;

    BEGIN
        UUT : counter
        PORT MAP (
            CLOCK => CLOCK,
            DIRECTION => DIRECTION,
            COUNT_OUT => COUNT_OUT
        );

        PROCESS    -- clock process for CLOCK
        BEGIN
            WAIT for OFFSET;
            CLOCK_LOOP : LOOP
                CLOCK <= '0';
                WAIT FOR (PERIOD - (PERIOD * DUTY_CYCLE));
                CLOCK <= '1';
                WAIT FOR (PERIOD * DUTY_CYCLE);
            END LOOP CLOCK_LOOP;
        END PROCESS;

        PROCESS
            PROCEDURE CHECK_COUNT_OUT(
                next_COUNT_OUT : std_logic_vector (3 DownTo 0);
                TX_TIME : INTEGER
            ) IS
                VARIABLE TX_STR : String(1 to 4096);
                VARIABLE TX_LOC : LINE;
                BEGIN
                IF (COUNT_OUT /= next_COUNT_OUT) THEN
                    STD.TEXTIO.write(TX_LOC, string'("Error at time="));
                    STD.TEXTIO.write(TX_LOC, TX_TIME);
                    STD.TEXTIO.write(TX_LOC, string'("ns COUNT_OUT="));
                    IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, COUNT_OUT);
                    STD.TEXTIO.write(TX_LOC, string'(", Expected = "));
                    IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, next_COUNT_OUT);
                    STD.TEXTIO.write(TX_LOC, string'(" "));
                    TX_STR(TX_LOC.all'range) := TX_LOC.all;
                    STD.TEXTIO.writeline(RESULTS, TX_LOC);
                    STD.TEXTIO.Deallocate(TX_LOC);
                    ASSERT (FALSE) REPORT TX_STR SEVERITY ERROR;
                    TX_ERROR := TX_ERROR + 1;
                END IF;
            END;
            BEGIN
                -- -------------  Current Time:  230ns
                WAIT FOR 230 ns;
                CHECK_COUNT_OUT("1111", 230);
                -- -------------------------------------
                -- -------------  Current Time:  270ns
                WAIT FOR 40 ns;
                CHECK_COUNT_OUT("1110", 270);
                -- -------------------------------------
                -- -------------  Current Time:  310ns
                WAIT FOR 40 ns;
                CHECK_COUNT_OUT("1101", 310);
                -- -------------------------------------
                -- -------------  Current Time:  330ns
                WAIT FOR 20 ns;
                DIRECTION <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  350ns
                WAIT FOR 20 ns;
                CHECK_COUNT_OUT("1110", 350);
                -- -------------------------------------
                -- -------------  Current Time:  390ns
                WAIT FOR 40 ns;
                CHECK_COUNT_OUT("1111", 390);
                -- -------------------------------------
                -- -------------  Current Time:  430ns
                WAIT FOR 40 ns;
                CHECK_COUNT_OUT("0000", 430);
                -- -------------------------------------
                -- -------------  Current Time:  470ns
                WAIT FOR 40 ns;
                CHECK_COUNT_OUT("0001", 470);
                -- -------------------------------------
                -- -------------  Current Time:  510ns
                WAIT FOR 40 ns;
                CHECK_COUNT_OUT("0010", 510);
                -- -------------------------------------
                -- -------------  Current Time:  550ns
                WAIT FOR 40 ns;
                CHECK_COUNT_OUT("0011", 550);
                -- -------------------------------------
                -- -------------  Current Time:  590ns
                WAIT FOR 40 ns;
                CHECK_COUNT_OUT("0100", 590);
                -- -------------------------------------
                -- -------------  Current Time:  630ns
                WAIT FOR 40 ns;
                CHECK_COUNT_OUT("0101", 630);
                -- -------------------------------------
                -- -------------  Current Time:  670ns
                WAIT FOR 40 ns;
                CHECK_COUNT_OUT("0110", 670);
                -- -------------------------------------
                -- -------------  Current Time:  710ns
                WAIT FOR 40 ns;
                CHECK_COUNT_OUT("0111", 710);
                -- -------------------------------------
                -- -------------  Current Time:  750ns
                WAIT FOR 40 ns;
                CHECK_COUNT_OUT("1000", 750);
                -- -------------------------------------
                -- -------------  Current Time:  790ns
                WAIT FOR 40 ns;
                CHECK_COUNT_OUT("1001", 790);
                -- -------------------------------------
                -- -------------  Current Time:  830ns
                WAIT FOR 40 ns;
                CHECK_COUNT_OUT("1010", 830);
                -- -------------------------------------
                -- -------------  Current Time:  870ns
                WAIT FOR 40 ns;
                CHECK_COUNT_OUT("1011", 870);
                -- -------------------------------------
                -- -------------  Current Time:  890ns
                WAIT FOR 20 ns;
                DIRECTION <= '0';
                -- -------------------------------------
                -- -------------  Current Time:  910ns
                WAIT FOR 20 ns;
                CHECK_COUNT_OUT("1010", 910);
                -- -------------------------------------
                -- -------------  Current Time:  950ns
                WAIT FOR 40 ns;
                CHECK_COUNT_OUT("1001", 950);
                -- -------------------------------------
                -- -------------  Current Time:  990ns
                WAIT FOR 40 ns;
                CHECK_COUNT_OUT("1000", 990);
                -- -------------------------------------
                -- -------------  Current Time:  1030ns
                WAIT FOR 40 ns;
                CHECK_COUNT_OUT("0111", 1030);
                -- -------------------------------------
                -- -------------  Current Time:  1070ns
                WAIT FOR 40 ns;
                CHECK_COUNT_OUT("0110", 1070);
                -- -------------------------------------
                -- -------------  Current Time:  1110ns
                WAIT FOR 40 ns;
                CHECK_COUNT_OUT("0101", 1110);
                -- -------------------------------------
                -- -------------  Current Time:  1150ns
                WAIT FOR 40 ns;
                CHECK_COUNT_OUT("0100", 1150);
                -- -------------------------------------
                -- -------------  Current Time:  1190ns
                WAIT FOR 40 ns;
                CHECK_COUNT_OUT("0011", 1190);
                -- -------------------------------------
                -- -------------  Current Time:  1230ns
                WAIT FOR 40 ns;
                CHECK_COUNT_OUT("0010", 1230);
                -- -------------------------------------
                -- -------------  Current Time:  1270ns
                WAIT FOR 40 ns;
                CHECK_COUNT_OUT("0001", 1270);
                -- -------------------------------------
                -- -------------  Current Time:  1310ns
                WAIT FOR 40 ns;
                CHECK_COUNT_OUT("0000", 1310);
                -- -------------------------------------
                -- -------------  Current Time:  1350ns
                WAIT FOR 40 ns;
                CHECK_COUNT_OUT("1111", 1350);
                -- -------------------------------------
                -- -------------  Current Time:  1390ns
                WAIT FOR 40 ns;
                CHECK_COUNT_OUT("1110", 1390);
                -- -------------------------------------
                -- -------------  Current Time:  1430ns
                WAIT FOR 40 ns;
                CHECK_COUNT_OUT("1101", 1430);
                -- -------------------------------------
                -- -------------  Current Time:  1470ns
                WAIT FOR 40 ns;
                CHECK_COUNT_OUT("1100", 1470);
                -- -------------------------------------
                WAIT FOR 70 ns;

                IF (TX_ERROR = 0) THEN
                    STD.TEXTIO.write(TX_OUT, string'("No errors or warnings"));
                    STD.TEXTIO.writeline(RESULTS, TX_OUT);
                    ASSERT (FALSE) REPORT
                      "Simulation successful (not a failure).  No problems detected."
                      SEVERITY FAILURE;
                ELSE
                    STD.TEXTIO.write(TX_OUT, TX_ERROR);
                    STD.TEXTIO.write(TX_OUT,
                        string'(" errors found in simulation"));
                    STD.TEXTIO.writeline(RESULTS, TX_OUT);
                    ASSERT (FALSE) REPORT "Errors found during simulation"
                         SEVERITY FAILURE;
                END IF;
            END PROCESS;

    END testbench_arch;

