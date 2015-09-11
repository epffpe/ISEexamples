--------------------------------------------------------------------------------
-- Copyright (c) 1995-2003 Xilinx, Inc.
-- All Right Reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 8.2.02i
--  \   \         Application : ISE
--  /   /         Filename : counter_tbw.vhw
-- /___/   /\     Timestamp : Thu Dec 14 20:43:12 2006
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
    constant OFFSET : time := 100 ns;

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
                -- -------------  Current Time:  130ns
                WAIT FOR 130 ns;
                CHECK_COUNT_OUT("1111", 130);
                -- -------------------------------------
                -- -------------  Current Time:  170ns
                WAIT FOR 40 ns;
                CHECK_COUNT_OUT("1110", 170);
                -- -------------------------------------
                -- -------------  Current Time:  210ns
                WAIT FOR 40 ns;
                CHECK_COUNT_OUT("1101", 210);
                -- -------------------------------------
                -- -------------  Current Time:  250ns
                WAIT FOR 40 ns;
                CHECK_COUNT_OUT("1100", 250);
                -- -------------------------------------
                -- -------------  Current Time:  290ns
                WAIT FOR 40 ns;
                CHECK_COUNT_OUT("1011", 290);
                -- -------------------------------------
                -- -------------  Current Time:  310ns
                WAIT FOR 20 ns;
                DIRECTION <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  330ns
                WAIT FOR 20 ns;
                CHECK_COUNT_OUT("1100", 330);
                -- -------------------------------------
                -- -------------  Current Time:  370ns
                WAIT FOR 40 ns;
                CHECK_COUNT_OUT("1101", 370);
                -- -------------------------------------
                -- -------------  Current Time:  410ns
                WAIT FOR 40 ns;
                CHECK_COUNT_OUT("1110", 410);
                -- -------------------------------------
                -- -------------  Current Time:  450ns
                WAIT FOR 40 ns;
                CHECK_COUNT_OUT("1111", 450);
                -- -------------------------------------
                -- -------------  Current Time:  490ns
                WAIT FOR 40 ns;
                CHECK_COUNT_OUT("0000", 490);
                -- -------------------------------------
                -- -------------  Current Time:  530ns
                WAIT FOR 40 ns;
                CHECK_COUNT_OUT("0001", 530);
                -- -------------------------------------
                -- -------------  Current Time:  570ns
                WAIT FOR 40 ns;
                CHECK_COUNT_OUT("0010", 570);
                -- -------------------------------------
                -- -------------  Current Time:  610ns
                WAIT FOR 40 ns;
                CHECK_COUNT_OUT("0011", 610);
                -- -------------------------------------
                -- -------------  Current Time:  650ns
                WAIT FOR 40 ns;
                CHECK_COUNT_OUT("0100", 650);
                -- -------------------------------------
                -- -------------  Current Time:  690ns
                WAIT FOR 40 ns;
                CHECK_COUNT_OUT("0101", 690);
                -- -------------------------------------
                -- -------------  Current Time:  730ns
                WAIT FOR 40 ns;
                CHECK_COUNT_OUT("0110", 730);
                -- -------------------------------------
                -- -------------  Current Time:  770ns
                WAIT FOR 40 ns;
                CHECK_COUNT_OUT("0111", 770);
                -- -------------------------------------
                -- -------------  Current Time:  810ns
                WAIT FOR 40 ns;
                CHECK_COUNT_OUT("1000", 810);
                -- -------------------------------------
                -- -------------  Current Time:  850ns
                WAIT FOR 40 ns;
                CHECK_COUNT_OUT("1001", 850);
                -- -------------------------------------
                -- -------------  Current Time:  890ns
                WAIT FOR 40 ns;
                CHECK_COUNT_OUT("1010", 890);
                -- -------------------------------------
                -- -------------  Current Time:  910ns
                WAIT FOR 20 ns;
                DIRECTION <= '0';
                -- -------------------------------------
                -- -------------  Current Time:  930ns
                WAIT FOR 20 ns;
                CHECK_COUNT_OUT("1001", 930);
                -- -------------------------------------
                -- -------------  Current Time:  970ns
                WAIT FOR 40 ns;
                CHECK_COUNT_OUT("1000", 970);
                -- -------------------------------------
                -- -------------  Current Time:  1010ns
                WAIT FOR 40 ns;
                CHECK_COUNT_OUT("0111", 1010);
                -- -------------------------------------
                -- -------------  Current Time:  1050ns
                WAIT FOR 40 ns;
                CHECK_COUNT_OUT("0110", 1050);
                -- -------------------------------------
                -- -------------  Current Time:  1090ns
                WAIT FOR 40 ns;
                CHECK_COUNT_OUT("0101", 1090);
                -- -------------------------------------
                -- -------------  Current Time:  1130ns
                WAIT FOR 40 ns;
                CHECK_COUNT_OUT("0100", 1130);
                -- -------------------------------------
                -- -------------  Current Time:  1170ns
                WAIT FOR 40 ns;
                CHECK_COUNT_OUT("0011", 1170);
                -- -------------------------------------
                -- -------------  Current Time:  1210ns
                WAIT FOR 40 ns;
                CHECK_COUNT_OUT("0010", 1210);
                -- -------------------------------------
                -- -------------  Current Time:  1250ns
                WAIT FOR 40 ns;
                CHECK_COUNT_OUT("0001", 1250);
                -- -------------------------------------
                -- -------------  Current Time:  1290ns
                WAIT FOR 40 ns;
                CHECK_COUNT_OUT("0000", 1290);
                -- -------------------------------------
                -- -------------  Current Time:  1330ns
                WAIT FOR 40 ns;
                CHECK_COUNT_OUT("1111", 1330);
                -- -------------------------------------
                -- -------------  Current Time:  1370ns
                WAIT FOR 40 ns;
                CHECK_COUNT_OUT("1110", 1370);
                -- -------------------------------------
                -- -------------  Current Time:  1410ns
                WAIT FOR 40 ns;
                CHECK_COUNT_OUT("1101", 1410);
                -- -------------------------------------
                -- -------------  Current Time:  1450ns
                WAIT FOR 40 ns;
                CHECK_COUNT_OUT("1100", 1450);
                -- -------------------------------------
                -- -------------  Current Time:  1490ns
                WAIT FOR 40 ns;
                CHECK_COUNT_OUT("1011", 1490);
                -- -------------------------------------
                WAIT FOR 50 ns;

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

