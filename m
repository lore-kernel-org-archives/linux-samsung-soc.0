From: Romain Naour <romain.naour@openwide.fr>
Subject: [PATCH 2/5 v2] Add samsung-time support for s3c24xx
Date: Sun, 02 Dec 2012 20:44:09 +0100
Message-ID: <50BBAF89.4010006@openwide.fr>
References: <50885608.1030503@openwide.fr> <50B1887B.1090409@openwide.fr> <50B54C68.9040204@openwide.fr> <201211280057.16345.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from zimbra3.corp.accelance.fr ([213.162.49.233]:42835 "EHLO
	zimbra3.corp.accelance.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753555Ab2LBToO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 2 Dec 2012 14:44:14 -0500
In-Reply-To: <201211280057.16345.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>
Cc: tomasz.figa@gmail.com, Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, 'Sylwester Nawrocki' <sylvester.nawrocki@gmail.com>

This patch replace ARCH_USES_GETTIMEOFFSET by GENERIC_CLOCKEVENTS for s3c24xx devices.
It becomes possible to use the high-resolution timer and dynamic ticks.


Signed-off-by: Naour Romain <romain.naour@openwide.fr>

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index ade7e92..6563476 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -737,7 +737,8 @@ config ARCH_SA1100
 config ARCH_S3C24XX
 	bool "Samsung S3C24XX SoCs"
 	select ARCH_HAS_CPUFREQ
-	select ARCH_USES_GETTIMEOFFSET
+	select GENERIC_CLOCKEVENTS
+	select CLKSRC_MMIO
 	select CLKDEV_LOOKUP
 	select GENERIC_GPIO
 	select HAVE_CLK
diff --git a/arch/arm/mach-s3c24xx/Kconfig b/arch/arm/mach-s3c24xx/Kconfig
index 2b6cb5f..be2c482 100644
--- a/arch/arm/mach-s3c24xx/Kconfig
+++ b/arch/arm/mach-s3c24xx/Kconfig
@@ -21,6 +21,7 @@ config CPU_S3C2410
 	select S3C2410_CLOCK
 	select S3C2410_CPUFREQ if CPU_FREQ_S3C24XX
 	select S3C2410_PM if PM
+	select SAMSUNG_HRT
 	help
 	  Support for S3C2410 and S3C2410A family from the S3C24XX line
 	  of Samsung Mobile CPUs.
@@ -32,6 +33,7 @@ config CPU_S3C2412
 	select CPU_LLSERIAL_S3C2440
 	select S3C2412_DMA if S3C24XX_DMA
 	select S3C2412_PM if PM
+	select SAMSUNG_HRT
 	help
 	  Support for the S3C2412 and S3C2413 SoCs from the S3C24XX line
 
@@ -44,6 +46,7 @@ config CPU_S3C2416
 	select S3C2443_COMMON
 	select S3C2443_DMA if S3C24XX_DMA
 	select SAMSUNG_CLKSRC
+	select SAMSUNG_HRT
 	help
 	  Support for the S3C2416 SoC from the S3C24XX line
 
@@ -54,6 +57,7 @@ config CPU_S3C2440
 	select S3C2410_CLOCK
 	select S3C2410_PM if PM
 	select S3C2440_DMA if S3C24XX_DMA
+	select SAMSUNG_HRT
 	help
 	  Support for S3C2440 Samsung Mobile CPU based systems.
 
@@ -63,6 +67,7 @@ config CPU_S3C2442
 	select CPU_LLSERIAL_S3C2440
 	select S3C2410_CLOCK
 	select S3C2410_PM if PM
+	select SAMSUNG_HRT
 	help
 	  Support for S3C2442 Samsung Mobile CPU based systems.
 
@@ -78,6 +83,7 @@ config CPU_S3C2443
 	select S3C2443_COMMON
 	select S3C2443_DMA if S3C24XX_DMA
 	select SAMSUNG_CLKSRC
+	select SAMSUNG_HRT
 	help
 	  Support for the S3C2443 SoC from the S3C24XX line
 
diff --git a/arch/arm/mach-s3c24xx/mach-amlm5900.c b/arch/arm/mach-s3c24xx/mach-amlm5900.c
index f4ad99c..84c9bb0 100644
--- a/arch/arm/mach-s3c24xx/mach-amlm5900.c
+++ b/arch/arm/mach-s3c24xx/mach-amlm5900.c
@@ -63,6 +63,8 @@
 #include <linux/mtd/map.h>
 #include <linux/mtd/physmap.h>
 
+#include <plat/samsung-time.h>
+
 #include "common.h"
 
 static struct resource amlm5900_nor_resource =
@@ -160,6 +162,7 @@ static void __init amlm5900_map_io(void)
 	s3c24xx_init_io(amlm5900_iodesc, ARRAY_SIZE(amlm5900_iodesc));
 	s3c24xx_init_clocks(0);
 	s3c24xx_init_uarts(amlm5900_uartcfgs, ARRAY_SIZE(amlm5900_uartcfgs));
+	samsung_set_timer_source(SAMSUNG_PWM3, SAMSUNG_PWM4);
 }
 
 #ifdef CONFIG_FB_S3C2410
@@ -237,6 +240,6 @@ MACHINE_START(AML_M5900, "AML_M5900")
 	.map_io		= amlm5900_map_io,
 	.init_irq	= s3c24xx_init_irq,
 	.init_machine	= amlm5900_init,
-	.timer		= &s3c24xx_timer,
+	.timer		= &samsung_timer,
 	.restart	= s3c2410_restart,
 MACHINE_END
