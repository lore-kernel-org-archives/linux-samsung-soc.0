From: Romain Naour <romain.naour@openwide.fr>
Subject: [PATCH 3/3] Add samsung-time support for s3c64xx
Date: Wed, 28 Nov 2012 00:27:58 +0100
Message-ID: <50B54C7E.4010401@openwide.fr>
References: <50885608.1030503@openwide.fr> <110b01cdc922$82d683e0$88838ba0$%kim@samsung.com> <50B1887B.1090409@openwide.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from zimbra3.corp.accelance.fr ([213.162.49.233]:47092 "EHLO
	zimbra3.corp.accelance.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754932Ab2K0X2H (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 27 Nov 2012 18:28:07 -0500
In-Reply-To: <50B1887B.1090409@openwide.fr>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: tomasz.figa@gmail.com
Cc: Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, =?ISO-8859-1?Q?=27Heiko_St=FCbner=27?= <heiko@sntech.de>, 'Sylwester Nawrocki' <sylvester.nawrocki@gmail.com>

This patch replace ARCH_USES_GETTIMEOFFSET by GENERIC_CLOCKEVENTS for s3c64xx devices.
It becomes possible to use the high-resolution timer and dynamic ticks.

Signed-off-by: Naour Romain <romain.naour@openwide.fr>
---
 arch/arm/Kconfig                      | 3 ++-
 arch/arm/mach-s3c64xx/Kconfig         | 2 ++
 arch/arm/mach-s3c64xx/mach-anw6410.c  | 4 +++-
 arch/arm/mach-s3c64xx/mach-crag6410.c | 4 +++-
 arch/arm/mach-s3c64xx/mach-hmt.c      | 4 +++-
 arch/arm/mach-s3c64xx/mach-mini6410.c | 4 +++-
 arch/arm/mach-s3c64xx/mach-ncp.c      | 4 +++-
 arch/arm/mach-s3c64xx/mach-real6410.c | 4 +++-
 arch/arm/mach-s3c64xx/mach-smartq.c   | 2 ++
 arch/arm/mach-s3c64xx/mach-smartq5.c  | 3 ++-
 arch/arm/mach-s3c64xx/mach-smartq7.c  | 3 ++-
 arch/arm/mach-s3c64xx/mach-smdk6400.c | 4 +++-
 arch/arm/mach-s3c64xx/mach-smdk6410.c | 4 +++-
 13 files changed, 34 insertions(+), 11 deletions(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 6563476..6e00aea 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -757,7 +757,8 @@ config ARCH_S3C64XX
 	bool "Samsung S3C64XX"
 	select ARCH_HAS_CPUFREQ
 	select ARCH_REQUIRE_GPIOLIB
-	select ARCH_USES_GETTIMEOFFSET
+	select GENERIC_CLOCKEVENTS
+	select CLKSRC_MMIO
 	select ARM_VIC
 	select CLKDEV_LOOKUP
 	select CPU_V6
diff --git a/arch/arm/mach-s3c64xx/Kconfig b/arch/arm/mach-s3c64xx/Kconfig
index 63e7ae3..7b0dbbf3 100644
--- a/arch/arm/mach-s3c64xx/Kconfig
+++ b/arch/arm/mach-s3c64xx/Kconfig
@@ -17,11 +17,13 @@ config PLAT_S3C64XX
 # Configuration options for the S3C6410 CPU
 
 config CPU_S3C6400
+	select SAMSUNG_HRT
 	bool
 	help
 	  Enable S3C6400 CPU support
 
 config CPU_S3C6410
+	select SAMSUNG_HRT
 	bool
 	help
 	  Enable S3C6410 CPU support
diff --git a/arch/arm/mach-s3c64xx/mach-anw6410.c b/arch/arm/mach-s3c64xx/mach-anw6410.c
index 99e82ac..cfe8315 100644
--- a/arch/arm/mach-s3c64xx/mach-anw6410.c
+++ b/arch/arm/mach-s3c64xx/mach-anw6410.c
@@ -51,6 +51,7 @@
 #include <plat/cpu.h>
 #include <mach/regs-gpio.h>
 #include <mach/regs-modem.h>
+#include <plat/samsung-time.h>
 
 #include "common.h"
 
@@ -209,6 +210,7 @@ static void __init anw6410_map_io(void)
 	s3c64xx_init_io(anw6410_iodesc, ARRAY_SIZE(anw6410_iodesc));
 	s3c24xx_init_clocks(12000000);
 	s3c24xx_init_uarts(anw6410_uartcfgs, ARRAY_SIZE(anw6410_uartcfgs));
+	samsung_set_timer_source(SAMSUNG_PWM3, SAMSUNG_PWM4);
 
 	anw6410_lcd_mode_set();
 }
@@ -234,6 +236,6 @@ MACHINE_START(ANW6410, "A&W6410")
 	.map_io		= anw6410_map_io,
 	.init_machine	= anw6410_machine_init,
 	.init_late	= s3c64xx_init_late,
-	.timer		= &s3c24xx_timer,
+	.timer		= &samsung_timer,
 	.restart	= s3c64xx_restart,
 MACHINE_END
diff --git a/arch/arm/mach-s3c64xx/mach-crag6410.c b/arch/arm/mach-s3c64xx/mach-crag6410.c
index 13b7eaa..59c94a6 100644
--- a/arch/arm/mach-s3c64xx/mach-crag6410.c
+++ b/arch/arm/mach-s3c64xx/mach-crag6410.c
@@ -70,6 +70,7 @@
 #include <plat/adc.h>
 #include <linux/platform_data/i2c-s3c2410.h>
 #include <plat/pm.h>
+#include <plat/samsung-time.h>
 
 #include "common.h"
 
@@ -704,6 +705,7 @@ static void __init crag6410_map_io(void)
 	s3c64xx_init_io(NULL, 0);
 	s3c24xx_init_clocks(12000000);
 	s3c24xx_init_uarts(crag6410_uartcfgs, ARRAY_SIZE(crag6410_uartcfgs));
+	samsung_set_timer_source(SAMSUNG_PWM3, SAMSUNG_PWM4);
 
 	/* LCD type and Bypass set by bootloader */
 }
@@ -829,6 +831,6 @@ MACHINE_START(WLF_CRAGG_6410, "Wolfson Cragganmore 6410")
 	.map_io		= crag6410_map_io,
 	.init_machine	= crag6410_machine_init,
 	.init_late	= s3c64xx_init_late,
-	.timer		= &s3c24xx_timer,
+	.timer		= &samsung_timer,
 	.restart	= s3c64xx_restart,
 MACHINE_END
diff --git a/arch/arm/mach-s3c64xx/mach-hmt.c b/arch/arm/mach-s3c64xx/mach-hmt.c
index 2b14489..39f733b 100644
--- a/arch/arm/mach-s3c64xx/mach-hmt.c
+++ b/arch/arm/mach-s3c64xx/mach-hmt.c
@@ -42,6 +42,7 @@
 #include <plat/clock.h>
 #include <plat/devs.h>
 #include <plat/cpu.h>
+#include <plat/samsung-time.h>
 
 #include "common.h"
 
@@ -249,6 +250,7 @@ static void __init hmt_map_io(void)
 	s3c64xx_init_io(hmt_iodesc, ARRAY_SIZE(hmt_iodesc));
 	s3c24xx_init_clocks(12000000);
 	s3c24xx_init_uarts(hmt_uartcfgs, ARRAY_SIZE(hmt_uartcfgs));
+	samsung_set_timer_source(SAMSUNG_PWM3, SAMSUNG_PWM4);
 }
 
 static void __init hmt_machine_init(void)
