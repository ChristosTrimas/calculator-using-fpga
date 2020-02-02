----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:01:36 04/23/2018 
-- Design Name: 
-- Module Name:    mux_2x1 - Behavioral 
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

entity mux_2x1 is
    Port ( fsm_in : in  STD_LOGIC_VECTOR (7 downto 0);
           zero : in  STD_LOGIC_VECTOR (7 downto 0);
           sel : in  STD_LOGIC;
           outm : out  STD_LOGIC_VECTOR(7 DOWNTO 0));
end mux_2x1;

architecture Behavioral of mux_2x1 is

begin
WITH sel SELECT
outm <= zero WHEN '0',
		  fsm_in WHEN '1',
		  "00000000" WHEN OTHERS;

end Behavioral;

