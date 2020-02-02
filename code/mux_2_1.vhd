----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:01:50 04/17/2018 
-- Design Name: 
-- Module Name:    mux_2_1 - Behavioral 
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

entity mux_2_1 is
    Port ( SEL : in  STD_LOGIC;
           A : in  STD_LOGIC_VECTOR(7 DOWNTO 0);
           B : in  STD_LOGIC_VECTOR(7 DOWNTO 0);
           F : out  STD_LOGIC_VECTOR(7 DOWNTO 0));
end mux_2_1;

architecture Behavioral of mux_2_1 is

begin

F <= A WHEN (SEL = '0') ELSE B;

end Behavioral;

