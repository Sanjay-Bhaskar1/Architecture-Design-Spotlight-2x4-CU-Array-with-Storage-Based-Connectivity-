----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/01/2025 02:21:44 PM
-- Design Name: 
-- Module Name: Main_TB - Behavioral
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
use work.custom_pack.all;
use std.env.finish;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Main_TB is
--  Port ( );
end Main_TB;

architecture Behavioral of Main_TB is
constant d_w_c : integer := 4;
signal I,J : vec_arr_1d(0 to 3)(d_w_c - 1 downto 0);
signal Y : vec_arr_1d(0 to 3)(d_w_c - 1 downto 0);
signal S : vec_arr_2d(0 to 1)(0 to 3)(d_w_c  downto 0);
signal clk : std_logic := '0';
signal MS : vec_arr_2d2(0 to 1)(0 to 7);
signal en_a,en_b,en_y,en_op : vec_arr_2d2(0 to 1)(0 to 3);

begin

uut : entity work.Main(Behavioral)
generic map(d_w => d_w_c)
port map ( I => I, J => J, Y => Y, S => S, clk => clk, MS => MS, en_a => en_a, en_b => en_b, en_op => en_op, en_y => en_y );
clk <= not clk after 5 ns;

process
begin
--RUN 1
I <= ("0100","0011","0000","0000");
J <= ("0000","0011","0010","0000");

 
MS(0)(2) <= '1'; 
MS(0)(3) <= '0';
MS(0)(0) <= '0'; 
MS(0)(1) <= '1'; 
MS(0)(4) <= '0'; 
MS(0)(5) <= '1'; 
MS(0)(6) <= '0'; 
MS(0)(7) <= '0'; 




S(0)(1) <= "01000";
--write
en_a(0)(1) <= '1';
en_b(0)(1) <= '1';
en_op(0)(1) <= '1';
wait for 10 ns;
--Read
en_a(0)(1) <= '0';
en_b(0)(1) <= '0';
en_op(0)(1) <= '0';

en_y(0)(1) <= '1';
wait for 20 ns;
en_y(0)(1) <= '0';
wait for 10 ns;

S(0)(0) <= "00110";
--write
en_a(0)(0) <= '1';
en_b(0)(0) <= '1';
en_op(0)(0) <= '1';
wait for 10 ns;
--Read

en_a(0)(0) <= '0';
en_b(0)(0) <= '0';
en_op(0)(0) <= '0';

en_y(0)(0) <= '1';
wait for 20 ns;
en_y(0)(0) <= '0';
wait for 10 ns;

S(0)(2) <= "10001";
--write
en_a(0)(2) <= '1';
en_b(0)(2) <= '1';
en_op(0)(2) <= '1';
wait for 10 ns;
--Read
en_a(0)(2) <= '0';
en_b(0)(2) <= '0';
en_op(0)(2) <= '0';

en_y(0)(2) <= '1';
wait for 20 ns;
en_y(0)(2) <= '0';
wait for 10 ns;

S(0)(3) <= "00011";
--write
en_a(0)(3) <= '1';
en_b(0)(3) <= '1';
en_op(0)(3) <= '1';
wait for 10 ns;
--Read
en_a(0)(3) <= '0';
en_b(0)(3) <= '0';
en_op(0)(3) <= '0';

en_y(0)(3) <= '1';
wait for 20 ns;
en_y(0)(3) <= '0';
wait for 10 ns;






MS(1)(2) <= '1'; 
MS(1)(3) <= '0'; 
MS(1)(0) <= '0'; 
MS(1)(1) <= '1'; 
MS(1)(4) <= '0'; 
MS(1)(5) <= '1'; 
MS(1)(6) <= '0'; 
MS(1)(7) <= '1'; 


S(1)(1) <= "00010";
--write
en_a(1)(1) <= '1';
en_b(1)(1) <= '1';
en_op(1)(1) <= '1';
wait for 10 ns;
--Read
en_a(1)(1) <= '0';
en_b(1)(1) <= '0';
en_op(1)(1) <= '0';

en_y(1)(1) <= '1';
wait for 20 ns;
en_y(1)(1) <= '0';
wait for 10 ns;


S(1)(0) <= "10100";
--write
en_a(1)(0) <= '1';
en_b(1)(0) <= '1';
en_op(1)(0) <= '1';
wait for 10 ns;
--Read
en_a(1)(0) <= '0';
en_b(1)(0) <= '0';
en_op(1)(0) <= '0';

en_y(1)(0) <= '1';
wait for 20 ns;
en_y(1)(0) <= '0';
wait for 10 ns;

S(1)(2) <= "00111";
--write
en_a(1)(2) <= '1';
en_b(1)(2) <= '1';
en_op(1)(2) <= '1';
wait for 10 ns;
--Read
en_a(1)(2) <= '0';
en_b(1)(2) <= '0';
en_op(1)(2) <= '0';

