----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/06/2024 10:16:12 AM
-- Design Name: 
-- Module Name: custom_pack - Behavioral
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

package custom_pack is 
type gate_oper is (ANDo, ORo, XORo, XNORo, NORo, NANDo, MULT);
type gate_arr_1d is array(natural range<>) of gate_oper;
type gate_arr_2d is array(natural range<>) of gate_arr_1d;


subtype dim1 is std_logic_vector;
type vec_arr_1d is array(natural range<>) of dim1;
type vec_arr_2d is array(natural range<>) of vec_arr_1d;

subtype dim2 is std_logic;
type vec_arr_1d2 is array(natural range<>) of dim2;
type vec_arr_2d2 is array(natural range<>) of vec_arr_1d2;

end package custom_pack;
