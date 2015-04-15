
LIBRARIES := axi_ad6676 axi_ad7175 axi_ad9122 axi_ad9144 axi_ad9152 \
	axi_ad9234 axi_ad9250 axi_ad9265 axi_ad9361 axi_ad9434 \
	axi_ad9467 axi_ad9625 axi_ad9643 axi_ad9652 axi_ad9671 \
	axi_ad9680 axi_ad9739a axi_clkgen axi_dmac \
	axi_fifo2f axi_fifo2s \
	axi_hdmi_tx axi_i2s_adi axi_jesd_gt \
	axi_mc_controller axi_mc_current_monitor axi_mc_speed \
	axi_spdif_tx controllerperipheralhdladi_pcore \
	scripts \
	util_adc_pack util_cpack util_dac_unpack util_gmii_to_rgmii util_i2c_mixer \
	util_rfifo util_sync_reset util_wfifo
#No *_ip.tcl file: axi_fifo common ip_pid_controller prcfg 

PROJECTS := ad6676evb ad9265_fmc ad9434_fmc ad9467_fmc ad9671_fmc \
	ad9739a_fmc adv7511 common \
	daq1 daq2 daq3 \
	fmcadc2 fmcadc4 fmcadc5 fmcjesdadc1 \
	fmcomms1 fmcomms2 fmcomms2_pr fmcomms5 fmcomms6 fmcomms7 \
	motcon2_fmc pmods scripts usdrx1

ARCH := a5gt a5gte a5soc ac701 ad7175_zed c5soc cpld kc705 kcu105 mitx045 ml605 vc707 xfest14_zed xilinx zc702 zc706 zed

all:
	for libname in $(LIBRARIES) ; do \
	    make $$libname; \
	done

define LIBRARY_RULE
library/$1/component.xml:
	echo Building $1; \
	cd library/$1; vivado -mode batch -source $1_ip.tcl 

$1: library/$1/component.xml
endef

$(foreach libname,$(LIBRARIES), $(eval $(call LIBRARY_RULE,$(libname))))

define PROJECT_RULE
projects/$1/$2/foo:
	echo Building $1; \
	cd projects/$1/$2; vivado -mode batch -source system_project.tcl 

$1.$2: projects/$1/$2/foo
endef

define APROJECT_RULE
$(foreach archname,$(ARCH), $(eval $(call PROJECT_RULE,$1,$(archname))))
endef

$(foreach projname,$(PROJECTS), $(eval $(call APROJECT_RULE,$(projname))))
