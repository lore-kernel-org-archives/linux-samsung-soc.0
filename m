From: Romain Naour <romain.naour@openwide.fr>
Subject: [PATCH 4/5 v2] Add samsung-time support for s5pc100
Date: Sun, 02 Dec 2012 20:44:19 +0100
Message-ID: <50BBAF93.2080004@openwide.fr>
References: <50885608.1030503@openwide.fr> <50B1887B.1090409@openwide.fr> <50B54C68.9040204@openwide.fr> <201211280057.16345.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from zimbra3.corp.accelance.fr ([213.162.49.233]:42857 "EHLO
	zimbra3.corp.accelance.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753555Ab2LBToV (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 2 Dec 2012 14:44:21 -0500
In-Reply-To: <201211280057.16345.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>
Cc: tomasz.figa@gmail.com, Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, 'Sylwester Nawrocki' <sylvester.nawrocki@gmail.com>

This patch replace ARCH_USES_GETTIMEOFFSET by GENERIC_CLOCKEVENTS for s5pc100 device.
It becomes possible to use the high-resolution timer and dynamic ticks.


Signed-off-by: Naour Romain <romain.naour@openwide.fr>

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 6e00aea..a8c3115 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -796,7 +796,8 @@ config ARCH_S5P64X0
 
 config ARCH_S5PC100
 	bool "Samsung S5PC100"
-	select ARCH_USES_GETTIMEOFFSET
+	select GENERIC_CLOCKEVENTS
+	select CLKSRC_MMIO
 	select CLKDEV_LOOKUP
 	select CPU_V7
 	select GENERIC_GPIO
diff --git a/arch/arm/mach-s5pc100/Kconfig b/arch/arm/mach-s5pc100/Kconfig
index 15170be..3861d5e 100644
--- a/arch/arm/mach-s5pc100/Kconfig
+++ b/arch/arm/mach-s5pc100/Kconfig
@@ -9,6 +9,7 @@ if ARCH_S5PC100
 
 config CPU_S5PC100
 	bool
+	select SAMSUNG_HRT
 	select S5P_EXT_INT
 	select SAMSUNG_DMADEV
 	help
diff --git a/arch/arm/mach-s5pc100/mach-smdkc100.c b/arch/arm/mach-s5pc100/mach-smdkc100.c
index dba7384..c542df4 100644
--- a/arch/arm/mach-s5pc100/mach-smdkc100.c
+++ b/arch/arm/mach-s5pc100/mach-smdkc100.c
@@ -52,6 +52,7 @@
 #include <linux/platform_data/touchscreen-s3c2410.h>
 #include <linux/platform_data/asoc-s3c.h>
 #include <plat/backlight.h>
+#include <plat/samsung-time.h>
 
 #include "common.h"
 
@@ -223,6 +224,7 @@ static void __init smdkc100_map_io(void)
 	s5pc100_init_io(NULL, 0);
 	s3c24xx_init_clocks(12000000);
 	s3c24xx_init_uarts(smdkc100_uartcfgs, ARRAY_SIZE(smdkc100_uartcfgs));
+	samsung_set_timer_source(SAMSUNG_PWM3, SAMSUNG_PWM4);
 }
 
 static void __init smdkc100_machine_init(void)
@@ -258,6 +260,6 @@ MACHINE_START(SMDKC100, "SMDKC100")
 	.handle_irq	= vic_handle_irq,
 	.map_io		= smdkc100_map_io,
 	.init_machine	= smdkc100_machine_init,
-	.timer		= &s3c24xx_timer,
+	.timer		= &samsung_timer,
 	.restart	= s5pc100_restart,
 MACHINE_END
diff --git a/arch/arm/plat-samsung/include/plat/samsung-time.h b/arch/arm/plat-samsung/include/plat/samsung-time.h
index 13ae4b9..66363e8 100644
--- a/arch/arm/plat-samsung/include/plat/samsung-time.h
+++ b/arch/arm/plat-samsung/include/plat/samsung-time.h
@@ -30,7 +30,7 @@ struct samsung_timer_source {
 /* Be able to sleep for atleast 4 seconds (usually more) */
 #define SAMSUNG_TIMER_MIN_RANGE	4
 
-#ifdef CONFIG_ARCH_S3C24XX
+#if defined(CONFIG_ARCH_S3C24XX) || defined(CONFIG_ARCH_S5PC100)
 #define TCNT_MAX		0xffff
 #define TSCALER_DIV		25
 #define TDIV			50
-- 
