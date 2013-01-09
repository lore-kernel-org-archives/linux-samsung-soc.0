From: Romain Naour <romain.naour@openwide.fr>
Subject: [PATCH 1/5 v3] Rename s5p-time to samsung-time
Date: Wed, 09 Jan 2013 23:43:46 +0100
Message-ID: <50EDF2A2.5020700@openwide.fr>
References: <50885608.1030503@openwide.fr> <201212101359.51974.heiko@sntech.de> <50CCEEE7.4090203@openwide.fr> <6825637.7rn5o5FT8e@flatron>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from zimbra3.corp.accelance.fr ([213.162.49.233]:50271 "EHLO
	zimbra3.corp.accelance.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758109Ab3AIWnt (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 9 Jan 2013 17:43:49 -0500
In-Reply-To: <6825637.7rn5o5FT8e@flatron>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>, Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, 'Sylwester Nawrocki' <sylvester.nawrocki@gmail.com>



Signed-off-by: Naour Romain <romain.naour@openwide.fr>
---
 arch/arm/mach-exynos/Kconfig                       |   2 +-
 arch/arm/mach-exynos/mach-universal_c210.c         |   6 +-
 arch/arm/mach-s5p64x0/Kconfig                      |   4 +-
 arch/arm/mach-s5p64x0/mach-smdk6440.c              |   6 +-
 arch/arm/mach-s5p64x0/mach-smdk6450.c              |   6 +-
 arch/arm/mach-s5pv210/Kconfig                      |   2 +-
 arch/arm/mach-s5pv210/mach-aquila.c                |   6 +-
 arch/arm/mach-s5pv210/mach-goni.c                  |   6 +-
 arch/arm/mach-s5pv210/mach-smdkc110.c              |   6 +-
 arch/arm/mach-s5pv210/mach-smdkv210.c              |   6 +-
 arch/arm/mach-s5pv210/mach-torbreck.c              |   6 +-
 arch/arm/plat-samsung/Kconfig                      |   2 +-
 arch/arm/plat-samsung/Makefile                     |   2 +-
 arch/arm/plat-samsung/include/plat/s5p-time.h      |  40 ------
 arch/arm/plat-samsung/include/plat/samsung-time.h  |  40 ++++++
 .../plat-samsung/{s5p-time.c => samsung-time.c}    | 136 ++++++++++-----------
 16 files changed, 138 insertions(+), 138 deletions(-)
 delete mode 100644 arch/arm/plat-samsung/include/plat/s5p-time.h
 create mode 100644 arch/arm/plat-samsung/include/plat/samsung-time.h
 rename arch/arm/plat-samsung/{s5p-time.c => samsung-time.c} (70%)

diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kconfig
index e103c29..d26c9f9 100644
--- a/arch/arm/mach-exynos/Kconfig
+++ b/arch/arm/mach-exynos/Kconfig
@@ -281,8 +281,8 @@ config MACH_UNIVERSAL_C210
 	select S5P_DEV_ONENAND
 	select S5P_DEV_TV
 	select S5P_GPIO_INT
-	select S5P_HRT
 	select S5P_SETUP_MIPIPHY
+	select SAMSUNG_HRT
 	help
 	  Machine support for Samsung Mobile Universal S5PC210 Reference
 	  Board.
diff --git a/arch/arm/mach-exynos/mach-universal_c210.c b/arch/arm/mach-exynos/mach-universal_c210.c
index 9e3340f..f17fa5e 100644
--- a/arch/arm/mach-exynos/mach-universal_c210.c
+++ b/arch/arm/mach-exynos/mach-universal_c210.c
@@ -42,7 +42,7 @@
 #include <plat/mfc.h>
 #include <plat/sdhci.h>
 #include <plat/fimc-core.h>
-#include <plat/s5p-time.h>
+#include <plat/samsung-time.h>
 #include <plat/camport.h>
 
 #include <mach/map.h>
@@ -1095,7 +1095,7 @@ static void __init universal_map_io(void)
 	exynos_init_io(NULL, 0);
 	s3c24xx_init_clocks(clk_xusbxti.rate);
 	s3c24xx_init_uarts(universal_uartcfgs, ARRAY_SIZE(universal_uartcfgs));
-	s5p_set_timer_source(S5P_PWM2, S5P_PWM4);
+	samsung_set_timer_source(SAMSUNG_PWM2, SAMSUNG_PWM4);
 }
 
 static void s5p_tv_setup(void)
@@ -1154,7 +1154,7 @@ MACHINE_START(UNIVERSAL_C210, "UNIVERSAL_C210")
 	.handle_irq	= gic_handle_irq,
 	.init_machine	= universal_machine_init,
 	.init_late	= exynos_init_late,
-	.timer		= &s5p_timer,
+	.timer		= &samsung_timer,
 	.reserve        = &universal_reserve,
 	.restart	= exynos4_restart,
 MACHINE_END
diff --git a/arch/arm/mach-s5p64x0/Kconfig b/arch/arm/mach-s5p64x0/Kconfig
index e8742cb..5a707bd 100644
--- a/arch/arm/mach-s5p64x0/Kconfig
+++ b/arch/arm/mach-s5p64x0/Kconfig
@@ -9,16 +9,16 @@ if ARCH_S5P64X0
 
 config CPU_S5P6440
 	bool
-	select S5P_HRT
 	select S5P_SLEEP if PM
 	select SAMSUNG_DMADEV
+	select SAMSUNG_HRT
 	select SAMSUNG_WAKEMASK if PM
 	help
 	  Enable S5P6440 CPU support
 
 config CPU_S5P6450
 	bool
-	select S5P_HRT
+	select SAMSUNG_HRT
 	select S5P_SLEEP if PM
 	select SAMSUNG_DMADEV
 	select SAMSUNG_WAKEMASK if PM
diff --git a/arch/arm/mach-s5p64x0/mach-smdk6440.c b/arch/arm/mach-s5p64x0/mach-smdk6440.c
index 3fb4de3..ba25e7d 100644
--- a/arch/arm/mach-s5p64x0/mach-smdk6440.c
+++ b/arch/arm/mach-s5p64x0/mach-smdk6440.c
@@ -49,7 +49,7 @@
 #include <plat/pll.h>
 #include <plat/adc.h>
 #include <linux/platform_data/touchscreen-s3c2410.h>
-#include <plat/s5p-time.h>
+#include <plat/samsung-time.h>
 #include <plat/backlight.h>
 #include <plat/fb.h>
 #include <plat/sdhci.h>
@@ -230,7 +230,7 @@ static void __init smdk6440_map_io(void)
 	s5p64x0_init_io(NULL, 0);
 	s3c24xx_init_clocks(12000000);
 	s3c24xx_init_uarts(smdk6440_uartcfgs, ARRAY_SIZE(smdk6440_uartcfgs));
-	s5p_set_timer_source(S5P_PWM3, S5P_PWM4);
+	samsung_set_timer_source(SAMSUNG_PWM3, SAMSUNG_PWM4);
 }
 
 static void s5p6440_set_lcd_interface(void)
