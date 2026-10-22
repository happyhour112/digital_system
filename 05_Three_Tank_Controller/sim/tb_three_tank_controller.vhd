library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity tb_three_tank_controller is end entity;
architecture simulation of tb_three_tank_controller is
    signal SW : std_logic_vector(2 downto 0) := (others => '0');
    signal LED : std_logic_vector(0 downto 0);
    signal alternate_led : std_logic_vector(0 downto 0);
    signal active_low_led : std_logic_vector(0 downto 0);
begin
    dut : entity work.three_tank_controller(rtl) port map(SW => SW, LED => LED);
    alternative : entity work.three_tank_process(rtl) port map(SW => SW, LED => alternate_led);
    polarity_variant : entity work.three_tank_active_low(rtl) port map(SW => not SW, LED => active_low_led);
    check_every_binary_input : process
        variable expected : std_logic_vector(0 downto 0);
        variable ones : integer;
    begin
        for n in 0 to 7 loop
            SW <= std_logic_vector(to_unsigned(n, 3));
            -- Simulation pacing only. RTL contains no time delays.
            wait for 10 ns;
            expected := (others => '0');
            ones := 0;
            for i in 0 to 2 loop
                if (n / (2**i)) mod 2 = 1 then ones := ones + 1; end if;
            end loop;
            if ones >= 2 then expected(0) := '1'; end if;
            assert LED = expected
                report "FAIL three_tank_controller input=" & integer'image(n) &
                       " expected=" & to_hstring(expected) & " actual=" & to_hstring(LED)
                severity failure;
            assert LED = alternate_led report "Equivalent implementations differ" severity failure;
            assert active_low_led = expected report "Active-low polarity conversion failed" severity failure;
        end loop;
        report "PASS three_tank_controller: 8 binary combinations" severity note;
        wait;
    end process;
end architecture;