@@ -277,6 +279,6 @@ MACHINE_START(HMT, "Airgoo-HMT")
 	.map_io		= hmt_map_io,
 	.init_machine	= hmt_machine_init,
 	.init_late	= s3c64xx_init_late,
-	.timer		= &s3c24xx_timer,
+	.timer		= &samsung_timer,
 	.restart	= s3c64xx_restart,
 MACHINE_END
diff --git a/arch/arm/mach-s3c64xx/mach-mini6410.c b/arch/arm/mach-s3c64xx/mach-mini6410.c
index 07c349c..579f303 100644
--- a/arch/arm/mach-s3c64xx/mach-mini6410.c
+++ b/arch/arm/mach-s3c64xx/mach-mini6410.c
@@ -44,6 +44,7 @@
 
 #include <video/platform_lcd.h>
 #include <video/samsung_fimd.h>
+#include <plat/samsung-time.h>
 
 #include "common.h"
 
@@ -233,6 +234,7 @@ static void __init mini6410_map_io(void)
 	s3c64xx_init_io(NULL, 0);
 	s3c24xx_init_clocks(12000000);
 	s3c24xx_init_uarts(mini6410_uartcfgs, ARRAY_SIZE(mini6410_uartcfgs));
+	samsung_set_timer_source(SAMSUNG_PWM3, SAMSUNG_PWM4);
 
 	/* set the LCD type */
 	tmp = __raw_readl(S3C64XX_SPCON);
@@ -356,6 +358,6 @@ MACHINE_START(MINI6410, "MINI6410")
 	.map_io		= mini6410_map_io,
 	.init_machine	= mini6410_machine_init,
 	.init_late	= s3c64xx_init_late,
