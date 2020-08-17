# SPDX-License-Identifier: GPL-2.0
ccflags-y += -I$(src)/ -DWILC_ASIC_A0 -DWILC_DEBUGFS
ccflags-y += -DDISABLE_PWRSAVE_AND_SCAN_DURING_IP


wilc-objs := wilc_wfi_cfgoperations.o linux_wlan.o linux_mon.o \
			host_interface.o wilc_wlan_cfg.o wilc_debugfs.o \
			wilc_wlan.o sysfs.o wilc_bt.o

obj-m += wilc-sdio.o
wilc-sdio-objs += $(wilc-objs)
wilc-sdio-objs += wilc_sdio.o

all:
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) modules

clean:
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) clean
