----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:39:23 04/17/2018 
-- Design Name: 
-- Module Name:    D_FF - Behavioral 
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

entity D_FF is
    Port ( CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           D : in  STD_LOGIC;
           Q : out  STD_LOGIC);
end D_FF;

architecture Behavioral of D_FF is

begin

PROCESS(CLK,RST)

BEGIN
IF(RST = '1') THEN 
	Q <= '0';
ELSIF(CLK = '1' AND CLK'EVENT) THEN 
	Q <= D;
END IF;
END PROCESS;

end Behavioral;

