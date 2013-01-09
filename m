From: Romain Naour <romain.naour@openwide.fr>
Subject: [PATCH 4/5 v3] Add samsung-time support for s5pc100
Date: Wed, 09 Jan 2013 23:44:13 +0100
Message-ID: <50EDF2BD.1020709@openwide.fr>
References: <50885608.1030503@openwide.fr> <201212101359.51974.heiko@sntech.de> <50CCEEE7.4090203@openwide.fr> <6825637.7rn5o5FT8e@flatron>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from zimbra3.corp.accelance.fr ([213.162.49.233]:50309 "EHLO
	zimbra3.corp.accelance.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758137Ab3AIWoP (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 9 Jan 2013 17:44:15 -0500
In-Reply-To: <6825637.7rn5o5FT8e@flatron>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>, Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, 'Sylwester Nawrocki' <sylvester.nawrocki@gmail.com>



Signed-off-by: Naour Romain <romain.naour@openwide.fr>
---
 arch/arm/Kconfig                                  | 3 ++-
 arch/arm/mach-s5pc100/Kconfig                     | 1 +
 arch/arm/mach-s5pc100/mach-smdkc100.c             | 4 +++-
 arch/arm/plat-samsung/include/plat/samsung-time.h | 2 +-
 4 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 7d0cf39..1fd5769 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -802,9 +802,10 @@ config ARCH_S5P64X0
 
 config ARCH_S5PC100
 	bool "Samsung S5PC100"
-	select ARCH_USES_GETTIMEOFFSET
 	select CLKDEV_LOOKUP
+	select CLKSRC_MMIO
 	select CPU_V7
+	select GENERIC_CLOCKEVENTS
 	select GENERIC_GPIO
 	select HAVE_CLK
 	select HAVE_S3C2410_I2C if I2C
diff --git a/arch/arm/mach-s5pc100/Kconfig b/arch/arm/mach-s5pc100/Kconfig
index 15170be..2f456a4 100644
--- a/arch/arm/mach-s5pc100/Kconfig
+++ b/arch/arm/mach-s5pc100/Kconfig
@@ -11,6 +11,7 @@ config CPU_S5PC100
 	bool
 	select S5P_EXT_INT
 	select SAMSUNG_DMADEV
+	select SAMSUNG_HRT
 	help
 	  Enable S5PC100 CPU support
 
diff --git a/arch/arm/mach-s5pc100/mach-smdkc100.c b/arch/arm/mach-s5pc100/mach-smdkc100.c
index 9abe95e..f4aeb23 100644
--- a/arch/arm/mach-s5pc100/mach-smdkc100.c
+++ b/arch/arm/mach-s5pc100/mach-smdkc100.c
@@ -52,6 +52,7 @@
 #include <linux/platform_data/touchscreen-s3c2410.h>
 #include <linux/platform_data/asoc-s3c.h>
 #include <plat/backlight.h>
+#include <plat/samsung-time.h>
 
 #include "common.h"
 
@@ -222,6 +223,7 @@ static void __init smdkc100_map_io(void)
 	s5pc100_init_io(NULL, 0);
 	s3c24xx_init_clocks(12000000);
 	s3c24xx_init_uarts(smdkc100_uartcfgs, ARRAY_SIZE(smdkc100_uartcfgs));
+	samsung_set_timer_source(SAMSUNG_PWM3, SAMSUNG_PWM4);
 }
 
 static void __init smdkc100_machine_init(void)
@@ -257,6 +259,6 @@ MACHINE_START(SMDKC100, "SMDKC100")
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
1.8.0.3
