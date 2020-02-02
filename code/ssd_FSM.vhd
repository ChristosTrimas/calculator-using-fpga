----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:38:50 04/22/2018 
-- Design Name: 
-- Module Name:    ssd_FSM - Behavioral 
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

entity ssd_FSM is
    Port ( clk : in  STD_LOGIC;
           compoC : in  STD_LOGIC;
			  SEL : out  STD_LOGIC_VECTOR (1 downto 0);
			  seg0 : out STD_LOGIC;
			  seg1 : out STD_LOGIC;
			  seg2 : out STD_LOGIC;
			  seg3 : out STD_LOGIC;
			  load : out  STD_LOGIC);
end ssd_FSM;

architecture Behavioral of ssd_FSM is
TYPE STATE is (CALM,AN0,AN1pre,AN1,AN2pre,AN2,AN3pre,AN3);
SIGNAL CURRENTS,NEXTS : STATE;
begin

fsm_comb:
PROCESS(CURRENTS,compoC)
BEGIN 
CASE CURRENTS IS

	WHEN CALM =>	seg0 <= '1';
						seg1 <= '1';
						seg2 <= '1';
						seg3 <= '1';
						load <= '1';
						SEL <= "00";
						NEXTS <= AN0;
					
	WHEN AN0 =>		load <= '0';
						SEL <= "00";
						seg0 <= '0';
						seg1 <= '1';
						seg2 <= '1';
						seg3 <= '1';
						IF compoC = '1' THEN NEXTS <= AN1pre;
						ELSE NEXTS <= AN0;
						END IF;
						
	WHEN AN1pre => load <='1';
						SEL <= "01";
						seg0 <= '1';
						seg1 <= '1';
						seg2 <= '1';
						seg3 <= '1';
						NEXTS <= AN1;
					
	WHEN AN1 =>		load <= '0';
						SEL <= "01";
						seg0 <= '1';
						seg1 <= '0';
						seg2 <= '1';
						seg3 <= '1';
						IF compoC = '1' THEN NEXTS <= AN2pre;
						ELSE NEXTS <= AN1;
						END IF;
						
	WHEN AN2pre => load <='1';
						SEL <= "10";
						seg0 <= '1';
						seg1 <= '1';
						seg2 <= '1';
						seg3 <= '1';
						NEXTS <= AN2;
					
	WHEN AN2 =>		SEL <= "10";
						load <= '0';
						seg0 <= '1';
						seg1 <= '1';
						seg2 <= '0';
						seg3 <= '1';
						IF compoC = '1' THEN NEXTS <= AN3pre;
						ELSE NEXTS <= AN2;
						END IF;
	
	WHEN AN3pre => load <='1';
						SEL <= "11";
						seg0 <= '1';
						seg1 <= '1';
						seg2 <= '1';
						seg3 <= '1';
						NEXTS <= AN3;
						
	WHEN AN3 =>		SEL <= "11";
						load <= '0';
						seg0 <= '1';
						seg1 <= '1';
						seg2 <= '1';
						seg3 <= '0';
						IF compoC = '1' THEN NEXTS <= CALM;
						ELSE NEXTS <= AN3;
						END IF;
						
	WHEN OTHERS => SEL <= "00";
						seg0 <= '1';
						seg1 <= '1';
						seg2 <= '1';
						seg3 <= '1';
						NEXTS <= CALM;

END CASE;
END PROCESS fsm_comb;

fsm_synch:
PROCESS(CLK)
BEGIN

IF(rising_edge(CLK) AND CLK = '1') THEN CURRENTS <= NEXTS;
ELSE CURRENTS <= CURRENTS;
END IF;

END PROCESS fsm_synch; 


end Behavioral;

