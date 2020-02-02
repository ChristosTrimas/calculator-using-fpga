----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:55:54 05/14/2018 
-- Design Name: 
-- Module Name:    lab_5_fsm - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity lab_5_fsm is
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
end lab_5_fsm;

architecture Behavioral of lab_5_fsm is
TYPE ST IS (CALM,ADD,SUB,USUBS,SWAP1,SWAP2);
SIGNAL CURRENTS,NEXTS : ST;
begin

fsm_comb:
PROCESS(CURRENTS,ADDSGN,SUBSGN,USUBSGN,SWAPSGN,MODE0,PUSHSGN)

BEGIN

CASE CURRENTS IS
		WHEN CALM =>	ASSW <= '0';
							SELECT2 <= '0';
							SW <= '0';
							SELECT3 <= '0';
							SELECT4 <= '0';
							ADD_SUB <= '0';
							USUB <= '0';
							IF ADDSGN = '1' THEN NEXTS <= ADD;
							ELSIF SUBSGN = '1' THEN NEXTS <= SUB;
							ELSIF USUBSGN = '1' THEN NEXTS <= USUBS;
							ELSIF SWAPSGN = '1' THEN NEXTS <= SWAP1;
							ELSIF MODE0 = '1' THEN NEXTS <= CALM;
							ELSE NEXTS <= CALM;
							END IF;
						
		WHEN ADD =>		ASSW <= '1';
							SELECT2 <= '1';
							SW <= '0';
							SELECT3 <= '0';
							SELECT4 <= '1';
							ADD_SUB <= '0';
							USUB <= '0';							
							IF PUSHSGN = '1' THEN NEXTS <= CALM;
							ELSE NEXTS <= ADD;
							END IF;
							
		WHEN SUB =>		ASSW <= '1';
							SELECT2 <= '1';
							SW <= '0';
							SELECT3 <= '0';
							SELECT4 <= '1';
							ADD_SUB <= '1';
							USUB <= '0';							
							IF PUSHSGN = '1' THEN NEXTS <= CALM;
							ELSE NEXTS <= SUB;
							END IF;

	WHEN USUBS => 		ASSW <= '0';
							SELECT2 <= '0';
							SW <= '0';
							SELECT3 <= '0';
							SELECT4 <= '1';
							ADD_SUB <= '1';
							USUB <= '1';							
							IF PUSHSGN = '1' THEN NEXTS <= CALM;
							ELSE NEXTS <= USUBS;
							END IF;
							
	WHEN SWAP1 =>		ASSW <= '1';
							SW <= '0';
							SELECT2 <= '1';
							SELECT3 <= '1';
							SELECT4 <= '0';
							ADD_SUB <= '0';
							USUB <= '0';							
							IF PUSHSGN = '1' THEN NEXTS <= SWAP2;
							ELSE NEXTS <= SWAP1;
							END IF;
							
	WHEN SWAP2 => 		ASSW <= '0';
							SW <= '1';
							SELECT2 <= '1';
							SELECT3 <= '0';
							SELECT4 <= '0';
							ADD_SUB <= '0';
							USUB <= '0';							
							IF PUSHSGN = '1' THEN NEXTS <= CALM;
							ELSE NEXTS <= SWAP2;
							END IF;

	WHEN OTHERS =>		ASSW <= '0';
							SELECT2 <= '0';
							SW <= '0';
							SELECT3 <= '0';
							SELECT4 <= '0';
							ADD_SUB <= '0';
							USUB <= '0';
							NEXTS <= CALM;
							
END CASE;
END PROCESS fsm_comb;

fsm_synch:
PROCESS(CLK,MODE0)
BEGIN 

IF(MODE0 = '1')	THEN 	CURRENTS <= CALM;
						  
ELSIF(rising_edge(CLK) AND CLK = '1') THEN CURRENTS <= NEXTS;

END IF;

END PROCESS fsm_synch; 
end Behavioral;

