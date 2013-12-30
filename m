From: Tushar Behera <tushar.behera@linaro.org>
Subject: [PATCH 4/9] ARM: S5P64X0: Replace inclusion of plat/regs-serial.h header file
Date: Mon, 30 Dec 2013 15:30:35 +0530
Message-ID: <1388397640-720-5-git-send-email-tushar.behera@linaro.org>
References: <1388397640-720-1-git-send-email-tushar.behera@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f44.google.com ([209.85.220.44]:39503 "EHLO
	mail-pa0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754424Ab3L3KE2 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 30 Dec 2013 05:04:28 -0500
Received: by mail-pa0-f44.google.com with SMTP id fa1so11462462pad.17
        for <linux-samsung-soc@vger.kernel.org>; Mon, 30 Dec 2013 02:04:28 -0800 (PST)
In-Reply-To: <1388397640-720-1-git-send-email-tushar.behera@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com

Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
---
 arch/arm/mach-s5p64x0/common.c                   |    2 +-
 arch/arm/mach-s5p64x0/include/mach/debug-macro.S |    3 +--
 arch/arm/mach-s5p64x0/irq-pm.c                   |    2 +-
 arch/arm/mach-s5p64x0/mach-smdk6440.c            |    2 +-
 arch/arm/mach-s5p64x0/mach-smdk6450.c            |    2 +-
 5 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/arch/arm/mach-s5p64x0/common.c b/arch/arm/mach-s5p64x0/common.c
index 42e14f2..eb2ad14 100644
--- a/arch/arm/mach-s5p64x0/common.c
+++ b/arch/arm/mach-s5p64x0/common.c
@@ -19,6 +19,7 @@
 #include <linux/io.h>
 #include <linux/device.h>
 #include <linux/serial_core.h>
+#include <linux/serial_s3c.h>
 #include <clocksource/samsung_pwm.h>
 #include <linux/platform_device.h>
 #include <linux/sched.h>
@@ -50,7 +51,6 @@
 #include <plat/gpio-cfg.h>
 #include <plat/pwm-core.h>
 #include <plat/regs-irqtype.h>
-#include <plat/regs-serial.h>
 #include <plat/watchdog-reset.h>
 
 #include "common.h"
diff --git a/arch/arm/mach-s5p64x0/include/mach/debug-macro.S b/arch/arm/mach-s5p64x0/include/mach/debug-macro.S
index 5e2916f..8759e78 100644
--- a/arch/arm/mach-s5p64x0/include/mach/debug-macro.S
+++ b/arch/arm/mach-s5p64x0/include/mach/debug-macro.S
@@ -10,11 +10,10 @@
 
 /* pull in the relevant register and map files. */
 
+#include <linux/serial_s3c.h>
 #include <plat/map-base.h>
 #include <plat/map-s5p.h>
 
-#include <plat/regs-serial.h>
-
 	.macro addruart, rp, rv, tmp
 		mov	\rp, #0xE0000000
 		orr	\rp, \rp, #0x00100000
diff --git a/arch/arm/mach-s5p64x0/irq-pm.c b/arch/arm/mach-s5p64x0/irq-pm.c
index 3e6f245..1c83d28 100644
--- a/arch/arm/mach-s5p64x0/irq-pm.c
+++ b/arch/arm/mach-s5p64x0/irq-pm.c
@@ -14,9 +14,9 @@
 
 #include <linux/syscore_ops.h>
 #include <linux/serial_core.h>
+#include <linux/serial_s3c.h>
 #include <linux/io.h>
 
-#include <plat/regs-serial.h>
 #include <plat/pm.h>
 
 #include <mach/regs-gpio.h>
diff --git a/arch/arm/mach-s5p64x0/mach-smdk6440.c b/arch/arm/mach-s5p64x0/mach-smdk6440.c
index 9efdcc0..6840e19 100644
--- a/arch/arm/mach-s5p64x0/mach-smdk6440.c
+++ b/arch/arm/mach-s5p64x0/mach-smdk6440.c
@@ -17,6 +17,7 @@
 #include <linux/init.h>
 #include <linux/i2c.h>
 #include <linux/serial_core.h>
+#include <linux/serial_s3c.h>
 #include <linux/platform_device.h>
 #include <linux/io.h>
 #include <linux/module.h>
@@ -39,7 +40,6 @@
 #include <mach/regs-clock.h>
 #include <mach/regs-gpio.h>
 
-#include <plat/regs-serial.h>
 #include <plat/gpio-cfg.h>
 #include <plat/clock.h>
 #include <plat/devs.h>
diff --git a/arch/arm/mach-s5p64x0/mach-smdk6450.c b/arch/arm/mach-s5p64x0/mach-smdk6450.c
index c3cacc0..fa1341c 100644
--- a/arch/arm/mach-s5p64x0/mach-smdk6450.c
+++ b/arch/arm/mach-s5p64x0/mach-smdk6450.c
@@ -17,6 +17,7 @@
 #include <linux/init.h>
 #include <linux/i2c.h>
 #include <linux/serial_core.h>
+#include <linux/serial_s3c.h>
 #include <linux/platform_device.h>
 #include <linux/io.h>
 #include <linux/module.h>
@@ -39,7 +40,6 @@
 #include <mach/regs-clock.h>
 #include <mach/regs-gpio.h>
 
-#include <plat/regs-serial.h>
 #include <plat/gpio-cfg.h>
 #include <plat/clock.h>
 #include <plat/devs.h>
-- 
1.7.9.5
