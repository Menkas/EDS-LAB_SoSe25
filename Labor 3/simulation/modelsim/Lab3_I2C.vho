-- Copyright (C) 2021  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and any partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details, at
-- https://fpgasoftware.intel.com/eula.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 21.1.0 Build 842 10/21/2021 SJ Lite Edition"

-- DATE "06/18/2025 15:27:07"

-- 
-- Device: Altera 5CGXFC7C7F23C8 Package FBGA484
-- 

-- 
-- This VHDL file should be used for Questa Intel FPGA (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY ALTERA_LNSIM;
LIBRARY CYCLONEV;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE ALTERA_LNSIM.ALTERA_LNSIM_COMPONENTS.ALL;
USE CYCLONEV.CYCLONEV_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	I2C_Tmp IS
    PORT (
	clk : IN std_logic;
	reset : IN std_logic;
	i2c_sdat : INOUT std_logic;
	i2c_sclk : OUT std_logic
	);
END I2C_Tmp;

-- Design Ports Information
-- i2c_sclk	=>  Location: PIN_N16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i2c_sdat	=>  Location: PIN_N21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reset	=>  Location: PIN_N20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_M16,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF I2C_Tmp IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_clk : std_logic;
SIGNAL ww_reset : std_logic;
SIGNAL ww_i2c_sclk : std_logic;
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \clk~inputCLKENA0_outclk\ : std_logic;
SIGNAL \reset~input_o\ : std_logic;
SIGNAL \i2c_clkdiv[2]~DUPLICATE_q\ : std_logic;
SIGNAL \i2c_clkdiv[3]~4_combout\ : std_logic;
SIGNAL \i2c_clkdiv[0]~DUPLICATE_q\ : std_logic;
SIGNAL \i2c_clkdiv[4]~DUPLICATE_q\ : std_logic;
SIGNAL \i2c_clkdiv[3]~DUPLICATE_q\ : std_logic;
SIGNAL \i2c_clkdiv[5]~2_combout\ : std_logic;
SIGNAL \i2c_clkdiv[5]~DUPLICATE_q\ : std_logic;
SIGNAL \i2c_clkdiv~3_combout\ : std_logic;
SIGNAL \i2c_clkdiv~1_combout\ : std_logic;
SIGNAL \i2c_clkdiv[2]~5_combout\ : std_logic;
SIGNAL \i2c_clkdiv~0_combout\ : std_logic;
SIGNAL \Equal0~0_combout\ : std_logic;
SIGNAL \i2c_clk~0_combout\ : std_logic;
SIGNAL \i2c_clk~feeder_combout\ : std_logic;
SIGNAL \i2c_clk~q\ : std_logic;
SIGNAL \i2c_sdat~input_o\ : std_logic;
SIGNAL \next_bitcnt[3]~13_combout\ : std_logic;
SIGNAL \next_bitcnt[3]~21_combout\ : std_logic;
SIGNAL \Selector6~0_combout\ : std_logic;
SIGNAL \next_bitcnt[3]~15_combout\ : std_logic;
SIGNAL \Folgezustand~10_combout\ : std_logic;
SIGNAL \Folgezustand.WAIT_FOR_NEXT_STATE~q\ : std_logic;
SIGNAL \next_wordcnt[2]~5_combout\ : std_logic;
SIGNAL \next_wordcnt[1]~9_combout\ : std_logic;
SIGNAL \next_wordcnt[0]~13_combout\ : std_logic;
SIGNAL \Selector13~0_combout\ : std_logic;
SIGNAL \next_wordcnt[0]~15_combout\ : std_logic;
SIGNAL \next_wordcnt[3]~1_combout\ : std_logic;
SIGNAL \Add3~0_combout\ : std_logic;
SIGNAL \next_wordcnt[3]~3_combout\ : std_logic;
SIGNAL \next_wordcnt[3]~_emulated_q\ : std_logic;
SIGNAL \next_wordcnt[3]~2_combout\ : std_logic;
SIGNAL \Folgezustand~9_combout\ : std_logic;
SIGNAL \next_wordcnt[3]~20_combout\ : std_logic;
SIGNAL \next_wordcnt[0]~_emulated_q\ : std_logic;
SIGNAL \next_wordcnt[0]~14_combout\ : std_logic;
SIGNAL \next_wordcnt[1]~11_combout\ : std_logic;
SIGNAL \next_wordcnt[1]~_emulated_q\ : std_logic;
SIGNAL \next_wordcnt[1]~10_combout\ : std_logic;
SIGNAL \Add3~1_combout\ : std_logic;
SIGNAL \next_wordcnt[2]~7_combout\ : std_logic;
SIGNAL \next_wordcnt[2]~_emulated_q\ : std_logic;
SIGNAL \next_wordcnt[2]~6_combout\ : std_logic;
SIGNAL \Selector4~0_combout\ : std_logic;
SIGNAL \Selector4~1_combout\ : std_logic;
SIGNAL \Folgezustand.SENDDATA~q\ : std_logic;
SIGNAL \Folgezustand.START~1_combout\ : std_logic;
SIGNAL \Folgezustand.START~q\ : std_logic;
SIGNAL \Selector2~0_combout\ : std_logic;
SIGNAL \Folgezustand.SEND_ADDRESS~q\ : std_logic;
SIGNAL \WideOr3~0_combout\ : std_logic;
SIGNAL \next_bitcnt[3]~_emulated_q\ : std_logic;
SIGNAL \next_bitcnt[3]~14_combout\ : std_logic;
SIGNAL \next_bitcnt[3]~22_combout\ : std_logic;
SIGNAL \next_bitcnt[1]~5_combout\ : std_logic;
SIGNAL \Selector8~0_combout\ : std_logic;
SIGNAL \next_bitcnt[1]~7_combout\ : std_logic;
SIGNAL \next_bitcnt[1]~_emulated_q\ : std_logic;
SIGNAL \next_bitcnt[1]~6_combout\ : std_logic;
SIGNAL \Selector7~0_combout\ : std_logic;
SIGNAL \next_bitcnt[2]~1_combout\ : std_logic;
SIGNAL \next_bitcnt[2]~3_combout\ : std_logic;
SIGNAL \next_bitcnt[2]~_emulated_q\ : std_logic;
SIGNAL \next_bitcnt[2]~2_combout\ : std_logic;
SIGNAL \Selector3~0_combout\ : std_logic;
SIGNAL \next_bitcnt[0]~9_combout\ : std_logic;
SIGNAL \next_bitcnt[0]~11_combout\ : std_logic;
SIGNAL \next_bitcnt[0]~_emulated_q\ : std_logic;
SIGNAL \next_bitcnt[0]~10_combout\ : std_logic;
SIGNAL \next_bitcnt[3]~16_combout\ : std_logic;
SIGNAL \Selector3~1_combout\ : std_logic;
SIGNAL \Folgezustand.ACK~q\ : std_logic;
SIGNAL \Folgezustand.STOP~q\ : std_logic;
SIGNAL \Selector1~0_combout\ : std_logic;
SIGNAL \Folgezustand.IDLE~q\ : std_logic;
SIGNAL \Selector15~1_combout\ : std_logic;
SIGNAL \Mux17~1_combout\ : std_logic;
SIGNAL \Mux17~0_combout\ : std_logic;
SIGNAL \Mux17~2_combout\ : std_logic;
SIGNAL \Selector15~0_combout\ : std_logic;
SIGNAL \i2c_sdat~reg0_q\ : std_logic;
SIGNAL \i2c_sdat~2_combout\ : std_logic;
SIGNAL \i2c_sdat~en_q\ : std_logic;
SIGNAL \Selector0~0_combout\ : std_logic;
SIGNAL \i2c_sclk~reg0_q\ : std_logic;
SIGNAL i2c_bitcnt : std_logic_vector(3 DOWNTO 0);
SIGNAL i2c_wordcnt : std_logic_vector(3 DOWNTO 0);
SIGNAL i2c_clkdiv : std_logic_vector(5 DOWNTO 0);
SIGNAL \ALT_INV_i2c_clkdiv[4]~DUPLICATE_q\ : std_logic;
SIGNAL \ALT_INV_i2c_clkdiv[3]~DUPLICATE_q\ : std_logic;
SIGNAL \ALT_INV_i2c_clkdiv[2]~DUPLICATE_q\ : std_logic;
SIGNAL \ALT_INV_Folgezustand.ACK~q\ : std_logic;
SIGNAL \ALT_INV_Folgezustand.SENDDATA~q\ : std_logic;
SIGNAL \ALT_INV_Folgezustand.IDLE~q\ : std_logic;
SIGNAL \ALT_INV_i2c_sclk~reg0_q\ : std_logic;
SIGNAL \ALT_INV_Folgezustand.STOP~q\ : std_logic;
SIGNAL \ALT_INV_i2c_clk~q\ : std_logic;
SIGNAL \ALT_INV_Folgezustand.START~q\ : std_logic;
SIGNAL \ALT_INV_Folgezustand.SEND_ADDRESS~q\ : std_logic;
SIGNAL ALT_INV_i2c_bitcnt : std_logic_vector(3 DOWNTO 0);
SIGNAL \ALT_INV_next_bitcnt[3]~16_combout\ : std_logic;
SIGNAL ALT_INV_i2c_wordcnt : std_logic_vector(3 DOWNTO 0);
SIGNAL \ALT_INV_Selector8~0_combout\ : std_logic;
SIGNAL \ALT_INV_Folgezustand~9_combout\ : std_logic;
SIGNAL \ALT_INV_next_wordcnt[3]~_emulated_q\ : std_logic;
SIGNAL \ALT_INV_next_wordcnt[0]~_emulated_q\ : std_logic;
SIGNAL \ALT_INV_next_bitcnt[3]~21_combout\ : std_logic;
SIGNAL \ALT_INV_Selector4~0_combout\ : std_logic;
SIGNAL \ALT_INV_Add3~0_combout\ : std_logic;
SIGNAL \ALT_INV_next_wordcnt[1]~_emulated_q\ : std_logic;
SIGNAL \ALT_INV_next_wordcnt[2]~6_combout\ : std_logic;
SIGNAL ALT_INV_i2c_clkdiv : std_logic_vector(5 DOWNTO 0);
SIGNAL \ALT_INV_i2c_clk~0_combout\ : std_logic;
SIGNAL \ALT_INV_next_bitcnt[1]~_emulated_q\ : std_logic;
SIGNAL \ALT_INV_Folgezustand.WAIT_FOR_NEXT_STATE~q\ : std_logic;
SIGNAL \ALT_INV_next_bitcnt[0]~10_combout\ : std_logic;
SIGNAL \ALT_INV_Equal0~0_combout\ : std_logic;
SIGNAL \ALT_INV_Selector3~0_combout\ : std_logic;
SIGNAL \ALT_INV_next_bitcnt[3]~_emulated_q\ : std_logic;
SIGNAL \ALT_INV_next_bitcnt[2]~2_combout\ : std_logic;
SIGNAL \ALT_INV_next_bitcnt[0]~_emulated_q\ : std_logic;
SIGNAL \ALT_INV_next_wordcnt[2]~_emulated_q\ : std_logic;
SIGNAL \ALT_INV_next_wordcnt[1]~10_combout\ : std_logic;
SIGNAL \ALT_INV_next_wordcnt[0]~14_combout\ : std_logic;
SIGNAL \ALT_INV_next_wordcnt[3]~2_combout\ : std_logic;
SIGNAL \ALT_INV_next_bitcnt[1]~6_combout\ : std_logic;
SIGNAL \ALT_INV_Selector6~0_combout\ : std_logic;
SIGNAL \ALT_INV_Selector7~0_combout\ : std_logic;
SIGNAL \ALT_INV_next_bitcnt[2]~_emulated_q\ : std_logic;
SIGNAL \ALT_INV_next_bitcnt[3]~14_combout\ : std_logic;
SIGNAL \ALT_INV_next_bitcnt[3]~22_combout\ : std_logic;
SIGNAL \ALT_INV_next_wordcnt[1]~9_combout\ : std_logic;
SIGNAL \ALT_INV_next_wordcnt[0]~13_combout\ : std_logic;
SIGNAL \ALT_INV_next_wordcnt[3]~1_combout\ : std_logic;
SIGNAL \ALT_INV_next_wordcnt[2]~5_combout\ : std_logic;
SIGNAL \ALT_INV_Mux17~2_combout\ : std_logic;
SIGNAL \ALT_INV_Mux17~0_combout\ : std_logic;
SIGNAL \ALT_INV_next_bitcnt[1]~5_combout\ : std_logic;
SIGNAL \ALT_INV_next_bitcnt[3]~13_combout\ : std_logic;
SIGNAL \ALT_INV_i2c_sdat~input_o\ : std_logic;
SIGNAL \ALT_INV_reset~input_o\ : std_logic;
SIGNAL \ALT_INV_i2c_clkdiv[0]~DUPLICATE_q\ : std_logic;
SIGNAL \ALT_INV_i2c_clkdiv[5]~DUPLICATE_q\ : std_logic;
SIGNAL \ALT_INV_Selector13~0_combout\ : std_logic;
SIGNAL \ALT_INV_Mux17~1_combout\ : std_logic;
SIGNAL \ALT_INV_Selector15~1_combout\ : std_logic;
SIGNAL \ALT_INV_Add3~1_combout\ : std_logic;
SIGNAL \ALT_INV_next_bitcnt[0]~9_combout\ : std_logic;
SIGNAL \ALT_INV_next_bitcnt[2]~1_combout\ : std_logic;

BEGIN

ww_clk <= clk;
ww_reset <= reset;
i2c_sclk <= ww_i2c_sclk;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\ALT_INV_i2c_clkdiv[4]~DUPLICATE_q\ <= NOT \i2c_clkdiv[4]~DUPLICATE_q\;
\ALT_INV_i2c_clkdiv[3]~DUPLICATE_q\ <= NOT \i2c_clkdiv[3]~DUPLICATE_q\;
\ALT_INV_i2c_clkdiv[2]~DUPLICATE_q\ <= NOT \i2c_clkdiv[2]~DUPLICATE_q\;
\ALT_INV_Folgezustand.ACK~q\ <= NOT \Folgezustand.ACK~q\;
\ALT_INV_Folgezustand.SENDDATA~q\ <= NOT \Folgezustand.SENDDATA~q\;
\ALT_INV_Folgezustand.IDLE~q\ <= NOT \Folgezustand.IDLE~q\;
\ALT_INV_i2c_sclk~reg0_q\ <= NOT \i2c_sclk~reg0_q\;
\ALT_INV_Folgezustand.STOP~q\ <= NOT \Folgezustand.STOP~q\;
\ALT_INV_i2c_clk~q\ <= NOT \i2c_clk~q\;
\ALT_INV_Folgezustand.START~q\ <= NOT \Folgezustand.START~q\;
\ALT_INV_Folgezustand.SEND_ADDRESS~q\ <= NOT \Folgezustand.SEND_ADDRESS~q\;
ALT_INV_i2c_bitcnt(3) <= NOT i2c_bitcnt(3);
ALT_INV_i2c_bitcnt(2) <= NOT i2c_bitcnt(2);
\ALT_INV_next_bitcnt[3]~16_combout\ <= NOT \next_bitcnt[3]~16_combout\;
ALT_INV_i2c_wordcnt(3) <= NOT i2c_wordcnt(3);
\ALT_INV_Selector8~0_combout\ <= NOT \Selector8~0_combout\;
\ALT_INV_Folgezustand~9_combout\ <= NOT \Folgezustand~9_combout\;
\ALT_INV_next_wordcnt[3]~_emulated_q\ <= NOT \next_wordcnt[3]~_emulated_q\;
\ALT_INV_next_wordcnt[0]~_emulated_q\ <= NOT \next_wordcnt[0]~_emulated_q\;
\ALT_INV_next_bitcnt[3]~21_combout\ <= NOT \next_bitcnt[3]~21_combout\;
\ALT_INV_Selector4~0_combout\ <= NOT \Selector4~0_combout\;
\ALT_INV_Add3~0_combout\ <= NOT \Add3~0_combout\;
ALT_INV_i2c_wordcnt(1) <= NOT i2c_wordcnt(1);
\ALT_INV_next_wordcnt[1]~_emulated_q\ <= NOT \next_wordcnt[1]~_emulated_q\;
\ALT_INV_next_wordcnt[2]~6_combout\ <= NOT \next_wordcnt[2]~6_combout\;
ALT_INV_i2c_wordcnt(0) <= NOT i2c_wordcnt(0);
ALT_INV_i2c_clkdiv(4) <= NOT i2c_clkdiv(4);
ALT_INV_i2c_clkdiv(0) <= NOT i2c_clkdiv(0);
ALT_INV_i2c_clkdiv(3) <= NOT i2c_clkdiv(3);
\ALT_INV_i2c_clk~0_combout\ <= NOT \i2c_clk~0_combout\;
ALT_INV_i2c_clkdiv(2) <= NOT i2c_clkdiv(2);
ALT_INV_i2c_bitcnt(1) <= NOT i2c_bitcnt(1);
\ALT_INV_next_bitcnt[1]~_emulated_q\ <= NOT \next_bitcnt[1]~_emulated_q\;
\ALT_INV_Folgezustand.WAIT_FOR_NEXT_STATE~q\ <= NOT \Folgezustand.WAIT_FOR_NEXT_STATE~q\;
\ALT_INV_next_bitcnt[0]~10_combout\ <= NOT \next_bitcnt[0]~10_combout\;
ALT_INV_i2c_clkdiv(5) <= NOT i2c_clkdiv(5);
\ALT_INV_Equal0~0_combout\ <= NOT \Equal0~0_combout\;
\ALT_INV_Selector3~0_combout\ <= NOT \Selector3~0_combout\;
\ALT_INV_next_bitcnt[3]~_emulated_q\ <= NOT \next_bitcnt[3]~_emulated_q\;
\ALT_INV_next_bitcnt[2]~2_combout\ <= NOT \next_bitcnt[2]~2_combout\;
ALT_INV_i2c_wordcnt(2) <= NOT i2c_wordcnt(2);
\ALT_INV_next_bitcnt[0]~_emulated_q\ <= NOT \next_bitcnt[0]~_emulated_q\;
\ALT_INV_next_wordcnt[2]~_emulated_q\ <= NOT \next_wordcnt[2]~_emulated_q\;
\ALT_INV_next_wordcnt[1]~10_combout\ <= NOT \next_wordcnt[1]~10_combout\;
\ALT_INV_next_wordcnt[0]~14_combout\ <= NOT \next_wordcnt[0]~14_combout\;
ALT_INV_i2c_clkdiv(1) <= NOT i2c_clkdiv(1);
\ALT_INV_next_wordcnt[3]~2_combout\ <= NOT \next_wordcnt[3]~2_combout\;
\ALT_INV_next_bitcnt[1]~6_combout\ <= NOT \next_bitcnt[1]~6_combout\;
\ALT_INV_Selector6~0_combout\ <= NOT \Selector6~0_combout\;
\ALT_INV_Selector7~0_combout\ <= NOT \Selector7~0_combout\;
ALT_INV_i2c_bitcnt(0) <= NOT i2c_bitcnt(0);
\ALT_INV_next_bitcnt[2]~_emulated_q\ <= NOT \next_bitcnt[2]~_emulated_q\;
\ALT_INV_next_bitcnt[3]~14_combout\ <= NOT \next_bitcnt[3]~14_combout\;
\ALT_INV_next_bitcnt[3]~22_combout\ <= NOT \next_bitcnt[3]~22_combout\;
\ALT_INV_next_wordcnt[1]~9_combout\ <= NOT \next_wordcnt[1]~9_combout\;
\ALT_INV_next_wordcnt[0]~13_combout\ <= NOT \next_wordcnt[0]~13_combout\;
\ALT_INV_next_wordcnt[3]~1_combout\ <= NOT \next_wordcnt[3]~1_combout\;
\ALT_INV_next_wordcnt[2]~5_combout\ <= NOT \next_wordcnt[2]~5_combout\;
\ALT_INV_Mux17~2_combout\ <= NOT \Mux17~2_combout\;
\ALT_INV_Mux17~0_combout\ <= NOT \Mux17~0_combout\;
\ALT_INV_next_bitcnt[1]~5_combout\ <= NOT \next_bitcnt[1]~5_combout\;
\ALT_INV_next_bitcnt[3]~13_combout\ <= NOT \next_bitcnt[3]~13_combout\;
\ALT_INV_i2c_sdat~input_o\ <= NOT \i2c_sdat~input_o\;
\ALT_INV_reset~input_o\ <= NOT \reset~input_o\;
\ALT_INV_i2c_clkdiv[0]~DUPLICATE_q\ <= NOT \i2c_clkdiv[0]~DUPLICATE_q\;
\ALT_INV_i2c_clkdiv[5]~DUPLICATE_q\ <= NOT \i2c_clkdiv[5]~DUPLICATE_q\;
\ALT_INV_Selector13~0_combout\ <= NOT \Selector13~0_combout\;
\ALT_INV_Mux17~1_combout\ <= NOT \Mux17~1_combout\;
\ALT_INV_Selector15~1_combout\ <= NOT \Selector15~1_combout\;
\ALT_INV_Add3~1_combout\ <= NOT \Add3~1_combout\;
\ALT_INV_next_bitcnt[0]~9_combout\ <= NOT \next_bitcnt[0]~9_combout\;
\ALT_INV_next_bitcnt[2]~1_combout\ <= NOT \next_bitcnt[2]~1_combout\;

-- Location: IOOBUF_X89_Y35_N45
\i2c_sclk~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \i2c_sclk~reg0_q\,
	devoe => ww_devoe,
	o => ww_i2c_sclk);

