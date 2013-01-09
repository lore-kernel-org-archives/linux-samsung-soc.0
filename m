From: Romain Naour <romain.naour@openwide.fr>
Subject: [PATCH 2/5 v3] Add samsung-time support for s3c24xx
Date: Wed, 09 Jan 2013 23:43:56 +0100
Message-ID: <50EDF2AC.6070203@openwide.fr>
References: <50885608.1030503@openwide.fr> <201212101359.51974.heiko@sntech.de> <50CCEEE7.4090203@openwide.fr> <6825637.7rn5o5FT8e@flatron>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from zimbra3.corp.accelance.fr ([213.162.49.233]:50280 "EHLO
	zimbra3.corp.accelance.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758109Ab3AIWoA (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 9 Jan 2013 17:44:00 -0500
In-Reply-To: <6825637.7rn5o5FT8e@flatron>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>, Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, 'Sylwester Nawrocki' <sylvester.nawrocki@gmail.com>



Signed-off-by: Naour Romain <romain.naour@openwide.fr>
---
 arch/arm/Kconfig                                  |  3 ++-
 arch/arm/mach-s3c24xx/Kconfig                     |  6 ++++++
 arch/arm/mach-s3c24xx/mach-amlm5900.c             |  5 ++++-
 arch/arm/mach-s3c24xx/mach-anubis.c               |  4 +++-
 arch/arm/mach-s3c24xx/mach-at2440evb.c            |  4 +++-
 arch/arm/mach-s3c24xx/mach-bast.c                 |  4 +++-
 arch/arm/mach-s3c24xx/mach-gta02.c                |  4 +++-
 arch/arm/mach-s3c24xx/mach-h1940.c                |  5 +++--
 arch/arm/mach-s3c24xx/mach-jive.c                 |  4 +++-
 arch/arm/mach-s3c24xx/mach-mini2440.c             |  4 +++-
 arch/arm/mach-s3c24xx/mach-n30.c                  |  6 ++++--
 arch/arm/mach-s3c24xx/mach-nexcoder.c             |  4 +++-
 arch/arm/mach-s3c24xx/mach-osiris.c               |  4 +++-
 arch/arm/mach-s3c24xx/mach-otom.c                 |  4 +++-
 arch/arm/mach-s3c24xx/mach-qt2410.c               |  4 +++-
 arch/arm/mach-s3c24xx/mach-rx1950.c               |  4 +++-
 arch/arm/mach-s3c24xx/mach-rx3715.c               |  4 +++-
 arch/arm/mach-s3c24xx/mach-smdk2410.c             |  4 +++-
 arch/arm/mach-s3c24xx/mach-smdk2413.c             |  8 +++++---
 arch/arm/mach-s3c24xx/mach-smdk2416.c             |  4 +++-
 arch/arm/mach-s3c24xx/mach-smdk2440.c             |  4 +++-
 arch/arm/mach-s3c24xx/mach-smdk2443.c             |  4 +++-
 arch/arm/mach-s3c24xx/mach-tct_hammer.c           |  4 +++-
 arch/arm/mach-s3c24xx/mach-vr1000.c               |  4 +++-
 arch/arm/mach-s3c24xx/mach-vstms.c                |  5 +++--
 arch/arm/plat-samsung/include/plat/cpu.h          |  2 +-
 arch/arm/plat-samsung/include/plat/samsung-time.h | 11 +++++++++++
 arch/arm/plat-samsung/samsung-time.c              | 12 ++++++------
 28 files changed, 99 insertions(+), 36 deletions(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index f95ba14..2796959 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -743,8 +743,9 @@ config ARCH_SA1100
 config ARCH_S3C24XX
 	bool "Samsung S3C24XX SoCs"
 	select ARCH_HAS_CPUFREQ
-	select ARCH_USES_GETTIMEOFFSET
 	select CLKDEV_LOOKUP
+	select CLKSRC_MMIO
+	select GENERIC_CLOCKEVENTS
 	select GENERIC_GPIO
 	select HAVE_CLK
 	select HAVE_S3C2410_I2C if I2C
diff --git a/arch/arm/mach-s3c24xx/Kconfig b/arch/arm/mach-s3c24xx/Kconfig
index 25df14a..94d01c3 100644
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
index 113304c..8ac052c 100644
--- a/arch/arm/mach-s3c24xx/mach-anubis.c
+++ b/arch/arm/mach-s3c24xx/mach-anubis.c
@@ -50,6 +50,7 @@
 #include <plat/devs.h>
 #include <plat/cpu.h>
 #include <linux/platform_data/asoc-s3c24xx_simtec.h>
+#include <plat/samsung-time.h>
 
 #include "anubis.h"
 #include "common.h"
@@ -411,6 +412,7 @@ static void __init anubis_map_io(void)
 	s3c24xx_init_io(anubis_iodesc, ARRAY_SIZE(anubis_iodesc));
 	s3c24xx_init_clocks(0);
 	s3c24xx_init_uarts(anubis_uartcfgs, ARRAY_SIZE(anubis_uartcfgs));
+	samsung_set_timer_source(SAMSUNG_PWM3, SAMSUNG_PWM4);
 
 	/* check for the newer revision boards with large page nand */
 
@@ -445,6 +447,6 @@ MACHINE_START(ANUBIS, "Simtec-Anubis")
 	.map_io		= anubis_map_io,
 	.init_machine	= anubis_init,
 	.init_irq	= s3c24xx_init_irq,
-	.timer		= &s3c24xx_timer,
+	.timer		= &samsung_timer,
 	.restart	= s3c244x_restart,
 MACHINE_END
diff --git a/arch/arm/mach-s3c24xx/mach-at2440evb.c b/arch/arm/mach-s3c24xx/mach-at2440evb.c
index f51bbcb..0314c89 100644
--- a/arch/arm/mach-s3c24xx/mach-at2440evb.c
+++ b/arch/arm/mach-s3c24xx/mach-at2440evb.c
@@ -49,6 +49,7 @@
 #include <plat/devs.h>
 #include <plat/cpu.h>
 #include <linux/platform_data/mmc-s3cmci.h>
+#include <plat/samsung-time.h>
 
 #include "common.h"
 
@@ -193,6 +194,7 @@ static void __init at2440evb_map_io(void)
 	s3c24xx_init_io(at2440evb_iodesc, ARRAY_SIZE(at2440evb_iodesc));
 	s3c24xx_init_clocks(16934400);
 	s3c24xx_init_uarts(at2440evb_uartcfgs, ARRAY_SIZE(at2440evb_uartcfgs));
+	samsung_set_timer_source(SAMSUNG_PWM3, SAMSUNG_PWM4);
 }
 
 static void __init at2440evb_init(void)
@@ -211,6 +213,6 @@ MACHINE_START(AT2440EVB, "AT2440EVB")
 	.map_io		= at2440evb_map_io,
 	.init_machine	= at2440evb_init,
 	.init_irq	= s3c24xx_init_irq,
-	.timer		= &s3c24xx_timer,
+	.timer		= &samsung_timer,
 	.restart	= s3c244x_restart,
 MACHINE_END
diff --git a/arch/arm/mach-s3c24xx/mach-bast.c b/arch/arm/mach-s3c24xx/mach-bast.c
index 1ed29b4..bd6cba7 100644
--- a/arch/arm/mach-s3c24xx/mach-bast.c
+++ b/arch/arm/mach-s3c24xx/mach-bast.c
@@ -56,6 +56,7 @@
 #include <plat/devs.h>
 #include <plat/gpio-cfg.h>
 #include <plat/regs-serial.h>
+#include <plat/samsung-time.h>
 
 #include "bast.h"
 #include "common.h"
@@ -577,6 +578,7 @@ static void __init bast_map_io(void)
 	s3c24xx_init_io(bast_iodesc, ARRAY_SIZE(bast_iodesc));
 	s3c24xx_init_clocks(0);
 	s3c24xx_init_uarts(bast_uartcfgs, ARRAY_SIZE(bast_uartcfgs));
+	samsung_set_timer_source(SAMSUNG_PWM3, SAMSUNG_PWM4);
 }
 
 static void __init bast_init(void)
@@ -606,6 +608,6 @@ MACHINE_START(BAST, "Simtec-BAST")
 	.map_io		= bast_map_io,
 	.init_irq	= s3c24xx_init_irq,
 	.init_machine	= bast_init,
-	.timer		= &s3c24xx_timer,
+	.timer		= &samsung_timer,
 	.restart	= s3c2410_restart,
 MACHINE_END
diff --git a/arch/arm/mach-s3c24xx/mach-gta02.c b/arch/arm/mach-s3c24xx/mach-gta02.c
index 1053706..265c7d4 100644
--- a/arch/arm/mach-s3c24xx/mach-gta02.c
+++ b/arch/arm/mach-s3c24xx/mach-gta02.c
@@ -82,6 +82,7 @@
 #include <plat/gpio-cfg.h>
 #include <plat/pm.h>
 #include <plat/regs-serial.h>
+#include <plat/samsung-time.h>
 
 #include "common.h"
 #include "gta02.h"
@@ -502,6 +503,7 @@ static void __init gta02_map_io(void)
 	s3c24xx_init_io(gta02_iodesc, ARRAY_SIZE(gta02_iodesc));
 	s3c24xx_init_clocks(12000000);
 	s3c24xx_init_uarts(gta02_uartcfgs, ARRAY_SIZE(gta02_uartcfgs));
+	samsung_set_timer_source(SAMSUNG_PWM3, SAMSUNG_PWM4);
 }
 
 
