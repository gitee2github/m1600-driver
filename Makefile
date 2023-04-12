# SPDX-License-Identifier: GPL-2.0
# Copyright (c) 2022 Nebula Matrix Limited.
# Author: Monte Song <monte.song@nebula-matrix.com>

ccflags-y += -DCONFIG_NBL_DEBUGFS

ifeq ($(KERNELRELEASE),)

KERNELDIR ?= /lib/modules/$(shell uname -r)/build
PWD := $(shell pwd)

modules:
	$(MAKE) -C $(KERNELDIR) M=$(PWD) modules

modules_install:
	$(MAKE) -C $(KERNELDIR) M=$(PWD) modules_install

clean:
	$(MAKE) -C $(KERNELDIR) M=$(PWD) clean

else

obj-m += m1600.o

m1600-objs += main.o \
	ethtool.o \
	common.o \
	interrupt.o \
	txrx.o \
	mailbox.o \
	debug.o \
	hwmon.o \
	macvlan.o \
	sriov.o

endif
