----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:39:17 05/12/2018 
-- Design Name: 
-- Module Name:    register_tos - Behavioral 
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

entity register_tos is
    Port ( INPUT : in  STD_LOGIC_VECTOR (7 downto 0);
           OUTPUT : out  STD_LOGIC_VECTOR (7 downto 0);
           CLK : in  STD_LOGIC);
end register_tos;

architecture Behavioral of register_tos is

begin
PROCESS(CLK,INPUT)
BEGIN

IF(rising_edge(CLK)) THEN 
OUTPUT <= INPUT;

ELSE	OUTPUT <= INPUT;

END IF;
END PROCESS;

end Behavioral;