@@ -275,6 +275,6 @@ MACHINE_START(SMDK6440, "SMDK6440")
 	.handle_irq	= vic_handle_irq,
 	.map_io		= smdk6440_map_io,
 	.init_machine	= smdk6440_machine_init,
-	.timer		= &s5p_timer,
+	.timer		= &samsung_timer,
 	.restart	= s5p64x0_restart,
 MACHINE_END
diff --git a/arch/arm/mach-s5p64x0/mach-smdk6450.c b/arch/arm/mach-s5p64x0/mach-smdk6450.c
index 53a576d..f7db5a8 100644
--- a/arch/arm/mach-s5p64x0/mach-smdk6450.c
+++ b/arch/arm/mach-s5p64x0/mach-smdk6450.c
@@ -49,7 +49,7 @@
 #include <plat/pll.h>
 #include <plat/adc.h>
 #include <linux/platform_data/touchscreen-s3c2410.h>
-#include <plat/s5p-time.h>
+#include <plat/samsung-time.h>
 #include <plat/backlight.h>
 #include <plat/fb.h>
 #include <plat/sdhci.h>
@@ -249,7 +249,7 @@ static void __init smdk6450_map_io(void)
 	s5p64x0_init_io(NULL, 0);
 	s3c24xx_init_clocks(19200000);
 	s3c24xx_init_uarts(smdk6450_uartcfgs, ARRAY_SIZE(smdk6450_uartcfgs));
-	s5p_set_timer_source(S5P_PWM3, S5P_PWM4);
+	samsung_set_timer_source(SAMSUNG_PWM3, SAMSUNG_PWM4);
 }
 
 static void s5p6450_set_lcd_interface(void)
@@ -294,6 +294,6 @@ MACHINE_START(SMDK6450, "SMDK6450")
 	.handle_irq	= vic_handle_irq,
 	.map_io		= smdk6450_map_io,
 	.init_machine	= smdk6450_machine_init,
-	.timer		= &s5p_timer,
+	.timer		= &samsung_timer,
 	.restart	= s5p64x0_restart,
 MACHINE_END