-- Location: IOOBUF_X89_Y35_N96
\i2c_sdat~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \i2c_sdat~reg0_q\,
	oe => \i2c_sdat~en_q\,
	devoe => ww_devoe,
	o => i2c_sdat);

-- Location: IOIBUF_X89_Y35_N61
\clk~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk,
	o => \clk~input_o\);

-- Location: CLKCTRL_G10
\clk~inputCLKENA0\ : cyclonev_clkena
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	disable_mode => "low",
	ena_register_mode => "always enabled",
	ena_register_power_up => "high",
	test_syn => "high")
-- pragma translate_on
PORT MAP (
	inclk => \clk~input_o\,
	outclk => \clk~inputCLKENA0_outclk\);

-- Location: IOIBUF_X89_Y35_N78
\reset~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reset,
	o => \reset~input_o\);

-- Location: FF_X84_Y35_N59
\i2c_clkdiv[2]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \i2c_clkdiv[2]~5_combout\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \i2c_clkdiv[2]~DUPLICATE_q\);

-- Location: MLABCELL_X84_Y35_N18
\i2c_clkdiv[3]~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \i2c_clkdiv[3]~4_combout\ = ( i2c_clkdiv(3) & ( i2c_clkdiv(0) & ( (!\i2c_clkdiv[2]~DUPLICATE_q\) # (!i2c_clkdiv(1)) ) ) ) # ( !i2c_clkdiv(3) & ( i2c_clkdiv(0) & ( (\i2c_clkdiv[2]~DUPLICATE_q\ & i2c_clkdiv(1)) ) ) ) # ( i2c_clkdiv(3) & ( !i2c_clkdiv(0) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000001100111111111111001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_i2c_clkdiv[2]~DUPLICATE_q\,
	datad => ALT_INV_i2c_clkdiv(1),
	datae => ALT_INV_i2c_clkdiv(3),
	dataf => ALT_INV_i2c_clkdiv(0),
	combout => \i2c_clkdiv[3]~4_combout\);

-- Location: FF_X84_Y35_N20
\i2c_clkdiv[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \i2c_clkdiv[3]~4_combout\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => i2c_clkdiv(3));

-- Location: FF_X84_Y35_N26
\i2c_clkdiv[0]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \i2c_clkdiv~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \i2c_clkdiv[0]~DUPLICATE_q\);

-- Location: FF_X84_Y35_N44
\i2c_clkdiv[4]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \i2c_clkdiv~3_combout\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \i2c_clkdiv[4]~DUPLICATE_q\);

