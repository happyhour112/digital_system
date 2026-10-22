library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity tb_parity_checker is end entity;
architecture simulation of tb_parity_checker is
    signal SW : std_logic_vector(6 downto 0) := (others => '0');
    signal LED : std_logic_vector(3 downto 0);
    signal alternate_led : std_logic_vector(3 downto 0);
begin
    dut : entity work.parity_checker(rtl) port map(SW => SW, LED => LED);
    alternative : entity work.parity_checker_process(rtl) port map(SW => SW, LED => alternate_led);
    check_every_binary_input : process
        variable expected : std_logic_vector(3 downto 0);
        variable data_number, ones, parity_number, flips : integer;
    begin
        for n in 0 to 127 loop
            SW <= std_logic_vector(to_unsigned(n, 7));
            -- Simulation pacing only. RTL contains no time delays.
            wait for 10 ns;
            expected := (others => '0');
            data_number := n mod 16;
            ones := 0;
            for i in 0 to 3 loop
                if (data_number / (2**i)) mod 2 = 1 then ones := ones + 1; end if;
            end loop;
            parity_number := ones mod 2;
            if parity_number = 1 then expected(0) := '1'; end if;
            if (n / 32) mod 2 = 1 then parity_number := 1 - parity_number; end if;
            if parity_number = 1 then expected(3) := '1'; end if;
            -- Count inversions in the independent error mask.
            flips := (n / 16) mod 2 + (n / 32) mod 2 + (n / 64) mod 2;
            if flips mod 2 = 1 then expected(1) := '1'; else expected(2) := '1'; end if;
            assert LED = expected
                report "FAIL parity_checker input=" & integer'image(n) &
                       " expected=" & to_hstring(expected) & " actual=" & to_hstring(LED)
                severity failure;
            assert LED = alternate_led report "Equivalent implementations differ" severity failure;
        end loop;
        report "PASS parity_checker: 128 binary combinations" severity note;
        wait;
    end process;
end architecture;
