From: Tushar Behera <tushar.behera@linaro.org>
Subject: [PATCH 5/9] ARM: S5PC100: Replace inclusion of plat/regs-serial.h header file
Date: Mon, 30 Dec 2013 15:30:36 +0530
Message-ID: <1388397640-720-6-git-send-email-tushar.behera@linaro.org>
References: <1388397640-720-1-git-send-email-tushar.behera@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f181.google.com ([209.85.192.181]:48027 "EHLO
	mail-pd0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754424Ab3L3KEa (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 30 Dec 2013 05:04:30 -0500
Received: by mail-pd0-f181.google.com with SMTP id p10so11127861pdj.40
        for <linux-samsung-soc@vger.kernel.org>; Mon, 30 Dec 2013 02:04:30 -0800 (PST)
In-Reply-To: <1388397640-720-1-git-send-email-tushar.behera@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com

Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
---
 arch/arm/mach-s5pc100/common.c                   |    2 +-
 arch/arm/mach-s5pc100/include/mach/debug-macro.S |    2 +-
 arch/arm/mach-s5pc100/mach-smdkc100.c            |    2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/mach-s5pc100/common.c b/arch/arm/mach-s5pc100/common.c
index c5a8eea..6a41bf7 100644
--- a/arch/arm/mach-s5pc100/common.c
+++ b/arch/arm/mach-s5pc100/common.c
@@ -22,6 +22,7 @@
 #include <linux/io.h>
 #include <linux/device.h>
 #include <linux/serial_core.h>
+#include <linux/serial_s3c.h>
 #include <clocksource/samsung_pwm.h>
 #include <linux/platform_device.h>
 #include <linux/sched.h>
@@ -49,7 +50,6 @@
 #include <plat/onenand-core.h>
 #include <plat/pwm-core.h>
 #include <plat/spi-core.h>
-#include <plat/regs-serial.h>
 #include <plat/watchdog-reset.h>
 
 #include "common.h"
diff --git a/arch/arm/mach-s5pc100/include/mach/debug-macro.S b/arch/arm/mach-s5pc100/include/mach/debug-macro.S
index 66cb7f1..22c2385 100644
--- a/arch/arm/mach-s5pc100/include/mach/debug-macro.S
+++ b/arch/arm/mach-s5pc100/include/mach/debug-macro.S
@@ -13,8 +13,8 @@
 
 /* pull in the relevant register and map files. */
 
+#include <linux/serial_s3c.h>
 #include <mach/map.h>
-#include <plat/regs-serial.h>
 
 	/* note, for the boot process to work we have to keep the UART
 	 * virtual address aligned to an 1MiB boundary for the L1
diff --git a/arch/arm/mach-s5pc100/mach-smdkc100.c b/arch/arm/mach-s5pc100/mach-smdkc100.c
index 9e256b9..668af3a 100644
--- a/arch/arm/mach-s5pc100/mach-smdkc100.c
+++ b/arch/arm/mach-s5pc100/mach-smdkc100.c
@@ -16,6 +16,7 @@
 #include <linux/timer.h>
 #include <linux/init.h>
 #include <linux/serial_core.h>
+#include <linux/serial_s3c.h>
 #include <linux/platform_device.h>
 #include <linux/io.h>
 #include <linux/gpio.h>
@@ -37,7 +38,6 @@
 #include <asm/irq.h>
 #include <asm/mach-types.h>
 
-#include <plat/regs-serial.h>
 #include <plat/gpio-cfg.h>
 
 #include <plat/clock.h>
-- 
1.7.9.5
