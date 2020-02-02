----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:19:43 04/22/2018 
-- Design Name: 
-- Module Name:    ssd_comparator - Behavioral 
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

entity ssd_comparator is
    Port ( counterIn : in  STD_LOGIC_VECTOR (16 downto 0);
           top : in  STD_LOGIC_VECTOR (16 downto 0);
           compOut : out  STD_LOGIC);
end ssd_comparator;

architecture Behavioral of ssd_comparator is

begin

compOut <= '1' WHEN(counterIn = top) ELSE '0';

end Behavioral;

