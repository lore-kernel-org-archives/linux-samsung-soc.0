From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 3/8] ARM: S5PV210: add support for i2c3 controller (for HDMIPHY)
Date: Tue, 19 Jul 2011 10:44:22 +0200
Message-ID: <1311065067-20324-4-git-send-email-m.szyprowski@samsung.com>
References: <1311065067-20324-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:55670 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752605Ab1GSIog (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 19 Jul 2011 04:44:36 -0400
Received: from spt2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
 by mailout2.w1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0LOK00KC4OA9P8@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 19 Jul 2011 09:44:33 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt2.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0LOK0007HOA7VK@spt2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 19 Jul 2011 09:44:31 +0100 (BST)
In-reply-to: <1311065067-20324-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Tomasz Stanislawski <t.stanislaws@samsung.com>

From: Tomasz Stanislawski <t.stanislaws@samsung.com>

This patch add support for i2c3 controller for S5PV210 platform (as
HDMIPHY dedicated bus).

Signed-off-by: Tomasz Stanislawski <t.stanislaws@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm/mach-s5pv210/Kconfig                 |    5 ++++
 arch/arm/mach-s5pv210/Makefile                |    1 +
 arch/arm/mach-s5pv210/clock.c                 |    6 +++++
 arch/arm/mach-s5pv210/cpu.c                   |    1 +
 arch/arm/mach-s5pv210/include/mach/map.h      |    2 +
 arch/arm/mach-s5pv210/setup-i2c3.c            |   26 +++++++++++++++++++++++++
 arch/arm/plat-samsung/include/plat/iic-core.h |    7 ++++++
 7 files changed, 48 insertions(+), 0 deletions(-)
 create mode 100644 arch/arm/mach-s5pv210/setup-i2c3.c

diff --git a/arch/arm/mach-s5pv210/Kconfig b/arch/arm/mach-s5pv210/Kconfig
index a06acce..26b1f8f 100644
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
diff --git a/arch/arm/mach-s5pv210/Makefile b/arch/arm/mach-s5pv210/Makefile
index 50907ac..3656d64 100644
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
index 52a8e60..f41ee26 100644
--- a/arch/arm/mach-s5pv210/clock.c
+++ b/arch/arm/mach-s5pv210/clock.c
@@ -407,6 +407,12 @@ static struct clk init_clocks_off[] = {
 		.enable		= s5pv210_clk_ip3_ctrl,
 		.ctrlbit	= (1<<9),
 	}, {
+		.name		= "i2c",
+		.devname	= "s3c2440-hdmiphy-i2c.3",
+		.parent		= &clk_pclk_psys.clk,
+		.enable		= s5pv210_clk_ip3_ctrl,
+		.ctrlbit	= (1 << 11),
+	}, {
 		.name		= "spi",
 		.devname	= "s3c64xx-spi.0",
 		.parent		= &clk_pclk_psys.clk,
diff --git a/arch/arm/mach-s5pv210/cpu.c b/arch/arm/mach-s5pv210/cpu.c
index 61e6c24..2b3fa1d 100644
--- a/arch/arm/mach-s5pv210/cpu.c
+++ b/arch/arm/mach-s5pv210/cpu.c
@@ -138,6 +138,7 @@ void __init s5pv210_map_io(void)
 	s3c_i2c0_setname("s3c2440-i2c");
 	s3c_i2c1_setname("s3c2440-i2c");
 	s3c_i2c2_setname("s3c2440-i2c");
+	s3c_i2c3_setname("s3c2440-hdmiphy-i2c");
 
 	s3c_fb_setname("s5pv210-fb");
 
diff --git a/arch/arm/mach-s5pv210/include/mach/map.h b/arch/arm/mach-s5pv210/include/mach/map.h
index aac343c..bb405b3 100644
--- a/arch/arm/mach-s5pv210/include/mach/map.h
+++ b/arch/arm/mach-s5pv210/include/mach/map.h
@@ -41,6 +41,7 @@
 #define S5PV210_PA_IIC0			0xE1800000
 #define S5PV210_PA_IIC1			0xFAB00000
 #define S5PV210_PA_IIC2			0xE1A00000
+#define S5PV210_PA_IIC3			0xFA900000
 
 #define S5PV210_PA_AC97			0xE2200000
 
@@ -100,6 +101,7 @@
 #define S3C_PA_IIC			S5PV210_PA_IIC0
 #define S3C_PA_IIC1			S5PV210_PA_IIC1
 #define S3C_PA_IIC2			S5PV210_PA_IIC2
+#define S3C_PA_IIC3			S5PV210_PA_IIC3
 #define S3C_PA_RTC			S5PV210_PA_RTC
 #define S3C_PA_USB_HSOTG		S5PV210_PA_HSOTG
 #define S3C_PA_WDT			S5PV210_PA_WATCHDOG
diff --git a/arch/arm/mach-s5pv210/setup-i2c3.c b/arch/arm/mach-s5pv210/setup-i2c3.c
new file mode 100644
index 0000000..e6e291e
--- /dev/null
+++ b/arch/arm/mach-s5pv210/setup-i2c3.c
@@ -0,0 +1,26 @@
+/*
+ * Copyright (c) 2010-2011 Samsung Electronics Co., Ltd.
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
1.7.1.569.g6f426
