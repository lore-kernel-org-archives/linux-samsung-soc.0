From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCHv2 1/3] ARM: Exynos: add platform device for core DRM subsystem
Date: Tue, 13 Mar 2012 11:39:37 +0100
Message-ID: <1331635180-7207-2-git-send-email-m.szyprowski@samsung.com>
References: <1331635180-7207-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:42379 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1760495Ab2CMKjs (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 13 Mar 2012 06:39:48 -0400
Received: from euspt1 ([210.118.77.13]) by mailout3.w1.samsung.com
 (Sun Java(tm) System Messaging Server 6.3-8.04 (built Jul 29 2009; 32bit))
 with ESMTP id <0M0T00HN0KA92A70@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 13 Mar 2012 10:39:45 +0000 (GMT)
Received: from linux.samsung.com ([106.116.38.10])
 by spt1.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0M0T00LV3KA8EZ@spt1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 13 Mar 2012 10:39:45 +0000 (GMT)
In-reply-to: <1331635180-7207-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>

Add platform device for Exynos DRM core. This device is used for
creating DRM user-space device and allocating memory for display buffers.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/mach-exynos/Kconfig              |    5 +++++
 arch/arm/mach-exynos/Makefile             |    1 +
 arch/arm/mach-exynos/dev-drm.c            |   29 +++++++++++++++++++++++++++++
 arch/arm/plat-samsung/include/plat/devs.h |    2 ++
 4 files changed, 37 insertions(+), 0 deletions(-)
 create mode 100644 arch/arm/mach-exynos/dev-drm.c

diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kconfig
index 060414e..9124ce9 100644
--- a/arch/arm/mach-exynos/Kconfig
+++ b/arch/arm/mach-exynos/Kconfig
@@ -85,6 +85,11 @@ config EXYNOS4_DEV_AHCI
 	help
 	  Compile in platform device definitions for AHCI
 
+config EXYNOS_DEV_DRM
+	bool
+	help
+	  Compile in platform device definitions for core DRM device
+
 config EXYNOS4_SETUP_FIMD0
 	bool
 	help
diff --git a/arch/arm/mach-exynos/Makefile b/arch/arm/mach-exynos/Makefile
index 8631840..f67e882 100644
--- a/arch/arm/mach-exynos/Makefile
+++ b/arch/arm/mach-exynos/Makefile
@@ -50,6 +50,7 @@ obj-$(CONFIG_MACH_EXYNOS5_DT)		+= mach-exynos5-dt.o
 obj-y					+= dev-uart.o
 obj-$(CONFIG_ARCH_EXYNOS4)		+= dev-audio.o
 obj-$(CONFIG_EXYNOS4_DEV_AHCI)		+= dev-ahci.o
+obj-$(CONFIG_EXYNOS_DEV_DRM)		+= dev-drm.o
 obj-$(CONFIG_EXYNOS4_DEV_SYSMMU)	+= dev-sysmmu.o
 obj-$(CONFIG_EXYNOS4_DEV_DWMCI)		+= dev-dwmci.o
 obj-$(CONFIG_EXYNOS4_DEV_DMA)		+= dma.o
diff --git a/arch/arm/mach-exynos/dev-drm.c b/arch/arm/mach-exynos/dev-drm.c
new file mode 100644
index 0000000..17c9c6e
--- /dev/null
+++ b/arch/arm/mach-exynos/dev-drm.c
@@ -0,0 +1,29 @@
+/*
+ * linux/arch/arm/mach-exynos/dev-drm.c
+ *
+ * Copyright (c) 2012 Samsung Electronics Co., Ltd.
+ *		http://www.samsung.com
+ *
+ * EXYNOS - core DRM device
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ */
+
+#include <linux/kernel.h>
+#include <linux/dma-mapping.h>
+#include <linux/platform_device.h>
+
+#include <plat/devs.h>
+
+static u64 exynos_drm_dma_mask = DMA_BIT_MASK(32);
+
+struct platform_device exynos_device_drm = {
+	.name	= "exynos-drm",
+	.dev	= {
+		.dma_mask		= &exynos_drm_dma_mask,
+		.coherent_dma_mask	= DMA_BIT_MASK(32),
+	}
+};
diff --git a/arch/arm/plat-samsung/include/plat/devs.h b/arch/arm/plat-samsung/include/plat/devs.h
index 2155d4a..62e6251 100644
--- a/arch/arm/plat-samsung/include/plat/devs.h
+++ b/arch/arm/plat-samsung/include/plat/devs.h
@@ -135,6 +135,8 @@ extern struct platform_device exynos4_device_pd[];
 extern struct platform_device exynos4_device_spdif;
 extern struct platform_device exynos4_device_sysmmu;
 
+extern struct platform_device exynos_device_drm;
+
 extern struct platform_device samsung_asoc_dma;
 extern struct platform_device samsung_asoc_idma;
 extern struct platform_device samsung_device_keypad;
-- 
1.7.1.569.g6f426
