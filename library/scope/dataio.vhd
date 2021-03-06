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

entity dataio is
	generic (
		PAGE_SIZE    : natural :=  9;
		DDR_BANKSIZE : natural :=  2;
		DDR_ADDRSIZE : natural := 13;
		DDR_CLNMSIZE : natural :=  6;
		DDR_LINESIZE : natural := 16;
		DDR_TESTCORE : boolean := FALSE);
	port (
		sys_rst      : in std_logic;

		input_clk    : in  std_logic;
		input_req    : out std_logic := '1';
		input_rdy    : in  std_logic;
		input_data   : in  std_logic_vector;

		ddrs_clk     : in  std_logic;
		ddrs_rreq    : in  std_logic;
		ddrs_creq    : out std_logic;
		ddrs_crdy    : in  std_logic;

		ddrs_bnka    : out std_logic_vector(DDR_BANKSIZE-1 downto 0);
		ddrs_rowa    : out std_logic_vector(DDR_ADDRSIZE-1 downto 0);
		ddrs_cola    : out std_logic_vector(DDR_ADDRSIZE-1 downto 0);

		ddrs_act     : in  std_logic;
		ddrs_cas     : in  std_logic;
		ddrs_rw      : out std_logic;

		ddrs_di_req  : in  std_logic;
		ddrs_di_rdy  : out std_logic;
		ddrs_di      : out std_logic_vector;
		ddrs_do_rdy  : in  std_logic;
		ddrs_do      : in  std_logic_vector;
		
		mii_rst      : in  std_logic;
		mii_txc      : in  std_logic;
		ddr2mii_req  : in  std_logic;
		ddr2mii_rdy  : out std_logic;
		miitx_req    : in  std_logic;
		miitx_rdy    : out std_logic;
		miitx_ena    : out std_logic;
		miitx_dat    : out std_logic_vector);
end;