diff --git a/arch/arm/mach-s3c24xx/mach-anubis.c b/arch/arm/mach-s3c24xx/mach-anubis.c
index 1ee8c46..65ba844 100644
--- a/arch/arm/mach-s3c24xx/mach-anubis.c
+++ b/arch/arm/mach-s3c24xx/mach-anubis.c
@@ -54,6 +54,7 @@
 #include <plat/devs.h>
 #include <plat/cpu.h>
 #include <linux/platform_data/asoc-s3c24xx_simtec.h>
+#include <plat/samsung-time.h>
 
 #include "simtec.h"
 #include "common.h"
@@ -414,6 +415,7 @@ static void __init anubis_map_io(void)
 	s3c24xx_init_io(anubis_iodesc, ARRAY_SIZE(anubis_iodesc));
 	s3c24xx_init_clocks(0);
 	s3c24xx_init_uarts(anubis_uartcfgs, ARRAY_SIZE(anubis_uartcfgs));
+	samsung_set_timer_source(SAMSUNG_PWM3, SAMSUNG_PWM4);
 
 	/* check for the newer revision boards with large page nand */
 
@@ -448,6 +450,6 @@ MACHINE_START(ANUBIS, "Simtec-Anubis")
 	.map_io		= anubis_map_io,
 	.init_machine	= anubis_init,
 	.init_irq	= s3c24xx_init_irq,
-	.timer		= &s3c24xx_timer,
+	.timer		= &samsung_timer,
 	.restart	= s3c244x_restart,
 MACHINE_END
diff --git a/arch/arm/mach-s3c24xx/mach-at2440evb.c b/arch/arm/mach-s3c24xx/mach-at2440evb.c
index 00381fe..d7eb641 100644
--- a/arch/arm/mach-s3c24xx/mach-at2440evb.c
+++ b/arch/arm/mach-s3c24xx/mach-at2440evb.c
@@ -48,6 +48,7 @@
 #include <plat/devs.h>
 #include <plat/cpu.h>
 #include <linux/platform_data/mmc-s3cmci.h>
+#include <plat/samsung-time.h>
 
 #include "common.h"
 
@@ -192,6 +193,7 @@ static void __init at2440evb_map_io(void)
 	s3c24xx_init_io(at2440evb_iodesc, ARRAY_SIZE(at2440evb_iodesc));
 	s3c24xx_init_clocks(16934400);
 	s3c24xx_init_uarts(at2440evb_uartcfgs, ARRAY_SIZE(at2440evb_uartcfgs));
+	samsung_set_timer_source(SAMSUNG_PWM3, SAMSUNG_PWM4);
 }
 
 static void __init at2440evb_init(void)
@@ -210,6 +212,6 @@ MACHINE_START(AT2440EVB, "AT2440EVB")
 	.map_io		= at2440evb_map_io,
 	.init_machine	= at2440evb_init,
 	.init_irq	= s3c24xx_init_irq,
-	.timer		= &s3c24xx_timer,
+	.timer		= &samsung_timer,
 	.restart	= s3c244x_restart,
 MACHINE_END
diff --git a/arch/arm/mach-s3c24xx/mach-bast.c b/arch/arm/mach-s3c24xx/mach-bast.c
index 6a30ce7..a9c442e 100644
--- a/arch/arm/mach-s3c24xx/mach-bast.c
+++ b/arch/arm/mach-s3c24xx/mach-bast.c
@@ -63,6 +63,7 @@
 #include <plat/cpu-freq.h>
 #include <plat/gpio-cfg.h>
 #include <linux/platform_data/asoc-s3c24xx_simtec.h>
+#include <plat/samsung-time.h>
 
 #include "simtec.h"
 #include "common.h"
@@ -583,6 +584,7 @@ static void __init bast_map_io(void)
 	s3c24xx_init_io(bast_iodesc, ARRAY_SIZE(bast_iodesc));
 	s3c24xx_init_clocks(0);
 	s3c24xx_init_uarts(bast_uartcfgs, ARRAY_SIZE(bast_uartcfgs));
+	samsung_set_timer_source(SAMSUNG_PWM3, SAMSUNG_PWM4);
 }
 
 static void __init bast_init(void)
@@ -612,6 +614,6 @@ MACHINE_START(BAST, "Simtec-BAST")
 	.map_io		= bast_map_io,
 	.init_irq	= s3c24xx_init_irq,
 	.init_machine	= bast_init,
-	.timer		= &s3c24xx_timer,
+	.timer		= &samsung_timer,
 	.restart	= s3c2410_restart,
 MACHINE_END
diff --git a/arch/arm/mach-s3c24xx/mach-gta02.c b/arch/arm/mach-s3c24xx/mach-gta02.c
index 4a96346..02c6c6a 100644
--- a/arch/arm/mach-s3c24xx/mach-gta02.c
+++ b/arch/arm/mach-s3c24xx/mach-gta02.c
@@ -88,6 +88,7 @@
 #include <plat/gpio-cfg.h>
 #include <linux/platform_data/i2c-s3c2410.h>
 #include <linux/platform_data/touchscreen-s3c2410.h>
+#include <plat/samsung-time.h>
 
 #include "common.h"
 
@@ -507,6 +508,7 @@ static void __init gta02_map_io(void)
 	s3c24xx_init_io(gta02_iodesc, ARRAY_SIZE(gta02_iodesc));
 	s3c24xx_init_clocks(12000000);
 	s3c24xx_init_uarts(gta02_uartcfgs, ARRAY_SIZE(gta02_uartcfgs));
