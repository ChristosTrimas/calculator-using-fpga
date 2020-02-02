----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:33:00 05/05/2018 
-- Design Name: 
-- Module Name:    new_decoder - Behavioral 
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

entity new_decoder is
    Port ( MODE0 : in  STD_LOGIC;
           MODE1 : in  STD_LOGIC;
           MODE2 : in  STD_LOGIC;
           ADD : in  STD_LOGIC;
           SUB : in  STD_LOGIC;
           USUB : in  STD_LOGIC;
           SWAP : in  STD_LOGIC;
           SPIN : in  STD_LOGIC_VECTOR (3 downto 0);
           dec0Out : out  STD_LOGIC_VECTOR (7 downto 0);
           dec1Out : out  STD_LOGIC_VECTOR (7 downto 0);
           dec2Out : out  STD_LOGIC_VECTOR (7 downto 0);
           dec3Out : out  STD_LOGIC_VECTOR (7 downto 0));
end new_decoder;

architecture Behavioral of new_decoder is

begin
PROCESS(MODE0,MODE1,ADD,SUB,MODE2,USUB,SWAP)
BEGIN
IF (MODE0 = '1') THEN 
 
	CASE SPIN is 
			WHEN "0000" => 	dec0Out <= "01100001";
									dec1Out <= "11111111";
									dec2Out <= "11111111";
									dec3Out <= "11111111";
									
			WHEN "1011" =>		dec0Out <= "01110001";
									dec1Out <= "11111111";
									dec2Out <= "11111111";
									dec3Out <= "11111111";
									
			WHEN "1100" =>		dec0Out <= "01110001";
									dec1Out <= "10000011";
									dec2Out <= "00000011";
									dec3Out <= "11111111";
									
			WHEN OTHERS =>		dec0Out <= "11111111";
									dec1Out <= "11111111";
									dec2Out <= "11111111";
									dec3Out <= "11111111";
	END CASE;
	
ELSE 
 IF (MODE1 = '1') THEN 
									dec0Out <= "11111111";
									dec1Out <= "11111111";
									dec2Out <= "11111111";
									dec3Out <= "10011111";
		
	IF (ADD = '1') THEN 
									dec0Out <= "11111111";
									dec1Out <= "11111111";
									dec2Out <= "11111111";
									dec3Out <= "00010001";
	
	ELSIF (SUB = '1') THEN 
									dec0Out <= "11111111";
									dec1Out <= "11111111";
									dec2Out <= "11111111";
									dec3Out <= "01001001";
									
	ELSE 							dec0Out <= "11111111";
									dec1Out <= "11111111";
									dec2Out <= "11111111";
									dec3Out <= "10011111";
	END IF;
	
	ELSIF (MODE2 = '1') THEN 
									dec0Out <= "11111111";
									dec1Out <= "11111111";
									dec2Out <= "11111111";
									dec3Out <= "00100101";
									
		IF (USUB = '1') THEN 
									dec0Out <= "11111111";
									dec1Out <= "11111111";
									dec2Out <= "11111111";
									dec3Out <= "10000011";
									
		ELSIF (SWAP = '1') THEN 
									dec0Out <= "11111111";
									dec1Out <= "11111111";
									dec2Out <= "00001111";
									dec3Out <= "01100011";
									
		ELSE 						dec0Out <= "11111111";
									dec1Out <= "11111111";
									dec2Out <= "11111111";
									dec3Out <= "00100101";
		
		END IF;
	
	END IF;
END IF;
END PROCESS;
	

end Behavioral;

