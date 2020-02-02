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

entity decoder is
    Port ( MODE : STD_LOGIC_VECTOR(1 DOWNTO 0);
           ADD : in  STD_LOGIC;
           SUB : in  STD_LOGIC;
           USUB : in  STD_LOGIC;
           SWAP : in  STD_LOGIC;
			  OVF : in STD_LOGIC;
           SPIN : in  STD_LOGIC_VECTOR (3 downto 0);
           dec0Out : out  STD_LOGIC_VECTOR (7 downto 0);
           dec1Out : out  STD_LOGIC_VECTOR (7 downto 0);
           dec2Out : out  STD_LOGIC_VECTOR (7 downto 0);
           dec3Out : out  STD_LOGIC_VECTOR (7 downto 0));
end decoder;

architecture Behavioral of decoder is

begin
PROCESS(MODE,SPIN,ADD,SUB,USUB,SWAP,OVF)
BEGIN
CASE MODE IS 

		WHEN "00" =>


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
	
 
	WHEN "01" =>				dec0Out <= "11111111";
									dec1Out <= "11111111";
									dec2Out <= "11111111";
									dec3Out <= "10011111";
		
	IF (ADD = '1') THEN 
									
									dec0Out <= "11111111";
									dec1Out <= "11111111";
									dec2Out <= "11111111";
									dec3Out <= "00010001";
	
	ELSE 
	IF(SUB = '1') THEN 
									
									dec0Out <= "11111111";
									dec1Out <= "11111111";
									dec2Out <= "11111111";
									dec3Out <= "01001001";
	ELSE
	IF(OVF = '1') THEN 	
									dec0Out <= "01110001";
									dec1Out <= "10000011";
									dec2Out <= "00000011";
									dec3Out <= "00010001";
	ELSE
	
	END IF;
	
	END IF;
									 							
	END IF;
	
	WHEN "10" =>				dec0Out <= "11111111";
									dec1Out <= "11111111";
									dec2Out <= "11111111";
									dec3Out <= "00100101";
																		
		IF (USUB = '1') THEN 
									dec0Out <= "11111111";
									dec1Out <= "11111111";
									dec2Out <= "11111111";
									dec3Out <= "10000011";
									
		ELSE 
		IF(SWAP = '1') THEN 
									dec0Out <= "11111111";
									dec1Out <= "11111111";
									dec2Out <= "00001111";
									dec3Out <= "01100011";
									
		ELSE 	
		
		END IF;
		
		END IF;
		
	WHEN OTHERS => 			dec0Out <= "11111111";
									dec1Out <= "11111111";
									dec2Out <= "11111111";
									dec3Out <= "11111111";
	
END CASE;
END PROCESS;
	

end Behavioral;