+	samsung_set_timer_source(SAMSUNG_PWM3, SAMSUNG_PWM4);
 }
 
 
@@ -596,6 +598,6 @@ MACHINE_START(NEO1973_GTA02, "GTA02")
 	.map_io		= gta02_map_io,
 	.init_irq	= s3c24xx_init_irq,
 	.init_machine	= gta02_machine_init,
-	.timer		= &s3c24xx_timer,
+	.timer		= &samsung_timer,
 	.restart	= s3c244x_restart,
 MACHINE_END
diff --git a/arch/arm/mach-s3c24xx/mach-h1940.c b/arch/arm/mach-s3c24xx/mach-h1940.c
index 63aaf07..f5d3578 100644
--- a/arch/arm/mach-s3c24xx/mach-h1940.c
+++ b/arch/arm/mach-s3c24xx/mach-h1940.c
@@ -67,6 +67,7 @@
 #include <plat/pm.h>
 #include <linux/platform_data/mmc-s3cmci.h>
 #include <linux/platform_data/touchscreen-s3c2410.h>
+#include <plat/samsung-time.h>
 
 #include <sound/uda1380.h>
 
@@ -652,6 +653,7 @@ static void __init h1940_map_io(void)
 	s3c24xx_init_io(h1940_iodesc, ARRAY_SIZE(h1940_iodesc));
 	s3c24xx_init_clocks(0);
 	s3c24xx_init_uarts(h1940_uartcfgs, ARRAY_SIZE(h1940_uartcfgs));
+	samsung_set_timer_source(SAMSUNG_PWM3, SAMSUNG_PWM4);
 
 	/* setup PM */
 
@@ -747,6 +749,6 @@ MACHINE_START(H1940, "IPAQ-H1940")
 	.reserve	= h1940_reserve,
 	.init_irq	= h1940_init_irq,
 	.init_machine	= h1940_init,
-	.timer		= &s3c24xx_timer,
+	.timer		= &samsung_timer,
 	.restart	= s3c2410_restart,
 MACHINE_END
diff --git a/arch/arm/mach-s3c24xx/mach-jive.c b/arch/arm/mach-s3c24xx/mach-jive.c
index c9954e2..01a894d 100644
--- a/arch/arm/mach-s3c24xx/mach-jive.c
+++ b/arch/arm/mach-s3c24xx/mach-jive.c
@@ -55,6 +55,7 @@
 #include <plat/cpu.h>
 #include <plat/pm.h>
 #include <linux/platform_data/usb-s3c2410_udc.h>
+#include <plat/samsung-time.h>
 
 static struct map_desc jive_iodesc[] __initdata = {
 };
@@ -506,6 +507,7 @@ static void __init jive_map_io(void)
 	s3c24xx_init_io(jive_iodesc, ARRAY_SIZE(jive_iodesc));
 	s3c24xx_init_clocks(12000000);
 	s3c24xx_init_uarts(jive_uartcfgs, ARRAY_SIZE(jive_uartcfgs));
+	samsung_set_timer_source(SAMSUNG_PWM3, SAMSUNG_PWM4);
 }
 
 static void jive_power_off(void)
@@ -661,6 +663,6 @@ MACHINE_START(JIVE, "JIVE")
 	.init_irq	= s3c24xx_init_irq,
 	.map_io		= jive_map_io,
 	.init_machine	= jive_machine_init,
-	.timer		= &s3c24xx_timer,
+	.timer		= &samsung_timer,
 	.restart	= s3c2412_restart,
 MACHINE_END
diff --git a/arch/arm/mach-s3c24xx/mach-mini2440.c b/arch/arm/mach-s3c24xx/mach-mini2440.c
index 393c0f1..a96efcd 100644
--- a/arch/arm/mach-s3c24xx/mach-mini2440.c
+++ b/arch/arm/mach-s3c24xx/mach-mini2440.c
@@ -57,6 +57,7 @@
 #include <plat/clock.h>
 #include <plat/devs.h>
 #include <plat/cpu.h>
+#include <plat/samsung-time.h>
 
 #include <sound/s3c24xx_uda134x.h>
 
@@ -527,6 +528,7 @@ static void __init mini2440_map_io(void)
 	s3c24xx_init_io(mini2440_iodesc, ARRAY_SIZE(mini2440_iodesc));
 	s3c24xx_init_clocks(12000000);
 	s3c24xx_init_uarts(mini2440_uartcfgs, ARRAY_SIZE(mini2440_uartcfgs));
+	samsung_set_timer_source(SAMSUNG_PWM3, SAMSUNG_PWM4);
 }
 
 /*
@@ -689,6 +691,6 @@ MACHINE_START(MINI2440, "MINI2440")
 	.map_io		= mini2440_map_io,
 	.init_machine	= mini2440_init,
 	.init_irq	= s3c24xx_init_irq,
-	.timer		= &s3c24xx_timer,
+	.timer		= &samsung_timer,
 	.restart	= s3c244x_restart,
 MACHINE_END
diff --git a/arch/arm/mach-s3c24xx/mach-n30.c b/arch/arm/mach-s3c24xx/mach-n30.c
index c53a9bf..f6cea03 100644
--- a/arch/arm/mach-s3c24xx/mach-n30.c
+++ b/arch/arm/mach-s3c24xx/mach-n30.c
@@ -50,6 +50,7 @@
 #include <linux/platform_data/mmc-s3cmci.h>
 #include <plat/s3c2410.h>
 #include <linux/platform_data/usb-s3c2410_udc.h>
+#include <plat/samsung-time.h>
 
 #include "common.h"
 
@@ -536,6 +537,7 @@ static void __init n30_map_io(void)
 	n30_hwinit();
 	s3c24xx_init_clocks(0);
 	s3c24xx_init_uarts(n30_uartcfgs, ARRAY_SIZE(n30_uartcfgs));
+	samsung_set_timer_source(SAMSUNG_PWM3, SAMSUNG_PWM4);
 }
 
 /* GPB3 is the line that controls the pull-up for the USB D+ line */
