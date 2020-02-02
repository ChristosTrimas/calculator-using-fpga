----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    03:03:01 04/23/2018 
-- Design Name: 
-- Module Name:    ssd_top - Behavioral 
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

entity ssd_top is
    Port ( CLK : in  STD_LOGIC;
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
end ssd_top;

architecture Behavioral of ssd_top is

COMPONENT ssd_FSM_count_decoder is
	Port	( clk : in  STD_LOGIC;
			  MODE : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
           ADD : in  STD_LOGIC;
           SUB : in  STD_LOGIC;
           USUB : in  STD_LOGIC;
           SWAP : in  STD_LOGIC;
			  OVF : in STD_LOGIC;
           SPIN : in  STD_LOGIC_VECTOR (3 downto 0);
           decout0 : out  STD_LOGIC_VECTOR (7 downto 0);
           decout1 : out  STD_LOGIC_VECTOR (7 downto 0);
           decout2 : out  STD_LOGIC_VECTOR (7 downto 0);
           decout3 : out  STD_LOGIC_VECTOR (7 downto 0);
           sel : out  STD_LOGIC_VECTOR (1 downto 0);
           seg0 : out  STD_LOGIC;
           seg1 : out  STD_LOGIC;
           seg2 : out  STD_LOGIC;
           seg3 : out  STD_LOGIC);
END COMPONENT;

COMPONENT ssd_mux_4x2 is
	Port	( decIn0 : in  STD_LOGIC_VECTOR (7 downto 0);
           decIn1 : in  STD_LOGIC_VECTOR (7 downto 0);
           decIn2 : in  STD_LOGIC_VECTOR (7 downto 0);
           decIn3 : in  STD_LOGIC_VECTOR (7 downto 0);
           SEL : in  STD_LOGIC_VECTOR (1 downto 0);
           segOut : out  STD_LOGIC_VECTOR (7 downto 0));
END COMPONENT;

SIGNAL dec0,dec1,dec2,dec3 : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL selects : STD_LOGIC_VECTOR(1 DOWNTO 0);

begin

fsm:		ssd_FSM_count_decoder
			port map(clk => CLK,
						MODE => MODE,
						ADD => ADD,
						SUB => SUB,
						USUB => USUB,
						SWAP => SWAP,
						OVF => OVF,
						SPIN => TOSINPUTS,
						decout0 => dec0,
						decout1 => dec1,
						decout2 => dec2,
						decout3 => dec3,
						sel => selects,
						seg0 => SEG0,
						seg1 => SEG1,
						seg2 => SEG2,
						seg3 => SEG3);
						
mux:		ssd_mux_4x2
			port map(decIn0 => dec0,
						decIn1 => dec1,
						decIn2 => dec2,
						decIn3 => dec3,
						SEL => selects,
						segOut => MUXOUT);

end Behavioral;

