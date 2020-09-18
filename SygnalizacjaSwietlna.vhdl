library ieee;
 use ieee.std_logic_1164.all;
 use ieee.std_logic_unsigned.all;

entity lego is 
port(

i_clock : in std_logic;

o_redDown : out std_logic;
o_greenDown : out std_logic;
o_yellowDown : out std_logic;
o_pgreenDown :out std_logic;
o_predDown :out std_logic;
o_sgreenDown :out std_logic;
i_buttonDown : in std_logic;

o_redRight : out std_logic;
o_greenRight : out std_logic;
o_yellowRight : out std_logic;
o_pgreenRight :out std_logic;
o_predRight :out std_logic;
o_sgreenRight :out std_logic;
i_buttonRight  : in std_logic

);
end lego;

architecture rtl of lego is

signal counter : natural :=0;
signal counterPiesi : natural :=0;
signal ZieloneDown :std_logic := '1';
signal ZieloneRight :std_logic := '1';
signal ZolteRight :std_logic := '1';
signal ZolteDown :std_logic := '1';
signal CzerwoneRight :std_logic := '1';
signal CzerwoneDown :std_logic := '1';
signal PCzerwoneDown :std_logic := '1';
signal PZieloneDown :std_logic := '1';
signal PCzerwoneRight :std_logic := '1';
signal PZieloneRight :std_logic := '0';

begin

process (i_clock)
begin
  if rising_edge(i_clock) then
   if(counter = 250000000) then --czerwone prawo
	 CzerwoneRight <= '1';
    ZieloneRight <= '0';
    ZolteRight <= '0';
	 CzerwoneDown  <= '0';
   ZieloneDown  <= '1';
    ZolteDown  <= '0';
	PCzerwoneDown <= '0';
PZieloneDown <= '1';
PCzerwoneRight <= '1';
PZieloneRight <= '0';
	 counter <= counter+1;
	
	elsif (counter = 500000000) then --zólte
	CzerwoneRight <= '1';
	 ZolteRight <= '1';
    ZieloneRight <= '0';
    CzerwoneDown  <= '0';
    ZolteDown  <= '1';
	 ZieloneDown  <= '0';
	 PCzerwoneDown  <= '1';
 PZieloneDown <= '0';
PCzerwoneRight <= '1';
PZieloneRight <= '0';
	 
	 counter <= counter+1;
	 
	 
	 elsif (counter = 750000000) then --czerwone lewo
	CzerwoneRight <= '0';
    ZolteRight <= '0';
	 ZieloneRight <= '1';
	 CzerwoneDown  <= '1';
   ZieloneDown  <= '0';
    ZolteDown  <= '0';
	 PCzerwoneDown <= '1';
 PZieloneDown <= '0';
PCzerwoneRight <= '0';

PZieloneRight <= '1';
	 counter <= counter+1;
	
	 
	 elsif (counter = 1000000000) then --zólte
	CzerwoneRight <= '0';
	 ZolteRight <= '1';
    ZieloneRight <= '0';
    CzerwoneDown  <= '1';
    ZolteDown  <= '1';
	 ZieloneDown  <= '0';
	 PCzerwoneDown <= '1';
 PZieloneDown <= '0';
PCzerwoneRight <= '1';
PZieloneRight <= '0';
	 
	 counter <= 0;
	 
	 
	 else 
   counter <= counter+1;
  
  end if;
  end if;
  
  

end process;



o_redDown <= CzerwoneDown;
o_greenDown <= ZieloneDown;
o_yellowDown <=ZolteDown;
o_redRight <= CzerwoneRight;
o_greenRight <= ZieloneRight;
o_yellowRight <= ZolteRight;
o_pgreenRight <= PZieloneRight;
o_predRight <= PCzerwoneRight;
o_pgreenDown <= PZieloneDown;
o_predDown <= PCzerwoneDown;


end rtl;
