From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 1/4] ARM: Samsung: add i2c hdmiphy controller definitions
Date: Mon, 25 Jul 2011 09:55:44 +0200
Message-ID: <1311580547-9468-2-git-send-email-m.szyprowski@samsung.com>
References: <1311580547-9468-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:43103 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751785Ab1GYHzz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 25 Jul 2011 03:55:55 -0400
Received: from eu_spt1 ([210.118.77.14]) by mailout4.w1.samsung.com
 (Sun Java(tm) System Messaging Server 6.3-8.04 (built Jul 29 2009; 32bit))
 with ESMTP id <0LOV004NZQ13BL50@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 25 Jul 2011 08:55:52 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt1.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0LOV00COWQ13HT@spt1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 25 Jul 2011 08:55:51 +0100 (BST)
In-reply-to: <1311580547-9468-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Tomasz Stanislawski <t.stanislaws@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>

From: Tomasz Stanislawski <t.stanislaws@samsung.com>

This patch adds hdmiphy dedicated i2c controller definitions.

Signed-off-by: Tomasz Stanislawski <t.stanislaws@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
[m.szyprowski: renamed to i2c-hdmiphy and squashed Exynos4 and S5PV210 patches]
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm/mach-exynos4/clock.c                    |    6 ++
 arch/arm/mach-exynos4/include/mach/iic-hdmiphy.h |   16 ++++++
 arch/arm/mach-exynos4/include/mach/irqs.h        |    2 +
 arch/arm/mach-exynos4/include/mach/map.h         |    4 ++
 arch/arm/mach-s5pv210/clock.c                    |    6 ++
 arch/arm/mach-s5pv210/include/mach/iic-hdmiphy.h |   16 ++++++
 arch/arm/mach-s5pv210/include/mach/irqs.h        |    2 +-
 arch/arm/mach-s5pv210/include/mach/map.h         |    3 +
 arch/arm/plat-s5p/Kconfig                        |    5 ++
 arch/arm/plat-s5p/Makefile                       |    1 +
 arch/arm/plat-s5p/dev-i2c-hdmiphy.c              |   59 ++++++++++++++++++++++
 arch/arm/plat-samsung/include/plat/devs.h        |    1 +
 arch/arm/plat-samsung/include/plat/iic.h         |    1 +
 13 files changed, 121 insertions(+), 1 deletions(-)
 create mode 100644 arch/arm/mach-exynos4/include/mach/iic-hdmiphy.h
 create mode 100644 arch/arm/mach-s5pv210/include/mach/iic-hdmiphy.h
 create mode 100644 arch/arm/plat-s5p/dev-i2c-hdmiphy.c

