From: Tushar Behera <tushar.behera@linaro.org>
Subject: [PATCH 3/9] ARM: S3C64XX: Replace inclusion of plat/regs-serial.h header file
Date: Mon, 30 Dec 2013 15:30:34 +0530
Message-ID: <1388397640-720-4-git-send-email-tushar.behera@linaro.org>
References: <1388397640-720-1-git-send-email-tushar.behera@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f53.google.com ([209.85.160.53]:32934 "EHLO
	mail-pb0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754490Ab3L3KEZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 30 Dec 2013 05:04:25 -0500
Received: by mail-pb0-f53.google.com with SMTP id ma3so11367686pbc.40
        for <linux-samsung-soc@vger.kernel.org>; Mon, 30 Dec 2013 02:04:25 -0800 (PST)
In-Reply-To: <1388397640-720-1-git-send-email-tushar.behera@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com

Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
---
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
 14 files changed, 14 insertions(+), 15 deletions(-)

diff --git a/arch/arm/mach-s3c64xx/common.c b/arch/arm/mach-s3c64xx/common.c
index 64edda3..f1afaea 100644
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
@@ -50,7 +51,6 @@
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
index 546f45b..73abc89 100644
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
 #include <linux/platform_data/gpio-samsung-s3c64xx.h>
 #include <plat/fb.h>
diff --git a/arch/arm/mach-s3c64xx/mach-crag6410.c b/arch/arm/mach-s3c64xx/mach-crag6410.c
index 7b91359..b6e3895 100644
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
@@ -52,7 +53,6 @@
 
 #include <mach/regs-gpio.h>
 
-#include <plat/regs-serial.h>
 #include <plat/fb.h>
 #include <plat/sdhci.h>
 #include <plat/gpio-cfg.h>
diff --git a/arch/arm/mach-s3c64xx/mach-hmt.c b/arch/arm/mach-s3c64xx/mach-hmt.c
index 009b195..a89b1b5 100644
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
 #include <linux/platform_data/gpio-samsung-s3c64xx.h>
 #include <plat/fb.h>
diff --git a/arch/arm/mach-s3c64xx/mach-mini6410.c b/arch/arm/mach-s3c64xx/mach-mini6410.c
index a564aee..b6c58e4 100644
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
 #include <linux/platform_data/gpio-samsung-s3c64xx.h>
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
index af45149a..b777cd1 100644
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
 #include <linux/platform_data/gpio-samsung-s3c64xx.h>
 
diff --git a/arch/arm/mach-s3c64xx/mach-smartq.c b/arch/arm/mach-s3c64xx/mach-smartq.c
index d398ea5..8c30b92 100644
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
index bdbbddb..b0e33fb 100644
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
index a8977da..7db2a9c 100644
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
@@ -56,7 +57,6 @@
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
-- 
1.7.9.5
