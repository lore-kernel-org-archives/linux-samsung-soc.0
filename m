From: jassisinghbrar@gmail.com
Subject: [PATCH 3/4] S3C64XX DSP: Defined PCM controller platform devices
Date: Mon,  2 Nov 2009 11:09:50 +0900
Message-ID: <1257127791-5595-3-git-send-email-jassisinghbrar@gmail.com>
References: <1257127791-5595-1-git-send-email-jassisinghbrar@gmail.com>
 <1257127791-5595-2-git-send-email-jassisinghbrar@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:57294 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753610AbZKBCMv (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 1 Nov 2009 21:12:51 -0500
In-Reply-To: <1257127791-5595-2-git-send-email-jassisinghbrar@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Jassi Brar <jassi.brar@samsung.com>

From: Jassi Brar <jassi.brar@samsung.com>

Signed-off-by: Jassi Brar <jassi.brar@samsung.com>
---
 arch/arm/plat-s3c64xx/Makefile                    |    1 +
 arch/arm/plat-s3c64xx/dev-pcm.c                   |   50 +++++++++++++++++++++
 arch/arm/plat-s3c64xx/include/plat/s3c64xx-devs.h |   18 +++++++
 3 files changed, 69 insertions(+), 0 deletions(-)
 create mode 100644 arch/arm/plat-s3c64xx/dev-pcm.c
 create mode 100644 arch/arm/plat-s3c64xx/include/plat/s3c64xx-devs.h

diff --git a/arch/arm/plat-s3c64xx/Makefile b/arch/arm/plat-s3c64xx/Makefile
index b85b435..83c5bf1 100644
--- a/arch/arm/plat-s3c64xx/Makefile
+++ b/arch/arm/plat-s3c64xx/Makefile
@@ -42,3 +42,4 @@ obj-$(CONFIG_S3C64XX_SETUP_I2C1) += setup-i2c1.o
 obj-$(CONFIG_S3C64XX_SETUP_FB_24BPP) += setup-fb-24bpp.o
 obj-$(CONFIG_S3C64XX_SETUP_SDHCI_GPIO) += setup-sdhci-gpio.o
 obj-$(CONFIG_SND_S3C24XX_SOC) += dev-audio.o
+obj-$(CONFIG_SND_S3C64XX_SOC_DSP) += dev-pcm.o
diff --git a/arch/arm/plat-s3c64xx/dev-pcm.c b/arch/arm/plat-s3c64xx/dev-pcm.c
new file mode 100644
index 0000000..f8f483a
--- /dev/null
+++ b/arch/arm/plat-s3c64xx/dev-pcm.c
@@ -0,0 +1,50 @@
+/* linux/arch/arm/plat-s3c64xx/dev-pcm.c
+ *
+ *  Copyright (c) 2009 Samsung Electronics Co. Ltd
+ *  Author: Jaswinder Singh <jassi.brar@samsung.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#include <linux/kernel.h>
+#include <linux/string.h>
+#include <linux/platform_device.h>
+
+#include <mach/irqs.h>
+#include <mach/map.h>
+
+#include <plat/devs.h>
+
+static struct resource s3c64xx_pcm0_resource[] = {
+	[0] = {
+		.start = S3C64XX_PA_PCM0,
+		.end   = S3C64XX_PA_PCM0 + 0x100 - 1,
+		.flags = IORESOURCE_MEM,
+	},
+};
+
+struct platform_device s3c64xx_device_pcm0 = {
+	.name		  = "s3c64xx-dsp",
+	.id		  = 0,
+	.num_resources	  = ARRAY_SIZE(s3c64xx_pcm0_resource),
+	.resource	  = s3c64xx_pcm0_resource,
+};
+EXPORT_SYMBOL(s3c64xx_device_pcm0);
+
+static struct resource s3c64xx_pcm1_resource[] = {
+	[0] = {
+		.start = S3C64XX_PA_PCM1,
+		.end   = S3C64XX_PA_PCM1 + 0x100 - 1,
+		.flags = IORESOURCE_MEM,
+	},
+};
+
+struct platform_device s3c64xx_device_pcm1 = {
+	.name		  = "s3c64xx-dsp",
+	.id		  = 1,
+	.num_resources	  = ARRAY_SIZE(s3c64xx_pcm1_resource),
+	.resource	  = s3c64xx_pcm1_resource,
+};
+EXPORT_SYMBOL(s3c64xx_device_pcm1);
diff --git a/arch/arm/plat-s3c64xx/include/plat/s3c64xx-devs.h b/arch/arm/plat-s3c64xx/include/plat/s3c64xx-devs.h
new file mode 100644
index 0000000..d828869
--- /dev/null
+++ b/arch/arm/plat-s3c64xx/include/plat/s3c64xx-devs.h
@@ -0,0 +1,18 @@
+/* linux/arch/arm/plat-s3c64xx/include/plat/s3c64xx-devs.h
+ *
+ * Header file for s3c64xx specific platform devices
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#ifndef __PLAT_S3C64XX_DEVS_H
+#define __PLAT_S3C64XX_DEVS_H
+
+#include <linux/platform_device.h>
+
+extern struct platform_device s3c64xx_device_pcm0;
+extern struct platform_device s3c64xx_device_pcm1;
+
+#endif /* __PLAT_S3C64XX_DEVS_H */
-- 
1.6.2.5
