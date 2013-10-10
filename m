From: Jingoo Han <jg1.han@samsung.com>
Subject: [PATCH 3/5] USB: ehci-exynos: Remove non-DT support
Date: Thu, 10 Oct 2013 15:31:58 +0900
Message-ID: <000901cec582$6ba1f6c0$42e5e440$%han@samsung.com>
References: <000001cec582$02a6cfb0$07f46f10$%han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:40103 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751569Ab3JJGb7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 10 Oct 2013 02:31:59 -0400
In-reply-to: <000001cec582$02a6cfb0$07f46f10$%han@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Greg Kroah-Hartman' <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 'Kukjin Kim' <kgene.kim@samsung.com>, 'Alan Stern' <stern@rowland.harvard.edu>, 'Sylwester Nawrocki' <s.nawrocki@samsung.com>, 'Tomasz Figa' <t.figa@samsung.com>, 'Jingoo Han' <jg1.han@samsung.com>

The non-DT for EXYNOS SoCs is not supported from v3.11.
Thus, there is no need to support non-DT for Exynos EHCI driver.

The 'include/linux/platform_data/usb-ehci-exynos.h' file has been
used for non-DT support. Thus, the 'usb-ehci-exynos.h' file can
be removed.

Signed-off-by: Jingoo Han <jg1.han@samsung.com>
---
 drivers/usb/host/ehci-exynos.c                |   33 +++----------------------
 include/linux/platform_data/usb-ehci-exynos.h |   21 ----------------
 2 files changed, 4 insertions(+), 50 deletions(-)
 delete mode 100644 include/linux/platform_data/usb-ehci-exynos.h

diff --git a/drivers/usb/host/ehci-exynos.c b/drivers/usb/host/ehci-exynos.c
index 42b5fb8..80c6a91 100644
--- a/drivers/usb/host/ehci-exynos.c
+++ b/drivers/usb/host/ehci-exynos.c
@@ -20,7 +20,6 @@
 #include <linux/of.h>
 #include <linux/of_gpio.h>
 #include <linux/platform_device.h>
-#include <linux/platform_data/usb-ehci-exynos.h>
 #include <linux/usb/phy.h>
 #include <linux/usb/samsung_usb_phy.h>
 #include <linux/usb.h>
@@ -47,11 +46,8 @@ struct exynos_ehci_hcd {
 	struct clk *clk;
 	struct usb_phy *phy;
 	struct usb_otg *otg;
-	struct exynos_ehci_platdata *pdata;
 };
 
-static struct exynos_ehci_platdata empty_platdata;
-
 #define to_exynos_ehci(hcd) (struct exynos_ehci_hcd *)(hcd_to_ehci(hcd)->priv)
 
 static void exynos_setup_vbus_gpio(struct platform_device *pdev)
