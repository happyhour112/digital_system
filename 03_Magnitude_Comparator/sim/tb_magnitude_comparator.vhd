library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity tb_magnitude_comparator is end entity;
architecture simulation of tb_magnitude_comparator is
    signal SW : std_logic_vector(7 downto 0) := (others => '0');
    signal LED : std_logic_vector(2 downto 0);
begin
    dut : entity work.magnitude_comparator(rtl) port map(SW => SW, LED => LED);
    check_every_binary_input : process
        variable expected : std_logic_vector(2 downto 0);
        variable a_number, b_number : integer;
    begin
        for n in 0 to 255 loop
            SW <= std_logic_vector(to_unsigned(n, 8));
            -- Simulation pacing only. RTL contains no time delays.
            wait for 10 ns;
            expected := (others => '0');
            a_number := n mod 16;
            b_number := n / 16;
            if a_number = b_number then expected(0) := '1';
            elsif a_number > b_number then expected(1) := '1';
            else expected(2) := '1'; end if;
            assert LED = expected
                report "FAIL magnitude_comparator input=" & integer'image(n) &
                       " expected=" & to_hstring(expected) & " actual=" & to_hstring(LED)
                severity failure;
        end loop;
        report "PASS magnitude_comparator: 256 binary combinations" severity note;
        wait;
    end process;
end architecture;
