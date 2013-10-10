From: Jingoo Han <jg1.han@samsung.com>
Subject: [PATCH V2 2/5] USB: ehci-s5p: Remove non-DT support
Date: Thu, 10 Oct 2013 16:41:19 +0900
Message-ID: <000301cec58c$1be0e560$53a2b020$%han@samsung.com>
References: <000101cec58b$ee8bd2f0$cba378d0$%han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:32952 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751569Ab3JJHlW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 10 Oct 2013 03:41:22 -0400
In-reply-to: <000101cec58b$ee8bd2f0$cba378d0$%han@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Greg Kroah-Hartman' <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 'Kukjin Kim' <kgene.kim@samsung.com>, 'Alan Stern' <stern@rowland.harvard.edu>, 'Sylwester Nawrocki' <s.nawrocki@samsung.com>, 'Tomasz Figa' <t.figa@samsung.com>, 'Sachin Kamat' <sachin.kamat@linaro.org>, 'Jingoo Han' <jg1.han@samsung.com>

The non-DT for EXYNOS SoCs is not supported from v3.11.
Thus, there is no need to support non-DT for Exynos EHCI driver.

The 'include/linux/platform_data/usb-ehci-s5p.h' file has been
used for non-DT support. Thus, the 'usb-ehci-s5p.h' file can
be removed.

Signed-off-by: Jingoo Han <jg1.han@samsung.com>
---
 drivers/usb/host/ehci-s5p.c                |   32 ++++------------------------
 include/linux/platform_data/usb-ehci-s5p.h |   21 ------------------
 2 files changed, 4 insertions(+), 49 deletions(-)
 delete mode 100644 include/linux/platform_data/usb-ehci-s5p.h

diff --git a/drivers/usb/host/ehci-s5p.c b/drivers/usb/host/ehci-s5p.c
index 7c3de95..45e1ad3 100644
--- a/drivers/usb/host/ehci-s5p.c
+++ b/drivers/usb/host/ehci-s5p.c
@@ -20,7 +20,6 @@
 #include <linux/of.h>
 #include <linux/of_gpio.h>
 #include <linux/platform_device.h>
-#include <linux/platform_data/usb-ehci-s5p.h>
 #include <linux/usb/phy.h>
 #include <linux/usb/samsung_usb_phy.h>
 #include <linux/usb.h>
@@ -47,11 +46,8 @@ struct s5p_ehci_hcd {
 	struct clk *clk;
 	struct usb_phy *phy;
 	struct usb_otg *otg;
-	struct s5p_ehci_platdata *pdata;
 };
 
-static struct s5p_ehci_platdata empty_platdata;
-
 #define to_s5p_ehci(hcd)      (struct s5p_ehci_hcd *)(hcd_to_ehci(hcd)->priv)
 
 static void s5p_setup_vbus_gpio(struct platform_device *pdev)
@@ -75,7 +71,6 @@ static void s5p_setup_vbus_gpio(struct platform_device *pdev)
 
 static int s5p_ehci_probe(struct platform_device *pdev)
 {
-	struct s5p_ehci_platdata *pdata = dev_get_platdata(&pdev->dev);
 	struct s5p_ehci_hcd *s5p_ehci;
 	struct usb_hcd *hcd;
 	struct ehci_hcd *ehci;
@@ -105,21 +100,14 @@ static int s5p_ehci_probe(struct platform_device *pdev)
 	s5p_ehci = to_s5p_ehci(hcd);
 
 	if (of_device_is_compatible(pdev->dev.of_node,
-					"samsung,exynos5440-ehci")) {
-		s5p_ehci->pdata = &empty_platdata;
+					"samsung,exynos5440-ehci"))
 		goto skip_phy;
