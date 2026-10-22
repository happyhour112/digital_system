library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity bcd_digit_valid is
    port(digit : in std_logic_vector(3 downto 0);
         valid : out std_logic);
end entity;
architecture rtl of bcd_digit_valid is
begin
    valid <= not (digit(3) and (digit(2) or digit(1)));
end architecture;