architecture def of dataio is
	subtype aword is std_logic_vector(DDR_BANKSIZE+1+DDR_ADDRSIZE+1+DDR_CLNMSIZE+1-1 downto 0);

	signal capture_rdy : std_logic;

	signal datai_brst_req : std_logic;
	signal ddr2miitx_brst_req : std_logic;

	signal miitx_gnt : std_logic;
	signal datai_req : std_logic;

	function g (
		constant size : natural)
		return std_logic_vector is
		constant g32  : std_logic_vector(32  downto 1) := (32  => '1', 30  => '1', 26  => '1', 25  => '1', others => '0');
		constant g64  : std_logic_vector(64  downto 1) := (64  => '1', 63  => '1', 61  => '1', 60  => '1', others => '0');
		constant g128 : std_logic_vector(128 downto 1) := (128 => '1', 127 => '1', 126 => '1', 121 => '1', others => '0');
	begin
		case size is
		when 32 =>
			return g32;
		when 64 =>
			return g64;
		when others =>
			return g128;
		end case;
	end;

	signal lfsr_rst  : std_logic;
	signal lfsr_data : std_logic_vector(ddrs_di'range);
	signal output_data : std_logic_vector(ddrs_di'range);
begin

	process (input_clk)
	begin
		if rising_edge(input_clk) then
			if sys_rst='1' then
				datai_req <= '0';
			elsif input_rdy='0' then
				datai_req <= '0';
			else
				datai_req <= not capture_rdy;
			end if;
		end if;
	end process;

	datai_e : entity hdl4fpga.datai
	port map (
		input_clk   => input_clk,
		input_req   => datai_req, 
		input_data  => input_data,

		output_clk  => ddrs_clk,
		output_rdy  => datai_brst_req,
		output_req  => ddrs_di_req,
		output_data => output_data);

	lfsr_rst <= not datai_req; -- or sys_rst;
	dataii_e : entity hdl4fpga.lfsr_gen
	generic map (
		g   => g(input_data'length))
	port map (
		clk => ddrs_clk,
		rst => lfsr_rst,
		req => ddrs_di_req, 
		so  => lfsr_data);
	ddrs_di <= lfsr_data when DDR_TESTCORE else output_data;

	ddrs_di_rdy <= ddrs_di_req;

	input_req <= datai_req;
	ddrio_b: block
		signal ddrs_breq : std_logic;
		signal ddrs_addr : std_logic_vector(DDR_BANKSIZE+1+DDR_ADDRSIZE+1+DDR_CLNMSIZE downto 0);

		signal qo   : std_logic_vector(DDR_BANKSIZE+1+DDR_ADDRSIZE+1+DDR_CLNMSIZE downto 0);
		signal co   : std_logic_vector(0 to 3-1);
		signal crst : std_logic;
		signal creq : std_logic;
		signal crdy : std_logic;

	begin

		process (ddrs_clk)
		begin
			if rising_edge(ddrs_clk) then
				if sys_rst='1' then
					capture_rdy <= '0';
				elsif input_rdy='0' then
					capture_rdy <= '0';
				elsif capture_rdy='0' then
					capture_rdy <= co(0);
				else
					capture_rdy <= '1';
				end if;
			end if;
		end process;

		process (ddrs_clk)
		begin
			if rising_edge(ddrs_clk) then
				if ddrs_crdy='1' then
					ddrs_rw  <= capture_rdy;
				end if;
			end if;
		end process;

		process (datai_brst_req, ddrs_clk)
			variable q : std_logic;
		begin
			ddrs_breq <= datai_brst_req or q;
			if rising_edge(ddrs_clk) then
				q := ddr2miitx_brst_req;
			end if;
		end process;

		ddrs_addr <= std_logic_vector(
			to_signed(2**DDR_BANKSIZE-1, DDR_BANKSIZE+1) & 
			to_signed(2**DDR_ADDRSIZE-1, DDR_ADDRSIZE+1) & 
			to_signed(2**DDR_CLNMSIZE-1, DDR_CLNMSIZE+1));
--			to_signed(0, DDR_BANKSIZE+1) & 
--			to_signed(0, DDR_ADDRSIZE+1) & 
--			to_signed(7, DDR_CLNMSIZE+1));

		creq <= 
		'1' when sys_rst='1'   else
		'1' when ddrs_rreq='1' else
		'1' when ddrs_breq='0' else
		'0';

		crdy <=
		'0' when sys_rst='1' else
		'0' when ddrs_rreq='1' else
		'0' when qo(ddr_clnmsize)='1' else
	   	ddrs_breq when ddrs_crdy='1' else
		'0';

		process (ddrs_clk, qo(ddr_clnmsize))
			variable q : std_logic;
		begin
			if qo(ddr_clnmsize)='1' then
				ddrs_creq <= '0';
			elsif rising_edge(ddrs_clk) then
				if creq='1' then
					ddrs_creq <= '0';
				elsif crdy='1' then
					ddrs_creq <= '1';
				end if;
			end if;
		end process;

		process (ddrs_clk)
		begin
			if rising_edge(ddrs_clk) then
				if ddrs_act='1' then
					ddrs_bnka <= std_logic_vector(resize(shift_right(unsigned(qo),1+DDR_ADDRSIZE+1+DDR_CLNMSIZE), DDR_BANKSIZE)); 
				end if;
				ddrs_cola <= std_logic_vector(resize(resize(shift_left (unsigned(qo), 3), DDR_CLNMSIZE+3), DDR_ADDRSIZE)); 
				ddrs_rowa <= std_logic_vector(resize(shift_right(unsigned(qo),1+DDR_CLNMSIZE), DDR_ADDRSIZE)); 
			end if;
		end process;

		crst <= sys_rst or co(0);
		dcounter_e : entity hdl4fpga.counter
		generic map (
			stage_size => (
				2 => DDR_BANKSIZE+1+DDR_ADDRSIZE+1+DDR_CLNMSIZE+1,
				1 => DDR_ADDRSIZE+1+DDR_CLNMSIZE+1,
				0 => DDR_CLNMSIZE+1))
		port map (
			clk  => ddrs_clk,
			load => crst,
			ena  => ddrs_cas,
			data => ddrs_addr,
			qo   => qo,
			co   => co);
						 
	end block;

	process (ddrs_clk)
	begin
		if rising_edge(ddrs_clk) then
			miitx_gnt <= capture_rdy;
		end if;
	end process;

	miitxmem_e : entity hdl4fpga.miitxmem
	generic map (
		bram_size => unsigned_num_bits(2**page_size*32/DDR_LINESIZE-1),
		data_size => DDR_LINESIZE)
	port map (
		ddrs_clk => ddrs_clk,
		ddrs_gnt => miitx_gnt,
		ddrs_rdy => ddr2mii_rdy,
		ddrs_req => ddr2mii_req,
		ddrs_dirdy => ddrs_do_rdy,
		ddrs_direq => ddr2miitx_brst_req,
		ddrs_di  => ddrs_do,

		miitx_clk => mii_txc,
		miitx_rdy => miitx_rdy,
		miitx_req => miitx_req,
		miitx_ena => miitx_ena,
		miitx_dat => miitx_dat);
end;
