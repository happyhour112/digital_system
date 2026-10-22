library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity bcd_validator is
    port (SW : in std_logic_vector(3 downto 0);
          LED : out std_logic_vector(2 downto 0));
end entity bcd_validator;

architecture rtl of bcd_validator is
    signal invalid_code : std_logic;
begin
    -- SW0 cannot change validity, but it can change the zero indication.
    invalid_code <= SW(3) and (SW(2) or SW(1));
    LED(0) <= not invalid_code;
    LED(1) <= invalid_code;
    LED(2) <= '1' when SW = "0000" else '0';
end architecture rtl;
