--                                                                            --
-- Author(s):                                                                 --
--   Miguel Angel Sagreras                                                    --
--                                                                            --
-- Copyright (C) 2015                                                         --
--    Miguel Angel Sagreras                                                   --
--                                                                            --
-- This source file may be used and distributed without restriction provided  --
-- that this copyright statement is not removed from the file and that any    --
-- derivative work contains  the original copyright notice and the associated --
-- disclaimer.                                                                --
--                                                                            --
-- This source file is free software; you can redistribute it and/or modify   --
-- it under the terms of the GNU General Public License as published by the   --
-- Free Software Foundation, either version 3 of the License, or (at your     --
-- option) any later version.                                                 --
--                                                                            --
-- This source is distributed in the hope that it will be useful, but WITHOUT --
-- ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or      --
-- FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for   --
-- more details at http://www.gnu.org/licenses/.                              --
--                                                                            --

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library hdl4fpga;
use hdl4fpga.std.all;

entity miirx_pre is
    port (
		mii_rxc  : in std_logic;
        mii_rxdv : in std_logic;
        mii_rxd  : in std_logic_vector;

		mii_txc  : out std_logic;
		mii_txen : out std_logic);

end;

architecture def of miirx_pre is
	signal txen : std_logic;

begin

	mii_txc  <= mii_rxc;
	mii_txen <= mii_rxdv and txen;

	process (mii_rxc)
		variable prdy : std_logic;
		variable rxd : std_logic_vector(mii_rxd'range);
		variable d : std_logic_vector(0 to 4-1);
	begin
		rxd := mii_rxd;
		if rising_edge(mii_rxc) then
			if mii_rxdv='0' then
				prdy := '0';
				txen <= '0';
			elsif prdy='0' then
				for i in 0 to mii_rxd'length/d'length-1 loop
					if d=reverse(x"5") then
						prdy := '0';
						txen <= '0';
					elsif d=reverse(x"d") then
						prdy := '1';
						txen <= '1';
						exit;
					else
						prdy := '1';
						txen <= '0';
						exit;
					end if;
				end loop;
			end if;
		end if;
	end process;
end;
