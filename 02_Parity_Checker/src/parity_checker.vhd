library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity parity_checker is
    port (SW : in std_logic_vector(6 downto 0);
          LED : out std_logic_vector(3 downto 0));
end entity parity_checker;

architecture rtl of parity_checker is
    signal tx_parity, rx_parity, syndrome : std_logic;
    signal rx_data : std_logic_vector(3 downto 0);
begin
    tx_parity <= SW(3) xor SW(2) xor SW(1) xor SW(0);
    rx_data <= SW(3 downto 2) & (SW(1) xor SW(6)) & (SW(0) xor SW(4));
    rx_parity <= tx_parity xor SW(5);
    syndrome <= rx_data(3) xor rx_data(2) xor rx_data(1) xor rx_data(0) xor rx_parity;
    LED(0) <= tx_parity;
    LED(1) <= syndrome;
    LED(2) <= not syndrome;
    LED(3) <= rx_parity;
end architecture rtl;
