## copied from $ad_hdl_dir/projects/fmcomms2/zed/system_bd.tcl
source $ad_hdl_dir/projects/common/zed/zed_system_bd.tcl
source $ad_hdl_dir/projects/fmcomms2/common/fmcomms2_bd.tcl

set df_gpio_i       [create_bd_port -dir I -from 3 -to 0 df_gpio_i]
set df_gpio_o       [create_bd_port -dir O -from 3 -to 0 df_gpio_o]
set df_gpio_t       [create_bd_port -dir O -from 3 -to 0 df_gpio_t]
set I2C0 [create_bd_intf_port -mode Master -vlnv xilinx.com:interface:iic_rtl:1.0 I2C0]
set I2C1 [create_bd_intf_port -mode Master -vlnv xilinx.com:interface:iic_rtl:1.0 I2C1]
set I2C2 [create_bd_intf_port -mode Master -vlnv xilinx.com:interface:iic_rtl:1.0 I2C2]
set I2C3 [create_bd_intf_port -mode Master -vlnv xilinx.com:interface:iic_rtl:1.0 I2C3]

puts [get_bd_pins sys_concat_intc/*]
foreach pin [get_bd_pins sys_concat_intc/*] {
    puts $pin
    puts [get_bd_net -of_objects $pin]
}

set_property -dict [list CONFIG.NUM_MI {15}] $axi_cpu_interconnect
set sys_100m_resetn_source [get_bd_pins sys_rstgen/peripheral_aresetn]
puts [get_bd_pins sys_rstgen/peripheral_aresetn]

set axi_fmcomms2_df_gpio [create_bd_cell -type ip -vlnv xilinx.com:ip:axi_gpio:2.0 axi_fmcomms2_df_gpio]
set_property -dict [list CONFIG.C_GPIO_WIDTH {4} CONFIG.C_INTERRUPT_PRESENT {1}] $axi_fmcomms2_df_gpio
connect_bd_intf_net -intf_net axi_cpu_interconnect_m10_axi [get_bd_intf_pins axi_cpu_interconnect/M10_AXI] [get_bd_intf_pins axi_fmcomms2_df_gpio/s_axi]
connect_bd_net -net sys_100m_clk [get_bd_pins axi_cpu_interconnect/M10_ACLK] $sys_100m_clk_source
connect_bd_net -net sys_100m_clk [get_bd_pins axi_fmcomms2_df_gpio/s_axi_aclk] $sys_100m_clk_source
connect_bd_net [get_bd_pins axi_cpu_interconnect/M10_ARESETN] $sys_100m_resetn_source
connect_bd_net [get_bd_pins axi_fmcomms2_df_gpio/s_axi_aresetn] $sys_100m_resetn_source
#connect_bd_net -net df_gpio_i [get_bd_ports df_gpio_i]    [get_bd_pins axi_fmcomms2_df_gpio/gpio_io_i]
#connect_bd_net -net df_gpio_o [get_bd_ports df_gpio_o]    [get_bd_pins axi_fmcomms2_df_gpio/gpio_io_o]
#connect_bd_net -net df_gpio_t [get_bd_ports df_gpio_t]    [get_bd_pins axi_fmcomms2_df_gpio/gpio_io_t]
#connect_bd_net   [get_bd_pins sys_concat_intc/In14] [get_bd_pins axi_fmcomms2_df_gpio/ip2intc_irpt]

set axi_fmcomms2_df_i2c0 [create_bd_cell -type ip -vlnv xilinx.com:ip:axi_iic axi_fmcomms2_df_i2c0]
#set_property -dict [list CONFIG.AXI_ACLK_FREQ_MHZ {200}] $axi_fmcomms2_df_i2c0
connect_bd_intf_net -intf_net axi_cpu_interconnect_m11_axi [get_bd_intf_pins axi_cpu_interconnect/M11_AXI] [get_bd_intf_pins axi_fmcomms2_df_i2c0/s_axi]
connect_bd_net -net sys_100m_clk [get_bd_pins axi_cpu_interconnect/M11_ACLK] $sys_100m_clk_source
connect_bd_net -net sys_100m_clk [get_bd_pins axi_fmcomms2_df_i2c0/s_axi_aclk] $sys_100m_clk_source
connect_bd_net [get_bd_pins axi_cpu_interconnect/M11_ARESETN] $sys_100m_resetn_source
connect_bd_net [get_bd_pins axi_fmcomms2_df_i2c0/s_axi_aresetn] $sys_100m_resetn_source
connect_bd_intf_net -intf_net i2c0 [get_bd_intf_ports I2C0] [get_bd_intf_pins axi_fmcomms2_df_i2c0/iic]
#connect_bd_net   [get_bd_pins sys_concat_intc/In15] [get_bd_pins axi_fmcomms2_df_i2c0/ip2intc_irpt]

set axi_fmcomms2_df_i2c1 [create_bd_cell -type ip -vlnv xilinx.com:ip:axi_iic axi_fmcomms2_df_i2c1]
#set_property -dict [list CONFIG.AXI_ACLK_FREQ_MHZ {200}] $axi_fmcomms2_df_i2c1
connect_bd_intf_net -intf_net axi_cpu_interconnect_m12_axi [get_bd_intf_pins axi_cpu_interconnect/M12_AXI] [get_bd_intf_pins axi_fmcomms2_df_i2c1/s_axi]
connect_bd_net -net sys_100m_clk [get_bd_pins axi_cpu_interconnect/M12_ACLK] $sys_100m_clk_source
connect_bd_net -net sys_100m_clk [get_bd_pins axi_fmcomms2_df_i2c1/s_axi_aclk] $sys_100m_clk_source
connect_bd_net [get_bd_pins axi_cpu_interconnect/M12_ARESETN] $sys_100m_resetn_source
connect_bd_net [get_bd_pins axi_fmcomms2_df_i2c1/s_axi_aresetn] $sys_100m_resetn_source
connect_bd_intf_net -intf_net i2c1 [get_bd_intf_ports I2C1] [get_bd_intf_pins axi_fmcomms2_df_i2c1/iic]
#connect_bd_net   [get_bd_pins sys_concat_intc/In15] [get_bd_pins axi_fmcomms2_df_i2c1/ip2intc_irpt]

set axi_fmcomms2_df_i2c2 [create_bd_cell -type ip -vlnv xilinx.com:ip:axi_iic axi_fmcomms2_df_i2c2]
#set_property -dict [list CONFIG.AXI_ACLK_FREQ_MHZ {200}] $axi_fmcomms2_df_i2c2
connect_bd_intf_net -intf_net axi_cpu_interconnect_m13_axi [get_bd_intf_pins axi_cpu_interconnect/M13_AXI] [get_bd_intf_pins axi_fmcomms2_df_i2c2/s_axi]
connect_bd_net -net sys_100m_clk [get_bd_pins axi_cpu_interconnect/M13_ACLK] $sys_100m_clk_source
connect_bd_net -net sys_100m_clk [get_bd_pins axi_fmcomms2_df_i2c2/s_axi_aclk] $sys_100m_clk_source
connect_bd_net [get_bd_pins axi_cpu_interconnect/M13_ARESETN] $sys_100m_resetn_source
connect_bd_net [get_bd_pins axi_fmcomms2_df_i2c2/s_axi_aresetn] $sys_100m_resetn_source
connect_bd_intf_net -intf_net i2c2 [get_bd_intf_ports I2C2] [get_bd_intf_pins axi_fmcomms2_df_i2c2/iic]
#connect_bd_net   [get_bd_pins sys_concat_intc/In15] [get_bd_pins axi_fmcomms2_df_i2c2/ip2intc_irpt]

set axi_fmcomms2_df_i2c3 [create_bd_cell -type ip -vlnv xilinx.com:ip:axi_iic axi_fmcomms2_df_i2c3]
#set_property -dict [list CONFIG.AXI_ACLK_FREQ_MHZ {200}] $axi_fmcomms2_df_i2c3
connect_bd_intf_net -intf_net axi_cpu_interconnect_m14_axi [get_bd_intf_pins axi_cpu_interconnect/M14_AXI] [get_bd_intf_pins axi_fmcomms2_df_i2c3/s_axi]
connect_bd_net -net sys_100m_clk [get_bd_pins axi_cpu_interconnect/M14_ACLK] $sys_100m_clk_source
connect_bd_net -net sys_100m_clk [get_bd_pins axi_fmcomms2_df_i2c3/s_axi_aclk] $sys_100m_clk_source
connect_bd_net [get_bd_pins axi_cpu_interconnect/M14_ARESETN] $sys_100m_resetn_source
connect_bd_net [get_bd_pins axi_fmcomms2_df_i2c3/s_axi_aresetn] $sys_100m_resetn_source
connect_bd_intf_net -intf_net i2c3 [get_bd_intf_ports I2C3] [get_bd_intf_pins axi_fmcomms2_df_i2c3/iic]
#connect_bd_net   [get_bd_pins sys_concat_intc/In15] [get_bd_pins axi_fmcomms2_df_i2c3/ip2intc_irpt]

puts $sys_addr_cntrl_space
puts [get_bd_addr_segs axi_fmcomms2_df_gpio/s_axi/axi_lite]

create_bd_addr_seg -range 0x00010000 -offset 0x7C500000 $sys_addr_cntrl_space [get_bd_addr_segs axi_fmcomms2_df_gpio/s_axi/Reg]  SEG_data_df_gpio
create_bd_addr_seg -range 0x00010000 -offset 0x7C510000 $sys_addr_cntrl_space [get_bd_addr_segs axi_fmcomms2_df_i2c0/s_axi/Reg]  SEG_data_df_i2c0
create_bd_addr_seg -range 0x00010000 -offset 0x7C520000 $sys_addr_cntrl_space [get_bd_addr_segs axi_fmcomms2_df_i2c1/s_axi/Reg]  SEG_data_df_i2c1
create_bd_addr_seg -range 0x00010000 -offset 0x7C530000 $sys_addr_cntrl_space [get_bd_addr_segs axi_fmcomms2_df_i2c2/s_axi/Reg]  SEG_data_df_i2c2
create_bd_addr_seg -range 0x00010000 -offset 0x7C540000 $sys_addr_cntrl_space [get_bd_addr_segs axi_fmcomms2_df_i2c3/s_axi/Reg]  SEG_data_df_i2c3

::ipx::get_address_spaces *
puts [::ipx::get_address_spaces *]
::ipx::get_memory_maps *
puts [::ipx::get_memory_maps *]

#report_io -file io.txt
