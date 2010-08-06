From: Joonyoung Shim <jy0922.shim@samsung.com>
Subject: [PATCH] ARM: SAMSUNG: Add keypad device support
Date: Fri, 06 Aug 2010 14:30:25 +0900
Message-ID: <1281072625-21079-1-git-send-email-jy0922.shim@samsung.com>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:16197 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751892Ab0HFFal (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 6 Aug 2010 01:30:41 -0400
Received: from epmmp2 (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12 2010))
 with ESMTP id <0L6P00KHRTZ3O460@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 06 Aug 2010 14:30:39 +0900 (KST)
Received: from TNRNDGASPAPP1.tn.corp.samsungelectronics.net ([165.213.149.150])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0L6P005KCTZ4NA@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 06 Aug 2010 14:30:40 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, kyungmin.park@samsung.com, ben-linux@fluff.org

This patch adds samsung keypad device definition for samsung cpus.

Signed-off-by: Joonyoung Shim <jy0922.shim@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
This patch is to add samsung keypad device. It is updated single version
of previous patch "[PATCH v6 1/3] ARM: SAMSUNG: Add keypad device
support".

 arch/arm/plat-samsung/Kconfig               |    5 +++
 arch/arm/plat-samsung/Makefile              |    1 +
 arch/arm/plat-samsung/dev-keypad.c          |   50 +++++++++++++++++++++++++++
 arch/arm/plat-samsung/include/plat/devs.h   |    2 +
 arch/arm/plat-samsung/include/plat/keypad.h |   13 +++++++
 5 files changed, 71 insertions(+), 0 deletions(-)
 create mode 100644 arch/arm/plat-samsung/dev-keypad.c

diff --git a/arch/arm/plat-samsung/Kconfig b/arch/arm/plat-samsung/Kconfig
index 2753fb3..bd007e3 100644
--- a/arch/arm/plat-samsung/Kconfig
+++ b/arch/arm/plat-samsung/Kconfig
@@ -227,6 +227,11 @@ config SAMSUNG_DEV_TS
 	help
 	    Common in platform device definitions for touchscreen device
 
+config SAMSUNG_DEV_KEYPAD
+	bool
+	help
+	  Compile in platform device definitions for keypad
+
 # DMA
 
 config S3C_DMA
diff --git a/arch/arm/plat-samsung/Makefile b/arch/arm/plat-samsung/Makefile
index 228c2ad..ef00c47 100644
--- a/arch/arm/plat-samsung/Makefile
+++ b/arch/arm/plat-samsung/Makefile
@@ -50,6 +50,7 @@ obj-$(CONFIG_S3C_DEV_RTC)	+= dev-rtc.o
 
 obj-$(CONFIG_SAMSUNG_DEV_ADC)	+= dev-adc.o
 obj-$(CONFIG_SAMSUNG_DEV_TS)	+= dev-ts.o
+obj-$(CONFIG_SAMSUNG_DEV_KEYPAD)	+= dev-keypad.o
 
 # DMA support
 
diff --git a/arch/arm/plat-samsung/dev-keypad.c b/arch/arm/plat-samsung/dev-keypad.c
new file mode 100644
index 0000000..677c2d7
--- /dev/null
+++ b/arch/arm/plat-samsung/dev-keypad.c
@@ -0,0 +1,50 @@
+/*
+ * linux/arch/arm/plat-samsung/dev-keypad.c
+ *
+ * Copyright (C) 2010 Samsung Electronics Co.Ltd
+ * Author: Joonyoung Shim <jy0922.shim@samsung.com>
+ *
+ *  This program is free software; you can redistribute  it and/or modify it
+ *  under  the terms of  the GNU General  Public License as published by the
+ *  Free Software Foundation;  either version 2 of the  License, or (at your
+ *  option) any later version.
+ *
+ */
+
+#include <linux/platform_device.h>
+#include <mach/irqs.h>
+#include <mach/map.h>
+#include <plat/cpu.h>
+#include <plat/devs.h>
+#include <plat/keypad.h>
+
+static struct resource samsung_keypad_resources[] = {
+	[0] = {
+		.start	= SAMSUNG_PA_KEYPAD,
+		.end	= SAMSUNG_PA_KEYPAD + 0x20 - 1,
+		.flags	= IORESOURCE_MEM,
+	},
+	[1] = {
+		.start	= IRQ_KEYPAD,
+		.end	= IRQ_KEYPAD,
+		.flags	= IORESOURCE_IRQ,
+	},
+};
+
+struct platform_device samsung_device_keypad = {
+	.name		= "samsung-keypad",
+	.id		= -1,
+	.num_resources	= ARRAY_SIZE(samsung_keypad_resources),
+	.resource	= samsung_keypad_resources,
+};
+
+void __init samsung_keypad_set_platdata(struct samsung_keypad_platdata *pd)
+{
+	struct samsung_keypad_platdata *npd;
+
+	npd = s3c_set_platdata(pd, sizeof(struct samsung_keypad_platdata),
+			&samsung_device_keypad);
+
+	if (!npd->cfg_gpio)
+		npd->cfg_gpio = samsung_keypad_cfg_gpio;
+}
diff --git a/arch/arm/plat-samsung/include/plat/devs.h b/arch/arm/plat-samsung/include/plat/devs.h
index 6760999..c06386b 100644
--- a/arch/arm/plat-samsung/include/plat/devs.h
+++ b/arch/arm/plat-samsung/include/plat/devs.h
@@ -100,6 +100,8 @@ extern struct platform_device s5pc100_device_iis0;
 extern struct platform_device s5pc100_device_iis1;
 extern struct platform_device s5pc100_device_iis2;
 
+extern struct platform_device samsung_device_keypad;
+
 /* s3c2440 specific devices */
 
 #ifdef CONFIG_CPU_S3C2440
diff --git a/arch/arm/plat-samsung/include/plat/keypad.h b/arch/arm/plat-samsung/include/plat/keypad.h
index 3a70c12..b59a648 100644
--- a/arch/arm/plat-samsung/include/plat/keypad.h
+++ b/arch/arm/plat-samsung/include/plat/keypad.h
@@ -40,4 +40,17 @@ struct samsung_keypad_platdata {
 	void (*cfg_gpio)(unsigned int rows, unsigned int cols);
 };
 
+/**
+ * samsung_keypad_set_platdata - Set platform data for Samsung Keypad device.
+ * @pd: Platform data to register to device.
+ *
+ * Register the given platform data for use with Samsung Keypad device.
+ * The call will copy the platform data, so the board definitions can
+ * make the structure itself __initdata.
+ */
+extern void samsung_keypad_set_platdata(struct samsung_keypad_platdata *pd);
+
+/* defined by architecture to configure gpio. */
+extern void samsung_keypad_cfg_gpio(unsigned int rows, unsigned int cols);
+
 #endif /* __PLAT_SAMSUNG_KEYPAD_H */
-- 
1.7.0.4
