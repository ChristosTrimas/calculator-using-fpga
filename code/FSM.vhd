----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:21:14 04/20/2018 
-- Design Name: 
-- Module Name:    FSM - Behavioral 
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity FSM is
    Port ( CLK : in STD_LOGIC;
			  BTN1 : in  STD_LOGIC;
           BTN0 : in  STD_LOGIC;
           BTN3 : in  STD_LOGIC;
			  AS : in STD_LOGIC;--
			  SW : IN STD_LOGIC;--
			  USUB : in STD_LOGIC;--
           compo : in  STD_LOGIC_VECTOR(1 DOWNTO 0);
           enable : out  STD_LOGIC;
			  SELECT0MUX : out STD_LOGIC;--
			  SELECT1MUX : out STD_LOGIC;--
			  we : out STD_LOGIC_VECTOR(0 DOWNTO 0);
           ud : out  STD_LOGIC;
			  PUSHSIGNAL : out STD_LOGIC;--
           load : out  STD_LOGIC);
end FSM;

architecture Behavioral of FSM is
TYPE ST is(NOTHING,PUSH1,PUSH2,POP1,POP2,POP3,POP4,POP5,POP6,POP7,POP8,PUSH3,PUSH4,PUSH5,PUSH6,PUSH7,OVF,RESET);
SIGNAL CURRENTS : ST;
SIGNAL NEXTS : ST;
begin

fsm_comb:
process(CURRENTS,BTN0,AS,SW,USUB,BTN1,BTN3,compo)

begin

