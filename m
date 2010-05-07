From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH 3/6] ARM: Samsung: Implements cfg_gpio function for Samsung Touch screen devices
Date: Fri,  7 May 2010 15:31:21 +0900
Message-ID: <1273213881-6464-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:38284 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751579Ab0EGGit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 7 May 2010 02:38:49 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, Naveen Krishna <ch.naveen@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>

From: Naveen Krishna <ch.naveen@samsung.com>

This makes the touchscreen driver s3c24xx-ts.c generic to all the Samsung SoCs.

Also modifies the H1940 machine respectively.

Signed-off-by: Naveen Krishna Ch <ch.naveen@samsung.com>
Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/mach-s3c2410/Kconfig           |    1 +
 arch/arm/mach-s3c2410/mach-h1940.c      |    1 +
 arch/arm/plat-s3c24xx/Kconfig           |    6 +++++
 arch/arm/plat-s3c24xx/Makefile          |    1 +
 arch/arm/plat-s3c24xx/setup-ts.c        |   34 +++++++++++++++++++++++++++++++
 arch/arm/plat-samsung/include/plat/ts.h |    4 +++
 drivers/input/touchscreen/Kconfig       |    1 -
 drivers/input/touchscreen/s3c2410_ts.c  |   22 ++-----------------
 8 files changed, 50 insertions(+), 20 deletions(-)
 create mode 100644 arch/arm/plat-s3c24xx/setup-ts.c

diff --git a/arch/arm/mach-s3c2410/Kconfig b/arch/arm/mach-s3c2410/Kconfig
index 5547318..460ba78 100644
--- a/arch/arm/mach-s3c2410/Kconfig
+++ b/arch/arm/mach-s3c2410/Kconfig
@@ -76,6 +76,7 @@ config ARCH_H1940
 	select PM_H1940 if PM
 	select S3C_DEV_USB_HOST
 	select S3C_DEV_NAND
+	select SAMSUNG_SETUP_TS
 	help
 	  Say Y here if you are using the HP IPAQ H1940
 
diff --git a/arch/arm/mach-s3c2410/mach-h1940.c b/arch/arm/mach-s3c2410/mach-h1940.c
index a8575a6..cc33565 100644
--- a/arch/arm/mach-s3c2410/mach-h1940.c
+++ b/arch/arm/mach-s3c2410/mach-h1940.c
@@ -145,6 +145,7 @@ static struct s3c2410_ts_mach_info h1940_ts_cfg __initdata = {
 		.delay = 10000,
 		.presc = 49,
 		.oversampling_shift = 2,
+		.cfg_gpio = s3c24xx_ts_cfg_gpio,
 };
 
 /**
diff --git a/arch/arm/plat-s3c24xx/Kconfig b/arch/arm/plat-s3c24xx/Kconfig
index 6e93ef8..ed6f294 100644
--- a/arch/arm/plat-s3c24xx/Kconfig
+++ b/arch/arm/plat-s3c24xx/Kconfig
@@ -9,6 +9,7 @@ config PLAT_S3C24XX
 	select NO_IOPORT
 	select ARCH_REQUIRE_GPIOLIB
 	select S3C_DEVICE_NAND
+	select SAMSUNG_SETUP_TS if TOUCHSCREEN_S3C2410
 	help
 	  Base platform code for any Samsung S3C24XX device
 
@@ -157,4 +158,9 @@ config S3C24XX_SIMTEC_AUDIO
 	help
 	  Add audio devices for common Simtec S3C24XX boards
 
+config SAMSUNG_SETUP_TS
+	bool
+	help
+	  Compile in platform device definition for Samsung TouchScreen.
+
 endif
diff --git a/arch/arm/plat-s3c24xx/Makefile b/arch/arm/plat-s3c24xx/Makefile
index c2237c4..0fecbc3 100644
--- a/arch/arm/plat-s3c24xx/Makefile
+++ b/arch/arm/plat-s3c24xx/Makefile
@@ -37,6 +37,7 @@ obj-$(CONFIG_S3C2410_CPUFREQ_UTILS) += s3c2410-cpufreq-utils.o
 
 # device specific setup and/or initialisation
 obj-$(CONFIG_ARCH_S3C2410)	+= setup-i2c.o
+obj-$(CONFIG_SAMSUNG_SETUP_TS)	+= setup-ts.o
 
 # SPI gpio central GPIO functions
 
diff --git a/arch/arm/plat-s3c24xx/setup-ts.c b/arch/arm/plat-s3c24xx/setup-ts.c
new file mode 100644
index 0000000..ed26386
--- /dev/null
+++ b/arch/arm/plat-s3c24xx/setup-ts.c
@@ -0,0 +1,34 @@
+/* linux/arch/arm/plat-s3c24xx/setup-ts.c
+ *
+ * Copyright (c) 2010 Samsung Electronics Co., Ltd.
+ *		http://www.samsung.com/
+ *
+ * Based on S3C24XX setup for i2c device
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#include <linux/kernel.h>
+#include <linux/gpio.h>
+
+struct platform_device; /* don't need the contents */
+
+#include <mach/hardware.h>
+#include <mach/regs-gpio.h>
+
+/**
+ * s3c24xx_ts_cfg_gpio - configure gpio for s3c2410 systems
+ *
+ * Configure the GPIO for the S3C2410 system, where we have external FETs
+ * connected to the device (later systems such as the S3C2440 integrate
+ * these into the device).
+ */
+void s3c24xx_ts_cfg_gpio(struct platform_device *dev)
+{
+	s3c2410_gpio_cfgpin(S3C2410_GPG(12), S3C2410_GPG12_XMON);
+	s3c2410_gpio_cfgpin(S3C2410_GPG(13), S3C2410_GPG13_nXPON);
+	s3c2410_gpio_cfgpin(S3C2410_GPG(14), S3C2410_GPG14_YMON);
+	s3c2410_gpio_cfgpin(S3C2410_GPG(15), S3C2410_GPG15_nYPON);
+}
diff --git a/arch/arm/plat-samsung/include/plat/ts.h b/arch/arm/plat-samsung/include/plat/ts.h
index 954b695..7568557 100644
--- a/arch/arm/plat-samsung/include/plat/ts.h
+++ b/arch/arm/plat-samsung/include/plat/ts.h
@@ -14,8 +14,12 @@ struct s3c2410_ts_mach_info {
 	int	delay;
 	int	presc;
 	int	oversampling_shift;
+	void	(*cfg_gpio)(struct platform_device *dev);
 };
 
 extern void s3c24xx_ts_set_platdata(struct s3c2410_ts_mach_info *);
 
