----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:47:07 04/22/2018 
-- Design Name: 
-- Module Name:    counter_ssd - Behavioral 
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

entity counter_ssd is
    Port ( --reset : in  STD_LOGIC;
           load : in  STD_LOGIC;
           clk : in  STD_LOGIC;
          -- data : in  STD_LOGIC_VECTOR (16 downto 0);
           counter : out  STD_LOGIC_VECTOR (16 downto 0));
end counter_ssd;

architecture Behavioral of counter_ssd is

SIGNAL count : STD_LOGIC_VECTOR(16 DOWNTO 0);
begin

PROCESS(clk,load)			--apo diafaneies

BEGIN

IF(load = '1')	THEN count <= "00000000000000000";

ELSIF(RISING_EDGE(clk) AND clk = '1')	THEN count <= count + 1;
	
END IF;
END PROCESS;

counter <= count;
end Behavioral;

