----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:31:25 04/22/2018 
-- Design Name: 
-- Module Name:    ssd_count_comp - Behavioral 
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
use ieee.std_logic_unsigned.all; 

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ssd_count_comp is
    Port ( --RESET : in  STD_LOGIC;
           LOAD : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           COMPOUT : out  STD_LOGIC);
end ssd_count_comp;

architecture Structural of ssd_count_comp is

COMPONENT	counter_ssd is
	Port   (load : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           counter : out  STD_LOGIC_VECTOR (16 downto 0));
END COMPONENT;

COMPONENT	ssd_comparator is
	Port	 (counterIn : in  STD_LOGIC_VECTOR (16 downto 0);
           top : in  STD_LOGIC_VECTOR (16 downto 0);
           compOut : out  STD_LOGIC);
END COMPONENT;

SIGNAL countCompSig : STD_LOGIC_VECTOR(16 DOWNTO 0);

begin

counter:	counter_ssd
			Port map(load => LOAD,
						clk => CLK,
						counter => countCompSig);
						
comparator:	ssd_comparator
				Port map(counterIn => countCompSig,
							top => "00000000000001010",
							compOut => COMPOUT);

end Structural;