-- Location: FF_X84_Y35_N37
\i2c_clkdiv[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \i2c_clkdiv[5]~2_combout\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => i2c_clkdiv(5));

-- Location: FF_X84_Y35_N19
\i2c_clkdiv[3]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \i2c_clkdiv[3]~4_combout\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \i2c_clkdiv[3]~DUPLICATE_q\);

-- Location: MLABCELL_X84_Y35_N36
\i2c_clkdiv[5]~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \i2c_clkdiv[5]~2_combout\ = ( i2c_clkdiv(5) & ( \i2c_clkdiv[3]~DUPLICATE_q\ & ( (!\i2c_clkdiv[0]~DUPLICATE_q\) # ((!\i2c_clkdiv[4]~DUPLICATE_q\) # ((!i2c_clkdiv(2)) # (!i2c_clkdiv(1)))) ) ) ) # ( !i2c_clkdiv(5) & ( \i2c_clkdiv[3]~DUPLICATE_q\ & ( 
-- (\i2c_clkdiv[0]~DUPLICATE_q\ & (\i2c_clkdiv[4]~DUPLICATE_q\ & (i2c_clkdiv(2) & i2c_clkdiv(1)))) ) ) ) # ( i2c_clkdiv(5) & ( !\i2c_clkdiv[3]~DUPLICATE_q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000011111111111111110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_i2c_clkdiv[0]~DUPLICATE_q\,
	datab => \ALT_INV_i2c_clkdiv[4]~DUPLICATE_q\,
	datac => ALT_INV_i2c_clkdiv(2),
	datad => ALT_INV_i2c_clkdiv(1),
	datae => ALT_INV_i2c_clkdiv(5),
	dataf => \ALT_INV_i2c_clkdiv[3]~DUPLICATE_q\,
	combout => \i2c_clkdiv[5]~2_combout\);

-- Location: FF_X84_Y35_N38
\i2c_clkdiv[5]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \i2c_clkdiv[5]~2_combout\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \i2c_clkdiv[5]~DUPLICATE_q\);

-- Location: MLABCELL_X84_Y35_N42
\i2c_clkdiv~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \i2c_clkdiv~3_combout\ = ( i2c_clkdiv(4) & ( \i2c_clkdiv[3]~DUPLICATE_q\ & ( (!i2c_clkdiv(2)) # ((!i2c_clkdiv(1)) # (!i2c_clkdiv(0))) ) ) ) # ( !i2c_clkdiv(4) & ( \i2c_clkdiv[3]~DUPLICATE_q\ & ( (i2c_clkdiv(2) & (i2c_clkdiv(1) & i2c_clkdiv(0))) ) ) ) # ( 
-- i2c_clkdiv(4) & ( !\i2c_clkdiv[3]~DUPLICATE_q\ & ( ((!i2c_clkdiv(1)) # ((i2c_clkdiv(0)) # (\i2c_clkdiv[5]~DUPLICATE_q\))) # (i2c_clkdiv(2)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000110111111111111100000000000100011111111111101110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_i2c_clkdiv(2),
	datab => ALT_INV_i2c_clkdiv(1),
	datac => \ALT_INV_i2c_clkdiv[5]~DUPLICATE_q\,
	datad => ALT_INV_i2c_clkdiv(0),
	datae => ALT_INV_i2c_clkdiv(4),
	dataf => \ALT_INV_i2c_clkdiv[3]~DUPLICATE_q\,
	combout => \i2c_clkdiv~3_combout\);

-- Location: FF_X84_Y35_N43
\i2c_clkdiv[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \i2c_clkdiv~3_combout\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => i2c_clkdiv(4));

-- Location: MLABCELL_X84_Y35_N24
\i2c_clkdiv~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \i2c_clkdiv~1_combout\ = ( !i2c_clkdiv(0) & ( i2c_clkdiv(5) ) ) # ( !i2c_clkdiv(0) & ( !i2c_clkdiv(5) & ( ((!i2c_clkdiv(1)) # ((!i2c_clkdiv(4)) # (i2c_clkdiv(3)))) # (i2c_clkdiv(2)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111011111000000000000000011111111111111110000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_i2c_clkdiv(2),
	datab => ALT_INV_i2c_clkdiv(1),
	datac => ALT_INV_i2c_clkdiv(3),
	datad => ALT_INV_i2c_clkdiv(4),
	datae => ALT_INV_i2c_clkdiv(0),
	dataf => ALT_INV_i2c_clkdiv(5),
	combout => \i2c_clkdiv~1_combout\);

-- Location: FF_X84_Y35_N25
\i2c_clkdiv[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \i2c_clkdiv~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => i2c_clkdiv(0));

-- Location: MLABCELL_X84_Y35_N57
\i2c_clkdiv[2]~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \i2c_clkdiv[2]~5_combout\ = ( i2c_clkdiv(2) & ( i2c_clkdiv(0) & ( !i2c_clkdiv(1) ) ) ) # ( !i2c_clkdiv(2) & ( i2c_clkdiv(0) & ( i2c_clkdiv(1) ) ) ) # ( i2c_clkdiv(2) & ( !i2c_clkdiv(0) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100001111000011111111000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_i2c_clkdiv(1),
	datae => ALT_INV_i2c_clkdiv(2),
	dataf => ALT_INV_i2c_clkdiv(0),
	combout => \i2c_clkdiv[2]~5_combout\);

-- Location: FF_X84_Y35_N58
\i2c_clkdiv[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \i2c_clkdiv[2]~5_combout\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => i2c_clkdiv(2));

-- Location: MLABCELL_X84_Y35_N12
\i2c_clkdiv~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \i2c_clkdiv~0_combout\ = ( i2c_clkdiv(1) & ( i2c_clkdiv(5) & ( !i2c_clkdiv(0) ) ) ) # ( !i2c_clkdiv(1) & ( i2c_clkdiv(5) & ( i2c_clkdiv(0) ) ) ) # ( i2c_clkdiv(1) & ( !i2c_clkdiv(5) & ( (!i2c_clkdiv(0) & (((!i2c_clkdiv(4)) # (i2c_clkdiv(3))) # 
-- (i2c_clkdiv(2)))) ) ) ) # ( !i2c_clkdiv(1) & ( !i2c_clkdiv(5) & ( i2c_clkdiv(0) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011110011000100110000110011001100111100110011001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_i2c_clkdiv(2),
	datab => ALT_INV_i2c_clkdiv(0),
	datac => ALT_INV_i2c_clkdiv(3),
	datad => ALT_INV_i2c_clkdiv(4),
	datae => ALT_INV_i2c_clkdiv(1),
	dataf => ALT_INV_i2c_clkdiv(5),
	combout => \i2c_clkdiv~0_combout\);

