From: Tushar Behera <tushar.behera@linaro.org>
Subject: [PATCH 2/9] ARM: S3C24XX: Replace inclusion of plat/regs-serial.h
Date: Mon, 30 Dec 2013 15:30:33 +0530
Message-ID: <1388397640-720-3-git-send-email-tushar.behera@linaro.org>
References: <1388397640-720-1-git-send-email-tushar.behera@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f52.google.com ([209.85.220.52]:51870 "EHLO
	mail-pa0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752051Ab3L3KEX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 30 Dec 2013 05:04:23 -0500
Received: by mail-pa0-f52.google.com with SMTP id ld10so11523770pab.39
        for <linux-samsung-soc@vger.kernel.org>; Mon, 30 Dec 2013 02:04:23 -0800 (PST)
In-Reply-To: <1388397640-720-1-git-send-email-tushar.behera@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com

Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
---
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
 39 files changed, 39 insertions(+), 41 deletions(-)

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
index 530e9a6..e9f5d28 100644
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
index b60a248..6016848 100644
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
index 74401196..6ad7512 100644
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
index 47fe7af..43c2189 100644
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
@@ -55,7 +56,6 @@
 #include <plat/cpu-freq.h>
 #include <plat/devs.h>
 #include <plat/gpio-cfg.h>
-#include <plat/regs-serial.h>
 #include <plat/samsung-time.h>
 
 #include "bast.h"
diff --git a/arch/arm/mach-s3c24xx/mach-gta02.c b/arch/arm/mach-s3c24xx/mach-gta02.c
index c2c2ac7..c2d63d9 100644
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
@@ -81,7 +82,6 @@
 #include <plat/devs.h>
 #include <plat/gpio-cfg.h>
 #include <plat/pm.h>
-#include <plat/regs-serial.h>
 #include <plat/samsung-time.h>
 
 #include "common.h"
diff --git a/arch/arm/mach-s3c24xx/mach-h1940.c b/arch/arm/mach-s3c24xx/mach-h1940.c
index d25d8b1..d183e84 100644
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
@@ -62,7 +63,6 @@
 #include <plat/gpio-cfg.h>
 #include <plat/pll.h>
 #include <plat/pm.h>
-#include <plat/regs-serial.h>
 #include <plat/samsung-time.h>
 
 #include "common.h"
diff --git a/arch/arm/mach-s3c24xx/mach-jive.c b/arch/arm/mach-s3c24xx/mach-jive.c
index 434dbf2..9188c0c 100644
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
 #include <linux/platform_data/gpio-samsung-s3c24xx.h>
diff --git a/arch/arm/mach-s3c24xx/mach-mini2440.c b/arch/arm/mach-s3c24xx/mach-mini2440.c
index 48af11f..b3073fe 100644
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
index 7fcb887..c17fb36 100644
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
@@ -43,7 +44,6 @@
 
 #include <linux/platform_data/i2c-s3c2410.h>
 #include <linux/platform_data/gpio-samsung-s3c24xx.h>
-#include <plat/regs-serial.h>
 
 #include <plat/clock.h>
 #include <plat/cpu.h>
diff --git a/arch/arm/mach-s3c24xx/mach-nexcoder.c b/arch/arm/mach-s3c24xx/mach-nexcoder.c
index 0f27ac4..72e4881 100644
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
 #include <linux/platform_data/gpio-samsung-s3c24xx.h>
 
diff --git a/arch/arm/mach-s3c24xx/mach-osiris.c b/arch/arm/mach-s3c24xx/mach-osiris.c
index 040b16a..fb915eb 100644
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
@@ -45,7 +46,6 @@
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
index 96c3bc8..aa08733 100644
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
index d492fb9..8d7da40 100644
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
@@ -57,7 +58,6 @@
 #include <plat/cpu.h>
 #include <plat/devs.h>
 #include <plat/pm.h>
-#include <plat/regs-serial.h>
 #include <plat/samsung-time.h>
 
 #include "common.h"
diff --git a/arch/arm/mach-s3c24xx/mach-rx3715.c b/arch/arm/mach-s3c24xx/mach-rx3715.c
index 319ed80..2cc0e03 100644
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
@@ -49,7 +50,6 @@
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
index 86e2501..f77f520 100644
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
index 0cc691d..4f4de95 100644
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
index 86e7ffd..f315988 100644
--- a/arch/arm/mach-s3c24xx/mach-vr1000.c
+++ b/arch/arm/mach-s3c24xx/mach-vr1000.c
@@ -25,6 +25,7 @@
 #include <linux/tty.h>
 #include <linux/serial_8250.h>
 #include <linux/serial_reg.h>
+#include <linux/serial_s3c.h>
 #include <linux/io.h>
 
 #include <asm/mach/arch.h>
@@ -45,7 +46,6 @@
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
index 2baa887..f198af0 100644
--- a/arch/arm/mach-s3c24xx/pm.c
+++ b/arch/arm/mach-s3c24xx/pm.c
@@ -33,10 +33,10 @@
 #include <linux/gpio.h>
 #include <linux/interrupt.h>
 #include <linux/serial_core.h>
+#include <linux/serial_s3c.h>
 #include <linux/io.h>
 #include <linux/platform_data/gpio-samsung-s3c24xx.h>
 
-#include <plat/regs-serial.h>
 #include <mach/regs-clock.h>
 #include <mach/regs-gpio.h>
 #include <mach/regs-irq.h>
diff --git a/arch/arm/mach-s3c24xx/s3c2410.c b/arch/arm/mach-s3c24xx/s3c2410.c
index db22f74..d4d997e 100644
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
@@ -37,7 +38,6 @@
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
-- 
1.7.9.5
