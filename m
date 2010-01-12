From: Maurus Cuelenaere <mcuelenaere@gmail.com>
Subject: [PATCH] Add S3C64XX RTC platform driver
Date: Tue, 12 Jan 2010 01:40:14 +0100
Message-ID: <b2e8f9f71001111640y155d819es4187f4d9398fb956@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bw0-f227.google.com ([209.85.218.227]:44136 "EHLO
	mail-bw0-f227.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754440Ab0ALAkg (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 11 Jan 2010 19:40:36 -0500
Received: by bwz27 with SMTP id 27so768573bwz.21
        for <linux-samsung-soc@vger.kernel.org>; Mon, 11 Jan 2010 16:40:35 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Ben Dooks <ben-linux@fluff.org>

Add S3C64XX RTC platform driver

Signed-off-by: Maurus Cuelenaere <mcuelenaere@gmail.com>
---
 arch/arm/mach-s3c6400/include/mach/map.h |    1 +
 arch/arm/plat-s3c64xx/Makefile           |    1 +
 arch/arm/plat-s3c64xx/dev-rtc.c          |   43 ++++++++++++++++++++++++++++++
 3 files changed, 45 insertions(+), 0 deletions(-)
 create mode 100644 arch/arm/plat-s3c64xx/dev-rtc.c

diff --git a/arch/arm/mach-s3c6400/include/mach/map.h
b/arch/arm/mach-s3c6400/include/mach/map.h
index 106ee13..793fb8b 100644
--- a/arch/arm/mach-s3c6400/include/mach/map.h
+++ b/arch/arm/mach-s3c6400/include/mach/map.h
@@ -42,6 +42,7 @@
 #define S3C64XX_PA_FB		(0x77100000)
 #define S3C64XX_PA_USB_HSOTG	(0x7C000000)
 #define S3C64XX_PA_WATCHDOG	(0x7E004000)
+#define S3C64XX_PA_RTC		(0x7E005000)
 #define S3C64XX_PA_SYSCON	(0x7E00F000)
 #define S3C64XX_PA_AC97		(0x7F001000)
 #define S3C64XX_PA_IIS0		(0x7F002000)
diff --git a/arch/arm/plat-s3c64xx/Makefile b/arch/arm/plat-s3c64xx/Makefile
index b85b435..e66dbd7 100644
--- a/arch/arm/plat-s3c64xx/Makefile
+++ b/arch/arm/plat-s3c64xx/Makefile
@@ -13,6 +13,7 @@ obj-				:=
 # Core files

 obj-y				+= dev-uart.o
+obj-y				+= dev-rtc.o
 obj-y				+= cpu.o
 obj-y				+= irq.o
 obj-y				+= irq-eint.o
diff --git a/arch/arm/plat-s3c64xx/dev-rtc.c b/arch/arm/plat-s3c64xx/dev-rtc.c
new file mode 100644
index 0000000..b9e7a05
--- /dev/null
+++ b/arch/arm/plat-s3c64xx/dev-rtc.c
@@ -0,0 +1,43 @@
+/* linux/arch/arm/plat-s3c64xx/dev-rtc.c
+ *
+ * Copyright 2009 by Maurus Cuelenaere <mcuelenaere@gmail.com>
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
+static struct resource s3c_rtc_resource[] = {
+	[0] = {
+		.start = S3C64XX_PA_RTC,
+		.end   = S3C64XX_PA_RTC + 0xff,
+		.flags = IORESOURCE_MEM,
+	},
+	[1] = {
+		.start = IRQ_RTC_ALARM,
+		.end   = IRQ_RTC_ALARM,
+		.flags = IORESOURCE_IRQ,
+	},
+	[2] = {
+		.start = IRQ_RTC_TIC,
+		.end   = IRQ_RTC_TIC,
+		.flags = IORESOURCE_IRQ
+	}
+};
+
+struct platform_device s3c_device_rtc = {
+	.name		  = "s3c64xx-rtc",
+	.id		  = -1,
+	.num_resources	  = ARRAY_SIZE(s3c_rtc_resource),
+	.resource	  = s3c_rtc_resource,
+};
+EXPORT_SYMBOL(s3c_device_rtc);
-- 
1.6.6
