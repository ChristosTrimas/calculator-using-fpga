----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:19:04 04/17/2018 
-- Design Name: 
-- Module Name:    mux_4_2 - Behavioral 
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

entity mux_4_2 is
    Port ( IN0 : in  STD_LOGIC;
           IN1 : in  STD_LOGIC;
           IN2 : in  STD_LOGIC;
           IN3 : in  STD_LOGIC;
           SEL : in  STD_LOGIC_VECTOR (1 downto 0);
           OUTM : out  STD_LOGIC);
end mux_4_2;

architecture Behavioral of mux_4_2 is

begin

WITH SEL SELECT 				--labnotes
OUTM <= IN0 WHEN "00",
		 IN1 WHEN "01",
		 IN2 WHEN "10",
		 IN3 WHEN "11",
		 '0' WHEN OTHERS;

end Behavioral;

