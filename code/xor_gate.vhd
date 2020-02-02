----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:56:51 05/15/2018 
-- Design Name: 
-- Module Name:    xor_gate - Behavioral 
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

entity xor_gate is
    Port ( A : in  STD_LOGIC_VECTOR (7 downto 0);
           B : in  STD_LOGIC;
           OUTS : out  STD_LOGIC_VECTOR (7 downto 0));
end xor_gate;

architecture Behavioral of xor_gate is

begin

OUTS(0) <= A(0) XOR B;
OUTS(1) <= A(1) XOR B;
OUTS(2) <= A(2) XOR B;
OUTS(3) <= A(3) XOR B;
OUTS(4) <= A(4) XOR B;
OUTS(5) <= A(5) XOR B;
OUTS(6) <= A(6) XOR B;
OUTS(7) <= A(7) XOR B;
end Behavioral;

