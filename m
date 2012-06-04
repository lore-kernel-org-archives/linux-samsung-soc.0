From: Jingoo Han <jg1.han@samsung.com>
Subject: [PATCH] ARM: EXYNOS: add FIMD1 support for EXYNOS5
Date: Mon, 04 Jun 2012 19:41:07 +0900
Message-ID: <000c01cd423e$8c9c9510$a5d5bf30$%han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:9472 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752035Ab2FDKlJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 4 Jun 2012 06:41:09 -0400
Received: from epcpsbgm2.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M53009QF9OEBSD0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 04 Jun 2012 19:41:08 +0900 (KST)
Received: from DOJG1HAN02 ([12.23.119.56])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M5300HMV9OJM600@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 04 Jun 2012 19:41:07 +0900 (KST)
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kukjin Kim' <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: 'Jingoo Han' <jg1.han@samsung.com>

This patch adds platform device s5p_device_fimd1 for EXYNOS FIMD1.
EXYNOS has two FIMDs(FIMD0, FIMD1). Some definitions used to enable
EXYNOS FIMD1 are added.

This patch also adds resource definitions for EXYNOS5 FIMD1.
FIMD1 clock and SFR definitions are added.

Signed-off-by: Jingoo Han <jg1.han@samsung.com>
---
 arch/arm/mach-exynos/Kconfig                 |    5 +++
 arch/arm/mach-exynos/Makefile                |    1 +
 arch/arm/mach-exynos/clock-exynos5.c         |   11 +++++++-
 arch/arm/mach-exynos/common.c                |    2 +
 arch/arm/mach-exynos/include/mach/irqs.h     |    4 +++
 arch/arm/mach-exynos/include/mach/map.h      |    2 +
 arch/arm/mach-exynos/setup-fimd1.c           |   36 ++++++++++++++++++++++++++
 arch/arm/plat-samsung/Kconfig                |    5 +++
 arch/arm/plat-samsung/devs.c                 |   28 ++++++++++++++++++++
 arch/arm/plat-samsung/include/plat/devs.h    |    1 +
 arch/arm/plat-samsung/include/plat/fb-core.h |    5 +++
 arch/arm/plat-samsung/include/plat/fb.h      |   15 +++++++++++
 12 files changed, 114 insertions(+), 1 deletions(-)
 create mode 100644 arch/arm/mach-exynos/setup-fimd1.c

diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kconfig
index 573be57..49a9e21 100644
--- a/arch/arm/mach-exynos/Kconfig
+++ b/arch/arm/mach-exynos/Kconfig
@@ -93,6 +93,11 @@ config EXYNOS4_SETUP_FIMD0
 	help
 	  Common setup code for FIMD0.
 
+config EXYNOS_SETUP_FIMD1
+	bool
+	help
+	  Common setup code for FIMD1.
+
 config EXYNOS_DEV_SYSMMU
 	bool
 	help
diff --git a/arch/arm/mach-exynos/Makefile b/arch/arm/mach-exynos/Makefile
index 9b58024..fd8263c 100644
--- a/arch/arm/mach-exynos/Makefile
+++ b/arch/arm/mach-exynos/Makefile
@@ -59,6 +59,7 @@ obj-$(CONFIG_EXYNOS_DEV_SYSMMU)		+= dev-sysmmu.o
 obj-$(CONFIG_ARCH_EXYNOS)		+= setup-i2c0.o
 obj-$(CONFIG_EXYNOS4_SETUP_FIMC)	+= setup-fimc.o
 obj-$(CONFIG_EXYNOS4_SETUP_FIMD0)	+= setup-fimd0.o
+obj-$(CONFIG_EXYNOS_SETUP_FIMD1)	+= setup-fimd1.o
 obj-$(CONFIG_EXYNOS4_SETUP_I2C1)	+= setup-i2c1.o
 obj-$(CONFIG_EXYNOS4_SETUP_I2C2)	+= setup-i2c2.o
 obj-$(CONFIG_EXYNOS4_SETUP_I2C3)	+= setup-i2c3.o
diff --git a/arch/arm/mach-exynos/clock-exynos5.c b/arch/arm/mach-exynos/clock-exynos5.c
index fefa336..49e2ad2 100644
--- a/arch/arm/mach-exynos/clock-exynos5.c
+++ b/arch/arm/mach-exynos/clock-exynos5.c
@@ -868,6 +868,13 @@ static struct clk exynos5_clk_mdma1 = {
 	.ctrlbit	= (1 << 4),
 };
 
