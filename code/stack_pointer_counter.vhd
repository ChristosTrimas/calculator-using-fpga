----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:52:58 04/17/2018 
-- Design Name: 
-- Module Name:    stack_pointer_counter - Structural 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity stack_pointer_counter is
    Port ( CLK : in  STD_LOGIC;
           EN : in  STD_LOGIC;
			  LOAD : in STD_LOGIC;
           UPDOWN : in  STD_LOGIC;
           OUTPUT : out  STD_LOGIC_VECTOR (3 downto 0));
end stack_pointer_counter;

architecture Behavioral of stack_pointer_counter is

SIGNAL count : STD_LOGIC_VECTOR(3 DOWNTO 0);
begin

PROCESS(CLK,EN,UPDOWN,LOAD)			--apo diafaneies

BEGIN

IF(load = '1')	THEN count <= "0000";

ELSIF(RISING_EDGE(clk))	THEN
	IF EN = '1' AND UPDOWN = '1'	THEN count <= count + 1;
	ELSIF EN = '1' AND UPDOWN = '0' THEN count <= count - 1;
	END IF;
	
END IF;
END PROCESS;

OUTPUT <= count;


end Behavioral;

