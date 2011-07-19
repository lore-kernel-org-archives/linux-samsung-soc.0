From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 4/8] ARM: S5P: add support for tv device
Date: Tue, 19 Jul 2011 10:44:23 +0200
Message-ID: <1311065067-20324-5-git-send-email-m.szyprowski@samsung.com>
References: <1311065067-20324-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:44137 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752365Ab1GSIoe (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 19 Jul 2011 04:44:34 -0400
Received: from eu_spt1 ([210.118.77.14]) by mailout4.w1.samsung.com
 (Sun Java(tm) System Messaging Server 6.3-8.04 (built Jul 29 2009; 32bit))
 with ESMTP id <0LOK00422OA8E220@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 19 Jul 2011 09:44:32 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt1.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0LOK00DBGOA7TD@spt1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 19 Jul 2011 09:44:32 +0100 (BST)
In-reply-to: <1311065067-20324-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Tomasz Stanislawski <t.stanislaws@samsung.com>

From: Tomasz Stanislawski <t.stanislaws@samsung.com>

This patch adds:
- resources for TV drivers and devices
- setters for names of TV devices

Signed-off-by: Tomasz Stanislawski <t.stanislaws@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm/plat-s5p/Kconfig                    |    5 ++
 arch/arm/plat-s5p/Makefile                   |    1 +
 arch/arm/plat-s5p/dev-tv.c                   |  100 ++++++++++++++++++++++++++
 arch/arm/plat-samsung/include/plat/devs.h    |    5 ++
 arch/arm/plat-samsung/include/plat/tv-core.h |   44 +++++++++++
 5 files changed, 155 insertions(+), 0 deletions(-)
 create mode 100644 arch/arm/plat-s5p/dev-tv.c
 create mode 100644 arch/arm/plat-samsung/include/plat/tv-core.h

diff --git a/arch/arm/plat-s5p/Kconfig b/arch/arm/plat-s5p/Kconfig
index 39ea710..c0ac32c 100644
--- a/arch/arm/plat-s5p/Kconfig
+++ b/arch/arm/plat-s5p/Kconfig
@@ -91,6 +91,11 @@ config S5P_DEV_CSIS1
 	help
 	  Compile in platform device definitions for MIPI-CSIS channel 1
 
+config S5P_DEV_TV
+	bool
+	help
+	  Compile in platform device definition for TV interface
+
 config S5P_DEV_USB_EHCI
 	bool
 	help
diff --git a/arch/arm/plat-s5p/Makefile b/arch/arm/plat-s5p/Makefile
index 18925ab..5d5eee3 100644
--- a/arch/arm/plat-s5p/Makefile
+++ b/arch/arm/plat-s5p/Makefile
@@ -33,5 +33,6 @@ obj-$(CONFIG_S5P_DEV_FIMC3)	+= dev-fimc3.o
 obj-$(CONFIG_S5P_DEV_ONENAND)	+= dev-onenand.o
 obj-$(CONFIG_S5P_DEV_CSIS0)	+= dev-csis0.o
 obj-$(CONFIG_S5P_DEV_CSIS1)	+= dev-csis1.o
+obj-$(CONFIG_S5P_DEV_TV)	+= dev-tv.o
 obj-$(CONFIG_S5P_DEV_USB_EHCI)	+= dev-ehci.o
 obj-$(CONFIG_S5P_SETUP_MIPIPHY)	+= setup-mipiphy.o
diff --git a/arch/arm/plat-s5p/dev-tv.c b/arch/arm/plat-s5p/dev-tv.c
new file mode 100644
index 0000000..28f43a2
--- /dev/null
+++ b/arch/arm/plat-s5p/dev-tv.c
@@ -0,0 +1,100 @@
+/* linux/arch/arm/plat-s5p/dev-tv.c
+ *
+ * Copyright 2011 Samsung Electronics
+ *      Tomasz Stanislawski <t.stanislaws@samsung.com>
+ *
+ * S5P series device definition for TV device
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+*/
+
+#include <linux/dma-mapping.h>
+
+#include <mach/irqs.h>
+#include <mach/map.h>
+
+#include <plat/devs.h>
+
+/* HDMI interface */
+static struct resource s5p_hdmi_resources[] = {
+	[0] = {
+		.start  = S5P_PA_HDMI,
+		.end    = S5P_PA_HDMI + S5P_SZ_HDMI - 1,
+		.flags  = IORESOURCE_MEM,
+	},
+	[1] = {
+		.start  = IRQ_HDMI,
+		.end    = IRQ_HDMI,
+		.flags  = IORESOURCE_IRQ,
+	},
+};
+
+struct platform_device s5p_device_hdmi = {
+	.name           = "s5p-hdmi",
+	.id             = -1,
+	.num_resources  = ARRAY_SIZE(s5p_hdmi_resources),
+	.resource       = s5p_hdmi_resources,
+};
+EXPORT_SYMBOL(s5p_device_hdmi);
+
+/* MIXER */
+static struct resource s5p_mixer_resources[] = {
+	[0] = {
+		.start  = S5P_PA_MIXER,
+		.end    = S5P_PA_MIXER + S5P_SZ_MIXER - 1,
+		.flags  = IORESOURCE_MEM,
+		.name	= "mxr"
+	},
+	[1] = {
+		.start  = S5P_PA_VP,
+		.end    = S5P_PA_VP + S5P_SZ_VP - 1,
+		.flags  = IORESOURCE_MEM,
+		.name	= "vp"
+	},
+	[2] = {
+		.start  = IRQ_MIXER,
+		.end    = IRQ_MIXER,
+		.flags  = IORESOURCE_IRQ,
+		.name	= "irq"
+	},
+};
+
+struct platform_device s5p_device_mixer = {
+	.name           = "s5p-mixer",
+	.id             = -1,
+	.num_resources  = ARRAY_SIZE(s5p_mixer_resources),
+	.resource       = s5p_mixer_resources,
+	.dev		= {
+		.coherent_dma_mask = DMA_BIT_MASK(32),
+		.dma_mask = &s5p_device_mixer.dev.coherent_dma_mask,
+	}
+};
+EXPORT_SYMBOL(s5p_device_mixer);
+
+/* HDMI interface */
+static struct resource s5p_sdo_resources[] = {
+	[0] = {
+		.start  = S5P_PA_SDO,
+		.end    = S5P_PA_SDO + S5P_SZ_SDO - 1,
+		.flags  = IORESOURCE_MEM,
+	},
+	[1] = {
+		.start  = IRQ_SDO,
+		.end    = IRQ_SDO,
+		.flags  = IORESOURCE_IRQ,
+	},
+};
+
+struct platform_device s5p_device_sdo = {
+	.name           = "s5p-sdo",
+	.id             = -1,
+	.num_resources  = ARRAY_SIZE(s5p_sdo_resources),
+	.resource       = s5p_sdo_resources,
+	.dev		= {
+		.coherent_dma_mask = DMA_BIT_MASK(32),
+		.dma_mask = &s5p_device_sdo.dev.coherent_dma_mask,
+	}
+};
+EXPORT_SYMBOL(s5p_device_sdo);
diff --git a/arch/arm/plat-samsung/include/plat/devs.h b/arch/arm/plat-samsung/include/plat/devs.h
index 62ee543..9442d3f 100644
--- a/arch/arm/plat-samsung/include/plat/devs.h
+++ b/arch/arm/plat-samsung/include/plat/devs.h
@@ -140,6 +140,11 @@ extern struct platform_device s5p_device_fimc3;
 extern struct platform_device s5p_device_mfc;
 extern struct platform_device s5p_device_mfc_l;
 extern struct platform_device s5p_device_mfc_r;
+
+extern struct platform_device s5p_device_hdmi;
+extern struct platform_device s5p_device_mixer;
+extern struct platform_device s5p_device_sdo;
+
 extern struct platform_device s5p_device_mipi_csis0;
 extern struct platform_device s5p_device_mipi_csis1;
 
diff --git a/arch/arm/plat-samsung/include/plat/tv-core.h b/arch/arm/plat-samsung/include/plat/tv-core.h
new file mode 100644
index 0000000..3bc34f3
--- /dev/null
+++ b/arch/arm/plat-samsung/include/plat/tv-core.h
@@ -0,0 +1,44 @@
+/*
+ * arch/arm/plat-samsung/include/plat/tv.h
+ *
+ * Copyright 2011 Samsung Electronics Co., Ltd.
+ *	Tomasz Stanislawski <t.stanislaws@samsung.com>
+ *
+ * Samsung TV driver core functions
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#ifndef __SAMSUNG_PLAT_TV_H
+#define __SAMSUNG_PLAT_TV_H __FILE__
+
+/*
+ * These functions are only for use with the core support code, such as
+ * the CPU-specific initialization code.
+ */
+
+/* Re-define device name to differentiate the subsystem in various SoCs. */
+static inline void s5p_hdmi_setname(char *name)
+{
+#ifdef CONFIG_S5P_DEV_TV
+	s5p_device_hdmi.name = name;
+#endif
+}
+
+static inline void s5p_mixer_setname(char *name)
+{
+#ifdef CONFIG_S5P_DEV_TV
+	s5p_device_mixer.name = name;
+#endif
+}
+
+static inline void s5p_sdo_setname(char *name)
+{
+#ifdef CONFIG_S5P_DEV_TV
+	s5p_device_sdo.name = name;
+#endif
+}
+
+#endif /* __SAMSUNG_PLAT_TV_H */
-- 
1.7.1.569.g6f426
