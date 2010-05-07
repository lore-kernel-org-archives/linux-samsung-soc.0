From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH 6/6] ARM: S5PV210: Adds touch screen Device support for S5PV210
Date: Fri,  7 May 2010 15:31:35 +0900
Message-ID: <1273213895-6564-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:38274 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751400Ab0EGGir (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 7 May 2010 02:38:47 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, Naveen Krishna <ch.naveen@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>

From: Naveen Krishna <ch.naveen@samsung.com>

Note: TSADC in S5PV210 support 2 touch screen interfaces,
Only 1 is implemented as of now.

Signed-off-by: Naveen Krishna Ch <ch.naveen@samsung.com>
Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/mach-s5pv210/Kconfig            |    2 ++
 arch/arm/mach-s5pv210/cpu.c              |    3 +++
 arch/arm/mach-s5pv210/include/mach/map.h |    3 +++
 arch/arm/mach-s5pv210/mach-smdkv210.c    |   11 +++++++++++
 drivers/input/touchscreen/Kconfig        |    2 +-
 drivers/input/touchscreen/s3c2410_ts.c   |    4 +++-
 6 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-s5pv210/Kconfig b/arch/arm/mach-s5pv210/Kconfig
index af33a1a..3870012 100644
--- a/arch/arm/mach-s5pv210/Kconfig
+++ b/arch/arm/mach-s5pv210/Kconfig
@@ -24,6 +24,8 @@ config MACH_SMDKV210
 	bool "SMDKV210"
 	select CPU_S5PV210
 	select ARCH_SPARSEMEM_ENABLE
+	select SAMSUNG_DEV_ADC
+	select SAMSUNG_DEV_TS
 	help
 	  Machine support for Samsung SMDKV210
 
diff --git a/arch/arm/mach-s5pv210/cpu.c b/arch/arm/mach-s5pv210/cpu.c
index 0e0f8fd..5f0675d 100644
--- a/arch/arm/mach-s5pv210/cpu.c
+++ b/arch/arm/mach-s5pv210/cpu.c
@@ -74,6 +74,9 @@ static void s5pv210_idle(void)
 
 void __init s5pv210_map_io(void)
 {
+	s3c_device_ts.name	= "s5pv210-ts";
+	s3c_device_adc.name	= "s3c64xx-adc";
+
 	iotable_init(s5pv210_iodesc, ARRAY_SIZE(s5pv210_iodesc));
 }
 
diff --git a/arch/arm/mach-s5pv210/include/mach/map.h b/arch/arm/mach-s5pv210/include/mach/map.h
index c22694c..29355ee 100644
--- a/arch/arm/mach-s5pv210/include/mach/map.h
+++ b/arch/arm/mach-s5pv210/include/mach/map.h
@@ -58,8 +58,11 @@
 #define S5PV210_PA_SDRAM	(0x20000000)
 #define S5P_PA_SDRAM		S5PV210_PA_SDRAM
 
+#define S5PV210_PA_ADC		(0xE1700000)
+
 /* compatibiltiy defines. */
 #define S3C_PA_UART		S5PV210_PA_UART
 #define S3C_PA_IIC		S5PV210_PA_IIC0
+#define SAMSUNG_PA_ADC		S5PV210_PA_ADC
 
 #endif /* __ASM_ARCH_MAP_H */
diff --git a/arch/arm/mach-s5pv210/mach-smdkv210.c b/arch/arm/mach-s5pv210/mach-smdkv210.c
index a278832..1440cb2 100644
--- a/arch/arm/mach-s5pv210/mach-smdkv210.c
+++ b/arch/arm/mach-s5pv210/mach-smdkv210.c
@@ -25,6 +25,8 @@
 #include <plat/s5pv210.h>
 #include <plat/devs.h>
 #include <plat/cpu.h>
+#include <plat/adc.h>
+#include <plat/ts.h>
 
 /* Following are default values for UCON, ULCON and UFCON UART registers */
 #define S5PV210_UCON_DEFAULT	(S3C2410_UCON_TXILEVEL |	\
@@ -72,6 +74,14 @@ static struct s3c2410_uartcfg smdkv210_uartcfgs[] __initdata = {
 };
 
 static struct platform_device *smdkv210_devices[] __initdata = {
+	&s3c_device_adc,
+	&s3c_device_ts,
+};
+
+static struct s3c2410_ts_mach_info s3c_ts_platform __initdata = {
+	.delay			= 10000,
+	.presc			= 49,
+	.oversampling_shift	= 2,
 };
 
 static void __init smdkv210_map_io(void)
@@ -83,6 +93,7 @@ static void __init smdkv210_map_io(void)
 
 static void __init smdkv210_machine_init(void)
 {
+	s3c24xx_ts_set_platdata(&s3c_ts_platform);
 	platform_add_devices(smdkv210_devices, ARRAY_SIZE(smdkv210_devices));
 }
 
diff --git a/drivers/input/touchscreen/Kconfig b/drivers/input/touchscreen/Kconfig
index c82c1e1..a90a5bb 100644
--- a/drivers/input/touchscreen/Kconfig
+++ b/drivers/input/touchscreen/Kconfig
@@ -159,7 +159,7 @@ config TOUCHSCREEN_FUJITSU
 
 config TOUCHSCREEN_S3C2410
 	tristate "Samsung S3C2410 touchscreen input driver"
-	depends on ARCH_S3C2410 || ARCH_S3C64XX || ARCH_S5P6440
+	depends on ARCH_S3C2410 || ARCH_S3C64XX || ARCH_S5P6440 || ARCH_S5PV210
 	select S3C_ADC
 	help
 	  Say Y here if you have the s3c2410 touchscreen.
diff --git a/drivers/input/touchscreen/s3c2410_ts.c b/drivers/input/touchscreen/s3c2410_ts.c
index 3964964..d9e597d 100644
--- a/drivers/input/touchscreen/s3c2410_ts.c
+++ b/drivers/input/touchscreen/s3c2410_ts.c
@@ -91,6 +91,7 @@ enum s3c_cpu_type {
 	TYPE_S3C2410,
 	TYPE_S3C2440,
 	TYPE_S3C64XX,	/* S3C64XX, S5P64XX Series */
+	TYPE_S5PV210,	/* S5PV210 */
 };
 
 /**
@@ -180,7 +181,7 @@ static irqreturn_t stylus_irq(int irq, void *dev_id)
 	else
 		dev_info(ts.dev, "%s: count=%d\n", __func__, ts.count);
 
-	if (platform_get_device_id(pdev)->driver_data == TYPE_S3C64XX) {
+	if (platform_get_device_id(pdev)->driver_data >= TYPE_S3C64XX) {
 		/* Clear pen down/up interrupt */
 		writel(0x0, ts.io + S3C64XX_ADCCLRINTPNDNUP);
 	}
@@ -420,6 +421,7 @@ static struct platform_device_id s3cts_driver_ids[] = {
 	{ "s3c2410-ts", TYPE_S3C2410 },
 	{ "s3c2440-ts", TYPE_S3C2440 },
 	{ "s3c64xx-ts", TYPE_S3C64XX },
+	{ "s5pv210-ts", TYPE_S5PV210 },
 	{ }
 };
 MODULE_DEVICE_TABLE(platform, s3cts_driver_ids);
-- 
1.6.6.1
