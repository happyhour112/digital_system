library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity magnitude_comparator is
    port (SW : in std_logic_vector(7 downto 0);
          LED : out std_logic_vector(2 downto 0));
end entity magnitude_comparator;

architecture rtl of magnitude_comparator is
    signal a_value, b_value : unsigned(3 downto 0);
begin
    a_value <= unsigned(SW(3 downto 0));
    b_value <= unsigned(SW(7 downto 4));
    LED(0) <= '1' when a_value = b_value else '0';
    LED(1) <= '1' when a_value > b_value else '0';
    LED(2) <= '1' when a_value < b_value else '0';
end architecture rtl;
