From: Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v3 2/2] usb: host: ohci-exynos: Remove unnecessary usb-phy support
Date: Wed, 17 Sep 2014 16:47:42 +0530
Message-ID: <1410952662-4297-3-git-send-email-gautam.vivek@samsung.com>
References: <1410952662-4297-1-git-send-email-gautam.vivek@samsung.com>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1410952662-4297-1-git-send-email-gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Now that we have completely moved from older USB-PHY drivers
to newer GENERIC-PHY drivers for PHYs available with USB controllers
on Exynos series of SoCs, we can remove the support for the same
in our host drivers too.

Signed-off-by: Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---
 drivers/usb/host/ohci-exynos.c |   89 +++++++++++-----------------------------
 1 file changed, 24 insertions(+), 65 deletions(-)

diff --git a/drivers/usb/host/ohci-exynos.c b/drivers/usb/host/ohci-exynos.c
index 7c48e3f..992b28d 100644
--- a/drivers/usb/host/ohci-exynos.c
+++ b/drivers/usb/host/ohci-exynos.c
@@ -19,11 +19,8 @@
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/phy/phy.h>
-#include <linux/usb/phy.h>
-#include <linux/usb/samsung_usb_phy.h>
 #include <linux/usb.h>
 #include <linux/usb/hcd.h>
-#include <linux/usb/otg.h>
 
 #include "ohci.h"
 