diff --git a/arch/arm/mach-s5pv210/Kconfig b/arch/arm/mach-s5pv210/Kconfig
index 92ad72f..0963283 100644
--- a/arch/arm/mach-s5pv210/Kconfig
+++ b/arch/arm/mach-s5pv210/Kconfig
@@ -12,10 +12,10 @@ if ARCH_S5PV210
 config CPU_S5PV210
 	bool
 	select S5P_EXT_INT
-	select S5P_HRT
 	select S5P_PM if PM
 	select S5P_SLEEP if PM
 	select SAMSUNG_DMADEV
+	select SAMSUNG_HRT
 	help
 	  Enable S5PV210 CPU support
 
diff --git a/arch/arm/mach-s5pv210/mach-aquila.c b/arch/arm/mach-s5pv210/mach-aquila.c
index ee9fa5c..7c7d89b 100644
--- a/arch/arm/mach-s5pv210/mach-aquila.c
+++ b/arch/arm/mach-s5pv210/mach-aquila.c
@@ -39,7 +39,7 @@
 #include <plat/fb.h>
 #include <plat/fimc-core.h>
 #include <plat/sdhci.h>
-#include <plat/s5p-time.h>
+#include <plat/samsung-time.h>
 
 #include "common.h"
 
@@ -652,7 +652,7 @@ static void __init aquila_map_io(void)
 	s5pv210_init_io(NULL, 0);
 	s3c24xx_init_clocks(24000000);
 	s3c24xx_init_uarts(aquila_uartcfgs, ARRAY_SIZE(aquila_uartcfgs));
-	s5p_set_timer_source(S5P_PWM3, S5P_PWM4);
+	samsung_set_timer_source(SAMSUNG_PWM3, SAMSUNG_PWM4);
 }
 
 static void __init aquila_machine_init(void)
@@ -688,6 +688,6 @@ MACHINE_START(AQUILA, "Aquila")
 	.handle_irq	= vic_handle_irq,
 	.map_io		= aquila_map_io,
 	.init_machine	= aquila_machine_init,
-	.timer		= &s5p_timer,
+	.timer		= &samsung_timer,
 	.restart	= s5pv210_restart,
 MACHINE_END
diff --git a/arch/arm/mach-s5pv210/mach-goni.c b/arch/arm/mach-s5pv210/mach-goni.c
index c72b310..a5e738b 100644
--- a/arch/arm/mach-s5pv210/mach-goni.c
+++ b/arch/arm/mach-s5pv210/mach-goni.c
@@ -48,7 +48,7 @@
 #include <plat/keypad.h>
 #include <plat/sdhci.h>
 #include <plat/clock.h>
-#include <plat/s5p-time.h>
+#include <plat/samsung-time.h>
 #include <plat/mfc.h>
 #include <plat/camport.h>
 
@@ -909,7 +909,7 @@ static void __init goni_map_io(void)
 	s5pv210_init_io(NULL, 0);
 	s3c24xx_init_clocks(clk_xusbxti.rate);
 	s3c24xx_init_uarts(goni_uartcfgs, ARRAY_SIZE(goni_uartcfgs));
-	s5p_set_timer_source(S5P_PWM3, S5P_PWM4);
+	samsung_set_timer_source(SAMSUNG_PWM3, SAMSUNG_PWM4);
 }
 
 static void __init goni_reserve(void)
@@ -975,7 +975,7 @@ MACHINE_START(GONI, "GONI")
 	.handle_irq	= vic_handle_irq,
 	.map_io		= goni_map_io,
 	.init_machine	= goni_machine_init,
-	.timer		= &s5p_timer,
+	.timer		= &samsung_timer,
 	.reserve	= &goni_reserve,
 	.restart	= s5pv210_restart,
 MACHINE_END
diff --git a/arch/arm/mach-s5pv210/mach-smdkc110.c b/arch/arm/mach-s5pv210/mach-smdkc110.c
index f1f3bd3..817ca35 100644
--- a/arch/arm/mach-s5pv210/mach-smdkc110.c
+++ b/arch/arm/mach-s5pv210/mach-smdkc110.c
@@ -30,7 +30,7 @@
 #include <linux/platform_data/ata-samsung_cf.h>
 #include <linux/platform_data/i2c-s3c2410.h>
 #include <plat/pm.h>
-#include <plat/s5p-time.h>
+#include <plat/samsung-time.h>
 #include <plat/mfc.h>
 
 #include "common.h"
@@ -121,7 +121,7 @@ static void __init smdkc110_map_io(void)
 	s5pv210_init_io(NULL, 0);
 	s3c24xx_init_clocks(24000000);
 	s3c24xx_init_uarts(smdkv210_uartcfgs, ARRAY_SIZE(smdkv210_uartcfgs));
