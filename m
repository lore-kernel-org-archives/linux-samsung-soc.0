From: Vladimir Zapolskiy <vzapolskiy@gmail.com>
Subject: [PATCH 3/4] ARM: S5P: add platform support for advanced crypto engine
Date: Tue, 12 Apr 2011 01:02:56 +0300
Message-ID: <1302559377-14857-4-git-send-email-vzapolskiy@gmail.com>
References: <1302559377-14857-1-git-send-email-vzapolskiy@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ey0-f174.google.com ([209.85.215.174]:51354 "EHLO
	mail-ey0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754404Ab1DKWD0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 11 Apr 2011 18:03:26 -0400
Received: by eyx24 with SMTP id 24so1854467eyx.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 11 Apr 2011 15:03:24 -0700 (PDT)
In-Reply-To: <1302559377-14857-1-git-send-email-vzapolskiy@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Kukjin Kim <kgene.kim@samsung.com>, Vladimir Zapolskiy <vzapolskiy@gmail.com>

This change adds platform support for hardware security engine found
on Samsung S5PC110 and S5PV210 system-on-chips.

Signed-off-by: Vladimir Zapolskiy <vzapolskiy@gmail.com>
---
 arch/arm/plat-s5p/Kconfig                 |    5 +++
 arch/arm/plat-s5p/Makefile                |    1 +
 arch/arm/plat-s5p/dev-secss.c             |   41 +++++++++++++++++++++++++++++
 arch/arm/plat-samsung/include/plat/devs.h |    2 +
 4 files changed, 49 insertions(+), 0 deletions(-)
 create mode 100644 arch/arm/plat-s5p/dev-secss.c

diff --git a/arch/arm/plat-s5p/Kconfig b/arch/arm/plat-s5p/Kconfig
index 8492297..554427d 100644
--- a/arch/arm/plat-s5p/Kconfig
+++ b/arch/arm/plat-s5p/Kconfig
@@ -85,6 +85,11 @@ config S5P_DEV_CSIS1
 	help
 	  Compile in platform device definitions for MIPI-CSIS channel 1
 
+config S5P_DEV_SECSS
+	bool
+	help
+	  Compile in platform device definitions for S5PV210 security subsystem
+
 config S5P_SETUP_MIPIPHY
 	bool
 	help
diff --git a/arch/arm/plat-s5p/Makefile b/arch/arm/plat-s5p/Makefile
index 42afff7..10b4454 100644
--- a/arch/arm/plat-s5p/Makefile
+++ b/arch/arm/plat-s5p/Makefile
@@ -33,4 +33,5 @@ obj-$(CONFIG_S5P_DEV_FIMC3)	+= dev-fimc3.o
 obj-$(CONFIG_S5P_DEV_ONENAND)	+= dev-onenand.o
 obj-$(CONFIG_S5P_DEV_CSIS0)	+= dev-csis0.o
 obj-$(CONFIG_S5P_DEV_CSIS1)	+= dev-csis1.o
+obj-$(CONFIG_S5P_DEV_SECSS)	+= dev-secss.o
 obj-$(CONFIG_S5P_SETUP_MIPIPHY)	+= setup-mipiphy.o
diff --git a/arch/arm/plat-s5p/dev-secss.c b/arch/arm/plat-s5p/dev-secss.c
new file mode 100644
index 0000000..6355ebc
--- /dev/null
+++ b/arch/arm/plat-s5p/dev-secss.c
@@ -0,0 +1,41 @@
+/*
+ * Copyright (C) 2011 Vladimir Zapolskiy <vzapolskiy@gmail.com>
+ *
+ * S5PC110/S5PV210 security subsystem device definition
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+*/
+
+#include <linux/kernel.h>
+#include <linux/platform_device.h>
+#include <mach/map.h>
+#include <mach/irqs.h>
+
+static struct resource s5p_secss_resources[] = {
+	{
+		.start  = S5P_PA_SECSS,
+		.end    = S5P_PA_SECSS + SZ_32K - 1,
+		.flags  = IORESOURCE_MEM,
+	},
+	{
+		.name   = "hash",
+		.start  = IRQ_SSS_HASH,
+		.end    = IRQ_SSS_HASH,
+		.flags  = IORESOURCE_IRQ,
+	},
+	{
+		.name   = "feed control",
+		.start  = IRQ_SSS_INT,
+		.end    = IRQ_SSS_INT,
+		.flags  = IORESOURCE_IRQ,
+	},
+};
+
+struct platform_device s5p_device_secss = {
+	.name		= "s5p-secss",
+	.id		= -1,
+	.num_resources	= ARRAY_SIZE(s5p_secss_resources),
+	.resource	= s5p_secss_resources,
+};
diff --git a/arch/arm/plat-samsung/include/plat/devs.h b/arch/arm/plat-samsung/include/plat/devs.h
index f0da6b7..e21d5a5 100644
--- a/arch/arm/plat-samsung/include/plat/devs.h
+++ b/arch/arm/plat-samsung/include/plat/devs.h
@@ -142,6 +142,8 @@ extern struct platform_device s5p_device_fimc3;
 extern struct platform_device s5p_device_mipi_csis0;
 extern struct platform_device s5p_device_mipi_csis1;
 
+extern struct platform_device s5p_device_secss;
+
 extern struct platform_device exynos4_device_sysmmu;
 
 /* s3c2440 specific devices */
-- 
1.7.2.3