@@ -589,7 +591,7 @@ MACHINE_START(N30, "Acer-N30")
 				Ben Dooks <ben-linux@fluff.org>
 	*/
 	.atag_offset	= 0x100,
-	.timer		= &s3c24xx_timer,
+	.timer		= &samsung_timer,
 	.init_machine	= n30_init,
 	.init_irq	= s3c24xx_init_irq,
 	.map_io		= n30_map_io,
@@ -600,7 +602,7 @@ MACHINE_START(N35, "Acer-N35")
 	/* Maintainer: Christer Weinigel <christer@weinigel.se>
 	*/
 	.atag_offset	= 0x100,
-	.timer		= &s3c24xx_timer,
+	.timer		= &samsung_timer,
 	.init_machine	= n30_init,
 	.init_irq	= s3c24xx_init_irq,
 	.map_io		= n30_map_io,
diff --git a/arch/arm/mach-s3c24xx/mach-nexcoder.c b/arch/arm/mach-s3c24xx/mach-nexcoder.c
index a2b92b0..4db6fb3 100644
--- a/arch/arm/mach-s3c24xx/mach-nexcoder.c
+++ b/arch/arm/mach-s3c24xx/mach-nexcoder.c
@@ -46,6 +46,7 @@
 #include <plat/clock.h>
 #include <plat/devs.h>
 #include <plat/cpu.h>
+#include <plat/samsung-time.h>
 
 #include "common.h"
 
@@ -137,6 +138,7 @@ static void __init nexcoder_map_io(void)
 	s3c24xx_init_io(nexcoder_iodesc, ARRAY_SIZE(nexcoder_iodesc));
 	s3c24xx_init_clocks(0);
 	s3c24xx_init_uarts(nexcoder_uartcfgs, ARRAY_SIZE(nexcoder_uartcfgs));
+	samsung_set_timer_source(SAMSUNG_PWM3, SAMSUNG_PWM4);
 
 	nexcoder_sensorboard_init();
 }
@@ -153,6 +155,6 @@ MACHINE_START(NEXCODER_2440, "NexVision - Nexcoder 2440")
 	.map_io		= nexcoder_map_io,
 	.init_machine	= nexcoder_init,
 	.init_irq	= s3c24xx_init_irq,
-	.timer		= &s3c24xx_timer,
+	.timer		= &samsung_timer,
 	.restart	= s3c244x_restart,
 MACHINE_END
diff --git a/arch/arm/mach-s3c24xx/mach-osiris.c b/arch/arm/mach-s3c24xx/mach-osiris.c
index bb36d83..e85144e 100644
--- a/arch/arm/mach-s3c24xx/mach-osiris.c
+++ b/arch/arm/mach-s3c24xx/mach-osiris.c
@@ -53,6 +53,7 @@
 #include <plat/clock.h>
 #include <plat/devs.h>
 #include <plat/cpu.h>
+#include <plat/samsung-time.h>
 
 #include "common.h"
 
@@ -386,6 +387,7 @@ static void __init osiris_map_io(void)
 	s3c24xx_init_io(osiris_iodesc, ARRAY_SIZE(osiris_iodesc));
 	s3c24xx_init_clocks(0);
 	s3c24xx_init_uarts(osiris_uartcfgs, ARRAY_SIZE(osiris_uartcfgs));
+	samsung_set_timer_source(SAMSUNG_PWM3, SAMSUNG_PWM4);
 
 	/* check for the newer revision boards with large page nand */
 
@@ -428,6 +430,6 @@ MACHINE_START(OSIRIS, "Simtec-OSIRIS")
 	.map_io		= osiris_map_io,
 	.init_irq	= s3c24xx_init_irq,
 	.init_machine	= osiris_init,
-	.timer		= &s3c24xx_timer,
+	.timer		= &samsung_timer,
 	.restart	= s3c244x_restart,
 MACHINE_END
diff --git a/arch/arm/mach-s3c24xx/mach-otom.c b/arch/arm/mach-s3c24xx/mach-otom.c
index bca39f0..ab5f353 100644
--- a/arch/arm/mach-s3c24xx/mach-otom.c
+++ b/arch/arm/mach-s3c24xx/mach-otom.c
@@ -37,6 +37,7 @@
 #include <plat/devs.h>
 #include <linux/platform_data/i2c-s3c2410.h>
 #include <plat/cpu.h>
+#include <plat/samsung-time.h>
 
 #include "common.h"
 
@@ -104,6 +105,7 @@ static void __init otom11_map_io(void)
 	s3c24xx_init_io(otom11_iodesc, ARRAY_SIZE(otom11_iodesc));
 	s3c24xx_init_clocks(0);
 	s3c24xx_init_uarts(otom11_uartcfgs, ARRAY_SIZE(otom11_uartcfgs));
+	samsung_set_timer_source(SAMSUNG_PWM3, SAMSUNG_PWM4);
 }
 
 static void __init otom11_init(void)
