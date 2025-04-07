----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/06/2024 01:28:10 PM
-- Design Name: 
-- Module Name: storage_unit - beh
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity storage_unit is
generic (d_w: integer:= 4);
  Port (
  D: in std_logic_vector(d_w - 1 downto 0);
  w_en, clk: in std_logic;
  Q: out std_logic_vector(d_w - 1 downto 0)
   );
end storage_unit;

architecture beh of storage_unit is

signal stored_data: std_logic_vector(d_w - 1 downto 0);

begin

store: process(D, w_en, clk)
begin

if(rising_edge(clk)) then
    if(w_en = '1') then --write mode
        stored_data <= D;
    elsif(w_en = '0') then -- read mode
        Q <= stored_data;
    end if;
end if;

end process store;

end beh;
