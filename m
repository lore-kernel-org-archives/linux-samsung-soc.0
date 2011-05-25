From: Tomasz Stanislawski <t.stanislaws@samsung.com>
Subject: [PATCH v4 4/9] arm: s5pv210: i2c: add controller 3 (HDMIPHY)
Date: Wed, 25 May 2011 14:29:19 +0200
Message-ID: <1306326564-21858-5-git-send-email-t.stanislaws@samsung.com>
References: <1306326564-21858-1-git-send-email-t.stanislaws@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:56432 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756719Ab1EYM3a (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 25 May 2011 08:29:30 -0400
Received: from eu_spt1 (mailout1.w1.samsung.com [210.118.77.11])
 by mailout1.w1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0LLR00BHI4157H@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 25 May 2011 13:29:29 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt1.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0LLR00CBS414JJ@spt1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 25 May 2011 13:29:28 +0100 (BST)
In-reply-to: <1306326564-21858-1-git-send-email-t.stanislaws@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: m.szyprowski@samsung.com, t.stanislaws@samsung.com, kyungmin.park@samsung.com, kgene.kim@samsung.com, ben-linux@fluff.org

Signed-off-by: Tomasz Stanislawski <t.stanislaws@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/mach-s5pv210/Kconfig                 |    7 ++++++
 arch/arm/mach-s5pv210/Makefile                |    1 +
 arch/arm/mach-s5pv210/clock.c                 |    6 +++++
 arch/arm/mach-s5pv210/cpu.c                   |    2 +
 arch/arm/mach-s5pv210/include/mach/map.h      |    2 +
 arch/arm/mach-s5pv210/setup-i2c3.c            |   27 +++++++++++++++++++++++++
 arch/arm/plat-samsung/include/plat/iic-core.h |    7 ++++++
 7 files changed, 52 insertions(+), 0 deletions(-)
 create mode 100644 arch/arm/mach-s5pv210/setup-i2c3.c

diff --git a/arch/arm/mach-s5pv210/Kconfig b/arch/arm/mach-s5pv210/Kconfig
index 37b5a97..7e73ae8 100644
--- a/arch/arm/mach-s5pv210/Kconfig
+++ b/arch/arm/mach-s5pv210/Kconfig
@@ -28,6 +28,11 @@ config S5PV210_SETUP_I2C2
 	help
 	  Common setup code for i2c bus 2.
 
+config S5PV210_SETUP_I2C3
+	bool
+	help
+	  Common setup code for i2c bus 3.
+
 config S5PV210_SETUP_IDE
 	bool
 	help
@@ -90,12 +95,14 @@ config MACH_GONI
 	select S3C_DEV_HSMMC2
 	select S3C_DEV_I2C1
 	select S3C_DEV_I2C2
+	select S3C_DEV_I2C3
 	select S3C_DEV_USB_HSOTG
 	select S5P_DEV_ONENAND
 	select SAMSUNG_DEV_KEYPAD
 	select S5PV210_SETUP_FB_24BPP
 	select S5PV210_SETUP_I2C1
 	select S5PV210_SETUP_I2C2
+	select S5PV210_SETUP_I2C3
 	select S5PV210_SETUP_KEYPAD
 	select S5PV210_SETUP_SDHCI
 	help
diff --git a/arch/arm/mach-s5pv210/Makefile b/arch/arm/mach-s5pv210/Makefile
index 11f1790..2bcf782 100644
--- a/arch/arm/mach-s5pv210/Makefile
+++ b/arch/arm/mach-s5pv210/Makefile
@@ -34,6 +34,7 @@ obj-$(CONFIG_S5PV210_SETUP_FB_24BPP)	+= setup-fb-24bpp.o
 obj-$(CONFIG_S5PV210_SETUP_FIMC)	+= setup-fimc.o
 obj-$(CONFIG_S5PV210_SETUP_I2C1) 	+= setup-i2c1.o
 obj-$(CONFIG_S5PV210_SETUP_I2C2) 	+= setup-i2c2.o
+obj-$(CONFIG_S5PV210_SETUP_I2C3) 	+= setup-i2c3.o
 obj-$(CONFIG_S5PV210_SETUP_IDE)		+= setup-ide.o
 obj-$(CONFIG_S5PV210_SETUP_KEYPAD)	+= setup-keypad.o
 obj-$(CONFIG_S5PV210_SETUP_SDHCI)       += setup-sdhci.o
diff --git a/arch/arm/mach-s5pv210/clock.c b/arch/arm/mach-s5pv210/clock.c
index 2d59949..db4eee7 100644
--- a/arch/arm/mach-s5pv210/clock.c
+++ b/arch/arm/mach-s5pv210/clock.c
@@ -431,6 +431,12 @@ static struct clk init_clocks_off[] = {
 		.enable		= s5pv210_clk_ip3_ctrl,
 		.ctrlbit	= (1<<9),
 	}, {
+		.name           = "i2c",
+		.id             = 3,
+		.parent		= &clk_pclk_psys.clk,
+		.enable         = s5pv210_clk_ip3_ctrl,
+		.ctrlbit        = (1 << 11),
+	}, {
 		.name		= "spi",
 		.id		= 0,
 		.parent		= &clk_pclk_psys.clk,
diff --git a/arch/arm/mach-s5pv210/cpu.c b/arch/arm/mach-s5pv210/cpu.c
index 61e6c24..61ea36e 100644
--- a/arch/arm/mach-s5pv210/cpu.c
+++ b/arch/arm/mach-s5pv210/cpu.c
@@ -130,6 +130,8 @@ void __init s5pv210_map_io(void)
 
 	s3c_cfcon_setname("s5pv210-pata");
 
+	s3c_i2c3_setname("s3c2440-hdmiphy-i2c");
+
 	s3c_fimc_setname(0, "s5pv210-fimc");
 	s3c_fimc_setname(1, "s5pv210-fimc");
 	s3c_fimc_setname(2, "s5pv210-fimc");
diff --git a/arch/arm/mach-s5pv210/include/mach/map.h b/arch/arm/mach-s5pv210/include/mach/map.h
index 1dd5883..f6bb269 100644
--- a/arch/arm/mach-s5pv210/include/mach/map.h
+++ b/arch/arm/mach-s5pv210/include/mach/map.h
@@ -41,6 +41,7 @@
 #define S5PV210_PA_IIC0			0xE1800000
 #define S5PV210_PA_IIC1			0xFAB00000
 #define S5PV210_PA_IIC2			0xE1A00000
+#define S5PV210_PA_IIC3			0xFA900000
 
 #define S5PV210_PA_AC97			0xE2200000
 
@@ -98,6 +99,7 @@
 #define S3C_PA_IIC			S5PV210_PA_IIC0
 #define S3C_PA_IIC1			S5PV210_PA_IIC1
 #define S3C_PA_IIC2			S5PV210_PA_IIC2
+#define S3C_PA_IIC3			S5PV210_PA_IIC3
 #define S3C_PA_RTC			S5PV210_PA_RTC
 #define S3C_PA_USB_HSOTG		S5PV210_PA_HSOTG
 #define S3C_PA_WDT			S5PV210_PA_WATCHDOG
diff --git a/arch/arm/mach-s5pv210/setup-i2c3.c b/arch/arm/mach-s5pv210/setup-i2c3.c
new file mode 100644
index 0000000..b77de7a
--- /dev/null
+++ b/arch/arm/mach-s5pv210/setup-i2c3.c
@@ -0,0 +1,27 @@
+/* linux/arch/arm/mach-s5pv210/setup-i2c3.c
+ *
+ * Copyright (c) 2009-2010 Samsung Electronics Co., Ltd.
+ *		http://www.samsung.com/
+ *
+ * I2C3 GPIO configuration.
+ *
+ * based on linux/arch/arm/mach-s5pv210/setup-i2c2.c
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+*/
+
+#include <linux/kernel.h>
+#include <linux/types.h>
+#include <linux/gpio.h>
+
+struct platform_device; /* don't need the contents */
+
+#include <plat/iic.h>
+#include <plat/gpio-cfg.h>
+
+void s3c_i2c3_cfg_gpio(struct platform_device *dev)
+{
+	/* controller is internally connected, nothing to configure */
+}
diff --git a/arch/arm/plat-samsung/include/plat/iic-core.h b/arch/arm/plat-samsung/include/plat/iic-core.h
index 97ecc44..49071ff 100644
--- a/arch/arm/plat-samsung/include/plat/iic-core.h
+++ b/arch/arm/plat-samsung/include/plat/iic-core.h
@@ -39,6 +39,13 @@ static inline void s3c_i2c2_setname(char *name)
 #endif
 }
 
+static inline void s3c_i2c3_setname(char *name)
+{
+#ifdef CONFIG_S3C_DEV_I2C3
+	s3c_device_i2c3.name = name;
+#endif
+}
+
 static inline void s3c_i2c8_setname(char *name)
 {
 #ifdef CONFIG_S3C_DEV_I2C8
-- 
1.7.5.1
