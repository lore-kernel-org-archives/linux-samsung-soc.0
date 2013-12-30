From: Tushar Behera <tushar.behera@linaro.org>
Subject: [PATCH 6/9] ARM: S5PV210: Replace inclusion of plat/regs-serial.h header file
Date: Mon, 30 Dec 2013 15:30:37 +0530
Message-ID: <1388397640-720-7-git-send-email-tushar.behera@linaro.org>
References: <1388397640-720-1-git-send-email-tushar.behera@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f51.google.com ([209.85.220.51]:44672 "EHLO
	mail-pa0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754424Ab3L3KEd (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 30 Dec 2013 05:04:33 -0500
Received: by mail-pa0-f51.google.com with SMTP id fa1so11512332pad.38
        for <linux-samsung-soc@vger.kernel.org>; Mon, 30 Dec 2013 02:04:32 -0800 (PST)
In-Reply-To: <1388397640-720-1-git-send-email-tushar.behera@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com

Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
---
 arch/arm/mach-s5pv210/common.c                   |    2 +-
 arch/arm/mach-s5pv210/include/mach/debug-macro.S |    2 +-
 arch/arm/mach-s5pv210/mach-aquila.c              |    2 +-
 arch/arm/mach-s5pv210/mach-goni.c                |    2 +-
 arch/arm/mach-s5pv210/mach-smdkc110.c            |    2 +-
 arch/arm/mach-s5pv210/mach-smdkv210.c            |    2 +-
 arch/arm/mach-s5pv210/mach-torbreck.c            |    2 +-
 7 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm/mach-s5pv210/common.c b/arch/arm/mach-s5pv210/common.c
index 26027a2..7024dcd 100644
--- a/arch/arm/mach-s5pv210/common.c
+++ b/arch/arm/mach-s5pv210/common.c
@@ -24,6 +24,7 @@
 #include <linux/sched.h>
 #include <linux/dma-mapping.h>
 #include <linux/serial_core.h>
+#include <linux/serial_s3c.h>
 
 #include <asm/proc-fns.h>
 #include <asm/mach/arch.h>
@@ -46,7 +47,6 @@
 #include <plat/pwm-core.h>
 #include <plat/tv-core.h>
 #include <plat/spi-core.h>
-#include <plat/regs-serial.h>
 
 #include "common.h"
 
diff --git a/arch/arm/mach-s5pv210/include/mach/debug-macro.S b/arch/arm/mach-s5pv210/include/mach/debug-macro.S
index 80c2199..30b511a 100644
--- a/arch/arm/mach-s5pv210/include/mach/debug-macro.S
+++ b/arch/arm/mach-s5pv210/include/mach/debug-macro.S
@@ -12,8 +12,8 @@
 
 /* pull in the relevant register and map files. */
 
+#include <linux/serial_s3c.h>
 #include <mach/map.h>
-#include <plat/regs-serial.h>
 
 	/* note, for the boot process to work we have to keep the UART
 	 * virtual address aligned to an 1MiB boundary for the L1
diff --git a/arch/arm/mach-s5pv210/mach-aquila.c b/arch/arm/mach-s5pv210/mach-aquila.c
index ad40ab0..cc37eda 100644
--- a/arch/arm/mach-s5pv210/mach-aquila.c
+++ b/arch/arm/mach-s5pv210/mach-aquila.c
@@ -12,6 +12,7 @@
 #include <linux/types.h>
 #include <linux/init.h>
 #include <linux/serial_core.h>
+#include <linux/serial_s3c.h>
 #include <linux/fb.h>
 #include <linux/i2c.h>
 #include <linux/i2c-gpio.h>
@@ -32,7 +33,6 @@
 #include <mach/regs-clock.h>
 
 #include <plat/gpio-cfg.h>
-#include <plat/regs-serial.h>
 #include <plat/devs.h>
 #include <plat/cpu.h>
 #include <plat/fb.h>
diff --git a/arch/arm/mach-s5pv210/mach-goni.c b/arch/arm/mach-s5pv210/mach-goni.c
index e5cd9fb..b41a38a 100644
--- a/arch/arm/mach-s5pv210/mach-goni.c
+++ b/arch/arm/mach-s5pv210/mach-goni.c
@@ -12,6 +12,7 @@
 #include <linux/types.h>
 #include <linux/init.h>
 #include <linux/serial_core.h>
+#include <linux/serial_s3c.h>
 #include <linux/fb.h>
 #include <linux/i2c.h>
 #include <linux/i2c-gpio.h>
@@ -39,7 +40,6 @@
 #include <mach/regs-clock.h>
 
 #include <plat/gpio-cfg.h>
-#include <plat/regs-serial.h>
 #include <plat/devs.h>
 #include <plat/cpu.h>
 #include <plat/fb.h>
diff --git a/arch/arm/mach-s5pv210/mach-smdkc110.c b/arch/arm/mach-s5pv210/mach-smdkc110.c
index 7c0ed07..448e1d2 100644
--- a/arch/arm/mach-s5pv210/mach-smdkc110.c
+++ b/arch/arm/mach-s5pv210/mach-smdkc110.c
@@ -12,6 +12,7 @@
 #include <linux/types.h>
 #include <linux/init.h>
 #include <linux/serial_core.h>
+#include <linux/serial_s3c.h>
 #include <linux/i2c.h>
 #include <linux/device.h>
 
@@ -23,7 +24,6 @@
 #include <mach/map.h>
 #include <mach/regs-clock.h>
 
-#include <plat/regs-serial.h>
 #include <plat/devs.h>
 #include <plat/cpu.h>
 #include <linux/platform_data/ata-samsung_cf.h>
diff --git a/arch/arm/mach-s5pv210/mach-smdkv210.c b/arch/arm/mach-s5pv210/mach-smdkv210.c
index f52cc15..2a6655f 100644
--- a/arch/arm/mach-s5pv210/mach-smdkv210.c
+++ b/arch/arm/mach-s5pv210/mach-smdkv210.c
@@ -13,6 +13,7 @@
 #include <linux/i2c.h>
 #include <linux/init.h>
 #include <linux/serial_core.h>
+#include <linux/serial_s3c.h>
 #include <linux/device.h>
 #include <linux/dm9000.h>
 #include <linux/fb.h>
@@ -32,7 +33,6 @@
 #include <mach/map.h>
 #include <mach/regs-clock.h>
 
-#include <plat/regs-serial.h>
 #include <plat/regs-srom.h>
 #include <plat/gpio-cfg.h>
 #include <plat/devs.h>
diff --git a/arch/arm/mach-s5pv210/mach-torbreck.c b/arch/arm/mach-s5pv210/mach-torbreck.c
index 579afe8..1578055 100644
--- a/arch/arm/mach-s5pv210/mach-torbreck.c
+++ b/arch/arm/mach-s5pv210/mach-torbreck.c
@@ -13,6 +13,7 @@
 #include <linux/i2c.h>
 #include <linux/init.h>
 #include <linux/serial_core.h>
+#include <linux/serial_s3c.h>
 
 #include <asm/mach/arch.h>
 #include <asm/mach/map.h>
@@ -22,7 +23,6 @@
 #include <mach/map.h>
 #include <mach/regs-clock.h>
 
-#include <plat/regs-serial.h>
 #include <plat/devs.h>
 #include <plat/cpu.h>
 #include <linux/platform_data/i2c-s3c2410.h>
-- 
1.7.9.5
