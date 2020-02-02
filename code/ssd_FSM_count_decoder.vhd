----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:30:48 04/23/2018 
-- Design Name: 
-- Module Name:    ssd_FSM_count_decoder - Behavioral 
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

entity ssd_FSM_count_decoder is
    Port ( clk : in  STD_LOGIC;
			  MODE : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
           ADD : in  STD_LOGIC;
           SUB : in  STD_LOGIC;
           USUB : in  STD_LOGIC;
           SWAP : in  STD_LOGIC;
			  OVF : in STD_LOGIC;
           SPIN : in  STD_LOGIC_VECTOR (3 downto 0);
           decout0 : out  STD_LOGIC_VECTOR (7 downto 0);
           decout1 : out  STD_LOGIC_VECTOR (7 downto 0);
           decout2 : out  STD_LOGIC_VECTOR (7 downto 0);
           decout3 : out  STD_LOGIC_VECTOR (7 downto 0);
           sel : out  STD_LOGIC_VECTOR (1 downto 0);
           seg0 : out  STD_LOGIC;
           seg1 : out  STD_LOGIC;
           seg2 : out  STD_LOGIC;
           seg3 : out  STD_LOGIC);
end ssd_FSM_count_decoder;

architecture Structural of ssd_FSM_count_decoder is

COMPONENT decoder is
	Port	( MODE : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
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
END COMPONENT;

COMPONENT ssd_FSM_compo_counter is
	Port	(CLK : in  STD_LOGIC;
           SEL : out  STD_LOGIC_VECTOR (1 downto 0);
           SEG0 : out  STD_LOGIC;
           SEG1 : out  STD_LOGIC;
           SEG2 : out  STD_LOGIC;
           SEG3 : out  STD_LOGIC);
END COMPONENT;

begin
dec:		decoder
			port map(MODE => MODE,
						ADD => ADD,
						SUB => SUB,
						USUB => USUB,
						SWAP => SWAP,
						OVF => OVF,
						SPIN => SPIN,
						dec0Out => decout0,
						dec1Out => decout1,
						dec2Out => decout2,
						dec3Out => decout3);
						
ssd_fsm_comp:	ssd_FSM_compo_counter
					port map(CLK => clk,
								SEL => sel,
								SEG0 => seg0,
								SEG1 => seg1,
								SEG2 => seg2,
								SEG3 => seg3);

end Structural;

