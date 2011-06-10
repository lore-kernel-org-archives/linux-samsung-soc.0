From: Anand Kumar N <anand.kn@samsung.com>
Subject: [RE-SEND] [PATCH 2/4] ARM: EXYNOS4: Add platform device and helper
 functions for FIMD
Date: Fri, 10 Jun 2011 13:45:21 +0530
Message-ID: <1307693723-14971-3-git-send-email-anand.kn@samsung.com>
References: <1307693723-14971-1-git-send-email-anand.kn@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:9501 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754572Ab1FJIQU (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 10 Jun 2011 04:16:20 -0400
Received: from epcpsbgm2.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LMK0083MEYSKPP0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 10 Jun 2011 17:16:18 +0900 (KST)
Received: from anand-ubuntu.sisodomain.com (unknown [107.108.215.66])
 by mmp1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTPA id <0LMK009OSEYVA360@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 10 Jun 2011 17:16:18 +0900 (KST)
In-reply-to: <1307693723-14971-1-git-send-email-anand.kn@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: lethal@linux-sh.org, kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org, jg1.han@samsung.com, jonghun.han@samsung.com, thomas.ab@samsung.com, anand.kn@samsung.com

From: Jonghun Han <jonghun.han@samsung.com>

This patch adds platform device s5p_device_fimd0 for EXYNOS4 FIMD0.
EXYNOS4 has two FIMDs(FIMD0, FIMD1). FIMD1 will be added later.
Some definitions used to enable EXYNOS4 FIMD0 are added.

Signed-off-by: Jonghun Han <jonghun.han@samsung.com>
Signed-off-by: Jingoo Han <jg1.han@samsung.com>
---
 arch/arm/mach-exynos4/Kconfig                |    9 ++++
 arch/arm/mach-exynos4/Makefile               |    1 +
 arch/arm/mach-exynos4/cpu.c                  |    4 +-
 arch/arm/mach-exynos4/include/mach/regs-fb.h |   21 ++++++++
 arch/arm/mach-exynos4/setup-fimd0-24bpp.c    |   47 ++++++++++++++++++
 arch/arm/plat-s5p/Kconfig                    |    5 ++
 arch/arm/plat-s5p/Makefile                   |    1 +
 arch/arm/plat-s5p/dev-fimd0.c                |   67 ++++++++++++++++++++++++++
 arch/arm/plat-samsung/include/plat/devs.h    |    1 +
 arch/arm/plat-samsung/include/plat/fb-core.h |   15 ++++++
 arch/arm/plat-samsung/include/plat/fb.h      |   14 +++++
 11 files changed, 184 insertions(+), 1 deletions(-)
 create mode 100644 arch/arm/mach-exynos4/include/mach/regs-fb.h
 create mode 100644 arch/arm/mach-exynos4/setup-fimd0-24bpp.c
 create mode 100644 arch/arm/plat-s5p/dev-fimd0.c

diff --git a/arch/arm/mach-exynos4/Kconfig b/arch/arm/mach-exynos4/Kconfig
index 1435fc3..9161920 100644
--- a/arch/arm/mach-exynos4/Kconfig
+++ b/arch/arm/mach-exynos4/Kconfig
@@ -25,6 +25,11 @@ config EXYNOS4_DEV_AHCI
 	help
 	  Compile in platform device definitions for AHCI
 
+config EXYNOS4_SETUP_FIMD0_24BPP
+	bool
+	help
+	  Common setup code for FIMD0 with a 24bpp RGB display helper.
+
 config EXYNOS4_DEV_PD
 	bool
 	help
@@ -103,6 +108,7 @@ menu "EXYNOS4 Machines"
 config MACH_SMDKC210
 	bool "SMDKC210"
 	select CPU_EXYNOS4210
+	select S5P_DEV_FIMD0
 	select S3C_DEV_RTC
 	select S3C_DEV_WDT
 	select S3C_DEV_I2C1
@@ -112,6 +118,7 @@ config MACH_SMDKC210
 	select S3C_DEV_HSMMC3
 	select EXYNOS4_DEV_PD
 	select EXYNOS4_DEV_SYSMMU
+	select EXYNOS4_SETUP_FIMD0_24BPP
 	select EXYNOS4_SETUP_I2C1
 	select EXYNOS4_SETUP_SDHCI
 	help
@@ -130,6 +137,7 @@ config MACH_SMDKV310
 	select SAMSUNG_DEV_KEYPAD
 	select EXYNOS4_DEV_PD
 	select EXYNOS4_DEV_SYSMMU
+	select EXYNOS4_SETUP_FIMD0_24BPP
 	select EXYNOS4_SETUP_I2C1
 	select EXYNOS4_SETUP_KEYPAD
 	select EXYNOS4_SETUP_SDHCI
@@ -139,6 +147,7 @@ config MACH_SMDKV310
 config MACH_ARMLEX4210
 	bool "ARMLEX4210"
 	select CPU_EXYNOS4210
+	select S5P_DEV_FIMD0
 	select S3C_DEV_RTC
 	select S3C_DEV_WDT
 	select S3C_DEV_HSMMC
diff --git a/arch/arm/mach-exynos4/Makefile b/arch/arm/mach-exynos4/Makefile
index 60fe5ec..aa4d1f4 100644
--- a/arch/arm/mach-exynos4/Makefile
+++ b/arch/arm/mach-exynos4/Makefile
@@ -45,6 +45,7 @@ obj-$(CONFIG_EXYNOS4_DEV_PD)		+= dev-pd.o
 obj-$(CONFIG_EXYNOS4_DEV_SYSMMU)	+= dev-sysmmu.o
 
 obj-$(CONFIG_EXYNOS4_SETUP_FIMC)	+= setup-fimc.o
+obj-$(CONFIG_EXYNOS4_SETUP_FIMD0_24BPP)	+= setup-fimd0-24bpp.o
 obj-$(CONFIG_EXYNOS4_SETUP_I2C1)	+= setup-i2c1.o
 obj-$(CONFIG_EXYNOS4_SETUP_I2C2)	+= setup-i2c2.o
 obj-$(CONFIG_EXYNOS4_SETUP_I2C3)	+= setup-i2c3.o
diff --git a/arch/arm/mach-exynos4/cpu.c b/arch/arm/mach-exynos4/cpu.c
index 1196f39..67a3b3c 100644
--- a/arch/arm/mach-exynos4/cpu.c
+++ b/arch/arm/mach-exynos4/cpu.c
@@ -19,9 +19,10 @@
 
 #include <plat/cpu.h>
 #include <plat/clock.h>
+#include <plat/devs.h>
+#include <plat/fb-core.h>
 #include <plat/exynos4.h>
 #include <plat/sdhci.h>
-#include <plat/devs.h>
 #include <plat/fimc-core.h>
 
 #include <mach/regs-irq.h>
@@ -137,6 +138,7 @@ void __init exynos4_map_io(void)
 	s3c_fimc_setname(1, "exynos4-fimc");
 	s3c_fimc_setname(2, "exynos4-fimc");
 	s3c_fimc_setname(3, "exynos4-fimc");
+	s5p_fb_setname(0, "exynos4-fb");	/* FIMD0 */
 }
 
 void __init exynos4_init_clocks(int xtal)
