-- A simple VHDL module

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity e is port (
  clk :  in std_logic;
  rst :  in std_logic;
  a :    in std_logic_vector(3 downto 0);
  y :   out std_logic_vector(3 downto 0));
end entity;

architecture beh of e is
begin
  y <= (others => '0') when rst = '0' else
       a when clk'event and clk = '1';
end;
