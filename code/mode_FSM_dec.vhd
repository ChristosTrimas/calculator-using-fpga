----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:13:06 05/05/2018 
-- Design Name: 
-- Module Name:    mode_FSM_dec - Structural 
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

entity mode_FSM_dec is
    Port ( CLK : in  STD_LOGIC;
           BTN0 : in  STD_LOGIC;
           BTN1 : in  STD_LOGIC;
           BTN2 : in  STD_LOGIC;
           BTN3 : in  STD_LOGIC;
			  SPIN : in STD_LOGIC_VECTOR(3 DOWNTO 0);
           PUSHTOS : out  STD_LOGIC;
           POPTOS : out  STD_LOGIC;
           RESETTOS : out  STD_LOGIC;
           DECOUT0 : out  STD_LOGIC_VECTOR (7 downto 0);
           DECOUT1 : out  STD_LOGIC_VECTOR (7 downto 0);
           DECOUT2 : out  STD_LOGIC_VECTOR (7 downto 0);
           DECOUT3 : out  STD_LOGIC_VECTOR (7 downto 0));
end mode_FSM_dec;

architecture Structural of mode_FSM_dec is

COMPONENT mode_FSM IS
	 Port ( CLK : in STD_LOGIC;
			  BTN0 : in  STD_LOGIC;
           BTN1 : in  STD_LOGIC;
           BTN2 : in  STD_LOGIC;
           BTN3 : in  STD_LOGIC;
           PUSHTOS : out  STD_LOGIC;
           POPTOS : out  STD_LOGIC;
           RESETST : out  STD_LOGIC;
           MODE0DEC : out  STD_LOGIC;
           MODE1DEC : out  STD_LOGIC;
           MODE2DEC : out  STD_LOGIC;
           ADDSGN : out  STD_LOGIC;
           SUBSGN : out  STD_LOGIC;
           USUBSGN : out  STD_LOGIC;
           SWAPSGN : out  STD_LOGIC);
END COMPONENT;

COMPONENT new_decoder IS
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
END COMPONENT;

SIGNAL ADD,SUB,USUB,SWAP,MOD1,MOD2,MOD0 : STD_LOGIC;

begin

--fsm:		mode_FSM
--			port map(CLK => CLK,
--						BTN0 => BTN0,
--						BTN1 => BTN1,
--						BTN2 => BTN2,
--						BTN3 => BTN3,
--						PUSHTOS => PUSHTOS,
--						POPTOS => POPTOS,
--						RESETST => RESETTOS,
--						MODE0DEC => MOD0,
--						MODE1DEC => MOD1,
--						MODE2DEC => MOD2,
--						ADDSGN => ADD,
--						SUBSGN => SUB,
--						USUBSGN => USUB,
--						SWAPSGN => SWAP);
--						
--dec:		new_decoder
--			port map(MODE0 => MOD0,
--						MODE1 => MOD1,
--						MODE2 => MOD2,
--						ADD => ADD,
--						SUB => SUB,
--						USUB => USUB,
--						SWAP => SWAP,
--						SPIN => SPIN,
--						dec0out => DECOUT0,
--						dec1Out => DECOUT1,
--						dec2Out => DECOUT2,
--						dec3Out => DECOUT3);



end Structural;