diff --git a/arch/arm/mach-exynos4/clock.c b/arch/arm/mach-exynos4/clock.c
index 851dea0..953bdad 100644
--- a/arch/arm/mach-exynos4/clock.c
+++ b/arch/arm/mach-exynos4/clock.c
@@ -581,6 +581,12 @@ static struct clk init_clocks_off[] = {
 		.enable		= exynos4_clk_ip_peril_ctrl,
 		.ctrlbit	= (1 << 13),
 	}, {
+		.name		= "i2c",
+		.devname	= "s3c2440-hdmiphy-i2c",
+		.parent		= &clk_aclk_100.clk,
+		.enable		= exynos4_clk_ip_peril_ctrl,
+		.ctrlbit	= (1 << 14),
+	}, {
 		.name		= "SYSMMU_MDMA",
 		.enable		= exynos4_clk_ip_image_ctrl,
 		.ctrlbit	= (1 << 5),
diff --git a/arch/arm/mach-exynos4/include/mach/iic-hdmiphy.h b/arch/arm/mach-exynos4/include/mach/iic-hdmiphy.h
new file mode 100644
index 0000000..4f070e0
--- /dev/null
+++ b/arch/arm/mach-exynos4/include/mach/iic-hdmiphy.h
@@ -0,0 +1,16 @@
+/*
+ * Copyright (C) 2011 Samsung Electronics Co., Ltd.
+ *
+ * S5P series i2c hdmiphy helper definitions
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#ifndef PLAT_S5P_IIC_HDMIPHY_H_
+#define PLAT_S5P_IIC_HDMIPHY_H_
+
+#define S5P_IIC_HDMIPHY_BUS_NUM		(8)
+
+#endif
diff --git a/arch/arm/mach-exynos4/include/mach/irqs.h b/arch/arm/mach-exynos4/include/mach/irqs.h
index 934d2a4..c56645f 100644
--- a/arch/arm/mach-exynos4/include/mach/irqs.h
+++ b/arch/arm/mach-exynos4/include/mach/irqs.h
@@ -94,6 +94,8 @@
 #define IRQ_2D			IRQ_SPI(89)
 #define IRQ_PCIE		IRQ_SPI(90)
 
+#define IRQ_IIC_HDMIPHY		IRQ_SPI(93)
+
 #define IRQ_MFC			IRQ_SPI(94)
 
 #define IRQ_AUDIO_SS		IRQ_SPI(96)
diff --git a/arch/arm/mach-exynos4/include/mach/map.h b/arch/arm/mach-exynos4/include/mach/map.h
index d32296d..380feb9 100644
--- a/arch/arm/mach-exynos4/include/mach/map.h
+++ b/arch/arm/mach-exynos4/include/mach/map.h
@@ -112,6 +112,8 @@
 
 #define EXYNOS4_PA_UART			0x13800000
 
+#define EXYNOS4_PA_IIC_HDMIPHY		0x138E0000
+
 #define EXYNOS4_PA_IIC(x)		(0x13860000 + ((x) * 0x10000))
 
 #define EXYNOS4_PA_ADC			0x13910000
@@ -161,6 +163,8 @@
 #define S5P_PA_TIMER			EXYNOS4_PA_TIMER
 #define S5P_PA_EHCI			EXYNOS4_PA_EHCI
 
+#define S5P_PA_IIC_HDMIPHY		EXYNOS4_PA_IIC_HDMIPHY
+
 #define SAMSUNG_PA_KEYPAD		EXYNOS4_PA_KEYPAD
 
 /* UART */
diff --git a/arch/arm/mach-s5pv210/clock.c b/arch/arm/mach-s5pv210/clock.c
index 52a8e60..90a1966 100644
--- a/arch/arm/mach-s5pv210/clock.c
+++ b/arch/arm/mach-s5pv210/clock.c
@@ -407,6 +407,12 @@ static struct clk init_clocks_off[] = {
 		.enable		= s5pv210_clk_ip3_ctrl,
 		.ctrlbit	= (1<<9),
 	}, {
+		.name		= "i2c",
+		.devname	= "s3c2440-hdmiphy-i2c",
+		.parent		= &clk_pclk_psys.clk,
+		.enable		= s5pv210_clk_ip3_ctrl,
+		.ctrlbit	= (1 << 11),
+	}, {
 		.name		= "spi",
 		.devname	= "s3c64xx-spi.0",
 		.parent		= &clk_pclk_psys.clk,
diff --git a/arch/arm/mach-s5pv210/include/mach/iic-hdmiphy.h b/arch/arm/mach-s5pv210/include/mach/iic-hdmiphy.h
new file mode 100644
index 0000000..b6ce613
--- /dev/null
+++ b/arch/arm/mach-s5pv210/include/mach/iic-hdmiphy.h
@@ -0,0 +1,16 @@
+/*
+ * Copyright (C) 2011 Samsung Electronics Co., Ltd.
+ *
+ * S5P series i2c hdmiphy helper definitions
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#ifndef PLAT_S5P_IIC_HDMIPHY_H_
+#define PLAT_S5P_IIC_HDMIPHY_H_
+
+#define S5P_IIC_HDMIPHY_BUS_NUM		(3)
+
+#endif
diff --git a/arch/arm/mach-s5pv210/include/mach/irqs.h b/arch/arm/mach-s5pv210/include/mach/irqs.h
index b9f9ec3..c1da0a7 100644
--- a/arch/arm/mach-s5pv210/include/mach/irqs.h
+++ b/arch/arm/mach-s5pv210/include/mach/irqs.h
@@ -56,7 +56,7 @@
 #define IRQ_SPI2		S5P_IRQ_VIC1(17)
 #define IRQ_IRDA		S5P_IRQ_VIC1(18)
 #define IRQ_IIC2		S5P_IRQ_VIC1(19)
-#define IRQ_IIC3		S5P_IRQ_VIC1(20)
+#define IRQ_IIC_HDMIPHY		S5P_IRQ_VIC1(20)
 #define IRQ_HSIRX		S5P_IRQ_VIC1(21)
 #define IRQ_HSITX		S5P_IRQ_VIC1(22)
 #define IRQ_UHOST		S5P_IRQ_VIC1(23)
diff --git a/arch/arm/mach-s5pv210/include/mach/map.h b/arch/arm/mach-s5pv210/include/mach/map.h
index aac343c..a420654 100644
--- a/arch/arm/mach-s5pv210/include/mach/map.h
+++ b/arch/arm/mach-s5pv210/include/mach/map.h
@@ -90,6 +90,8 @@
 #define S5PV210_PA_FIMC1		0xFB300000
 #define S5PV210_PA_FIMC2		0xFB400000
 
+#define S5PV210_PA_IIC_HDMIPHY		0xFA900000
+
 /* Compatibiltiy Defines */
 
 #define S3C_PA_FB			S5PV210_PA_FB
@@ -110,6 +112,7 @@
 #define S5P_PA_FIMC2			S5PV210_PA_FIMC2
 #define S5P_PA_MIPI_CSIS0		S5PV210_PA_MIPI_CSIS
 #define S5P_PA_MFC			S5PV210_PA_MFC
+#define S5P_PA_IIC_HDMIPHY		S5PV210_PA_IIC_HDMIPHY
 #define S5P_PA_ONENAND			S5PC110_PA_ONENAND
 #define S5P_PA_ONENAND_DMA		S5PC110_PA_ONENAND_DMA
 #define S5P_PA_SDRAM			S5PV210_PA_SDRAM
diff --git a/arch/arm/plat-s5p/Kconfig b/arch/arm/plat-s5p/Kconfig
index 9843c95..143e036 100644
--- a/arch/arm/plat-s5p/Kconfig
+++ b/arch/arm/plat-s5p/Kconfig
@@ -76,6 +76,11 @@ config S5P_DEV_FIMD0
 	help
 	  Compile in platform device definitions for FIMD controller 0
 
+config S5P_DEV_I2C_HDMIPHY
+	bool
+	help
+	  Compile in platform device definitions for I2C HDMIPHY controller
+
 config S5P_DEV_MFC
 	bool
 	help
diff --git a/arch/arm/plat-s5p/Makefile b/arch/arm/plat-s5p/Makefile
index 4b53e04..1dd10dc 100644
--- a/arch/arm/plat-s5p/Makefile
+++ b/arch/arm/plat-s5p/Makefile
@@ -31,6 +31,7 @@ obj-$(CONFIG_S5P_DEV_FIMC1)	+= dev-fimc1.o
 obj-$(CONFIG_S5P_DEV_FIMC2)	+= dev-fimc2.o
 obj-$(CONFIG_S5P_DEV_FIMC3)	+= dev-fimc3.o
 obj-$(CONFIG_S5P_DEV_FIMD0)	+= dev-fimd0.o
+obj-$(CONFIG_S5P_DEV_I2C_HDMIPHY) += dev-i2c-hdmiphy.o
 obj-$(CONFIG_S5P_DEV_ONENAND)	+= dev-onenand.o
 obj-$(CONFIG_S5P_DEV_CSIS0)	+= dev-csis0.o
 obj-$(CONFIG_S5P_DEV_CSIS1)	+= dev-csis1.o
diff --git a/arch/arm/plat-s5p/dev-i2c-hdmiphy.c b/arch/arm/plat-s5p/dev-i2c-hdmiphy.c
new file mode 100644
index 0000000..4beee40
--- /dev/null
+++ b/arch/arm/plat-s5p/dev-i2c-hdmiphy.c
@@ -0,0 +1,59 @@
+/*
+ * Copyright (c) 2011 Samsung Electronics Co., Ltd.
+ *		http://www.samsung.com/
+ *
+ * S5P series device definition for i2c for hdmiphy device
+ *
+ * Based on plat-samsung/dev-i2c7.c
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+*/
+
+#include <linux/gfp.h>
+#include <linux/kernel.h>
+#include <linux/string.h>
+#include <linux/platform_device.h>
+
+#include <mach/irqs.h>
+#include <mach/map.h>
+#include <mach/iic-hdmiphy.h>
+
+#include <plat/regs-iic.h>
+#include <plat/devs.h>
+#include <plat/cpu.h>
+#include <plat/iic.h>
+
+static struct resource s5p_i2c_resource[] = {
+	[0] = {
+		.start = S5P_PA_IIC_HDMIPHY,
+		.end   = S5P_PA_IIC_HDMIPHY + SZ_4K - 1,
+		.flags = IORESOURCE_MEM,
+	},
+	[1] = {
+		.start = IRQ_IIC_HDMIPHY,
+		.end   = IRQ_IIC_HDMIPHY,
+		.flags = IORESOURCE_IRQ,
+	},
+};
+
+struct platform_device s5p_device_i2c_hdmiphy = {
+	.name		  = "s3c2440-hdmiphy-i2c",
+	.id		  = -1,
+	.num_resources	  = ARRAY_SIZE(s5p_i2c_resource),
+	.resource	  = s5p_i2c_resource,
+};
+
+void __init s5p_i2c_hdmiphy_set_platdata(struct s3c2410_platform_i2c *pd)
+{
+	struct s3c2410_platform_i2c *npd;
+
+	if (!pd) {
+		pd = &default_i2c_data;
+		pd->bus_num = S5P_IIC_HDMIPHY_BUS_NUM;
+	}
+
+	npd = s3c_set_platdata(pd, sizeof(struct s3c2410_platform_i2c),
+			       &s5p_device_i2c_hdmiphy);
+}
diff --git a/arch/arm/plat-samsung/include/plat/devs.h b/arch/arm/plat-samsung/include/plat/devs.h
index 24ebb1e..b15805f 100644
--- a/arch/arm/plat-samsung/include/plat/devs.h
+++ b/arch/arm/plat-samsung/include/plat/devs.h
@@ -62,6 +62,7 @@ extern struct platform_device s3c_device_i2c4;
 extern struct platform_device s3c_device_i2c5;
 extern struct platform_device s3c_device_i2c6;
 extern struct platform_device s3c_device_i2c7;
+extern struct platform_device s5p_device_i2c_hdmiphy;
 extern struct platform_device s3c_device_rtc;
 extern struct platform_device s3c_device_adc;
 extern struct platform_device s3c_device_sdi;
diff --git a/arch/arm/plat-samsung/include/plat/iic.h b/arch/arm/plat-samsung/include/plat/iic.h
index 56b0059..51d52e7 100644
--- a/arch/arm/plat-samsung/include/plat/iic.h
+++ b/arch/arm/plat-samsung/include/plat/iic.h
@@ -60,6 +60,7 @@ extern void s3c_i2c4_set_platdata(struct s3c2410_platform_i2c *i2c);
 extern void s3c_i2c5_set_platdata(struct s3c2410_platform_i2c *i2c);
 extern void s3c_i2c6_set_platdata(struct s3c2410_platform_i2c *i2c);
 extern void s3c_i2c7_set_platdata(struct s3c2410_platform_i2c *i2c);
+extern void s5p_i2c_hdmiphy_set_platdata(struct s3c2410_platform_i2c *i2c);
 
 /* defined by architecture to configure gpio */
 extern void s3c_i2c0_cfg_gpio(struct platform_device *dev);
-- 
1.7.1.569.g6f426
