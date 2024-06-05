-- An package for the OpenFrame thing.

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package openframe_pack is

   constant OPENFRAME_IO_PADS : natural := 44;

   subtype gpio_pad_t is std_logic_vector(OPENFRAME_IO_PADS-1 downto 0);

   component openframe_project_wrapper is port (
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

     analog_io        : out gpio_pad_t;
     analog_noesd_io  : out gpio_pad_t;

     gpio_loopback_zero   : out gpio_pad_t;
     gpio_loopback_one    : out gpio_pad_t);
   end component;
end package;

