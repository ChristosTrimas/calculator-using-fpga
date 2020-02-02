----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:31:56 03/25/2018 
-- Design Name: 
-- Module Name:    SUM_UNIT - Behavioral 
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

entity SUM_UNIT is
    Port ( Cin : in  STD_LOGIC;
           C : in  STD_LOGIC_VECTOR (6 downto 0);
           P : in  STD_LOGIC_VECTOR (7 downto 0);
           S : out  STD_LOGIC_VECTOR (7 downto 0));
end SUM_UNIT;

architecture Behavioral of SUM_UNIT is

begin

S(0) <= P(0) XOR Cin;
S(1) <= P(1) XOR C(0);
S(2) <= P(2) XOR C(1);
S(3) <= P(3) XOR C(2);
S(4) <= P(4) XOR C(3);
S(5) <= P(5) XOR C(4);
S(6) <= P(6) XOR C(5);
S(7) <= P(7) XOR C(6);

end Behavioral;