-	s5p_set_timer_source(S5P_PWM3, S5P_PWM4);
+	samsung_set_timer_source(SAMSUNG_PWM3, SAMSUNG_PWM4);
 }
 
 static void __init smdkc110_reserve(void)
@@ -155,7 +155,7 @@ MACHINE_START(SMDKC110, "SMDKC110")
 	.handle_irq	= vic_handle_irq,
 	.map_io		= smdkc110_map_io,
 	.init_machine	= smdkc110_machine_init,
-	.timer		= &s5p_timer,
+	.timer		= &samsung_timer,
 	.restart	= s5pv210_restart,
 	.reserve	= &smdkc110_reserve,
 MACHINE_END
diff --git a/arch/arm/mach-s5pv210/mach-smdkv210.c b/arch/arm/mach-s5pv210/mach-smdkv210.c
index 6bc8404..cbab8c5 100644
--- a/arch/arm/mach-s5pv210/mach-smdkv210.c
+++ b/arch/arm/mach-s5pv210/mach-smdkv210.c
@@ -45,7 +45,7 @@
 #include <plat/keypad.h>
 #include <plat/pm.h>
 #include <plat/fb.h>
-#include <plat/s5p-time.h>
+#include <plat/samsung-time.h>
 #include <plat/backlight.h>
 #include <plat/mfc.h>
 #include <plat/clock.h>
@@ -286,7 +286,7 @@ static void __init smdkv210_map_io(void)
 	s5pv210_init_io(NULL, 0);
 	s3c24xx_init_clocks(clk_xusbxti.rate);
 	s3c24xx_init_uarts(smdkv210_uartcfgs, ARRAY_SIZE(smdkv210_uartcfgs));
-	s5p_set_timer_source(S5P_PWM2, S5P_PWM4);
+	samsung_set_timer_source(SAMSUNG_PWM2, SAMSUNG_PWM4);
 }
 
 static void __init smdkv210_reserve(void)
@@ -331,7 +331,7 @@ MACHINE_START(SMDKV210, "SMDKV210")
 	.handle_irq	= vic_handle_irq,
 	.map_io		= smdkv210_map_io,
 	.init_machine	= smdkv210_machine_init,
-	.timer		= &s5p_timer,
+	.timer		= &samsung_timer,
 	.restart	= s5pv210_restart,
 	.reserve	= &smdkv210_reserve,
 MACHINE_END
diff --git a/arch/arm/mach-s5pv210/mach-torbreck.c b/arch/arm/mach-s5pv210/mach-torbreck.c
index 18785cb..aec668c 100644
--- a/arch/arm/mach-s5pv210/mach-torbreck.c
+++ b/arch/arm/mach-s5pv210/mach-torbreck.c
@@ -27,7 +27,7 @@
 #include <plat/devs.h>
 #include <plat/cpu.h>
 #include <linux/platform_data/i2c-s3c2410.h>
-#include <plat/s5p-time.h>
+#include <plat/samsung-time.h>
 
 #include "common.h"
 
@@ -107,7 +107,7 @@ static void __init torbreck_map_io(void)
 	s5pv210_init_io(NULL, 0);
 	s3c24xx_init_clocks(24000000);
 	s3c24xx_init_uarts(torbreck_uartcfgs, ARRAY_SIZE(torbreck_uartcfgs));
-	s5p_set_timer_source(S5P_PWM3, S5P_PWM4);
+	samsung_set_timer_source(SAMSUNG_PWM3, SAMSUNG_PWM4);
 }
 
 static void __init torbreck_machine_init(void)
@@ -132,6 +132,6 @@ MACHINE_START(TORBRECK, "TORBRECK")
 	.handle_irq	= vic_handle_irq,
 	.map_io		= torbreck_map_io,
 	.init_machine	= torbreck_machine_init,
-	.timer		= &s5p_timer,
+	.timer		= &samsung_timer,
 	.restart	= s5pv210_restart,
 MACHINE_END
diff --git a/arch/arm/plat-samsung/Kconfig b/arch/arm/plat-samsung/Kconfig
index a9d5216..b708b3e 100644
--- a/arch/arm/plat-samsung/Kconfig
+++ b/arch/arm/plat-samsung/Kconfig
@@ -70,7 +70,7 @@ config S3C_LOWLEVEL_UART_PORT
 
 # timer options
 
-config S5P_HRT
+config SAMSUNG_HRT
 	bool
 	select SAMSUNG_DEV_PWM
 	help
diff --git a/arch/arm/plat-samsung/Makefile b/arch/arm/plat-samsung/Makefile
index 3a7c64d..e1244eb 100644
--- a/arch/arm/plat-samsung/Makefile
+++ b/arch/arm/plat-samsung/Makefile
@@ -13,7 +13,7 @@ obj-				:=
 
 obj-y				+= init.o cpu.o
 obj-$(CONFIG_ARCH_USES_GETTIMEOFFSET)   += time.o
