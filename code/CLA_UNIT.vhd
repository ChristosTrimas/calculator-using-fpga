----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:49:01 03/25/2018 
-- Design Name: 
-- Module Name:    CLA_UNIT - Behavioral 
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

entity CLA_UNIT is
    Port ( G : in  STD_LOGIC_VECTOR (7 downto 0);
           P : in  STD_LOGIC_VECTOR (7 downto 0);
           Cin : in  STD_LOGIC;
           C7 : out  STD_LOGIC;
           C : inout  STD_LOGIC_VECTOR (6 downto 0));
end CLA_UNIT;

architecture Behavioral of CLA_UNIT is

begin

C(0) <= G(0) OR (P(0) AND Cin);
C(1) <= G(1) OR (P(1) AND C(0));
C(2) <= G(2) OR (P(2) AND C(1));
C(3) <= G(3) OR (P(3) AND C(2));
C(4) <= G(4) OR (P(4) AND C(3));
C(5) <= G(5) OR (P(5) AND C(4));
C(6) <= G(6) OR (P(6) AND C(5));
C7   <= G(7) OR (P(7) AND C(6));

end Behavioral;