+static struct clk exynos5_clk_fimd1 = {
+	.name		= "fimd",
+	.devname	= "exynos5-fb.1",
+	.enable		= exynos5_clk_ip_disp1_ctrl,
+	.ctrlbit	= (1 << 0),
+};
+
 struct clk *exynos5_clkset_group_list[] = {
 	[0] = &clk_ext_xtal_mux,
 	[1] = NULL,
@@ -1046,7 +1053,7 @@ static struct clksrc_clk exynos5_clksrcs[] = {
 	}, {
 		.clk	= {
 			.name		= "sclk_fimd",
-			.devname	= "s3cfb.1",
+			.devname	= "exynos5-fb.1",
 			.enable		= exynos5_clksrc_mask_disp1_0_ctrl,
 			.ctrlbit	= (1 << 0),
 		},
@@ -1154,6 +1161,7 @@ static struct clk *exynos5_clk_cdev[] = {
 	&exynos5_clk_pdma0,
 	&exynos5_clk_pdma1,
 	&exynos5_clk_mdma1,
+	&exynos5_clk_fimd1,
 };
 
 static struct clksrc_clk *exynos5_clksrc_cdev[] = {
@@ -1176,6 +1184,7 @@ static struct clk_lookup exynos5_clk_lookup[] = {
 	CLKDEV_INIT("exynos4-sdhci.1", "mmc_busclk.2", &exynos5_clk_sclk_mmc1.clk),
 	CLKDEV_INIT("exynos4-sdhci.2", "mmc_busclk.2", &exynos5_clk_sclk_mmc2.clk),
 	CLKDEV_INIT("exynos4-sdhci.3", "mmc_busclk.2", &exynos5_clk_sclk_mmc3.clk),
+	CLKDEV_INIT("exynos5-fb.1", "lcd", &exynos5_clk_fimd1),
 	CLKDEV_INIT("dma-pl330.0", "apb_pclk", &exynos5_clk_pdma0),
 	CLKDEV_INIT("dma-pl330.1", "apb_pclk", &exynos5_clk_pdma1),
 	CLKDEV_INIT("dma-pl330.2", "apb_pclk", &exynos5_clk_mdma1),
diff --git a/arch/arm/mach-exynos/common.c b/arch/arm/mach-exynos/common.c
index 742edd3..84a187d 100644
--- a/arch/arm/mach-exynos/common.c
+++ b/arch/arm/mach-exynos/common.c
@@ -366,6 +366,8 @@ static void __init exynos5_map_io(void)
 	s3c_i2c0_setname("s3c2440-i2c");
 	s3c_i2c1_setname("s3c2440-i2c");
 	s3c_i2c2_setname("s3c2440-i2c");
+
+	s5p_fb_setname(1, "exynos5-fb");
 }
 
 static void __init exynos4_init_clocks(int xtal)
diff --git a/arch/arm/mach-exynos/include/mach/irqs.h b/arch/arm/mach-exynos/include/mach/irqs.h
index 7a4b478..608b0c6 100644
--- a/arch/arm/mach-exynos/include/mach/irqs.h
+++ b/arch/arm/mach-exynos/include/mach/irqs.h
@@ -232,6 +232,10 @@
 #define IRQ_FIMD0_VSYNC			EXYNOS4_IRQ_FIMD0_VSYNC
 #define IRQ_FIMD0_SYSTEM		EXYNOS4_IRQ_FIMD0_SYSTEM
 
+#define IRQ_FIMD1_FIFO			EXYNOS5_IRQ_FIMD1_FIFO
+#define IRQ_FIMD1_VSYNC			EXYNOS5_IRQ_FIMD1_VSYNC
+#define IRQ_FIMD1_SYSTEM		EXYNOS5_IRQ_FIMD1_SYSTEM
+
 #define IRQ_GPIO1_NR_GROUPS		EXYNOS4_IRQ_GPIO1_NR_GROUPS
 #define IRQ_GPIO2_NR_GROUPS		EXYNOS4_IRQ_GPIO2_NR_GROUPS
 
diff --git a/arch/arm/mach-exynos/include/mach/map.h b/arch/arm/mach-exynos/include/mach/map.h
index ca4aa89..07d0028 100644
--- a/arch/arm/mach-exynos/include/mach/map.h
+++ b/arch/arm/mach-exynos/include/mach/map.h
@@ -167,6 +167,7 @@
 #define EXYNOS4_PA_MIPI_CSIS1		0x11890000
 
 #define EXYNOS4_PA_FIMD0		0x11C00000
+#define EXYNOS5_PA_FIMD1		0x14400000
 
 #define EXYNOS4_PA_HSMMC(x)		(0x12510000 + ((x) * 0x10000))
 #define EXYNOS4_PA_DWMCI		0x12550000
@@ -240,6 +241,7 @@
 #define S5P_PA_JPEG			EXYNOS4_PA_JPEG
 #define S5P_PA_G2D			EXYNOS4_PA_G2D
 #define S5P_PA_FIMD0			EXYNOS4_PA_FIMD0
+#define S5P_PA_FIMD1			EXYNOS5_PA_FIMD1
 #define S5P_PA_HDMI			EXYNOS4_PA_HDMI
 #define S5P_PA_IIC_HDMIPHY		EXYNOS4_PA_IIC_HDMIPHY
 #define S5P_PA_MFC			EXYNOS4_PA_MFC
diff --git a/arch/arm/mach-exynos/setup-fimd1.c b/arch/arm/mach-exynos/setup-fimd1.c
new file mode 100644
index 0000000..ecab126
--- /dev/null
+++ b/arch/arm/mach-exynos/setup-fimd1.c
@@ -0,0 +1,36 @@
+/* linux/arch/arm/mach-exynos/setup-fimd1.c
+ *
+ * Copyright (c) 2012 Samsung Electronics Co., Ltd.
+ *             http://www.samsung.com
+ *
+ * Base Exynos FIMD 1 configuration
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#include <linux/fb.h>
+#include <linux/gpio.h>
+
+#include <plat/gpio-cfg.h>
+#include <plat/regs-fb-v4.h>
+
+#include <mach/map.h>
+
+void exynos5_fimd1_gpio_setup_24bpp(void)
+{
+	unsigned int reg;
+
+	/*
+	 * Set DISP1BLK_CFG register for Display path selection
+	 *
+	 * FIMD of DISP1_BLK Bypass selection : DISP1BLK_CFG[15]
+	 * ---------------------
+	 *  0 | MIE/MDINE
+	 *  1 | FIMD : selected
+	 */
+	reg = __raw_readl(S3C_VA_SYS + 0x0214);
+	reg |= (1 << 15);
+	__raw_writel(reg, S3C_VA_SYS + 0x0214);
+}
diff --git a/arch/arm/plat-samsung/Kconfig b/arch/arm/plat-samsung/Kconfig
index a2fae4e..63d3435 100644
--- a/arch/arm/plat-samsung/Kconfig
+++ b/arch/arm/plat-samsung/Kconfig
@@ -362,6 +362,11 @@ config S5P_DEV_FIMD0
 	help
 	  Compile in platform device definitions for FIMD controller 0
 
+config S5P_DEV_FIMD1
+	bool
+	help
+	  Compile in platform device definitions for FIMD controller 1
+
 config S5P_DEV_G2D
 	bool
 	help
diff --git a/arch/arm/plat-samsung/devs.c b/arch/arm/plat-samsung/devs.c
index 1d214cb..bb1c39d 100644
--- a/arch/arm/plat-samsung/devs.c
+++ b/arch/arm/plat-samsung/devs.c
@@ -334,6 +334,34 @@ void __init s5p_fimd0_set_platdata(struct s3c_fb_platdata *pd)
 }
 #endif /* CONFIG_S5P_DEV_FIMD0 */
 
+/* FIMD1 */
+
+#ifdef CONFIG_S5P_DEV_FIMD1
+static struct resource s5p_fimd1_resource[] = {
+	[0] = DEFINE_RES_MEM(S5P_PA_FIMD1, SZ_32K),
+	[1] = DEFINE_RES_IRQ(IRQ_FIMD1_VSYNC),
+	[2] = DEFINE_RES_IRQ(IRQ_FIMD1_FIFO),
+	[3] = DEFINE_RES_IRQ(IRQ_FIMD1_SYSTEM),
+};
+
+struct platform_device s5p_device_fimd1 = {
+	.name		= "s5p-fb",
+	.id		= 1,
+	.num_resources	= ARRAY_SIZE(s5p_fimd1_resource),
+	.resource	= s5p_fimd1_resource,
+	.dev		= {
+		.dma_mask		= &samsung_device_dma_mask,
+		.coherent_dma_mask	= DMA_BIT_MASK(32),
+	},
+};
+
+void __init s5p_fimd1_set_platdata(struct s3c_fb_platdata *pd)
+{
+	s3c_set_platdata(pd, sizeof(struct s3c_fb_platdata),
+			 &s5p_device_fimd1);
+}
+#endif /* CONFIG_S5P_DEV_FIMD1 */
+
 /* HWMON */
 
 #ifdef CONFIG_S3C_DEV_HWMON
diff --git a/arch/arm/plat-samsung/include/plat/devs.h b/arch/arm/plat-samsung/include/plat/devs.h
index 61ca2f3..f06980f 100644
--- a/arch/arm/plat-samsung/include/plat/devs.h
+++ b/arch/arm/plat-samsung/include/plat/devs.h
@@ -84,6 +84,7 @@ extern struct platform_device s5p_device_fimc_md;
 extern struct platform_device s5p_device_jpeg;
 extern struct platform_device s5p_device_g2d;
 extern struct platform_device s5p_device_fimd0;
+extern struct platform_device s5p_device_fimd1;
 extern struct platform_device s5p_device_hdmi;
 extern struct platform_device s5p_device_i2c_hdmiphy;
 extern struct platform_device s5p_device_mfc;
diff --git a/arch/arm/plat-samsung/include/plat/fb-core.h b/arch/arm/plat-samsung/include/plat/fb-core.h
index 6abcbf1..8766794 100644
--- a/arch/arm/plat-samsung/include/plat/fb-core.h
+++ b/arch/arm/plat-samsung/include/plat/fb-core.h
@@ -35,6 +35,11 @@ static inline void s5p_fb_setname(int id, char *name)
 		s5p_device_fimd0.name = name;
 	break;
 #endif
+#ifdef CONFIG_S5P_DEV_FIMD1
+	case 1:
+		s5p_device_fimd1.name = name;
+	break;
+#endif
 	default:
 		printk(KERN_ERR "%s: invalid device id(%d)\n", __func__, id);
 	break;
diff --git a/arch/arm/plat-samsung/include/plat/fb.h b/arch/arm/plat-samsung/include/plat/fb.h
index 536002f..331ca5b 100644
--- a/arch/arm/plat-samsung/include/plat/fb.h
+++ b/arch/arm/plat-samsung/include/plat/fb.h
@@ -83,6 +83,14 @@ extern void s3c_fb_set_platdata(struct s3c_fb_platdata *pd);
 extern void s5p_fimd0_set_platdata(struct s3c_fb_platdata *pd);
 
 /**
+ * s5p_fimd1_set_platdata() - Setup the FB device with platform data.
+ * @pd: The platform data to set. The data is copied from the passed structure
+ *      so the machine data can mark the data __initdata so that any unused
+ *      machines will end up dumping their data at runtime.
+ */
+extern void s5p_fimd1_set_platdata(struct s3c_fb_platdata *pd);
+
+/**
  * s3c64xx_fb_gpio_setup_24bpp() - S3C64XX setup function for 24bpp LCD
  *
  * Initialise the GPIO for an 24bpp LCD display on the RGB interface.
@@ -111,6 +119,13 @@ extern void s5pv210_fb_gpio_setup_24bpp(void);
 extern void exynos4_fimd0_gpio_setup_24bpp(void);
 
 /**
+ * exynos5_fimd1_gpio_setup_24bpp() - Exynos5 setup function for 24bpp LCD0
+ *
+ * Initialise the GPIO for an 24bpp LCD display on the RGB interface 1.
+ */
+extern void exynos5_fimd1_gpio_setup_24bpp(void);
+
+/**
  * s5p64x0_fb_gpio_setup_24bpp() - S5P6440/S5P6450 setup function for 24bpp LCD
  *
  * Initialise the GPIO for an 24bpp LCD display on the RGB interface.
-- 
1.7.1
