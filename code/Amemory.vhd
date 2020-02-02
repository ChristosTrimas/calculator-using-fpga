----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:26:38 04/23/2018 
-- Design Name: 
-- Module Name:    Amemory - Structural 
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

entity Amemory is
    Port (CLK : in STD_LOGIC;
			  WE :  in STD_LOGIC_VECTOR(0 DOWNTO 0);	
			  UD : in  STD_LOGIC;
           LOAD : in  STD_LOGIC;
           EN : in  STD_LOGIC;
           INPUTS : in  STD_LOGIC_VECTOR (7 downto 0);
           OUTPUTS : out  STD_LOGIC_VECTOR (7 downto 0);
           SPOUTS : out  STD_LOGIC_VECTOR (3 downto 0));
end Amemory;

architecture Structural of Amemory is

COMPONENT stack_pointer_counter is
	port(CLK : in  STD_LOGIC;
           EN : in  STD_LOGIC;
			  LOAD : in STD_LOGIC;
           UPDOWN : in  STD_LOGIC;
           OUTPUT : out  STD_LOGIC_VECTOR (3 downto 0));
END COMPONENT;

COMPONENT memory is
	port(clka : IN STD_LOGIC;
		  wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
		  addra : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		  dina : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		  douta : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
  );
END COMPONENT;


SIGNAL TOSOUTS : STD_LOGIC_VECTOR(3 DOWNTO 0);
begin

spc:		stack_pointer_counter
			port map(CLK => CLK,
						EN => EN,
						LOAD => LOAD,
						UPDOWN => UD,
						OUTPUT => TOSOUTS);
						
amem:		memory
			port map(clka => CLK,
						wea => WE,
						addra => TOSOUTS,
						dina => INPUTS,
						douta => OUTPUTS);
						
SPOUTS <= TOSOUTS;

end Structural;

