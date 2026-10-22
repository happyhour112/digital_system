library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity three_tank_active_low is
    port (SW : in std_logic_vector(2 downto 0);
          LED : out std_logic_vector(0 downto 0));
end entity three_tank_active_low;

architecture rtl of three_tank_active_low is
    signal low_level : std_logic_vector(2 downto 0);
begin
    -- In this variant a sensor value of 0 means LOW LIQUID LEVEL.
    low_level <= not SW;
    LED(0) <= (low_level(2) and low_level(1)) or
              (low_level(2) and low_level(0)) or
              (low_level(1) and low_level(0));
end architecture rtl;
