----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/01/2025 09:38:29 AM
-- Design Name: 
-- Module Name: CU - Behavioral
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


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity CU is
generic (d_w : integer := 4);
port  ( a,b : in std_logic_vector( d_w-1 downto 0);
    s: in std_logic_vector(d_w downto 0);
    y: out std_logic_vector( d_w-1 downto 0)
    );
end CU;

architecture Behavioral of CU is
begin

proc : process(a,b,s)
variable mult_full :std_logic_vector(2*d_w-1 downto 0);

begin
 case s is
 when "00000" =>
 y <= a and b;
 
 when "00001" =>
 y <= a or b;
 
 when "00010" =>
 y <= a nand b;
 
 when "00011" =>
 y <= a nor b;
 
 when "00100" =>
  y <= a xor b;
  
 when "00101" =>
  y <= a xnor b;
  
 when "00110" =>
 y <= std_logic_vector(unsigned(a) + unsigned(b));
 
 when "00111" =>
 y <= std_logic_vector(unsigned(a) - unsigned(b));
 
 when "01000" =>
 mult_full := std_logic_vector (unsigned(a)*unsigned(b));
 y <= mult_full(d_w-1 downto 0); 
 
 when "01001" =>
if  (a<b) then
y <= "1111";
else 
y <= "0000";
end if;

 when "01010" =>
if  (a<=b) then
y <= "1111";
else 
y <= "0000";
end if;

 when "01011" =>
if  (a>b) then
y <= "1111";
else 
y <= "0000";
end if;

 when "01100" =>
if  (a>=b) then
y <= "1111";
else 
y <= "0000";
end if;

 when "01101" =>
if  (a=b) then
y <= "1111";
else 
y <= "0000";
end if;

 when "01110" =>
if  (a/=b) then
y <= "1111";
else 
y <= "0000";
end if;

when "01111" =>
y<= to_stdlogicvector(to_bitvector(a) sla to_integer(unsigned(b)));

when "10000" =>
y<= to_stdlogicvector(to_bitvector(a) sra to_integer(unsigned(b)));

when "10001" =>
y<= to_stdlogicvector(to_bitvector(a) sll to_integer(unsigned(b)));

when "10010" =>
y<= to_stdlogicvector(to_bitvector(a) srl to_integer(unsigned(b)));

when "10011" =>
y<= to_stdlogicvector(to_bitvector(a) rol to_integer(unsigned(b)));

when "10100" =>
y<= to_stdlogicvector(to_bitvector(a) ror to_integer(unsigned(b)));

when "10101" =>
y <= a;

when "10110" =>
y <= b;

when "10111" =>
y <= (others => 'U');

when others =>
y <= "1111";

end case;
end process;

end Behavioral;