@@ -590,6 +592,6 @@ MACHINE_START(NEO1973_GTA02, "GTA02")
 	.map_io		= gta02_map_io,
 	.init_irq	= s3c24xx_init_irq,
 	.init_machine	= gta02_machine_init,
-	.timer		= &s3c24xx_timer,
+	.timer		= &samsung_timer,
 	.restart	= s3c244x_restart,
 MACHINE_END
diff --git a/arch/arm/mach-s3c24xx/mach-h1940.c b/arch/arm/mach-s3c24xx/mach-h1940.c
index afc05a7..2781a62 100644
--- a/arch/arm/mach-s3c24xx/mach-h1940.c
+++ b/arch/arm/mach-s3c24xx/mach-h1940.c
@@ -62,7 +62,7 @@
 #include <plat/pll.h>
 #include <plat/pm.h>
 #include <plat/regs-serial.h>
-
+#include <plat/samsung-time.h>
 
 #include "common.h"
 #include "h1940.h"
@@ -646,6 +646,7 @@ static void __init h1940_map_io(void)
 	s3c24xx_init_io(h1940_iodesc, ARRAY_SIZE(h1940_iodesc));
 	s3c24xx_init_clocks(0);
 	s3c24xx_init_uarts(h1940_uartcfgs, ARRAY_SIZE(h1940_uartcfgs));