CASE CURRENTS is 
	  WHEN NOTHING =>	ud <= '0';
							load <= '0';
							enable <= '0';
							we <= "0";
							SELECT0MUX <= '0';
							SELECT1MUX <= '0';
							PUSHSIGNAL <= '0';
							IF BTN0 = '1' THEN NEXTS <= PUSH1; 
							ELSIF AS = '1' THEN NEXTS <= POP3;
							ELSIF SW = '1' THEN NEXTS <= POP3;
							ELSIF USUB = '1' THEN NEXTS <= POP7;
							ELSIF BTN1 = '1' THEN NEXTS <= POP1;
							ELSIF BTN3 = '1' THEN NEXTS <= RESET;
							ELSE NEXTS <= NOTHING;
							END IF;
							
	 WHEN PUSH1 =>	   enable <= '1';
							load <= '0';
							ud <= '1';
							we <= "0"; 
							SELECT0MUX <= '0';
							SELECT1MUX <= '0';
							PUSHSIGNAL <= '0';
							IF compo(1) = '0' THEN NEXTS <= PUSH2;
							ELSIF compo(1) = '1' THEN NEXTS <= OVF;
							ELSE NEXTS <= PUSH2;
							END IF;
						
	 WHEN PUSH2 => 	enable <= '0';
							load <= '0';
							ud <= '1';
							we <= "1";
							SELECT0MUX <= '0';
							SELECT1MUX <= '0';
							PUSHSIGNAL <= '0';
							NEXTS <= NOTHING;

    WHEN POP1 =>	   we <= "0";
							load <= '0';
							ud <= '0';
							enable <= '0';
							SELECT0MUX <= '0';
							SELECT1MUX <= '0';
							PUSHSIGNAL <= '0';
							IF compo(0) = '0' THEN NEXTS <= POP2;
							ELSIF compo(0) = '1' THEN NEXTS <= NOTHING;
							ELSE NEXTS <= POP2;
							END IF;
	
	 WHEN POP2 =>     ud <= '0';
							load <= '0';
							we <= "0";
							enable <= '1';
							SELECT0MUX <= '0';
							SELECT1MUX <= '0';
							PUSHSIGNAL <= '0';
							NEXTS <= NOTHING;
							
	WHEN POP3 =>		we <= "0";
							load <= '0';
							ud <= '0';
							enable <= '0';
							SELECT0MUX <= '0';
							SELECT1MUX <= '0';
							PUSHSIGNAL <= '0';
							IF compo(0) = '0' THEN NEXTS <= POP4;
							ELSIF compo(0) = '1' THEN NEXTS <= NOTHING;
							ELSE NEXTS <= POP4;
							END IF;
							
	WHEN POP4 =>		ud <= '0';
							load <= '0';
							we <= "0";
							enable <= '1';
							SELECT0MUX <= '1';
							SELECT1MUX <= '0';
							PUSHSIGNAL <= '0';
							NEXTS <= POP5;
							
	WHEN POP5 =>		we <= "0";
							load <= '0';
							ud <= '0';
							enable <= '0';
							SELECT0MUX <= '0';
							SELECT1MUX <= '0';
							PUSHSIGNAL <= '0';
							IF compo(0) = '0' THEN NEXTS <= POP6;
							ELSIF compo(0) = '1' THEN NEXTS <= NOTHING;
							ELSE NEXTS <= POP6;
							END IF;
							
	WHEN POP6 =>		ud <= '0';
							load <= '0';
							we <= "0";
							enable <= '1';
							SELECT0MUX <= '0';
							SELECT1MUX <= '1';
							PUSHSIGNAL <= '0';
							NEXTS <= PUSH3;
							
	WHEN POP7 =>		we <= "0";
							load <= '0';
							ud <= '0';
							enable <= '0';
							SELECT0MUX <= '0';
							SELECT1MUX <= '0';
							PUSHSIGNAL <= '0';
							IF compo(0) = '0' THEN NEXTS <= POP8;
							ELSIF compo(0) = '1' THEN NEXTS <= NOTHING;
							ELSE NEXTS <= POP8;
							END IF;
							
	WHEN POP8 =>		ud <= '0';
							load <= '0';
							we <= "0";
							enable <= '1';
							SELECT0MUX <= '0';
							SELECT1MUX <= '1';
							PUSHSIGNAL <= '0';
							NEXTS <= PUSH5;
							
							
	WHEN PUSH3 =>		enable <= '1';
							load <= '0';
							ud <= '1';
							we <= "0"; 
							SELECT0MUX <= '0';
							SELECT1MUX <= '0';
							PUSHSIGNAL <= '0';
							IF compo(1) = '0' THEN NEXTS <= PUSH4;
							ELSIF compo(1) = '1' THEN NEXTS <= OVF;
							ELSE NEXTS <= PUSH4;
							END IF;
							
	WHEN PUSH4 =>		enable <= '0';
							load <= '0';
							ud <= '1';
							we <= "1";
							SELECT0MUX <= '0';
							SELECT1MUX <= '0';
							PUSHSIGNAL <= '1';
							IF SW = '1' THEN NEXTS <= PUSH7;
							ELSE NEXTS <= NOTHING;
							END IF;
							
							
	WHEN PUSH5 =>		enable <= '1';
							load <= '0';
							ud <= '1';
							we <= "0";
							SELECT0MUX <= '0';
							SELECT1MUX <= '0';
							PUSHSIGNAL <= '0';
							IF compo(1) = '0' THEN NEXTS <= PUSH6;
							ELSIF compo(1) = '1' THEN NEXTS <= OVF;
							ELSE NEXTS <= PUSH6;
							END IF;
							
	WHEN PUSH6 =>		enable <= '0';
							load <= '0';
							ud <= '1';
							we <= "1";
							SELECT0MUX <= '0';
							SELECT1MUX <= '0';
							PUSHSIGNAL <= '1';
							NEXTS <= NOTHING;
							
	WHEN PUSH7 =>		enable <= '0';
							load <= '0';
							ud <= '1';
							we <= "1";
							SELECT0MUX <= '0';
							SELECT1MUX <= '0';
							PUSHSIGNAL <= '1';
							NEXTS <= NOTHING;
							
	
							
	 WHEN OVF =>      ud <= '0';
							load <= '0';
							enable <= '0';
							we <= "0";
							SELECT0MUX <= '0';
							SELECT1MUX <= '0';
							PUSHSIGNAL <= '0';
							IF BTN3 = '1' THEN NEXTS <= RESET;
							ELSE NEXTS <= OVF;
							END IF;
							
	 WHEN RESET =>		load <= '1';
							ud <= '0';
							enable <= '0';
							we <= "0";
							SELECT0MUX <= '0';
							SELECT1MUX <= '0';
							PUSHSIGNAL <= '0';
							NEXTS <= NOTHING;
							
	WHEN OTHERS =>		ud <= '0';
							load <= '0';
							enable <= '0';
							we <= "0";
							SELECT0MUX <= '0';
							SELECT1MUX <= '0';
							PUSHSIGNAL <= '0';
							NEXTS <= NOTHING;
	
END CASE;
END PROCESS fsm_comb;
				 
fsm_synch:
PROCESS(CLK,BTN3)
BEGIN 

IF(BTN3 = '1')	THEN 	CURRENTS <= RESET;
						  
ELSIF(rising_edge(CLK) AND CLK = '1') THEN CURRENTS <= NEXTS;

END IF;

END PROCESS fsm_synch; 

end Behavioral;

