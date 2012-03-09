From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 1/3] ARM: Exynos: add platform device for core DRM subsystem
Date: Fri, 09 Mar 2012 12:05:03 +0100
Message-ID: <1331291105-18152-2-git-send-email-m.szyprowski@samsung.com>
References: <1331291105-18152-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:50451 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752365Ab2CILHq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 9 Mar 2012 06:07:46 -0500
Received: from euspt1 ([210.118.77.14]) by mailout4.w1.samsung.com
 (Sun Java(tm) System Messaging Server 6.3-8.04 (built Jul 29 2009; 32bit))
 with ESMTP id <0M0M0074W6WWG870@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 09 Mar 2012 11:07:44 +0000 (GMT)
Received: from linux.samsung.com ([106.116.38.10])
 by spt1.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0M0M00KCQ6WW63@spt1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 09 Mar 2012 11:07:44 +0000 (GMT)
In-reply-to: <1331291105-18152-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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
index 9f40689..5a26944 100644
--- a/arch/arm/mach-exynos/Kconfig
+++ b/arch/arm/mach-exynos/Kconfig
@@ -83,6 +83,11 @@ config EXYNOS4_DEV_AHCI
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
index 04feed2..39a9ee4 100644
--- a/arch/arm/mach-exynos/Makefile
+++ b/arch/arm/mach-exynos/Makefile
@@ -51,6 +51,7 @@ obj-$(CONFIG_MACH_EXYNOS5_DT)		+= mach-exynos5-dt.o
 obj-y					+= dev-uart.o
 obj-$(CONFIG_ARCH_EXYNOS4)		+= dev-audio.o
 obj-$(CONFIG_EXYNOS4_DEV_AHCI)		+= dev-ahci.o
+obj-$(CONFIG_EXYNOS_DEV_DRM)		+= dev-drm.o
 obj-$(CONFIG_EXYNOS4_DEV_SYSMMU)	+= dev-sysmmu.o
 obj-$(CONFIG_EXYNOS4_DEV_DWMCI)		+= dev-dwmci.o
 obj-$(CONFIG_EXYNOS4_DEV_DMA)		+= dma.o
diff --git a/arch/arm/mach-exynos/dev-drm.c b/arch/arm/mach-exynos/dev-drm.c
new file mode 100644
index 0000000..b2258c8
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
index 2dd5267..d4075cb 100644
--- a/arch/arm/plat-samsung/include/plat/devs.h
+++ b/arch/arm/plat-samsung/include/plat/devs.h
@@ -134,6 +134,8 @@ extern struct platform_device exynos4_device_pd[];
 extern struct platform_device exynos4_device_spdif;
 extern struct platform_device exynos4_device_sysmmu;
 
+extern struct platform_device exynos_device_drm;
+
 extern struct platform_device samsung_asoc_dma;
 extern struct platform_device samsung_asoc_idma;
 extern struct platform_device samsung_device_keypad;
-- 
1.7.1.569.g6f426
