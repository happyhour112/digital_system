library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity three_tank_process is
    port (SW : in std_logic_vector(2 downto 0);
          LED : out std_logic_vector(0 downto 0));
end entity three_tank_process;

architecture rtl of three_tank_process is

begin
    count_low_levels : process(all)
        variable count_low : integer range 0 to 3;
    begin
        count_low := 0;
        for i in 0 to 2 loop
            if SW(i) = '1' then
                count_low := count_low + 1;
            end if;
        end loop;
        if count_low >= 2 then
            LED(0) <= '1';
        else
            LED(0) <= '0';
        end if;
    end process;
end architecture rtl;
