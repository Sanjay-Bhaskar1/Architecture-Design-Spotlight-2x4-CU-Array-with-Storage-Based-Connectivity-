----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/01/2025 10:03:21 AM
-- Design Name: 
-- Module Name: Main - Behavioral
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
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Main is
generic (d_w : integer := 4);
port (I, J : in vec_arr_1d(0 to 3)(d_w - 1 downto 0);
      Y : out vec_arr_1d(0 to 3)(d_w - 1 downto 0);
      S : in vec_arr_2d(0 to 1)(0 to 3)(d_w  downto 0);
      clk : in std_logic;
      MS : in vec_arr_2d2(0 to 1)(0 to 7);
      en_a,en_b,en_y,en_op : in vec_arr_2d2(0 to 1)(0 to 3)
      );
end Main;

architecture Behavioral of Main is
signal mo: vec_arr_2d(0 to 1)(0 to 7)(d_w - 1 downto 0);
signal ao, bo, yo, co : vec_arr_2d(0 to 1)(0 to 3)(d_w - 1 downto 0);
signal op : vec_arr_2d(0 to 1)(0 to 3)(4 downto 0);
signal gnd : std_logic_vector(d_w - 1 downto 0) := (others =>'0');
begin


--PART CU00
mux00 : entity work.mux2_1(beh)
port map(I0 => I(0) , I1 => yo(0)(1) , Sel => MS(0)(0) , Y => mo(0)(0) );
mux01 : entity work.mux2_1(Beh)
port map(I0 => J(0) , I1 => yo(0)(1) , Sel => MS(0)(1) , Y => mo(0)(1) );
A00 : entity work.Storage_unit(beh)
port map(D => mo(0)(0), w_en => en_a(0)(0) , clk => clk , Q => ao(0)(0));
B00 : entity work.Storage_unit(beh)
port map(D => mo(0)(1), w_en => en_b(0)(0) , clk => clk , Q => bo(0)(0));
storage_op00 : entity work.Storage_OP(Behavioral)
port map(D => S(0)(0), w_en => en_op(0)(0) , clk => clk , Q => op(0)(0));
CU00 : entity work.CU(Behavioral)
port map(A =>ao(0)(0) , B => bo(0)(0) , S => op(0)(0) , Y => co(0)(0) );
Y00 : entity work.Storage_unit(beh)
port map(D => co(0)(0), w_en => en_y(0)(0) , clk => clk , Q => yo(0)(0));


--PART CU01
mux02 : entity work.mux2_1(beh)
port map(I0 => Gnd , I1 => I(1) , Sel => MS(0)(2) , Y => mo(0)(2) );
mux03 : entity work.mux2_1(Beh)
port map(I0 => J(1) , I1 => Gnd , Sel => MS(0)(3) , Y => mo(0)(3) );
A01 : entity work.Storage_unit(beh)
port map(D => mo(0)(2), w_en => en_a(0)(1) , clk => clk , Q => ao(0)(1));
B01 : entity work.Storage_unit(beh)
port map(D => mo(0)(3), w_en => en_b(0)(1) , clk => clk , Q => bo(0)(1));
storage_op01 : entity work.Storage_OP(Behavioral)
port map(D => S(0)(1), w_en => en_op(0)(1) , clk => clk , Q => op(0)(1));
CU01 : entity work.CU(Behavioral)
port map(A =>ao(0)(1) , B => bo(0)(1) , S =>op(0)(1) , Y => co(0)(1) );
Y01 : entity work.Storage_unit(beh)
port map(D => co(0)(1), w_en => en_y(0)(1) , clk => clk , Q => yo(0)(1));


--PART CU02
mux04 : entity work.mux2_1(beh)
port map(I0 => yo(0)(1) , I1 =>I(2) , Sel => MS(0)(4) , Y => mo(0)(4) );
mux05 : entity work.mux2_1(Beh)
port map(I0 => yo(0)(1) , I1 =>J(2) , Sel => MS(0)(5) , Y => mo(0)(5) );
A02 : entity work.Storage_unit(beh)
port map(D => mo(0)(4), w_en => en_a(0)(2) , clk => clk , Q => ao(0)(2));
B02 : entity work.Storage_unit(beh)
port map(D => mo(0)(5), w_en => en_b(0)(2) , clk => clk , Q => bo(0)(2));
storage_op02 : entity work.Storage_OP(Behavioral)
port map(D => S(0)(2), w_en => en_op(0)(2) , clk => clk , Q => op(0)(2));
CU02 : entity work.CU(Behavioral)
port map(A =>ao(0)(2) , B => bo(0)(2) , S => op(0)(2) , Y => co(0)(2) );
Y02 : entity work.Storage_unit(beh)
port map(D => co(0)(2), w_en => en_y(0)(2) , clk => clk , Q => yo(0)(2));


--PART CU03
mux06 : entity work.mux2_1(beh)
port map(I0 => yo(0)(1) , I1 =>I(3) , Sel => MS(0)(6) , Y => mo(0)(6) );
mux07 : entity work.mux2_1(Beh)
port map(I0 => yo(0)(1) , I1 =>J(3) , Sel => MS(0)(7) , Y => mo(0)(7) );
A03 : entity work.Storage_unit(beh)
port map(D => mo(0)(6), w_en => en_a(0)(3) , clk => clk , Q => ao(0)(3));
B03 : entity work.Storage_unit(beh)
port map(D => mo(0)(7), w_en => en_b(0)(3) , clk => clk , Q => bo(0)(3));
storage_op03 : entity work.Storage_OP(Behavioral)
port map(D => S(0)(3), w_en => en_op(0)(3) , clk => clk , Q => op(0)(3));
CU03 : entity work.CU(Behavioral)
port map(A =>ao(0)(3) , B => bo(0)(3) , S => op(0)(3) , Y => co(0)(3) );
Y03 : entity work.Storage_unit(beh)
port map(D => co(0)(3), w_en => en_y(0)(3) , clk => clk , Q => yo(0)(3));


