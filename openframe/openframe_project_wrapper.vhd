-- a simple OpenFrame VHDL top level

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.openframe_pack.all;

entity openframe_project_wrapper is port (
     porb_h           : in  std_logic;
     porb_l           : in  std_logic;
     por_l            : in  std_logic;
     resetb_h         : in  std_logic;
     resetb_l         : in  std_logic;
     mask_rev         : in  std_logic_vector(31 downto 0);

     gpio_in          : in  gpio_pad_t;
     gpio_in_h        : in  gpio_pad_t;
     gpio_out         : out gpio_pad_t;
     gpio_oeb         : out gpio_pad_t;
     gpio_inp_dis     : out gpio_pad_t;

     gpio_ib_mode_sel : out gpio_pad_t;
     gpio_vtrip_sel   : out gpio_pad_t;
     gpio_slow_sel    : out gpio_pad_t;
     gpio_holdover    : out gpio_pad_t;
     gpio_analog_en   : out gpio_pad_t;
     gpio_analog_sel  : out gpio_pad_t;
     gpio_analog_pol  : out gpio_pad_t;
     gpio_dm2         : out gpio_pad_t;
     gpio_dm1         : out gpio_pad_t;
     gpio_dm0         : out gpio_pad_t;

     analog_io        : inout gpio_pad_t;
     analog_noesd_io  : inout gpio_pad_t;

     gpio_loopback_zero   : in    gpio_pad_t;
     gpio_loopback_one    : in    gpio_pad_t);
end entity;

architecture top_level of openframe_project_wrapper is

component e is port (
  clk :  in std_logic;
  rst :  in std_logic;
  a :    in std_logic_vector(3 downto 0);
  y :   out std_logic_vector(3 downto 0));
end component;

signal clk       : std_logic;
signal rst       : std_logic;
signal a         : std_logic_vector(3 downto 0);
signal y         : std_logic_vector(3 downto 0);

begin
   -- Set all gpio pads to a simple tristate IO cell
   gpio_inp_dis     <= gpio_loopback_zero;
   gpio_ib_mode_sel <= gpio_loopback_zero;
   gpio_vtrip_sel   <= gpio_loopback_zero;
   gpio_slow_sel    <= gpio_loopback_zero;
   gpio_holdover    <= gpio_loopback_zero;
   gpio_analog_en   <= gpio_loopback_zero;
   gpio_analog_sel  <= gpio_loopback_zero;
   gpio_analog_pol  <= gpio_loopback_zero;

   -- The macro
   nx: e port map ( clk => clk, rst => rst, a => a, y => y );

   -- Connect it to the outside world
   gpio_out(31) <= y(0);        gpio_oeb(31) <= '0';
   gpio_out(32) <= y(1);        gpio_oeb(32) <= '0';
   gpio_out(33) <= y(2);        gpio_oeb(33) <= '0';
   gpio_out(34) <= y(3);        gpio_oeb(34) <= '0';

   rst <= gpio_in(43);          gpio_oeb(43) <= '1';
   clk <= gpio_in( 0);          gpio_oeb( 0) <= '1';

   a(0)      <= gpio_in( 2);    gpio_oeb( 2) <= '1';
   a(1)      <= gpio_in( 3);    gpio_oeb( 3) <= '1';
   a(2)      <= gpio_in( 4);    gpio_oeb( 4) <= '1';
   a(3)      <= gpio_in( 5);    gpio_oeb( 5) <= '1';
end top_level;
