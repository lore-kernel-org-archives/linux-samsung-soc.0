From: Maurus Cuelenaere <mcuelenaere@gmail.com>
Subject: [PATCH 2/2] Add S3C64XX support to the generic Samsung ADC driver
Date: Thu, 14 Jan 2010 00:30:34 +0100
Message-ID: <b2e8f9f71001131530v19111067g5fa526b08458f759@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bw0-f227.google.com ([209.85.218.227]:51033 "EHLO
	mail-bw0-f227.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754292Ab0AMXaz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 13 Jan 2010 18:30:55 -0500
Received: by mail-bw0-f227.google.com with SMTP id 27so2477376bwz.21
        for <linux-samsung-soc@vger.kernel.org>; Wed, 13 Jan 2010 15:30:54 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Ben Dooks <ben-linux@fluff.org>

Add S3C64XX support to the generic Samsung ADC driver

Signed-off-by: Maurus Cuelenaere <mcuelenaere@gmail.com>
---
 arch/arm/mach-s3c6400/include/mach/map.h  |    1 +
 arch/arm/plat-s3c/include/plat/regs-adc.h |    3 ++
 arch/arm/plat-s3c64xx/Makefile            |    4 ++
 arch/arm/plat-s3c64xx/dev-adc.c           |   46 +++++++++++++++++++++++++++++
 arch/arm/plat-samsung/adc.c               |   27 +++++++++++++++-
 5 files changed, 79 insertions(+), 2 deletions(-)
 create mode 100644 arch/arm/plat-s3c64xx/dev-adc.c

diff --git a/arch/arm/mach-s3c6400/include/mach/map.h
b/arch/arm/mach-s3c6400/include/mach/map.h
index d4cd3ab..5a35f24 100644
--- a/arch/arm/mach-s3c6400/include/mach/map.h
+++ b/arch/arm/mach-s3c6400/include/mach/map.h
@@ -42,6 +42,7 @@
 #define S3C64XX_PA_FB		(0x77100000)
 #define S3C64XX_PA_USB_HSOTG	(0x7C000000)
 #define S3C64XX_PA_WATCHDOG	(0x7E004000)
+#define S3C64XX_PA_ADC		(0x7E00B000)
 #define S3C64XX_PA_SYSCON	(0x7E00F000)
 #define S3C64XX_PA_AC97		(0x7F001000)
 #define S3C64XX_PA_IIS0		(0x7F002000)
diff --git a/arch/arm/plat-s3c/include/plat/regs-adc.h
b/arch/arm/plat-s3c/include/plat/regs-adc.h
index 4323ccc..f43c8da 100644
--- a/arch/arm/plat-s3c/include/plat/regs-adc.h
+++ b/arch/arm/plat-s3c/include/plat/regs-adc.h
@@ -19,6 +19,9 @@
 #define S3C2410_ADCDLY	   S3C2410_ADCREG(0x08)
 #define S3C2410_ADCDAT0	   S3C2410_ADCREG(0x0C)
 #define S3C2410_ADCDAT1	   S3C2410_ADCREG(0x10)
+#define S3C64XX_ADCUPDN		S3C2410_ADCREG(0x14)
+#define S3C64XX_ADCCLRINT	S3C2410_ADCREG(0x18)
+#define S3C64XX_ADCCLRINTPNDNUP	S3C2410_ADCREG(0x20)


 /* ADCCON Register Bits */
diff --git a/arch/arm/plat-s3c64xx/Makefile b/arch/arm/plat-s3c64xx/Makefile
index b85b435..8060017 100644
--- a/arch/arm/plat-s3c64xx/Makefile
+++ b/arch/arm/plat-s3c64xx/Makefile
@@ -35,6 +35,10 @@ obj-$(CONFIG_PM)		+= irq-pm.o

 obj-$(CONFIG_S3C64XX_DMA)	+= dma.o

+# ADC support
+
+obj-$(CONFIG_S3C_ADC)		+= dev-adc.o
+
 # Device setup

 obj-$(CONFIG_S3C64XX_SETUP_I2C0) += setup-i2c0.o
diff --git a/arch/arm/plat-s3c64xx/dev-adc.c b/arch/arm/plat-s3c64xx/dev-adc.c
new file mode 100644
index 0000000..fafef9b
--- /dev/null
+++ b/arch/arm/plat-s3c64xx/dev-adc.c
@@ -0,0 +1,46 @@
+/* linux/arch/arm/plat-s3c64xx/dev-adc.c
+ *
+ * Copyright 2010 Maurus Cuelenaere
+ *
+ * S3C64xx series device definition for ADC device
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+*/
+
+#include <linux/kernel.h>
+#include <linux/string.h>
+#include <linux/platform_device.h>
+
+#include <mach/irqs.h>
+#include <mach/map.h>
+
+#include <plat/adc.h>
+#include <plat/devs.h>
+#include <plat/cpu.h>
+
+static struct resource s3c_adc_resource[] = {
+	[0] = {
+		.start = S3C64XX_PA_ADC,
+		.end   = S3C64XX_PA_ADC + SZ_256 - 1,
+		.flags = IORESOURCE_MEM,
+	},
+	[1] = {
+		.start = IRQ_TC,
+		.end   = IRQ_TC,
+		.flags = IORESOURCE_IRQ,
+	},
+	[2] = {
+		.start = IRQ_ADC,
+		.end   = IRQ_ADC,
+		.flags = IORESOURCE_IRQ,
+	},
+};
+
+struct platform_device s3c_device_adc = {
+	.name		= "s3c64xx-adc",
+	.id		= -1,
+	.num_resources	= ARRAY_SIZE(s3c_adc_resource),
+	.resource	= s3c_adc_resource,
+};
diff --git a/arch/arm/plat-samsung/adc.c b/arch/arm/plat-samsung/adc.c
index a8843dd..120b790 100644
--- a/arch/arm/plat-samsung/adc.c
+++ b/arch/arm/plat-samsung/adc.c
@@ -37,6 +37,11 @@
  * action is required.
  */

+enum s3c_cpu_type {
+	TYPE_S3C24XX,
+	TYPE_S3C64XX
+};
+
 struct s3c_adc_client {
 	struct platform_device	*pdev;
 	struct list_head	 pend;
@@ -262,7 +267,7 @@ static irqreturn_t s3c_adc_irq(int irq, void *pw)

 	if (!client) {
 		dev_warn(&adc->pdev->dev, "%s: no adc pending\n", __func__);
-		return IRQ_HANDLED;
+		goto exit;
 	}

 	data0 = readl(adc->regs + S3C2410_ADCDAT0);
@@ -289,6 +294,11 @@ static irqreturn_t s3c_adc_irq(int irq, void *pw)
 		local_irq_restore(flags);
 	}

+exit:
+	if (platform_get_device_id(client->pdev)->driver_data == TYPE_S3C64XX) {
+		/* Clear ADC interrupt */
+		writel(0, adc->regs + S3C64XX_ADCCLRINT);
+	}
 	return IRQ_HANDLED;
 }

@@ -410,9 +420,22 @@ static int s3c_adc_resume(struct platform_device *pdev)
 #define s3c_adc_resume NULL
 #endif

+static struct platform_device_id s3c_adc_driver_ids[] = {
+	{
+		.name           = "s3c24xx-adc",
+		.driver_data    = TYPE_S3C24XX,
+	}, {
+		.name           = "s3c64xx-adc",
+		.driver_data    = TYPE_S3C64XX,
+	},
+	{ }
+};
+MODULE_DEVICE_TABLE(platform, s3c_adc_driver_ids);
+
 static struct platform_driver s3c_adc_driver = {
+	.id_table	= s3c_adc_driver_ids,
 	.driver		= {
-		.name	= "s3c24xx-adc",
+		.name	= "s3c-adc",
 		.owner	= THIS_MODULE,
 	},
 	.probe		= s3c_adc_probe,
-- 
1.6.6