+/* defined by architecture to configure gpio */
+extern void s3c24xx_ts_cfg_gpio(struct platform_device *dev);
+
 #endif /* __ASM_ARM_TS_H */
diff --git a/drivers/input/touchscreen/Kconfig b/drivers/input/touchscreen/Kconfig
index 8a8fa4d..a5dcdac 100644
--- a/drivers/input/touchscreen/Kconfig
+++ b/drivers/input/touchscreen/Kconfig
@@ -160,7 +160,6 @@ config TOUCHSCREEN_FUJITSU
 config TOUCHSCREEN_S3C2410
 	tristate "Samsung S3C2410 touchscreen input driver"
 	depends on ARCH_S3C2410
-	select S3C24XX_ADC
 	help
 	  Say Y here if you have the s3c2410 touchscreen.
 
diff --git a/drivers/input/touchscreen/s3c2410_ts.c b/drivers/input/touchscreen/s3c2410_ts.c
index ba4d1e8..1a70f9c 100644
--- a/drivers/input/touchscreen/s3c2410_ts.c
+++ b/drivers/input/touchscreen/s3c2410_ts.c
@@ -39,7 +39,6 @@
 #include <plat/adc.h>
 #include <plat/regs-adc.h>
 
-#include <mach/regs-gpio.h>
 #include <plat/ts.h>
 
 #define TSC_SLEEP  (S3C2410_ADCTSC_PULL_UP_DISABLE | S3C2410_ADCTSC_XY_PST(0))
@@ -89,21 +88,6 @@ struct s3c2410ts {
 static struct s3c2410ts ts;
 
 /**
- * s3c2410_ts_connect - configure gpio for s3c2410 systems
- *
- * Configure the GPIO for the S3C2410 system, where we have external FETs
- * connected to the device (later systems such as the S3C2440 integrate
- * these into the device).
-*/
-static inline void s3c2410_ts_connect(void)
-{
-	s3c2410_gpio_cfgpin(S3C2410_GPG(12), S3C2410_GPG12_XMON);
-	s3c2410_gpio_cfgpin(S3C2410_GPG(13), S3C2410_GPG13_nXPON);
-	s3c2410_gpio_cfgpin(S3C2410_GPG(14), S3C2410_GPG14_YMON);
-	s3c2410_gpio_cfgpin(S3C2410_GPG(15), S3C2410_GPG15_nYPON);
-}
-
-/**
  * get_down - return the down state of the pen
  * @data0: The data read from ADCDAT0 register.
  * @data1: The data read from ADCDAT1 register.
@@ -297,9 +281,9 @@ static int __devinit s3c2410ts_probe(struct platform_device *pdev)
 		goto err_clk;
 	}
 
-	/* Configure the touchscreen external FETs on the S3C2410 */
-	if (!platform_get_device_id(pdev)->driver_data)
-		s3c2410_ts_connect();
+	/* inititalise the gpio */
+	if (info->cfg_gpio)
+		info->cfg_gpio(to_platform_device(ts.dev));
 
 	ts.client = s3c_adc_register(pdev, s3c24xx_ts_select,
 				     s3c24xx_ts_conversion, 1);
-- 
1.6.6.1
