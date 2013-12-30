From: Tushar Behera <tushar.behera@linaro.org>
Subject: [PATCH 8/9] ARM: SAMSUNG: Replace inclusion of plat/regs-serial.h header file
Date: Mon, 30 Dec 2013 15:30:39 +0530
Message-ID: <1388397640-720-9-git-send-email-tushar.behera@linaro.org>
References: <1388397640-720-1-git-send-email-tushar.behera@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f46.google.com ([209.85.220.46]:41949 "EHLO
	mail-pa0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754424Ab3L3KEj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 30 Dec 2013 05:04:39 -0500
Received: by mail-pa0-f46.google.com with SMTP id kp14so9543398pab.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 30 Dec 2013 02:04:39 -0800 (PST)
In-Reply-To: <1388397640-720-1-git-send-email-tushar.behera@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com

Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
---
 arch/arm/plat-samsung/clock.c                   |    2 +-
 arch/arm/plat-samsung/devs.c                    |    2 +-
 arch/arm/plat-samsung/include/plat/uncompress.h |    2 +-
 arch/arm/plat-samsung/init.c                    |    3 +--
 arch/arm/plat-samsung/pm.c                      |    3 +--
 5 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/arch/arm/plat-samsung/clock.c b/arch/arm/plat-samsung/clock.c
index 47c9fad..ddfebdd 100644
--- a/arch/arm/plat-samsung/clock.c
+++ b/arch/arm/plat-samsung/clock.c
@@ -52,7 +52,7 @@
 #include <plat/cpu.h>
 
 #include <linux/serial_core.h>
-#include <plat/regs-serial.h> /* for s3c24xx_uart_devs */
+#include <linux/serial_s3c.h> /* for s3c24xx_uart_devs */
 
 /* clock information */
 
diff --git a/arch/arm/plat-samsung/devs.c b/arch/arm/plat-samsung/devs.c
index ac07e87..005f333 100644
--- a/arch/arm/plat-samsung/devs.c
+++ b/arch/arm/plat-samsung/devs.c
@@ -18,6 +18,7 @@
 #include <linux/timer.h>
 #include <linux/init.h>
 #include <linux/serial_core.h>
+#include <linux/serial_s3c.h>
 #include <linux/platform_device.h>
 #include <linux/io.h>
 #include <linux/slab.h>
@@ -64,7 +65,6 @@
 #include <linux/platform_data/usb-s3c2410_udc.h>
 #include <linux/platform_data/usb-ohci-s3c2410.h>
 #include <plat/usb-phy.h>
-#include <plat/regs-serial.h>
 #include <plat/regs-spi.h>
 #include <linux/platform_data/spi-s3c64xx.h>
 
diff --git a/arch/arm/plat-samsung/include/plat/uncompress.h b/arch/arm/plat-samsung/include/plat/uncompress.h
index f48dc0a..61054fd 100644
--- a/arch/arm/plat-samsung/include/plat/uncompress.h
+++ b/arch/arm/plat-samsung/include/plat/uncompress.h
@@ -29,7 +29,7 @@ static void arch_detect_cpu(void);
 
 /* defines for UART registers */
 
-#include <plat/regs-serial.h>
+#include <linux/serial_s3c.h>
 
 /* working in physical space... */
 #define S3C_WDOGREG(x)	((S3C_PA_WDT + (x)))
diff --git a/arch/arm/plat-samsung/init.c b/arch/arm/plat-samsung/init.c
index aa9511b..0ffc84a 100644
--- a/arch/arm/plat-samsung/init.c
+++ b/arch/arm/plat-samsung/init.c
@@ -21,6 +21,7 @@
 #include <linux/interrupt.h>
 #include <linux/ioport.h>
 #include <linux/serial_core.h>
+#include <linux/serial_s3c.h>
 #include <linux/platform_device.h>
 #include <linux/of.h>
 
@@ -33,8 +34,6 @@
 #include <plat/devs.h>
 #include <plat/clock.h>
 
-#include <plat/regs-serial.h>
-
 static struct cpu_table *cpu;
 
 static struct cpu_table * __init s3c_lookup_cpu(unsigned long idcode,
diff --git a/arch/arm/plat-samsung/pm.c b/arch/arm/plat-samsung/pm.c
index e5b0f2c..ae9baa2 100644
--- a/arch/arm/plat-samsung/pm.c
+++ b/arch/arm/plat-samsung/pm.c
@@ -18,13 +18,12 @@
 #include <linux/delay.h>
 #include <linux/of.h>
 #include <linux/serial_core.h>
+#include <linux/serial_s3c.h>
 #include <linux/io.h>
 
 #include <asm/cacheflush.h>
 #include <asm/suspend.h>
 
-#include <plat/regs-serial.h>
-
 #ifdef CONFIG_SAMSUNG_ATAGS
 #include <mach/hardware.h>
 #include <mach/map.h>
-- 
1.7.9.5
