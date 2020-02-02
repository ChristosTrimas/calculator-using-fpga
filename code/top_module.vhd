----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:16:27 04/23/2018 
-- Design Name: 
-- Module Name:    top_module - Structural 
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

entity top_module is
    Port ( PUSH : in  STD_LOGIC;
           POP : in  STD_LOGIC;
			  MODE : IN STD_LOGIC;
           RESET : in  STD_LOGIC;
           CLOCK : in  STD_LOGIC;
           NUM_In : in  STD_LOGIC_VECTOR (7 downto 0);
           LED : out  STD_LOGIC_VECTOR (7 downto 0);
           SSD_En : out  STD_LOGIC_VECTOR (3 downto 0);
			  COUT : out STD_LOGIC;
           SEG_OUT : out  STD_LOGIC_VECTOR (7 downto 0));
end top_module;

architecture Structural of top_module is

COMPONENT FSMS is
	Port	( BTN0 : in  STD_LOGIC;
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
END COMPONENT;

COMPONENT singlepulsegen is
	Port	(clk 		: in std_logic;		-- connect it to the Clock of the board
           rst 		: in std_logic;		-- connect it to the Reset Button of the board			
           input 	: in std_logic;		-- connect it to the Push Button of the board
           output 	: out std_logic		-- connect it to the input of your circuit
          );
END COMPONENT;

SIGNAL BTN0,BTN1,BTN2,BTN3 : STD_LOGIC;

begin

pushPulse:		singlepulsegen
			port map(clk => CLOCK,
						rst => '0',
						input => PUSH,
						output => BTN0);
						
popPulse:		singlepulsegen
		 port map(clk => CLOCK,
					 rst => '0',
					 input => POP,
					 output => BTN1);
					 
modePulse:		singlepulsegen
		port map(clk => CLOCK,
					rst => '0',
					input => MODE,
					output => BTN2);
					 
resetPulse:		singlepulsegen
			port map(clk => CLOCK,
						rst => '0',
						input => RESET,
						output => BTN3);
						
fsm:			FSMS
			port map(BTN0 => BTN0,
						BTN1 => BTN1,
						BTN2 => BTN2,
						BTN3 => BTN3,
					   NUMBERS => NUM_In,
					   CLK => CLOCK,
					   LED => LED,
					   AN0 => SSD_En(0),
					   AN1 => SSD_En(1),
					   AN2 => SSD_En(2),
					   AN3 => SSD_En(3),
						COUT => COUT,
					   MUXOUT =>  SEG_OUT);
						

end Structural;

