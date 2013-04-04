From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH 0/3] regulator: max8998: Add support for Device Tree
Date: Thu, 04 Apr 2013 18:19:20 +0200
Message-ID: <1365092363-12763-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: devicetree-discuss@lists.ozlabs.org, linux-samsung-soc@vger.kernel.org, kyungmin.park@samsung.com, lrg@ti.com, broonie@opensource.wolfsonmicro.com, m.szyprowski@samsung.com, kgene.kim@samsung.com, Tomasz Figa <t.figa@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

This series adds Device Tree support to max8998 MFD driver.

First patch reworks max8998-irq driver to use IRQ domains. Second patch
prepares platform data structure to ease generating it at runtime from
data parsed from device tree. Third patch implements Device Tree
binding and adds necessary documentation.

Tested on Universal C210 board.

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
 drivers/rtc/rtc-max8998.c                         |  17 +-
 include/linux/mfd/max8998-private.h               |   6 +-
 include/linux/mfd/max8998.h                       |  20 +-
 11 files changed, 435 insertions(+), 135 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mfd/max8998.txt

-- 
1.8.1.5