-	.timer		= &s3c24xx_timer,
+	.timer		= &samsung_timer,
 	.restart	= s3c64xx_restart,
 MACHINE_END
diff --git a/arch/arm/mach-s3c64xx/mach-ncp.c b/arch/arm/mach-s3c64xx/mach-ncp.c
index e5f9a79..16a09e0 100644
--- a/arch/arm/mach-s3c64xx/mach-ncp.c
+++ b/arch/arm/mach-s3c64xx/mach-ncp.c
@@ -44,6 +44,7 @@
 #include <plat/clock.h>
 #include <plat/devs.h>
 #include <plat/cpu.h>
+#include <plat/samsung-time.h>
 
 #include "common.h"
 
@@ -88,6 +89,7 @@ static void __init ncp_map_io(void)
 	s3c64xx_init_io(ncp_iodesc, ARRAY_SIZE(ncp_iodesc));
 	s3c24xx_init_clocks(12000000);
 	s3c24xx_init_uarts(ncp_uartcfgs, ARRAY_SIZE(ncp_uartcfgs));
+	samsung_set_timer_source(SAMSUNG_PWM3, SAMSUNG_PWM4);
 }
 
 static void __init ncp_machine_init(void)
@@ -105,6 +107,6 @@ MACHINE_START(NCP, "NCP")
 	.map_io		= ncp_map_io,
 	.init_machine	= ncp_machine_init,
 	.init_late	= s3c64xx_init_late,
-	.timer		= &s3c24xx_timer,
+	.timer		= &samsung_timer,
 	.restart	= s3c64xx_restart,
 MACHINE_END
diff --git a/arch/arm/mach-s3c64xx/mach-real6410.c b/arch/arm/mach-s3c64xx/mach-real6410.c
index 7476f7c..831a27c 100644
--- a/arch/arm/mach-s3c64xx/mach-real6410.c
+++ b/arch/arm/mach-s3c64xx/mach-real6410.c
@@ -45,6 +45,7 @@
 
 #include <video/platform_lcd.h>
 #include <video/samsung_fimd.h>
+#include <plat/samsung-time.h>
 
 #include "common.h"
 
@@ -212,6 +213,7 @@ static void __init real6410_map_io(void)
 	s3c64xx_init_io(NULL, 0);
 	s3c24xx_init_clocks(12000000);
 	s3c24xx_init_uarts(real6410_uartcfgs, ARRAY_SIZE(real6410_uartcfgs));
+	samsung_set_timer_source(SAMSUNG_PWM3, SAMSUNG_PWM4);
 
 	/* set the LCD type */
 	tmp = __raw_readl(S3C64XX_SPCON);
@@ -335,6 +337,6 @@ MACHINE_START(REAL6410, "REAL6410")
 	.map_io		= real6410_map_io,
 	.init_machine	= real6410_machine_init,
 	.init_late	= s3c64xx_init_late,
-	.timer		= &s3c24xx_timer,
+	.timer		= &samsung_timer,
 	.restart	= s3c64xx_restart,
 MACHINE_END
diff --git a/arch/arm/mach-s3c64xx/mach-smartq.c b/arch/arm/mach-s3c64xx/mach-smartq.c
index c6d7390..df314f1 100644
--- a/arch/arm/mach-s3c64xx/mach-smartq.c
+++ b/arch/arm/mach-s3c64xx/mach-smartq.c
@@ -39,6 +39,7 @@
 #include <linux/platform_data/touchscreen-s3c2410.h>
 
 #include <video/platform_lcd.h>
+#include <plat/samsung-time.h>
 
 #include "common.h"
 
@@ -378,6 +379,7 @@ void __init smartq_map_io(void)
 	s3c64xx_init_io(smartq_iodesc, ARRAY_SIZE(smartq_iodesc));
 	s3c24xx_init_clocks(12000000);
 	s3c24xx_init_uarts(smartq_uartcfgs, ARRAY_SIZE(smartq_uartcfgs));
+	samsung_set_timer_source(SAMSUNG_PWM3, SAMSUNG_PWM4);
 
 	smartq_lcd_mode_set();
 }
diff --git a/arch/arm/mach-s3c64xx/mach-smartq5.c b/arch/arm/mach-s3c64xx/mach-smartq5.c
index 96d6da2..d6c0a11 100644
--- a/arch/arm/mach-s3c64xx/mach-smartq5.c
+++ b/arch/arm/mach-s3c64xx/mach-smartq5.c
@@ -29,6 +29,7 @@
 #include <plat/devs.h>
 #include <plat/fb.h>
 #include <plat/gpio-cfg.h>
