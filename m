From: Lukasz Majewski <l.majewski@samsung.com>
Subject: Re: [PATCH 1/6] ARM: S3C64XX: Add usb otg phy control
Date: Thu, 08 Mar 2012 14:20:33 +0100
Message-ID: <20120308142033.2acb142e@lmajewski.digital.local>
References: <1328870146-20312-1-git-send-email-l.majewski@samsung.com>
 <1328870146-20312-2-git-send-email-l.majewski@samsung.com>
 <20120210182639.GB11701@sirena.org.uk> <4F575452.4090201@samsung.com>
 <4F58816F.2030004@samsung.com> <4F5897A2.807@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="Boundary_(ID_/50uGKAtqhNBUUR77k3Lag)"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:36649 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752270Ab2CHNUn (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 8 Mar 2012 08:20:43 -0500
Received: from euspt1 ([210.118.77.14]) by mailout4.w1.samsung.com
 (Sun Java(tm) System Messaging Server 6.3-8.04 (built Jul 29 2009; 32bit))
 with ESMTP id <0M0K003SYIEH7F80@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 08 Mar 2012 13:20:42 +0000 (GMT)
Received: from linux.samsung.com ([106.116.38.10])
 by spt1.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0M0K00BGCIEGYT@spt1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 08 Mar 2012 13:20:41 +0000 (GMT)
In-reply-to: <4F5897A2.807@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Joonyoung Shim <jy0922.shim@samsung.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Mark Brown <broonie@opensource.wolfsonmicro.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>


--Boundary_(ID_/50uGKAtqhNBUUR77k3Lag)
Content-type: text/plain; charset=US-ASCII
Content-transfer-encoding: 7BIT
Content-disposition: inline

Hi Joonyoung,

On Thu, 8 Mar 2012 12:27:30 +0100
Joonyoung Shim <jy0922.shim@samsung.com> wrote:

> On 03/08/2012 06:52 PM, Kukjin Kim wrote:
> > On 03/07/12 04:28, Kukjin Kim wrote:
> >> On 02/10/12 10:26, Mark Brown wrote:
> >>> On Fri, Feb 10, 2012 at 11:35:41AM +0100, Lukasz Majewski wrote:
> >>>> From: Joonyoung Shim<jy0922.shim@samsung.com>
> >>>>
> >>>> This patch supports to control usb otg phy of S3C64XX.
> >>>> Currently, the driver for usb otg controls usb otg phy but it
> >>>> can be removed by this patch.
> >>>
> >>> Acked-by: Mark Brown<broonie@opensource.wolfsonmicro.com>
> >>
> >> Applied, thanks.
> >>
> >
> > Oops, following error happened with s5pv210_defconfig after
> > applying this.
> >
> > arch/arm/plat-samsung/built-in.o: In function
> > `s3c_hsotg_set_platdata': arch/arm/plat-samsung/devs.c:1449:
> > undefined reference to `s5p_usb_phy_init'
> > arch/arm/plat-samsung/devs.c:1449: undefined reference to 
> > `s5p_usb_phy_init'
> > arch/arm/plat-samsung/devs.c:1451: undefined reference to 
> > `s5p_usb_phy_exit'
> > arch/arm/plat-samsung/devs.c:1451: undefined reference to 
> > `s5p_usb_phy_exit'
> > make: *** [.tmp_vmlinux1] Error 1
> >
> 
> Also the s5pv210 needs setup-usb-phy.c file. I think the attached
> patch will solve this errors. This patch was tested only compile.
> 
> Thanks.

Thank you for the patch.

I've extended your's patch by adding GONI dependent platform code.

It has been tested and works with s3c-hsotg driver.

Test HW:
GONI S5PC110 

Tested-by: Lukasz Majewski <l.majewski@samsung.com>


-- 
Best regards,

Lukasz Majewski

Samsung Poland R&D Center
Platform Group

--Boundary_(ID_/50uGKAtqhNBUUR77k3Lag)
Content-type: text/x-patch; NAME=0001-ARM-S5PV210-Add-usb-otg-phy-control.patch
Content-transfer-encoding: 7BIT
Content-disposition: attachment;
 filename=0001-ARM-S5PV210-Add-usb-otg-phy-control.patch

>From a18166a6e87df8ade29f1d4e37b96f932d2a8909 Mon Sep 17 00:00:00 2001
From: Joonyoung Shim <jy0922.shim@samsung.com>
Date: Thu, 8 Mar 2012 19:52:25 +0900
Subject: [PATCH] ARM: S5PV210: Add usb otg phy control

This patch supports to control usb otg phy of S5PV210. Based on
setup-usb-phy.c of S3C64XX.

Signed-off-by: Joonyoung Shim <jy0922.shim@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/mach-s5pv210/Kconfig                 |    7 ++
 arch/arm/mach-s5pv210/Makefile                |    1 +
 arch/arm/mach-s5pv210/include/mach/regs-sys.h |    4 -
 arch/arm/mach-s5pv210/mach-goni.c             |    6 ++
 arch/arm/mach-s5pv210/setup-usb-phy.c         |   90 +++++++++++++++++++++++++
 5 files changed, 104 insertions(+), 4 deletions(-)
 create mode 100644 arch/arm/mach-s5pv210/setup-usb-phy.c

diff --git a/arch/arm/mach-s5pv210/Kconfig b/arch/arm/mach-s5pv210/Kconfig
index 2ae6a5f..b51210c 100644
--- a/arch/arm/mach-s5pv210/Kconfig
+++ b/arch/arm/mach-s5pv210/Kconfig
@@ -65,6 +65,11 @@ config S5PV210_SETUP_SPI
 	help
 	  Common setup code for SPI GPIO configurations.
 
+config S5PV210_SETUP_USB_PHY
+	bool
+	help
+	  Common setup code for USB PHY controller
+
 menu "S5PC110 Machines"
 
 config MACH_AQUILA
@@ -81,6 +86,7 @@ config MACH_AQUILA
 	select S3C_DEV_USB_HSOTG
 	select S5PV210_SETUP_FB_24BPP
 	select S5PV210_SETUP_SDHCI
+	select S5PV210_SETUP_USB_PHY
 	help
 	  Machine support for the Samsung Aquila target based on S5PC110 SoC
 
@@ -108,6 +114,7 @@ config MACH_GONI
 	select S5PV210_SETUP_KEYPAD
 	select S5PV210_SETUP_SDHCI
 	select S5PV210_SETUP_FIMC
+	select S5PV210_SETUP_USB_PHY
 	help
 	  Machine support for Samsung GONI board
 	  S5PC110(MCP) is one of package option of S5PV210
diff --git a/arch/arm/mach-s5pv210/Makefile b/arch/arm/mach-s5pv210/Makefile
index 76a121d..1c4e419 100644
--- a/arch/arm/mach-s5pv210/Makefile
+++ b/arch/arm/mach-s5pv210/Makefile
@@ -39,3 +39,4 @@ obj-$(CONFIG_S5PV210_SETUP_IDE)		+= setup-ide.o
 obj-$(CONFIG_S5PV210_SETUP_KEYPAD)	+= setup-keypad.o
 obj-$(CONFIG_S5PV210_SETUP_SDHCI_GPIO)	+= setup-sdhci-gpio.o
 obj-$(CONFIG_S5PV210_SETUP_SPI)		+= setup-spi.o
+obj-$(CONFIG_S5PV210_SETUP_USB_PHY) += setup-usb-phy.o
diff --git a/arch/arm/mach-s5pv210/include/mach/regs-sys.h b/arch/arm/mach-s5pv210/include/mach/regs-sys.h
index 26691d3..cccb1ed 100644
--- a/arch/arm/mach-s5pv210/include/mach/regs-sys.h
+++ b/arch/arm/mach-s5pv210/include/mach/regs-sys.h
@@ -13,7 +13,3 @@
 #define S5PV210_USB_PHY_CON	(S3C_VA_SYS + 0xE80C)
 #define S5PV210_USB_PHY0_EN	(1 << 0)
 #define S5PV210_USB_PHY1_EN	(1 << 1)
-
-/* compatibility defines for s3c-hsotg driver */
-#define S3C64XX_OTHERS		S5PV210_USB_PHY_CON
-#define S3C64XX_OTHERS_USBMASK	S5PV210_USB_PHY0_EN
diff --git a/arch/arm/mach-s5pv210/mach-goni.c b/arch/arm/mach-s5pv210/mach-goni.c
index 2cf5ed7..f5f4926 100644
--- a/arch/arm/mach-s5pv210/mach-goni.c
+++ b/arch/arm/mach-s5pv210/mach-goni.c
@@ -49,6 +49,7 @@
 #include <plat/mfc.h>
 #include <plat/regs-fb-v4.h>
 #include <plat/camport.h>
+#include <plat/udc-hs.h>
 
 #include <media/v4l2-mediabus.h>
 #include <media/s5p_fimc.h>
@@ -277,6 +278,9 @@ static void __init goni_tsp_init(void)
 	i2c2_devs[0].irq = gpio_to_irq(gpio);
 }
 
+/* USB OTG */
+static struct s3c_hsotg_plat goni_hsotg_pdata;
+
 static void goni_camera_init(void)
 {
 	s5pv210_fimc_setup_gpio(S5P_CAMPORT_A);
@@ -939,6 +943,8 @@ static void __init goni_machine_init(void)
 	s3c_set_platdata(&goni_fimc_md_platdata, sizeof(goni_fimc_md_platdata),
 			 &s5p_device_fimc_md);
 
+	s3c_hsotg_set_platdata(&goni_hsotg_pdata);
+
 	goni_camera_init();
 
 	/* SPI */
diff --git a/arch/arm/mach-s5pv210/setup-usb-phy.c b/arch/arm/mach-s5pv210/setup-usb-phy.c
new file mode 100644
index 0000000..be39cf4
--- /dev/null
+++ b/arch/arm/mach-s5pv210/setup-usb-phy.c
@@ -0,0 +1,90 @@
+/*
+ * Copyright (C) 2012 Samsung Electronics Co.Ltd
+ * Author: Joonyoung Shim <jy0922.shim@samsung.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundationr
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
+static int s5pv210_usb_otgphy_init(struct platform_device *pdev)
+{
+	struct clk *xusbxti;
+	u32 phyclk;
+
+	writel(readl(S5PV210_USB_PHY_CON) | S5PV210_USB_PHY0_EN,
+			S5PV210_USB_PHY_CON);
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
+static int s5pv210_usb_otgphy_exit(struct platform_device *pdev)
+{
+	writel((readl(S3C_PHYPWR) | S3C_PHYPWR_ANALOG_POWERDOWN |
+				S3C_PHYPWR_OTG_DISABLE), S3C_PHYPWR);
+
+	writel(readl(S5PV210_USB_PHY_CON) & ~S5PV210_USB_PHY0_EN,
+			S5PV210_USB_PHY_CON);
+
+	return 0;
+}
+
+int s5p_usb_phy_init(struct platform_device *pdev, int type)
+{
+	if (type == S5P_USB_PHY_DEVICE)
+		return s5pv210_usb_otgphy_init(pdev);
+
+	return -EINVAL;
+}
+
+int s5p_usb_phy_exit(struct platform_device *pdev, int type)
+{
+	if (type == S5P_USB_PHY_DEVICE)
+		return s5pv210_usb_otgphy_exit(pdev);
+
+	return -EINVAL;
+}
-- 
1.7.2.3


--Boundary_(ID_/50uGKAtqhNBUUR77k3Lag)--
