library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use std.env.finish; 

entity mux2_1_tb is
--  Port ( );
end mux2_1_tb;

architecture Behavioral of mux2_1_tb is
constant d_w_c: integer := 4;
signal I0s, I1s, Ys: std_logic_vector(d_w_c - 1 downto 0);
signal Sels: std_logic;

begin
dut: entity work.mux2_1(beh)
    Generic map(d_w => d_w_c)
    port map(I0 => I0s, I1 => I1s,Sel => Sels, Y => Ys);
    
stim: process
begin
I0s <= "1111"; I1s <= "0111"; 
Sels <= '0'; wait for 5ns;
Sels <= '1'; wait for 5ns;
finish;
end process;

end Behavioral;