+	samsung_set_timer_source(SAMSUNG_PWM3, SAMSUNG_PWM4);
 
 	/* setup PM */
 
@@ -741,6 +742,6 @@ MACHINE_START(H1940, "IPAQ-H1940")
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
index a31d5b8..045b259 100644
--- a/arch/arm/mach-s3c24xx/mach-mini2440.c
+++ b/arch/arm/mach-s3c24xx/mach-mini2440.c
@@ -57,6 +57,7 @@
 #include <plat/clock.h>
 #include <plat/devs.h>
 #include <plat/cpu.h>
+#include <plat/samsung-time.h>
 
 #include <sound/s3c24xx_uda134x.h>
 
@@ -526,6 +527,7 @@ static void __init mini2440_map_io(void)
 	s3c24xx_init_io(mini2440_iodesc, ARRAY_SIZE(mini2440_iodesc));
 	s3c24xx_init_clocks(12000000);
 	s3c24xx_init_uarts(mini2440_uartcfgs, ARRAY_SIZE(mini2440_uartcfgs));
+	samsung_set_timer_source(SAMSUNG_PWM3, SAMSUNG_PWM4);
 }
 
 /*
@@ -688,6 +690,6 @@ MACHINE_START(MINI2440, "MINI2440")
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
index 1eeeee4..c9bd133 100644
--- a/arch/arm/mach-s3c24xx/mach-osiris.c
+++ b/arch/arm/mach-s3c24xx/mach-osiris.c
@@ -44,6 +44,7 @@
 #include <plat/devs.h>
 #include <plat/gpio-cfg.h>
 #include <plat/regs-serial.h>
+#include <plat/samsung-timer.h>
 
 #include <mach/hardware.h>
 #include <mach/regs-gpio.h>
@@ -383,6 +384,7 @@ static void __init osiris_map_io(void)
 	s3c24xx_init_io(osiris_iodesc, ARRAY_SIZE(osiris_iodesc));
 	s3c24xx_init_clocks(0);
 	s3c24xx_init_uarts(osiris_uartcfgs, ARRAY_SIZE(osiris_uartcfgs));
+	samsung_set_timer_source(SAMSUNG_PWM3, SAMSUNG_PWM4);
 
 	/* check for the newer revision boards with large page nand */
 