@@ -38,9 +35,7 @@ static struct hc_driver __read_mostly exynos_ohci_hc_driver;
 
 struct exynos_ohci_hcd {
 	struct clk *clk;
-	struct usb_phy *phy;
-	struct usb_otg *otg;
-	struct phy *phy_g[PHY_NUMBER];
+	struct phy *phy[PHY_NUMBER];
 };
 
 static int exynos_ohci_get_phy(struct device *dev,
@@ -48,56 +43,40 @@ static int exynos_ohci_get_phy(struct device *dev,
 {
 	struct device_node *child;
 	struct phy *phy;
-	int phy_number;
-	int ret = 0;
+	int phy_num;
+	int ret;
 
-	/*
-	 * Getting generic phy:
-	 * We are keeping both types of phys as a part of transiting OHCI
-	 * to generic phy framework, so as to maintain backward compatibilty
-	 * with old DTB too.
-	 * We fallback to older USB-PHYs when we fail to get generic PHYs.
-	 */
+	/* Get the generic phys */
 	for_each_available_child_of_node(dev->of_node, child) {
-		ret = of_property_read_u32(child, "reg", &phy_number);
+		ret = of_property_read_u32(child, "reg", &phy_num);
 		if (ret) {
 			dev_err(dev, "Failed to parse device tree\n");
 			of_node_put(child);
 			return ret;
 		}
 
-		if (phy_number >= PHY_NUMBER) {
+		if (phy_num >= PHY_NUMBER) {
 			dev_err(dev, "Invalid number of PHYs\n");
 			of_node_put(child);
 			return -EINVAL;
 		}
 
-		phy = devm_of_phy_get(dev, child, NULL);
+		exynos_ohci->phy[phy_num] = devm_of_phy_get(dev, child, NULL);
+		phy = exynos_ohci->phy[phy_num];
 		of_node_put(child);
-		if (IS_ERR(phy))
-			/* Lets fallback to older USB-PHYs */
-			goto usb_phy_old;
-		exynos_ohci->phy_g[phy_number] = phy;
-		/* Make the older PHYs unavailable */
-		exynos_ohci->phy = ERR_PTR(-ENXIO);
-	}
-
-	return 0;
-
-usb_phy_old:
-	exynos_ohci->phy = devm_usb_get_phy(dev, USB_PHY_TYPE_USB2);
-	if (IS_ERR(exynos_ohci->phy)) {
-		ret = PTR_ERR(exynos_ohci->phy);
-		if (ret != -ENXIO && ret != -ENODEV) {
-			dev_err(dev, "no usb2 phy configured\n");
-			return ret;
+		if (IS_ERR(phy)) {
+			ret = PTR_ERR(phy);
+			if (ret == -EPROBE_DEFER) {
+				return ret;
+			} else if (ret != -ENOSYS && ret != -ENODEV) {
+				dev_err(dev,
+					"Error retrieving usb2 phy: %d\n", ret);
+				return PTR_ERR(phy);
+			}
 		}
-		dev_dbg(dev, "Failed to get usb2 phy\n");
-	} else {
-		exynos_ohci->otg = exynos_ohci->phy->otg;
 	}
 
-	return ret;
+	return 0;
 }
 
 static int exynos_ohci_phy_enable(struct device *dev)
@@ -107,16 +86,13 @@ static int exynos_ohci_phy_enable(struct device *dev)
 	int i;
 	int ret = 0;
 
-	if (!IS_ERR(exynos_ohci->phy))
-		return usb_phy_init(exynos_ohci->phy);
-
 	for (i = 0; ret == 0 && i < PHY_NUMBER; i++)
-		if (!IS_ERR(exynos_ohci->phy_g[i]))
-			ret = phy_power_on(exynos_ohci->phy_g[i]);
+		if (!IS_ERR(exynos_ohci->phy[i]))
+			ret = phy_power_on(exynos_ohci->phy[i]);
 	if (ret)
 		for (i--; i >= 0; i--)
-			if (!IS_ERR(exynos_ohci->phy_g[i]))
-				phy_power_off(exynos_ohci->phy_g[i]);
+			if (!IS_ERR(exynos_ohci->phy[i]))
+				phy_power_off(exynos_ohci->phy[i]);
 
 	return ret;
 }
@@ -127,14 +103,9 @@ static void exynos_ohci_phy_disable(struct device *dev)
 	struct exynos_ohci_hcd *exynos_ohci = to_exynos_ohci(hcd);
 	int i;
 
-	if (!IS_ERR(exynos_ohci->phy)) {
-		usb_phy_shutdown(exynos_ohci->phy);
-		return;
-	}
-
 	for (i = 0; i < PHY_NUMBER; i++)
-		if (!IS_ERR(exynos_ohci->phy_g[i]))
-			phy_power_off(exynos_ohci->phy_g[i]);
+		if (!IS_ERR(exynos_ohci->phy[i]))
+			phy_power_off(exynos_ohci->phy[i]);
 }
 
 static int exynos_ohci_probe(struct platform_device *pdev)
@@ -206,9 +177,6 @@ skip_phy:
 		goto fail_io;
 	}
 
-	if (exynos_ohci->otg)
-		exynos_ohci->otg->set_host(exynos_ohci->otg, &hcd->self);
-
 	platform_set_drvdata(pdev, hcd);
 
 	err = exynos_ohci_phy_enable(&pdev->dev);
@@ -241,9 +209,6 @@ static int exynos_ohci_remove(struct platform_device *pdev)
 
 	usb_remove_hcd(hcd);
 
-	if (exynos_ohci->otg)
-		exynos_ohci->otg->set_host(exynos_ohci->otg, &hcd->self);
-
 	exynos_ohci_phy_disable(&pdev->dev);
 
 	clk_disable_unprepare(exynos_ohci->clk);
@@ -272,9 +237,6 @@ static int exynos_ohci_suspend(struct device *dev)
 	if (rc)
 		return rc;
 
-	if (exynos_ohci->otg)
-		exynos_ohci->otg->set_host(exynos_ohci->otg, &hcd->self);
-
 	exynos_ohci_phy_disable(dev);
 
 	clk_disable_unprepare(exynos_ohci->clk);
@@ -290,9 +252,6 @@ static int exynos_ohci_resume(struct device *dev)
 
 	clk_prepare_enable(exynos_ohci->clk);
 
-	if (exynos_ohci->otg)
-		exynos_ohci->otg->set_host(exynos_ohci->otg, &hcd->self);
