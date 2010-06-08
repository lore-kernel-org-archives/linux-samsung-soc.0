From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH v2 0/5] Add support for Samsung CF controller
Date: Tue,  8 Jun 2010 18:06:55 +0900
Message-ID: <1275988020-29000-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:55933 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751961Ab0FHJNA (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 8 Jun 2010 05:13:00 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-ide@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, jgarzik@pobox.com

This is v2 of the patchset adding support for Samsung's CF controller. 
Note: Depends on Ben Dook's platform_data helper patch

Changes since v1:

	- Made a seperate patch for plat-samsung changes
	- Moved CF true-ide configuration to driver code from
	  platform-specific setup code
	- Reduced memory allocated for CF device  
	- Renamed driver file to pata_samsung_cf.c
	- Used resource_size() function in ioremap
	- Used new dev_pm_ops

	- readl/writel functions consistently used
	- Used ata_pio_need_iordy, ata_timing_find_mode for setting up
	  pio mode instead of using own timing parameters
	- Removed useless checks in tf functions
	- Added overrides for sff_dev_select, sff_check_altstatus and
	  sff_set_devctl
	- Used platform_get_drvdata/platform_set_drvdata
	- Added request_mem_region which was missing 
	- Misc coding guideline changes - typos, extra includes,
	  parenthesis etc.

	- Changed the device naming override to follow onenand/iic style.

	- Removed the qc_prep override
	- Based the new patch on upstream branch of libata-dev

	- Used 'linux/gpio.h' in place of 'mach/gpio.h'

This patch set includes the following patches:

[PATCH v2 1/5] libata: pata_samsung: Add Samsung PATA controller driver
[PATCH v2 2/5] ARM: SAMSUNG: Add Compact Flash device support for Samsung SoCs
[PATCH v2 3/5] ARM: S3C64XX: Add support for Compact Flash driver on SMDK6410
[PATCH v2 4/5] ARM: S5PC100: Add support for Compact Flash driver on SMDKC100
[PATCH v2 5/5] ARM: S5PV210: Add support for Compact Flash driver on SMDKV210/C110
