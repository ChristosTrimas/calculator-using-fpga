----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:37:56 05/12/2018 
-- Design Name: 
-- Module Name:    add_sub - Structural 
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

entity add_sub is
    Port ( CIN : in  STD_LOGIC;
           R1 : in  STD_LOGIC_VECTOR (7 downto 0);
           R2 : in  STD_LOGIC_VECTOR (7 downto 0);
           COUT : out  STD_LOGIC;
           RESULT : out  STD_LOGIC_VECTOR (7 downto 0));
end add_sub;

architecture Structural of add_sub is

COMPONENT	CLA_ADDER is
	Port ( A : in  STD_LOGIC_VECTOR (7 downto 0);
           B : in  STD_LOGIC_VECTOR (7 downto 0);
           Cin : in  STD_LOGIC;
           S : out  STD_LOGIC_VECTOR (7 downto 0);
           C7 : out  STD_LOGIC);
END COMPONENT;


begin

adder_sub:	CLA_ADDER
port map			 (A => R1,
					  B => R2,
					  Cin => '0',
					  S => RESULT,
					  C7 => COUT);


end Structural;

