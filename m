From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH v2 0/3] regulator: max8998: Add support for Device Tree
Date: Fri, 21 Jun 2013 14:33:34 +0200
Message-ID: <1371818017-5215-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:62912 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1161083Ab3FUMeA (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 21 Jun 2013 08:34:00 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Kukjin Kim <kgene.kim@samsung.com>, Alessandro Zummo <a.zummo@towertech.it>, Grant Likely <grant.likely@linaro.org>, Jiri Kosina <jkosina@suse.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Masanari Iida <standby24x7@gmail.com>, Rob Herring <rob.herring@calxeda.com>, Rob Landley <rob@landley.net>, rtc-linux@googlegroups.com, Russell King <linux@arm.linux.org.uk>, Samuel Ortiz <sameo@linux.intel.com>, Tomasz Figa <t.figa@samsung.com>

This series adds Device Tree support to max8998 MFD driver.

First patch reworks max8998-irq driver to use IRQ domains. Second patch
prepares platform data structure to ease generating it at runtime from
data parsed from device tree. Third patch implements Device Tree
binding and adds necessary documentation.

Tested on Universal C210 board.

Changes since v1:
 - rebased to current for-next of regulator tree

Tomasz Figa (3):
  mfd: Add irq domain support for max8998 interrupts
  regulator: max8998: Use arrays for specifying voltages in platform
    data
  mfd: max8998: Add support for Device Tree

 Documentation/devicetree/bindings/mfd/max8998.txt | 111 ++++++++++
 arch/arm/mach-exynos/mach-universal_c210.c        |   8 +-
 arch/arm/mach-s5pv210/mach-aquila.c               |   8 +-
 arch/arm/mach-s5pv210/mach-goni.c                 |   8 +-
 drivers/mfd/Kconfig                               |   1 +
 drivers/mfd/max8998-irq.c                         |  61 +++---
 drivers/mfd/max8998.c                             |  76 ++++++-
 drivers/regulator/max8998.c                       | 254 ++++++++++++++++------
 drivers/rtc/rtc-max8998.c                         |  14 +-
 include/linux/mfd/max8998-private.h               |   6 +-
 include/linux/mfd/max8998.h                       |  20 +-
 11 files changed, 433 insertions(+), 134 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mfd/max8998.txt

-- 
1.8.2.1
