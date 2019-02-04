onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider btod
add wave -noupdate /testbench/clk
add wave -noupdate /testbench/writef_e/wrfbuf_e/btof_e/btos_e/btod_e/bin_frm
add wave -noupdate /testbench/writef_e/wrfbuf_e/btof_e/btos_e/btod_e/bin_irdy
add wave -noupdate /testbench/writef_e/wrfbuf_e/btof_e/btos_e/btod_e/bin_trdy
add wave -noupdate -radix hexadecimal /testbench/writef_e/wrfbuf_e/btof_e/btos_e/btod_e/bin_di
add wave -noupdate /testbench/writef_e/wrfbuf_e/btof_e/btos_e/btod_e/btod_ena
add wave -noupdate /testbench/writef_e/wrfbuf_e/btof_e/btos_e/btod_e/bcd_ini
add wave -noupdate /testbench/writef_e/wrfbuf_e/btof_e/btos_e/btod_e/bcd_cy
add wave -noupdate -radix hexadecimal /testbench/writef_e/wrfbuf_e/btof_e/btos_e/btod_e/bcd_di
add wave -noupdate -radix hexadecimal /testbench/writef_e/wrfbuf_e/btof_e/btos_e/btod_e/bcd_do
add wave -noupdate -radix hexadecimal /testbench/writef_e/wrfbuf_e/btof_e/btos_e/btod_e/mem_addr
add wave -noupdate -radix hexadecimal /testbench/writef_e/wrfbuf_e/btof_e/btos_e/btod_e/mem_di
add wave -noupdate -radix hexadecimal /testbench/writef_e/wrfbuf_e/btof_e/btos_e/btod_e/mem_do
add wave -noupdate /testbench/writef_e/wrfbuf_e/btof_e/btos_e/btod_e/mem_trdy
add wave -noupdate /testbench/writef_e/wrfbuf_e/btof_e/btos_e/btod_e/mem_irdy
add wave -noupdate /testbench/writef_e/wrfbuf_e/btof_e/btos_e/btod_e/mem_ena
add wave -noupdate /testbench/writef_e/wrfbuf_e/btof_e/btos_e/btod_e/mem_full
add wave -noupdate -radix hexadecimal /testbench/writef_e/wrfbuf_e/btof_e/btos_e/btod_e/mem_left
add wave -noupdate /testbench/writef_e/wrfbuf_e/btof_e/btos_e/btod_e/mem_left_up
add wave -noupdate /testbench/writef_e/wrfbuf_e/btof_e/btos_e/btod_e/mem_left_ena
add wave -noupdate -radix hexadecimal /testbench/writef_e/wrfbuf_e/btof_e/btos_e/btod_e/mem_right
add wave -noupdate /testbench/writef_e/wrfbuf_e/btof_e/btos_e/btod_e/mem_right_up
add wave -noupdate /testbench/writef_e/wrfbuf_e/btof_e/btos_e/btod_e/mem_right_ena
add wave -noupdate -divider dtos
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {46 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
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
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ns} {208 ns}