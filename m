From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH 3/3] ARM: S3C24XX: header mach/regs-mem.h local
Date: Sun, 03 Feb 2013 17:18:31 -0800
Message-ID: <1359940711-29764-3-git-send-email-kgene.kim@samsung.com>
References: <1359940711-29764-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:18574 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753771Ab3BDBTf (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 3 Feb 2013 20:19:35 -0500
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MHO00G1I906YNF0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 04 Feb 2013 10:19:31 +0900 (KST)
Received: from localhost.localdomain ([105.128.18.183])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MHO00CIF90C7U10@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 04 Feb 2013 10:19:30 +0900 (KST)
In-reply-to: <1359940711-29764-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Kukjin Kim <kgene.kim@samsung.com>

Since header mach/regs-mem.h is used only into mach-s3c24xx/,
this patch moves the header file in local.

Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/mach-s3c24xx/cpufreq-utils.c         |    3 +-
 arch/arm/mach-s3c24xx/dma-s3c2410.c           |    1 -
 arch/arm/mach-s3c24xx/dma-s3c2412.c           |    1 -
 arch/arm/mach-s3c24xx/dma-s3c2440.c           |    1 -
 arch/arm/mach-s3c24xx/dma-s3c2443.c           |    1 -
 arch/arm/mach-s3c24xx/include/mach/regs-mem.h |  202 -------------------------
 arch/arm/mach-s3c24xx/iotiming-s3c2410.c      |    3 +-
 arch/arm/mach-s3c24xx/mach-anubis.c           |    1 -
 arch/arm/mach-s3c24xx/mach-at2440evb.c        |    1 -
 arch/arm/mach-s3c24xx/mach-bast.c             |    1 -
 arch/arm/mach-s3c24xx/mach-gta02.c            |    1 -
 arch/arm/mach-s3c24xx/mach-jive.c             |    1 -
 arch/arm/mach-s3c24xx/mach-mini2440.c         |    1 -
 arch/arm/mach-s3c24xx/mach-osiris.c           |    2 +-
 arch/arm/mach-s3c24xx/pm.c                    |    3 +-
 arch/arm/mach-s3c24xx/regs-mem.h              |   54 +++++++
 arch/arm/mach-s3c24xx/simtec-pm.c             |    3 +-
 arch/arm/mach-s3c24xx/sleep-s3c2410.S         |    3 +-
 arch/arm/mach-s3c24xx/sleep.S                 |    1 -
 19 files changed, 65 insertions(+), 219 deletions(-)
 delete mode 100644 arch/arm/mach-s3c24xx/include/mach/regs-mem.h
 create mode 100644 arch/arm/mach-s3c24xx/regs-mem.h

diff --git a/arch/arm/mach-s3c24xx/cpufreq-utils.c b/arch/arm/mach-s3c24xx/cpufreq-utils.c
index 89e4e2b..ddd8280 100644
--- a/arch/arm/mach-s3c24xx/cpufreq-utils.c
+++ b/arch/arm/mach-s3c24xx/cpufreq-utils.c
@@ -16,11 +16,12 @@
 #include <linux/io.h>
 
 #include <mach/map.h>
-#include <mach/regs-mem.h>
 #include <mach/regs-clock.h>
 
 #include <plat/cpu-freq-core.h>
 
+#include "regs-mem.h"
+
 /**
  * s3c2410_cpufreq_setrefresh - set SDRAM refresh value
  * @cfg: The frequency configuration
diff --git a/arch/arm/mach-s3c24xx/dma-s3c2410.c b/arch/arm/mach-s3c24xx/dma-s3c2410.c
index 6eb5be9..a6c94b8 100644
--- a/arch/arm/mach-s3c24xx/dma-s3c2410.c
+++ b/arch/arm/mach-s3c24xx/dma-s3c2410.c
@@ -27,7 +27,6 @@
 #include <mach/regs-gpio.h>
 #include <plat/regs-ac97.h>
 #include <plat/regs-dma.h>
-#include <mach/regs-mem.h>
 #include <mach/regs-lcd.h>
 #include <plat/regs-iis.h>
 #include <plat/regs-spi.h>
diff --git a/arch/arm/mach-s3c24xx/dma-s3c2412.c b/arch/arm/mach-s3c24xx/dma-s3c2412.c
index f239d09..c0e8c3f 100644
--- a/arch/arm/mach-s3c24xx/dma-s3c2412.c
+++ b/arch/arm/mach-s3c24xx/dma-s3c2412.c
@@ -27,7 +27,6 @@
 #include <mach/regs-gpio.h>
 #include <plat/regs-ac97.h>
 #include <plat/regs-dma.h>
-#include <mach/regs-mem.h>
 #include <mach/regs-lcd.h>
 #include <plat/regs-iis.h>
 #include <plat/regs-spi.h>
diff --git a/arch/arm/mach-s3c24xx/dma-s3c2440.c b/arch/arm/mach-s3c24xx/dma-s3c2440.c
index ca98189..1c08eccd 100644
--- a/arch/arm/mach-s3c24xx/dma-s3c2440.c
+++ b/arch/arm/mach-s3c24xx/dma-s3c2440.c
@@ -27,7 +27,6 @@
 #include <mach/regs-gpio.h>
 #include <plat/regs-ac97.h>
 #include <plat/regs-dma.h>
-#include <mach/regs-mem.h>
 #include <mach/regs-lcd.h>
 #include <plat/regs-iis.h>
 #include <plat/regs-spi.h>
diff --git a/arch/arm/mach-s3c24xx/dma-s3c2443.c b/arch/arm/mach-s3c24xx/dma-s3c2443.c
index d3448f6..000e4c6 100644
--- a/arch/arm/mach-s3c24xx/dma-s3c2443.c
+++ b/arch/arm/mach-s3c24xx/dma-s3c2443.c
@@ -27,7 +27,6 @@
 #include <mach/regs-gpio.h>
 #include <plat/regs-ac97.h>
 #include <plat/regs-dma.h>
-#include <mach/regs-mem.h>
 #include <mach/regs-lcd.h>
 #include <plat/regs-iis.h>
 #include <plat/regs-spi.h>
diff --git a/arch/arm/mach-s3c24xx/include/mach/regs-mem.h b/arch/arm/mach-s3c24xx/include/mach/regs-mem.h
deleted file mode 100644
index e0c67b0..0000000
--- a/arch/arm/mach-s3c24xx/include/mach/regs-mem.h
+++ /dev/null
@@ -1,202 +0,0 @@
-/* arch/arm/mach-s3c2410/include/mach/regs-mem.h
- *
- * Copyright (c) 2004 Simtec Electronics <linux@simtec.co.uk>
- *		http://www.simtec.co.uk/products/SWLINUX/
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
- *
- * S3C2410 Memory Control register definitions
-*/
-
-#ifndef __ASM_ARM_MEMREGS_H
-#define __ASM_ARM_MEMREGS_H
-
-#ifndef S3C2410_MEMREG
-#define S3C2410_MEMREG(x) (S3C24XX_VA_MEMCTRL + (x))
-#endif
-
-/* bus width, and wait state control */
-#define S3C2410_BWSCON			S3C2410_MEMREG(0x0000)
-
-/* bank zero config - note, pinstrapped from OM pins! */
-#define S3C2410_BWSCON_DW0_16		(1<<1)
-#define S3C2410_BWSCON_DW0_32		(2<<1)
-
-/* bank one configs */
-#define S3C2410_BWSCON_DW1_8		(0<<4)
-#define S3C2410_BWSCON_DW1_16		(1<<4)
-#define S3C2410_BWSCON_DW1_32		(2<<4)
-#define S3C2410_BWSCON_WS1		(1<<6)
-#define S3C2410_BWSCON_ST1		(1<<7)
-
-/* bank 2 configurations */
-#define S3C2410_BWSCON_DW2_8		(0<<8)
-#define S3C2410_BWSCON_DW2_16		(1<<8)
-#define S3C2410_BWSCON_DW2_32		(2<<8)
-#define S3C2410_BWSCON_WS2		(1<<10)
-#define S3C2410_BWSCON_ST2		(1<<11)
-
-/* bank 3 configurations */
-#define S3C2410_BWSCON_DW3_8		(0<<12)
-#define S3C2410_BWSCON_DW3_16		(1<<12)
-#define S3C2410_BWSCON_DW3_32		(2<<12)
-#define S3C2410_BWSCON_WS3		(1<<14)
-#define S3C2410_BWSCON_ST3		(1<<15)
-
-/* bank 4 configurations */
-#define S3C2410_BWSCON_DW4_8		(0<<16)
-#define S3C2410_BWSCON_DW4_16		(1<<16)
-#define S3C2410_BWSCON_DW4_32		(2<<16)
-#define S3C2410_BWSCON_WS4		(1<<18)
-#define S3C2410_BWSCON_ST4		(1<<19)
-
-/* bank 5 configurations */
-#define S3C2410_BWSCON_DW5_8		(0<<20)
-#define S3C2410_BWSCON_DW5_16		(1<<20)
-#define S3C2410_BWSCON_DW5_32		(2<<20)
-#define S3C2410_BWSCON_WS5		(1<<22)
-#define S3C2410_BWSCON_ST5		(1<<23)
-
-/* bank 6 configurations */
-#define S3C2410_BWSCON_DW6_8		(0<<24)
-#define S3C2410_BWSCON_DW6_16		(1<<24)
-#define S3C2410_BWSCON_DW6_32		(2<<24)
-#define S3C2410_BWSCON_WS6		(1<<26)
-#define S3C2410_BWSCON_ST6		(1<<27)
-
-/* bank 7 configurations */
-#define S3C2410_BWSCON_DW7_8		(0<<28)
-#define S3C2410_BWSCON_DW7_16		(1<<28)
-#define S3C2410_BWSCON_DW7_32		(2<<28)
-#define S3C2410_BWSCON_WS7		(1<<30)
-#define S3C2410_BWSCON_ST7		(1<<31)
-
-/* accesor functions for getting BANK(n) configuration. (n != 0) */
-
-#define S3C2410_BWSCON_GET(_bwscon, _bank) (((_bwscon) >> ((_bank) * 4)) & 0xf)
-
-#define S3C2410_BWSCON_DW8		(0)
-#define S3C2410_BWSCON_DW16		(1)
-#define S3C2410_BWSCON_DW32		(2)
-#define S3C2410_BWSCON_WS		(1 << 2)
-#define S3C2410_BWSCON_ST		(1 << 3)
-
-/* memory set (rom, ram) */
-#define S3C2410_BANKCON0		S3C2410_MEMREG(0x0004)
-#define S3C2410_BANKCON1		S3C2410_MEMREG(0x0008)
-#define S3C2410_BANKCON2		S3C2410_MEMREG(0x000C)
-#define S3C2410_BANKCON3		S3C2410_MEMREG(0x0010)
-#define S3C2410_BANKCON4		S3C2410_MEMREG(0x0014)
-#define S3C2410_BANKCON5		S3C2410_MEMREG(0x0018)
-#define S3C2410_BANKCON6		S3C2410_MEMREG(0x001C)
-#define S3C2410_BANKCON7		S3C2410_MEMREG(0x0020)
-
-/* bank configuration registers */
-
-#define S3C2410_BANKCON_PMCnorm		(0x00)
-#define S3C2410_BANKCON_PMC4		(0x01)
-#define S3C2410_BANKCON_PMC8		(0x02)
-#define S3C2410_BANKCON_PMC16		(0x03)
-
-/* bank configurations for banks 0..7, note banks
- * 6 and 7 have different configurations depending on
- * the memory type bits */
-
-#define S3C2410_BANKCON_Tacp2		(0x0 << 2)
-#define S3C2410_BANKCON_Tacp3		(0x1 << 2)
-#define S3C2410_BANKCON_Tacp4		(0x2 << 2)
-#define S3C2410_BANKCON_Tacp6		(0x3 << 2)
-#define S3C2410_BANKCON_Tacp_SHIFT	(2)
-
-#define S3C2410_BANKCON_Tcah0		(0x0 << 4)
-#define S3C2410_BANKCON_Tcah1		(0x1 << 4)
-#define S3C2410_BANKCON_Tcah2		(0x2 << 4)
-#define S3C2410_BANKCON_Tcah4		(0x3 << 4)
-#define S3C2410_BANKCON_Tcah_SHIFT	(4)
-
-#define S3C2410_BANKCON_Tcoh0		(0x0 << 6)
-#define S3C2410_BANKCON_Tcoh1		(0x1 << 6)
-#define S3C2410_BANKCON_Tcoh2		(0x2 << 6)
-#define S3C2410_BANKCON_Tcoh4		(0x3 << 6)
-#define S3C2410_BANKCON_Tcoh_SHIFT	(6)
-
-#define S3C2410_BANKCON_Tacc1		(0x0 << 8)
-#define S3C2410_BANKCON_Tacc2		(0x1 << 8)
-#define S3C2410_BANKCON_Tacc3		(0x2 << 8)
-#define S3C2410_BANKCON_Tacc4		(0x3 << 8)
-#define S3C2410_BANKCON_Tacc6		(0x4 << 8)
-#define S3C2410_BANKCON_Tacc8		(0x5 << 8)
-#define S3C2410_BANKCON_Tacc10		(0x6 << 8)
-#define S3C2410_BANKCON_Tacc14		(0x7 << 8)
-#define S3C2410_BANKCON_Tacc_SHIFT	(8)
-
-#define S3C2410_BANKCON_Tcos0		(0x0 << 11)
-#define S3C2410_BANKCON_Tcos1		(0x1 << 11)
-#define S3C2410_BANKCON_Tcos2		(0x2 << 11)
-#define S3C2410_BANKCON_Tcos4		(0x3 << 11)
-#define S3C2410_BANKCON_Tcos_SHIFT	(11)
-
-#define S3C2410_BANKCON_Tacs0		(0x0 << 13)
-#define S3C2410_BANKCON_Tacs1		(0x1 << 13)
-#define S3C2410_BANKCON_Tacs2		(0x2 << 13)
-#define S3C2410_BANKCON_Tacs4		(0x3 << 13)
-#define S3C2410_BANKCON_Tacs_SHIFT	(13)
-
-#define S3C2410_BANKCON_SRAM		(0x0 << 15)
-#define S3C2410_BANKCON_SDRAM		(0x3 << 15)
-
-/* next bits only for SDRAM in 6,7 */
-#define S3C2410_BANKCON_Trcd2		(0x00 << 2)
-#define S3C2410_BANKCON_Trcd3		(0x01 << 2)
-#define S3C2410_BANKCON_Trcd4		(0x02 << 2)
-
-/* control column address select */
-#define S3C2410_BANKCON_SCANb8		(0x00 << 0)
-#define S3C2410_BANKCON_SCANb9		(0x01 << 0)
-#define S3C2410_BANKCON_SCANb10		(0x02 << 0)
-
-#define S3C2410_REFRESH			S3C2410_MEMREG(0x0024)
-#define S3C2410_BANKSIZE		S3C2410_MEMREG(0x0028)
-#define S3C2410_MRSRB6			S3C2410_MEMREG(0x002C)
-#define S3C2410_MRSRB7			S3C2410_MEMREG(0x0030)
-
-/* refresh control */
-
-#define S3C2410_REFRESH_REFEN		(1<<23)
-#define S3C2410_REFRESH_SELF		(1<<22)
-#define S3C2410_REFRESH_REFCOUNTER	((1<<11)-1)
-
-#define S3C2410_REFRESH_TRP_MASK	(3<<20)
-#define S3C2410_REFRESH_TRP_2clk	(0<<20)
-#define S3C2410_REFRESH_TRP_3clk	(1<<20)
-#define S3C2410_REFRESH_TRP_4clk	(2<<20)
-
-#define S3C2410_REFRESH_TSRC_MASK	(3<<18)
-#define S3C2410_REFRESH_TSRC_4clk	(0<<18)
-#define S3C2410_REFRESH_TSRC_5clk	(1<<18)
-#define S3C2410_REFRESH_TSRC_6clk	(2<<18)
-#define S3C2410_REFRESH_TSRC_7clk	(3<<18)
-
-
-/* mode select register(s) */
-
-#define  S3C2410_MRSRB_CL1		(0x00 << 4)
-#define  S3C2410_MRSRB_CL2		(0x02 << 4)
-#define  S3C2410_MRSRB_CL3		(0x03 << 4)
-
-/* bank size register */
-#define S3C2410_BANKSIZE_128M		(0x2 << 0)
-#define S3C2410_BANKSIZE_64M		(0x1 << 0)
-#define S3C2410_BANKSIZE_32M		(0x0 << 0)
-#define S3C2410_BANKSIZE_16M		(0x7 << 0)
-#define S3C2410_BANKSIZE_8M		(0x6 << 0)
-#define S3C2410_BANKSIZE_4M		(0x5 << 0)
-#define S3C2410_BANKSIZE_2M		(0x4 << 0)
-#define S3C2410_BANKSIZE_MASK		(0x7 << 0)
-#define S3C2410_BANKSIZE_SCLK_EN	(1<<4)
-#define S3C2410_BANKSIZE_SCKE_EN	(1<<5)
-#define S3C2410_BANKSIZE_BURST		(1<<7)
-
-#endif /* __ASM_ARM_MEMREGS_H */
diff --git a/arch/arm/mach-s3c24xx/iotiming-s3c2410.c b/arch/arm/mach-s3c24xx/iotiming-s3c2410.c
index 48ccfcf..4cd13ab 100644
--- a/arch/arm/mach-s3c24xx/iotiming-s3c2410.c
+++ b/arch/arm/mach-s3c24xx/iotiming-s3c2410.c
@@ -19,11 +19,12 @@
 #include <linux/slab.h>
 
 #include <mach/map.h>
-#include <mach/regs-mem.h>
 #include <mach/regs-clock.h>
 
 #include <plat/cpu-freq-core.h>
 
+#include "regs-mem.h"
+
 #define print_ns(x) ((x) / 10), ((x) % 10)
 
 /**
diff --git a/arch/arm/mach-s3c24xx/mach-anubis.c b/arch/arm/mach-s3c24xx/mach-anubis.c
index 113304c..3767d51 100644
--- a/arch/arm/mach-s3c24xx/mach-anubis.c
+++ b/arch/arm/mach-s3c24xx/mach-anubis.c
@@ -34,7 +34,6 @@
 
 #include <plat/regs-serial.h>
 #include <mach/regs-gpio.h>
-#include <mach/regs-mem.h>
 #include <mach/regs-lcd.h>
 #include <linux/platform_data/mtd-nand-s3c2410.h>
 #include <linux/platform_data/i2c-s3c2410.h>
diff --git a/arch/arm/mach-s3c24xx/mach-at2440evb.c b/arch/arm/mach-s3c24xx/mach-at2440evb.c
index f51bbcb..2fa0517 100644
--- a/arch/arm/mach-s3c24xx/mach-at2440evb.c
+++ b/arch/arm/mach-s3c24xx/mach-at2440evb.c
@@ -35,7 +35,6 @@
 
 #include <plat/regs-serial.h>
 #include <mach/regs-gpio.h>
-#include <mach/regs-mem.h>
 #include <mach/regs-lcd.h>
 #include <linux/platform_data/mtd-nand-s3c2410.h>
 #include <linux/platform_data/i2c-s3c2410.h>
diff --git a/arch/arm/mach-s3c24xx/mach-bast.c b/arch/arm/mach-s3c24xx/mach-bast.c
index 1ed29b4..00d57f3 100644
--- a/arch/arm/mach-s3c24xx/mach-bast.c
+++ b/arch/arm/mach-s3c24xx/mach-bast.c
@@ -48,7 +48,6 @@
 #include <mach/hardware.h>
 #include <mach/regs-gpio.h>
 #include <mach/regs-lcd.h>
-#include <mach/regs-mem.h>
 
 #include <plat/clock.h>
 #include <plat/cpu.h>
diff --git a/arch/arm/mach-s3c24xx/mach-gta02.c b/arch/arm/mach-s3c24xx/mach-gta02.c
index 1053706..fa9bbe6 100644
--- a/arch/arm/mach-s3c24xx/mach-gta02.c
+++ b/arch/arm/mach-s3c24xx/mach-gta02.c
@@ -75,7 +75,6 @@
 #include <mach/hardware.h>
 #include <mach/regs-gpio.h>
 #include <mach/regs-irq.h>
-#include <mach/regs-mem.h>
 
 #include <plat/cpu.h>
 #include <plat/devs.h>
diff --git a/arch/arm/mach-s3c24xx/mach-jive.c b/arch/arm/mach-s3c24xx/mach-jive.c
index 0de85e3..ceaaf0b 100644
--- a/arch/arm/mach-s3c24xx/mach-jive.c
+++ b/arch/arm/mach-s3c24xx/mach-jive.c
@@ -36,7 +36,6 @@
 #include <linux/platform_data/i2c-s3c2410.h>
 
 #include <mach/regs-gpio.h>
-#include <mach/regs-mem.h>
 #include <mach/regs-lcd.h>
 #include <mach/fb.h>
 
diff --git a/arch/arm/mach-s3c24xx/mach-mini2440.c b/arch/arm/mach-s3c24xx/mach-mini2440.c
index a31d5b8..64494ff 100644
--- a/arch/arm/mach-s3c24xx/mach-mini2440.c
+++ b/arch/arm/mach-s3c24xx/mach-mini2440.c
@@ -40,7 +40,6 @@
 #include <plat/regs-serial.h>
 #include <mach/regs-gpio.h>
 #include <linux/platform_data/leds-s3c24xx.h>
-#include <mach/regs-mem.h>
 #include <mach/regs-lcd.h>
 #include <mach/irqs.h>
 #include <linux/platform_data/mtd-nand-s3c2410.h>
diff --git a/arch/arm/mach-s3c24xx/mach-osiris.c b/arch/arm/mach-s3c24xx/mach-osiris.c
index 1eeeee4..572f1c8 100644
--- a/arch/arm/mach-s3c24xx/mach-osiris.c
+++ b/arch/arm/mach-s3c24xx/mach-osiris.c
@@ -47,11 +47,11 @@
 
 #include <mach/hardware.h>
 #include <mach/regs-gpio.h>
-#include <mach/regs-mem.h>
 #include <mach/regs-lcd.h>
 
 #include "common.h"
 #include "osiris.h"
+#include "regs-mem.h"
 
 /* onboard perihperal map */
 
diff --git a/arch/arm/mach-s3c24xx/pm.c b/arch/arm/mach-s3c24xx/pm.c
index 724755f..caa5b72 100644
--- a/arch/arm/mach-s3c24xx/pm.c
+++ b/arch/arm/mach-s3c24xx/pm.c
@@ -38,7 +38,6 @@
 #include <plat/regs-serial.h>
 #include <mach/regs-clock.h>
 #include <mach/regs-gpio.h>
-#include <mach/regs-mem.h>
 #include <mach/regs-irq.h>
 
 #include <asm/mach/time.h>
@@ -46,6 +45,8 @@
 #include <plat/gpio-cfg.h>
 #include <plat/pm.h>
 
+#include "regs-mem.h"
+
 #define PFX "s3c24xx-pm: "
 
 static struct sleep_save core_save[] = {
diff --git a/arch/arm/mach-s3c24xx/regs-mem.h b/arch/arm/mach-s3c24xx/regs-mem.h
new file mode 100644
index 0000000..86b1258
--- /dev/null
+++ b/arch/arm/mach-s3c24xx/regs-mem.h
@@ -0,0 +1,54 @@
+/*
+ * Copyright (c) 2004 Simtec Electronics <linux@simtec.co.uk>
+ *		http://www.simtec.co.uk/products/SWLINUX/
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ * S3C2410 Memory Control register definitions
+ */
+
+#ifndef __ARCH_ARM_MACH_S3C24XX_REGS_MEM_H
+#define __ARCH_ARM_MACH_S3C24XX_REGS_MEM_H __FILE__
+
+#define S3C2410_MEMREG(x)		(S3C24XX_VA_MEMCTRL + (x))
+
+#define S3C2410_BWSCON			S3C2410_MEMREG(0x00)
+#define S3C2410_BANKCON0		S3C2410_MEMREG(0x04)
+#define S3C2410_BANKCON1		S3C2410_MEMREG(0x08)
+#define S3C2410_BANKCON2		S3C2410_MEMREG(0x0C)
+#define S3C2410_BANKCON3		S3C2410_MEMREG(0x10)
+#define S3C2410_BANKCON4		S3C2410_MEMREG(0x14)
+#define S3C2410_BANKCON5		S3C2410_MEMREG(0x18)
+#define S3C2410_BANKCON6		S3C2410_MEMREG(0x1C)
+#define S3C2410_BANKCON7		S3C2410_MEMREG(0x20)
+#define S3C2410_REFRESH			S3C2410_MEMREG(0x24)
+#define S3C2410_BANKSIZE		S3C2410_MEMREG(0x28)
+
+#define S3C2410_BWSCON_ST1		(1 << 7)
+#define S3C2410_BWSCON_ST2		(1 << 11)
+#define S3C2410_BWSCON_ST3		(1 << 15)
+#define S3C2410_BWSCON_ST4		(1 << 19)
+#define S3C2410_BWSCON_ST5		(1 << 23)
+
+#define S3C2410_BWSCON_GET(_bwscon, _bank) (((_bwscon) >> ((_bank) * 4)) & 0xf)
+
+#define S3C2410_BWSCON_WS		(1 << 2)
+
+#define S3C2410_BANKCON_PMC16		(0x3)
+
+#define S3C2410_BANKCON_Tacp_SHIFT	(2)
+#define S3C2410_BANKCON_Tcah_SHIFT	(4)
+#define S3C2410_BANKCON_Tcoh_SHIFT	(6)
+#define S3C2410_BANKCON_Tacc_SHIFT	(8)
+#define S3C2410_BANKCON_Tcos_SHIFT	(11)
+#define S3C2410_BANKCON_Tacs_SHIFT	(13)
+
+#define S3C2410_BANKCON_SDRAM		(0x3 << 15)
+
+#define S3C2410_REFRESH_SELF		(1 << 22)
+
+#define S3C2410_BANKSIZE_MASK		(0x7 << 0)
+
+#endif /* __ARCH_ARM_MACH_S3C24XX_REGS_MEM_H */
diff --git a/arch/arm/mach-s3c24xx/simtec-pm.c b/arch/arm/mach-s3c24xx/simtec-pm.c
index 699f931..38a2f1f 100644
--- a/arch/arm/mach-s3c24xx/simtec-pm.c
+++ b/arch/arm/mach-s3c24xx/simtec-pm.c
@@ -28,12 +28,13 @@
 
 #include <mach/map.h>
 #include <mach/regs-gpio.h>
-#include <mach/regs-mem.h>
 
 #include <asm/mach-types.h>
 
 #include <plat/pm.h>
 
+#include "regs-mem.h"
+
 #define COPYRIGHT ", Copyright 2005 Simtec Electronics"
 
 /* pm_simtec_init
diff --git a/arch/arm/mach-s3c24xx/sleep-s3c2410.S b/arch/arm/mach-s3c24xx/sleep-s3c2410.S
index dd5b638..25b2121 100644
--- a/arch/arm/mach-s3c24xx/sleep-s3c2410.S
+++ b/arch/arm/mach-s3c24xx/sleep-s3c2410.S
@@ -31,9 +31,10 @@
 
 #include <mach/regs-gpio.h>
 #include <mach/regs-clock.h>
-#include <mach/regs-mem.h>
 #include <plat/regs-serial.h>
 
+#include "regs-mem.h"
+
 	/* s3c2410_cpu_suspend
 	 *
 	 * put the cpu into sleep mode
diff --git a/arch/arm/mach-s3c24xx/sleep.S b/arch/arm/mach-s3c24xx/sleep.S
index c566125..7f378b6 100644
--- a/arch/arm/mach-s3c24xx/sleep.S
+++ b/arch/arm/mach-s3c24xx/sleep.S
@@ -31,7 +31,6 @@
 
 #include <mach/regs-gpio.h>
 #include <mach/regs-clock.h>
-#include <mach/regs-mem.h>
 #include <plat/regs-serial.h>
 
 /* CONFIG_DEBUG_RESUME is dangerous if your bootloader does not
-- 
1.7.10.4
