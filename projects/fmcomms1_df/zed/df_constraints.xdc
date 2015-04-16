# PMODA
set_property  -dict {PACKAGE_PIN  Y11  IOSTANDARD LVCMOS33} [get_ports df_gpio_io[0]]
set_property  -dict {PACKAGE_PIN  AA11 IOSTANDARD LVCMOS33} [get_ports df_gpio_io[1]]
set_property  -dict {PACKAGE_PIN  Y10  IOSTANDARD LVCMOS33} [get_ports df_gpio_io[2]]
set_property  -dict {PACKAGE_PIN  AA9  IOSTANDARD LVCMOS33} [get_ports df_gpio_io[3]]

set_property  -dict {PACKAGE_PIN  AB11  IOSTANDARD LVCMOS33} [get_ports i2c0_scl_io]
set_property  -dict {PACKAGE_PIN  AB9   IOSTANDARD LVCMOS33} [get_ports i2c0_sda_io]

# PMODB
set_property  -dict {PACKAGE_PIN  W12  IOSTANDARD LVCMOS33} [get_ports i2c1_scl_io]
set_property  -dict {PACKAGE_PIN  V10  IOSTANDARD LVCMOS33} [get_ports i2c1_sda_io]
set_property  -dict {PACKAGE_PIN  V12  IOSTANDARD LVCMOS33} [get_ports i2c2_scl_io]
set_property  -dict {PACKAGE_PIN  V9  IOSTANDARD LVCMOS33} [get_ports i2c2_sda_io]

# PMODC
set_property  -dict {PACKAGE_PIN  AB7  IOSTANDARD LVCMOS33} [get_ports i2c3_scl_io]
set_property  -dict {PACKAGE_PIN  Y4   IOSTANDARD LVCMOS33} [get_ports i2c3_sda_io]
