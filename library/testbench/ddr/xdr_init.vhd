library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library hdl4fpga;
use hdl4fpga.xdr_param.all;

architecture xdr_init of testbench is
	signal xdr_clk : std_logic := '0';
	signal xdr_wait_clk : std_logic := '0';
	signal xdr_rst : std_logic := '0';
	signal xdr_ras : std_logic := '1';
	signal xdr_cas : std_logic := '1';
	signal xdr_we  : std_logic := '1';
	signal xdr_rdy : std_logic;
begin

	xdr_rst <= '1', '0' after 20.00001 ns;
	xdr_clk <= not xdr_clk after 5 ns;
	du : entity hdl4fpga.xdr_init
	generic map (
		timers => (TMR_RST => 10, TMR_RRDY => 30, TMR_CKE => 14, TMR_MRD => 17, TMR_ZQINIT => 20, TMR_REF => 25),
		bank_size  => 3,
		addr_size  => 13)
	port map (
		xdr_init_clk => xdr_clk,
		xdr_init_req => xdr_rst,
		xdr_init_rdy => xdr_rdy,
		xdr_init_bl => "101",
		xdr_init_cl => "010",
		xdr_init_ras => xdr_ras,
		xdr_init_cas => xdr_cas,
		xdr_init_we  => xdr_we);
end;
