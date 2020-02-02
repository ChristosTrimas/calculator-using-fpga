----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:02:31 05/05/2018 
-- Design Name: 
-- Module Name:    mode_FSM - Behavioral 
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

entity mode_FSM is
    Port ( CLK : in STD_LOGIC;
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
end mode_FSM;

architecture Behavioral of mode_FSM is
TYPE STATE IS (MODE0,PUSH,POP,RESET,MODE1,ADD,SUB,MODE2,USUB,SWAP);
SIGNAL CURRENTS,NEXTS : STATE;
begin

fsm_comb:

PROCESS(CURRENTS,BTN0,BTN1,BTN2,BTN3)

BEGIN

CASE CURRENTS IS
		WHEN MODE0 =>		PUSHTOS <= '0';
								POPTOS <= '0';
								RESETST <= '0';
								MODEDEC <= "00";
								ADDSGN <= '0';
								SUBSGN <= '0';
								USUBSGN <= '0';
								SWAPSGN <= '0';
								MODE0S <= '1';
								IF BTN0 = '1' THEN NEXTS <= PUSH;
								ELSIF BTN1 = '1' THEN NEXTS <= POP;
								ELSIF BTN2 = '1' THEN NEXTS <= MODE1;
								ELSIF BTN3 = '1' THEN NEXTS <= RESET;
								
								ELSE NEXTS <= MODE0;
								END IF;
								
		WHEN PUSH =>		PUSHTOS <= '1';
								POPTOS <= '0';
								RESETST <= '0';
								MODEDEC <= "00";
								ADDSGN <= '0';
								SUBSGN <= '0';
								USUBSGN <= '0';
								SWAPSGN <= '0';
								MODE0S <= '1';
								NEXTS <= MODE0;
								
		WHEN POP	=>			PUSHTOS <= '0';
								POPTOS <= '1';
								RESETST <= '0';
								MODEDEC <= "00";
								ADDSGN <= '0';
								SUBSGN <= '0';
								USUBSGN <= '0';
								SWAPSGN <= '0';
								MODE0S <= '1';
								NEXTS <= MODE0;
								
		WHEN RESET => 		PUSHTOS <= '0';
								POPTOS <= '0';
								RESETST <= '1';
								MODEDEC <= "00";
								ADDSGN <= '0';
								SUBSGN <= '0';
								USUBSGN <= '0';
								SWAPSGN <= '0';
								MODE0S <= '1';
								NEXTS <= MODE0;
								
		WHEN MODE1 =>		PUSHTOS <= '0';
								POPTOS <= '0';
								RESETST <= '0';
								MODEDEC <= "01";
								ADDSGN <= '0';
								SUBSGN <= '0';
								USUBSGN <= '0';
								SWAPSGN <= '0';
								MODE0S <= '0';
								IF BTN0 = '1' THEN NEXTS <= ADD;
								ELSIF BTN1 = '1' THEN NEXTS <= SUB;
								ELSIF BTN2 = '1' THEN NEXTS <= MODE2;
								ELSE NEXTS <= MODE1;
								END IF;
								
		WHEN ADD =>			
								PUSHTOS <= '0';
								POPTOS <= '0';
								RESETST <= '0';
								MODEDEC <= "01";
								ADDSGN <= '1';
								SUBSGN <= '0';
								USUBSGN <= '0';
								SWAPSGN <= '0';
								MODE0S <= '0';
								IF BTN0 = '1' THEN NEXTS <= MODE1;
--								ELSIF BTN1 = '1' THEN NEXTS <= SUB;
--								ELSIF BTN2 = '1' THEN NEXTS <= MODE2;
								ELSE NEXTS <= ADD;
								END IF;
								
		WHEN SUB =>			PUSHTOS <= '0';
								POPTOS <= '0';
								RESETST <= '0';
								MODEDEC <= "01";
								ADDSGN <= '0';
								SUBSGN <= '1';
								USUBSGN <= '0';
								SWAPSGN <= '0';
								MODE0S <= '0';
--								IF BTN0 = '1' THEN NEXTS <= ADD;
								IF BTN1 = '1' THEN NEXTS <= MODE1;
--								ELSIF BTN2 = '1' THEN NEXTS <= MODE2;
								ELSE NEXTS <= SUB;
								END IF;
								
		WHEN MODE2 =>		PUSHTOS <= '0';
								POPTOS <= '0';
								RESETST <= '0';
								MODEDEC <= "10";
								ADDSGN <= '0';
								SUBSGN <= '0';
								USUBSGN <= '0';
								SWAPSGN <= '0';
								MODE0S <= '0';
								IF BTN0 = '1' THEN NEXTS <= USUB;
								ELSIF BTN1 = '1' THEN NEXTS <= SWAP;
								ELSIF BTN2 = '1' THEN NEXTS <= MODE0;
								ELSE NEXTS <= MODE2;
								END IF;
								
		WHEN USUB =>		PUSHTOS <= '0';
								POPTOS <= '0';
								RESETST <= '0';
								MODEDEC <= "10";
								ADDSGN <= '0';
								SUBSGN <= '0';
								USUBSGN <= '1';
								SWAPSGN <= '0';
								MODE0S <= '0';							
								IF BTN0 = '1' THEN NEXTS <= MODE2;
--								ELSIF BTN1 = '1' THEN NEXTS <= SWAP;
--								ELSIF BTN2 = '1' THEN NEXTS <= MODE0;
								ELSE NEXTS <= USUB;
								END IF;
								
		WHEN SWAP =>		PUSHTOS <= '0';
								POPTOS <= '0';
								RESETST <= '0';
								MODEDEC <= "10";
								ADDSGN <= '0';
								SUBSGN <= '0';
								USUBSGN <= '0';
								SWAPSGN <= '1';
								MODE0S <= '0';
--								IF BTN0 = '1' THEN NEXTS <= USUB;
								IF BTN1 = '1' THEN NEXTS <= MODE2;
--								ELSIF BTN2 = '1' THEN NEXTS <= MODE0;
								ELSE NEXTS <= SWAP;
								END IF;
								
		WHEN OTHERS =>		PUSHTOS <= '0';
								POPTOS <= '0';
								RESETST <= '0';
								MODEDEC <= "00";
								ADDSGN <= '0';
								SUBSGN <= '0';
								USUBSGN <= '0';
								SWAPSGN <= '0';
								MODE0S <= '0';
								NEXTS <= MODE0;
		
END CASE;
END PROCESS;

fsm_synch:
PROCESS(CLK,BTN3)
BEGIN 

IF(BTN3 = '1')	THEN 	CURRENTS <= RESET;
						  
ELSIF(rising_edge(CLK) AND CLK = '1') THEN CURRENTS <= NEXTS;

END IF;

END PROCESS fsm_synch; 		

end Behavioral;

