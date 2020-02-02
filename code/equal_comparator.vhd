----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:02:02 04/19/2018 
-- Design Name: 
-- Module Name:    equal_comparator - Behavioral 
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
use ieee.STD_LOGIC_unsigned.all;
use ieee.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity equal_comparator is
    Port ( IN1 : in STD_LOGIC_VECTOR(3 DOWNTO 0);
           IN2 : in STD_LOGIC_VECTOR(3 DOWNTO 0);
           EQUALFLAG : out  STD_LOGIC);
end equal_comparator;

architecture Behavioral of equal_comparator is

begin

	EQUALFLAG <= '1' WHEN(IN1 = IN2) ELSE '0';

end Behavioral;