@@ -425,6 +427,6 @@ MACHINE_START(OSIRIS, "Simtec-OSIRIS")
 	.map_io		= osiris_map_io,
 	.init_irq	= s3c24xx_init_irq,
 	.init_machine	= osiris_init,
-	.timer		= &s3c24xx_timer,
+	.timer		= &samsung_timer,
 	.restart	= s3c244x_restart,
 MACHINE_END
diff --git a/arch/arm/mach-s3c24xx/mach-otom.c b/arch/arm/mach-s3c24xx/mach-otom.c
index 91d8493..f92ef9b 100644
--- a/arch/arm/mach-s3c24xx/mach-otom.c
+++ b/arch/arm/mach-s3c24xx/mach-otom.c
@@ -34,6 +34,7 @@
 #include <plat/devs.h>
 #include <plat/regs-serial.h>
 #include <plat/s3c2410.h>
+#include <plat/samsung-time.h>
 
 #include "common.h"
 #include "otom.h"
@@ -102,6 +103,7 @@ static void __init otom11_map_io(void)
 	s3c24xx_init_io(otom11_iodesc, ARRAY_SIZE(otom11_iodesc));
 	s3c24xx_init_clocks(0);
 	s3c24xx_init_uarts(otom11_uartcfgs, ARRAY_SIZE(otom11_uartcfgs));
+	samsung_set_timer_source(SAMSUNG_PWM3, SAMSUNG_PWM4);
 }
 
 static void __init otom11_init(void)
@@ -116,6 +118,6 @@ MACHINE_START(OTOM, "Nex Vision - Otom 1.1")
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
index c7db767..833cfe2 100644
--- a/arch/arm/mach-s3c24xx/mach-rx1950.c
+++ b/arch/arm/mach-s3c24xx/mach-rx1950.c
@@ -58,6 +58,7 @@
 #include <plat/pm.h>
 #include <plat/regs-iic.h>
 #include <plat/regs-serial.h>
+#include <plat/samsung-time.h>
 
 #include "common.h"
 #include "h1940.h"
@@ -741,6 +742,7 @@ static void __init rx1950_map_io(void)
 	s3c24xx_init_io(rx1950_iodesc, ARRAY_SIZE(rx1950_iodesc));
 	s3c24xx_init_clocks(16934000);
 	s3c24xx_init_uarts(rx1950_uartcfgs, ARRAY_SIZE(rx1950_uartcfgs));
+	samsung_set_timer_source(SAMSUNG_PWM3, SAMSUNG_PWM4);
 
 	/* setup PM */
 
@@ -813,6 +815,6 @@ MACHINE_START(RX1950, "HP iPAQ RX1950")
 	.reserve	= rx1950_reserve,
 	.init_irq = s3c24xx_init_irq,
 	.init_machine = rx1950_init_machine,
-	.timer = &s3c24xx_timer,
+	.timer = &samsung_timer,
 	.restart	= s3c244x_restart,
 MACHINE_END
diff --git a/arch/arm/mach-s3c24xx/mach-rx3715.c b/arch/arm/mach-s3c24xx/mach-rx3715.c
index b261dd3..cf72b44 100644
--- a/arch/arm/mach-s3c24xx/mach-rx3715.c
+++ b/arch/arm/mach-s3c24xx/mach-rx3715.c
@@ -49,6 +49,7 @@
 #include <plat/devs.h>
 #include <plat/pm.h>
 #include <plat/regs-serial.h>
+#include <plat/samsung-time.h>
 
 #include "common.h"
 #include "h1940.h"
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
index b9d5703..454d51b 100644
--- a/arch/arm/mach-s3c24xx/mach-smdk2413.c
+++ b/arch/arm/mach-s3c24xx/mach-smdk2413.c
@@ -46,6 +46,7 @@
 #include <plat/clock.h>
 #include <plat/devs.h>
 #include <plat/cpu.h>
+#include <plat/samsung-time.h>
 
 #include <plat/common-smdk.h>
 
@@ -106,6 +107,7 @@ static void __init smdk2413_map_io(void)
 	s3c24xx_init_io(smdk2413_iodesc, ARRAY_SIZE(smdk2413_iodesc));
 	s3c24xx_init_clocks(12000000);
 	s3c24xx_init_uarts(smdk2413_uartcfgs, ARRAY_SIZE(smdk2413_uartcfgs));
+	samsung_set_timer_source(SAMSUNG_PWM3, SAMSUNG_PWM4);
 }
 
 static void __init smdk2413_machine_init(void)
