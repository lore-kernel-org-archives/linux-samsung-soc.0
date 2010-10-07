From: Jongsun Han <jongsun.han@samsung.com>
Subject: [PATCH 1/3] ARM: SAMSUNG: Add a helper function for I2C(3,4,5,6,7) platform devices
Date: Thu,  7 Oct 2010 20:15:30 +0900
Message-ID: <1286450132-7985-2-git-send-email-jongsun.han@samsung.com>
References: <1286450132-7985-1-git-send-email-jongsun.han@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:36990 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752434Ab0JGLYs (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 7 Oct 2010 07:24:48 -0400
In-Reply-To: <1286450132-7985-1-git-send-email-jongsun.han@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, ben-linux@fluff.org, Jongsun Han <jongsun.han@samsung.com>

This patch adds a helper function for I2C(3,4,5,6,7) in dev-i2c.c.

I2C(0,1,2) helper functions and definitions are moved to dev-i2c.c and
dev-i2c(0,1,2).c are removed.

Signed-off-by: Jongsun Han <jongsun.han@samsung.com>
---
 arch/arm/plat-samsung/Kconfig             |   25 +++
 arch/arm/plat-samsung/Makefile            |    4 +-
 arch/arm/plat-samsung/dev-i2c.c           |  226 +++++++++++++++++++++++++++++
 arch/arm/plat-samsung/dev-i2c0.c          |   72 ---------
 arch/arm/plat-samsung/dev-i2c1.c          |   69 ---------
 arch/arm/plat-samsung/dev-i2c2.c          |   70 ---------
 arch/arm/plat-samsung/include/plat/devs.h |    1 +
 arch/arm/plat-samsung/include/plat/iic.h  |    6 +
 8 files changed, 259 insertions(+), 214 deletions(-)
 create mode 100644 arch/arm/plat-samsung/dev-i2c.c
 delete mode 100644 arch/arm/plat-samsung/dev-i2c0.c
 delete mode 100644 arch/arm/plat-samsung/dev-i2c1.c
 delete mode 100644 arch/arm/plat-samsung/dev-i2c2.c

diff --git a/arch/arm/plat-samsung/Kconfig b/arch/arm/plat-samsung/Kconfig
index 7c0bde7..701f390 100644
--- a/arch/arm/plat-samsung/Kconfig
+++ b/arch/arm/plat-samsung/Kconfig
@@ -180,6 +180,31 @@ config S3C_DEV_I2C2
 	help
 	  Compile in platform device definitions for I2C channel 2
 
+config S3C_DEV_I2C3
+	bool
+	help
+	  Compile in platform device definitions for I2C channel 3
+
+config S3C_DEV_I2C4
+	bool
+	help
+	  Compile in platform device definitions for I2C channel 4
+
+config S3C_DEV_I2C5
+	bool
+	help
+	  Compile in platform device definitions for I2C channel 5
+
+config S3C_DEV_I2C6
+	bool
+	help
+	  Compile in platform device definitions for I2C channel 6
+
+config S3C_DEV_I2C7
+	bool
+	help
+	  Compile in platform device definitions for I2C channel 7
+
 config S3C_DEV_FB
 	bool
 	help
diff --git a/arch/arm/plat-samsung/Makefile b/arch/arm/plat-samsung/Makefile
index 4d8ff92..f8ef381 100644
--- a/arch/arm/plat-samsung/Makefile
+++ b/arch/arm/plat-samsung/Makefile
@@ -37,9 +37,7 @@ obj-$(CONFIG_S3C_DEV_HSMMC1)	+= dev-hsmmc1.o
 obj-$(CONFIG_S3C_DEV_HSMMC2)	+= dev-hsmmc2.o
 obj-$(CONFIG_S3C_DEV_HSMMC3)	+= dev-hsmmc3.o
 obj-$(CONFIG_S3C_DEV_HWMON)	+= dev-hwmon.o
-obj-y				+= dev-i2c0.o
-obj-$(CONFIG_S3C_DEV_I2C1)	+= dev-i2c1.o
-obj-$(CONFIG_S3C_DEV_I2C2)	+= dev-i2c2.o
+obj-y				+= dev-i2c.o
 obj-$(CONFIG_S3C_DEV_FB)	+= dev-fb.o
 obj-y				+= dev-uart.o
 obj-$(CONFIG_S3C_DEV_USB_HOST)	+= dev-usb.o
diff --git a/arch/arm/plat-samsung/dev-i2c.c b/arch/arm/plat-samsung/dev-i2c.c
new file mode 100644
index 0000000..4ac0a6a
--- /dev/null
+++ b/arch/arm/plat-samsung/dev-i2c.c
@@ -0,0 +1,226 @@
+/* linux/arch/arm/plat-s3c/dev-i2c.c
+ *
+ * Copyright (c) 2010 Samsung Electronics Co., Ltd.
+ *		http://www.samsung.com/
+ *
+ * I2C device definition for Samsung SOC
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+*/
+
+#include <linux/gfp.h>
+#include <linux/kernel.h>
+#include <linux/string.h>
+#include <linux/platform_device.h>
+
+#include <mach/irqs.h>
+#include <mach/map.h>
+
+#include <plat/regs-iic.h>
+#include <plat/iic.h>
+#include <plat/devs.h>
+#include <plat/cpu.h>
+
+#define S3C_ADD_I2C_RESOURCE(i2c_mem, i2c_irq)		\
+	{						\
+		.start = (i2c_mem),			\
+		.end   = (i2c_mem) + SZ_4K - 1,		\
+		.flags = IORESOURCE_MEM,		\
+	},						\
+	{						\
+		.start = (i2c_irq),			\
+		.end   = (i2c_irq),			\
+		.flags = IORESOURCE_IRQ,		\
+	},
+
+static struct resource s3c_i2c_resource[][2] = {
+	{ S3C_ADD_I2C_RESOURCE(S3C_PA_IIC, IRQ_IIC) },
+#ifdef CONFIG_S3C_DEV_I2C1
+	{ S3C_ADD_I2C_RESOURCE(S3C_PA_IIC1, IRQ_IIC1) },
+#endif
+#ifdef CONFIG_S3C_DEV_I2C2
+	{ S3C_ADD_I2C_RESOURCE(S3C_PA_IIC2, IRQ_IIC2) },
+#endif
+#ifdef CONFIG_S3C_DEV_I2C3
+	{ S3C_ADD_I2C_RESOURCE(S3C_PA_IIC3, IRQ_IIC3) },
+#endif
+#ifdef CONFIG_S3C_DEV_I2C4
+	{ S3C_ADD_I2C_RESOURCE(S3C_PA_IIC4, IRQ_IIC4) },
+#endif
+#ifdef CONFIG_S3C_DEV_I2C5
+	{ S3C_ADD_I2C_RESOURCE(S3C_PA_IIC5, IRQ_IIC5) },
+#endif
+#ifdef CONFIG_S3C_DEV_I2C6
+	{ S3C_ADD_I2C_RESOURCE(S3C_PA_IIC6, IRQ_IIC6) },
+#endif
+#ifdef CONFIG_S3C_DEV_I2C7
+	{ S3C_ADD_I2C_RESOURCE(S3C_PA_IIC7, IRQ_IIC7) },
+#endif
+};
+
+#define S3C_ADD_I2C_PLATFORM(bus, freq, gpio)		\
+	{						\
+		.flags		= 0,			\
+		.bus_num	= (bus),		\
+		.slave_addr	= 0x10,			\
+		.frequency	= (freq),		\
+		.sda_delay	= 100,			\
+		.cfg_gpio	= (gpio),		\
+	}
+
+static struct s3c2410_platform_i2c default_i2c_data[] __initdata = {
+	S3C_ADD_I2C_PLATFORM(0, 100*1000, s3c_i2c0_cfg_gpio),
+#ifdef CONFIG_S3C_DEV_I2C1
+	S3C_ADD_I2C_PLATFORM(1, 100*1000, s3c_i2c1_cfg_gpio),
+#endif
+#ifdef CONFIG_S3C_DEV_I2C2
+	S3C_ADD_I2C_PLATFORM(2, 100*1000, s3c_i2c2_cfg_gpio),
+#endif
+#ifdef CONFIG_S3C_DEV_I2C3
+	S3C_ADD_I2C_PLATFORM(3, 100*1000, s3c_i2c3_cfg_gpio),
+#endif
+#ifdef CONFIG_S3C_DEV_I2C4
+	S3C_ADD_I2C_PLATFORM(4, 100*1000, s3c_i2c4_cfg_gpio),
+#endif
+#ifdef CONFIG_S3C_DEV_I2C5
+	S3C_ADD_I2C_PLATFORM(5, 100*1000, s3c_i2c5_cfg_gpio),
+#endif
+#ifdef CONFIG_S3C_DEV_I2C6
+	S3C_ADD_I2C_PLATFORM(6, 100*1000, s3c_i2c6_cfg_gpio),
+#endif
+#ifdef CONFIG_S3C_DEV_I2C7
+	S3C_ADD_I2C_PLATFORM(7, 100*1000, s3c_i2c7_cfg_gpio),
+#endif
+};
+
+static const char s3c_i2c_name[] = "s3c2410-i2c";
+
+#define S3C_ADD_I2C_DEVICE(i2c_id, res)			\
+	{						\
+		.name		  = s3c_i2c_name,	\
+		.id		  = (i2c_id),		\
+		.num_resources	  = ARRAY_SIZE(res),	\
+		.resource	  = (res),		\
+	}
+
+struct platform_device s3c_device_i2c[] = {
+#ifdef CONFIG_S3C_DEV_I2C1
+	S3C_ADD_I2C_DEVICE(0, s3c_i2c_resource[0]),
+	S3C_ADD_I2C_DEVICE(1, s3c_i2c_resource[1]),
+#else
+	S3C_ADD_I2C_DEVICE(-1, s3c_i2c_resource[0]),
+#endif
+#ifdef CONFIG_S3C_DEV_I2C2
+	S3C_ADD_I2C_DEVICE(2, s3c_i2c_resource[2]),
+#endif
+#ifdef CONFIG_S3C_DEV_I2C3
+	S3C_ADD_I2C_DEVICE(3, s3c_i2c_resource[3]),
+#endif
+#ifdef CONFIG_S3C_DEV_I2C4
+	S3C_ADD_I2C_DEVICE(4, s3c_i2c_resource[4]),
+#endif
+#ifdef CONFIG_S3C_DEV_I2C5
+	S3C_ADD_I2C_DEVICE(5, s3c_i2c_resource[5]),
+#endif
+#ifdef CONFIG_S3C_DEV_I2C6
+	S3C_ADD_I2C_DEVICE(6, s3c_i2c_resource[6]),
+#endif
+#ifdef CONFIG_S3C_DEV_I2C7
+	S3C_ADD_I2C_DEVICE(7, s3c_i2c_resource[7]),
+#endif
+};
+
+#define I2C_DEV_NUM	ARRAY_SIZE(s3c_device_i2c)
+
+struct platform_device s3c_device_i2c0 = {
+	.name		  = "s3c2410-i2c",
+#ifdef CONFIG_S3C_DEV_I2C1
+	.id		  = 0,
+#else
+	.id		  = -1,
+#endif
+	.num_resources	  = ARRAY_SIZE(s3c_i2c_resource[0]),
+	.resource	  = s3c_i2c_resource[0],
+};
+
+#ifdef CONFIG_S3C_DEV_I2C1
+struct platform_device s3c_device_i2c1 = {
+	.name		  = "s3c2410-i2c",
+	.id		  = 1,
+	.num_resources	  = ARRAY_SIZE(s3c_i2c_resource[1]),
+	.resource	  = s3c_i2c_resource[1],
+};
+#endif
+
+#ifdef CONFIG_S3C_DEV_I2C2
+struct platform_device s3c_device_i2c2 = {
+	.name		  = "s3c2410-i2c",
+	.id		  = 2,
+	.num_resources	  = ARRAY_SIZE(s3c_i2c_resource[2]),
+	.resource	  = s3c_i2c_resource[2],
+};
+#endif
+
+void __init s3c_i2c0_set_platdata(struct s3c2410_platform_i2c *pd)
+{
+	struct s3c2410_platform_i2c *npd;
+
+	if (!pd)
+		pd = &default_i2c_data[0];
+
+	npd = kmemdup(pd, sizeof(struct s3c2410_platform_i2c), GFP_KERNEL);
+	if (!npd)
+		printk(KERN_ERR "%s: no memory for platform data\n", __func__);
+
+	s3c_device_i2c0.dev.platform_data = npd;
+}
+
+#ifdef CONFIG_S3C_DEV_I2C1
+void __init s3c_i2c1_set_platdata(struct s3c2410_platform_i2c *pd)
+{
+	struct s3c2410_platform_i2c *npd;
+
+	if (!pd)
+		pd = &default_i2c_data[1];
+
+	npd = kmemdup(pd, sizeof(struct s3c2410_platform_i2c), GFP_KERNEL);
+	if (!npd)
+		printk(KERN_ERR "%s: no memory for platform data\n", __func__);
+
+	s3c_device_i2c1.dev.platform_data = npd;
+}
+#endif
+
+#ifdef CONFIG_S3C_DEV_I2C2
+void __init s3c_i2c2_set_platdata(struct s3c2410_platform_i2c *pd)
+{
+	struct s3c2410_platform_i2c *npd;
+
+	if (!pd)
+		pd = &default_i2c_data[2];
+
+	npd = kmemdup(pd, sizeof(struct s3c2410_platform_i2c), GFP_KERNEL);
+	if (!npd)
+		printk(KERN_ERR "%s: no memory for platform data\n", __func__);
+
+	s3c_device_i2c2.dev.platform_data = npd;
+}
+#endif
+
+void __init s3c_i2c_set_platdata(struct s3c2410_platform_i2c *pd)
+{
+	struct s3c2410_platform_i2c *npd[I2C_DEV_NUM];
+	int i;
+
+	for (i = 3; i < I2C_DEV_NUM; i++) {
+		if (!pd)
+			pd = &default_i2c_data[i];
+
+		npd[i] = kmemdup(pd, sizeof(struct s3c2410_platform_i2c)
+				, GFP_KERNEL);
+		s3c_device_i2c[i].dev.platform_data = npd[i];
+		pd = NULL;
+	}
+}
diff --git a/arch/arm/plat-samsung/dev-i2c0.c b/arch/arm/plat-samsung/dev-i2c0.c
deleted file mode 100644
index 3a601c1..0000000
--- a/arch/arm/plat-samsung/dev-i2c0.c
+++ /dev/null
@@ -1,72 +0,0 @@
-/* linux/arch/arm/plat-s3c/dev-i2c0.c
- *
- * Copyright 2008-2009 Simtec Electronics
- *	Ben Dooks <ben@simtec.co.uk>
- *	http://armlinux.simtec.co.uk/
- *
- * S3C series device definition for i2c device 0
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
-*/
-
-#include <linux/gfp.h>
-#include <linux/kernel.h>
-#include <linux/string.h>
-#include <linux/platform_device.h>
-
-#include <mach/irqs.h>
-#include <mach/map.h>
-
-#include <plat/regs-iic.h>
-#include <plat/iic.h>
-#include <plat/devs.h>
-#include <plat/cpu.h>
-
-static struct resource s3c_i2c_resource[] = {
-	[0] = {
-		.start = S3C_PA_IIC,
-		.end   = S3C_PA_IIC + SZ_4K - 1,
-		.flags = IORESOURCE_MEM,
-	},
-	[1] = {
-		.start = IRQ_IIC,
-		.end   = IRQ_IIC,
-		.flags = IORESOURCE_IRQ,
-	},
-};
-
-struct platform_device s3c_device_i2c0 = {
-	.name		  = "s3c2410-i2c",
-#ifdef CONFIG_S3C_DEV_I2C1
-	.id		  = 0,
-#else
-	.id		  = -1,
-#endif
-	.num_resources	  = ARRAY_SIZE(s3c_i2c_resource),
-	.resource	  = s3c_i2c_resource,
-};
-
-static struct s3c2410_platform_i2c default_i2c_data0 __initdata = {
-	.flags		= 0,
-	.slave_addr	= 0x10,
-	.frequency	= 100*1000,
-	.sda_delay	= 100,
-};
-
-void __init s3c_i2c0_set_platdata(struct s3c2410_platform_i2c *pd)
-{
-	struct s3c2410_platform_i2c *npd;
-
-	if (!pd)
-		pd = &default_i2c_data0;
-
-	npd = kmemdup(pd, sizeof(struct s3c2410_platform_i2c), GFP_KERNEL);
-	if (!npd)
-		printk(KERN_ERR "%s: no memory for platform data\n", __func__);
-	else if (!npd->cfg_gpio)
-		npd->cfg_gpio = s3c_i2c0_cfg_gpio;
-
-	s3c_device_i2c0.dev.platform_data = npd;
-}
diff --git a/arch/arm/plat-samsung/dev-i2c1.c b/arch/arm/plat-samsung/dev-i2c1.c
deleted file mode 100644
index 858ee2a..0000000
--- a/arch/arm/plat-samsung/dev-i2c1.c
+++ /dev/null
@@ -1,69 +0,0 @@
-/* linux/arch/arm/plat-s3c/dev-i2c1.c
- *
- * Copyright 2008-2009 Simtec Electronics
- *	Ben Dooks <ben@simtec.co.uk>
- *	http://armlinux.simtec.co.uk/
- *
- * S3C series device definition for i2c device 1
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
-*/
-
-#include <linux/gfp.h>
-#include <linux/kernel.h>
-#include <linux/string.h>
-#include <linux/platform_device.h>
-
-#include <mach/irqs.h>
-#include <mach/map.h>
-
-#include <plat/regs-iic.h>
-#include <plat/iic.h>
-#include <plat/devs.h>
-#include <plat/cpu.h>
-
-static struct resource s3c_i2c_resource[] = {
-	[0] = {
-		.start = S3C_PA_IIC1,
-		.end   = S3C_PA_IIC1 + SZ_4K - 1,
-		.flags = IORESOURCE_MEM,
-	},
-	[1] = {
-		.start = IRQ_IIC1,
-		.end   = IRQ_IIC1,
-		.flags = IORESOURCE_IRQ,
-	},
-};
-
-struct platform_device s3c_device_i2c1 = {
-	.name		  = "s3c2410-i2c",
-	.id		  = 1,
-	.num_resources	  = ARRAY_SIZE(s3c_i2c_resource),
-	.resource	  = s3c_i2c_resource,
-};
-
-static struct s3c2410_platform_i2c default_i2c_data1 __initdata = {
-	.flags		= 0,
-	.bus_num	= 1,
-	.slave_addr	= 0x10,
-	.frequency	= 100*1000,
-	.sda_delay	= 100,
-};
-
-void __init s3c_i2c1_set_platdata(struct s3c2410_platform_i2c *pd)
-{
-	struct s3c2410_platform_i2c *npd;
-
-	if (!pd)
-		pd = &default_i2c_data1;
-
-	npd = kmemdup(pd, sizeof(struct s3c2410_platform_i2c), GFP_KERNEL);
-	if (!npd)
-		printk(KERN_ERR "%s: no memory for platform data\n", __func__);
-	else if (!npd->cfg_gpio)
-		npd->cfg_gpio = s3c_i2c1_cfg_gpio;
-
-	s3c_device_i2c1.dev.platform_data = npd;
-}
diff --git a/arch/arm/plat-samsung/dev-i2c2.c b/arch/arm/plat-samsung/dev-i2c2.c
deleted file mode 100644
index 07036de..0000000
--- a/arch/arm/plat-samsung/dev-i2c2.c
+++ /dev/null
@@ -1,70 +0,0 @@
-/* linux/arch/arm/plat-s3c/dev-i2c2.c
- *
- * Copyright (c) 2010 Samsung Electronics Co., Ltd.
- *		http://www.samsung.com/
- *
- * S3C series device definition for i2c device 2
- *
- * Based on plat-samsung/dev-i2c0.c
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
-*/
-
-#include <linux/gfp.h>
-#include <linux/kernel.h>
-#include <linux/string.h>
-#include <linux/platform_device.h>
-
-#include <mach/irqs.h>
-#include <mach/map.h>
-
-#include <plat/regs-iic.h>
-#include <plat/iic.h>
-#include <plat/devs.h>
-#include <plat/cpu.h>
-
-static struct resource s3c_i2c_resource[] = {
-	[0] = {
-		.start = S3C_PA_IIC2,
-		.end   = S3C_PA_IIC2 + SZ_4K - 1,
-		.flags = IORESOURCE_MEM,
-	},
-	[1] = {
-		.start = IRQ_CAN0,
-		.end   = IRQ_CAN0,
-		.flags = IORESOURCE_IRQ,
-	},
-};
-
-struct platform_device s3c_device_i2c2 = {
-	.name		  = "s3c2410-i2c",
-	.id		  = 2,
-	.num_resources	  = ARRAY_SIZE(s3c_i2c_resource),
-	.resource	  = s3c_i2c_resource,
-};
-
-static struct s3c2410_platform_i2c default_i2c_data2 __initdata = {
-	.flags		= 0,
-	.bus_num	= 2,
-	.slave_addr	= 0x10,
-	.frequency	= 100*1000,
-	.sda_delay	= 100,
-};
-
-void __init s3c_i2c2_set_platdata(struct s3c2410_platform_i2c *pd)
-{
-	struct s3c2410_platform_i2c *npd;
-
-	if (!pd)
-		pd = &default_i2c_data2;
-
-	npd = kmemdup(pd, sizeof(struct s3c2410_platform_i2c), GFP_KERNEL);
-	if (!npd)
-		printk(KERN_ERR "%s: no memory for platform data\n", __func__);
-	else if (!npd->cfg_gpio)
-		npd->cfg_gpio = s3c_i2c2_cfg_gpio;
-
-	s3c_device_i2c2.dev.platform_data = npd;
-}
diff --git a/arch/arm/plat-samsung/include/plat/devs.h b/arch/arm/plat-samsung/include/plat/devs.h
index 7d448e1..b346957 100644
--- a/arch/arm/plat-samsung/include/plat/devs.h
+++ b/arch/arm/plat-samsung/include/plat/devs.h
@@ -46,6 +46,7 @@ extern struct platform_device s3c_device_wdt;
 extern struct platform_device s3c_device_i2c0;
 extern struct platform_device s3c_device_i2c1;
 extern struct platform_device s3c_device_i2c2;
+extern struct platform_device s3c_device_i2c[];
 extern struct platform_device s3c_device_rtc;
 extern struct platform_device s3c_device_adc;
 extern struct platform_device s3c_device_sdi;
diff --git a/arch/arm/plat-samsung/include/plat/iic.h b/arch/arm/plat-samsung/include/plat/iic.h
index 133308b..0fb9c6e 100644
--- a/arch/arm/plat-samsung/include/plat/iic.h
+++ b/arch/arm/plat-samsung/include/plat/iic.h
@@ -55,10 +55,16 @@ struct s3c2410_platform_i2c {
 extern void s3c_i2c0_set_platdata(struct s3c2410_platform_i2c *i2c);
 extern void s3c_i2c1_set_platdata(struct s3c2410_platform_i2c *i2c);
 extern void s3c_i2c2_set_platdata(struct s3c2410_platform_i2c *i2c);
+extern void s3c_i2c_set_platdata(struct s3c2410_platform_i2c *i2c);
 
 /* defined by architecture to configure gpio */
 extern void s3c_i2c0_cfg_gpio(struct platform_device *dev);
 extern void s3c_i2c1_cfg_gpio(struct platform_device *dev);
 extern void s3c_i2c2_cfg_gpio(struct platform_device *dev);
+extern void s3c_i2c3_cfg_gpio(struct platform_device *dev);
+extern void s3c_i2c4_cfg_gpio(struct platform_device *dev);
+extern void s3c_i2c5_cfg_gpio(struct platform_device *dev);
+extern void s3c_i2c6_cfg_gpio(struct platform_device *dev);
+extern void s3c_i2c7_cfg_gpio(struct platform_device *dev);
 
 #endif /* __ASM_ARCH_IIC_H */
-- 
1.6.3.3