diff --git a/arch/arm/mach-exynos4/include/mach/regs-fb.h b/arch/arm/mach-exynos4/include/mach/regs-fb.h
new file mode 100644
index 0000000..f320105
--- /dev/null
+++ b/arch/arm/mach-exynos4/include/mach/regs-fb.h
@@ -0,0 +1,21 @@
+/*
+ * Copyright 2010 Ben Dooks <ben-linux@fluff.org>
+ *
+ * Dummy framebuffer to allow build for the moment.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+*/
+
+#ifndef __ASM_ARCH_MACH_REGS_FB_H
+#define __ASM_ARCH_MACH_REGS_FB_H __FILE__
+
+#include <plat/regs-fb-v4.h>
+
+static inline unsigned int s3c_fb_pal_reg(unsigned int window, int reg)
+{
+	return 0x2400 + (window * 256 * 4) + reg;
+}
+
+#endif /* __ASM_ARCH_MACH_REGS_FB_H */
diff --git a/arch/arm/mach-exynos4/setup-fimd0-24bpp.c b/arch/arm/mach-exynos4/setup-fimd0-24bpp.c
new file mode 100644
index 0000000..18fa84a
--- /dev/null
+++ b/arch/arm/mach-exynos4/setup-fimd0-24bpp.c
@@ -0,0 +1,47 @@
+/* linux/arch/arm/mach-exynos4/setup-fimd0-24bpp.c
+ *
+ * Copyright (c) 2009-2010 Samsung Electronics Co., Ltd.
+ *             http://www.samsung.com
+ *
+ * Base s5pv210 setup information for 24bpp LCD framebuffer
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+*/
+
+#include <linux/kernel.h>
+#include <linux/types.h>
+#include <linux/fb.h>
+#include <linux/gpio.h>
+
+#include <plat/fb.h>
+#include <plat/gpio-cfg.h>
+
+#include <mach/regs-clock.h>
+#include <mach/regs-fb.h>
+#include <mach/map.h>
+
+void exynos4_fimd0_gpio_setup_24bpp(void)
+{
+	unsigned int reg = 0;
+
+	s3c_gpio_cfgrange_nopull(EXYNOS4_GPF0(0), 8, S3C_GPIO_SFN(2));
+	s3c_gpio_cfgrange_nopull(EXYNOS4_GPF1(0), 8, S3C_GPIO_SFN(2));
+	s3c_gpio_cfgrange_nopull(EXYNOS4_GPF2(0), 8, S3C_GPIO_SFN(2));
+	s3c_gpio_cfgrange_nopull(EXYNOS4_GPF3(0), 4, S3C_GPIO_SFN(2));
+
+	/*
+	 * Set DISPLAY_CONTROL register for Display path selection.
+	 *
+	 * DISPLAY_CONTROL[1:0]
+	 * ---------------------
+	 *  00 | MIE
+	 *  01 | MDINE
+	 *  10 | FIMD : selected
+	 *  11 | FIMD
+	 */
+	reg = __raw_readl(S3C_VA_SYS + 0x0210);
+	reg |= (1 << 1);
+	__raw_writel(reg, S3C_VA_SYS + 0x0210);
+}
diff --git a/arch/arm/plat-s5p/Kconfig b/arch/arm/plat-s5p/Kconfig
index e98f5c5..46de16e 100644
--- a/arch/arm/plat-s5p/Kconfig
+++ b/arch/arm/plat-s5p/Kconfig
@@ -70,6 +70,11 @@ config S5P_DEV_FIMC3
 	help
 	  Compile in platform device definitions for FIMC controller 3
 