@@ -132,7 +134,7 @@ MACHINE_START(S3C2413, "S3C2413")
 	.init_irq	= s3c24xx_init_irq,
 	.map_io		= smdk2413_map_io,
 	.init_machine	= smdk2413_machine_init,
-	.timer		= &s3c24xx_timer,
+	.timer		= &samsung_timer,
 	.restart	= s3c2412_restart,
 MACHINE_END
 
@@ -144,7 +146,7 @@ MACHINE_START(SMDK2412, "SMDK2412")
 	.init_irq	= s3c24xx_init_irq,
 	.map_io		= smdk2413_map_io,
 	.init_machine	= smdk2413_machine_init,
-	.timer		= &s3c24xx_timer,
+	.timer		= &samsung_timer,
 	.restart	= s3c2412_restart,
 MACHINE_END
 
@@ -156,6 +158,6 @@ MACHINE_START(SMDK2413, "SMDK2413")
 	.init_irq	= s3c24xx_init_irq,
 	.map_io		= smdk2413_map_io,
 	.init_machine	= smdk2413_machine_init,
-	.timer		= &s3c24xx_timer,
+	.timer		= &samsung_timer,
 	.restart	= s3c2412_restart,
 MACHINE_END
diff --git a/arch/arm/mach-s3c24xx/mach-smdk2416.c b/arch/arm/mach-s3c24xx/mach-smdk2416.c
index 7de4120..ed753e8 100644
--- a/arch/arm/mach-s3c24xx/mach-smdk2416.c
+++ b/arch/arm/mach-s3c24xx/mach-smdk2416.c
@@ -51,6 +51,7 @@
 #include <plat/sdhci.h>
 #include <linux/platform_data/usb-s3c2410_udc.h>
 #include <linux/platform_data/s3c-hsudc.h>
+#include <plat/samsung-time.h>
 
 #include <plat/fb.h>
 
@@ -221,6 +222,7 @@ static void __init smdk2416_map_io(void)
 	s3c24xx_init_io(smdk2416_iodesc, ARRAY_SIZE(smdk2416_iodesc));
 	s3c24xx_init_clocks(12000000);
 	s3c24xx_init_uarts(smdk2416_uartcfgs, ARRAY_SIZE(smdk2416_uartcfgs));
+	samsung_set_timer_source(SAMSUNG_PWM3, SAMSUNG_PWM4);
 }
 
 static void __init smdk2416_machine_init(void)
@@ -253,6 +255,6 @@ MACHINE_START(SMDK2416, "SMDK2416")
 	.init_irq	= s3c24xx_init_irq,
 	.map_io		= smdk2416_map_io,
 	.init_machine	= smdk2416_machine_init,
-	.timer		= &s3c24xx_timer,
+	.timer		= &samsung_timer,
 	.restart	= s3c2416_restart,
 MACHINE_END
diff --git a/arch/arm/mach-s3c24xx/mach-smdk2440.c b/arch/arm/mach-s3c24xx/mach-smdk2440.c
index 0bba786..2b56a4fd 100644
--- a/arch/arm/mach-s3c24xx/mach-smdk2440.c
+++ b/arch/arm/mach-s3c24xx/mach-smdk2440.c
@@ -43,6 +43,7 @@
 #include <plat/clock.h>
 #include <plat/devs.h>
 #include <plat/cpu.h>
+#include <plat/samsung-time.h>
 
 #include <plat/common-smdk.h>
 
@@ -163,6 +164,7 @@ static void __init smdk2440_map_io(void)
 	s3c24xx_init_io(smdk2440_iodesc, ARRAY_SIZE(smdk2440_iodesc));
 	s3c24xx_init_clocks(16934400);
 	s3c24xx_init_uarts(smdk2440_uartcfgs, ARRAY_SIZE(smdk2440_uartcfgs));
+	samsung_set_timer_source(SAMSUNG_PWM3, SAMSUNG_PWM4);
 }
 
 static void __init smdk2440_machine_init(void)
@@ -181,6 +183,6 @@ MACHINE_START(S3C2440, "SMDK2440")
 	.init_irq	= s3c24xx_init_irq,
 	.map_io		= smdk2440_map_io,
 	.init_machine	= smdk2440_machine_init,
-	.timer		= &s3c24xx_timer,
+	.timer		= &samsung_timer,
 	.restart	= s3c244x_restart,
 MACHINE_END
