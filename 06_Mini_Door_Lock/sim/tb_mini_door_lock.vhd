library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity tb_mini_door_lock is end entity;
architecture simulation of tb_mini_door_lock is
    signal SW : std_logic_vector(15 downto 0) := (others => '0');
    signal LED : std_logic_vector(2 downto 0);
begin
    dut : entity work.mini_door_lock(rtl) port map(SW => SW, LED => LED);
    check_every_binary_input : process
        variable expected : std_logic_vector(2 downto 0);
        variable digit_number : integer;
        variable valid_number : boolean;
    begin
        for n in 0 to 65535 loop
            SW <= std_logic_vector(to_unsigned(n, 16));
            -- Simulation pacing only. RTL contains no time delays.
            wait for 10 ns;
            expected := (others => '0');
            valid_number := true;
            for i in 0 to 3 loop
                digit_number := (n / (16**i)) mod 16;
                if digit_number > 9 then valid_number := false; end if;
            end loop;
            -- Decimal 9600 is hexadecimal 2580, the packed BCD constant.
            if valid_number and n = 9600 then expected(0) := '1';
            else expected(1) := '1'; end if;
            if not valid_number then expected(2) := '1'; end if;
            assert LED = expected
                report "FAIL mini_door_lock input=" & integer'image(n) &
                       " expected=" & to_hstring(expected) & " actual=" & to_hstring(LED)
                severity failure;
        end loop;
        report "PASS mini_door_lock: 65536 binary combinations" severity note;
        wait;
    end process;
end architecture;
