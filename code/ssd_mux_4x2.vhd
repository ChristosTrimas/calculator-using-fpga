----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:13:07 04/22/2018 
-- Design Name: 
-- Module Name:    ssd_mux_4x2 - Behavioral 
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

entity ssd_mux_4x2 is
    Port ( decIn0 : in  STD_LOGIC_VECTOR (7 downto 0);
           decIn1 : in  STD_LOGIC_VECTOR (7 downto 0);
           decIn2 : in  STD_LOGIC_VECTOR (7 downto 0);
           decIn3 : in  STD_LOGIC_VECTOR (7 downto 0);
           SEL : in  STD_LOGIC_VECTOR (1 downto 0);
           segOut : out  STD_LOGIC_VECTOR (7 downto 0));
end ssd_mux_4x2;

architecture Behavioral of ssd_mux_4x2 is

begin
WITH SEL SELECT
segOut <= decIn0 WHEN "00",
			 decIn1 WHEN "01",
			 decIn2 WHEN "10",
			 decIn3 WHEN "11",
			 "00000000"	  WHEN OTHERS;

end Behavioral;

