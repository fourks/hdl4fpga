onerror {resume}
quietly virtual signal -install /testbench { /testbench/dq(15 downto 0)} dq16
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider testbench
add wave -noupdate /testbench/clk_p(0)
add wave -noupdate /testbench/cke
add wave -noupdate /testbench/cs_n
add wave -noupdate /testbench/ras_n
add wave -noupdate /testbench/cas_n
add wave -noupdate /testbench/we_n
add wave -noupdate /testbench/ba
add wave -noupdate -radix hexadecimal /testbench/addr
add wave -noupdate -radix hexadecimal -childformat {{/testbench/dq16(15) -radix hexadecimal} {/testbench/dq16(14) -radix hexadecimal} {/testbench/dq16(13) -radix hexadecimal} {/testbench/dq16(12) -radix hexadecimal} {/testbench/dq16(11) -radix hexadecimal} {/testbench/dq16(10) -radix hexadecimal} {/testbench/dq16(9) -radix hexadecimal} {/testbench/dq16(8) -radix hexadecimal} {/testbench/dq16(7) -radix hexadecimal} {/testbench/dq16(6) -radix hexadecimal} {/testbench/dq16(5) -radix hexadecimal} {/testbench/dq16(4) -radix hexadecimal} {/testbench/dq16(3) -radix hexadecimal} {/testbench/dq16(2) -radix hexadecimal} {/testbench/dq16(1) -radix hexadecimal} {/testbench/dq16(0) -radix hexadecimal}} -subitemconfig {/testbench/dq(15) {-radix hexadecimal} /testbench/dq(14) {-radix hexadecimal} /testbench/dq(13) {-radix hexadecimal} /testbench/dq(12) {-radix hexadecimal} /testbench/dq(11) {-radix hexadecimal} /testbench/dq(10) {-radix hexadecimal} /testbench/dq(9) {-radix hexadecimal} /testbench/dq(8) {-radix hexadecimal} /testbench/dq(7) {-radix hexadecimal} /testbench/dq(6) {-radix hexadecimal} /testbench/dq(5) {-radix hexadecimal} /testbench/dq(4) {-radix hexadecimal} /testbench/dq(3) {-radix hexadecimal} /testbench/dq(2) {-radix hexadecimal} /testbench/dq(1) {-radix hexadecimal} /testbench/dq(0) {-radix hexadecimal}} /testbench/dq16
add wave -noupdate /testbench/dqs(1)
add wave -noupdate /testbench/dqs(0)
add wave -noupdate -divider {New Divider}
add wave -noupdate /testbench/ml509_e/scope_e/ddr_e/wrfifo_i/xdr_fifo_g(0)/outbyte_i/ser_clk
add wave -noupdate /testbench/ml509_e/scope_e/ddr_e/wrfifo_i/xdr_fifo_g(0)/outbyte_i/ser_ena
add wave -noupdate /testbench/ml509_e/scope_e/ddr_e/xdr_wclks
add wave -noupdate /testbench/ml509_e/scope_e/ddr_e/data_phases
add wave -noupdate /testbench/ml509_e/scope_e/ddr_e/data_edges
add wave -noupdate /testbench/ml509_e/scope_e/ddr_e/sys_do_rdy
add wave -noupdate -radix hexadecimal -childformat {{/testbench/ml509_e/scope_e/ddr_e/sys_do(31) -radix hexadecimal} {/testbench/ml509_e/scope_e/ddr_e/sys_do(30) -radix hexadecimal} {/testbench/ml509_e/scope_e/ddr_e/sys_do(29) -radix hexadecimal} {/testbench/ml509_e/scope_e/ddr_e/sys_do(28) -radix hexadecimal} {/testbench/ml509_e/scope_e/ddr_e/sys_do(27) -radix hexadecimal} {/testbench/ml509_e/scope_e/ddr_e/sys_do(26) -radix hexadecimal} {/testbench/ml509_e/scope_e/ddr_e/sys_do(25) -radix hexadecimal} {/testbench/ml509_e/scope_e/ddr_e/sys_do(24) -radix hexadecimal} {/testbench/ml509_e/scope_e/ddr_e/sys_do(23) -radix hexadecimal} {/testbench/ml509_e/scope_e/ddr_e/sys_do(22) -radix hexadecimal} {/testbench/ml509_e/scope_e/ddr_e/sys_do(21) -radix hexadecimal} {/testbench/ml509_e/scope_e/ddr_e/sys_do(20) -radix hexadecimal} {/testbench/ml509_e/scope_e/ddr_e/sys_do(19) -radix hexadecimal} {/testbench/ml509_e/scope_e/ddr_e/sys_do(18) -radix hexadecimal} {/testbench/ml509_e/scope_e/ddr_e/sys_do(17) -radix hexadecimal} {/testbench/ml509_e/scope_e/ddr_e/sys_do(16) -radix hexadecimal} {/testbench/ml509_e/scope_e/ddr_e/sys_do(15) -radix hexadecimal} {/testbench/ml509_e/scope_e/ddr_e/sys_do(14) -radix hexadecimal} {/testbench/ml509_e/scope_e/ddr_e/sys_do(13) -radix hexadecimal} {/testbench/ml509_e/scope_e/ddr_e/sys_do(12) -radix hexadecimal} {/testbench/ml509_e/scope_e/ddr_e/sys_do(11) -radix hexadecimal} {/testbench/ml509_e/scope_e/ddr_e/sys_do(10) -radix hexadecimal} {/testbench/ml509_e/scope_e/ddr_e/sys_do(9) -radix hexadecimal} {/testbench/ml509_e/scope_e/ddr_e/sys_do(8) -radix hexadecimal} {/testbench/ml509_e/scope_e/ddr_e/sys_do(7) -radix hexadecimal} {/testbench/ml509_e/scope_e/ddr_e/sys_do(6) -radix hexadecimal} {/testbench/ml509_e/scope_e/ddr_e/sys_do(5) -radix hexadecimal} {/testbench/ml509_e/scope_e/ddr_e/sys_do(4) -radix hexadecimal} {/testbench/ml509_e/scope_e/ddr_e/sys_do(3) -radix hexadecimal} {/testbench/ml509_e/scope_e/ddr_e/sys_do(2) -radix hexadecimal} {/testbench/ml509_e/scope_e/ddr_e/sys_do(1) -radix hexadecimal} {/testbench/ml509_e/scope_e/ddr_e/sys_do(0) -radix hexadecimal}} -subitemconfig {/testbench/ml509_e/scope_e/ddr_e/sys_do(31) {-height 16 -radix hexadecimal} /testbench/ml509_e/scope_e/ddr_e/sys_do(30) {-height 16 -radix hexadecimal} /testbench/ml509_e/scope_e/ddr_e/sys_do(29) {-height 16 -radix hexadecimal} /testbench/ml509_e/scope_e/ddr_e/sys_do(28) {-height 16 -radix hexadecimal} /testbench/ml509_e/scope_e/ddr_e/sys_do(27) {-height 16 -radix hexadecimal} /testbench/ml509_e/scope_e/ddr_e/sys_do(26) {-height 16 -radix hexadecimal} /testbench/ml509_e/scope_e/ddr_e/sys_do(25) {-height 16 -radix hexadecimal} /testbench/ml509_e/scope_e/ddr_e/sys_do(24) {-height 16 -radix hexadecimal} /testbench/ml509_e/scope_e/ddr_e/sys_do(23) {-height 16 -radix hexadecimal} /testbench/ml509_e/scope_e/ddr_e/sys_do(22) {-height 16 -radix hexadecimal} /testbench/ml509_e/scope_e/ddr_e/sys_do(21) {-height 16 -radix hexadecimal} /testbench/ml509_e/scope_e/ddr_e/sys_do(20) {-height 16 -radix hexadecimal} /testbench/ml509_e/scope_e/ddr_e/sys_do(19) {-height 16 -radix hexadecimal} /testbench/ml509_e/scope_e/ddr_e/sys_do(18) {-height 16 -radix hexadecimal} /testbench/ml509_e/scope_e/ddr_e/sys_do(17) {-height 16 -radix hexadecimal} /testbench/ml509_e/scope_e/ddr_e/sys_do(16) {-height 16 -radix hexadecimal} /testbench/ml509_e/scope_e/ddr_e/sys_do(15) {-height 16 -radix hexadecimal} /testbench/ml509_e/scope_e/ddr_e/sys_do(14) {-height 16 -radix hexadecimal} /testbench/ml509_e/scope_e/ddr_e/sys_do(13) {-height 16 -radix hexadecimal} /testbench/ml509_e/scope_e/ddr_e/sys_do(12) {-height 16 -radix hexadecimal} /testbench/ml509_e/scope_e/ddr_e/sys_do(11) {-height 16 -radix hexadecimal} /testbench/ml509_e/scope_e/ddr_e/sys_do(10) {-height 16 -radix hexadecimal} /testbench/ml509_e/scope_e/ddr_e/sys_do(9) {-height 16 -radix hexadecimal} /testbench/ml509_e/scope_e/ddr_e/sys_do(8) {-height 16 -radix hexadecimal} /testbench/ml509_e/scope_e/ddr_e/sys_do(7) {-height 16 -radix hexadecimal} /testbench/ml509_e/scope_e/ddr_e/sys_do(6) {-height 16 -radix hexadecimal} /testbench/ml509_e/scope_e/ddr_e/sys_do(5) {-height 16 -radix hexadecimal} /testbench/ml509_e/scope_e/ddr_e/sys_do(4) {-height 16 -radix hexadecimal} /testbench/ml509_e/scope_e/ddr_e/sys_do(3) {-height 16 -radix hexadecimal} /testbench/ml509_e/scope_e/ddr_e/sys_do(2) {-height 16 -radix hexadecimal} /testbench/ml509_e/scope_e/ddr_e/sys_do(1) {-height 16 -radix hexadecimal} /testbench/ml509_e/scope_e/ddr_e/sys_do(0) {-height 16 -radix hexadecimal}} /testbench/ml509_e/scope_e/ddr_e/sys_do
add wave -noupdate -radix hexadecimal -childformat {{/testbench/ml509_e/ddrphy_e/byte_g(1)/ddrdqphy_i/sys_dqo(15) -radix hexadecimal} {/testbench/ml509_e/ddrphy_e/byte_g(1)/ddrdqphy_i/sys_dqo(14) -radix hexadecimal} {/testbench/ml509_e/ddrphy_e/byte_g(1)/ddrdqphy_i/sys_dqo(13) -radix hexadecimal} {/testbench/ml509_e/ddrphy_e/byte_g(1)/ddrdqphy_i/sys_dqo(12) -radix hexadecimal} {/testbench/ml509_e/ddrphy_e/byte_g(1)/ddrdqphy_i/sys_dqo(11) -radix hexadecimal} {/testbench/ml509_e/ddrphy_e/byte_g(1)/ddrdqphy_i/sys_dqo(10) -radix hexadecimal} {/testbench/ml509_e/ddrphy_e/byte_g(1)/ddrdqphy_i/sys_dqo(9) -radix hexadecimal} {/testbench/ml509_e/ddrphy_e/byte_g(1)/ddrdqphy_i/sys_dqo(8) -radix hexadecimal} {/testbench/ml509_e/ddrphy_e/byte_g(1)/ddrdqphy_i/sys_dqo(7) -radix hexadecimal} {/testbench/ml509_e/ddrphy_e/byte_g(1)/ddrdqphy_i/sys_dqo(6) -radix hexadecimal} {/testbench/ml509_e/ddrphy_e/byte_g(1)/ddrdqphy_i/sys_dqo(5) -radix hexadecimal} {/testbench/ml509_e/ddrphy_e/byte_g(1)/ddrdqphy_i/sys_dqo(4) -radix hexadecimal} {/testbench/ml509_e/ddrphy_e/byte_g(1)/ddrdqphy_i/sys_dqo(3) -radix hexadecimal} {/testbench/ml509_e/ddrphy_e/byte_g(1)/ddrdqphy_i/sys_dqo(2) -radix hexadecimal} {/testbench/ml509_e/ddrphy_e/byte_g(1)/ddrdqphy_i/sys_dqo(1) -radix hexadecimal} {/testbench/ml509_e/ddrphy_e/byte_g(1)/ddrdqphy_i/sys_dqo(0) -radix hexadecimal}} -subitemconfig {/testbench/ml509_e/ddrphy_e/byte_g(1)/ddrdqphy_i/sys_dqo(15) {-height 16 -radix hexadecimal} /testbench/ml509_e/ddrphy_e/byte_g(1)/ddrdqphy_i/sys_dqo(14) {-height 16 -radix hexadecimal} /testbench/ml509_e/ddrphy_e/byte_g(1)/ddrdqphy_i/sys_dqo(13) {-height 16 -radix hexadecimal} /testbench/ml509_e/ddrphy_e/byte_g(1)/ddrdqphy_i/sys_dqo(12) {-height 16 -radix hexadecimal} /testbench/ml509_e/ddrphy_e/byte_g(1)/ddrdqphy_i/sys_dqo(11) {-height 16 -radix hexadecimal} /testbench/ml509_e/ddrphy_e/byte_g(1)/ddrdqphy_i/sys_dqo(10) {-height 16 -radix hexadecimal} /testbench/ml509_e/ddrphy_e/byte_g(1)/ddrdqphy_i/sys_dqo(9) {-height 16 -radix hexadecimal} /testbench/ml509_e/ddrphy_e/byte_g(1)/ddrdqphy_i/sys_dqo(8) {-height 16 -radix hexadecimal} /testbench/ml509_e/ddrphy_e/byte_g(1)/ddrdqphy_i/sys_dqo(7) {-height 16 -radix hexadecimal} /testbench/ml509_e/ddrphy_e/byte_g(1)/ddrdqphy_i/sys_dqo(6) {-height 16 -radix hexadecimal} /testbench/ml509_e/ddrphy_e/byte_g(1)/ddrdqphy_i/sys_dqo(5) {-height 16 -radix hexadecimal} /testbench/ml509_e/ddrphy_e/byte_g(1)/ddrdqphy_i/sys_dqo(4) {-height 16 -radix hexadecimal} /testbench/ml509_e/ddrphy_e/byte_g(1)/ddrdqphy_i/sys_dqo(3) {-height 16 -radix hexadecimal} /testbench/ml509_e/ddrphy_e/byte_g(1)/ddrdqphy_i/sys_dqo(2) {-height 16 -radix hexadecimal} /testbench/ml509_e/ddrphy_e/byte_g(1)/ddrdqphy_i/sys_dqo(1) {-height 16 -radix hexadecimal} /testbench/ml509_e/ddrphy_e/byte_g(1)/ddrdqphy_i/sys_dqo(0) {-height 16 -radix hexadecimal}} /testbench/ml509_e/ddrphy_e/byte_g(1)/ddrdqphy_i/sys_dqo
add wave -noupdate /testbench/ml509_e/scope_e/ddr_e/xdr_sti
add wave -noupdate -radix hexadecimal -childformat {{/testbench/ml509_e/ddrphy_e/sdqo(1) -radix hexadecimal} {/testbench/ml509_e/ddrphy_e/sdqo(0) -radix hexadecimal}} -expand -subitemconfig {/testbench/ml509_e/ddrphy_e/sdqo(1) {-height 16 -radix hexadecimal} /testbench/ml509_e/ddrphy_e/sdqo(0) {-height 16 -radix hexadecimal}} /testbench/ml509_e/ddrphy_e/sdqo
add wave -noupdate -radix hexadecimal -childformat {{/testbench/ml509_e/ddrphy_e/sys_dqi(31) -radix hexadecimal} {/testbench/ml509_e/ddrphy_e/sys_dqi(30) -radix hexadecimal} {/testbench/ml509_e/ddrphy_e/sys_dqi(29) -radix hexadecimal} {/testbench/ml509_e/ddrphy_e/sys_dqi(28) -radix hexadecimal} {/testbench/ml509_e/ddrphy_e/sys_dqi(27) -radix hexadecimal} {/testbench/ml509_e/ddrphy_e/sys_dqi(26) -radix hexadecimal} {/testbench/ml509_e/ddrphy_e/sys_dqi(25) -radix hexadecimal} {/testbench/ml509_e/ddrphy_e/sys_dqi(24) -radix hexadecimal} {/testbench/ml509_e/ddrphy_e/sys_dqi(23) -radix hexadecimal} {/testbench/ml509_e/ddrphy_e/sys_dqi(22) -radix hexadecimal} {/testbench/ml509_e/ddrphy_e/sys_dqi(21) -radix hexadecimal} {/testbench/ml509_e/ddrphy_e/sys_dqi(20) -radix hexadecimal} {/testbench/ml509_e/ddrphy_e/sys_dqi(19) -radix hexadecimal} {/testbench/ml509_e/ddrphy_e/sys_dqi(18) -radix hexadecimal} {/testbench/ml509_e/ddrphy_e/sys_dqi(17) -radix hexadecimal} {/testbench/ml509_e/ddrphy_e/sys_dqi(16) -radix hexadecimal} {/testbench/ml509_e/ddrphy_e/sys_dqi(15) -radix hexadecimal} {/testbench/ml509_e/ddrphy_e/sys_dqi(14) -radix hexadecimal} {/testbench/ml509_e/ddrphy_e/sys_dqi(13) -radix hexadecimal} {/testbench/ml509_e/ddrphy_e/sys_dqi(12) -radix hexadecimal} {/testbench/ml509_e/ddrphy_e/sys_dqi(11) -radix hexadecimal} {/testbench/ml509_e/ddrphy_e/sys_dqi(10) -radix hexadecimal} {/testbench/ml509_e/ddrphy_e/sys_dqi(9) -radix hexadecimal} {/testbench/ml509_e/ddrphy_e/sys_dqi(8) -radix hexadecimal} {/testbench/ml509_e/ddrphy_e/sys_dqi(7) -radix hexadecimal} {/testbench/ml509_e/ddrphy_e/sys_dqi(6) -radix hexadecimal} {/testbench/ml509_e/ddrphy_e/sys_dqi(5) -radix hexadecimal} {/testbench/ml509_e/ddrphy_e/sys_dqi(4) -radix hexadecimal} {/testbench/ml509_e/ddrphy_e/sys_dqi(3) -radix hexadecimal} {/testbench/ml509_e/ddrphy_e/sys_dqi(2) -radix hexadecimal} {/testbench/ml509_e/ddrphy_e/sys_dqi(1) -radix hexadecimal} {/testbench/ml509_e/ddrphy_e/sys_dqi(0) -radix hexadecimal}} -subitemconfig {/testbench/ml509_e/ddrphy_e/sys_dqi(31) {-height 16 -radix hexadecimal} /testbench/ml509_e/ddrphy_e/sys_dqi(30) {-height 16 -radix hexadecimal} /testbench/ml509_e/ddrphy_e/sys_dqi(29) {-height 16 -radix hexadecimal} /testbench/ml509_e/ddrphy_e/sys_dqi(28) {-height 16 -radix hexadecimal} /testbench/ml509_e/ddrphy_e/sys_dqi(27) {-height 16 -radix hexadecimal} /testbench/ml509_e/ddrphy_e/sys_dqi(26) {-height 16 -radix hexadecimal} /testbench/ml509_e/ddrphy_e/sys_dqi(25) {-height 16 -radix hexadecimal} /testbench/ml509_e/ddrphy_e/sys_dqi(24) {-height 16 -radix hexadecimal} /testbench/ml509_e/ddrphy_e/sys_dqi(23) {-height 16 -radix hexadecimal} /testbench/ml509_e/ddrphy_e/sys_dqi(22) {-height 16 -radix hexadecimal} /testbench/ml509_e/ddrphy_e/sys_dqi(21) {-height 16 -radix hexadecimal} /testbench/ml509_e/ddrphy_e/sys_dqi(20) {-height 16 -radix hexadecimal} /testbench/ml509_e/ddrphy_e/sys_dqi(19) {-height 16 -radix hexadecimal} /testbench/ml509_e/ddrphy_e/sys_dqi(18) {-height 16 -radix hexadecimal} /testbench/ml509_e/ddrphy_e/sys_dqi(17) {-height 16 -radix hexadecimal} /testbench/ml509_e/ddrphy_e/sys_dqi(16) {-height 16 -radix hexadecimal} /testbench/ml509_e/ddrphy_e/sys_dqi(15) {-height 16 -radix hexadecimal} /testbench/ml509_e/ddrphy_e/sys_dqi(14) {-height 16 -radix hexadecimal} /testbench/ml509_e/ddrphy_e/sys_dqi(13) {-height 16 -radix hexadecimal} /testbench/ml509_e/ddrphy_e/sys_dqi(12) {-height 16 -radix hexadecimal} /testbench/ml509_e/ddrphy_e/sys_dqi(11) {-height 16 -radix hexadecimal} /testbench/ml509_e/ddrphy_e/sys_dqi(10) {-height 16 -radix hexadecimal} /testbench/ml509_e/ddrphy_e/sys_dqi(9) {-height 16 -radix hexadecimal} /testbench/ml509_e/ddrphy_e/sys_dqi(8) {-height 16 -radix hexadecimal} /testbench/ml509_e/ddrphy_e/sys_dqi(7) {-height 16 -radix hexadecimal} /testbench/ml509_e/ddrphy_e/sys_dqi(6) {-height 16 -radix hexadecimal} /testbench/ml509_e/ddrphy_e/sys_dqi(5) {-height 16 -radix hexadecimal} /testbench/ml509_e/ddrphy_e/sys_dqi(4) {-height 16 -radix hexadecimal} /testbench/ml509_e/ddrphy_e/sys_dqi(3) {-height 16 -radix hexadecimal} /testbench/ml509_e/ddrphy_e/sys_dqi(2) {-height 16 -radix hexadecimal} /testbench/ml509_e/ddrphy_e/sys_dqi(1) {-height 16 -radix hexadecimal} /testbench/ml509_e/ddrphy_e/sys_dqi(0) {-height 16 -radix hexadecimal}} /testbench/ml509_e/ddrphy_e/sys_dqi
add wave -noupdate /testbench/ml509_e/scope_e/ddr_e/rdfifo_i/xdr_dqsi
add wave -noupdate -radix hexadecimal -childformat {{/testbench/ml509_e/scope_e/ddr_e/rdfifo_i/do(3) -radix hexadecimal} {/testbench/ml509_e/scope_e/ddr_e/rdfifo_i/do(2) -radix hexadecimal} {/testbench/ml509_e/scope_e/ddr_e/rdfifo_i/do(1) -radix hexadecimal} {/testbench/ml509_e/scope_e/ddr_e/rdfifo_i/do(0) -radix hexadecimal -childformat {{/testbench/ml509_e/scope_e/ddr_e/rdfifo_i/do(0)(7) -radix hexadecimal} {/testbench/ml509_e/scope_e/ddr_e/rdfifo_i/do(0)(6) -radix hexadecimal} {/testbench/ml509_e/scope_e/ddr_e/rdfifo_i/do(0)(5) -radix hexadecimal} {/testbench/ml509_e/scope_e/ddr_e/rdfifo_i/do(0)(4) -radix hexadecimal} {/testbench/ml509_e/scope_e/ddr_e/rdfifo_i/do(0)(3) -radix hexadecimal} {/testbench/ml509_e/scope_e/ddr_e/rdfifo_i/do(0)(2) -radix hexadecimal} {/testbench/ml509_e/scope_e/ddr_e/rdfifo_i/do(0)(1) -radix hexadecimal} {/testbench/ml509_e/scope_e/ddr_e/rdfifo_i/do(0)(0) -radix hexadecimal}}}} -expand -subitemconfig {/testbench/ml509_e/scope_e/ddr_e/rdfifo_i/do(3) {-height 16 -radix hexadecimal} /testbench/ml509_e/scope_e/ddr_e/rdfifo_i/do(2) {-height 16 -radix hexadecimal} /testbench/ml509_e/scope_e/ddr_e/rdfifo_i/do(1) {-height 16 -radix hexadecimal} /testbench/ml509_e/scope_e/ddr_e/rdfifo_i/do(0) {-height 16 -radix hexadecimal -childformat {{/testbench/ml509_e/scope_e/ddr_e/rdfifo_i/do(0)(7) -radix hexadecimal} {/testbench/ml509_e/scope_e/ddr_e/rdfifo_i/do(0)(6) -radix hexadecimal} {/testbench/ml509_e/scope_e/ddr_e/rdfifo_i/do(0)(5) -radix hexadecimal} {/testbench/ml509_e/scope_e/ddr_e/rdfifo_i/do(0)(4) -radix hexadecimal} {/testbench/ml509_e/scope_e/ddr_e/rdfifo_i/do(0)(3) -radix hexadecimal} {/testbench/ml509_e/scope_e/ddr_e/rdfifo_i/do(0)(2) -radix hexadecimal} {/testbench/ml509_e/scope_e/ddr_e/rdfifo_i/do(0)(1) -radix hexadecimal} {/testbench/ml509_e/scope_e/ddr_e/rdfifo_i/do(0)(0) -radix hexadecimal}}} /testbench/ml509_e/scope_e/ddr_e/rdfifo_i/do(0)(7) {-height 16 -radix hexadecimal} /testbench/ml509_e/scope_e/ddr_e/rdfifo_i/do(0)(6) {-height 16 -radix hexadecimal} /testbench/ml509_e/scope_e/ddr_e/rdfifo_i/do(0)(5) {-height 16 -radix hexadecimal} /testbench/ml509_e/scope_e/ddr_e/rdfifo_i/do(0)(4) {-height 16 -radix hexadecimal} /testbench/ml509_e/scope_e/ddr_e/rdfifo_i/do(0)(3) {-height 16 -radix hexadecimal} /testbench/ml509_e/scope_e/ddr_e/rdfifo_i/do(0)(2) {-height 16 -radix hexadecimal} /testbench/ml509_e/scope_e/ddr_e/rdfifo_i/do(0)(1) {-height 16 -radix hexadecimal} /testbench/ml509_e/scope_e/ddr_e/rdfifo_i/do(0)(0) {-height 16 -radix hexadecimal}} /testbench/ml509_e/scope_e/ddr_e/rdfifo_i/do
add wave -noupdate -radix hexadecimal -childformat {{/testbench/ml509_e/scope_e/ddr_e/rdfifo_i/di(3) -radix hexadecimal} {/testbench/ml509_e/scope_e/ddr_e/rdfifo_i/di(2) -radix hexadecimal} {/testbench/ml509_e/scope_e/ddr_e/rdfifo_i/di(1) -radix hexadecimal} {/testbench/ml509_e/scope_e/ddr_e/rdfifo_i/di(0) -radix hexadecimal}} -expand -subitemconfig {/testbench/ml509_e/scope_e/ddr_e/rdfifo_i/di(3) {-height 16 -radix hexadecimal} /testbench/ml509_e/scope_e/ddr_e/rdfifo_i/di(2) {-height 16 -radix hexadecimal} /testbench/ml509_e/scope_e/ddr_e/rdfifo_i/di(1) {-height 16 -radix hexadecimal} /testbench/ml509_e/scope_e/ddr_e/rdfifo_i/di(0) {-height 16 -radix hexadecimal}} /testbench/ml509_e/scope_e/ddr_e/rdfifo_i/di
add wave -noupdate -radix hexadecimal /testbench/ml509_e/scope_e/ddr_e/rdfifo_i/sys_do
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {6746197 ps} 1} {{Cursor 2} {6757681 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 132
configure wave -valuecolwidth 103
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {6733778 ps} {6761380 ps}
