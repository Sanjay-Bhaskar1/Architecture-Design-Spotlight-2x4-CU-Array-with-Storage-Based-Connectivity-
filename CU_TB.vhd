----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/01/2025 09:40:14 AM
-- Design Name: 
-- Module Name: CU_TB - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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
use ieee.numeric_std.all;
use std.env.finish;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity CU_TB is
--  Port ( );
end CU_TB;

architecture Behavioral of CU_TB is
constant d_w_c : integer := 4;
signal s : std_logic_vector (d_w_c downto 0);
signal a,b,y :std_logic_vector (d_w_c - 1 downto 0);
begin

uut : entity work.cu(Behavioral)

generic map(d_w => d_w_c)
port map ( a => a, b => b, s => s, y => y);

stimuli : process

begin

a <= "0000";
b <= "0001";
s <= "00000";
wait for 10ns;

a <= "0000";
b <= "0001";
s <= "00001";
wait for 10ns;

a <= "0000";
b <= "0001";
s <= "00010";
wait for 10ns;

a <= "0000";
b <= "0001";
s <= "00011";
wait for 10ns;

a <= "0000";
b <= "0001";
s <= "00100";
wait for 10ns;

a <= "0000";
b <= "0001";
s <= "00101";
wait for 10ns;

a <= "0000";
b <= "0001";
s <= "00110";
wait for 10ns;

a <= "0000";
b <= "1111";
s <= "00111";
wait for 10ns;

a <= "0000";
b <= "0001";
s <= "01000";
wait for 10ns;

a <= "0000";
b <= "0001";
s <= "01001";
wait for 10ns;

a <= "0000";
b <= "0001";
s <= "01010";
wait for 10ns;

a <= "0000";
b <= "0001";
s <= "01011";
wait for 10ns;

a <= "0000";
b <= "0001";
s <= "01100";
wait for 10ns;

a <= "0000";
b <= "0001";
s <= "01101";
wait for 10ns;

a <= "0000";
b <= "0001";
s <= "01110";
wait for 10ns;

a <= "0000";
b <= "0001";
s <= "01111";
wait for 10ns;

a <= "0000";
b <= "0001";
s <= "10000";
wait for 10ns;

a <= "0000";
b <= "0001";
s <= "10001";
wait for 10ns;

a <= "0000";
b <= "0001";
s <= "10010";
wait for 10ns;

a <= "0000";
b <= "0001";
s <= "10011";
wait for 10ns;

a <= "0000";
b <= "0001";
s <= "10100";
wait for 10ns;

a <= "0000";
b <= "0001";
s <= "10101";
wait for 10ns;

a <= "0000";
b <= "0001";
s <= "10110";
wait for 10ns;

end process;

end Behavioral;