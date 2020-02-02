----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:18:41 03/25/2018 
-- Design Name: 
-- Module Name:    GPunit - Behavioral 
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

entity GPunit is
    Port ( A : in  STD_LOGIC_VECTOR (7 downto 0);
           B : in  STD_LOGIC_VECTOR (7 downto 0);
           G : out  STD_LOGIC_VECTOR (7 downto 0);
           P : out  STD_LOGIC_VECTOR (7 downto 0));
end GPunit;

architecture Behavioral of GPunit is

begin

G <= A AND B;
P <= A XOR B;

end Behavioral;

