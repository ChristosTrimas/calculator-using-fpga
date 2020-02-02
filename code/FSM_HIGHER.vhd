----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:29:18 04/23/2018 
-- Design Name: 
-- Module Name:    FSM_HIGHER - Behavioral 
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

entity FSM_HIGHER is
    Port ( CLK : in  STD_LOGIC;
           BTN0 : in  STD_LOGIC;
           BTN1 : in  STD_LOGIC;
           BTN2 : in  STD_LOGIC;
           PUSHin : in  STD_LOGIC;
           NUMBERSIN : in  STD_LOGIC_VECTOR (7 downto 0);
           SSD : out  STD_LOGIC_VECTOR (3 downto 0);
           OUTMEM : out  STD_LOGIC_VECTOR (7 downto 0));
end FSM_HIGHER;

architecture Structural of FSM_HIGHER is

COMPONENT FSM_top is
	Port ( CLK : in STD_LOGIC;
			  BUTTON0 : in  STD_LOGIC;
           BUTTON1 : in  STD_LOGIC;
           BUTTON2 : in  STD_LOGIC;
           PUSHINPUT : in  STD_LOGIC;
           MUXCSIGNAL : out  STD_LOGIC;
           INPUTSMEM : in  STD_LOGIC_VECTOR (7 downto 0);
			  SSD_OUTPUT: out STD_LOGIC_VECTOR(3 DOWNTO 0);
           OUTPUTSMEM : out  STD_LOGIC_VECTOR (7 downto 0));
END COMPONENT;

COMPONENT mux_2x1 is
	Port ( fsm_in : in  STD_LOGIC_VECTOR (7 downto 0);
           zero : in  STD_LOGIC_VECTOR (7 downto 0);
           sel : in  STD_LOGIC;
           outm : out  STD_LOGIC_VECTOR(7 DOWNTO 0));
END COMPONENT;

SIGNAL MUXS : STD_LOGIC;
SIGNAL INPUT: STD_LOGIC_VECTOR(7 DOWNTO 0);
begin

end Structural;

