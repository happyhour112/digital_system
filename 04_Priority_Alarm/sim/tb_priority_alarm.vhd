library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity tb_priority_alarm is end entity;
architecture simulation of tb_priority_alarm is
    signal SW : std_logic_vector(2 downto 0) := (others => '0');
    signal LED : std_logic_vector(4 downto 0);
begin
    dut : entity work.priority_alarm(rtl) port map(SW => SW, LED => LED);
    check_every_binary_input : process
        variable expected : std_logic_vector(4 downto 0);

    begin
        for n in 0 to 7 loop
            SW <= std_logic_vector(to_unsigned(n, 3));
            -- Simulation pacing only. RTL contains no time delays.
            wait for 10 ns;
            expected := (others => '0');
            -- Decide the greatest active severity from the integer input.
            if n >= 4 then expected := "11100";
            elsif n >= 2 then expected := "10010";
            elsif n = 1 then expected := "01001"; end if;
            assert LED = expected
                report "FAIL priority_alarm input=" & integer'image(n) &
                       " expected=" & to_hstring(expected) & " actual=" & to_hstring(LED)
                severity failure;
        end loop;
        report "PASS priority_alarm: 8 binary combinations" severity note;
        wait;
    end process;
end architecture;
