From: Angus Gratton <gus@projectgus.com>
Subject: PATCH: ARM: S5PV210: Add USB EHCI support for SMDKV210 board
Date: Sat, 24 Dec 2011 13:21:43 +1100
Message-ID: <1324693303.26918.27.camel@gorgon.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from hapkido.dreamhost.com ([66.33.216.122]:44488 "EHLO
	hapkido.dreamhost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754684Ab1LXCWm (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 23 Dec 2011 21:22:42 -0500
Received: from homiemail-a66.g.dreamhost.com (mailbigip.dreamhost.com [208.97.132.5])
	by hapkido.dreamhost.com (Postfix) with ESMTP id 61FB917B3F3
	for <linux-samsung-soc@vger.kernel.org>; Fri, 23 Dec 2011 18:22:30 -0800 (PST)
Received: from homiemail-a66.g.dreamhost.com (localhost [127.0.0.1])
	by homiemail-a66.g.dreamhost.com (Postfix) with ESMTP id E928E350058
	for <linux-samsung-soc@vger.kernel.org>; Fri, 23 Dec 2011 18:21:51 -0800 (PST)
Received: from [192.168.9.58] (ppp121-45-209-218.lns20.cbr1.internode.on.net [121.45.209.218])
	(using SSLv3 with cipher AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: gus@projectgus.com)
	by homiemail-a66.g.dreamhost.com (Postfix) with ESMTPSA id 4C43D350057
	for <linux-samsung-soc@vger.kernel.org>; Fri, 23 Dec 2011 18:21:51 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org

Signed-off-by: Angus Gratton <gus@projectgus.com>

---
(This is my first kernel patch submission, so apologies in advance for
any mistakes.)

Support is adapted from in EHCI in an older kernel & from the current
mach-exynos EHCI support. I've tried to duplicate the mach-exynos code
layout.

I don't actually have an SMDKV210 board to test on, this is tested on a
SMDKV210-derived product called a Flexiview FV-1. I believe this should
work on SMDKV210, and probably other S5PV210 boards, though.

 arch/arm/mach-s5pv210/Kconfig             |    9 +++
 arch/arm/mach-s5pv210/Makefile            |    1 +
 arch/arm/mach-s5pv210/clock.c             |    2 +-
 arch/arm/mach-s5pv210/include/mach/irqs.h |    2 +-
 arch/arm/mach-s5pv210/include/mach/map.h  |    5 ++
 arch/arm/mach-s5pv210/mach-smdkv210.c     |    9 +++
 arch/arm/mach-s5pv210/setup-usb-phy.c     |   83 +++++++++++++++++++++++++++++
 drivers/usb/host/ehci-s5p.c               |    1 -
 8 files changed, 109 insertions(+), 3 deletions(-)
 create mode 100644 arch/arm/mach-s5pv210/setup-usb-phy.c

diff --git a/arch/arm/mach-s5pv210/Kconfig b/arch/arm/mach-s5pv210/Kconfig
index 646057a..bf7f70c 100644
--- a/arch/arm/mach-s5pv210/Kconfig
+++ b/arch/arm/mach-s5pv210/Kconfig
@@ -60,6 +60,13 @@ config S5PV210_SETUP_FIMC
 	help
 	  Common setup code for the camera interfaces.
 
+config S5PV210_SETUP_USB_PHY
+	bool
+	help
+	  Common setup code for USB PHY controller
+
+
+
 menu "S5PC110 Machines"
 
 config MACH_AQUILA
@@ -143,12 +150,14 @@ config MACH_SMDKV210
 	select SAMSUNG_DEV_KEYPAD
 	select SAMSUNG_DEV_PWM
 	select SAMSUNG_DEV_TS
+	select S5P_DEV_USB_EHCI
 	select S5PV210_SETUP_FB_24BPP
 	select S5PV210_SETUP_I2C1
 	select S5PV210_SETUP_I2C2
 	select S5PV210_SETUP_IDE
 	select S5PV210_SETUP_KEYPAD
 	select S5PV210_SETUP_SDHCI
+	select S5PV210_SETUP_USB_PHY
 	help
 	  Machine support for Samsung SMDKV210
 
diff --git a/arch/arm/mach-s5pv210/Makefile b/arch/arm/mach-s5pv210/Makefile
index 009fbe5..4d0af14 100644
--- a/arch/arm/mach-s5pv210/Makefile
+++ b/arch/arm/mach-s5pv210/Makefile
@@ -37,3 +37,4 @@ obj-$(CONFIG_S5PV210_SETUP_IDE)		+= setup-ide.o
 obj-$(CONFIG_S5PV210_SETUP_KEYPAD)	+= setup-keypad.o
 obj-$(CONFIG_S5PV210_SETUP_SDHCI)       += setup-sdhci.o
 obj-$(CONFIG_S5PV210_SETUP_SDHCI_GPIO)	+= setup-sdhci-gpio.o
+obj-$(CONFIG_S5PV210_SETUP_USB_PHY)     += setup-usb-phy.o
diff --git a/arch/arm/mach-s5pv210/clock.c b/arch/arm/mach-s5pv210/clock.c
index 4c5ac7a..2aaa259 100644
--- a/arch/arm/mach-s5pv210/clock.c
+++ b/arch/arm/mach-s5pv210/clock.c
@@ -384,7 +384,7 @@ static struct clk init_clocks_off[] = {
 		.enable		= s5pv210_clk_ip1_ctrl,
 		.ctrlbit	= (1<<16),
 	}, {
-		.name		= "usb-host",
+		.name		= "usbhost",
 		.parent		= &clk_hclk_psys.clk,
 		.enable		= s5pv210_clk_ip1_ctrl,
 		.ctrlbit	= (1<<17),
diff --git a/arch/arm/mach-s5pv210/include/mach/irqs.h b/arch/arm/mach-s5pv210/include/mach/irqs.h
index 5e0de3a..b62b060 100644
--- a/arch/arm/mach-s5pv210/include/mach/irqs.h
+++ b/arch/arm/mach-s5pv210/include/mach/irqs.h
@@ -59,7 +59,7 @@
 #define IRQ_IIC_HDMIPHY		S5P_IRQ_VIC1(20)
 #define IRQ_HSIRX		S5P_IRQ_VIC1(21)
 #define IRQ_HSITX		S5P_IRQ_VIC1(22)
-#define IRQ_UHOST		S5P_IRQ_VIC1(23)
+#define IRQ_USB_HOST		S5P_IRQ_VIC1(23)
 #define IRQ_OTG			S5P_IRQ_VIC1(24)
 #define IRQ_MSM			S5P_IRQ_VIC1(25)
 #define IRQ_HSMMC0		S5P_IRQ_VIC1(26)
diff --git a/arch/arm/mach-s5pv210/include/mach/map.h b/arch/arm/mach-s5pv210/include/mach/map.h
index 7ff609f..9f9ffe7 100644
--- a/arch/arm/mach-s5pv210/include/mach/map.h
+++ b/arch/arm/mach-s5pv210/include/mach/map.h
@@ -66,6 +66,9 @@
 #define S5PV210_PA_HSOTG		0xEC000000
 #define S5PV210_PA_HSPHY		0xEC100000
 
+#define S5PV210_PA_USB_EHCI		0xEC200000
+#define S5PV210_PA_USB_OHCI		0xEC300000
+
 #define S5PV210_PA_IIS0			0xEEE30000
 #define S5PV210_PA_IIS1			0xE2100000
 #define S5PV210_PA_IIS2			0xE2A00000
@@ -111,6 +114,8 @@
 #define S3C_PA_WDT			S5PV210_PA_WATCHDOG
 
 #define S5P_PA_CHIPID			S5PV210_PA_CHIPID
+#define S5P_PA_EHCI			S5PV210_PA_USB_EHCI
+#define S5P_PA_OHCI			S5PV210_PA_USB_OHCI
 #define S5P_PA_FIMC0			S5PV210_PA_FIMC0
 #define S5P_PA_FIMC1			S5PV210_PA_FIMC1
 #define S5P_PA_FIMC2			S5PV210_PA_FIMC2
diff --git a/arch/arm/mach-s5pv210/mach-smdkv210.c b/arch/arm/mach-s5pv210/mach-smdkv210.c
index 8662ef6..72fd925 100644
--- a/arch/arm/mach-s5pv210/mach-smdkv210.c
+++ b/arch/arm/mach-s5pv210/mach-smdkv210.c
@@ -46,6 +46,8 @@
 #include <plat/s5p-time.h>
 #include <plat/backlight.h>
 #include <plat/regs-fb-v4.h>
+#include <plat/clock.h>
+#include <plat/ehci.h>
 
 /* Following are default values for UCON, ULCON and UFCON UART registers */
 #define SMDKV210_UCON_DEFAULT	(S3C2410_UCON_TXILEVEL |	\
@@ -115,6 +117,8 @@ static struct samsung_keypad_platdata smdkv210_keypad_data __initdata = {
 	.cols		= 8,
 };
 
+static struct s5p_ehci_platdata smdkv210_ehci_pdata;
+
 static struct resource smdkv210_dm9000_resources[] = {
 	[0] = {
 		.start	= S5PV210_PA_SROM_BANK5,
@@ -227,6 +231,7 @@ static struct platform_device *smdkv210_devices[] __initdata = {
 	&s3c_device_wdt,
 	&s5pv210_device_ac97,
 	&s5pv210_device_iis0,
+	&s5p_device_ehci,
 	&s5pv210_device_spdif,
 	&samsung_asoc_dma,
 	&samsung_asoc_idma,
@@ -307,8 +312,12 @@ static void __init smdkv210_machine_init(void)
 
 	s3c_fb_set_platdata(&smdkv210_lcd0_pdata);
 
+	s5p_ehci_set_platdata(&smdkv210_ehci_pdata);
+
 	samsung_bl_set(&smdkv210_bl_gpio_info, &smdkv210_bl_data);
 
+	clk_xusbxti.rate = 24000000;
+
 	platform_add_devices(smdkv210_devices, ARRAY_SIZE(smdkv210_devices));
 }
 
diff --git a/arch/arm/mach-s5pv210/setup-usb-phy.c b/arch/arm/mach-s5pv210/setup-usb-phy.c
new file mode 100644
index 0000000..dff9258
--- /dev/null
+++ b/arch/arm/mach-s5pv210/setup-usb-phy.c
@@ -0,0 +1,83 @@
+/*
+ * Copyright (C) 2011 Samsung Electronics Co.Ltd
+ * Adapted By:	Angus Gratton <gus@projectgus.com>
+ *
+ *  This program is free software; you can redistribute	 it and/or modify it
+ *  under  the terms of	 the GNU General  Public License as published by the
+ *  Free Software Foundation;  either version 2 of the	License, or (at your
+ *  option) any later version.
+ *
+ */
+
+#include <linux/platform_device.h>
+#include <linux/clk.h>
+#include <linux/err.h>
+#include <linux/io.h>
+#include <linux/delay.h>
+#include <mach/regs-clock.h>
+#include <mach/gpio.h>
+#include <plat/ehci.h>
+#include <plat/usb-control.h>
+#include <plat/regs-usb-hsotg-phy.h>
+#include <plat/usb-phy.h>
+#include <plat/clock.h>
+#include <plat/gpio-cfg.h>
+
+int s5p_usb_phy_init(struct platform_device *pdev, int type)
+{
+	int err;
+	struct clk *otg_clk;
+
+	if (type != S5P_USB_PHY_HOST)
+		return -EINVAL;
+
+	otg_clk = clk_get(&pdev->dev, "otg");
+	if (IS_ERR(otg_clk)) {
+		dev_err(&pdev->dev, "Failed to get otg clock\n");
+		return PTR_ERR(otg_clk);
+	}
+
+	err = clk_enable(otg_clk);
+	if (err) {
+		clk_put(otg_clk);
+		return err;
+	}
+
+	if (readl(S5P_USB_PHY_CONTROL) & (0x1<<1)) {
+		clk_disable(otg_clk);
+		clk_put(otg_clk);
+		return 0;
+	}
+
+	__raw_writel(__raw_readl(S5P_USB_PHY_CONTROL) | (0x1<<1),
+		     S5P_USB_PHY_CONTROL);
+	__raw_writel((__raw_readl(S3C_PHYPWR)
+		      & ~(0x1<<7) & ~(0x1<<6)) | (0x1<<8) | (0x1<<5) | SRC_PHYPWR_OTG_DISABLE,
+		     S3C_PHYPWR);
+	__raw_writel((__raw_readl(S3C_PHYCLK) & ~(0x1<<7)) | (0x3<<0),
+		     S3C_PHYCLK);
+	__raw_writel((__raw_readl(S3C_RSTCON)) | (0x1<<4) | (0x1<<3),
+		     S3C_RSTCON);
+	__raw_writel(__raw_readl(S3C_RSTCON) & ~(0x1<<4) & ~(0x1<<3),
+		     S3C_RSTCON);
+	/* "at least 10uS" for PHY reset elsewhere, 20 not enough here... */
+	udelay(50);
+
+	clk_disable(otg_clk);
+	clk_put(otg_clk);
+
+	return 0;
+}
+
+int s5p_usb_phy_exit(struct platform_device *pdev, int type)
+{
+	if (type != S5P_USB_PHY_HOST)
+		return -EINVAL;
+
+	__raw_writel(__raw_readl(S3C_PHYPWR) | (0x1<<7)|(0x1<<6),
+		     S3C_PHYPWR);
+	__raw_writel(__raw_readl(S5P_USB_PHY_CONTROL) & ~(1<<1),
+		     S5P_USB_PHY_CONTROL);
+
+	return 0;
+}
diff --git a/drivers/usb/host/ehci-s5p.c b/drivers/usb/host/ehci-s5p.c
index 024b65c..99f4710 100644
--- a/drivers/usb/host/ehci-s5p.c
+++ b/drivers/usb/host/ehci-s5p.c
@@ -14,7 +14,6 @@
 
 #include <linux/clk.h>
 #include <linux/platform_device.h>
-#include <mach/regs-pmu.h>
 #include <plat/cpu.h>
 #include <plat/ehci.h>
 #include <plat/usb-phy.h>
-- 
1.7.7.3