@@ -118,6 +120,6 @@ MACHINE_START(OTOM, "Nex Vision - Otom 1.1")
 	.map_io		= otom11_map_io,
 	.init_machine	= otom11_init,
 	.init_irq	= s3c24xx_init_irq,
-	.timer		= &s3c24xx_timer,
+	.timer		= &samsung_timer,
 	.restart	= s3c2410_restart,
 MACHINE_END
diff --git a/arch/arm/mach-s3c24xx/mach-qt2410.c b/arch/arm/mach-s3c24xx/mach-qt2410.c
index 7b6ba13..e725554 100644
--- a/arch/arm/mach-s3c24xx/mach-qt2410.c
+++ b/arch/arm/mach-s3c24xx/mach-qt2410.c
@@ -60,6 +60,7 @@
 #include <plat/devs.h>
 #include <plat/cpu.h>
 #include <plat/pm.h>
+#include <plat/samsung-time.h>
 
 #include "common.h"
 
@@ -304,6 +305,7 @@ static void __init qt2410_map_io(void)
 	s3c24xx_init_io(qt2410_iodesc, ARRAY_SIZE(qt2410_iodesc));
 	s3c24xx_init_clocks(12*1000*1000);
 	s3c24xx_init_uarts(smdk2410_uartcfgs, ARRAY_SIZE(smdk2410_uartcfgs));
+	samsung_set_timer_source(SAMSUNG_PWM3, SAMSUNG_PWM4);
 }
 
 static void __init qt2410_machine_init(void)
@@ -343,6 +345,6 @@ MACHINE_START(QT2410, "QT2410")
 	.map_io		= qt2410_map_io,
 	.init_irq	= s3c24xx_init_irq,
 	.init_machine	= qt2410_machine_init,
-	.timer		= &s3c24xx_timer,
+	.timer		= &samsung_timer,
 	.restart	= s3c2410_restart,
 MACHINE_END
diff --git a/arch/arm/mach-s3c24xx/mach-rx1950.c b/arch/arm/mach-s3c24xx/mach-rx1950.c
index 379fde5..63fbeb1 100644
--- a/arch/arm/mach-s3c24xx/mach-rx1950.c
+++ b/arch/arm/mach-s3c24xx/mach-rx1950.c
@@ -58,6 +58,7 @@
 #include <plat/pm.h>
 #include <plat/irq.h>
 #include <linux/platform_data/touchscreen-s3c2410.h>
+#include <plat/samsung-time.h>
 
 #include <sound/uda1380.h>
 
@@ -743,6 +744,7 @@ static void __init rx1950_map_io(void)
 	s3c24xx_init_io(rx1950_iodesc, ARRAY_SIZE(rx1950_iodesc));
 	s3c24xx_init_clocks(16934000);
 	s3c24xx_init_uarts(rx1950_uartcfgs, ARRAY_SIZE(rx1950_uartcfgs));
+	samsung_set_timer_source(SAMSUNG_PWM3, SAMSUNG_PWM4);
 
 	/* setup PM */
 
@@ -815,6 +817,6 @@ MACHINE_START(RX1950, "HP iPAQ RX1950")
 	.reserve	= rx1950_reserve,
 	.init_irq = s3c24xx_init_irq,
 	.init_machine = rx1950_init_machine,
-	.timer = &s3c24xx_timer,
+	.timer = &samsung_timer,
 	.restart	= s3c244x_restart,
 MACHINE_END
diff --git a/arch/arm/mach-s3c24xx/mach-rx3715.c b/arch/arm/mach-s3c24xx/mach-rx3715.c
index dacbb9a..1b358a1 100644
--- a/arch/arm/mach-s3c24xx/mach-rx3715.c
+++ b/arch/arm/mach-s3c24xx/mach-rx3715.c
@@ -50,6 +50,7 @@
 #include <plat/devs.h>
 #include <plat/cpu.h>
 #include <plat/pm.h>
+#include <plat/samsung-time.h>
 
 #include "common.h"
 
@@ -179,6 +180,7 @@ static void __init rx3715_map_io(void)
 	s3c24xx_init_io(rx3715_iodesc, ARRAY_SIZE(rx3715_iodesc));
 	s3c24xx_init_clocks(16934000);
 	s3c24xx_init_uarts(rx3715_uartcfgs, ARRAY_SIZE(rx3715_uartcfgs));
+	samsung_set_timer_source(SAMSUNG_PWM3, SAMSUNG_PWM4);
 }
 
 /* H1940 and RX3715 need to reserve this for suspend */
@@ -212,6 +214,6 @@ MACHINE_START(RX3715, "IPAQ-RX3715")
 	.reserve	= rx3715_reserve,
 	.init_irq	= rx3715_init_irq,
 	.init_machine	= rx3715_init_machine,
-	.timer		= &s3c24xx_timer,
+	.timer		= &samsung_timer,
 	.restart	= s3c244x_restart,
 MACHINE_END
diff --git a/arch/arm/mach-s3c24xx/mach-smdk2410.c b/arch/arm/mach-s3c24xx/mach-smdk2410.c
index 82796b9..c7a18bc 100644
--- a/arch/arm/mach-s3c24xx/mach-smdk2410.c
+++ b/arch/arm/mach-s3c24xx/mach-smdk2410.c
@@ -53,6 +53,7 @@
 #include <plat/cpu.h>
 
 #include <plat/common-smdk.h>
+#include <plat/samsung-time.h>
 
 #include "common.h"
 