@@ -75,7 +71,6 @@ static void exynos_setup_vbus_gpio(struct platform_device *pdev)
 
 static int exynos_ehci_probe(struct platform_device *pdev)
 {
-	struct exynos_ehci_platdata *pdata = dev_get_platdata(&pdev->dev);
 	struct exynos_ehci_hcd *exynos_ehci;
 	struct usb_hcd *hcd;
 	struct ehci_hcd *ehci;
@@ -105,21 +100,14 @@ static int exynos_ehci_probe(struct platform_device *pdev)
 	exynos_ehci = to_exynos_ehci(hcd);
 
 	if (of_device_is_compatible(pdev->dev.of_node,
-					"samsung,exynos5440-ehci")) {
-		exynos_ehci->pdata = &empty_platdata;
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
-			exynos_ehci->pdata = pdata;
-		}
+		usb_put_hcd(hcd);
+		dev_warn(&pdev->dev, "no platform data or transceiver defined\n");
+		return -EPROBE_DEFER;
 	} else {
 		exynos_ehci->phy = phy;
 		exynos_ehci->otg = phy->otg;
@@ -167,8 +155,6 @@ skip_phy:
 
 	if (exynos_ehci->phy)
 		usb_phy_init(exynos_ehci->phy);
-	else if (exynos_ehci->pdata->phy_init)
-		exynos_ehci->pdata->phy_init(pdev, USB_PHY_TYPE_HOST);
 
 	ehci = hcd_to_ehci(hcd);
 	ehci->caps = hcd->regs;
@@ -189,8 +175,6 @@ skip_phy:
 fail_add_hcd:
 	if (exynos_ehci->phy)
 		usb_phy_shutdown(exynos_ehci->phy);
-	else if (exynos_ehci->pdata->phy_exit)
-		exynos_ehci->pdata->phy_exit(pdev, USB_PHY_TYPE_HOST);
 fail_io:
 	clk_disable_unprepare(exynos_ehci->clk);
 fail_clk:
@@ -210,8 +194,6 @@ static int exynos_ehci_remove(struct platform_device *pdev)
 
 	if (exynos_ehci->phy)
 		usb_phy_shutdown(exynos_ehci->phy);
-	else if (exynos_ehci->pdata->phy_exit)
-		exynos_ehci->pdata->phy_exit(pdev, USB_PHY_TYPE_HOST);
 
 	clk_disable_unprepare(exynos_ehci->clk);
 
@@ -225,8 +207,6 @@ static int exynos_ehci_suspend(struct device *dev)
 {
 	struct usb_hcd *hcd = dev_get_drvdata(dev);
 	struct exynos_ehci_hcd *exynos_ehci = to_exynos_ehci(hcd);
-	struct platform_device *pdev = to_platform_device(dev);
-
 	bool do_wakeup = device_may_wakeup(dev);
 	int rc;
 
@@ -237,8 +217,6 @@ static int exynos_ehci_suspend(struct device *dev)
 
 	if (exynos_ehci->phy)
 		usb_phy_shutdown(exynos_ehci->phy);
-	else if (exynos_ehci->pdata->phy_exit)
-		exynos_ehci->pdata->phy_exit(pdev, USB_PHY_TYPE_HOST);
 
 	clk_disable_unprepare(exynos_ehci->clk);
 
@@ -249,7 +227,6 @@ static int exynos_ehci_resume(struct device *dev)
 {
 	struct usb_hcd *hcd = dev_get_drvdata(dev);
 	struct exynos_ehci_hcd *exynos_ehci = to_exynos_ehci(hcd);
-	struct platform_device *pdev = to_platform_device(dev);
 
 	clk_prepare_enable(exynos_ehci->clk);
 
@@ -258,8 +235,6 @@ static int exynos_ehci_resume(struct device *dev)
 
 	if (exynos_ehci->phy)
 		usb_phy_init(exynos_ehci->phy);
-	else if (exynos_ehci->pdata->phy_init)
-		exynos_ehci->pdata->phy_init(pdev, USB_PHY_TYPE_HOST);
 
 	/* DMA burst Enable */
 	writel(EHCI_INSNREG00_ENABLE_DMA_BURST, EHCI_INSNREG00(hcd->regs));
diff --git a/include/linux/platform_data/usb-ehci-exynos.h b/include/linux/platform_data/usb-ehci-exynos.h
deleted file mode 100644
index 5413745..0000000
--- a/include/linux/platform_data/usb-ehci-exynos.h
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
-#ifndef __USB_EHCI_EXYNOS_H
-#define __USB_EHCI_EXYNOS_H __FILE__
-
-struct exynos_ehci_platdata {
-	int (*phy_init)(struct platform_device *pdev, int type);
-	int (*phy_exit)(struct platform_device *pdev, int type);
-};
-
-extern void exynos_ehci_set_platdata(struct exynos_ehci_platdata *pd);
-
-#endif /* __USB_EHCI_EXYNOS_H */
-- 
1.7.10.4
