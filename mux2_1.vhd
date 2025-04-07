library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux2_1 is
generic (d_w: integer:= 4);
port(I0, I1: in std_logic_vector(d_w - 1 downto 0);
Sel: in std_logic;
Y: out std_logic_vector(d_w - 1 downto 0)); 
end mux2_1;

architecture beh of mux2_1 is

begin
mux4_1: process(I0, I1, Sel)
begin
case Sel is
    when '0' => Y <= I0;
    when '1' => Y <= I1;
    when others => Y <= (others => 'Z');
end case;

end process;

end beh;