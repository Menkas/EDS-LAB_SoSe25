LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY D_FF IS
PORT(
		clk, reset, d	: IN STD_LOGIC;
		Q					: OUT STD_LOGIC
);
END D_FF;

ARCHITECTURE behav OF D_FF IS
-- Signals
BEGIN
	PROCESS(clk,reset)
	BEGIN
		IF(reset = '1') then
			Q <= '0';
		ELSIF(clk'event AND clk = '1') then
			Q <= D;
		END IF;
	END PROCESS;
END behav;