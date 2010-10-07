From: Jongsun Han <jongsun.han@samsung.com>
Subject: [PATCH 3/3] ARM: S5PV310: Add I2C(0,1,3,4,5,6,7) support
Date: Thu,  7 Oct 2010 20:15:32 +0900
Message-ID: <1286450132-7985-4-git-send-email-jongsun.han@samsung.com>
References: <1286450132-7985-1-git-send-email-jongsun.han@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:36987 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752210Ab0JGLYs (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 7 Oct 2010 07:24:48 -0400
In-Reply-To: <1286450132-7985-1-git-send-email-jongsun.han@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, ben-linux@fluff.org, Jongsun Han <jongsun.han@samsung.com>

This patch adds the I2C support for S5PV310.

S5PV310 supports 8 I2C channels.
mach-smdkv310.c doesn't support I2C(2,3) because the GPIOs of these
I2C channels are used by UART channel(1,2)
All I2C platform helper functions are moved to setup-i2c.c and
setup-i2c(0,1,2).c files are removed.

Signed-off-by: Jongsun Han <jongsun.han@samsung.com>
---
 arch/arm/Kconfig                      |    1 +
 arch/arm/mach-s5pv310/Kconfig         |   40 +++++++++++++
 arch/arm/mach-s5pv310/Makefile        |    5 +-
 arch/arm/mach-s5pv310/mach-smdkv310.c |   39 +++++++++++++
 arch/arm/mach-s5pv310/setup-i2c.c     |   98 +++++++++++++++++++++++++++++++++
 arch/arm/mach-s5pv310/setup-i2c0.c    |   28 ---------
 arch/arm/mach-s5pv310/setup-i2c1.c    |   25 --------
 arch/arm/mach-s5pv310/setup-i2c2.c    |   25 --------
 8 files changed, 179 insertions(+), 82 deletions(-)
 create mode 100644 arch/arm/mach-s5pv310/setup-i2c.c
 delete mode 100644 arch/arm/mach-s5pv310/setup-i2c0.c
 delete mode 100644 arch/arm/mach-s5pv310/setup-i2c1.c
 delete mode 100644 arch/arm/mach-s5pv310/setup-i2c2.c

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 903ab04..8b489a8 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -738,6 +738,7 @@ config ARCH_S5PV310
 	select GENERIC_CLOCKEVENTS
 	select HAVE_S3C_RTC
 	select HAVE_S3C2410_WATCHDOG
+	select HAVE_S3C2410_I2C
 	help
 	  Samsung S5PV310 series based systems
 
diff --git a/arch/arm/mach-s5pv310/Kconfig b/arch/arm/mach-s5pv310/Kconfig
index 9941852..dd92ef2 100644
--- a/arch/arm/mach-s5pv310/Kconfig
+++ b/arch/arm/mach-s5pv310/Kconfig
@@ -24,6 +24,31 @@ config S5PV310_SETUP_I2C2
 	help
 	  Common setup code for i2c bus 2.
 
+config S5PV310_SETUP_I2C3
+	bool
+	help
+	  Common setup code for i2c bus 3.
+
+config S5PV310_SETUP_I2C4
+	bool
+	help
+	  Common setup code for i2c bus 4.
+
+config S5PV310_SETUP_I2C5
+	bool
+	help
+	  Common setup code for i2c bus 5.
+
+config S5PV310_SETUP_I2C6
+	bool
+	help
+	  Common setup code for i2c bus 6.
+
+config S5PV310_SETUP_I2C7
+	bool
+	help
+	  Common setup code for i2c bus 7.
+
 # machine support
 
 menu "S5PC210 Machines"
@@ -51,8 +76,23 @@ menu "S5PV310 Machines"
 config MACH_SMDKV310
 	bool "SMDKV310"
 	select CPU_S5PV310
+	select ARCH_SPARSEMEM_ENABLE
 	select S3C_DEV_RTC
 	select S3C_DEV_WDT
+	select S3C_DEV_I2C1
+	select S3C_DEV_I2C2
+	select S3C_DEV_I2C3
+	select S3C_DEV_I2C4
+	select S3C_DEV_I2C5
+	select S3C_DEV_I2C6
+	select S3C_DEV_I2C7
+	select S5PV310_SETUP_I2C1
+	select S5PV310_SETUP_I2C2
+	select S5PV310_SETUP_I2C3
+	select S5PV310_SETUP_I2C4
+	select S5PV310_SETUP_I2C5
+	select S5PV310_SETUP_I2C6
+	select S5PV310_SETUP_I2C7
 	help
 	  Machine support for Samsung SMDKV310
 
diff --git a/arch/arm/mach-s5pv310/Makefile b/arch/arm/mach-s5pv310/Makefile
index d17c8c7..32ea94f 100644
--- a/arch/arm/mach-s5pv310/Makefile
+++ b/arch/arm/mach-s5pv310/Makefile
@@ -13,7 +13,7 @@ obj-				:=
 # Core support for S5PV310 system
 
 obj-$(CONFIG_CPU_S5PV310)	+= cpu.o init.o clock.o irq-combiner.o
-obj-$(CONFIG_CPU_S5PV310)	+= setup-i2c0.o time.o
+obj-$(CONFIG_CPU_S5PV310)	+= setup-i2c.o time.o
 obj-$(CONFIG_CPU_FREQ)		+= cpufreq.o
 
 obj-$(CONFIG_SMP)		+= platsmp.o headsmp.o
@@ -27,6 +27,3 @@ obj-$(CONFIG_MACH_SMDKV310)	+= mach-smdkv310.o
 obj-$(CONFIG_MACH_UNIVERSAL_C210)	+= mach-universal_c210.o
 
 # device support
-
-obj-$(CONFIG_S5PV310_SETUP_I2C1)	+= setup-i2c1.o
-obj-$(CONFIG_S5PV310_SETUP_I2C2)	+= setup-i2c2.o
diff --git a/arch/arm/mach-s5pv310/mach-smdkv310.c b/arch/arm/mach-s5pv310/mach-smdkv310.c
index 9cb827d..404a7cc 100644
--- a/arch/arm/mach-s5pv310/mach-smdkv310.c
+++ b/arch/arm/mach-s5pv310/mach-smdkv310.c
@@ -9,6 +9,7 @@
 */
 
 #include <linux/serial_core.h>
+#include <linux/i2c.h>
 
 #include <asm/mach/arch.h>
 #include <asm/mach-types.h>
@@ -18,6 +19,7 @@
 #include <plat/s5pv310.h>
 #include <plat/cpu.h>
 #include <plat/devs.h>
+#include <plat/iic.h>
 
 #include <mach/map.h>
 
@@ -69,6 +71,32 @@ static struct s3c2410_uartcfg smdkv310_uartcfgs[] __initdata = {
 static struct platform_device *smdkv310_devices[] __initdata = {
 	&s3c_device_rtc,
 	&s3c_device_wdt,
+	&s3c_device_i2c0,
+	&s3c_device_i2c1,
+	&s3c_device_i2c[4],
+	&s3c_device_i2c[5],
+	&s3c_device_i2c[6],
+	&s3c_device_i2c[7],
+};
+
+static struct i2c_board_info i2c_devs0[] __initdata = {
+	{ I2C_BOARD_INFO("24c128", 0x50), },	 /* Samsung S524AD0XD1 */
+	{ I2C_BOARD_INFO("24c128", 0x52), },	 /* Samsung S524AD0XD1 */
+};
+
+static struct i2c_board_info i2c_devs1[] __initdata = {
+};
+
+static struct i2c_board_info i2c_devs4[] __initdata = {
+};
+
+static struct i2c_board_info i2c_devs5[] __initdata = {
+};
+
+static struct i2c_board_info i2c_devs6[] __initdata = {
+};
+
+static struct i2c_board_info i2c_devs7[] __initdata = {
 };
 
 static void __init smdkv310_map_io(void)
@@ -84,6 +112,17 @@ static void __init smdkv310_machine_init(void)
 	l2x0_init(S5P_VA_L2CC, 1 << 28, 0xffffffff);
 #endif
 
+	s3c_i2c0_set_platdata(NULL);
+	s3c_i2c1_set_platdata(NULL);
+	s3c_i2c_set_platdata(NULL);
+
+	i2c_register_board_info(0, i2c_devs0, ARRAY_SIZE(i2c_devs0));
+	i2c_register_board_info(1, i2c_devs1, ARRAY_SIZE(i2c_devs1));
+	i2c_register_board_info(4, i2c_devs4, ARRAY_SIZE(i2c_devs4));
+	i2c_register_board_info(5, i2c_devs5, ARRAY_SIZE(i2c_devs5));
+	i2c_register_board_info(6, i2c_devs6, ARRAY_SIZE(i2c_devs6));
+	i2c_register_board_info(7, i2c_devs7, ARRAY_SIZE(i2c_devs7));
+
 	platform_add_devices(smdkv310_devices, ARRAY_SIZE(smdkv310_devices));
 }
 
diff --git a/arch/arm/mach-s5pv310/setup-i2c.c b/arch/arm/mach-s5pv310/setup-i2c.c
new file mode 100644
index 0000000..c8021f8
--- /dev/null
+++ b/arch/arm/mach-s5pv310/setup-i2c.c
@@ -0,0 +1,98 @@
+/*
+ * linux/arch/arm/mach-s5pv310/setup-i2c.c
+ *
+ * Copyright (c) 2010 Samsung Electronics Co., Ltd.
+ *		http://www.samsung.com/
+ *
+ * I2C0 GPIO configuration.
+ *
+ * Based on plat-s3c64xx/setup-i2c0.c
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+*/
+
+struct platform_device; /* don't need the contents */
+
+#include <linux/gpio.h>
+#include <plat/iic.h>
+#include <plat/gpio-cfg.h>
+
+void s3c_i2c0_cfg_gpio(struct platform_device *dev)
+{
+	s3c_gpio_cfgpin(S5PV310_GPD1(0), S3C_GPIO_SFN(2));
+	s3c_gpio_setpull(S5PV310_GPD1(0), S3C_GPIO_PULL_UP);
+	s3c_gpio_cfgpin(S5PV310_GPD1(1), S3C_GPIO_SFN(2));
+	s3c_gpio_setpull(S5PV310_GPD1(1), S3C_GPIO_PULL_UP);
+}
+
+#ifdef CONFIG_S5PV310_SETUP_I2C1
+void s3c_i2c1_cfg_gpio(struct platform_device *dev)
+{
+	s3c_gpio_cfgpin(S5PV310_GPD1(2), S3C_GPIO_SFN(2));
+	s3c_gpio_setpull(S5PV310_GPD1(2), S3C_GPIO_PULL_UP);
+	s3c_gpio_cfgpin(S5PV310_GPD1(3), S3C_GPIO_SFN(2));
+	s3c_gpio_setpull(S5PV310_GPD1(3), S3C_GPIO_PULL_UP);
+}
+#endif
+
+#ifdef CONFIG_S5PV310_SETUP_I2C2
+void s3c_i2c2_cfg_gpio(struct platform_device *dev)
+{
+	s3c_gpio_cfgpin(S5PV310_GPA0(6), S3C_GPIO_SFN(3));
+	s3c_gpio_setpull(S5PV310_GPA0(6), S3C_GPIO_PULL_UP);
+	s3c_gpio_cfgpin(S5PV310_GPA0(7), S3C_GPIO_SFN(3));
+	s3c_gpio_setpull(S5PV310_GPA0(7), S3C_GPIO_PULL_UP);
+}
+#endif
+
+#ifdef CONFIG_S5PV310_SETUP_I2C3
+void s3c_i2c3_cfg_gpio(struct platform_device *dev)
+{
+	s3c_gpio_cfgpin(S5PV310_GPA1(2), S3C_GPIO_SFN(3));
+	s3c_gpio_setpull(S5PV310_GPA1(2), S3C_GPIO_PULL_UP);
+	s3c_gpio_cfgpin(S5PV310_GPA1(3), S3C_GPIO_SFN(3));
+	s3c_gpio_setpull(S5PV310_GPA1(3), S3C_GPIO_PULL_UP);
+}
+#endif
+
+#ifdef CONFIG_S5PV310_SETUP_I2C4
+void s3c_i2c4_cfg_gpio(struct platform_device *dev)
+{
+	s3c_gpio_cfgpin(S5PV310_GPB(2), S3C_GPIO_SFN(3));
+	s3c_gpio_setpull(S5PV310_GPB(2), S3C_GPIO_PULL_UP);
+	s3c_gpio_cfgpin(S5PV310_GPB(3), S3C_GPIO_SFN(3));
+	s3c_gpio_setpull(S5PV310_GPB(3), S3C_GPIO_PULL_UP);
+}
+#endif
+
+#ifdef CONFIG_S5PV310_SETUP_I2C5
+void s3c_i2c5_cfg_gpio(struct platform_device *dev)
+{
+	s3c_gpio_cfgpin(S5PV310_GPB(6), S3C_GPIO_SFN(3));
+	s3c_gpio_setpull(S5PV310_GPB(6), S3C_GPIO_PULL_UP);
+	s3c_gpio_cfgpin(S5PV310_GPB(7), S3C_GPIO_SFN(3));
+	s3c_gpio_setpull(S5PV310_GPB(7), S3C_GPIO_PULL_UP);
+}
+#endif
+
+#ifdef CONFIG_S5PV310_SETUP_I2C6
+void s3c_i2c6_cfg_gpio(struct platform_device *dev)
+{
+	s3c_gpio_cfgpin(S5PV310_GPC1(3), S3C_GPIO_SFN(4));
+	s3c_gpio_setpull(S5PV310_GPC1(3), S3C_GPIO_PULL_UP);
+	s3c_gpio_cfgpin(S5PV310_GPC1(4), S3C_GPIO_SFN(4));
+	s3c_gpio_setpull(S5PV310_GPC1(4), S3C_GPIO_PULL_UP);
+}
+#endif
+
+#ifdef CONFIG_S5PV310_SETUP_I2C7
+void s3c_i2c7_cfg_gpio(struct platform_device *dev)
+{
+	s3c_gpio_cfgpin(S5PV310_GPD0(2), S3C_GPIO_SFN(3));
+	s3c_gpio_setpull(S5PV310_GPD0(2), S3C_GPIO_PULL_UP);
+	s3c_gpio_cfgpin(S5PV310_GPD0(3), S3C_GPIO_SFN(3));
+	s3c_gpio_setpull(S5PV310_GPD0(3), S3C_GPIO_PULL_UP);
+}
+#endif
diff --git a/arch/arm/mach-s5pv310/setup-i2c0.c b/arch/arm/mach-s5pv310/setup-i2c0.c
deleted file mode 100644
index 4367128..0000000
--- a/arch/arm/mach-s5pv310/setup-i2c0.c
+++ /dev/null
@@ -1,28 +0,0 @@
-/*
- * linux/arch/arm/mach-s5pv310/setup-i2c0.c
- *
- * Copyright (c) 2009-2010 Samsung Electronics Co., Ltd.
- *		http://www.samsung.com/
- *
- * I2C0 GPIO configuration.
- *
- * Based on plat-s3c64xx/setup-i2c0.c
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
-*/
-
-struct platform_device; /* don't need the contents */
-
-#include <linux/gpio.h>
-#include <plat/iic.h>
-#include <plat/gpio-cfg.h>
-
-void s3c_i2c0_cfg_gpio(struct platform_device *dev)
-{
-	s3c_gpio_cfgpin(S5PV310_GPD1(0), S3C_GPIO_SFN(2));
-	s3c_gpio_setpull(S5PV310_GPD1(0), S3C_GPIO_PULL_UP);
-	s3c_gpio_cfgpin(S5PV310_GPD1(1), S3C_GPIO_SFN(2));
-	s3c_gpio_setpull(S5PV310_GPD1(1), S3C_GPIO_PULL_UP);
-}
diff --git a/arch/arm/mach-s5pv310/setup-i2c1.c b/arch/arm/mach-s5pv310/setup-i2c1.c
deleted file mode 100644
index 1ecd5bc..0000000
--- a/arch/arm/mach-s5pv310/setup-i2c1.c
+++ /dev/null
@@ -1,25 +0,0 @@
-/*
- * linux/arch/arm/mach-s5pv310/setup-i2c1.c
- *
- * Copyright (C) 2010 Samsung Electronics Co., Ltd.
- *
- * I2C1 GPIO configuration.
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
-*/
-
-struct platform_device; /* don't need the contents */
-
-#include <linux/gpio.h>
-#include <plat/iic.h>
-#include <plat/gpio-cfg.h>
-
-void s3c_i2c1_cfg_gpio(struct platform_device *dev)
-{
-	s3c_gpio_cfgpin(S5PV310_GPD1(2), S3C_GPIO_SFN(2));
-	s3c_gpio_setpull(S5PV310_GPD1(2), S3C_GPIO_PULL_UP);
-	s3c_gpio_cfgpin(S5PV310_GPD1(3), S3C_GPIO_SFN(2));
-	s3c_gpio_setpull(S5PV310_GPD1(3), S3C_GPIO_PULL_UP);
-}
diff --git a/arch/arm/mach-s5pv310/setup-i2c2.c b/arch/arm/mach-s5pv310/setup-i2c2.c
deleted file mode 100644
index 4c0d8de..0000000
--- a/arch/arm/mach-s5pv310/setup-i2c2.c
+++ /dev/null
@@ -1,25 +0,0 @@
-/*
- * linux/arch/arm/mach-s5pv310/setup-i2c2.c
- *
- * Copyright (c) 2009-2010 Samsung Electronics Co., Ltd.
- *
- * I2C2 GPIO configuration.
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
-*/
-
-struct platform_device; /* don't need the contents */
-
-#include <linux/gpio.h>
-#include <plat/iic.h>
-#include <plat/gpio-cfg.h>
-
-void s3c_i2c2_cfg_gpio(struct platform_device *dev)
-{
-	s3c_gpio_cfgpin(S5PV310_GPA0(6), S3C_GPIO_SFN(3));
-	s3c_gpio_setpull(S5PV310_GPA0(6), S3C_GPIO_PULL_UP);
-	s3c_gpio_cfgpin(S5PV310_GPA0(7), S3C_GPIO_SFN(3));
-	s3c_gpio_setpull(S5PV310_GPA0(7), S3C_GPIO_PULL_UP);
-}
-- 
1.6.3.3
