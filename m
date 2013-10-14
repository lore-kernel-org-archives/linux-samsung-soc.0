From: Jingoo Han <jg1.han@samsung.com>
Subject: [PATCH V3] USB: ohci-exynos: Remove non-DT support
Date: Mon, 14 Oct 2013 09:18:54 +0900
Message-ID: <000701cec872$f7d1c5b0$e7755110$%han@samsung.com>
References: <000101cec58b$ee8bd2f0$cba378d0$%han@samsung.com>
 <000401cec58c$2dff1c30$89fd5490$%han@samsung.com>
 <20131011235511.GA2571@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:24129 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755331Ab3JNAS7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 13 Oct 2013 20:18:59 -0400
In-reply-to: <20131011235511.GA2571@kroah.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Greg Kroah-Hartman' <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 'Kukjin Kim' <kgene.kim@samsung.com>, 'Alan Stern' <stern@rowland.harvard.edu>, 'Sylwester Nawrocki' <s.nawrocki@samsung.com>, 'Tomasz Figa' <t.figa@samsung.com>, 'Sachin Kamat' <sachin.kamat@linaro.org>, 'Jingoo Han' <jg1.han@samsung.com>

The non-DT for EXYNOS SoCs is not supported from v3.11.
Thus, there is no need to support non-DT for Exynos OHCI driver.

The 'include/linux/platform_data/usb-ohci-exynos.h' file has been
used for non-DT support. Thus, the 'usb-ohci-exynos.h' file can
be removed.

Signed-off-by: Jingoo Han <jg1.han@samsung.com>
---
- re-based against the latest 'usb-next' branch.

 drivers/usb/host/ohci-exynos.c                |   18 +++---------------
 include/linux/platform_data/usb-ohci-exynos.h |   21 ---------------------
 2 files changed, 3 insertions(+), 36 deletions(-)
 delete mode 100644 include/linux/platform_data/usb-ohci-exynos.h

diff --git a/drivers/usb/host/ohci-exynos.c b/drivers/usb/host/ohci-exynos.c
index 122e52e..aa50e18 100644
--- a/drivers/usb/host/ohci-exynos.c
+++ b/drivers/usb/host/ohci-exynos.c
@@ -18,7 +18,6 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
-#include <linux/platform_data/usb-ohci-exynos.h>
 #include <linux/usb/phy.h>
 #include <linux/usb/samsung_usb_phy.h>
 #include <linux/usb.h>
@@ -38,7 +37,6 @@ struct exynos_ohci_hcd {
 	struct clk *clk;
 	struct usb_phy *phy;
 	struct usb_otg *otg;
-	struct exynos4_ohci_platdata *pdata;
 };
 
 static void exynos_ohci_phy_enable(struct platform_device *pdev)
@@ -48,8 +46,6 @@ static void exynos_ohci_phy_enable(struct platform_device *pdev)
 
 	if (exynos_ohci->phy)
 		usb_phy_init(exynos_ohci->phy);
-	else if (exynos_ohci->pdata && exynos_ohci->pdata->phy_init)
-		exynos_ohci->pdata->phy_init(pdev, USB_PHY_TYPE_HOST);
 }
 
 static void exynos_ohci_phy_disable(struct platform_device *pdev)
@@ -59,13 +55,10 @@ static void exynos_ohci_phy_disable(struct platform_device *pdev)
 
 	if (exynos_ohci->phy)
 		usb_phy_shutdown(exynos_ohci->phy);
-	else if (exynos_ohci->pdata && exynos_ohci->pdata->phy_exit)
-		exynos_ohci->pdata->phy_exit(pdev, USB_PHY_TYPE_HOST);
 }
 
 static int exynos_ohci_probe(struct platform_device *pdev)
 {
-	struct exynos4_ohci_platdata *pdata = dev_get_platdata(&pdev->dev);
 	struct exynos_ohci_hcd *exynos_ohci;
 	struct usb_hcd *hcd;
 	struct resource *res;
@@ -98,14 +91,9 @@ static int exynos_ohci_probe(struct platform_device *pdev)
 
 	phy = devm_usb_get_phy(&pdev->dev, USB_PHY_TYPE_USB2);
 	if (IS_ERR(phy)) {
-		/* Fallback to pdata */
-		if (!pdata) {
-			usb_put_hcd(hcd);
-			dev_warn(&pdev->dev, "no platform data or transceiver defined\n");
-			return -EPROBE_DEFER;
-		} else {
-			exynos_ohci->pdata = pdata;
-		}
+		usb_put_hcd(hcd);
+		dev_warn(&pdev->dev, "no platform data or transceiver defined\n");
+		return -EPROBE_DEFER;
 	} else {
 		exynos_ohci->phy = phy;
 		exynos_ohci->otg = phy->otg;
diff --git a/include/linux/platform_data/usb-ohci-exynos.h b/include/linux/platform_data/usb-ohci-exynos.h
deleted file mode 100644
index c256c59..0000000
--- a/include/linux/platform_data/usb-ohci-exynos.h
+++ /dev/null
@@ -1,21 +0,0 @@
-/*
- * Copyright (C) 2011 Samsung Electronics Co.Ltd
- *		http://www.samsung.com/
- *
- * This program is free software; you can redistribute  it and/or modify it
- * under  the terms of  the GNU General  Public License as published by the
- * Free Software Foundation;  either version 2 of the  License, or (at your
- * option) any later version.
- */
-
-#ifndef __MACH_EXYNOS_OHCI_H
-#define __MACH_EXYNOS_OHCI_H
-
-struct exynos4_ohci_platdata {
-	int (*phy_init)(struct platform_device *pdev, int type);
-	int (*phy_exit)(struct platform_device *pdev, int type);
-};
-
-extern void exynos4_ohci_set_platdata(struct exynos4_ohci_platdata *pd);
-
-#endif /* __MACH_EXYNOS_OHCI_H */
-- 
1.7.10.4