-obj-$(CONFIG_S5P_HRT) 		+= s5p-time.o
+obj-$(CONFIG_SAMSUNG_HRT) 	+= samsung-time.o
 
 obj-$(CONFIG_SAMSUNG_CLOCK)	+= clock.o
 obj-$(CONFIG_SAMSUNG_CLOCK)	+= pwm-clock.o
diff --git a/arch/arm/plat-samsung/include/plat/s5p-time.h b/arch/arm/plat-samsung/include/plat/s5p-time.h
deleted file mode 100644
index 3a70aeb..0000000
--- a/arch/arm/plat-samsung/include/plat/s5p-time.h
+++ /dev/null
@@ -1,40 +0,0 @@
-/* linux/arch/arm/plat-samsung/include/plat/s5p-time.h
- *
- * Copyright 2011 Samsung Electronics Co., Ltd.
- *		http://www.samsung.com/
- *
- * Header file for s5p time support
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
-*/
-
-#ifndef __ASM_PLAT_S5P_TIME_H
-#define __ASM_PLAT_S5P_TIME_H __FILE__
-
-/* S5P HR-Timer Clock mode */
-enum s5p_timer_mode {
-	S5P_PWM0,
-	S5P_PWM1,
-	S5P_PWM2,
-	S5P_PWM3,
-	S5P_PWM4,
-};
-
-struct s5p_timer_source {
-	unsigned int event_id;
-	unsigned int source_id;
-};
-
-/* Be able to sleep for atleast 4 seconds (usually more) */
-#define S5PTIMER_MIN_RANGE	4
-
-#define TCNT_MAX		0xffffffff
-#define NON_PERIODIC		0
-#define PERIODIC		1
-
-extern void __init s5p_set_timer_source(enum s5p_timer_mode event,
-					enum s5p_timer_mode source);
-extern	struct sys_timer s5p_timer;
-#endif /* __ASM_PLAT_S5P_TIME_H */
diff --git a/arch/arm/plat-samsung/include/plat/samsung-time.h b/arch/arm/plat-samsung/include/plat/samsung-time.h
new file mode 100644
index 0000000..9d6d622
--- /dev/null
+++ b/arch/arm/plat-samsung/include/plat/samsung-time.h
@@ -0,0 +1,40 @@
+/* linux/arch/arm/plat-samsung/include/plat/samsung-time.h
+ *
+ * Copyright 2011 Samsung Electronics Co., Ltd.
+ *		http://www.samsung.com/
+ *
+ * Header file for samsung s3c and s5p time support
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+*/
+
+#ifndef __ASM_PLAT_SAMSUNG_TIME_H
+#define __ASM_PLAT_SAMSUNG_TIME_H __FILE__
+
+/* SAMSUNG HR-Timer Clock mode */
+enum samsung_timer_mode {
+	SAMSUNG_PWM0,
+	SAMSUNG_PWM1,
+	SAMSUNG_PWM2,
+	SAMSUNG_PWM3,
+	SAMSUNG_PWM4,
+};
+
+struct samsung_timer_source {
+	unsigned int event_id;
+	unsigned int source_id;
+};
+
+/* Be able to sleep for atleast 4 seconds (usually more) */
+#define SAMSUNG_TIMER_MIN_RANGE	4
+
+#define TCNT_MAX		0xffffffff
+#define NON_PERIODIC		0
+#define PERIODIC		1
+
+extern void __init samsung_set_timer_source(enum samsung_timer_mode event,
+					enum samsung_timer_mode source);
+extern	struct sys_timer samsung_timer;
+#endif /* __ASM_PLAT_SAMSUNG_TIME_H */
diff --git a/arch/arm/plat-samsung/s5p-time.c b/arch/arm/plat-samsung/samsung-time.c
similarity index 70%
rename from arch/arm/plat-samsung/s5p-time.c
rename to arch/arm/plat-samsung/samsung-time.c
index 028b6e8..91773bf 100644
--- a/arch/arm/plat-samsung/s5p-time.c
+++ b/arch/arm/plat-samsung/samsung-time.c
@@ -2,7 +2,7 @@
  * Copyright (c) 2011 Samsung Electronics Co., Ltd.
  *		http://www.samsung.com/
  *
- * S5P - Common hr-timer support
+ * SAMSUNG - Common hr-timer support
  *
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License version 2 as
@@ -25,41 +25,41 @@
 #include <mach/map.h>
 #include <plat/devs.h>
 #include <plat/regs-timer.h>
