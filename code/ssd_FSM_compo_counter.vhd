----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:39:25 04/22/2018 
-- Design Name: 
-- Module Name:    ssd_FSM_compo_counter - Behavioral 
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
use ieee.std_logic_unsigned.all; 

entity ssd_FSM_compo_counter is
    Port ( CLK : in  STD_LOGIC;
           SEL : out  STD_LOGIC_VECTOR (1 downto 0);
           SEG0 : out  STD_LOGIC;
           SEG1 : out  STD_LOGIC;
           SEG2 : out  STD_LOGIC;
           SEG3 : out  STD_LOGIC);
end ssd_FSM_compo_counter;

architecture Structural of ssd_FSM_compo_counter is
COMPONENT ssd_FSM is
Port	(	  clk : in  STD_LOGIC;
           compoC : in  STD_LOGIC;
			  SEL : out  STD_LOGIC_VECTOR (1 downto 0);
			  seg0 : out STD_LOGIC;
			  seg1 : out STD_LOGIC;
			  seg2 : out STD_LOGIC;
			  seg3 : out STD_LOGIC;
			  load : out  STD_LOGIC);
END COMPONENT;

COMPONENT ssd_count_comp is
Port	(	  LOAD : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           COMPOUT : out  STD_LOGIC);
END COMPONENT;

SIGNAL LOADCNT,COMPCOUNT : STD_LOGIC;

begin

ssd_finitesm:	ssd_FSM
					port map(clk => CLK,
								compoC => COMPCOUNT,
								SEL => SEL,
								seg0 => SEG0,
								seg1 => SEG1,
								seg2 => SEG2,
								seg3 => SEG3,
								load => LOADCNT);
								
ssd_counter:	ssd_count_comp
					port map(LOAD => LOADCNT,
								CLK => CLK,
								COMPOUT => COMPCOUNT);

end Structural;