+config S5P_DEV_FIMD0
+	bool
+	help
+	  Compile in platform device definitions for FIMD controller 0
+
 config S5P_DEV_ONENAND
 	bool
 	help
diff --git a/arch/arm/plat-s5p/Makefile b/arch/arm/plat-s5p/Makefile
index e234cc4..eec7e24 100644
--- a/arch/arm/plat-s5p/Makefile
+++ b/arch/arm/plat-s5p/Makefile
@@ -30,6 +30,7 @@ obj-$(CONFIG_S5P_DEV_FIMC0)	+= dev-fimc0.o
 obj-$(CONFIG_S5P_DEV_FIMC1)	+= dev-fimc1.o
 obj-$(CONFIG_S5P_DEV_FIMC2)	+= dev-fimc2.o
 obj-$(CONFIG_S5P_DEV_FIMC3)	+= dev-fimc3.o
+obj-$(CONFIG_S5P_DEV_FIMD0)	+= dev-fimd0.o
 obj-$(CONFIG_S5P_DEV_ONENAND)	+= dev-onenand.o
 obj-$(CONFIG_S5P_DEV_CSIS0)	+= dev-csis0.o
 obj-$(CONFIG_S5P_DEV_CSIS1)	+= dev-csis1.o
diff --git a/arch/arm/plat-s5p/dev-fimd0.c b/arch/arm/plat-s5p/dev-fimd0.c
new file mode 100644
index 0000000..b332b5f
--- /dev/null
+++ b/arch/arm/plat-s5p/dev-fimd0.c
@@ -0,0 +1,67 @@
+/* linux/arch/arm/plat-s5p/dev-fimd0.c
+ *
+ * Copyright (c) 2009-2010 Samsung Electronics Co., Ltd.
+ *             http://www.samsung.com
+ *
+ * Core file for Samsung Display Controller (FIMD) driver
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+*/
+
+#include <linux/kernel.h>
+#include <linux/string.h>
+#include <linux/platform_device.h>
+#include <linux/fb.h>
+#include <linux/gfp.h>
+#include <linux/dma-mapping.h>
+
+#include <mach/irqs.h>
+#include <mach/map.h>
+
+#include <plat/fb.h>
+#include <plat/devs.h>
+#include <plat/cpu.h>
+
+static struct resource s5p_fimd0_resource[] = {
+	[0] = {
+		.start  = S5P_PA_FIMD0,
+		.end    = S5P_PA_FIMD0 + SZ_32K - 1,
+		.flags  = IORESOURCE_MEM,
+	},
+	[1] = {
+		.start  = IRQ_FIMD0_VSYNC,
+		.end    = IRQ_FIMD0_VSYNC,
+		.flags  = IORESOURCE_IRQ,
+	},
+	[2] = {
+		.start  = IRQ_FIMD0_FIFO,
+		.end    = IRQ_FIMD0_FIFO,
+		.flags  = IORESOURCE_IRQ,
+	},
+	[3] = {
+		.start  = IRQ_FIMD0_SYSTEM,
+		.end    = IRQ_FIMD0_SYSTEM,
+		.flags  = IORESOURCE_IRQ,
+	},
+};
+
+static u64 fimd0_dmamask = DMA_BIT_MASK(32);
+
+struct platform_device s5p_device_fimd0 = {
+	.name           = "s5p-fb",
+	.id             = 0,
+	.num_resources  = ARRAY_SIZE(s5p_fimd0_resource),
+	.resource       = s5p_fimd0_resource,
+	.dev            = {
+		.dma_mask               = &fimd0_dmamask,
+		.coherent_dma_mask      = DMA_BIT_MASK(32),
+	},
+};
+
+void __init s5p_fimd0_set_platdata(struct s3c_fb_platdata *pd)
+{
+	s3c_set_platdata(pd, sizeof(struct s3c_fb_platdata),
+			&s5p_device_fimd0);
+}
diff --git a/arch/arm/plat-samsung/include/plat/devs.h b/arch/arm/plat-samsung/include/plat/devs.h
index 4af108f..370bd2b 100644
--- a/arch/arm/plat-samsung/include/plat/devs.h
+++ b/arch/arm/plat-samsung/include/plat/devs.h
@@ -45,6 +45,7 @@ extern struct platform_device s3c64xx_device_ac97;
 extern struct platform_device s3c_device_ts;
 
 extern struct platform_device s3c_device_fb;