--PART CU10
mux10 : entity work.mux2_1(beh)
port map(I0 => yo(0)(0) , I1 =>yo(1)(1) , Sel => MS(1)(0) , Y => mo(1)(0) );
mux11 : entity work.mux2_1(Beh)
port map(I0 => yo(0)(0) , I1 =>yo(1)(1) , Sel => MS(1)(1) , Y => mo(1)(1) );
A10 : entity work.Storage_unit(beh)
port map(D => mo(1)(0), w_en => en_a(1)(0) , clk => clk , Q => ao(1)(0));
B10 : entity work.Storage_unit(beh)
port map(D => mo(1)(1), w_en => en_b(1)(0) , clk => clk , Q => bo(1)(0));
storage_op10 : entity work.Storage_OP(Behavioral)
port map(D => S(1)(0), w_en => en_op(1)(0) , clk => clk , Q => op(1)(0));
CU10 : entity work.CU(Behavioral)
port map(A =>ao(1)(0) , B => bo(1)(0) , S =>op(1)(0) , Y => co(1)(0) );
Y10 : entity work.Storage_unit(beh)
port map(D => co(1)(0), w_en => en_y(1)(0) , clk => clk , Q => yo(1)(0));


--PART CU11
mux12 : entity work.mux2_1(beh)
port map(I0 => Gnd , I1 =>yo(0)(1) , Sel => MS(1)(2) , Y => mo(1)(2) );
mux13 : entity work.mux2_1(Beh)
port map(I0 => yo(0)(1) , I1 =>Gnd , Sel => MS(1)(3) , Y => mo(1)(3) );
A11 : entity work.Storage_unit(beh)
port map(D => mo(1)(2), w_en => en_a(1)(1) , clk => clk , Q => ao(1)(1));
B11 : entity work.Storage_unit(beh)
port map(D => mo(1)(3), w_en => en_b(1)(1) , clk => clk , Q => bo(1)(1));
storage_op11 : entity work.Storage_OP(Behavioral)
port map(D => S(1)(1), w_en => en_op(1)(1) , clk => clk , Q => op(1)(1));
CU11 : entity work.CU(Behavioral)
port map(A =>ao(1)(1) , B => bo(1)(1) , S =>op(1)(1) , Y => co(1)(1));
Y11 : entity work.Storage_unit(beh)
port map(D => co(1)(1), w_en => en_y(1)(1) , clk => clk , Q => yo(1)(1));


--PART CU12
mux14 : entity work.mux2_1(beh)
port map(I0 => yo(1)(1) , I1 =>yo(0)(2) , Sel => MS(1)(4) , Y => mo(1)(4) );
mux15 : entity work.mux2_1(Beh)
port map(I0 => yo(1)(1) , I1 =>yo(0)(2) , Sel => MS(1)(5) , Y => mo(1)(5) );
A12 : entity work.Storage_unit(beh)
port map(D => mo(1)(4), w_en => en_a(1)(2) , clk => clk , Q => ao(1)(2));
B12 : entity work.Storage_unit(beh)
port map(D => mo(1)(5), w_en => en_b(1)(2) , clk => clk , Q => bo(1)(2));
storage_op12 : entity work.Storage_OP(Behavioral)
port map(D => S(1)(2), w_en => en_op(1)(2) , clk => clk , Q => op(1)(2));
CU12 : entity work.CU(Behavioral)
port map(A =>ao(1)(2) , B => bo(1)(2) , S =>op(1)(2) , Y => co(1)(2) );
Y12 : entity work.Storage_unit(beh)
port map(D => co(1)(2), w_en => en_y(1)(2) , clk => clk , Q => yo(1)(2));



--PART CU13
mux16 : entity work.mux2_1(beh)
port map(I0 => yo(1)(1) , I1 =>yo(0)(3) , Sel => MS(1)(6) , Y => mo(1)(6) );
mux17 : entity work.mux2_1(Beh)
port map(I0 => yo(1)(1) , I1 =>yo(0)(3) , Sel => MS(1)(7) , Y => mo(1)(7) );
A13 : entity work.Storage_unit(beh)
port map(D => mo(1)(6), w_en => en_a(1)(3) , clk => clk , Q => ao(1)(3));
B13 : entity work.Storage_unit(beh)
port map(D => mo(1)(7), w_en => en_b(1)(3) , clk => clk , Q => bo(1)(3));
storage_op13 : entity work.Storage_OP(Behavioral)
port map(D => S(1)(3), w_en => en_op(1)(3) , clk => clk , Q => op(1)(3));
CU13 : entity work.CU(Behavioral)
port map(A =>ao(1)(3) , B => bo(1)(3) , S =>op(1)(3) , Y => co(1)(3) );
Y13 : entity work.Storage_unit(beh)
port map(D => co(1)(3), w_en => en_y(1)(3) , clk => clk , Q => yo(1)(3));

Y(0) <= yo(1)(0);
Y(1) <= yo(1)(1);
Y(2) <= yo(1)(2);
Y(3) <= yo(1)(3);


end Behavioral;