@@ -101,6 +102,7 @@ static void __init smdk2410_map_io(void)
 	s3c24xx_init_io(smdk2410_iodesc, ARRAY_SIZE(smdk2410_iodesc));
 	s3c24xx_init_clocks(0);
 	s3c24xx_init_uarts(smdk2410_uartcfgs, ARRAY_SIZE(smdk2410_uartcfgs));
+	samsung_set_timer_source(SAMSUNG_PWM3, SAMSUNG_PWM4);
 }
 
 static void __init smdk2410_init(void)
@@ -117,6 +119,6 @@ MACHINE_START(SMDK2410, "SMDK2410") /* @TODO: request a new identifier and switc
 	.map_io		= smdk2410_map_io,
 	.init_irq	= s3c24xx_init_irq,
 	.init_machine	= smdk2410_init,
-	.timer		= &s3c24xx_timer,
+	.timer		= &samsung_timer,
 	.restart	= s3c2410_restart,
 MACHINE_END
diff --git a/arch/arm/mach-s3c24xx/mach-smdk2413.c b/arch/arm/mach-s3c24xx/mach-smdk2413.c
index ce99fd8..c29c067 100644
--- a/arch/arm/mach-s3c24xx/mach-smdk2413.c
+++ b/arch/arm/mach-s3c24xx/mach-smdk2413.c
@@ -47,6 +47,7 @@
 #include <plat/clock.h>
 #include <plat/devs.h>
 #include <plat/cpu.h>
+#include <plat/samsung-time.h>
 
 #include <plat/common-smdk.h>
 
@@ -107,6 +108,7 @@ static void __init smdk2413_map_io(void)
 	s3c24xx_init_io(smdk2413_iodesc, ARRAY_SIZE(smdk2413_iodesc));
 	s3c24xx_init_clocks(12000000);
 	s3c24xx_init_uarts(smdk2413_uartcfgs, ARRAY_SIZE(smdk2413_uartcfgs));
+	samsung_set_timer_source(SAMSUNG_PWM3, SAMSUNG_PWM4);
 }
 
 static void __init smdk2413_machine_init(void)
@@ -133,7 +135,7 @@ MACHINE_START(S3C2413, "S3C2413")
 	.init_irq	= s3c24xx_init_irq,
 	.map_io		= smdk2413_map_io,
 	.init_machine	= smdk2413_machine_init,
-	.timer		= &s3c24xx_timer,
+	.timer		= &samsung_timer,
 	.restart	= s3c2412_restart,
 MACHINE_END
 
@@ -145,7 +147,7 @@ MACHINE_START(SMDK2412, "SMDK2412")
 	.init_irq	= s3c24xx_init_irq,
 	.map_io		= smdk2413_map_io,
 	.init_machine	= smdk2413_machine_init,
-	.timer		= &s3c24xx_timer,
+	.timer		= &samsung_timer,
 	.restart	= s3c2412_restart,
 MACHINE_END
 
@@ -157,6 +159,6 @@ MACHINE_START(SMDK2413, "SMDK2413")
 	.init_irq	= s3c24xx_init_irq,
 	.map_io		= smdk2413_map_io,
 	.init_machine	= smdk2413_machine_init,
-	.timer		= &s3c24xx_timer,
+	.timer		= &samsung_timer,
 	.restart	= s3c2412_restart,
 MACHINE_END
diff --git a/arch/arm/mach-s3c24xx/mach-smdk2416.c b/arch/arm/mach-s3c24xx/mach-smdk2416.c
index f30d7fc..2c0b7a1 100644
--- a/arch/arm/mach-s3c24xx/mach-smdk2416.c
+++ b/arch/arm/mach-s3c24xx/mach-smdk2416.c
@@ -52,6 +52,7 @@
 #include <plat/sdhci.h>
 #include <linux/platform_data/usb-s3c2410_udc.h>
 #include <linux/platform_data/s3c-hsudc.h>
+#include <plat/samsung-time.h>
 
 #include <plat/fb.h>
 
@@ -222,6 +223,7 @@ static void __init smdk2416_map_io(void)
 	s3c24xx_init_io(smdk2416_iodesc, ARRAY_SIZE(smdk2416_iodesc));
 	s3c24xx_init_clocks(12000000);
 	s3c24xx_init_uarts(smdk2416_uartcfgs, ARRAY_SIZE(smdk2416_uartcfgs));
+	samsung_set_timer_source(SAMSUNG_PWM3, SAMSUNG_PWM4);
 }
 
 static void __init smdk2416_machine_init(void)
@@ -254,6 +256,6 @@ MACHINE_START(SMDK2416, "SMDK2416")
 	.init_irq	= s3c24xx_init_irq,
 	.map_io		= smdk2416_map_io,
 	.init_machine	= smdk2416_machine_init,
-	.timer		= &s3c24xx_timer,
+	.timer		= &samsung_timer,
 	.restart	= s3c2416_restart,
 MACHINE_END
diff --git a/arch/arm/mach-s3c24xx/mach-smdk2440.c b/arch/arm/mach-s3c24xx/mach-smdk2440.c
index b7ff882..caf5c04 100644
--- a/arch/arm/mach-s3c24xx/mach-smdk2440.c
+++ b/arch/arm/mach-s3c24xx/mach-smdk2440.c
@@ -44,6 +44,7 @@
 #include <plat/clock.h>
 #include <plat/devs.h>
 #include <plat/cpu.h>
+#include <plat/samsung-time.h>
 
 #include <plat/common-smdk.h>
 
@@ -164,6 +165,7 @@ static void __init smdk2440_map_io(void)
 	s3c24xx_init_io(smdk2440_iodesc, ARRAY_SIZE(smdk2440_iodesc));
 	s3c24xx_init_clocks(16934400);
 	s3c24xx_init_uarts(smdk2440_uartcfgs, ARRAY_SIZE(smdk2440_uartcfgs));
+	samsung_set_timer_source(SAMSUNG_PWM3, SAMSUNG_PWM4);
 }
 
 static void __init smdk2440_machine_init(void)
@@ -182,6 +184,6 @@ MACHINE_START(S3C2440, "SMDK2440")
 	.init_irq	= s3c24xx_init_irq,
 	.map_io		= smdk2440_map_io,
 	.init_machine	= smdk2440_machine_init,
-	.timer		= &s3c24xx_timer,
+	.timer		= &samsung_timer,
 	.restart	= s3c244x_restart,
 MACHINE_END
diff --git a/arch/arm/mach-s3c24xx/mach-smdk2443.c b/arch/arm/mach-s3c24xx/mach-smdk2443.c
index 2568656..02fcd27 100644
--- a/arch/arm/mach-s3c24xx/mach-smdk2443.c
+++ b/arch/arm/mach-s3c24xx/mach-smdk2443.c
@@ -44,6 +44,7 @@
 #include <plat/clock.h>
 #include <plat/devs.h>
 #include <plat/cpu.h>
+#include <plat/samsung-time.h>
 
 #include <plat/common-smdk.h>
 
@@ -123,6 +124,7 @@ static void __init smdk2443_map_io(void)
 	s3c24xx_init_io(smdk2443_iodesc, ARRAY_SIZE(smdk2443_iodesc));
 	s3c24xx_init_clocks(12000000);
 	s3c24xx_init_uarts(smdk2443_uartcfgs, ARRAY_SIZE(smdk2443_uartcfgs));
+	samsung_set_timer_source(SAMSUNG_PWM3, SAMSUNG_PWM4);
 }
 
 static void __init smdk2443_machine_init(void)
@@ -144,6 +146,6 @@ MACHINE_START(SMDK2443, "SMDK2443")
 	.init_irq	= s3c24xx_init_irq,
 	.map_io		= smdk2443_map_io,
 	.init_machine	= smdk2443_machine_init,
-	.timer		= &s3c24xx_timer,
+	.timer		= &samsung_timer,
 	.restart	= s3c2443_restart,
 MACHINE_END
diff --git a/arch/arm/mach-s3c24xx/mach-tct_hammer.c b/arch/arm/mach-s3c24xx/mach-tct_hammer.c
index 495bf5c..90f43c9 100644
--- a/arch/arm/mach-s3c24xx/mach-tct_hammer.c
+++ b/arch/arm/mach-s3c24xx/mach-tct_hammer.c
@@ -53,6 +53,7 @@
 #include <linux/mtd/partitions.h>
 #include <linux/mtd/map.h>
 #include <linux/mtd/physmap.h>
+#include <plat/samsung-time.h>
 
 #include "common.h"
 
@@ -136,6 +137,7 @@ static void __init tct_hammer_map_io(void)
 	s3c24xx_init_io(tct_hammer_iodesc, ARRAY_SIZE(tct_hammer_iodesc));
 	s3c24xx_init_clocks(0);
 	s3c24xx_init_uarts(tct_hammer_uartcfgs, ARRAY_SIZE(tct_hammer_uartcfgs));
+	samsung_set_timer_source(SAMSUNG_PWM3, SAMSUNG_PWM4);
 }
 
 static void __init tct_hammer_init(void)
@@ -149,6 +151,6 @@ MACHINE_START(TCT_HAMMER, "TCT_HAMMER")
 	.map_io		= tct_hammer_map_io,
 	.init_irq	= s3c24xx_init_irq,
 	.init_machine	= tct_hammer_init,
-	.timer		= &s3c24xx_timer,
+	.timer		= &samsung_timer,
 	.restart	= s3c2410_restart,
 MACHINE_END
diff --git a/arch/arm/mach-s3c24xx/mach-vr1000.c b/arch/arm/mach-s3c24xx/mach-vr1000.c
index 14d5b12..4366c6f 100644
--- a/arch/arm/mach-s3c24xx/mach-vr1000.c
+++ b/arch/arm/mach-s3c24xx/mach-vr1000.c
@@ -50,6 +50,7 @@
 #include <plat/cpu.h>
 #include <linux/platform_data/i2c-s3c2410.h>
 #include <linux/platform_data/asoc-s3c24xx_simtec.h>
+#include <plat/samsung-time.h>
 
 #include "simtec.h"
 #include "common.h"
@@ -335,6 +336,7 @@ static void __init vr1000_map_io(void)
 	s3c24xx_init_io(vr1000_iodesc, ARRAY_SIZE(vr1000_iodesc));
 	s3c24xx_init_clocks(0);
 	s3c24xx_init_uarts(vr1000_uartcfgs, ARRAY_SIZE(vr1000_uartcfgs));
+	samsung_set_timer_source(SAMSUNG_PWM3, SAMSUNG_PWM4);
 }
 
 static void __init vr1000_init(void)
@@ -357,6 +359,6 @@ MACHINE_START(VR1000, "Thorcom-VR1000")
 	.map_io		= vr1000_map_io,
 	.init_machine	= vr1000_init,
 	.init_irq	= s3c24xx_init_irq,
-	.timer		= &s3c24xx_timer,
+	.timer		= &samsung_timer,
 	.restart	= s3c2410_restart,
 MACHINE_END
diff --git a/arch/arm/mach-s3c24xx/mach-vstms.c b/arch/arm/mach-s3c24xx/mach-vstms.c
index f1d44ae..412d858 100644
--- a/arch/arm/mach-s3c24xx/mach-vstms.c
+++ b/arch/arm/mach-s3c24xx/mach-vstms.c
@@ -47,7 +47,7 @@
 #include <plat/clock.h>
 #include <plat/devs.h>
 #include <plat/cpu.h>
-
+#include <plat/samsung-time.h>
 
 static struct map_desc vstms_iodesc[] __initdata = {
 };
@@ -144,6 +144,7 @@ static void __init vstms_map_io(void)
 	s3c24xx_init_io(vstms_iodesc, ARRAY_SIZE(vstms_iodesc));
 	s3c24xx_init_clocks(12000000);
 	s3c24xx_init_uarts(vstms_uartcfgs, ARRAY_SIZE(vstms_uartcfgs));
+	samsung_set_timer_source(SAMSUNG_PWM3, SAMSUNG_PWM4);
 }
 
 static void __init vstms_init(void)
@@ -161,6 +162,6 @@ MACHINE_START(VSTMS, "VSTMS")
 	.init_irq	= s3c24xx_init_irq,
 	.init_machine	= vstms_init,
 	.map_io		= vstms_map_io,
-	.timer		= &s3c24xx_timer,
+	.timer		= &samsung_timer,
 	.restart	= s3c2412_restart,
 MACHINE_END
diff --git a/arch/arm/plat-samsung/include/plat/cpu.h b/arch/arm/plat-samsung/include/plat/cpu.h
index ace4451..86fb5f3 100644
--- a/arch/arm/plat-samsung/include/plat/cpu.h
+++ b/arch/arm/plat-samsung/include/plat/cpu.h
@@ -184,7 +184,7 @@ extern void s3c24xx_init_uartdevs(char *name,
 				  struct s3c24xx_uart_resources *res,
 				  struct s3c2410_uartcfg *cfg, int no);
 
-/* timer for 2410/2440 */
+/* timer for s5pc100 only */
 
 struct sys_timer;
 extern struct sys_timer s3c24xx_timer;
