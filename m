From: Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 4/5] USB: ohci-exynos: Remove non-DT support
Date: Thu, 10 Oct 2013 15:32:19 +0900
Message-ID: <000a01cec582$7835dfa0$68a19ee0$%han@samsung.com>
References: <000001cec582$02a6cfb0$07f46f10$%han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <000001cec582$02a6cfb0$07f46f10$%han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Content-language: ko
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: 'Greg Kroah-Hartman' <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, 'Kukjin Kim' <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, 'Alan Stern' <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, 'Sylwester Nawrocki' <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, 'Tomasz Figa' <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, 'Jingoo Han' <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

The non-DT for EXYNOS SoCs is not supported from v3.11.
Thus, there is no need to support non-DT for Exynos OHCI driver.

The 'include/linux/platform_data/usb-ohci-exynos.h' file has been
used for non-DT support. Thus, the 'usb-ohci-exynos.h' file can
be removed.

Signed-off-by: Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---
 drivers/usb/host/ohci-exynos.c                |   16 ++--------------
 include/linux/platform_data/usb-ohci-exynos.h |   21 ---------------------
 2 files changed, 2 insertions(+), 35 deletions(-)
 delete mode 100644 include/linux/platform_data/usb-ohci-exynos.h

diff --git a/drivers/usb/host/ohci-exynos.c b/drivers/usb/host/ohci-exynos.c
index f5f372e..5c877bf 100644
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
@@ -98,13 +91,8 @@ static int exynos_ohci_probe(struct platform_device *pdev)
 
 	phy = devm_usb_get_phy(&pdev->dev, USB_PHY_TYPE_USB2);
 	if (IS_ERR(phy)) {
-		/* Fallback to pdata */
-		if (!pdata) {
-			dev_warn(&pdev->dev, "no platform data or transceiver defined\n");
-			return -EPROBE_DEFER;
-		} else {
-			exynos_ohci->pdata = pdata;
-		}
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
