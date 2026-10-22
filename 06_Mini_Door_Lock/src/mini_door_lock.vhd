library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mini_door_lock is
    port (SW : in std_logic_vector(15 downto 0);
          LED : out std_logic_vector(2 downto 0));
end entity mini_door_lock;

architecture rtl of mini_door_lock is
    -- Four BCD nibbles, not binary integer 2580.
    constant PASSWORD : std_logic_vector(15 downto 0) := x"2580";
    signal valid_digit : std_logic_vector(3 downto 0);
    signal all_valid, match_code, correct_code : std_logic;
begin
    -- Each instance validates one simultaneous input digit.
    digit_3 : entity work.bcd_digit_valid(rtl)
        port map(digit => SW(15 downto 12), valid => valid_digit(3));
    digit_2 : entity work.bcd_digit_valid(rtl)
        port map(digit => SW(11 downto 8), valid => valid_digit(2));
    digit_1 : entity work.bcd_digit_valid(rtl)
        port map(digit => SW(7 downto 4), valid => valid_digit(1));
    digit_0 : entity work.bcd_digit_valid(rtl)
        port map(digit => SW(3 downto 0), valid => valid_digit(0));
    all_valid <= valid_digit(3) and valid_digit(2) and valid_digit(1) and valid_digit(0);
    match_code <= '1' when SW = PASSWORD else '0';
    correct_code <= all_valid and match_code;
    LED(0) <= correct_code;
    LED(1) <= not correct_code;
    LED(2) <= not all_valid;
end architecture rtl;
