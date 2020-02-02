----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:27:59 03/25/2018 
-- Design Name: 
-- Module Name:    CLA_ADDER - Structural 
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

entity CLA_ADDER is
    Port ( A : in  STD_LOGIC_VECTOR (7 downto 0);
           B : in  STD_LOGIC_VECTOR (7 downto 0);
           Cin : in  STD_LOGIC;
           S : out  STD_LOGIC_VECTOR (7 downto 0);
           C7 : out  STD_LOGIC);
end CLA_ADDER;

architecture Structural of CLA_ADDER is

COMPONENT GPunit
	port(
			A: in STD_LOGIC_VECTOR(7 downto 0);
			B: in STD_LOGIC_VECTOR (7 downto 0);
			G: out STD_LOGIC_VECTOR(7 downto 0);
			P: out STD_LOGIC_VECTOR (7 downto 0));
END COMPONENT;

COMPONENT CLA_UNIT
	port(
			G: in STD_LOGIC_VECTOR (7 downto 0);
			P: in STD_LOGIC_VECTOR (7 downto 0);
			Cin: in STD_LOGIC;
			C7:  out STD_LOGIC;
			C:   inout STD_LOGIC_VECTOR (6 downto 0));
END COMPONENT;

COMPONENT SUM_UNIT
	port(
			Cin: in STD_LOGIC;
			P: in STD_LOGIC_VECTOR (7 downto 0);
			C: in STD_LOGIC_VECTOR (6 downto 0);
			S: out STD_LOGIC_VECTOR (7 downto 0));
END COMPONENT;

SIGNAL pgout,gpout: STD_LOGIC_VECTOR (7 downto 0);
SIGNAL claout: STD_LOGIC_VECTOR (6 downto 0);

begin

			CGP:GPunit 
			PORT MAP(
							A => A,
							B => B,
							P => pgout,
	  					   G => gpout);
							
		CLA:CLA_UNIT 
		PORT MAP(
							 G => gpout,
							 P => pgout,
							 Cin => Cin,
							 C7 => C7,
							 C => claout);
		
				SUM:SUM_UNIT
				PORT MAP(
						    Cin => Cin,
							 P => pgout,
							 C => claout,
							 S => S);
	
end Structural;

