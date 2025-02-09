#// XDC file for Genesys2


## Switches
set_property -dict {PACKAGE_PIN G19 IOSTANDARD LVCMOS12} [get_ports in1]
set_property -dict {PACKAGE_PIN G25 IOSTANDARD LVCMOS12} [get_ports in2]
set_property -dict {PACKAGE_PIN H24 IOSTANDARD LVCMOS12} [get_ports wr_en]
set_property -dict {PACKAGE_PIN K19 IOSTANDARD LVCMOS12} [get_ports rd_en]
set_property -dict { PACKAGE_PIN P27   IOSTANDARD LVCMOS33 } [get_ports { sel }]


## PMOD JC
set_property -dict {PACKAGE_PIN AC26 IOSTANDARD LVCMOS33} [get_ports {out1[0]}]
set_property -dict {PACKAGE_PIN AJ27 IOSTANDARD LVCMOS33} [get_ports {out1[1]}]


## PMOD JD
set_property -dict {PACKAGE_PIN V27 IOSTANDARD LVCMOS33} [get_ports {out2[0]}]
set_property -dict {PACKAGE_PIN Y30 IOSTANDARD LVCMOS33} [get_ports {out2[1]}]


## LEDs
set_property -dict {PACKAGE_PIN T28 IOSTANDARD LVCMOS33} [get_ports led0]
set_property -dict {PACKAGE_PIN V19 IOSTANDARD LVCMOS33} [get_ports led1]
set_property -dict {PACKAGE_PIN U30 IOSTANDARD LVCMOS33} [get_ports led2]
set_property -dict {PACKAGE_PIN U29 IOSTANDARD LVCMOS33} [get_ports led3]


set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets wr_en_IBUF]

set_property PACKAGE_PIN E18 [get_ports rst]
set_property PACKAGE_PIN AD12 [get_ports clk_p]
set_property IOSTANDARD LVDS [get_ports clk_p]
set_property IOSTANDARD LVCMOS12 [get_ports rst]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets clk_out1]