-	}
 
 	phy = devm_usb_get_phy(&pdev->dev, USB_PHY_TYPE_USB2);
 	if (IS_ERR(phy)) {
-		/* Fallback to pdata */
-		if (!pdata) {
-			usb_put_hcd(hcd);
-			dev_warn(&pdev->dev, "no platform data or transceiver defined\n");
-			return -EPROBE_DEFER;
-		} else {
-			s5p_ehci->pdata = pdata;
-		}
+		usb_put_hcd(hcd);
+		dev_warn(&pdev->dev, "no platform data or transceiver defined\n");
+		return -EPROBE_DEFER;
 	} else {
 		s5p_ehci->phy = phy;
 		s5p_ehci->otg = phy->otg;
@@ -167,8 +155,6 @@ skip_phy:
 
 	if (s5p_ehci->phy)
 		usb_phy_init(s5p_ehci->phy);
-	else if (s5p_ehci->pdata->phy_init)
-		s5p_ehci->pdata->phy_init(pdev, USB_PHY_TYPE_HOST);
 
 	ehci = hcd_to_ehci(hcd);
 	ehci->caps = hcd->regs;
@@ -189,8 +175,6 @@ skip_phy:
 fail_add_hcd:
 	if (s5p_ehci->phy)
 		usb_phy_shutdown(s5p_ehci->phy);
-	else if (s5p_ehci->pdata->phy_exit)
-		s5p_ehci->pdata->phy_exit(pdev, USB_PHY_TYPE_HOST);
 fail_io:
 	clk_disable_unprepare(s5p_ehci->clk);
 fail_clk:
@@ -210,8 +194,6 @@ static int s5p_ehci_remove(struct platform_device *pdev)
 
 	if (s5p_ehci->phy)
 		usb_phy_shutdown(s5p_ehci->phy);
-	else if (s5p_ehci->pdata->phy_exit)
-		s5p_ehci->pdata->phy_exit(pdev, USB_PHY_TYPE_HOST);
 
 	clk_disable_unprepare(s5p_ehci->clk);
 
@@ -225,7 +207,6 @@ static int s5p_ehci_suspend(struct device *dev)
 {
 	struct usb_hcd *hcd = dev_get_drvdata(dev);
 	struct s5p_ehci_hcd *s5p_ehci = to_s5p_ehci(hcd);
-	struct platform_device *pdev = to_platform_device(dev);
 
 	bool do_wakeup = device_may_wakeup(dev);
 	int rc;
@@ -237,8 +218,6 @@ static int s5p_ehci_suspend(struct device *dev)
 
 	if (s5p_ehci->phy)
 		usb_phy_shutdown(s5p_ehci->phy);
-	else if (s5p_ehci->pdata->phy_exit)
-		s5p_ehci->pdata->phy_exit(pdev, USB_PHY_TYPE_HOST);
 
 	clk_disable_unprepare(s5p_ehci->clk);
 
@@ -249,7 +228,6 @@ static int s5p_ehci_resume(struct device *dev)
 {
 	struct usb_hcd *hcd = dev_get_drvdata(dev);
 	struct  s5p_ehci_hcd *s5p_ehci = to_s5p_ehci(hcd);
-	struct platform_device *pdev = to_platform_device(dev);
 
 	clk_prepare_enable(s5p_ehci->clk);
 
@@ -258,8 +236,6 @@ static int s5p_ehci_resume(struct device *dev)
 
 	if (s5p_ehci->phy)
 		usb_phy_init(s5p_ehci->phy);
-	else if (s5p_ehci->pdata->phy_init)
-		s5p_ehci->pdata->phy_init(pdev, USB_PHY_TYPE_HOST);
 
 	/* DMA burst Enable */
 	writel(EHCI_INSNREG00_ENABLE_DMA_BURST, EHCI_INSNREG00(hcd->regs));
diff --git a/include/linux/platform_data/usb-ehci-s5p.h b/include/linux/platform_data/usb-ehci-s5p.h
deleted file mode 100644
index 5f28cae..0000000
--- a/include/linux/platform_data/usb-ehci-s5p.h
+++ /dev/null
@@ -1,21 +0,0 @@
-/*
- * Copyright (C) 2011 Samsung Electronics Co.Ltd
- * Author: Joonyoung Shim <jy0922.shim@samsung.com>
- *
- * This program is free software; you can redistribute  it and/or modify it
- * under  the terms of  the GNU General  Public License as published by the
- * Free Software Foundation;  either version 2 of the  License, or (at your
- * option) any later version.
- */
-
-#ifndef __PLAT_SAMSUNG_EHCI_H
-#define __PLAT_SAMSUNG_EHCI_H __FILE__
-
-struct s5p_ehci_platdata {
-	int (*phy_init)(struct platform_device *pdev, int type);
-	int (*phy_exit)(struct platform_device *pdev, int type);
-};
-
-extern void s5p_ehci_set_platdata(struct s5p_ehci_platdata *pd);
-
-#endif /* __PLAT_SAMSUNG_EHCI_H */
-- 
1.7.10.4
