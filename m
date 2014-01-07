From: Tushar Behera <tushar.behera@linaro.org>
Subject: [PATCH V2 2/3] ARM: SAMSUNG: Replace inclusion of plat/regs-serial.h header file
Date: Tue,  7 Jan 2014 11:23:16 +0530
Message-ID: <1389073997-30763-3-git-send-email-tushar.behera@linaro.org>
References: <1388397640-720-1-git-send-email-tushar.behera@linaro.org>
 <1389073997-30763-1-git-send-email-tushar.behera@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f51.google.com ([209.85.160.51]:64815 "EHLO
	mail-pb0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750854AbaAGF5U (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 7 Jan 2014 00:57:20 -0500
Received: by mail-pb0-f51.google.com with SMTP id up15so19514140pbc.38
        for <linux-samsung-soc@vger.kernel.org>; Mon, 06 Jan 2014 21:57:19 -0800 (PST)
In-Reply-To: <1389073997-30763-1-git-send-email-tushar.behera@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, broonie@linaro.org

regs-serial.h only includes linux/serial_s3c.h. Include this header
directly to remove unnecessary platform dependency.

Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
[broonie@linaro.org: Acked for S3C64XX related changes]
Acked-by: Mark Brown <broonie@linaro.org>
---
Changelog for v2:
* Squashed all the platform specific changes to a single patch.

 arch/arm/mach-exynos/common.c                    |    2 +-
 arch/arm/mach-s3c24xx/clock-s3c2410.c            |    3 +--
 arch/arm/mach-s3c24xx/clock-s3c2412.c            |    3 +--
 arch/arm/mach-s3c24xx/clock-s3c2440.c            |    2 +-
 arch/arm/mach-s3c24xx/common.c                   |    2 +-
 arch/arm/mach-s3c24xx/dma-s3c2410.c              |    2 +-
 arch/arm/mach-s3c24xx/dma-s3c2412.c              |    2 +-
 arch/arm/mach-s3c24xx/dma-s3c2440.c              |    2 +-
 arch/arm/mach-s3c24xx/dma-s3c2443.c              |    2 +-
 arch/arm/mach-s3c24xx/include/mach/debug-macro.S |    2 +-
 arch/arm/mach-s3c24xx/mach-amlm5900.c            |    2 +-
 arch/arm/mach-s3c24xx/mach-anubis.c              |    2 +-
 arch/arm/mach-s3c24xx/mach-at2440evb.c           |    2 +-
 arch/arm/mach-s3c24xx/mach-bast.c                |    2 +-
 arch/arm/mach-s3c24xx/mach-gta02.c               |    2 +-
 arch/arm/mach-s3c24xx/mach-h1940.c               |    2 +-
 arch/arm/mach-s3c24xx/mach-jive.c                |    2 +-
 arch/arm/mach-s3c24xx/mach-mini2440.c            |    2 +-
 arch/arm/mach-s3c24xx/mach-n30.c                 |    2 +-
 arch/arm/mach-s3c24xx/mach-nexcoder.c            |    2 +-
 arch/arm/mach-s3c24xx/mach-osiris.c              |    2 +-
 arch/arm/mach-s3c24xx/mach-otom.c                |    2 +-
 arch/arm/mach-s3c24xx/mach-qt2410.c              |    2 +-
 arch/arm/mach-s3c24xx/mach-rx1950.c              |    2 +-
 arch/arm/mach-s3c24xx/mach-rx3715.c              |    2 +-
 arch/arm/mach-s3c24xx/mach-s3c2416-dt.c          |    2 +-
 arch/arm/mach-s3c24xx/mach-smdk2410.c            |    2 +-
 arch/arm/mach-s3c24xx/mach-smdk2413.c            |    2 +-
 arch/arm/mach-s3c24xx/mach-smdk2416.c            |    2 +-
 arch/arm/mach-s3c24xx/mach-smdk2440.c            |    2 +-
 arch/arm/mach-s3c24xx/mach-smdk2443.c            |    2 +-
 arch/arm/mach-s3c24xx/mach-tct_hammer.c          |    2 +-
 arch/arm/mach-s3c24xx/mach-vr1000.c              |    2 +-
 arch/arm/mach-s3c24xx/mach-vstms.c               |    2 +-
 arch/arm/mach-s3c24xx/pm.c                       |    2 +-
 arch/arm/mach-s3c24xx/s3c2410.c                  |    2 +-
 arch/arm/mach-s3c24xx/s3c2412.c                  |    2 +-
 arch/arm/mach-s3c24xx/s3c244x.c                  |    2 +-
 arch/arm/mach-s3c24xx/sleep-s3c2410.S            |    2 +-
 arch/arm/mach-s3c24xx/sleep.S                    |    2 +-
 arch/arm/mach-s3c64xx/common.c                   |    2 +-
 arch/arm/mach-s3c64xx/include/mach/debug-macro.S |    2 +-
 arch/arm/mach-s3c64xx/irq-pm.c                   |    2 +-
 arch/arm/mach-s3c64xx/mach-anw6410.c             |    2 +-
 arch/arm/mach-s3c64xx/mach-crag6410.c            |    2 +-
 arch/arm/mach-s3c64xx/mach-hmt.c                 |    2 +-
 arch/arm/mach-s3c64xx/mach-mini6410.c            |    2 +-
 arch/arm/mach-s3c64xx/mach-ncp.c                 |    2 +-
 arch/arm/mach-s3c64xx/mach-real6410.c            |    2 +-
 arch/arm/mach-s3c64xx/mach-smartq.c              |    2 +-
 arch/arm/mach-s3c64xx/mach-smdk6400.c            |    3 +--
 arch/arm/mach-s3c64xx/mach-smdk6410.c            |    2 +-
 arch/arm/mach-s3c64xx/s3c6400.c                  |    2 +-
 arch/arm/mach-s3c64xx/s3c6410.c                  |    2 +-
 arch/arm/mach-s5p64x0/common.c                   |    2 +-
 arch/arm/mach-s5p64x0/include/mach/debug-macro.S |    3 +--
 arch/arm/mach-s5p64x0/irq-pm.c                   |    2 +-
 arch/arm/mach-s5p64x0/mach-smdk6440.c            |    2 +-
 arch/arm/mach-s5p64x0/mach-smdk6450.c            |    2 +-
 arch/arm/mach-s5pc100/common.c                   |    2 +-
 arch/arm/mach-s5pc100/include/mach/debug-macro.S |    2 +-
 arch/arm/mach-s5pc100/mach-smdkc100.c            |    2 +-
 arch/arm/mach-s5pv210/common.c                   |    2 +-
 arch/arm/mach-s5pv210/include/mach/debug-macro.S |    2 +-
 arch/arm/mach-s5pv210/mach-aquila.c              |    2 +-
 arch/arm/mach-s5pv210/mach-goni.c                |    2 +-
 arch/arm/mach-s5pv210/mach-smdkc110.c            |    2 +-
 arch/arm/mach-s5pv210/mach-smdkv210.c            |    2 +-
 arch/arm/mach-s5pv210/mach-torbreck.c            |    2 +-
 arch/arm/plat-samsung/clock.c                    |    2 +-
 arch/arm/plat-samsung/devs.c                     |    2 +-
 arch/arm/plat-samsung/include/plat/uncompress.h  |    2 +-
 arch/arm/plat-samsung/init.c                     |    3 +--
 arch/arm/plat-samsung/pm.c                       |    3 +--
 74 files changed, 74 insertions(+), 80 deletions(-)

diff --git a/arch/arm/mach-exynos/common.c b/arch/arm/mach-exynos/common.c
index 72ae5d3..4ddc756 100644
--- a/arch/arm/mach-exynos/common.c
+++ b/arch/arm/mach-exynos/common.c
@@ -20,6 +20,7 @@
 #include <clocksource/samsung_pwm.h>
 #include <linux/sched.h>
 #include <linux/serial_core.h>
+#include <linux/serial_s3c.h>
 #include <linux/of.h>
 #include <linux/of_fdt.h>
 #include <linux/of_irq.h>
@@ -40,7 +41,6 @@
 
 #include <plat/cpu.h>
 #include <plat/pm.h>
-#include <plat/regs-serial.h>
 
 #include "common.h"
 #include "regs-pmu.h"
diff --git a/arch/arm/mach-s3c24xx/clock-s3c2410.c b/arch/arm/mach-s3c24xx/clock-s3c2410.c
index d39d3c7..d1afcf9 100644
--- a/arch/arm/mach-s3c24xx/clock-s3c2410.c
+++ b/arch/arm/mach-s3c24xx/clock-s3c2410.c
@@ -30,13 +30,12 @@
 #include <linux/mutex.h>
 #include <linux/delay.h>
 #include <linux/serial_core.h>
+#include <linux/serial_s3c.h>
 #include <linux/io.h>
 
 #include <asm/mach/map.h>
 
 #include <mach/hardware.h>
-
-#include <plat/regs-serial.h>
 #include <mach/regs-clock.h>
 #include <mach/regs-gpio.h>
 
diff --git a/arch/arm/mach-s3c24xx/clock-s3c2412.c b/arch/arm/mach-s3c24xx/clock-s3c2412.c
index 11b3b28..192a5b2 100644
--- a/arch/arm/mach-s3c24xx/clock-s3c2412.c
+++ b/arch/arm/mach-s3c24xx/clock-s3c2412.c
@@ -31,13 +31,12 @@
 #include <linux/mutex.h>
 #include <linux/delay.h>
 #include <linux/serial_core.h>
+#include <linux/serial_s3c.h>
 #include <linux/io.h>
 
 #include <asm/mach/map.h>
 
 #include <mach/hardware.h>
-
-#include <plat/regs-serial.h>
 #include <mach/regs-clock.h>
 #include <mach/regs-gpio.h>
 
diff --git a/arch/arm/mach-s3c24xx/clock-s3c2440.c b/arch/arm/mach-s3c24xx/clock-s3c2440.c
index aaf006d..5527226 100644
--- a/arch/arm/mach-s3c24xx/clock-s3c2440.c
+++ b/arch/arm/mach-s3c24xx/clock-s3c2440.c
@@ -34,6 +34,7 @@
 #include <linux/clk.h>
 #include <linux/io.h>
 #include <linux/serial_core.h>
+#include <linux/serial_s3c.h>
 
 #include <mach/hardware.h>
 #include <linux/atomic.h>
@@ -43,7 +44,6 @@
 
 #include <plat/clock.h>
 #include <plat/cpu.h>
-#include <plat/regs-serial.h>
 
 /* S3C2440 extended clock support */
 
diff --git a/arch/arm/mach-s3c24xx/common.c b/arch/arm/mach-s3c24xx/common.c
index 4adaa4b..22f708e 100644
--- a/arch/arm/mach-s3c24xx/common.c
+++ b/arch/arm/mach-s3c24xx/common.c
@@ -27,6 +27,7 @@
 #include <linux/interrupt.h>
 #include <linux/ioport.h>
 #include <linux/serial_core.h>
+#include <linux/serial_s3c.h>
 #include <clocksource/samsung_pwm.h>
 #include <linux/platform_device.h>
 #include <linux/delay.h>
@@ -44,7 +45,6 @@
 #include <asm/mach/map.h>
 
 #include <mach/regs-gpio.h>
-#include <plat/regs-serial.h>
 #include <mach/dma.h>
 
 #include <plat/cpu.h>
diff --git a/arch/arm/mach-s3c24xx/dma-s3c2410.c b/arch/arm/mach-s3c24xx/dma-s3c2410.c
index 30aa53f..09aa12d 100644
--- a/arch/arm/mach-s3c24xx/dma-s3c2410.c
+++ b/arch/arm/mach-s3c24xx/dma-s3c2410.c
@@ -16,6 +16,7 @@
 #include <linux/init.h>
 #include <linux/device.h>
 #include <linux/serial_core.h>
+#include <linux/serial_s3c.h>
 
 #include <mach/map.h>
 #include <mach/dma.h>
@@ -23,7 +24,6 @@
 #include <plat/cpu.h>
 #include <plat/dma-s3c24xx.h>
 
-#include <plat/regs-serial.h>
 #include <mach/regs-gpio.h>
 #include <plat/regs-dma.h>
 #include <mach/regs-lcd.h>
diff --git a/arch/arm/mach-s3c24xx/dma-s3c2412.c b/arch/arm/mach-s3c24xx/dma-s3c2412.c
index b7e0946..0c0106d 100644
--- a/arch/arm/mach-s3c24xx/dma-s3c2412.c
+++ b/arch/arm/mach-s3c24xx/dma-s3c2412.c
@@ -16,6 +16,7 @@
 #include <linux/init.h>
 #include <linux/device.h>
 #include <linux/serial_core.h>
+#include <linux/serial_s3c.h>
 #include <linux/io.h>
 
 #include <mach/dma.h>
@@ -23,7 +24,6 @@
 #include <plat/dma-s3c24xx.h>
 #include <plat/cpu.h>
 
-#include <plat/regs-serial.h>
 #include <mach/regs-gpio.h>
 #include <plat/regs-dma.h>
 #include <mach/regs-lcd.h>
diff --git a/arch/arm/mach-s3c24xx/dma-s3c2440.c b/arch/arm/mach-s3c24xx/dma-s3c2440.c
index cd25de2..2f8e8a3 100644
--- a/arch/arm/mach-s3c24xx/dma-s3c2440.c
+++ b/arch/arm/mach-s3c24xx/dma-s3c2440.c
@@ -16,6 +16,7 @@
 #include <linux/init.h>
 #include <linux/device.h>
 #include <linux/serial_core.h>
+#include <linux/serial_s3c.h>
 
 #include <mach/map.h>
 #include <mach/dma.h>
@@ -23,7 +24,6 @@
 #include <plat/dma-s3c24xx.h>
 #include <plat/cpu.h>
 
-#include <plat/regs-serial.h>
 #include <mach/regs-gpio.h>
 #include <plat/regs-dma.h>
 #include <mach/regs-lcd.h>
diff --git a/arch/arm/mach-s3c24xx/dma-s3c2443.c b/arch/arm/mach-s3c24xx/dma-s3c2443.c
index 95b9f75..f4096ec 100644
--- a/arch/arm/mach-s3c24xx/dma-s3c2443.c
+++ b/arch/arm/mach-s3c24xx/dma-s3c2443.c
@@ -16,6 +16,7 @@
 #include <linux/init.h>
 #include <linux/device.h>
 #include <linux/serial_core.h>
+#include <linux/serial_s3c.h>
 #include <linux/io.h>
 
 #include <mach/dma.h>
@@ -23,7 +24,6 @@
 #include <plat/dma-s3c24xx.h>
 #include <plat/cpu.h>
 
-#include <plat/regs-serial.h>
 #include <mach/regs-gpio.h>
 #include <plat/regs-dma.h>
 #include <mach/regs-lcd.h>
diff --git a/arch/arm/mach-s3c24xx/include/mach/debug-macro.S b/arch/arm/mach-s3c24xx/include/mach/debug-macro.S
index 2558952..2f39737 100644
--- a/arch/arm/mach-s3c24xx/include/mach/debug-macro.S
+++ b/arch/arm/mach-s3c24xx/include/mach/debug-macro.S
@@ -14,7 +14,7 @@
 
 #include <mach/map.h>
 #include <mach/regs-gpio.h>
-#include <plat/regs-serial.h>
+#include <linux/serial_s3c.h>
 
 #define S3C2410_UART1_OFF (0x4000)
 #define SHIFT_2440TXF (14-9)
diff --git a/arch/arm/mach-s3c24xx/mach-amlm5900.c b/arch/arm/mach-s3c24xx/mach-amlm5900.c
index e27b5c9..514613b 100644
--- a/arch/arm/mach-s3c24xx/mach-amlm5900.c
+++ b/arch/arm/mach-s3c24xx/mach-amlm5900.c
@@ -37,6 +37,7 @@
 #include <linux/platform_device.h>
 #include <linux/proc_fs.h>
 #include <linux/serial_core.h>
+#include <linux/serial_s3c.h>
 #include <linux/io.h>
 
 #include <asm/mach/arch.h>
@@ -49,7 +50,6 @@
 #include <asm/mach-types.h>
 #include <mach/fb.h>
 
-#include <plat/regs-serial.h>
 #include <mach/regs-lcd.h>
 #include <mach/regs-gpio.h>
 
diff --git a/arch/arm/mach-s3c24xx/mach-anubis.c b/arch/arm/mach-s3c24xx/mach-anubis.c
index c1fb6c3..31362da 100644
--- a/arch/arm/mach-s3c24xx/mach-anubis.c
+++ b/arch/arm/mach-s3c24xx/mach-anubis.c
@@ -17,6 +17,7 @@
 #include <linux/init.h>
 #include <linux/gpio.h>
 #include <linux/serial_core.h>
+#include <linux/serial_s3c.h>
 #include <linux/platform_device.h>
 #include <linux/ata_platform.h>
 #include <linux/i2c.h>
@@ -32,7 +33,6 @@
 #include <asm/irq.h>
 #include <asm/mach-types.h>
 
-#include <plat/regs-serial.h>
 #include <mach/regs-gpio.h>
 #include <mach/regs-lcd.h>
 #include <linux/platform_data/mtd-nand-s3c2410.h>
diff --git a/arch/arm/mach-s3c24xx/mach-at2440evb.c b/arch/arm/mach-s3c24xx/mach-at2440evb.c
index 6dfeeb7..5e56695 100644
--- a/arch/arm/mach-s3c24xx/mach-at2440evb.c
+++ b/arch/arm/mach-s3c24xx/mach-at2440evb.c
@@ -21,6 +21,7 @@
 #include <linux/init.h>
 #include <linux/io.h>
 #include <linux/serial_core.h>
+#include <linux/serial_s3c.h>
 #include <linux/dm9000.h>
 #include <linux/platform_device.h>
 
@@ -33,7 +34,6 @@
 #include <asm/irq.h>
 #include <asm/mach-types.h>
 
-#include <plat/regs-serial.h>
 #include <mach/regs-gpio.h>
 #include <mach/regs-lcd.h>
 #include <linux/platform_data/mtd-nand-s3c2410.h>
diff --git a/arch/arm/mach-s3c24xx/mach-bast.c b/arch/arm/mach-s3c24xx/mach-bast.c
index 22d6ae9..b51ea93 100644
--- a/arch/arm/mach-s3c24xx/mach-bast.c
+++ b/arch/arm/mach-s3c24xx/mach-bast.c
@@ -19,6 +19,7 @@
 #include <linux/gpio.h>
 #include <linux/syscore_ops.h>
 #include <linux/serial_core.h>
+#include <linux/serial_s3c.h>
 #include <linux/platform_device.h>
 #include <linux/dm9000.h>
 #include <linux/ata_platform.h>
@@ -54,7 +55,6 @@
 #include <plat/cpu-freq.h>
 #include <plat/devs.h>
 #include <plat/gpio-cfg.h>
-#include <plat/regs-serial.h>
 #include <plat/samsung-time.h>
 
 #include "bast.h"
diff --git a/arch/arm/mach-s3c24xx/mach-gta02.c b/arch/arm/mach-s3c24xx/mach-gta02.c
index 13d8d07..8b46355 100644
--- a/arch/arm/mach-s3c24xx/mach-gta02.c
+++ b/arch/arm/mach-s3c24xx/mach-gta02.c
@@ -35,6 +35,7 @@
 #include <linux/workqueue.h>
 #include <linux/platform_device.h>
 #include <linux/serial_core.h>
+#include <linux/serial_s3c.h>
 #include <linux/input.h>
 #include <linux/io.h>
 #include <linux/i2c.h>
@@ -80,7 +81,6 @@
 #include <plat/devs.h>
 #include <plat/gpio-cfg.h>
 #include <plat/pm.h>
-#include <plat/regs-serial.h>
 #include <plat/samsung-time.h>
 
 #include "common.h"
diff --git a/arch/arm/mach-s3c24xx/mach-h1940.c b/arch/arm/mach-s3c24xx/mach-h1940.c
index 952b6a0..a578e01 100644
--- a/arch/arm/mach-s3c24xx/mach-h1940.c
+++ b/arch/arm/mach-s3c24xx/mach-h1940.c
@@ -19,6 +19,7 @@
 #include <linux/init.h>
 #include <linux/device.h>
 #include <linux/serial_core.h>
+#include <linux/serial_s3c.h>
 #include <linux/platform_device.h>
 #include <linux/io.h>
 #include <linux/gpio.h>
@@ -61,7 +62,6 @@
 #include <plat/gpio-cfg.h>
 #include <plat/pll.h>
 #include <plat/pm.h>
-#include <plat/regs-serial.h>
 #include <plat/samsung-time.h>
 
 #include "common.h"
diff --git a/arch/arm/mach-s3c24xx/mach-jive.c b/arch/arm/mach-s3c24xx/mach-jive.c
index 43c23e2..2df0b5e 100644
--- a/arch/arm/mach-s3c24xx/mach-jive.c
+++ b/arch/arm/mach-s3c24xx/mach-jive.c
@@ -19,6 +19,7 @@
 #include <linux/gpio.h>
 #include <linux/syscore_ops.h>
 #include <linux/serial_core.h>
+#include <linux/serial_s3c.h>
 #include <linux/platform_device.h>
 #include <linux/i2c.h>
 
@@ -31,7 +32,6 @@
 #include <asm/mach/map.h>
 #include <asm/mach/irq.h>
 
-#include <plat/regs-serial.h>
 #include <linux/platform_data/mtd-nand-s3c2410.h>
 #include <linux/platform_data/i2c-s3c2410.h>
 
diff --git a/arch/arm/mach-s3c24xx/mach-mini2440.c b/arch/arm/mach-s3c24xx/mach-mini2440.c
index 4a18d49..b508724 100644
--- a/arch/arm/mach-s3c24xx/mach-mini2440.c
+++ b/arch/arm/mach-s3c24xx/mach-mini2440.c
@@ -23,6 +23,7 @@
 #include <linux/input.h>
 #include <linux/io.h>
 #include <linux/serial_core.h>
+#include <linux/serial_s3c.h>
 #include <linux/dm9000.h>
 #include <linux/platform_data/at24.h>
 #include <linux/platform_device.h>
@@ -37,7 +38,6 @@
 #include <mach/fb.h>
 #include <asm/mach-types.h>
 
-#include <plat/regs-serial.h>
 #include <mach/regs-gpio.h>
 #include <linux/platform_data/leds-s3c24xx.h>
 #include <mach/regs-lcd.h>
diff --git a/arch/arm/mach-s3c24xx/mach-n30.c b/arch/arm/mach-s3c24xx/mach-n30.c
index 2cb46c3..cc8b82fc 100644
--- a/arch/arm/mach-s3c24xx/mach-n30.c
+++ b/arch/arm/mach-s3c24xx/mach-n30.c
@@ -24,6 +24,7 @@
 #include <linux/interrupt.h>
 #include <linux/platform_device.h>
 #include <linux/serial_core.h>
+#include <linux/serial_s3c.h>
 #include <linux/timer.h>
 #include <linux/io.h>
 #include <linux/mmc/host.h>
@@ -42,7 +43,6 @@
 #include <asm/mach/map.h>
 
 #include <linux/platform_data/i2c-s3c2410.h>
-#include <plat/regs-serial.h>
 
 #include <plat/clock.h>
 #include <plat/cpu.h>
diff --git a/arch/arm/mach-s3c24xx/mach-nexcoder.c b/arch/arm/mach-s3c24xx/mach-nexcoder.c
index 01f4354..d6c13b4 100644
--- a/arch/arm/mach-s3c24xx/mach-nexcoder.c
+++ b/arch/arm/mach-s3c24xx/mach-nexcoder.c
@@ -21,6 +21,7 @@
 #include <linux/gpio.h>
 #include <linux/string.h>
 #include <linux/serial_core.h>
+#include <linux/serial_s3c.h>
 #include <linux/platform_device.h>
 #include <linux/io.h>
 
@@ -37,7 +38,6 @@
 
 //#include <asm/debug-ll.h>
 #include <mach/regs-gpio.h>
-#include <plat/regs-serial.h>
 #include <linux/platform_data/i2c-s3c2410.h>
 
 #include <plat/gpio-cfg.h>
diff --git a/arch/arm/mach-s3c24xx/mach-osiris.c b/arch/arm/mach-s3c24xx/mach-osiris.c
index 58d6fbe..d77c295 100644
--- a/arch/arm/mach-s3c24xx/mach-osiris.c
+++ b/arch/arm/mach-s3c24xx/mach-osiris.c
@@ -18,6 +18,7 @@
 #include <linux/device.h>
 #include <linux/syscore_ops.h>
 #include <linux/serial_core.h>
+#include <linux/serial_s3c.h>
 #include <linux/clk.h>
 #include <linux/i2c.h>
 #include <linux/io.h>
@@ -44,7 +45,6 @@
 #include <plat/cpu-freq.h>
 #include <plat/devs.h>
 #include <plat/gpio-cfg.h>
-#include <plat/regs-serial.h>
 #include <plat/samsung-time.h>
 
 #include <mach/hardware.h>
diff --git a/arch/arm/mach-s3c24xx/mach-otom.c b/arch/arm/mach-s3c24xx/mach-otom.c
index 7e16b07..bdb3faa 100644
--- a/arch/arm/mach-s3c24xx/mach-otom.c
+++ b/arch/arm/mach-s3c24xx/mach-otom.c
@@ -15,6 +15,7 @@
 #include <linux/timer.h>
 #include <linux/init.h>
 #include <linux/serial_core.h>
+#include <linux/serial_s3c.h>
 #include <linux/platform_device.h>
 #include <linux/io.h>
 
@@ -32,7 +33,6 @@
 #include <plat/clock.h>
 #include <plat/cpu.h>
 #include <plat/devs.h>
-#include <plat/regs-serial.h>
 #include <plat/samsung-time.h>
 
 #include "common.h"
diff --git a/arch/arm/mach-s3c24xx/mach-qt2410.c b/arch/arm/mach-s3c24xx/mach-qt2410.c
index f8feaea..08b7b7b 100644
--- a/arch/arm/mach-s3c24xx/mach-qt2410.c
+++ b/arch/arm/mach-s3c24xx/mach-qt2410.c
@@ -31,6 +31,7 @@
 #include <linux/device.h>
 #include <linux/platform_device.h>
 #include <linux/serial_core.h>
+#include <linux/serial_s3c.h>
 #include <linux/spi/spi.h>
 #include <linux/spi/spi_gpio.h>
 #include <linux/io.h>
@@ -49,7 +50,6 @@
 
 #include <linux/platform_data/leds-s3c24xx.h>
 #include <mach/regs-lcd.h>
-#include <plat/regs-serial.h>
 #include <mach/fb.h>
 #include <linux/platform_data/mtd-nand-s3c2410.h>
 #include <linux/platform_data/usb-s3c2410_udc.h>
diff --git a/arch/arm/mach-s3c24xx/mach-rx1950.c b/arch/arm/mach-s3c24xx/mach-rx1950.c
index 034b7fe..28bcca5 100644
--- a/arch/arm/mach-s3c24xx/mach-rx1950.c
+++ b/arch/arm/mach-s3c24xx/mach-rx1950.c
@@ -21,6 +21,7 @@
 #include <linux/gpio.h>
 #include <linux/platform_device.h>
 #include <linux/serial_core.h>
+#include <linux/serial_s3c.h>
 #include <linux/input.h>
 #include <linux/gpio_keys.h>
 #include <linux/device.h>
@@ -56,7 +57,6 @@
 #include <plat/cpu.h>
 #include <plat/devs.h>
 #include <plat/pm.h>
-#include <plat/regs-serial.h>
 #include <plat/samsung-time.h>
 
 #include "common.h"
diff --git a/arch/arm/mach-s3c24xx/mach-rx3715.c b/arch/arm/mach-s3c24xx/mach-rx3715.c
index 3bc6231..490409e 100644
--- a/arch/arm/mach-s3c24xx/mach-rx3715.c
+++ b/arch/arm/mach-s3c24xx/mach-rx3715.c
@@ -23,6 +23,7 @@
 #include <linux/device.h>
 #include <linux/platform_device.h>
 #include <linux/serial_core.h>
+#include <linux/serial_s3c.h>
 #include <linux/serial.h>
 #include <linux/io.h>
 #include <linux/mtd/mtd.h>
@@ -48,7 +49,6 @@
 #include <plat/cpu.h>
 #include <plat/devs.h>
 #include <plat/pm.h>
-#include <plat/regs-serial.h>
 #include <plat/samsung-time.h>
 
 #include "common.h"
diff --git a/arch/arm/mach-s3c24xx/mach-s3c2416-dt.c b/arch/arm/mach-s3c24xx/mach-s3c2416-dt.c
index f50454a..70f0900 100644
--- a/arch/arm/mach-s3c24xx/mach-s3c2416-dt.c
+++ b/arch/arm/mach-s3c24xx/mach-s3c2416-dt.c
@@ -19,13 +19,13 @@
 #include <linux/irqchip.h>
 #include <linux/of_platform.h>
 #include <linux/serial_core.h>
+#include <linux/serial_s3c.h>
 
 #include <asm/mach/arch.h>
 #include <mach/map.h>
 
 #include <plat/cpu.h>
 #include <plat/pm.h>
-#include <plat/regs-serial.h>
 
 #include "common.h"
 
diff --git a/arch/arm/mach-s3c24xx/mach-smdk2410.c b/arch/arm/mach-s3c24xx/mach-smdk2410.c
index a773789..f32924e 100644
--- a/arch/arm/mach-s3c24xx/mach-smdk2410.c
+++ b/arch/arm/mach-s3c24xx/mach-smdk2410.c
@@ -35,6 +35,7 @@
 #include <linux/timer.h>
 #include <linux/init.h>
 #include <linux/serial_core.h>
+#include <linux/serial_s3c.h>
 #include <linux/platform_device.h>
 #include <linux/io.h>
 
@@ -46,7 +47,6 @@
 #include <asm/irq.h>
 #include <asm/mach-types.h>
 
-#include <plat/regs-serial.h>
 #include <linux/platform_data/i2c-s3c2410.h>
 
 #include <plat/devs.h>
diff --git a/arch/arm/mach-s3c24xx/mach-smdk2413.c b/arch/arm/mach-s3c24xx/mach-smdk2413.c
index c9d31ef..c9322c6 100644
--- a/arch/arm/mach-s3c24xx/mach-smdk2413.c
+++ b/arch/arm/mach-s3c24xx/mach-smdk2413.c
@@ -19,6 +19,7 @@
 #include <linux/init.h>
 #include <linux/gpio.h>
 #include <linux/serial_core.h>
+#include <linux/serial_s3c.h>
 #include <linux/platform_device.h>
 #include <linux/io.h>
 
@@ -33,7 +34,6 @@
 #include <asm/mach-types.h>
 
 //#include <asm/debug-ll.h>
-#include <plat/regs-serial.h>
 #include <mach/regs-gpio.h>
 #include <mach/regs-lcd.h>
 
diff --git a/arch/arm/mach-s3c24xx/mach-smdk2416.c b/arch/arm/mach-s3c24xx/mach-smdk2416.c
index f88e672..60752be 100644
--- a/arch/arm/mach-s3c24xx/mach-smdk2416.c
+++ b/arch/arm/mach-s3c24xx/mach-smdk2416.c
@@ -18,6 +18,7 @@
 #include <linux/timer.h>
 #include <linux/init.h>
 #include <linux/serial_core.h>
+#include <linux/serial_s3c.h>
 #include <linux/platform_device.h>
 #include <linux/io.h>
 #include <linux/mtd/partitions.h>
@@ -34,7 +35,6 @@
 #include <asm/irq.h>
 #include <asm/mach-types.h>
 
-#include <plat/regs-serial.h>
 #include <mach/regs-gpio.h>
 #include <mach/regs-lcd.h>
 #include <mach/regs-s3c2443-clock.h>
diff --git a/arch/arm/mach-s3c24xx/mach-smdk2440.c b/arch/arm/mach-s3c24xx/mach-smdk2440.c
index de2e5d3..d071dcf 100644
--- a/arch/arm/mach-s3c24xx/mach-smdk2440.c
+++ b/arch/arm/mach-s3c24xx/mach-smdk2440.c
@@ -20,6 +20,7 @@
 #include <linux/timer.h>
 #include <linux/init.h>
 #include <linux/serial_core.h>
+#include <linux/serial_s3c.h>
 #include <linux/platform_device.h>
 #include <linux/io.h>
 
@@ -31,7 +32,6 @@
 #include <asm/irq.h>
 #include <asm/mach-types.h>
 
-#include <plat/regs-serial.h>
 #include <mach/regs-gpio.h>
 #include <mach/regs-lcd.h>
 
diff --git a/arch/arm/mach-s3c24xx/mach-smdk2443.c b/arch/arm/mach-s3c24xx/mach-smdk2443.c
index d9933fc..06c4d77 100644
--- a/arch/arm/mach-s3c24xx/mach-smdk2443.c
+++ b/arch/arm/mach-s3c24xx/mach-smdk2443.c
@@ -20,6 +20,7 @@
 #include <linux/timer.h>
 #include <linux/init.h>
 #include <linux/serial_core.h>
+#include <linux/serial_s3c.h>
 #include <linux/platform_device.h>
 #include <linux/io.h>
 
@@ -31,7 +32,6 @@
 #include <asm/irq.h>
 #include <asm/mach-types.h>
 
-#include <plat/regs-serial.h>
 #include <mach/regs-gpio.h>
 #include <mach/regs-lcd.h>
 
diff --git a/arch/arm/mach-s3c24xx/mach-tct_hammer.c b/arch/arm/mach-s3c24xx/mach-tct_hammer.c
index 7fad8f0..4108b2f 100644
--- a/arch/arm/mach-s3c24xx/mach-tct_hammer.c
+++ b/arch/arm/mach-s3c24xx/mach-tct_hammer.c
@@ -33,6 +33,7 @@
 #include <linux/device.h>
 #include <linux/platform_device.h>
 #include <linux/serial_core.h>
+#include <linux/serial_s3c.h>
 #include <linux/io.h>
 
 #include <asm/mach/arch.h>
@@ -44,7 +45,6 @@
 #include <asm/irq.h>
 #include <asm/mach-types.h>
 
-#include <plat/regs-serial.h>
 #include <linux/platform_data/i2c-s3c2410.h>
 #include <plat/devs.h>
 #include <plat/cpu.h>
diff --git a/arch/arm/mach-s3c24xx/mach-vr1000.c b/arch/arm/mach-s3c24xx/mach-vr1000.c
index 42e7187..100ed33 100644
--- a/arch/arm/mach-s3c24xx/mach-vr1000.c
+++ b/arch/arm/mach-s3c24xx/mach-vr1000.c
@@ -25,6 +25,7 @@
 #include <linux/tty.h>
 #include <linux/serial_8250.h>
 #include <linux/serial_reg.h>
+#include <linux/serial_s3c.h>
 #include <linux/io.h>
 
 #include <asm/mach/arch.h>
@@ -44,7 +45,6 @@
 #include <plat/clock.h>
 #include <plat/cpu.h>
 #include <plat/devs.h>
-#include <plat/regs-serial.h>
 #include <plat/samsung-time.h>
 
 #include "bast.h"
diff --git a/arch/arm/mach-s3c24xx/mach-vstms.c b/arch/arm/mach-s3c24xx/mach-vstms.c
index f7ec9c5..40868c0 100644
--- a/arch/arm/mach-s3c24xx/mach-vstms.c
+++ b/arch/arm/mach-s3c24xx/mach-vstms.c
@@ -16,6 +16,7 @@
 #include <linux/timer.h>
 #include <linux/init.h>
 #include <linux/serial_core.h>
+#include <linux/serial_s3c.h>
 #include <linux/platform_device.h>
 #include <linux/io.h>
 #include <linux/mtd/mtd.h>
@@ -32,7 +33,6 @@
 #include <asm/irq.h>
 #include <asm/mach-types.h>
 
-#include <plat/regs-serial.h>
 #include <mach/regs-gpio.h>
 #include <mach/regs-lcd.h>
 
diff --git a/arch/arm/mach-s3c24xx/pm.c b/arch/arm/mach-s3c24xx/pm.c
index caa5b72..851f72c 100644
--- a/arch/arm/mach-s3c24xx/pm.c
+++ b/arch/arm/mach-s3c24xx/pm.c
@@ -33,9 +33,9 @@
 #include <linux/gpio.h>
 #include <linux/interrupt.h>
 #include <linux/serial_core.h>
+#include <linux/serial_s3c.h>
 #include <linux/io.h>
 
-#include <plat/regs-serial.h>
 #include <mach/regs-clock.h>
 #include <mach/regs-gpio.h>
 #include <mach/regs-irq.h>
diff --git a/arch/arm/mach-s3c24xx/s3c2410.c b/arch/arm/mach-s3c24xx/s3c2410.c
index 34676d1..17730d4 100644
--- a/arch/arm/mach-s3c24xx/s3c2410.c
+++ b/arch/arm/mach-s3c24xx/s3c2410.c
@@ -21,6 +21,7 @@
 #include <linux/device.h>
 #include <linux/syscore_ops.h>
 #include <linux/serial_core.h>
+#include <linux/serial_s3c.h>
 #include <linux/platform_device.h>
 #include <linux/reboot.h>
 #include <linux/io.h>
@@ -36,7 +37,6 @@
 #include <plat/cpu-freq.h>
 
 #include <mach/regs-clock.h>
-#include <plat/regs-serial.h>
 
 #include <plat/cpu.h>
 #include <plat/devs.h>
diff --git a/arch/arm/mach-s3c24xx/s3c2412.c b/arch/arm/mach-s3c24xx/s3c2412.c
index 0251650c..657cbac 100644
--- a/arch/arm/mach-s3c24xx/s3c2412.c
+++ b/arch/arm/mach-s3c24xx/s3c2412.c
@@ -20,6 +20,7 @@
 #include <linux/device.h>
 #include <linux/syscore_ops.h>
 #include <linux/serial_core.h>
+#include <linux/serial_s3c.h>
 #include <linux/platform_device.h>
 #include <linux/io.h>
 #include <linux/reboot.h>
@@ -43,7 +44,6 @@
 #include <plat/nand-core.h>
 #include <plat/pll.h>
 #include <plat/pm.h>
-#include <plat/regs-serial.h>
 #include <plat/regs-spi.h>
 
 #include "common.h"
diff --git a/arch/arm/mach-s3c24xx/s3c244x.c b/arch/arm/mach-s3c24xx/s3c244x.c
index 911b555..fe30ebb2 100644
--- a/arch/arm/mach-s3c24xx/s3c244x.c
+++ b/arch/arm/mach-s3c24xx/s3c244x.c
@@ -17,6 +17,7 @@
 #include <linux/timer.h>
 #include <linux/init.h>
 #include <linux/serial_core.h>
+#include <linux/serial_s3c.h>
 #include <linux/platform_device.h>
 #include <linux/reboot.h>
 #include <linux/device.h>
@@ -35,7 +36,6 @@
 #include <plat/cpu-freq.h>
 
 #include <mach/regs-clock.h>
-#include <plat/regs-serial.h>
 #include <mach/regs-gpio.h>
 
 #include <plat/clock.h>
diff --git a/arch/arm/mach-s3c24xx/sleep-s3c2410.S b/arch/arm/mach-s3c24xx/sleep-s3c2410.S
index dd47c8f..c9b9122 100644
--- a/arch/arm/mach-s3c24xx/sleep-s3c2410.S
+++ b/arch/arm/mach-s3c24xx/sleep-s3c2410.S
@@ -25,13 +25,13 @@
 */
 
 #include <linux/linkage.h>
+#include <linux/serial_s3c.h>
 #include <asm/assembler.h>
 #include <mach/hardware.h>
 #include <mach/map.h>
 
 #include <mach/regs-gpio.h>
 #include <mach/regs-clock.h>
-#include <plat/regs-serial.h>
 
 #include "regs-mem.h"
 
diff --git a/arch/arm/mach-s3c24xx/sleep.S b/arch/arm/mach-s3c24xx/sleep.S
index 7f378b6..d833d61 100644
--- a/arch/arm/mach-s3c24xx/sleep.S
+++ b/arch/arm/mach-s3c24xx/sleep.S
@@ -25,13 +25,13 @@
 */
 
 #include <linux/linkage.h>
+#include <linux/serial_s3c.h>
 #include <asm/assembler.h>
 #include <mach/hardware.h>
 #include <mach/map.h>
 
 #include <mach/regs-gpio.h>
 #include <mach/regs-clock.h>
-#include <plat/regs-serial.h>
 
 /* CONFIG_DEBUG_RESUME is dangerous if your bootloader does not
  * reset the UART configuration, only enable if you really need this!
diff --git a/arch/arm/mach-s3c64xx/common.c b/arch/arm/mach-s3c64xx/common.c
index 7a3ce4c..71f4581 100644
--- a/arch/arm/mach-s3c64xx/common.c
+++ b/arch/arm/mach-s3c64xx/common.c
@@ -25,6 +25,7 @@
 #include <linux/interrupt.h>
 #include <linux/ioport.h>
 #include <linux/serial_core.h>
+#include <linux/serial_s3c.h>
 #include <linux/platform_device.h>
 #include <linux/reboot.h>
 #include <linux/io.h>
@@ -49,7 +50,6 @@
 #include <plat/irq-uart.h>
 #include <plat/pwm-core.h>
 #include <plat/regs-irqtype.h>
-#include <plat/regs-serial.h>
 #include <plat/watchdog-reset.h>
 
 #include "common.h"
diff --git a/arch/arm/mach-s3c64xx/include/mach/debug-macro.S b/arch/arm/mach-s3c64xx/include/mach/debug-macro.S
index dd9ccca..c9b9532 100644
--- a/arch/arm/mach-s3c64xx/include/mach/debug-macro.S
+++ b/arch/arm/mach-s3c64xx/include/mach/debug-macro.S
@@ -12,8 +12,8 @@
 
 /* pull in the relevant register and map files. */
 
+#include <linux/serial_s3c.h>
 #include <mach/map.h>
-#include <plat/regs-serial.h>
 
 	/* note, for the boot process to work we have to keep the UART
 	 * virtual address aligned to an 1MiB boundary for the L1
diff --git a/arch/arm/mach-s3c64xx/irq-pm.c b/arch/arm/mach-s3c64xx/irq-pm.c
index 1649c0d..a61247b 100644
--- a/arch/arm/mach-s3c64xx/irq-pm.c
+++ b/arch/arm/mach-s3c64xx/irq-pm.c
@@ -20,13 +20,13 @@
 #include <linux/syscore_ops.h>
 #include <linux/interrupt.h>
 #include <linux/serial_core.h>
+#include <linux/serial_s3c.h>
 #include <linux/irq.h>
 #include <linux/io.h>
 #include <linux/of.h>
 
 #include <mach/map.h>
 
-#include <plat/regs-serial.h>
 #include <mach/regs-gpio.h>
 #include <plat/cpu.h>
 #include <plat/pm.h>
diff --git a/arch/arm/mach-s3c64xx/mach-anw6410.c b/arch/arm/mach-s3c64xx/mach-anw6410.c
index d266dd5..75b1f11 100644
--- a/arch/arm/mach-s3c64xx/mach-anw6410.c
+++ b/arch/arm/mach-s3c64xx/mach-anw6410.c
@@ -20,6 +20,7 @@
 #include <linux/timer.h>
 #include <linux/init.h>
 #include <linux/serial_core.h>
+#include <linux/serial_s3c.h>
 #include <linux/platform_device.h>
 #include <linux/io.h>
 #include <linux/i2c.h>
@@ -41,7 +42,6 @@
 #include <asm/irq.h>
 #include <asm/mach-types.h>
 
-#include <plat/regs-serial.h>
 #include <linux/platform_data/i2c-s3c2410.h>
 #include <plat/fb.h>
 
diff --git a/arch/arm/mach-s3c64xx/mach-crag6410.c b/arch/arm/mach-s3c64xx/mach-crag6410.c
index 758e31b..43aad8c 100644
--- a/arch/arm/mach-s3c64xx/mach-crag6410.c
+++ b/arch/arm/mach-s3c64xx/mach-crag6410.c
@@ -14,6 +14,7 @@
 #include <linux/kernel.h>
 #include <linux/list.h>
 #include <linux/serial_core.h>
+#include <linux/serial_s3c.h>
 #include <linux/platform_device.h>
 #include <linux/fb.h>
 #include <linux/io.h>
@@ -51,7 +52,6 @@
 
 #include <mach/regs-gpio.h>
 
-#include <plat/regs-serial.h>
 #include <plat/fb.h>
 #include <plat/sdhci.h>
 #include <plat/gpio-cfg.h>
diff --git a/arch/arm/mach-s3c64xx/mach-hmt.c b/arch/arm/mach-s3c64xx/mach-hmt.c
index 614a03a..dab3e74 100644
--- a/arch/arm/mach-s3c64xx/mach-hmt.c
+++ b/arch/arm/mach-s3c64xx/mach-hmt.c
@@ -11,6 +11,7 @@
 #include <linux/kernel.h>
 #include <linux/init.h>
 #include <linux/serial_core.h>
+#include <linux/serial_s3c.h>
 #include <linux/platform_device.h>
 #include <linux/io.h>
 #include <linux/i2c.h>
@@ -33,7 +34,6 @@
 #include <asm/irq.h>
 #include <asm/mach-types.h>
 
-#include <plat/regs-serial.h>
 #include <linux/platform_data/i2c-s3c2410.h>
 #include <plat/fb.h>
 #include <linux/platform_data/mtd-nand-s3c2410.h>
diff --git a/arch/arm/mach-s3c64xx/mach-mini6410.c b/arch/arm/mach-s3c64xx/mach-mini6410.c
index 97ae470..a588146 100644
--- a/arch/arm/mach-s3c64xx/mach-mini6410.c
+++ b/arch/arm/mach-s3c64xx/mach-mini6410.c
@@ -22,6 +22,7 @@
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/partitions.h>
 #include <linux/serial_core.h>
+#include <linux/serial_s3c.h>
 #include <linux/types.h>
 
 #include <asm/mach-types.h>
@@ -37,7 +38,6 @@
 #include <plat/fb.h>
 #include <linux/platform_data/mtd-nand-s3c2410.h>
 #include <linux/platform_data/mmc-sdhci-s3c.h>
-#include <plat/regs-serial.h>
 #include <plat/sdhci.h>
 #include <linux/platform_data/touchscreen-s3c2410.h>
 
diff --git a/arch/arm/mach-s3c64xx/mach-ncp.c b/arch/arm/mach-s3c64xx/mach-ncp.c
index 2067b0b..67f06a9 100644
--- a/arch/arm/mach-s3c64xx/mach-ncp.c
+++ b/arch/arm/mach-s3c64xx/mach-ncp.c
@@ -16,6 +16,7 @@
 #include <linux/timer.h>
 #include <linux/init.h>
 #include <linux/serial_core.h>
+#include <linux/serial_s3c.h>
 #include <linux/platform_device.h>
 #include <linux/io.h>
 #include <linux/i2c.h>
@@ -36,7 +37,6 @@
 #include <asm/irq.h>
 #include <asm/mach-types.h>
 
-#include <plat/regs-serial.h>
 #include <linux/platform_data/i2c-s3c2410.h>
 #include <plat/fb.h>
 
diff --git a/arch/arm/mach-s3c64xx/mach-real6410.c b/arch/arm/mach-s3c64xx/mach-real6410.c
index 8bed37b..67f11d7 100644
--- a/arch/arm/mach-s3c64xx/mach-real6410.c
+++ b/arch/arm/mach-s3c64xx/mach-real6410.c
@@ -23,6 +23,7 @@
 #include <linux/mtd/partitions.h>
 #include <linux/platform_device.h>
 #include <linux/serial_core.h>
+#include <linux/serial_s3c.h>
 #include <linux/types.h>
 
 #include <asm/mach-types.h>
@@ -37,7 +38,6 @@
 #include <plat/devs.h>
 #include <plat/fb.h>
 #include <linux/platform_data/mtd-nand-s3c2410.h>
-#include <plat/regs-serial.h>
 #include <linux/platform_data/touchscreen-s3c2410.h>
 
 #include <video/platform_lcd.h>
diff --git a/arch/arm/mach-s3c64xx/mach-smartq.c b/arch/arm/mach-s3c64xx/mach-smartq.c
index 08a889c..9079970 100644
--- a/arch/arm/mach-s3c64xx/mach-smartq.c
+++ b/arch/arm/mach-s3c64xx/mach-smartq.c
@@ -16,6 +16,7 @@
 #include <linux/platform_device.h>
 #include <linux/pwm_backlight.h>
 #include <linux/serial_core.h>
+#include <linux/serial_s3c.h>
 #include <linux/spi/spi_gpio.h>
 #include <linux/usb/gpio_vbus.h>
 #include <linux/platform_data/s3c-hsotg.h>
@@ -32,7 +33,6 @@
 #include <linux/platform_data/i2c-s3c2410.h>
 #include <plat/gpio-cfg.h>
 #include <linux/platform_data/hwmon-s3c.h>
-#include <plat/regs-serial.h>
 #include <linux/platform_data/usb-ohci-s3c2410.h>
 #include <plat/sdhci.h>
 #include <linux/platform_data/touchscreen-s3c2410.h>
diff --git a/arch/arm/mach-s3c64xx/mach-smdk6400.c b/arch/arm/mach-s3c64xx/mach-smdk6400.c
index 27381cf..19c9cff 100644
--- a/arch/arm/mach-s3c64xx/mach-smdk6400.c
+++ b/arch/arm/mach-s3c64xx/mach-smdk6400.c
@@ -16,6 +16,7 @@
 #include <linux/timer.h>
 #include <linux/init.h>
 #include <linux/serial_core.h>
+#include <linux/serial_s3c.h>
 #include <linux/platform_device.h>
 #include <linux/i2c.h>
 #include <linux/io.h>
@@ -29,8 +30,6 @@
 #include <mach/hardware.h>
 #include <mach/map.h>
 
-#include <plat/regs-serial.h>
-
 #include <plat/clock.h>
 #include <plat/devs.h>
 #include <plat/cpu.h>
diff --git a/arch/arm/mach-s3c64xx/mach-smdk6410.c b/arch/arm/mach-s3c64xx/mach-smdk6410.c
index d5ea938..558b0f5 100644
--- a/arch/arm/mach-s3c64xx/mach-smdk6410.c
+++ b/arch/arm/mach-s3c64xx/mach-smdk6410.c
@@ -19,6 +19,7 @@
 #include <linux/init.h>
 #include <linux/input.h>
 #include <linux/serial_core.h>
+#include <linux/serial_s3c.h>
 #include <linux/platform_device.h>
 #include <linux/io.h>
 #include <linux/i2c.h>
@@ -55,7 +56,6 @@
 #include <asm/irq.h>
 #include <asm/mach-types.h>
 
-#include <plat/regs-serial.h>
 #include <mach/regs-gpio.h>
 #include <linux/platform_data/ata-samsung_cf.h>
 #include <linux/platform_data/i2c-s3c2410.h>
diff --git a/arch/arm/mach-s3c64xx/s3c6400.c b/arch/arm/mach-s3c64xx/s3c6400.c
index 3db0c98..8c42807 100644
--- a/arch/arm/mach-s3c64xx/s3c6400.c
+++ b/arch/arm/mach-s3c64xx/s3c6400.c
@@ -23,6 +23,7 @@
 #include <linux/io.h>
 #include <linux/device.h>
 #include <linux/serial_core.h>
+#include <linux/serial_s3c.h>
 #include <linux/platform_device.h>
 #include <linux/of.h>
 
@@ -34,7 +35,6 @@
 #include <asm/irq.h>
 
 #include <plat/cpu-freq.h>
-#include <plat/regs-serial.h>
 #include <mach/regs-clock.h>
 
 #include <plat/cpu.h>
diff --git a/arch/arm/mach-s3c64xx/s3c6410.c b/arch/arm/mach-s3c64xx/s3c6410.c
index 72b2278..5be3f09 100644
--- a/arch/arm/mach-s3c64xx/s3c6410.c
+++ b/arch/arm/mach-s3c64xx/s3c6410.c
@@ -24,6 +24,7 @@
 #include <linux/io.h>
 #include <linux/device.h>
 #include <linux/serial_core.h>
+#include <linux/serial_s3c.h>
 #include <linux/platform_device.h>
 #include <linux/of.h>
 
@@ -35,7 +36,6 @@
 #include <asm/irq.h>
 
 #include <plat/cpu-freq.h>
-#include <plat/regs-serial.h>
 #include <mach/regs-clock.h>
 
 #include <plat/cpu.h>
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
index 99a3590..570cbbe 100644
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