-- Location: FF_X84_Y35_N14
\i2c_clkdiv[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \i2c_clkdiv~0_combout\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => i2c_clkdiv(1));

-- Location: MLABCELL_X84_Y35_N48
\Equal0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Equal0~0_combout\ = ( !\i2c_clkdiv[5]~DUPLICATE_q\ & ( \i2c_clkdiv[4]~DUPLICATE_q\ & ( (!i2c_clkdiv(3) & !\i2c_clkdiv[2]~DUPLICATE_q\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011110000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_i2c_clkdiv(3),
	datad => \ALT_INV_i2c_clkdiv[2]~DUPLICATE_q\,
	datae => \ALT_INV_i2c_clkdiv[5]~DUPLICATE_q\,
	dataf => \ALT_INV_i2c_clkdiv[4]~DUPLICATE_q\,
	combout => \Equal0~0_combout\);

-- Location: MLABCELL_X84_Y35_N3
\i2c_clk~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \i2c_clk~0_combout\ = ( \i2c_clk~q\ & ( \Equal0~0_combout\ & ( (!i2c_clkdiv(1)) # (\i2c_clkdiv[0]~DUPLICATE_q\) ) ) ) # ( !\i2c_clk~q\ & ( \Equal0~0_combout\ & ( (i2c_clkdiv(1) & !\i2c_clkdiv[0]~DUPLICATE_q\) ) ) ) # ( \i2c_clk~q\ & ( !\Equal0~0_combout\ 
-- ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100001111000000001111000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_i2c_clkdiv(1),
	datad => \ALT_INV_i2c_clkdiv[0]~DUPLICATE_q\,
	datae => \ALT_INV_i2c_clk~q\,
	dataf => \ALT_INV_Equal0~0_combout\,
	combout => \i2c_clk~0_combout\);

-- Location: MLABCELL_X84_Y35_N6
\i2c_clk~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \i2c_clk~feeder_combout\ = ( \i2c_clk~0_combout\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_i2c_clk~0_combout\,
	combout => \i2c_clk~feeder_combout\);

-- Location: FF_X84_Y35_N8
i2c_clk : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \i2c_clk~feeder_combout\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \i2c_clk~q\);

-- Location: IOIBUF_X89_Y35_N95
\i2c_sdat~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => i2c_sdat,
	o => \i2c_sdat~input_o\);

-- Location: FF_X88_Y35_N59
\i2c_bitcnt[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i2c_clk~q\,
	asdata => \next_bitcnt[1]~6_combout\,
	clrn => \ALT_INV_reset~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => i2c_bitcnt(1));

-- Location: LABCELL_X88_Y35_N42
\next_bitcnt[3]~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \next_bitcnt[3]~13_combout\ = ( i2c_bitcnt(3) & ( (\reset~input_o\) # (\next_bitcnt[3]~13_combout\) ) ) # ( !i2c_bitcnt(3) & ( (\next_bitcnt[3]~13_combout\ & !\reset~input_o\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100000000001100110000000000110011111111110011001111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_next_bitcnt[3]~13_combout\,
	datad => \ALT_INV_reset~input_o\,
	dataf => ALT_INV_i2c_bitcnt(3),
	combout => \next_bitcnt[3]~13_combout\);

-- Location: MLABCELL_X87_Y35_N36
\next_bitcnt[3]~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \next_bitcnt[3]~21_combout\ = ( \next_bitcnt[3]~16_combout\ & ( (!\Selector3~0_combout\ & !i2c_bitcnt(3)) ) ) # ( !\next_bitcnt[3]~16_combout\ & ( !\Selector3~0_combout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100110011001100110011001100110011000000110000001100000011000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_Selector3~0_combout\,
	datac => ALT_INV_i2c_bitcnt(3),
	dataf => \ALT_INV_next_bitcnt[3]~16_combout\,
	combout => \next_bitcnt[3]~21_combout\);

-- Location: MLABCELL_X87_Y35_N12
\Selector6~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector6~0_combout\ = ( \next_bitcnt[0]~10_combout\ & ( (\next_bitcnt[2]~2_combout\ & (!\next_bitcnt[3]~16_combout\ & \next_bitcnt[1]~6_combout\)) ) ) # ( !\next_bitcnt[0]~10_combout\ & ( (!\next_bitcnt[2]~2_combout\ & (\next_bitcnt[3]~16_combout\ & 
-- !\next_bitcnt[1]~6_combout\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000101000000000000010100000000000000000010100000000000001010000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_next_bitcnt[2]~2_combout\,
	datac => \ALT_INV_next_bitcnt[3]~16_combout\,
	datad => \ALT_INV_next_bitcnt[1]~6_combout\,
	dataf => \ALT_INV_next_bitcnt[0]~10_combout\,
	combout => \Selector6~0_combout\);

-- Location: MLABCELL_X87_Y35_N54
\next_bitcnt[3]~15\ : cyclonev_lcell_comb
-- Equation(s):
-- \next_bitcnt[3]~15_combout\ = ( \next_bitcnt[3]~21_combout\ & ( \Selector6~0_combout\ & ( !\next_bitcnt[3]~13_combout\ $ (\next_bitcnt[3]~14_combout\) ) ) ) # ( !\next_bitcnt[3]~21_combout\ & ( \Selector6~0_combout\ & ( \next_bitcnt[3]~13_combout\ ) ) ) # 
-- ( \next_bitcnt[3]~21_combout\ & ( !\Selector6~0_combout\ & ( !\next_bitcnt[3]~13_combout\ $ (!\next_bitcnt[3]~14_combout\) ) ) ) # ( !\next_bitcnt[3]~21_combout\ & ( !\Selector6~0_combout\ & ( \next_bitcnt[3]~13_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000011111111000000001111000011111111000000001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_next_bitcnt[3]~13_combout\,
	datad => \ALT_INV_next_bitcnt[3]~14_combout\,
	datae => \ALT_INV_next_bitcnt[3]~21_combout\,
	dataf => \ALT_INV_Selector6~0_combout\,
	combout => \next_bitcnt[3]~15_combout\);

-- Location: LABCELL_X85_Y35_N45
\Folgezustand~10\ : cyclonev_lcell_comb
-- Equation(s):
-- \Folgezustand~10_combout\ = (!\i2c_sdat~input_o\ & \Folgezustand.ACK~q\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011110000000000001111000000000000111100000000000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_i2c_sdat~input_o\,
	datad => \ALT_INV_Folgezustand.ACK~q\,
	combout => \Folgezustand~10_combout\);

-- Location: FF_X85_Y35_N47
\Folgezustand.WAIT_FOR_NEXT_STATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i2c_clk~q\,
	d => \Folgezustand~10_combout\,
	ena => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Folgezustand.WAIT_FOR_NEXT_STATE~q\);

-- Location: LABCELL_X85_Y35_N21
\next_wordcnt[2]~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \next_wordcnt[2]~5_combout\ = ( \reset~input_o\ & ( i2c_wordcnt(2) ) ) # ( !\reset~input_o\ & ( i2c_wordcnt(2) & ( \next_wordcnt[2]~5_combout\ ) ) ) # ( !\reset~input_o\ & ( !i2c_wordcnt(2) & ( \next_wordcnt[2]~5_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000000000000000000001111000011111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_next_wordcnt[2]~5_combout\,
	datae => \ALT_INV_reset~input_o\,
	dataf => ALT_INV_i2c_wordcnt(2),
	combout => \next_wordcnt[2]~5_combout\);

-- Location: FF_X85_Y35_N17
\i2c_wordcnt[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i2c_clk~q\,
	asdata => \next_wordcnt[1]~10_combout\,
	clrn => \ALT_INV_reset~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => i2c_wordcnt(1));