+extern struct platform_device s5p_device_fimd0;
 extern struct platform_device s3c_device_ohci;
 extern struct platform_device s3c_device_lcd;
 extern struct platform_device s3c_device_wdt;
diff --git a/arch/arm/plat-samsung/include/plat/fb-core.h b/arch/arm/plat-samsung/include/plat/fb-core.h
index bca383e..6abcbf1 100644
--- a/arch/arm/plat-samsung/include/plat/fb-core.h
+++ b/arch/arm/plat-samsung/include/plat/fb-core.h
@@ -26,4 +26,19 @@ static inline void s3c_fb_setname(char *name)
 #endif
 }
 
+/* Re-define device name depending on support. */
+static inline void s5p_fb_setname(int id, char *name)
+{
+	switch (id) {
+#ifdef CONFIG_S5P_DEV_FIMD0
+	case 0:
+		s5p_device_fimd0.name = name;
+	break;
+#endif
+	default:
+		printk(KERN_ERR "%s: invalid device id(%d)\n", __func__, id);
+	break;
+	}
+}
+
 #endif /* __ASM_PLAT_FB_CORE_H */
diff --git a/arch/arm/plat-samsung/include/plat/fb.h b/arch/arm/plat-samsung/include/plat/fb.h
index cb3ca3a..b341c7a 100644
--- a/arch/arm/plat-samsung/include/plat/fb.h
+++ b/arch/arm/plat-samsung/include/plat/fb.h
@@ -74,6 +74,14 @@ struct s3c_fb_platdata {
 extern void s3c_fb_set_platdata(struct s3c_fb_platdata *pd);
 
 /**
+ * s5p_fimd0_set_platdata() - Setup the FB device with platform data.
+ * @pd: The platform data to set. The data is copied from the passed structure
+ *      so the machine data can mark the data __initdata so that any unused
+ *      machines will end up dumping their data at runtime.
+ */
+extern void s5p_fimd0_set_platdata(struct s3c_fb_platdata *pd);
+
+/**
  * s3c64xx_fb_gpio_setup_24bpp() - S3C64XX setup function for 24bpp LCD
  *
  * Initialise the GPIO for an 24bpp LCD display on the RGB interface.
@@ -94,4 +102,10 @@ extern void s5pc100_fb_gpio_setup_24bpp(void);
  */
 extern void s5pv210_fb_gpio_setup_24bpp(void);
 
+/**
+ * exynos4_fimd0_gpio_setup_24bpp() - S5PV310/S5PC210 setup function for 24bpp LCD0
+ *
+ * Initialise the GPIO for an 24bpp LCD display on the RGB interface 0.
+ */
+extern void exynos4_fimd0_gpio_setup_24bpp(void);
 #endif /* __PLAT_S3C_FB_H */
-- 
1.7.4.1