-#include <plat/s5p-time.h>
+#include <plat/samsung-time.h>
 
 static struct clk *tin_event;
 static struct clk *tin_source;
 static struct clk *tdiv_event;
 static struct clk *tdiv_source;
 static struct clk *timerclk;
-static struct s5p_timer_source timer_source;
+static struct samsung_timer_source timer_source;
 static unsigned long clock_count_per_tick;
-static void s5p_timer_resume(void);
+static void samsung_timer_resume(void);
 
-static void s5p_time_stop(enum s5p_timer_mode mode)
+static void samsung_time_stop(enum samsung_timer_mode mode)
 {
 	unsigned long tcon;
 
 	tcon = __raw_readl(S3C2410_TCON);
 
 	switch (mode) {
-	case S5P_PWM0:
+	case SAMSUNG_PWM0:
 		tcon &= ~S3C2410_TCON_T0START;
 		break;
 
-	case S5P_PWM1:
+	case SAMSUNG_PWM1:
 		tcon &= ~S3C2410_TCON_T1START;
 		break;
 
-	case S5P_PWM2:
+	case SAMSUNG_PWM2:
 		tcon &= ~S3C2410_TCON_T2START;
 		break;
 
-	case S5P_PWM3:
+	case SAMSUNG_PWM3:
 		tcon &= ~S3C2410_TCON_T3START;
 		break;
 
-	case S5P_PWM4:
+	case SAMSUNG_PWM4:
 		tcon &= ~S3C2410_TCON_T4START;
 		break;
 
@@ -70,7 +70,7 @@ static void s5p_time_stop(enum s5p_timer_mode mode)
 	__raw_writel(tcon, S3C2410_TCON);
 }
 
-static void s5p_time_setup(enum s5p_timer_mode mode, unsigned long tcnt)
+static void samsung_time_setup(enum samsung_timer_mode mode, unsigned long tcnt)
 {
 	unsigned long tcon;
 
@@ -79,27 +79,27 @@ static void s5p_time_setup(enum s5p_timer_mode mode, unsigned long tcnt)
 	tcnt--;
 
 	switch (mode) {
-	case S5P_PWM0:
+	case SAMSUNG_PWM0:
 		tcon &= ~(0x0f << 0);
 		tcon |= S3C2410_TCON_T0MANUALUPD;
 		break;
 
-	case S5P_PWM1:
+	case SAMSUNG_PWM1:
 		tcon &= ~(0x0f << 8);
 		tcon |= S3C2410_TCON_T1MANUALUPD;
 		break;
 
-	case S5P_PWM2:
+	case SAMSUNG_PWM2:
 		tcon &= ~(0x0f << 12);
 		tcon |= S3C2410_TCON_T2MANUALUPD;
 		break;
 
-	case S5P_PWM3:
+	case SAMSUNG_PWM3:
 		tcon &= ~(0x0f << 16);
 		tcon |= S3C2410_TCON_T3MANUALUPD;
 		break;
 
-	case S5P_PWM4:
+	case SAMSUNG_PWM4:
 		tcon &= ~(0x07 << 20);
 		tcon |= S3C2410_TCON_T4MANUALUPD;
 		break;
@@ -114,14 +114,14 @@ static void s5p_time_setup(enum s5p_timer_mode mode, unsigned long tcnt)
 	__raw_writel(tcon, S3C2410_TCON);
 }
 
-static void s5p_time_start(enum s5p_timer_mode mode, bool periodic)
+static void samsung_time_start(enum samsung_timer_mode mode, bool periodic)
 {
 	unsigned long tcon;
 
 	tcon  = __raw_readl(S3C2410_TCON);
 
 	switch (mode) {
-	case S5P_PWM0:
+	case SAMSUNG_PWM0:
 		tcon |= S3C2410_TCON_T0START;
 		tcon &= ~S3C2410_TCON_T0MANUALUPD;
 
@@ -131,7 +131,7 @@ static void s5p_time_start(enum s5p_timer_mode mode, bool periodic)
 			tcon &= ~S3C2410_TCON_T0RELOAD;
 		break;
 
-	case S5P_PWM1:
+	case SAMSUNG_PWM1:
 		tcon |= S3C2410_TCON_T1START;
 		tcon &= ~S3C2410_TCON_T1MANUALUPD;
 
@@ -141,7 +141,7 @@ static void s5p_time_start(enum s5p_timer_mode mode, bool periodic)
 			tcon &= ~S3C2410_TCON_T1RELOAD;
 		break;
 
-	case S5P_PWM2:
+	case SAMSUNG_PWM2:
 		tcon |= S3C2410_TCON_T2START;
 		tcon &= ~S3C2410_TCON_T2MANUALUPD;
 
@@ -151,7 +151,7 @@ static void s5p_time_start(enum s5p_timer_mode mode, bool periodic)
 			tcon &= ~S3C2410_TCON_T2RELOAD;
 		break;
 
-	case S5P_PWM3:
+	case SAMSUNG_PWM3:
 		tcon |= S3C2410_TCON_T3START;
 		tcon &= ~S3C2410_TCON_T3MANUALUPD;
 
@@ -161,7 +161,7 @@ static void s5p_time_start(enum s5p_timer_mode mode, bool periodic)
 			tcon &= ~S3C2410_TCON_T3RELOAD;
 		break;
 
-	case S5P_PWM4:
+	case SAMSUNG_PWM4:
 		tcon |= S3C2410_TCON_T4START;
 		tcon &= ~S3C2410_TCON_T4MANUALUPD;
 
@@ -178,24 +178,24 @@ static void s5p_time_start(enum s5p_timer_mode mode, bool periodic)
 	__raw_writel(tcon, S3C2410_TCON);
 }
 
-static int s5p_set_next_event(unsigned long cycles,
+static int samsung_set_next_event(unsigned long cycles,
 				struct clock_event_device *evt)
 {
-	s5p_time_setup(timer_source.event_id, cycles);
-	s5p_time_start(timer_source.event_id, NON_PERIODIC);
+	samsung_time_setup(timer_source.event_id, cycles);
+	samsung_time_start(timer_source.event_id, NON_PERIODIC);
 
 	return 0;
 }
 
-static void s5p_set_mode(enum clock_event_mode mode,
+static void samsung_set_mode(enum clock_event_mode mode,
 				struct clock_event_device *evt)
 {
-	s5p_time_stop(timer_source.event_id);
+	samsung_time_stop(timer_source.event_id);
 
 	switch (mode) {
 	case CLOCK_EVT_MODE_PERIODIC:
-		s5p_time_setup(timer_source.event_id, clock_count_per_tick);
-		s5p_time_start(timer_source.event_id, PERIODIC);
+		samsung_time_setup(timer_source.event_id, clock_count_per_tick);
+		samsung_time_start(timer_source.event_id, PERIODIC);
 		break;
 
 	case CLOCK_EVT_MODE_ONESHOT:
@@ -206,24 +206,24 @@ static void s5p_set_mode(enum clock_event_mode mode,
 		break;
 
 	case CLOCK_EVT_MODE_RESUME:
-		s5p_timer_resume();
+		samsung_timer_resume();
 		break;
 	}
 }
 
-static void s5p_timer_resume(void)
+static void samsung_timer_resume(void)
 {
 	/* event timer restart */
-	s5p_time_setup(timer_source.event_id, clock_count_per_tick);
-	s5p_time_start(timer_source.event_id, PERIODIC);
+	samsung_time_setup(timer_source.event_id, clock_count_per_tick);
+	samsung_time_start(timer_source.event_id, PERIODIC);
 
 	/* source timer restart */
-	s5p_time_setup(timer_source.source_id, TCNT_MAX);
-	s5p_time_start(timer_source.source_id, PERIODIC);
+	samsung_time_setup(timer_source.source_id, TCNT_MAX);
+	samsung_time_start(timer_source.source_id, PERIODIC);
 }
 
-void __init s5p_set_timer_source(enum s5p_timer_mode event,
-				 enum s5p_timer_mode source)
+void __init samsung_set_timer_source(enum samsung_timer_mode event,
+				 enum samsung_timer_mode source)
 {
 	s3c_device_timer[event].dev.bus = &platform_bus_type;
 	s3c_device_timer[source].dev.bus = &platform_bus_type;
@@ -233,14 +233,14 @@ void __init s5p_set_timer_source(enum s5p_timer_mode event,
 }
 
 static struct clock_event_device time_event_device = {
-	.name		= "s5p_event_timer",
+	.name		= "samsung_event_timer",
 	.features	= CLOCK_EVT_FEAT_PERIODIC | CLOCK_EVT_FEAT_ONESHOT,
 	.rating		= 200,
-	.set_next_event	= s5p_set_next_event,
-	.set_mode	= s5p_set_mode,
+	.set_next_event	= samsung_set_next_event,
+	.set_mode	= samsung_set_mode,
 };
 
-static irqreturn_t s5p_clock_event_isr(int irq, void *dev_id)
+static irqreturn_t samsung_clock_event_isr(int irq, void *dev_id)
 {
 	struct clock_event_device *evt = dev_id;
 
@@ -249,14 +249,14 @@ static irqreturn_t s5p_clock_event_isr(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
-static struct irqaction s5p_clock_event_irq = {
-	.name		= "s5p_time_irq",
+static struct irqaction samsung_clock_event_irq = {
+	.name		= "samsung_time_irq",
 	.flags		= IRQF_DISABLED | IRQF_TIMER | IRQF_IRQPOLL,
-	.handler	= s5p_clock_event_isr,
+	.handler	= samsung_clock_event_isr,
 	.dev_id		= &time_event_device,
 };
 
-static void __init s5p_clockevent_init(void)
+static void __init samsung_clockevent_init(void)
 {
 	unsigned long pclk;
 	unsigned long clock_rate;
@@ -275,7 +275,7 @@ static void __init s5p_clockevent_init(void)
 	clock_count_per_tick = clock_rate / HZ;
 
 	clockevents_calc_mult_shift(&time_event_device,
-				    clock_rate, S5PTIMER_MIN_RANGE);
+				    clock_rate, SAMSUNG_TIMER_MIN_RANGE);
 	time_event_device.max_delta_ns =
 		clockevent_delta2ns(-1, &time_event_device);
 	time_event_device.min_delta_ns =
@@ -285,22 +285,22 @@ static void __init s5p_clockevent_init(void)
 	clockevents_register_device(&time_event_device);
 
 	irq_number = timer_source.event_id + IRQ_TIMER0;
-	setup_irq(irq_number, &s5p_clock_event_irq);
+	setup_irq(irq_number, &samsung_clock_event_irq);
 }
 
-static void __iomem *s5p_timer_reg(void)
+static void __iomem *samsung_timer_reg(void)
 {
 	unsigned long offset = 0;
 
 	switch (timer_source.source_id) {
-	case S5P_PWM0:
-	case S5P_PWM1:
-	case S5P_PWM2:
-	case S5P_PWM3:
+	case SAMSUNG_PWM0:
+	case SAMSUNG_PWM1:
+	case SAMSUNG_PWM2:
+	case SAMSUNG_PWM3:
 		offset = (timer_source.source_id * 0x0c) + 0x14;
 		break;
 
-	case S5P_PWM4:
+	case SAMSUNG_PWM4:
 		offset = 0x40;
 		break;
 
@@ -319,9 +319,9 @@ static void __iomem *s5p_timer_reg(void)
  * this wraps around for now, since it is just a relative time
  * stamp. (Inspired by U300 implementation.)
  */
-static u32 notrace s5p_read_sched_clock(void)
+static u32 notrace samsung_read_sched_clock(void)
 {
-	void __iomem *reg = s5p_timer_reg();
+	void __iomem *reg = samsung_timer_reg();
 
 	if (!reg)
 		return 0;
@@ -329,7 +329,7 @@ static u32 notrace s5p_read_sched_clock(void)
 	return ~__raw_readl(reg);
 }
 
-static void __init s5p_clocksource_init(void)
+static void __init samsung_clocksource_init(void)
 {
 	unsigned long pclk;
 	unsigned long clock_rate;
@@ -341,17 +341,17 @@ static void __init s5p_clocksource_init(void)
 
 	clock_rate = clk_get_rate(tin_source);
 
-	s5p_time_setup(timer_source.source_id, TCNT_MAX);
-	s5p_time_start(timer_source.source_id, PERIODIC);
+	samsung_time_setup(timer_source.source_id, TCNT_MAX);
+	samsung_time_start(timer_source.source_id, PERIODIC);
 
-	setup_sched_clock(s5p_read_sched_clock, 32, clock_rate);
+	setup_sched_clock(samsung_read_sched_clock, 32, clock_rate);
 
-	if (clocksource_mmio_init(s5p_timer_reg(), "s5p_clocksource_timer",
+	if (clocksource_mmio_init(samsung_timer_reg(), "samsung_clocksource_timer",
 			clock_rate, 250, 32, clocksource_mmio_readl_down))
-		panic("s5p_clocksource_timer: can't register clocksource\n");
+		panic("samsung_clocksource_timer: can't register clocksource\n");
 }
 
-static void __init s5p_timer_resources(void)
+static void __init samsung_timer_resources(void)
 {
 
 	unsigned long event_id = timer_source.event_id;
@@ -393,13 +393,13 @@ static void __init s5p_timer_resources(void)
 	clk_enable(tin_source);
 }
 
-static void __init s5p_timer_init(void)
+static void __init samsung_timer_init(void)
 {
-	s5p_timer_resources();
-	s5p_clockevent_init();
-	s5p_clocksource_init();
+	samsung_timer_resources();
+	samsung_clockevent_init();
+	samsung_clocksource_init();
 }
 
-struct sys_timer s5p_timer = {
-	.init		= s5p_timer_init,
+struct sys_timer samsung_timer = {
+	.init		= samsung_timer_init,
 };
-- 
1.8.0.3
