library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity three_tank_controller is
    port (SW : in std_logic_vector(2 downto 0);
          LED : out std_logic_vector(0 downto 0));
end entity three_tank_controller;

architecture rtl of three_tank_controller is

begin
    -- Majority function in sum-of-products form.
    LED(0) <= (SW(2) and SW(1)) or (SW(2) and SW(0)) or (SW(1) and SW(0));
end architecture rtl;
