library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity tb_bcd_validator is end entity;
architecture simulation of tb_bcd_validator is
    signal SW : std_logic_vector(3 downto 0) := (others => '0');
    signal LED : std_logic_vector(2 downto 0);
begin
    dut : entity work.bcd_validator(rtl) port map(SW => SW, LED => LED);
    check_every_binary_input : process
        variable expected : std_logic_vector(2 downto 0);

    begin
        for n in 0 to 15 loop
            SW <= std_logic_vector(to_unsigned(n, 4));
            -- Simulation pacing only. RTL contains no time delays.
            wait for 10 ns;
            expected := (others => '0');
            if n <= 9 then expected(0) := '1'; else expected(1) := '1'; end if;
            if n = 0 then expected(2) := '1'; end if;
            assert LED = expected
                report "FAIL bcd_validator input=" & integer'image(n) &
                       " expected=" & to_hstring(expected) & " actual=" & to_hstring(LED)
                severity failure;
        end loop;
        report "PASS bcd_validator: 16 binary combinations" severity note;
        wait;
    end process;
end architecture;
