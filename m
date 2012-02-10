From: Lukasz Majewski <l.majewski@samsung.com>
Subject: [PATCH 1/6] ARM: S3C64XX: Add usb otg phy control
Date: Fri, 10 Feb 2012 11:35:41 +0100
Message-ID: <1328870146-20312-2-git-send-email-l.majewski@samsung.com>
References: <1328870146-20312-1-git-send-email-l.majewski@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:37692 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758996Ab2BJKfz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 10 Feb 2012 05:35:55 -0500
Received: from euspt1 ([210.118.77.13]) by mailout3.w1.samsung.com
 (Sun Java(tm) System Messaging Server 6.3-8.04 (built Jul 29 2009; 32bit))
 with ESMTP id <0LZ6002Z2ARR4S30@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 10 Feb 2012 10:35:51 +0000 (GMT)
Received: from linux.samsung.com ([106.116.38.10])
 by spt1.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0LZ600CZAARRQ8@spt1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 10 Feb 2012 10:35:51 +0000 (GMT)
In-reply-to: <1328870146-20312-1-git-send-email-l.majewski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Lukasz Majewski <l.majewski@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>

From: Joonyoung Shim <jy0922.shim@samsung.com>

This patch supports to control usb otg phy of S3C64XX. Currently, the
driver for usb otg controls usb otg phy but it can be removed by this
patch.

