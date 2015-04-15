## copied from $ad_hdl_dir/projects/fmcomms2/zed/system_bd.tcl
source $ad_hdl_dir/projects/common/zed/zed_system_bd.tcl
source $ad_hdl_dir/projects/fmcomms2/common/fmcomms2_bd.tcl

report_property $axi_cpu_interconnect
set_property -dict [list CONFIG.NUM_MI {15}] $axi_cpu_interconnect

set axi_fmcomms2_df_gpio [create_bd_cell -type ip -vlnv xilinx.com:ip:axi_gpio axi_fmcomms2_df_gpio]
set_property -dict [list CONFIG.C_GPIO_WIDTH {4} CONFIG.C_INTERRUPT_PRESENT {1}] $axi_fmcomms2_df_gpio
connect_bd_intf_net -intf_net axi_cpu_interconnect_m10_axi [get_bd_intf_pins axi_cpu_interconnect/M10_AXI] [get_bd_intf_pins axi_fmcomms2_df_gpio/s_axi]
connect_bd_net -net sys_100m_clk [get_bd_pins axi_cpu_interconnect/M10_ACLK] $sys_100m_clk_source
connect_bd_net -net sys_100m_clk [get_bd_pins axi_fmcomms2_df_gpio/s_axi_aclk] $sys_100m_clk_source

set axi_fmcomms2_df_i2c0 [create_bd_cell -type ip -vlnv xilinx.com:ip:axi_iic axi_fmcomms2_df_i2c0]
#set_property -dict [list CONFIG.AXI_ACLK_FREQ_MHZ {200}] $axi_fmcomms2_df_i2c0
connect_bd_intf_net -intf_net axi_cpu_interconnect_m11_axi [get_bd_intf_pins axi_cpu_interconnect/M11_AXI] [get_bd_intf_pins axi_fmcomms2_df_i2c0/s_axi]
connect_bd_net -net sys_100m_clk [get_bd_pins axi_cpu_interconnect/M11_ACLK] $sys_100m_clk_source
connect_bd_net -net sys_100m_clk [get_bd_pins axi_fmcomms2_df_i2c0/s_axi_aclk] $sys_100m_clk_source

set axi_fmcomms2_df_i2c1 [create_bd_cell -type ip -vlnv xilinx.com:ip:axi_iic axi_fmcomms2_df_i2c1]
#set_property -dict [list CONFIG.AXI_ACLK_FREQ_MHZ {200}] $axi_fmcomms2_df_i2c1
connect_bd_intf_net -intf_net axi_cpu_interconnect_m12_axi [get_bd_intf_pins axi_cpu_interconnect/M12_AXI] [get_bd_intf_pins axi_fmcomms2_df_i2c1/s_axi]
connect_bd_net -net sys_100m_clk [get_bd_pins axi_cpu_interconnect/M12_ACLK] $sys_100m_clk_source
connect_bd_net -net sys_100m_clk [get_bd_pins axi_fmcomms2_df_i2c1/s_axi_aclk] $sys_100m_clk_source

set axi_fmcomms2_df_i2c2 [create_bd_cell -type ip -vlnv xilinx.com:ip:axi_iic axi_fmcomms2_df_i2c2]
#set_property -dict [list CONFIG.AXI_ACLK_FREQ_MHZ {200}] $axi_fmcomms2_df_i2c2
connect_bd_intf_net -intf_net axi_cpu_interconnect_m13_axi [get_bd_intf_pins axi_cpu_interconnect/M13_AXI] [get_bd_intf_pins axi_fmcomms2_df_i2c2/s_axi]
connect_bd_net -net sys_100m_clk [get_bd_pins axi_cpu_interconnect/M13_ACLK] $sys_100m_clk_source
connect_bd_net -net sys_100m_clk [get_bd_pins axi_fmcomms2_df_i2c2/s_axi_aclk] $sys_100m_clk_source

set axi_fmcomms2_df_i2c3 [create_bd_cell -type ip -vlnv xilinx.com:ip:axi_iic axi_fmcomms2_df_i2c3]
#set_property -dict [list CONFIG.AXI_ACLK_FREQ_MHZ {200}] $axi_fmcomms2_df_i2c3
connect_bd_intf_net -intf_net axi_cpu_interconnect_m14_axi [get_bd_intf_pins axi_cpu_interconnect/M14_AXI] [get_bd_intf_pins axi_fmcomms2_df_i2c3/s_axi]
connect_bd_net -net sys_100m_clk [get_bd_pins axi_cpu_interconnect/M14_ACLK] $sys_100m_clk_source
connect_bd_net -net sys_100m_clk [get_bd_pins axi_fmcomms2_df_i2c3/s_axi_aclk] $sys_100m_clk_source
