library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity parity_checker_process is
    port (SW : in std_logic_vector(6 downto 0);
          LED : out std_logic_vector(3 downto 0));
end entity parity_checker_process;

architecture rtl of parity_checker_process is

begin
    calculate : process(all)
        variable tx, received_p, check_bit : std_logic;
        variable received_d : std_logic_vector(3 downto 0);
    begin
        -- Assign each variable before reading it on every activation.
        tx := SW(3) xor SW(2) xor SW(1) xor SW(0);
        received_d := SW(3 downto 2) & (SW(1) xor SW(6)) & (SW(0) xor SW(4));
        received_p := tx xor SW(5);
        check_bit := received_d(3) xor received_d(2) xor received_d(1) xor received_d(0) xor received_p;
        LED(0) <= tx;
        LED(1) <= check_bit;
        LED(2) <= not check_bit;
        LED(3) <= received_p;
    end process;
end architecture rtl;
