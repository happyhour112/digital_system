library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity priority_alarm is
    port (SW : in std_logic_vector(2 downto 0);
          LED : out std_logic_vector(4 downto 0));
end entity priority_alarm;

architecture rtl of priority_alarm is

begin
    select_alarm : process(all)
    begin
        -- Complete default also defines the no-alarm condition.
        LED <= (others => '0');
        if SW(2) = '1' then
            LED <= "11100";
        elsif SW(1) = '1' then
            LED <= "10010";
        elsif SW(0) = '1' then
            LED <= "01001";
        end if;
    end process;
end architecture rtl;
