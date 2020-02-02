----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:16:54 05/15/2018 
-- Design Name: 
-- Module Name:    fsm_mux_add_sub - Structural 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity fsm_mux_add_sub is
    Port ( ADDS : in  STD_LOGIC;
			  CLK : in STD_LOGIC;
           SUBS : in  STD_LOGIC;
           USUBS : in  STD_LOGIC;
           SWAPS : in  STD_LOGIC;
			  MODE0 : IN STD_LOGIC;
			  TOS : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
           PUSHS : in  STD_LOGIC;
			  SELECT0 : IN STD_LOGIC;
			  SELECT1 : IN STD_LOGIC;
           ASSWO : out  STD_LOGIC;
			  COUT : out STD_LOGIC;
           USUBO : out  STD_LOGIC;
           SWO : out  STD_LOGIC;
           OUTPUTS : out  STD_LOGIC_VECTOR(7 DOWNTO 0);
           DECOUTS : out  STD_LOGIC);
end fsm_mux_add_sub;

architecture Structural of fsm_mux_add_sub is

COMPONENT lab_5_fsm is
Port ( ADDSGN : in  STD_LOGIC;
			  MODE0 : IN STD_LOGIC;
           SUBSGN : in  STD_LOGIC;
           USUBSGN : in  STD_LOGIC;
           SWAPSGN : in  STD_LOGIC;
			  PUSHSGN : IN STD_LOGIC;
           ASSW : out  STD_LOGIC;
			  SW : out  STD_LOGIC;
           SELECT2 : out  STD_LOGIC;
           SELECT3 : out  STD_LOGIC;
           SELECT4 : out  STD_LOGIC;
           ADD_SUB : out  STD_LOGIC;
           USUB : out  STD_LOGIC;
           CLK : in  STD_LOGIC);
END COMPONENT;

COMPONENT mux_2_1 is
 Port ( SEL : in  STD_LOGIC;
           A : in  STD_LOGIC_VECTOR(7 DOWNTO 0);
           B : in  STD_LOGIC_VECTOR(7 DOWNTO 0);
           F : out  STD_LOGIC_VECTOR(7 DOWNTO 0));
END COMPONENT;

COMPONENT xor_gate is
Port ( A : in  STD_LOGIC_VECTOR (7 downto 0);
           B : in  STD_LOGIC;
           OUTS : out  STD_LOGIC_VECTOR (7 downto 0));
END COMPONENT;

COMPONENT register_tos is
Port ( INPUT : in  STD_LOGIC_VECTOR (7 downto 0);
           OUTPUT : out  STD_LOGIC_VECTOR (7 downto 0);
           CLK : in  STD_LOGIC);
END COMPONENT;

COMPONENT add_sub is
Port ( CIN : in  STD_LOGIC;
           R1 : in  STD_LOGIC_VECTOR (7 downto 0);
           R2 : in  STD_LOGIC_VECTOR (7 downto 0);
           COUT : out  STD_LOGIC;
           RESULT : out  STD_LOGIC_VECTOR (7 downto 0));
END COMPONENT;

COMPONENT aovf is
Port ( MSB : in  STD_LOGIC;
           MSSB : in  STD_LOGIC;
           OUTDEC : out  STD_LOGIC);
END COMPONENT;

SIGNAL SELECT2,SELECT3,SELECT4,ADD_SUBS : STD_LOGIC;
SIGNAL R1OUT,R2OUT,R1MUX,R2MUX,R1IN,ADD_SUB_R2_IN,MUX3MUX4,ADDERRES : STD_LOGIC_VECTOR(7 DOWNTO 0);

begin

fsm:		lab_5_fsm
			port map(ADDSGN => ADDS,
						  MODE0 => MODE0,
						  SUBSGN => SUBS,
						  USUBSGN => USUBS,
						  SWAPSGN => SWAPS,
						  PUSHSGN => PUSHS,
						  ASSW => ASSWO,
						  SW => SWO,
						  SELECT2 => SELECT2,
						  SELECT3 => SELECT3,
						  SELECT4 => SELECT4,
						  ADD_SUB => ADD_SUBS,
						  USUB => USUBO,
						  CLK => CLK);
						  
mux0:		mux_2_1
			port map(SEL => SELECT0,
						A => R1OUT,
						B => TOS,
						F => R1MUX);
						
mux1:		mux_2_1
			port map(SEL => SELECT1,
						A => R2OUT,
						B => TOS,
						F => R2MUX);
						
mux2:		mux_2_1
			port map(SEL => SELECT2,
						A => "00000000",
						B => R1MUX,
						F => R1IN);
						
mux3:		mux_2_1
			port map(SEL => SELECT3,
						A => R1OUT,
						B => R2OUT,
						F => MUX3MUX4);

mux4:		mux_2_1						
			port map(SEL => SELECT4,
						A => MUX3MUX4,
						B => ADDERRES,
						F => OUTPUTS);
						
reg1:		register_tos
			port map(INPUT => R1IN,
						OUTPUT => R1OUT,
						CLK => CLK);
						
reg2:		register_tos
			port map(INPUT => R2MUX,
						OUTPUT => R2OUT,
						CLK => CLK);
						
xor1:		xor_gate
			port map(A => R2OUT,
						B => ADD_SUBS,
						OUTS => ADD_SUB_R2_IN);
						
adder:	add_sub
			port map(CIN => '0',
						R1 => R1OUT,
						R2 => ADD_SUB_R2_IN,
						COUT => COUT,
						RESULT => ADDERRES);
						
						
ovf:		aovf
			port map(MSB => ADDERRES(7),
						MSSB => ADDERRES(6),
						OUTDEC => DECOUTS);

end Structural;