+#include <plat/samsung-time.h>
 
 #include "common.h"
 #include "mach-smartq.h"
@@ -157,6 +158,6 @@ MACHINE_START(SMARTQ5, "SmartQ 5")
 	.map_io		= smartq_map_io,
 	.init_machine	= smartq5_machine_init,
 	.init_late	= s3c64xx_init_late,
-	.timer		= &s3c24xx_timer,
+	.timer		= &samsung_timer,
 	.restart	= s3c64xx_restart,
 MACHINE_END
diff --git a/arch/arm/mach-s3c64xx/mach-smartq7.c b/arch/arm/mach-s3c64xx/mach-smartq7.c
index 7d1167b..00ec516 100644
--- a/arch/arm/mach-s3c64xx/mach-smartq7.c
+++ b/arch/arm/mach-s3c64xx/mach-smartq7.c
@@ -29,6 +29,7 @@
 #include <plat/devs.h>
 #include <plat/fb.h>
 #include <plat/gpio-cfg.h>
+#include <plat/samsung-time.h>
 
 #include "common.h"
 #include "mach-smartq.h"
@@ -173,6 +174,6 @@ MACHINE_START(SMARTQ7, "SmartQ 7")
 	.map_io		= smartq_map_io,
 	.init_machine	= smartq7_machine_init,
 	.init_late	= s3c64xx_init_late,
-	.timer		= &s3c24xx_timer,
+	.timer		= &samsung_timer,
 	.restart	= s3c64xx_restart,
 MACHINE_END
diff --git a/arch/arm/mach-s3c64xx/mach-smdk6400.c b/arch/arm/mach-s3c64xx/mach-smdk6400.c
index a928fae..4382417 100644
--- a/arch/arm/mach-s3c64xx/mach-smdk6400.c
+++ b/arch/arm/mach-s3c64xx/mach-smdk6400.c
@@ -36,6 +36,7 @@
 #include <plat/devs.h>
 #include <plat/cpu.h>
 #include <linux/platform_data/i2c-s3c2410.h>
+#include <plat/samsung-time.h>
 
 #include "common.h"
 
@@ -67,6 +68,7 @@ static void __init smdk6400_map_io(void)
 	s3c64xx_init_io(smdk6400_iodesc, ARRAY_SIZE(smdk6400_iodesc));
 	s3c24xx_init_clocks(12000000);
 	s3c24xx_init_uarts(smdk6400_uartcfgs, ARRAY_SIZE(smdk6400_uartcfgs));
+	samsung_set_timer_source(SAMSUNG_PWM3, SAMSUNG_PWM4);
 }
 
 static struct platform_device *smdk6400_devices[] __initdata = {
@@ -94,6 +96,6 @@ MACHINE_START(SMDK6400, "SMDK6400")
 	.map_io		= smdk6400_map_io,
 	.init_machine	= smdk6400_machine_init,
 	.init_late	= s3c64xx_init_late,
-	.timer		= &s3c24xx_timer,
+	.timer		= &samsung_timer,
 	.restart	= s3c64xx_restart,
 MACHINE_END
diff --git a/arch/arm/mach-s3c64xx/mach-smdk6410.c b/arch/arm/mach-s3c64xx/mach-smdk6410.c
index da1a771..ab52008 100644
--- a/arch/arm/mach-s3c64xx/mach-smdk6410.c
+++ b/arch/arm/mach-s3c64xx/mach-smdk6410.c
@@ -73,6 +73,7 @@
 #include <linux/platform_data/touchscreen-s3c2410.h>
 #include <plat/keypad.h>
 #include <plat/backlight.h>
+#include <plat/samsung-time.h>
 
 #include "common.h"
 
@@ -636,6 +637,7 @@ static void __init smdk6410_map_io(void)
 	s3c64xx_init_io(smdk6410_iodesc, ARRAY_SIZE(smdk6410_iodesc));
 	s3c24xx_init_clocks(12000000);
 	s3c24xx_init_uarts(smdk6410_uartcfgs, ARRAY_SIZE(smdk6410_uartcfgs));
+	samsung_set_timer_source(SAMSUNG_PWM3, SAMSUNG_PWM4);
 
 	/* set the LCD type */
 
@@ -705,6 +707,6 @@ MACHINE_START(SMDK6410, "SMDK6410")
 	.map_io		= smdk6410_map_io,
 	.init_machine	= smdk6410_machine_init,
 	.init_late	= s3c64xx_init_late,
-	.timer		= &s3c24xx_timer,
+	.timer		= &samsung_timer,
 	.restart	= s3c64xx_restart,
 MACHINE_END
-- 
