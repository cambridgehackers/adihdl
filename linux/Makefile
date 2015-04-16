
#
# Built on Ubuntu 14.04
#
# Instructions taken from:
#     http://wiki.analog.com/resources/tools-software/linux-drivers/platforms/zynq
#
# Before building:
#     apt-get install gcc-arm-linux-gnueabi u-boot-tools

all:
	if [ -d linux ]; then true; else git clone git@github.com:analogdevicesinc/linux.git; fi
	(set -e; cd linux/; \
        git checkout xcomm_zynq; \
	make ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- zynq_xcomm_adv7511_defconfig; \
	make -j8 ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- uImage LOADADDR=0x00008000)