diff --git a/arch/arm/mach-s3c24xx/mach-smdk2443.c b/arch/arm/mach-s3c24xx/mach-smdk2443.c
index c6d1a03..cd50581 100644
--- a/arch/arm/mach-s3c24xx/mach-smdk2443.c
+++ b/arch/arm/mach-s3c24xx/mach-smdk2443.c
@@ -43,6 +43,7 @@
 #include <plat/clock.h>
 #include <plat/devs.h>
 #include <plat/cpu.h>
+#include <plat/samsung-time.h>
 
 #include <plat/common-smdk.h>
 
@@ -122,6 +123,7 @@ static void __init smdk2443_map_io(void)
 	s3c24xx_init_io(smdk2443_iodesc, ARRAY_SIZE(smdk2443_iodesc));
 	s3c24xx_init_clocks(12000000);
 	s3c24xx_init_uarts(smdk2443_uartcfgs, ARRAY_SIZE(smdk2443_uartcfgs));
+	samsung_set_timer_source(SAMSUNG_PWM3, SAMSUNG_PWM4);
 }
 
 static void __init smdk2443_machine_init(void)
@@ -143,6 +145,6 @@ MACHINE_START(SMDK2443, "SMDK2443")
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
index d4db385..d1fe2d1 100644
--- a/arch/arm/mach-s3c24xx/mach-vr1000.c
+++ b/arch/arm/mach-s3c24xx/mach-vr1000.c
@@ -45,6 +45,7 @@
 #include <plat/cpu.h>
 #include <plat/devs.h>
 #include <plat/regs-serial.h>
+#include <plat/samsung-time.h>
 
 #include "bast.h"
 #include "common.h"
@@ -332,6 +333,7 @@ static void __init vr1000_map_io(void)
 	s3c24xx_init_io(vr1000_iodesc, ARRAY_SIZE(vr1000_iodesc));
 	s3c24xx_init_clocks(0);
 	s3c24xx_init_uarts(vr1000_uartcfgs, ARRAY_SIZE(vr1000_uartcfgs));
+	samsung_set_timer_source(SAMSUNG_PWM3, SAMSUNG_PWM4);
 }
 
 static void __init vr1000_init(void)
@@ -354,6 +356,6 @@ MACHINE_START(VR1000, "Thorcom-VR1000")
 	.map_io		= vr1000_map_io,
 	.init_machine	= vr1000_init,
 	.init_irq	= s3c24xx_init_irq,
-	.timer		= &s3c24xx_timer,
+	.timer		= &samsung_timer,
 	.restart	= s3c2410_restart,
 MACHINE_END
diff --git a/arch/arm/mach-s3c24xx/mach-vstms.c b/arch/arm/mach-s3c24xx/mach-vstms.c
index eef559c..0ad2f74 100644
--- a/arch/arm/mach-s3c24xx/mach-vstms.c
+++ b/arch/arm/mach-s3c24xx/mach-vstms.c
@@ -46,7 +46,7 @@
 #include <plat/clock.h>
 #include <plat/devs.h>
 #include <plat/cpu.h>
-
+#include <plat/samsung-time.h>
 
 static struct map_desc vstms_iodesc[] __initdata = {
 };
@@ -143,6 +143,7 @@ static void __init vstms_map_io(void)
 	s3c24xx_init_io(vstms_iodesc, ARRAY_SIZE(vstms_iodesc));
 	s3c24xx_init_clocks(12000000);
 	s3c24xx_init_uarts(vstms_uartcfgs, ARRAY_SIZE(vstms_uartcfgs));
+	samsung_set_timer_source(SAMSUNG_PWM3, SAMSUNG_PWM4);
 }
 
 static void __init vstms_init(void)
@@ -160,6 +161,6 @@ MACHINE_START(VSTMS, "VSTMS")
 	.init_irq	= s3c24xx_init_irq,
 	.init_machine	= vstms_init,
 	.map_io		= vstms_map_io,
-	.timer		= &s3c24xx_timer,
+	.timer		= &samsung_timer,
 	.restart	= s3c2412_restart,
 MACHINE_END
diff --git a/arch/arm/plat-samsung/include/plat/cpu.h b/arch/arm/plat-samsung/include/plat/cpu.h
index b69e11d..d585e70 100644
--- a/arch/arm/plat-samsung/include/plat/cpu.h
+++ b/arch/arm/plat-samsung/include/plat/cpu.h
@@ -192,7 +192,7 @@ extern void s3c24xx_init_uartdevs(char *name,
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
1.8.0.3
