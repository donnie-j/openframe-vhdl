-- A simple VHDL module

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb is
end entity;

architecture beh of tb is
  signal a : std_logic_vector(3 downto 0);
  signal y : std_logic_vector(3 downto 0);
  signal clk : std_logic;
  signal rst : std_logic;

  component e is port (
    clk :  in std_logic;
    rst :  in std_logic;
    a :    in std_logic_vector(3 downto 0);
    y :   out std_logic_vector(3 downto 0));
  end component;
begin
  rst <= '0', '1' after 1 us;
  clk <= '1' after 100 ns when clk = '0' else '0' after 100 ns;

  a <= "1000", "0100" after 1350 ns, "0010" after 1450 ns, "0001" after 1550 ns;

  dut: e port map(clk => clk, rst => rst, a => a, y => y);
end;