Signed-off-by: Joonyoung Shim <jy0922.shim@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
[Rebased on the newest git/kgene/linux-samsung #for-next]
Signed-off-by: Lukasz Majewski <l.majewski@samsung.com>
---
 arch/arm/mach-s3c64xx/Kconfig                      |    8 ++
 arch/arm/mach-s3c64xx/Makefile                     |    1 +
 arch/arm/mach-s3c64xx/mach-crag6410.c              |    4 +
 arch/arm/mach-s3c64xx/mach-smartq.c                |    3 +
 arch/arm/mach-s3c64xx/mach-smdk6410.c              |    4 +
 arch/arm/mach-s3c64xx/setup-usb-phy.c              |   90 ++++++++++++++++++++
 arch/arm/plat-samsung/devs.c                       |   14 +++
 .../plat-samsung/include/plat/regs-usb-hsotg-phy.h |    7 +-
 arch/arm/plat-samsung/include/plat/udc-hs.h        |    5 +
 9 files changed, 133 insertions(+), 3 deletions(-)
 create mode 100644 arch/arm/mach-s3c64xx/setup-usb-phy.c

diff --git a/arch/arm/mach-s3c64xx/Kconfig b/arch/arm/mach-s3c64xx/Kconfig
index dc45123..82c0915 100644
--- a/arch/arm/mach-s3c64xx/Kconfig
+++ b/arch/arm/mach-s3c64xx/Kconfig
@@ -83,6 +83,11 @@ config S3C64XX_SETUP_SPI
 	help
 	 Common setup code for SPI GPIO configurations
 
+config S3C64XX_SETUP_USB_PHY
+	bool
+	help
+	  Common setup code for USB PHY controller
+
 # S36400 Macchine support
 
 config MACH_SMDK6400
@@ -157,6 +162,7 @@ config MACH_SMDK6410
 	select S3C64XX_SETUP_IDE
 	select S3C64XX_SETUP_FB_24BPP
 	select S3C64XX_SETUP_KEYPAD
+	select S3C64XX_SETUP_USB_PHY
 	help
 	  Machine support for the Samsung SMDK6410
 
@@ -256,6 +262,7 @@ config MACH_SMARTQ
 	select S3C_DEV_USB_HOST
 	select S3C64XX_SETUP_SDHCI
 	select S3C64XX_SETUP_FB_24BPP
+	select S3C64XX_SETUP_USB_PHY
 	select SAMSUNG_DEV_ADC
 	select SAMSUNG_DEV_PWM
 	select SAMSUNG_DEV_TS
@@ -283,6 +290,7 @@ config MACH_WLF_CRAGG_6410
 	select S3C64XX_SETUP_FB_24BPP
 	select S3C64XX_SETUP_KEYPAD
 	select S3C64XX_SETUP_SPI
+	select S3C64XX_SETUP_USB_PHY
 	select SAMSUNG_DEV_ADC
 	select SAMSUNG_DEV_KEYPAD
 	select S3C_DEV_USB_HOST
diff --git a/arch/arm/mach-s3c64xx/Makefile b/arch/arm/mach-s3c64xx/Makefile
index 610fe28..f9ce1dc 100644
--- a/arch/arm/mach-s3c64xx/Makefile
+++ b/arch/arm/mach-s3c64xx/Makefile
@@ -43,6 +43,7 @@ obj-$(CONFIG_S3C64XX_SETUP_IDE)		+= setup-ide.o
 obj-$(CONFIG_S3C64XX_SETUP_KEYPAD)	+= setup-keypad.o
 obj-$(CONFIG_S3C64XX_SETUP_SDHCI_GPIO)	+= setup-sdhci-gpio.o
 obj-$(CONFIG_S3C64XX_SETUP_SPI)		+= setup-spi.o
+obj-$(CONFIG_S3C64XX_SETUP_USB_PHY) += setup-usb-phy.o
 
 # Machine support
 
diff --git a/arch/arm/mach-s3c64xx/mach-crag6410.c b/arch/arm/mach-s3c64xx/mach-crag6410.c
index f93caad..c55a822 100644
--- a/arch/arm/mach-s3c64xx/mach-crag6410.c
+++ b/arch/arm/mach-s3c64xx/mach-crag6410.c
@@ -61,6 +61,7 @@
 #include <plat/sdhci.h>
 #include <plat/gpio-cfg.h>
 #include <plat/s3c64xx-spi.h>
+#include <plat/udc-hs.h>
 
 #include <plat/keypad.h>
 #include <plat/clock.h>
@@ -759,6 +760,8 @@ static const struct gpio_led_platform_data gpio_leds_pdata = {
 	.num_leds = ARRAY_SIZE(gpio_leds),
 };
 
+static struct s3c_hsotg_plat crag6410_hsotg_pdata;
+
 static void __init crag6410_machine_init(void)
 {
 	/* Open drain IRQs need pullups */
@@ -783,6 +786,7 @@ static void __init crag6410_machine_init(void)
 	s3c_i2c0_set_platdata(&i2c0_pdata);
 	s3c_i2c1_set_platdata(&i2c1_pdata);
 	s3c_fb_set_platdata(&crag6410_lcd_pdata);
+	s3c_hsotg_set_platdata(&crag6410_hsotg_pdata);
 
 	i2c_register_board_info(0, i2c_devs0, ARRAY_SIZE(i2c_devs0));
 	i2c_register_board_info(1, i2c_devs1, ARRAY_SIZE(i2c_devs1));
diff --git a/arch/arm/mach-s3c64xx/mach-smartq.c b/arch/arm/mach-s3c64xx/mach-smartq.c
index ce31db1..ce745e1 100644
--- a/arch/arm/mach-s3c64xx/mach-smartq.c
+++ b/arch/arm/mach-s3c64xx/mach-smartq.c
@@ -187,6 +187,8 @@ static struct s3c_hwmon_pdata smartq_hwmon_pdata __initdata = {
 	},
 };
 
+static struct s3c_hsotg_plat smartq_hsotg_pdata;
+
 static int __init smartq_lcd_setup_gpio(void)
 {
 	int ret;
@@ -383,6 +385,7 @@ void __init smartq_map_io(void)
 void __init smartq_machine_init(void)
 {
 	s3c_i2c0_set_platdata(NULL);
+	s3c_hsotg_set_platdata(&smartq_hsotg_pdata);
 	s3c_hwmon_set_platdata(&smartq_hwmon_pdata);
 	s3c_sdhci1_set_platdata(&smartq_internal_hsmmc_pdata);
 	s3c_sdhci2_set_platdata(&smartq_internal_hsmmc_pdata);
diff --git a/arch/arm/mach-s3c64xx/mach-smdk6410.c b/arch/arm/mach-s3c64xx/mach-smdk6410.c
index ca6fc20..d55bc96 100644
--- a/arch/arm/mach-s3c64xx/mach-smdk6410.c
+++ b/arch/arm/mach-s3c64xx/mach-smdk6410.c
@@ -72,6 +72,7 @@
 #include <plat/keypad.h>
 #include <plat/backlight.h>
 #include <plat/regs-fb-v4.h>
+#include <plat/udc-hs.h>
 
 #include "common.h"
 
@@ -631,6 +632,8 @@ static struct platform_pwm_backlight_data smdk6410_bl_data = {
 	.pwm_id = 1,
 };
 
+static struct s3c_hsotg_plat smdk6410_hsotg_pdata;
+
 static void __init smdk6410_map_io(void)
 {
 	u32 tmp;
@@ -659,6 +662,7 @@ static void __init smdk6410_machine_init(void)
 	s3c_i2c0_set_platdata(NULL);
 	s3c_i2c1_set_platdata(NULL);
 	s3c_fb_set_platdata(&smdk6410_lcd_pdata);
+	s3c_hsotg_set_platdata(&smdk6410_hsotg_pdata);
 
 	samsung_keypad_set_platdata(&smdk6410_keypad_data);
 
diff --git a/arch/arm/mach-s3c64xx/setup-usb-phy.c b/arch/arm/mach-s3c64xx/setup-usb-phy.c
new file mode 100644
index 0000000..f6757e0
--- /dev/null
+++ b/arch/arm/mach-s3c64xx/setup-usb-phy.c
@@ -0,0 +1,90 @@
+/*
+ * Copyright (C) 2011 Samsung Electronics Co.Ltd
+ * Author: Joonyoung Shim <jy0922.shim@samsung.com>
+ *
+ *  This program is free software; you can redistribute  it and/or modify it
+ *  under  the terms of  the GNU General  Public License as published by the
+ *  Free Software Foundation;  either version 2 of the  License, or (at your
+ *  option) any later version.
+ *
+ */
+
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/err.h>
+#include <linux/io.h>
+#include <linux/platform_device.h>
+#include <mach/map.h>
+#include <mach/regs-sys.h>
+#include <plat/cpu.h>
+#include <plat/regs-usb-hsotg-phy.h>
+#include <plat/usb-phy.h>
+
+static int s3c_usb_otgphy_init(struct platform_device *pdev)
+{
+	struct clk *xusbxti;
+	u32 phyclk;
+
+	writel(readl(S3C64XX_OTHERS) | S3C64XX_OTHERS_USBMASK, S3C64XX_OTHERS);
+
+	/* set clock frequency for PLL */
+	phyclk = readl(S3C_PHYCLK) & ~S3C_PHYCLK_CLKSEL_MASK;
+
+	xusbxti = clk_get(&pdev->dev, "xusbxti");
+	if (xusbxti && !IS_ERR(xusbxti)) {
+		switch (clk_get_rate(xusbxti)) {
+		case 12 * MHZ:
+			phyclk |= S3C_PHYCLK_CLKSEL_12M;
+			break;
+		case 24 * MHZ:
+			phyclk |= S3C_PHYCLK_CLKSEL_24M;
+			break;
+		default:
+		case 48 * MHZ:
+			/* default reference clock */
+			break;
+		}
+		clk_put(xusbxti);
+	}
+
+	/* TODO: select external clock/oscillator */
+	writel(phyclk | S3C_PHYCLK_CLK_FORCE, S3C_PHYCLK);
+
+	/* set to normal OTG PHY */
+	writel((readl(S3C_PHYPWR) & ~S3C_PHYPWR_NORMAL_MASK), S3C_PHYPWR);
+	mdelay(1);
+
+	/* reset OTG PHY and Link */
+	writel(S3C_RSTCON_PHY | S3C_RSTCON_HCLK | S3C_RSTCON_PHYCLK,
+			S3C_RSTCON);
+	udelay(20);	/* at-least 10uS */
+	writel(0, S3C_RSTCON);
+
+	return 0;
+}
+
+static int s3c_usb_otgphy_exit(struct platform_device *pdev)
+{
+	writel((readl(S3C_PHYPWR) | S3C_PHYPWR_ANALOG_POWERDOWN |
+				S3C_PHYPWR_OTG_DISABLE), S3C_PHYPWR);
+
+	writel(readl(S3C64XX_OTHERS) & ~S3C64XX_OTHERS_USBMASK, S3C64XX_OTHERS);
+
+	return 0;
+}
+
+int s5p_usb_phy_init(struct platform_device *pdev, int type)
+{
+	if (type == S5P_USB_PHY_DEVICE)
+		return s3c_usb_otgphy_init(pdev);
+
+	return -EINVAL;
+}
+
+int s5p_usb_phy_exit(struct platform_device *pdev, int type)
+{
+	if (type == S5P_USB_PHY_DEVICE)
+		return s3c_usb_otgphy_exit(pdev);
+
+	return -EINVAL;
+}
diff --git a/arch/arm/plat-samsung/devs.c b/arch/arm/plat-samsung/devs.c
index 145580a..21168ea 100644
--- a/arch/arm/plat-samsung/devs.c
+++ b/arch/arm/plat-samsung/devs.c
@@ -57,6 +57,7 @@
 #include <plat/sdhci.h>
 #include <plat/ts.h>
 #include <plat/udc.h>
+#include <plat/udc-hs.h>
 #include <plat/usb-control.h>
 #include <plat/usb-phy.h>
 #include <plat/regs-iic.h>
@@ -1449,6 +1450,19 @@ struct platform_device s3c_device_usb_hsotg = {
 		.coherent_dma_mask	= DMA_BIT_MASK(32),
 	},
 };
+
+void __init s3c_hsotg_set_platdata(struct s3c_hsotg_plat *pd)
+{
+	struct s3c_hsotg_plat *npd;
+
+	npd = s3c_set_platdata(pd, sizeof(struct s3c_hsotg_plat),
+			&s3c_device_usb_hsotg);
+
+	if (!npd->phy_init)
+		npd->phy_init = s5p_usb_phy_init;
+	if (!npd->phy_exit)
+		npd->phy_exit = s5p_usb_phy_exit;
+}
 #endif /* CONFIG_S3C_DEV_USB_HSOTG */
 
 /* USB High Spped 2.0 Device (Gadget) */
diff --git a/arch/arm/plat-samsung/include/plat/regs-usb-hsotg-phy.h b/arch/arm/plat-samsung/include/plat/regs-usb-hsotg-phy.h
index a111ad8..fcf2796 100644
--- a/arch/arm/plat-samsung/include/plat/regs-usb-hsotg-phy.h
+++ b/arch/arm/plat-samsung/include/plat/regs-usb-hsotg-phy.h
@@ -25,8 +25,9 @@
 #define S3C_HSOTG_PHYREG(x)	((x) + S3C_VA_USB_HSPHY)
 
 #define S3C_PHYPWR				S3C_HSOTG_PHYREG(0x00)
-#define SRC_PHYPWR_OTG_DISABLE			(1 << 4)
-#define SRC_PHYPWR_ANALOG_POWERDOWN		(1 << 3)
+#define S3C_PHYPWR_NORMAL_MASK			(0x19 << 0)
+#define S3C_PHYPWR_OTG_DISABLE			(1 << 4)
+#define S3C_PHYPWR_ANALOG_POWERDOWN		(1 << 3)
 #define SRC_PHYPWR_FORCE_SUSPEND		(1 << 1)
 
 #define S3C_PHYCLK				S3C_HSOTG_PHYREG(0x04)
@@ -42,7 +43,7 @@
 
 #define S3C_RSTCON				S3C_HSOTG_PHYREG(0x08)
 #define S3C_RSTCON_PHYCLK			(1 << 2)
-#define S3C_RSTCON_HCLK				(1 << 2)
+#define S3C_RSTCON_HCLK				(1 << 1)
 #define S3C_RSTCON_PHY				(1 << 0)
 
 #define S3C_PHYTUNE				S3C_HSOTG_PHYREG(0x20)
diff --git a/arch/arm/plat-samsung/include/plat/udc-hs.h b/arch/arm/plat-samsung/include/plat/udc-hs.h
index a22a4f2..c9e3667 100644
--- a/arch/arm/plat-samsung/include/plat/udc-hs.h
+++ b/arch/arm/plat-samsung/include/plat/udc-hs.h
@@ -26,4 +26,9 @@ enum s3c_hsotg_dmamode {
 struct s3c_hsotg_plat {
 	enum s3c_hsotg_dmamode	dma;
 	unsigned int		is_osc : 1;
+
+	int (*phy_init)(struct platform_device *pdev, int type);
+	int (*phy_exit)(struct platform_device *pdev, int type);
 };
+
+extern void s3c_hsotg_set_platdata(struct s3c_hsotg_plat *pd);
-- 
1.7.2.3