en_y(1)(2) <= '1';
wait for 20 ns;
en_y(1)(2) <= '0';
wait for 10 ns;

S(1)(3) <= "01101";
--write
en_a(1)(3) <= '1';
en_b(1)(3) <= '1';
en_op(1)(3) <= '1';
wait for 10 ns;
--Read
en_a(1)(3) <= '0';
en_b(1)(3) <= '0';
en_op(1)(3) <= '0';

en_y(1)(3) <= '1';
wait for 20 ns;
en_y(1)(3) <= '0';
wait for 10 ns;

wait for 100 ns;


--RUN 2
I <= ("0000","1011","0110","0000");
J <= ("1011","1011","0000","0001");

MS(0)(2) <= '1'; 
MS(0)(3) <= '0'; 
MS(0)(0) <= '1'; 
MS(0)(1) <= '0'; 
MS(0)(4) <= '1'; 
MS(0)(5) <= '0'; 
MS(0)(6) <= '0'; 
MS(0)(7) <= '1'; 


S(0)(1) <= "10010";
--write
en_a(0)(1) <= '1';
en_b(0)(1) <= '1';
en_op(0)(1) <= '1';
wait for 10 ns;
--Read
en_a(0)(1) <= '0';
en_b(0)(1) <= '0';
en_op(0)(1) <= '0';

en_y(0)(1) <= '1';
wait for 20 ns;
en_y(0)(1) <= '0';
wait for 10 ns;


S(0)(0) <= "00100";
--write
en_a(0)(0) <= '1';
en_b(0)(0) <= '1';
en_op(0)(0) <= '1';
wait for 10 ns;
--Read

en_a(0)(0) <= '0';
en_b(0)(0) <= '0';
en_op(0)(0) <= '0';

en_y(0)(0) <= '1';
wait for 20 ns;
en_y(0)(0) <= '0';
wait for 20 ns;


S(0)(2) <= "00110";
--write
en_a(0)(2) <= '1';
en_b(0)(2) <= '1';
en_op(0)(2) <= '1';
wait for 10 ns;
--Read
en_a(0)(2) <= '0';
en_b(0)(2) <= '0';
en_op(0)(2) <= '0';

en_y(0)(2) <= '1';
wait for 20 ns;
en_y(0)(2) <= '0';
wait for 10 ns;

S(0)(3) <= "01111";
--write
en_a(0)(3) <= '1';
en_b(0)(3) <= '1';
en_op(0)(3) <= '1';
wait for 10 ns;
--Read
en_a(0)(3) <= '0';
en_b(0)(3) <= '0';
en_op(0)(3) <= '0';

en_y(0)(3) <= '1';
wait for 20 ns;
en_y(0)(3) <= '0';
wait for 10 ns;


 
MS(1)(2) <= '1'; 
MS(1)(3) <= '0'; 
MS(1)(0) <= '1'; 
MS(1)(1) <= '0';
MS(1)(4) <= '0'; 
MS(1)(5) <= '1'; 
MS(1)(6) <= '1'; 
MS(1)(7) <= '0'; 


S(1)(1) <= "00011";
--write
en_a(1)(1) <= '1';
en_b(1)(1) <= '1';
en_op(1)(1) <= '1';
wait for 10 ns;
--Read
en_a(1)(1) <= '0';
en_b(1)(1) <= '0';
en_op(1)(1) <= '0';

en_y(1)(1) <= '1';
wait for 20 ns;
en_y(1)(1) <= '0';
wait for 10 ns;


S(1)(0) <= "01001";
--write
en_a(1)(0) <= '1';
en_b(1)(0) <= '1';
en_op(1)(0) <= '1';
wait for 10 ns;
--Read
en_a(1)(0) <= '0';
en_b(1)(0) <= '0';
en_op(1)(0) <= '0';

en_y(1)(0) <= '1';
wait for 20 ns;
en_y(1)(0) <= '0';
wait for 10 ns;

S(1)(2) <= "10100";
--write
en_a(1)(2) <= '1';
en_b(1)(2) <= '1';
en_op(1)(2) <= '1';
wait for 10 ns;
--Read
en_a(1)(2) <= '0';
en_b(1)(2) <= '0';
en_op(1)(2) <= '0';

en_y(1)(2) <= '1';
wait for 20 ns;
en_y(1)(2) <= '0';
wait for 10 ns;

S(1)(3) <= "00111";
--write
en_a(1)(3) <= '1';
en_b(1)(3) <= '1';
en_op(1)(3) <= '1';
wait for 10 ns;
--Read
en_a(1)(3) <= '0';
en_b(1)(3) <= '0';
en_op(1)(3) <= '0';

en_y(1)(3) <= '1';
wait for 20 ns;
en_y(1)(3) <= '0';
wait for 10 ns;


 
finish;
end process;
end Behavioral;
