From: Jeongtae Park <jtp.park@samsung.com>
Subject: [PATCH v3 3/3] ARM: S5P: Add platform support for MFC v5.1
Date: Mon, 14 Mar 2011 17:04:02 +0900
Message-ID: <1300089842-13140-3-git-send-email-jtp.park@samsung.com>
References: <1300089842-13140-1-git-send-email-jtp.park@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:45554 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752624Ab1CNIfo (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 14 Mar 2011 04:35:44 -0400
In-Reply-To: <1300089842-13140-1-git-send-email-jtp.park@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, Jeongtae Park <jtp.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Kamil Debski <k.debski@samsung.com>

Add platform support for MFC v5.1 is a module available
on S5PC110 and S5PC210 Samsung SoCs.

Reviewed-by: Peter Oh <jaeryul.oh@samsung.com>
Signed-off-by: Jeongtae Park <jtp.park@samsung.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Kamil Debski <k.debski@samsung.com>
---
 arch/arm/plat-s5p/Kconfig   |    5 ++++
 arch/arm/plat-s5p/Makefile  |    1 +
 arch/arm/plat-s5p/dev-mfc.c |   46 +++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 52 insertions(+), 0 deletions(-)
 create mode 100644 arch/arm/plat-s5p/dev-mfc.c

diff --git a/arch/arm/plat-s5p/Kconfig b/arch/arm/plat-s5p/Kconfig
index 6390ac7..af980d4 100644
--- a/arch/arm/plat-s5p/Kconfig
+++ b/arch/arm/plat-s5p/Kconfig
@@ -60,6 +60,11 @@ config S5P_DEV_FIMC2
 	help
 	  Compile in platform device definitions for FIMC controller 2
 
+config S5P_DEV_MFC
+	bool
+	help
+	  Compile in platform device definitions for MFC
+
 config S5P_DEV_ONENAND
 	bool
 	help
diff --git a/arch/arm/plat-s5p/Makefile b/arch/arm/plat-s5p/Makefile
index 4bd5cf9..b1d2b2b 100644
--- a/arch/arm/plat-s5p/Makefile
+++ b/arch/arm/plat-s5p/Makefile
@@ -28,6 +28,7 @@ obj-$(CONFIG_PM)		+= irq-pm.o
 obj-$(CONFIG_S5P_DEV_FIMC0)	+= dev-fimc0.o
 obj-$(CONFIG_S5P_DEV_FIMC1)	+= dev-fimc1.o
 obj-$(CONFIG_S5P_DEV_FIMC2)	+= dev-fimc2.o
+obj-$(CONFIG_S5P_DEV_MFC)	+= dev-mfc.o
 obj-$(CONFIG_S5P_DEV_ONENAND)	+= dev-onenand.o
 obj-$(CONFIG_S5P_DEV_CSIS0)	+= dev-csis0.o
 obj-$(CONFIG_S5P_DEV_CSIS1)	+= dev-csis1.o
diff --git a/arch/arm/plat-s5p/dev-mfc.c b/arch/arm/plat-s5p/dev-mfc.c
new file mode 100644
index 0000000..67afdae
--- /dev/null
+++ b/arch/arm/plat-s5p/dev-mfc.c
@@ -0,0 +1,46 @@
+/* linux/arch/arm/plat-s5p/dev-mfc.c
+ *
+ * Copyright (c) 2010 Samsung Electronics
+ *
+ * Base S5P MFC resource and device definitions
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#include <linux/kernel.h>
+#include <linux/interrupt.h>
+#include <linux/platform_device.h>
+#include <linux/ioport.h>
+#include <linux/dma-mapping.h>
+
+#include <mach/map.h>
+#include <plat/devs.h>
+#include <plat/irqs.h>
+
+static struct resource s5p_mfc_resource[] = {
+	[0] = {
+		.start	= S5P_PA_MFC,
+		.end	= S5P_PA_MFC + SZ_64K - 1,
+		.flags	= IORESOURCE_MEM,
+	},
+	[1] = {
+		.start	= IRQ_MFC,
+		.end	= IRQ_MFC,
+		.flags	= IORESOURCE_IRQ,
+	}
+};
+
+static u64 s5p_mfc_dma_mask = DMA_BIT_MASK(32);
+
+struct platform_device s5p_device_mfc = {
+	.name		= "s5p-mfc",
+	.id		= -1,
+	.num_resources	= ARRAY_SIZE(s5p_mfc_resource),
+	.resource	= s5p_mfc_resource,
+	.dev		= {
+		.dma_mask		= &s5p_mfc_dma_mask,
+		.coherent_dma_mask	= DMA_BIT_MASK(32),
+	},
+};
-- 
1.7.1
