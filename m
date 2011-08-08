From: Kamil Debski <k.debski@samsung.com>
Subject: [PATCH 1/3] s5p-g2d: add G2D to plat-s5p and mach-exynos4
Date: Mon, 08 Aug 2011 19:16:57 +0200
Message-ID: <1312823819-14713-2-git-send-email-k.debski@samsung.com>
References: <1312823819-14713-1-git-send-email-k.debski@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:22352 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751921Ab1HHRRQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 8 Aug 2011 13:17:16 -0400
Received: from eu_spt1 (mailout1.w1.samsung.com [210.118.77.11])
 by mailout1.w1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0LPM00BGEDCQ9Z@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 08 Aug 2011 18:17:14 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt1.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0LPM007ZFDCP9L@spt1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 08 Aug 2011 18:17:14 +0100 (BST)
In-reply-to: <1312823819-14713-1-git-send-email-k.debski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: m.szyprowski@samsung.com, kyungmin.park@samsung.com, k.debski@samsung.com

G2D is a 2D graphics accelerator engine present in the s5p family
of Samsung SoCs. It is capable of bitblt and raster operations on
images having dimensions of up to 8000x8000.

Signed-off-by: Kamil Debski <k.debski@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/mach-exynos4/include/mach/map.h  |    3 ++
 arch/arm/plat-s5p/Kconfig                 |    5 +++
 arch/arm/plat-s5p/Makefile                |    1 +
 arch/arm/plat-s5p/dev-g2d.c               |   43 +++++++++++++++++++++++++++++
 arch/arm/plat-samsung/include/plat/devs.h |    2 +-
 5 files changed, 53 insertions(+), 1 deletions(-)
 create mode 100644 arch/arm/plat-s5p/dev-g2d.c

diff --git a/arch/arm/mach-exynos4/include/mach/map.h b/arch/arm/mach-exynos4/include/mach/map.h
index abb917b..024fb9f 100644
--- a/arch/arm/mach-exynos4/include/mach/map.h
+++ b/arch/arm/mach-exynos4/include/mach/map.h
@@ -31,6 +31,8 @@
 #define EXYNOS4_PA_FIMC2		0x11820000
 #define EXYNOS4_PA_FIMC3		0x11830000
 
+#define EXYNOS4_PA_G2D			0x12800000
+
 #define EXYNOS4_PA_HSOTG		0x12480000
 #define EXYNOS4_PA_USB_HSPHY		0x125B0000
 
@@ -160,6 +162,7 @@
 #define S5P_PA_FIMC1			EXYNOS4_PA_FIMC1
 #define S5P_PA_FIMC2			EXYNOS4_PA_FIMC2
 #define S5P_PA_FIMC3			EXYNOS4_PA_FIMC3
+#define S5P_PA_G2D			EXYNOS4_PA_G2D
 #define S5P_PA_MIPI_CSIS0		EXYNOS4_PA_MIPI_CSIS0
 #define S5P_PA_MIPI_CSIS1		EXYNOS4_PA_MIPI_CSIS1
 #define S5P_PA_FIMD0			EXYNOS4_PA_FIMD0
diff --git a/arch/arm/plat-s5p/Kconfig b/arch/arm/plat-s5p/Kconfig
index 70d6ae7..a5a662a 100644
--- a/arch/arm/plat-s5p/Kconfig
+++ b/arch/arm/plat-s5p/Kconfig
@@ -76,6 +76,11 @@ config S5P_DEV_FIMC3
 	help
 	  Compile in platform device definitions for FIMC controller 3
 
+config S5P_DEV_G2D
+	bool
+	help
+	  Compile in platform device definitions for G2D device
+	  
 config S5P_DEV_FIMD0
 	bool
 	help
diff --git a/arch/arm/plat-s5p/Makefile b/arch/arm/plat-s5p/Makefile
index c386d60..1cb9eed 100644
--- a/arch/arm/plat-s5p/Makefile
+++ b/arch/arm/plat-s5p/Makefile
@@ -32,6 +32,7 @@ obj-$(CONFIG_S5P_DEV_FIMC1)	+= dev-fimc1.o
 obj-$(CONFIG_S5P_DEV_FIMC2)	+= dev-fimc2.o
 obj-$(CONFIG_S5P_DEV_FIMC3)	+= dev-fimc3.o
 obj-$(CONFIG_S5P_DEV_FIMD0)	+= dev-fimd0.o
+obj-$(CONFIG_S5P_DEV_G2D)	+= dev-g2d.o
 obj-$(CONFIG_S5P_DEV_I2C_HDMIPHY) += dev-i2c-hdmiphy.o
 obj-$(CONFIG_S5P_DEV_ONENAND)	+= dev-onenand.o
 obj-$(CONFIG_S5P_DEV_CSIS0)	+= dev-csis0.o
diff --git a/arch/arm/plat-s5p/dev-g2d.c b/arch/arm/plat-s5p/dev-g2d.c
new file mode 100644
index 0000000..630840a
--- /dev/null
+++ b/arch/arm/plat-s5p/dev-g2d.c
@@ -0,0 +1,43 @@
+/* linux/arch/arm/plat-s5p/dev-g2d.c
+ *
+ * Copyright (c) 2011 Samsung Electronics
+ *
+ * Base S5P G2D resource and device definitions
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#include <linux/kernel.h>
+#include <linux/dma-mapping.h>
+#include <linux/platform_device.h>
+#include <linux/interrupt.h>
+#include <linux/ioport.h>
+#include <mach/map.h>
+
+static struct resource s5p_g2d_resource[] = {
+	[0] = {
+		.start	= S5P_PA_G2D,
+		.end	= S5P_PA_G2D + SZ_4K - 1,
+		.flags	= IORESOURCE_MEM,
+	},
+	[1] = {
+		.start	= IRQ_2D,
+		.end	= IRQ_2D,
+		.flags	= IORESOURCE_IRQ,
+	},
+};
+
+static u64 s5p_g2d_dma_mask = DMA_BIT_MASK(32);
+
+struct platform_device s5p_device_g2d = {
+	.name		= "s5p-g2d",
+	.id		= 0,
+	.num_resources	= ARRAY_SIZE(s5p_g2d_resource),
+	.resource	= s5p_g2d_resource,
+	.dev		= {
+		.dma_mask		= &s5p_g2d_dma_mask,
+		.coherent_dma_mask	= DMA_BIT_MASK(32),
+	},
+};
diff --git a/arch/arm/plat-samsung/include/plat/devs.h b/arch/arm/plat-samsung/include/plat/devs.h
index ee5014a..a048795 100644
--- a/arch/arm/plat-samsung/include/plat/devs.h
+++ b/arch/arm/plat-samsung/include/plat/devs.h
@@ -139,7 +139,7 @@ extern struct platform_device s5p_device_fimc0;
 extern struct platform_device s5p_device_fimc1;
 extern struct platform_device s5p_device_fimc2;
 extern struct platform_device s5p_device_fimc3;
-
+extern struct platform_device s5p_device_g2d;
 extern struct platform_device s5p_device_mfc;
 extern struct platform_device s5p_device_mfc_l;
 extern struct platform_device s5p_device_mfc_r;
-- 
1.6.3.3