diff --git a/arch/arm/plat-samsung/include/plat/samsung-time.h b/arch/arm/plat-samsung/include/plat/samsung-time.h
index 9d6d622..13ae4b9 100644
--- a/arch/arm/plat-samsung/include/plat/samsung-time.h
+++ b/arch/arm/plat-samsung/include/plat/samsung-time.h
@@ -30,7 +30,18 @@ struct samsung_timer_source {
 /* Be able to sleep for atleast 4 seconds (usually more) */
 #define SAMSUNG_TIMER_MIN_RANGE	4
 
+#ifdef CONFIG_ARCH_S3C24XX
+#define TCNT_MAX		0xffff
+#define TSCALER_DIV		25
+#define TDIV			50
+#define TSIZE			16
+#else
 #define TCNT_MAX		0xffffffff
+#define TSCALER_DIV		2
+#define TDIV			2
+#define TSIZE			32
+#endif
+
 #define NON_PERIODIC		0
 #define PERIODIC		1
 
diff --git a/arch/arm/plat-samsung/samsung-time.c b/arch/arm/plat-samsung/samsung-time.c
index 91773bf..6d63fca 100644
--- a/arch/arm/plat-samsung/samsung-time.c
+++ b/arch/arm/plat-samsung/samsung-time.c
@@ -2,7 +2,7 @@
  * Copyright (c) 2011 Samsung Electronics Co., Ltd.
  *		http://www.samsung.com/
  *
- * SAMSUNG - Common hr-timer support
+ * samsung - Common hr-timer support (s3c and s5p)
  *
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License version 2 as
@@ -267,8 +267,8 @@ static void __init samsung_clockevent_init(void)
 
 	tscaler = clk_get_parent(tdiv_event);
 
-	clk_set_rate(tscaler, pclk / 2);
-	clk_set_rate(tdiv_event, pclk / 2);
+	clk_set_rate(tscaler, pclk / TSCALER_DIV);
+	clk_set_rate(tdiv_event, pclk / TDIV);
 	clk_set_parent(tin_event, tdiv_event);
 
 	clock_rate = clk_get_rate(tin_event);
@@ -336,7 +336,7 @@ static void __init samsung_clocksource_init(void)
 
 	pclk = clk_get_rate(timerclk);
 
-	clk_set_rate(tdiv_source, pclk / 2);
+	clk_set_rate(tdiv_source, pclk / TDIV);
 	clk_set_parent(tin_source, tdiv_source);
 
 	clock_rate = clk_get_rate(tin_source);
@@ -344,10 +344,10 @@ static void __init samsung_clocksource_init(void)
 	samsung_time_setup(timer_source.source_id, TCNT_MAX);
 	samsung_time_start(timer_source.source_id, PERIODIC);
 
-	setup_sched_clock(samsung_read_sched_clock, 32, clock_rate);
+	setup_sched_clock(samsung_read_sched_clock, TSIZE, clock_rate);
 
 	if (clocksource_mmio_init(samsung_timer_reg(), "samsung_clocksource_timer",
-			clock_rate, 250, 32, clocksource_mmio_readl_down))
+			clock_rate, 250, TSIZE, clocksource_mmio_readl_down))
 		panic("samsung_clocksource_timer: can't register clocksource\n");
 }
 
-- 