-- Location: LABCELL_X85_Y35_N33
\next_wordcnt[1]~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \next_wordcnt[1]~9_combout\ = ( i2c_wordcnt(1) & ( (\reset~input_o\) # (\next_wordcnt[1]~9_combout\) ) ) # ( !i2c_wordcnt(1) & ( (\next_wordcnt[1]~9_combout\ & !\reset~input_o\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010100000000010101010000000001010101111111110101010111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_next_wordcnt[1]~9_combout\,
	datad => \ALT_INV_reset~input_o\,
	dataf => ALT_INV_i2c_wordcnt(1),
	combout => \next_wordcnt[1]~9_combout\);

-- Location: FF_X85_Y35_N23
\i2c_wordcnt[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i2c_clk~q\,
	asdata => \next_wordcnt[0]~14_combout\,
	clrn => \ALT_INV_reset~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => i2c_wordcnt(0));

-- Location: LABCELL_X85_Y35_N51
\next_wordcnt[0]~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \next_wordcnt[0]~13_combout\ = ( i2c_wordcnt(0) & ( (\reset~input_o\) # (\next_wordcnt[0]~13_combout\) ) ) # ( !i2c_wordcnt(0) & ( (\next_wordcnt[0]~13_combout\ & !\reset~input_o\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010100000000010101010000000001010101111111110101010111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_next_wordcnt[0]~13_combout\,
	datad => \ALT_INV_reset~input_o\,
	dataf => ALT_INV_i2c_wordcnt(0),
	combout => \next_wordcnt[0]~13_combout\);

-- Location: LABCELL_X85_Y35_N15
\Selector13~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector13~0_combout\ = ( !\next_wordcnt[0]~14_combout\ & ( !\Folgezustand.WAIT_FOR_NEXT_STATE~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010101010101010101010101010101000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Folgezustand.WAIT_FOR_NEXT_STATE~q\,
	dataf => \ALT_INV_next_wordcnt[0]~14_combout\,
	combout => \Selector13~0_combout\);

-- Location: LABCELL_X85_Y35_N48
\next_wordcnt[0]~15\ : cyclonev_lcell_comb
-- Equation(s):
-- \next_wordcnt[0]~15_combout\ = ( \Selector13~0_combout\ & ( !\next_wordcnt[0]~13_combout\ ) ) # ( !\Selector13~0_combout\ & ( \next_wordcnt[0]~13_combout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101010101010101010110101010101010101010101010101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_next_wordcnt[0]~13_combout\,
	dataf => \ALT_INV_Selector13~0_combout\,
	combout => \next_wordcnt[0]~15_combout\);

-- Location: LABCELL_X85_Y35_N6
\next_wordcnt[3]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \next_wordcnt[3]~1_combout\ = ( i2c_wordcnt(3) & ( (\reset~input_o\) # (\next_wordcnt[3]~1_combout\) ) ) # ( !i2c_wordcnt(3) & ( (\next_wordcnt[3]~1_combout\ & !\reset~input_o\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100000000000011110000000000001111111111110000111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_next_wordcnt[3]~1_combout\,
	datad => \ALT_INV_reset~input_o\,
	dataf => ALT_INV_i2c_wordcnt(3),
	combout => \next_wordcnt[3]~1_combout\);

-- Location: LABCELL_X85_Y35_N12
\Add3~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add3~0_combout\ = ( \next_wordcnt[1]~10_combout\ & ( (\next_wordcnt[2]~6_combout\ & \next_wordcnt[0]~14_combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000011110000000000001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_next_wordcnt[2]~6_combout\,
	datad => \ALT_INV_next_wordcnt[0]~14_combout\,
	dataf => \ALT_INV_next_wordcnt[1]~10_combout\,
	combout => \Add3~0_combout\);

-- Location: LABCELL_X85_Y35_N54
\next_wordcnt[3]~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \next_wordcnt[3]~3_combout\ = ( \Add3~0_combout\ & ( !\next_wordcnt[3]~1_combout\ $ (((\next_wordcnt[3]~2_combout\) # (\Folgezustand.WAIT_FOR_NEXT_STATE~q\))) ) ) # ( !\Add3~0_combout\ & ( !\next_wordcnt[3]~1_combout\ $ (((!\next_wordcnt[3]~2_combout\) # 
-- (\Folgezustand.WAIT_FOR_NEXT_STATE~q\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001111000011001100111100001111000011001100111100001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_next_wordcnt[3]~1_combout\,
	datac => \ALT_INV_Folgezustand.WAIT_FOR_NEXT_STATE~q\,
	datad => \ALT_INV_next_wordcnt[3]~2_combout\,
	dataf => \ALT_INV_Add3~0_combout\,
	combout => \next_wordcnt[3]~3_combout\);

-- Location: FF_X85_Y35_N55
\next_wordcnt[3]~_emulated\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i2c_clk~q\,
	d => \next_wordcnt[3]~3_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \next_wordcnt[3]~20_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \next_wordcnt[3]~_emulated_q\);

-- Location: LABCELL_X85_Y35_N9
\next_wordcnt[3]~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \next_wordcnt[3]~2_combout\ = ( \next_wordcnt[3]~1_combout\ & ( (!\reset~input_o\ & ((!\next_wordcnt[3]~_emulated_q\))) # (\reset~input_o\ & (i2c_wordcnt(3))) ) ) # ( !\next_wordcnt[3]~1_combout\ & ( (!\reset~input_o\ & ((\next_wordcnt[3]~_emulated_q\))) 
-- # (\reset~input_o\ & (i2c_wordcnt(3))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011010100110101001101010011010111000101110001011100010111000101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_i2c_wordcnt(3),
	datab => \ALT_INV_next_wordcnt[3]~_emulated_q\,
	datac => \ALT_INV_reset~input_o\,
	dataf => \ALT_INV_next_wordcnt[3]~1_combout\,
	combout => \next_wordcnt[3]~2_combout\);

-- Location: FF_X85_Y35_N20
\i2c_wordcnt[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i2c_clk~q\,
	asdata => \next_wordcnt[3]~2_combout\,
	clrn => \ALT_INV_reset~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => i2c_wordcnt(3));

-- Location: LABCELL_X85_Y35_N42
\Folgezustand~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \Folgezustand~9_combout\ = ( i2c_wordcnt(1) & ( (i2c_wordcnt(0) & (i2c_wordcnt(2) & (!i2c_wordcnt(3) & \Folgezustand.WAIT_FOR_NEXT_STATE~q\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000100000000000000010000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_i2c_wordcnt(0),
	datab => ALT_INV_i2c_wordcnt(2),
	datac => ALT_INV_i2c_wordcnt(3),
	datad => \ALT_INV_Folgezustand.WAIT_FOR_NEXT_STATE~q\,
	dataf => ALT_INV_i2c_wordcnt(1),
	combout => \Folgezustand~9_combout\);

-- Location: LABCELL_X85_Y35_N3
\next_wordcnt[3]~20\ : cyclonev_lcell_comb
-- Equation(s):
-- \next_wordcnt[3]~20_combout\ = ( \next_bitcnt[3]~16_combout\ ) # ( !\next_bitcnt[3]~16_combout\ & ( \Folgezustand~9_combout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000011110000111111111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_Folgezustand~9_combout\,
	dataf => \ALT_INV_next_bitcnt[3]~16_combout\,
	combout => \next_wordcnt[3]~20_combout\);

-- Location: FF_X85_Y35_N50
\next_wordcnt[0]~_emulated\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i2c_clk~q\,
	d => \next_wordcnt[0]~15_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \next_wordcnt[3]~20_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \next_wordcnt[0]~_emulated_q\);

-- Location: LABCELL_X85_Y35_N57
\next_wordcnt[0]~14\ : cyclonev_lcell_comb
-- Equation(s):
-- \next_wordcnt[0]~14_combout\ = ( \next_wordcnt[0]~13_combout\ & ( (!\reset~input_o\ & ((!\next_wordcnt[0]~_emulated_q\))) # (\reset~input_o\ & (i2c_wordcnt(0))) ) ) # ( !\next_wordcnt[0]~13_combout\ & ( (!\reset~input_o\ & 
-- ((\next_wordcnt[0]~_emulated_q\))) # (\reset~input_o\ & (i2c_wordcnt(0))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111101010101000011110101010111110000010101011111000001010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_i2c_wordcnt(0),
	datac => \ALT_INV_next_wordcnt[0]~_emulated_q\,
	datad => \ALT_INV_reset~input_o\,
	dataf => \ALT_INV_next_wordcnt[0]~13_combout\,
	combout => \next_wordcnt[0]~14_combout\);

-- Location: LABCELL_X85_Y35_N39
\next_wordcnt[1]~11\ : cyclonev_lcell_comb
-- Equation(s):
-- \next_wordcnt[1]~11_combout\ = ( \next_wordcnt[0]~14_combout\ & ( !\next_wordcnt[1]~9_combout\ $ (((\next_wordcnt[1]~10_combout\) # (\Folgezustand.WAIT_FOR_NEXT_STATE~q\))) ) ) # ( !\next_wordcnt[0]~14_combout\ & ( !\next_wordcnt[1]~9_combout\ $ 
-- (((!\next_wordcnt[1]~10_combout\) # (\Folgezustand.WAIT_FOR_NEXT_STATE~q\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111111000011000011111100001111000011000011111100001100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_Folgezustand.WAIT_FOR_NEXT_STATE~q\,
	datac => \ALT_INV_next_wordcnt[1]~9_combout\,
	datad => \ALT_INV_next_wordcnt[1]~10_combout\,
	dataf => \ALT_INV_next_wordcnt[0]~14_combout\,
	combout => \next_wordcnt[1]~11_combout\);

-- Location: FF_X85_Y35_N40
\next_wordcnt[1]~_emulated\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i2c_clk~q\,
	d => \next_wordcnt[1]~11_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \next_wordcnt[3]~20_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \next_wordcnt[1]~_emulated_q\);

-- Location: LABCELL_X85_Y35_N36
\next_wordcnt[1]~10\ : cyclonev_lcell_comb
-- Equation(s):
-- \next_wordcnt[1]~10_combout\ = ( \next_wordcnt[1]~9_combout\ & ( (!\reset~input_o\ & (!\next_wordcnt[1]~_emulated_q\)) # (\reset~input_o\ & ((i2c_wordcnt(1)))) ) ) # ( !\next_wordcnt[1]~9_combout\ & ( (!\reset~input_o\ & (\next_wordcnt[1]~_emulated_q\)) # 
-- (\reset~input_o\ & ((i2c_wordcnt(1)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010100001111010101010000111110101010000011111010101000001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_next_wordcnt[1]~_emulated_q\,
	datac => ALT_INV_i2c_wordcnt(1),
	datad => \ALT_INV_reset~input_o\,
	dataf => \ALT_INV_next_wordcnt[1]~9_combout\,
	combout => \next_wordcnt[1]~10_combout\);

-- Location: LABCELL_X85_Y35_N24
\Add3~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add3~1_combout\ = ( \next_wordcnt[0]~14_combout\ & ( \next_wordcnt[1]~10_combout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ALT_INV_next_wordcnt[1]~10_combout\,
	dataf => \ALT_INV_next_wordcnt[0]~14_combout\,
	combout => \Add3~1_combout\);

-- Location: LABCELL_X85_Y35_N27
\next_wordcnt[2]~7\ : cyclonev_lcell_comb
-- Equation(s):
-- \next_wordcnt[2]~7_combout\ = ( \Add3~1_combout\ & ( !\next_wordcnt[2]~5_combout\ $ (((\next_wordcnt[2]~6_combout\) # (\Folgezustand.WAIT_FOR_NEXT_STATE~q\))) ) ) # ( !\Add3~1_combout\ & ( !\next_wordcnt[2]~5_combout\ $ (((!\next_wordcnt[2]~6_combout\) # 
-- (\Folgezustand.WAIT_FOR_NEXT_STATE~q\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111111000011000011111100001111000011000011111100001100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_Folgezustand.WAIT_FOR_NEXT_STATE~q\,
	datac => \ALT_INV_next_wordcnt[2]~5_combout\,
	datad => \ALT_INV_next_wordcnt[2]~6_combout\,
	dataf => \ALT_INV_Add3~1_combout\,
	combout => \next_wordcnt[2]~7_combout\);

-- Location: FF_X85_Y35_N29
\next_wordcnt[2]~_emulated\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i2c_clk~q\,
	d => \next_wordcnt[2]~7_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \next_wordcnt[3]~20_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \next_wordcnt[2]~_emulated_q\);

-- Location: LABCELL_X85_Y35_N0
\next_wordcnt[2]~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \next_wordcnt[2]~6_combout\ = ( \next_wordcnt[2]~5_combout\ & ( (!\reset~input_o\ & ((!\next_wordcnt[2]~_emulated_q\))) # (\reset~input_o\ & (i2c_wordcnt(2))) ) ) # ( !\next_wordcnt[2]~5_combout\ & ( (!\reset~input_o\ & ((\next_wordcnt[2]~_emulated_q\))) 
-- # (\reset~input_o\ & (i2c_wordcnt(2))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011010100110101001101010011010111000101110001011100010111000101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_i2c_wordcnt(2),
	datab => \ALT_INV_next_wordcnt[2]~_emulated_q\,
	datac => \ALT_INV_reset~input_o\,
	dataf => \ALT_INV_next_wordcnt[2]~5_combout\,
	combout => \next_wordcnt[2]~6_combout\);

-- Location: FF_X85_Y35_N11
\i2c_wordcnt[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i2c_clk~q\,
	asdata => \next_wordcnt[2]~6_combout\,
	clrn => \ALT_INV_reset~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => i2c_wordcnt(2));

-- Location: MLABCELL_X87_Y35_N15
\Selector4~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector4~0_combout\ = ( i2c_bitcnt(2) & ( (\Folgezustand.SENDDATA~q\ & ((!i2c_bitcnt(1)) # (!i2c_bitcnt(0)))) ) ) # ( !i2c_bitcnt(2) & ( \Folgezustand.SENDDATA~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011001100110011001100110011001100000011001100110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_Folgezustand.SENDDATA~q\,
	datac => ALT_INV_i2c_bitcnt(1),
	datad => ALT_INV_i2c_bitcnt(0),
	dataf => ALT_INV_i2c_bitcnt(2),
	combout => \Selector4~0_combout\);

-- Location: MLABCELL_X87_Y35_N6
\Selector4~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector4~1_combout\ = ( i2c_wordcnt(0) & ( \Folgezustand.WAIT_FOR_NEXT_STATE~q\ & ( (!i2c_wordcnt(2)) # ((!i2c_wordcnt(1)) # ((\Selector4~0_combout\) # (i2c_wordcnt(3)))) ) ) ) # ( !i2c_wordcnt(0) & ( \Folgezustand.WAIT_FOR_NEXT_STATE~q\ ) ) # ( 
-- i2c_wordcnt(0) & ( !\Folgezustand.WAIT_FOR_NEXT_STATE~q\ & ( \Selector4~0_combout\ ) ) ) # ( !i2c_wordcnt(0) & ( !\Folgezustand.WAIT_FOR_NEXT_STATE~q\ & ( \Selector4~0_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111111111111111111111110111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_i2c_wordcnt(2),
	datab => ALT_INV_i2c_wordcnt(1),
	datac => ALT_INV_i2c_wordcnt(3),
	datad => \ALT_INV_Selector4~0_combout\,
	datae => ALT_INV_i2c_wordcnt(0),
	dataf => \ALT_INV_Folgezustand.WAIT_FOR_NEXT_STATE~q\,
	combout => \Selector4~1_combout\);

-- Location: FF_X87_Y35_N8
\Folgezustand.SENDDATA\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i2c_clk~q\,
	d => \Selector4~1_combout\,
	ena => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Folgezustand.SENDDATA~q\);

-- Location: MLABCELL_X87_Y35_N24
\Folgezustand.START~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Folgezustand.START~1_combout\ = !\Folgezustand.IDLE~q\

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100110011001100110011001100110011001100110011001100110011001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_Folgezustand.IDLE~q\,
	combout => \Folgezustand.START~1_combout\);

-- Location: FF_X87_Y35_N26
\Folgezustand.START\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i2c_clk~q\,
	d => \Folgezustand.START~1_combout\,
	ena => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Folgezustand.START~q\);

-- Location: MLABCELL_X87_Y35_N30
\Selector2~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector2~0_combout\ = ( i2c_bitcnt(3) & ( i2c_bitcnt(2) & ( (\Folgezustand.SEND_ADDRESS~q\) # (\Folgezustand.START~q\) ) ) ) # ( !i2c_bitcnt(3) & ( i2c_bitcnt(2) & ( (\Folgezustand.SEND_ADDRESS~q\) # (\Folgezustand.START~q\) ) ) ) # ( i2c_bitcnt(3) & ( 
-- !i2c_bitcnt(2) & ( ((\Folgezustand.SEND_ADDRESS~q\ & ((i2c_bitcnt(1)) # (i2c_bitcnt(0))))) # (\Folgezustand.START~q\) ) ) ) # ( !i2c_bitcnt(3) & ( !i2c_bitcnt(2) & ( (\Folgezustand.SEND_ADDRESS~q\) # (\Folgezustand.START~q\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111111111111000011110111111100001111111111110000111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_i2c_bitcnt(0),
	datab => ALT_INV_i2c_bitcnt(1),
	datac => \ALT_INV_Folgezustand.START~q\,
	datad => \ALT_INV_Folgezustand.SEND_ADDRESS~q\,
	datae => ALT_INV_i2c_bitcnt(3),
	dataf => ALT_INV_i2c_bitcnt(2),
	combout => \Selector2~0_combout\);

-- Location: FF_X87_Y35_N29
\Folgezustand.SEND_ADDRESS\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i2c_clk~q\,
	asdata => \Selector2~0_combout\,
	sload => VCC,
	ena => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Folgezustand.SEND_ADDRESS~q\);

-- Location: MLABCELL_X87_Y35_N45
\WideOr3~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \WideOr3~0_combout\ = (\Folgezustand.SEND_ADDRESS~q\) # (\Folgezustand.SENDDATA~q\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111111111111000011111111111100001111111111110000111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_Folgezustand.SENDDATA~q\,
	datad => \ALT_INV_Folgezustand.SEND_ADDRESS~q\,
	combout => \WideOr3~0_combout\);

-- Location: FF_X87_Y35_N56
\next_bitcnt[3]~_emulated\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i2c_clk~q\,
	d => \next_bitcnt[3]~15_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \WideOr3~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \next_bitcnt[3]~_emulated_q\);

-- Location: LABCELL_X88_Y35_N18
\next_bitcnt[3]~14\ : cyclonev_lcell_comb
-- Equation(s):
-- \next_bitcnt[3]~14_combout\ = ( \next_bitcnt[3]~13_combout\ & ( (!\reset~input_o\ & ((!\next_bitcnt[3]~_emulated_q\))) # (\reset~input_o\ & (i2c_bitcnt(3))) ) ) # ( !\next_bitcnt[3]~13_combout\ & ( (!\reset~input_o\ & ((\next_bitcnt[3]~_emulated_q\))) # 
-- (\reset~input_o\ & (i2c_bitcnt(3))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111101010101000011110101010111110000010101011111000001010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_i2c_bitcnt(3),
	datac => \ALT_INV_next_bitcnt[3]~_emulated_q\,
	datad => \ALT_INV_reset~input_o\,
	dataf => \ALT_INV_next_bitcnt[3]~13_combout\,
	combout => \next_bitcnt[3]~14_combout\);

-- Location: FF_X88_Y35_N29
\i2c_bitcnt[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i2c_clk~q\,
	asdata => \next_bitcnt[3]~14_combout\,
	clrn => \ALT_INV_reset~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => i2c_bitcnt(3));

-- Location: LABCELL_X88_Y35_N57
\next_bitcnt[3]~22\ : cyclonev_lcell_comb
-- Equation(s):
-- \next_bitcnt[3]~22_combout\ = ( \next_bitcnt[3]~16_combout\ & ( i2c_bitcnt(3) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000001111000011110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_i2c_bitcnt(3),
	dataf => \ALT_INV_next_bitcnt[3]~16_combout\,
	combout => \next_bitcnt[3]~22_combout\);

-- Location: LABCELL_X88_Y35_N30
\next_bitcnt[1]~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \next_bitcnt[1]~5_combout\ = ( i2c_bitcnt(1) & ( (\reset~input_o\) # (\next_bitcnt[1]~5_combout\) ) ) # ( !i2c_bitcnt(1) & ( (\next_bitcnt[1]~5_combout\ & !\reset~input_o\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100000000000011110000000000001111111111110000111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_next_bitcnt[1]~5_combout\,
	datad => \ALT_INV_reset~input_o\,
	dataf => ALT_INV_i2c_bitcnt(1),
	combout => \next_bitcnt[1]~5_combout\);

-- Location: LABCELL_X88_Y35_N9
\Selector8~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector8~0_combout\ = ( \next_bitcnt[0]~10_combout\ & ( !\next_bitcnt[1]~6_combout\ $ (\next_bitcnt[3]~16_combout\) ) ) # ( !\next_bitcnt[0]~10_combout\ & ( !\next_bitcnt[1]~6_combout\ $ (!\next_bitcnt[3]~16_combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101101001011010010110100101101010100101101001011010010110100101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_next_bitcnt[1]~6_combout\,
	datac => \ALT_INV_next_bitcnt[3]~16_combout\,
	dataf => \ALT_INV_next_bitcnt[0]~10_combout\,
	combout => \Selector8~0_combout\);

-- Location: LABCELL_X88_Y35_N45
\next_bitcnt[1]~7\ : cyclonev_lcell_comb
-- Equation(s):
-- \next_bitcnt[1]~7_combout\ = ( \Selector8~0_combout\ & ( !\next_bitcnt[1]~5_combout\ $ (((\Selector3~0_combout\) # (\next_bitcnt[3]~22_combout\))) ) ) # ( !\Selector8~0_combout\ & ( \next_bitcnt[1]~5_combout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111110100000010111111010000001011111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_next_bitcnt[3]~22_combout\,
	datac => \ALT_INV_Selector3~0_combout\,
	datad => \ALT_INV_next_bitcnt[1]~5_combout\,
	dataf => \ALT_INV_Selector8~0_combout\,
	combout => \next_bitcnt[1]~7_combout\);

-- Location: FF_X88_Y35_N46
\next_bitcnt[1]~_emulated\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i2c_clk~q\,
	d => \next_bitcnt[1]~7_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \WideOr3~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \next_bitcnt[1]~_emulated_q\);

-- Location: LABCELL_X88_Y35_N54
\next_bitcnt[1]~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \next_bitcnt[1]~6_combout\ = ( \next_bitcnt[1]~5_combout\ & ( (!\reset~input_o\ & ((!\next_bitcnt[1]~_emulated_q\))) # (\reset~input_o\ & (i2c_bitcnt(1))) ) ) # ( !\next_bitcnt[1]~5_combout\ & ( (!\reset~input_o\ & ((\next_bitcnt[1]~_emulated_q\))) # 
-- (\reset~input_o\ & (i2c_bitcnt(1))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100110011000011110011001111110000001100111111000000110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => ALT_INV_i2c_bitcnt(1),
	datac => \ALT_INV_next_bitcnt[1]~_emulated_q\,
	datad => \ALT_INV_reset~input_o\,
	dataf => \ALT_INV_next_bitcnt[1]~5_combout\,
	combout => \next_bitcnt[1]~6_combout\);

-- Location: MLABCELL_X87_Y35_N21
\Selector7~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector7~0_combout\ = ( \next_bitcnt[1]~6_combout\ & ( \next_bitcnt[0]~10_combout\ & ( !\next_bitcnt[3]~16_combout\ ) ) ) # ( !\next_bitcnt[1]~6_combout\ & ( !\next_bitcnt[0]~10_combout\ & ( \next_bitcnt[3]~16_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000000000000000000000000000000001111000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_next_bitcnt[3]~16_combout\,
	datae => \ALT_INV_next_bitcnt[1]~6_combout\,
	dataf => \ALT_INV_next_bitcnt[0]~10_combout\,
	combout => \Selector7~0_combout\);

-- Location: LABCELL_X88_Y35_N15
\next_bitcnt[2]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \next_bitcnt[2]~1_combout\ = ( i2c_bitcnt(2) & ( (\reset~input_o\) # (\next_bitcnt[2]~1_combout\) ) ) # ( !i2c_bitcnt(2) & ( (\next_bitcnt[2]~1_combout\ & !\reset~input_o\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100000000000011110000000000001111111111110000111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_next_bitcnt[2]~1_combout\,
	datad => \ALT_INV_reset~input_o\,
	dataf => ALT_INV_i2c_bitcnt(2),
	combout => \next_bitcnt[2]~1_combout\);

-- Location: MLABCELL_X87_Y35_N39
\next_bitcnt[2]~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \next_bitcnt[2]~3_combout\ = ( \next_bitcnt[2]~2_combout\ & ( !\next_bitcnt[2]~1_combout\ $ (((!\next_bitcnt[3]~21_combout\) # (\Selector7~0_combout\))) ) ) # ( !\next_bitcnt[2]~2_combout\ & ( !\next_bitcnt[2]~1_combout\ $ (((!\Selector7~0_combout\) # 
-- (!\next_bitcnt[3]~21_combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111101011010000011110101101000001111101001010000111110100101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Selector7~0_combout\,
	datac => \ALT_INV_next_bitcnt[2]~1_combout\,
	datad => \ALT_INV_next_bitcnt[3]~21_combout\,
	dataf => \ALT_INV_next_bitcnt[2]~2_combout\,
	combout => \next_bitcnt[2]~3_combout\);

-- Location: FF_X87_Y35_N41
\next_bitcnt[2]~_emulated\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i2c_clk~q\,
	d => \next_bitcnt[2]~3_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \WideOr3~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \next_bitcnt[2]~_emulated_q\);

-- Location: LABCELL_X88_Y35_N6
\next_bitcnt[2]~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \next_bitcnt[2]~2_combout\ = ( \next_bitcnt[2]~1_combout\ & ( (!\reset~input_o\ & ((!\next_bitcnt[2]~_emulated_q\))) # (\reset~input_o\ & (i2c_bitcnt(2))) ) ) # ( !\next_bitcnt[2]~1_combout\ & ( (!\reset~input_o\ & ((\next_bitcnt[2]~_emulated_q\))) # 
-- (\reset~input_o\ & (i2c_bitcnt(2))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100110011000011110011001111110000001100111111000000110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => ALT_INV_i2c_bitcnt(2),
	datac => \ALT_INV_next_bitcnt[2]~_emulated_q\,
	datad => \ALT_INV_reset~input_o\,
	dataf => \ALT_INV_next_bitcnt[2]~1_combout\,
	combout => \next_bitcnt[2]~2_combout\);

-- Location: FF_X88_Y35_N53
\i2c_bitcnt[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i2c_clk~q\,
	asdata => \next_bitcnt[2]~2_combout\,
	clrn => \ALT_INV_reset~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => i2c_bitcnt(2));

-- Location: MLABCELL_X87_Y35_N42
\Selector3~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector3~0_combout\ = ( i2c_bitcnt(3) & ( (!i2c_bitcnt(2) & (!i2c_bitcnt(1) & (\Folgezustand.SEND_ADDRESS~q\ & !i2c_bitcnt(0)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000001000000000000000100000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_i2c_bitcnt(2),
	datab => ALT_INV_i2c_bitcnt(1),
	datac => \ALT_INV_Folgezustand.SEND_ADDRESS~q\,
	datad => ALT_INV_i2c_bitcnt(0),
	dataf => ALT_INV_i2c_bitcnt(3),
	combout => \Selector3~0_combout\);

-- Location: LABCELL_X88_Y35_N39
\next_bitcnt[0]~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \next_bitcnt[0]~9_combout\ = ( i2c_bitcnt(0) & ( (\next_bitcnt[0]~9_combout\) # (\reset~input_o\) ) ) # ( !i2c_bitcnt(0) & ( (!\reset~input_o\ & \next_bitcnt[0]~9_combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000101000001010000010100000101001011111010111110101111101011111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_reset~input_o\,
	datac => \ALT_INV_next_bitcnt[0]~9_combout\,
	dataf => ALT_INV_i2c_bitcnt(0),
	combout => \next_bitcnt[0]~9_combout\);

-- Location: LABCELL_X88_Y35_N21
\next_bitcnt[0]~11\ : cyclonev_lcell_comb
-- Equation(s):
-- \next_bitcnt[0]~11_combout\ = ( \next_bitcnt[0]~10_combout\ & ( \next_bitcnt[0]~9_combout\ ) ) # ( !\next_bitcnt[0]~10_combout\ & ( !\next_bitcnt[0]~9_combout\ $ (((\next_bitcnt[3]~22_combout\) # (\Selector3~0_combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100001100001111110000110000111100001111000011110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_Selector3~0_combout\,
	datac => \ALT_INV_next_bitcnt[0]~9_combout\,
	datad => \ALT_INV_next_bitcnt[3]~22_combout\,
	dataf => \ALT_INV_next_bitcnt[0]~10_combout\,
	combout => \next_bitcnt[0]~11_combout\);

-- Location: FF_X88_Y35_N22
\next_bitcnt[0]~_emulated\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i2c_clk~q\,
	d => \next_bitcnt[0]~11_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \WideOr3~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \next_bitcnt[0]~_emulated_q\);

-- Location: LABCELL_X88_Y35_N33
\next_bitcnt[0]~10\ : cyclonev_lcell_comb
-- Equation(s):
-- \next_bitcnt[0]~10_combout\ = ( \next_bitcnt[0]~9_combout\ & ( (!\reset~input_o\ & ((!\next_bitcnt[0]~_emulated_q\))) # (\reset~input_o\ & (i2c_bitcnt(0))) ) ) # ( !\next_bitcnt[0]~9_combout\ & ( (!\reset~input_o\ & ((\next_bitcnt[0]~_emulated_q\))) # 
-- (\reset~input_o\ & (i2c_bitcnt(0))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100110011000011110011001111110000001100111111000000110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => ALT_INV_i2c_bitcnt(0),
	datac => \ALT_INV_next_bitcnt[0]~_emulated_q\,
	datad => \ALT_INV_reset~input_o\,
	dataf => \ALT_INV_next_bitcnt[0]~9_combout\,
	combout => \next_bitcnt[0]~10_combout\);

-- Location: FF_X88_Y35_N11
\i2c_bitcnt[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i2c_clk~q\,
	asdata => \next_bitcnt[0]~10_combout\,
	clrn => \ALT_INV_reset~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => i2c_bitcnt(0));

-- Location: LABCELL_X88_Y35_N36
\next_bitcnt[3]~16\ : cyclonev_lcell_comb
-- Equation(s):
-- \next_bitcnt[3]~16_combout\ = ( \Folgezustand.SENDDATA~q\ & ( (i2c_bitcnt(0) & (i2c_bitcnt(2) & i2c_bitcnt(1))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000110000000000000011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => ALT_INV_i2c_bitcnt(0),
	datac => ALT_INV_i2c_bitcnt(2),
	datad => ALT_INV_i2c_bitcnt(1),
	dataf => \ALT_INV_Folgezustand.SENDDATA~q\,
	combout => \next_bitcnt[3]~16_combout\);

-- Location: MLABCELL_X87_Y35_N48
\Selector3~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector3~1_combout\ = ( \Selector3~0_combout\ ) # ( !\Selector3~0_combout\ & ( \next_bitcnt[3]~16_combout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011001100110011001111111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_next_bitcnt[3]~16_combout\,
	dataf => \ALT_INV_Selector3~0_combout\,
	combout => \Selector3~1_combout\);

-- Location: FF_X87_Y35_N50
\Folgezustand.ACK\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i2c_clk~q\,
	d => \Selector3~1_combout\,
	ena => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Folgezustand.ACK~q\);

-- Location: FF_X85_Y35_N2
\Folgezustand.STOP\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i2c_clk~q\,
	asdata => \Folgezustand~9_combout\,
	sload => VCC,
	ena => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Folgezustand.STOP~q\);

-- Location: LABCELL_X85_Y35_N30
\Selector1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector1~0_combout\ = ( !\Folgezustand.STOP~q\ & ( (!\i2c_sdat~input_o\) # (!\Folgezustand.ACK~q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111110011111100111111001111110000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_i2c_sdat~input_o\,
	datac => \ALT_INV_Folgezustand.ACK~q\,
	dataf => \ALT_INV_Folgezustand.STOP~q\,
	combout => \Selector1~0_combout\);

-- Location: FF_X85_Y35_N32
\Folgezustand.IDLE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i2c_clk~q\,
	d => \Selector1~0_combout\,
	ena => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Folgezustand.IDLE~q\);

-- Location: MLABCELL_X87_Y35_N51
\Selector15~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector15~1_combout\ = ( i2c_bitcnt(2) & ( (i2c_bitcnt(0) & !i2c_bitcnt(1)) ) ) # ( !i2c_bitcnt(2) & ( i2c_bitcnt(1) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111101010101000000000101010100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_i2c_bitcnt(0),
	datad => ALT_INV_i2c_bitcnt(1),
	dataf => ALT_INV_i2c_bitcnt(2),
	combout => \Selector15~1_combout\);

-- Location: LABCELL_X88_Y35_N48
\Mux17~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux17~1_combout\ = ( \next_bitcnt[1]~6_combout\ & ( \next_bitcnt[0]~10_combout\ & ( (!\next_bitcnt[3]~14_combout\ & (!\next_bitcnt[2]~2_combout\ & ((i2c_wordcnt(0)) # (i2c_wordcnt(1))))) # (\next_bitcnt[3]~14_combout\ & (\next_bitcnt[2]~2_combout\ & 
-- (!i2c_wordcnt(1) $ (i2c_wordcnt(0))))) ) ) ) # ( !\next_bitcnt[1]~6_combout\ & ( \next_bitcnt[0]~10_combout\ & ( (!i2c_wordcnt(1) & (!i2c_wordcnt(0) & (!\next_bitcnt[3]~14_combout\ & \next_bitcnt[2]~2_combout\))) ) ) ) # ( \next_bitcnt[1]~6_combout\ & ( 
-- !\next_bitcnt[0]~10_combout\ & ( (\next_bitcnt[2]~2_combout\ & ((!i2c_wordcnt(1) & ((!i2c_wordcnt(0)) # (\next_bitcnt[3]~14_combout\))) # (i2c_wordcnt(1) & ((!\next_bitcnt[3]~14_combout\))))) ) ) ) # ( !\next_bitcnt[1]~6_combout\ & ( 
-- !\next_bitcnt[0]~10_combout\ & ( (!i2c_wordcnt(1) & (!i2c_wordcnt(0) & (!\next_bitcnt[3]~14_combout\ & \next_bitcnt[2]~2_combout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000010000000000000001101101000000000100000000111000000001001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_i2c_wordcnt(1),
	datab => ALT_INV_i2c_wordcnt(0),
	datac => \ALT_INV_next_bitcnt[3]~14_combout\,
	datad => \ALT_INV_next_bitcnt[2]~2_combout\,
	datae => \ALT_INV_next_bitcnt[1]~6_combout\,
	dataf => \ALT_INV_next_bitcnt[0]~10_combout\,
	combout => \Mux17~1_combout\);

-- Location: LABCELL_X88_Y35_N24
\Mux17~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux17~0_combout\ = ( \next_bitcnt[1]~6_combout\ & ( \next_bitcnt[3]~14_combout\ & ( (i2c_wordcnt(0) & (!i2c_wordcnt(1) $ (((!\next_bitcnt[0]~10_combout\) # (\next_bitcnt[2]~2_combout\))))) ) ) ) # ( !\next_bitcnt[1]~6_combout\ & ( 
-- \next_bitcnt[3]~14_combout\ & ( (i2c_wordcnt(1) & (i2c_wordcnt(0) & \next_bitcnt[0]~10_combout\)) ) ) ) # ( \next_bitcnt[1]~6_combout\ & ( !\next_bitcnt[3]~14_combout\ & ( (!i2c_wordcnt(0) & ((!\next_bitcnt[0]~10_combout\ & ((\next_bitcnt[2]~2_combout\))) 
-- # (\next_bitcnt[0]~10_combout\ & (!i2c_wordcnt(1) & !\next_bitcnt[2]~2_combout\)))) ) ) ) # ( !\next_bitcnt[1]~6_combout\ & ( !\next_bitcnt[3]~14_combout\ & ( (\next_bitcnt[2]~2_combout\ & ((!\next_bitcnt[0]~10_combout\) # (!i2c_wordcnt(1) $ 
-- (i2c_wordcnt(0))))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111001000010001100000000000001000000010001001000010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_i2c_wordcnt(1),
	datab => ALT_INV_i2c_wordcnt(0),
	datac => \ALT_INV_next_bitcnt[0]~10_combout\,
	datad => \ALT_INV_next_bitcnt[2]~2_combout\,
	datae => \ALT_INV_next_bitcnt[1]~6_combout\,
	dataf => \ALT_INV_next_bitcnt[3]~14_combout\,
	combout => \Mux17~0_combout\);

-- Location: LABCELL_X88_Y35_N12
\Mux17~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux17~2_combout\ = ( \Mux17~0_combout\ & ( (!i2c_wordcnt(2)) # (\Mux17~1_combout\) ) ) # ( !\Mux17~0_combout\ & ( (i2c_wordcnt(2) & \Mux17~1_combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010100000101000001010000010110101111101011111010111110101111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_i2c_wordcnt(2),
	datac => \ALT_INV_Mux17~1_combout\,
	dataf => \ALT_INV_Mux17~0_combout\,
	combout => \Mux17~2_combout\);

-- Location: LABCELL_X88_Y35_N0
\Selector15~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector15~0_combout\ = ( \Selector4~0_combout\ & ( \Mux17~2_combout\ ) ) # ( !\Selector4~0_combout\ & ( \Mux17~2_combout\ & ( (!\Folgezustand.IDLE~q\) # (((\Selector15~1_combout\ & \Folgezustand.SEND_ADDRESS~q\)) # (\Folgezustand.STOP~q\)) ) ) ) # ( 
-- \Selector4~0_combout\ & ( !\Mux17~2_combout\ & ( (!\Folgezustand.IDLE~q\) # (((\Selector15~1_combout\ & \Folgezustand.SEND_ADDRESS~q\)) # (\Folgezustand.STOP~q\)) ) ) ) # ( !\Selector4~0_combout\ & ( !\Mux17~2_combout\ & ( (!\Folgezustand.IDLE~q\) # 
-- (((\Selector15~1_combout\ & \Folgezustand.SEND_ADDRESS~q\)) # (\Folgezustand.STOP~q\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010101111111111101010111111111110101011111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Folgezustand.IDLE~q\,
	datab => \ALT_INV_Selector15~1_combout\,
	datac => \ALT_INV_Folgezustand.SEND_ADDRESS~q\,
	datad => \ALT_INV_Folgezustand.STOP~q\,
	datae => \ALT_INV_Selector4~0_combout\,
	dataf => \ALT_INV_Mux17~2_combout\,
	combout => \Selector15~0_combout\);

-- Location: FF_X88_Y35_N1
\i2c_sdat~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i2c_clk~q\,
	d => \Selector15~0_combout\,
	ena => \ALT_INV_Folgezustand.ACK~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \i2c_sdat~reg0_q\);

-- Location: MLABCELL_X87_Y35_N27
\i2c_sdat~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \i2c_sdat~2_combout\ = ( !\Folgezustand.WAIT_FOR_NEXT_STATE~q\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_Folgezustand.WAIT_FOR_NEXT_STATE~q\,
	combout => \i2c_sdat~2_combout\);

-- Location: FF_X88_Y35_N41
\i2c_sdat~en\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i2c_clk~q\,
	asdata => \i2c_sdat~2_combout\,
	clrn => \ALT_INV_reset~input_o\,
	sload => VCC,
	ena => \ALT_INV_Folgezustand.ACK~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \i2c_sdat~en_q\);

-- Location: MLABCELL_X87_Y35_N3
\Selector0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector0~0_combout\ = ( \Folgezustand.STOP~q\ & ( \Folgezustand.START~q\ ) ) # ( !\Folgezustand.STOP~q\ & ( \Folgezustand.START~q\ ) ) # ( \Folgezustand.STOP~q\ & ( !\Folgezustand.START~q\ ) ) # ( !\Folgezustand.STOP~q\ & ( !\Folgezustand.START~q\ & ( 
-- (!\Folgezustand.IDLE~q\) # ((\i2c_sclk~reg0_q\ & ((\Folgezustand.ACK~q\) # (\Folgezustand.SENDDATA~q\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100110111011101111111111111111111111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_i2c_sclk~reg0_q\,
	datab => \ALT_INV_Folgezustand.IDLE~q\,
	datac => \ALT_INV_Folgezustand.SENDDATA~q\,
	datad => \ALT_INV_Folgezustand.ACK~q\,
	datae => \ALT_INV_Folgezustand.STOP~q\,
	dataf => \ALT_INV_Folgezustand.START~q\,
	combout => \Selector0~0_combout\);

-- Location: FF_X88_Y35_N14
\i2c_sclk~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i2c_clk~q\,
	asdata => \Selector0~0_combout\,
	clrn => \ALT_INV_reset~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \i2c_sclk~reg0_q\);

-- Location: LABCELL_X42_Y9_N0
\~QUARTUS_CREATED_GND~I\ : cyclonev_lcell_comb
-- Equation(s):

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
;
END structure;


