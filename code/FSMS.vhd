----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:56:02 04/23/2018 
-- Design Name: 
-- Module Name:    FSMS - Behavioral 
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

entity FSMS is
    Port ( BTN0 : in  STD_LOGIC;
           BTN1 : in  STD_LOGIC;
           BTN2 : in  STD_LOGIC;
			  BTN3 : in  STD_LOGIC;
           NUMBERS : in  STD_LOGIC_VECTOR (7 downto 0);
           CLK : in  STD_LOGIC;
           LED : out  STD_LOGIC_VECTOR (7 downto 0);
           AN0 : out  STD_LOGIC;
           AN1 : out  STD_LOGIC;
           AN2 : out  STD_LOGIC;
           AN3 : out  STD_LOGIC;
			  COUT : out STD_LOGIC;
           MUXOUT : out  STD_LOGIC_VECTOR (7 downto 0));
end FSMS;

architecture Behavioral of FSMS is

COMPONENT FSM_top is
	Port (  CLK : in STD_LOGIC;
			  BUTTON0 : in  STD_LOGIC;
           BUTTON1 : in  STD_LOGIC;
           BUTTON3 : in  STD_LOGIC;
			  ADDS : in STD_LOGIC;
			  SUBS : in  STD_LOGIC;
           USUBS : in  STD_LOGIC;
           SWAPS : in  STD_LOGIC;
			  MODE0 : IN STD_LOGIC;
           INPUTSMEM : in  STD_LOGIC_VECTOR (7 downto 0);
			  SSD_OUTPUT: out STD_LOGIC_VECTOR(3 DOWNTO 0);
			  DECOUTS : out STD_LOGIC;
			  COUT : out STD_LOGIC;
           OUTPUTSMEM : out  STD_LOGIC_VECTOR (7 downto 0));
END COMPONENT;

COMPONENT ssd_top is
   Port	( CLK : in  STD_LOGIC;
			  MODE : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
           ADD : in  STD_LOGIC;
           SUB : in  STD_LOGIC;
           USUB : in  STD_LOGIC;
           SWAP : in  STD_LOGIC;
			  OVF : in STD_LOGIC;
           TOSINPUTS : in  STD_LOGIC_VECTOR(3 DOWNTO 0);
           MUXOUT : out  STD_LOGIC_VECTOR (7 downto 0);
           SEG0 : out  STD_LOGIC;
           SEG1 : out  STD_LOGIC;
           SEG2 : out  STD_LOGIC;
           SEG3 : out  STD_LOGIC);
END COMPONENT;

COMPONENT mode_FSM is
	Port (  CLK : in STD_LOGIC;
			  BTN0 : in  STD_LOGIC;
           BTN1 : in  STD_LOGIC;
           BTN2 : in  STD_LOGIC;
           BTN3 : in  STD_LOGIC;
           PUSHTOS : out  STD_LOGIC;
			  MODE0S : out STD_LOGIC;
           POPTOS : out  STD_LOGIC;
           RESETST : out  STD_LOGIC;
           MODEDEC : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
           ADDSGN : out  STD_LOGIC;
           SUBSGN : out  STD_LOGIC;
           USUBSGN : out  STD_LOGIC;
           SWAPSGN : out  STD_LOGIC);
END COMPONENT;

SIGNAL TOS	:	STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL ADDSGNL,SUBSGNL,USUBSGNL,SWAPSGNL : STD_LOGIC;
SIGNAL PUSH,POP,RESET,MODEC,DEC : STD_LOGIC;
SIGNAL MODESGNL : STD_LOGIC_VECTOR(1 DOWNTO 0);

begin

fsm:		FSM_top
			port map(CLK => CLK,
						BUTTON0 => PUSH,
						BUTTON1 => POP,
						BUTTON3 => RESET,
						ADDS => ADDSGNL,
					   SUBS => SUBSGNL,
					   USUBS => USUBSGNL,
					   SWAPS => SWAPSGNL,
					   MODE0 => MODEC,
						INPUTSMEM => NUMBERS,
						SSD_OUTPUT => TOS,
						DECOUTS => DEC,
						COUT => COUT,
						OUTPUTSMEM => LED);
						
ssd:		ssd_top
			port map(CLK => CLK,
						MODE => MODESGNL,
						ADD => ADDSGNL,
						SUB => SUBSGNL,
						USUB => USUBSGNL,
						SWAP => SWAPSGNL,
						OVF => DEC,
						TOSINPUTS => TOS,
						MUXOUT => MUXOUT,
						SEG0 => AN0,
						SEG1 => AN1,
						SEG2 => AN2,
						SEG3 => AN3);
						
mode:		mode_FSM
			port map(CLK => CLK,
						BTN0 => BTN0,
						BTN1 => BTN1,
						BTN2 => BTN2,
						BTN3 => BTN3,
						PUSHTOS => PUSH,
						MODE0S => MODEC,
						POPTOS => POP,
						RESETST => RESET,
						MODEDEC => MODESGNL,
						ADDSGN => ADDSGNL,
						SUBSGN => SUBSGNL,
						USUBSGN => USUBSGNL,
						SWAPSGN => SWAPSGNL);

end Behavioral;

