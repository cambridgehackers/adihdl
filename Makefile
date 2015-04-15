
LIBRARIES := axi_ad6676 axi_ad7175 axi_ad9122 axi_ad9144 axi_ad9152 \
	axi_ad9234 axi_ad9250 axi_ad9265 axi_ad9361 axi_ad9434 \
	axi_ad9467 axi_ad9625 axi_ad9643 axi_ad9652 axi_ad9671 \
	axi_ad9680 axi_ad9739a axi_clkgen axi_dmac \
	axi_fifo axi_fifo2f axi_fifo2s \
	axi_hdmi_tx axi_i2s_adi axi_jesd_gt \
	axi_mc_controller axi_mc_current_monitor axi_mc_speed \
	axi_spdif_tx common controllerperipheralhdladi_pcore \
	ip_pid_controller prcfg scripts \
	util_adc_pack util_cpack util_dac_unpack util_gmii_to_rgmii util_i2c_mixer \
	util_rfifo util_sync_reset util_wfifo

all:
	for libname in $(LIBRARIES) ; do \
	    make $$libname; \
	done

define TARGET_RULE
library/$1/component.xml:
	echo Building $1; \
	cd library/$1; vivado -mode batch -source $1_ip.tcl 

$1: library/$1/component.xml
endef

$(foreach libname,$(LIBRARIES), $(eval $(call TARGET_RULE,$(libname))))
