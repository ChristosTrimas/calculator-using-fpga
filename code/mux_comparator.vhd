----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:29:11 04/19/2018 
-- Design Name: 
-- Module Name:    mux_comparator - Behavioral 
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

entity mux_comparator is
    Port ( stackIn : in  STD_LOGIC_VECTOR (3 downto 0);
           compOut : out  STD_LOGIC_VECTOR(1 DOWNTO 0));
end mux_comparator;

architecture Structural of mux_comparator is

COMPONENT equal_comparator is
Port	(IN1 : in  STD_LOGIC_VECTOR (3 downto 0);
       IN2 : in  STD_LOGIC_VECTOR (3 downto 0);
       EQUALFLAG : out  STD_LOGIC);
END COMPONENT;

BEGIN

EC1:	equal_comparator
		port map(IN1 => "1011",
					IN2 => stackIn,
					EQUALFLAG => compOut(1));
					
EC0:	equal_comparator
		port map(IN1 => "0000",
					IN2 => stackIn,
					EQUALFLAG => compOut(0));

end Structural;

