----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:01:58 05/15/2018 
-- Design Name: 
-- Module Name:    aovf - Behavioral 
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

entity aovf is
    Port ( MSB : in  STD_LOGIC;
           MSSB : in  STD_LOGIC;
           OUTDEC : out  STD_LOGIC);
end aovf;

architecture Behavioral of aovf is

begin

OUTDEC <= MSB XOR MSSB;

end Behavioral;

