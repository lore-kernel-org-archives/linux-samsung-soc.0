From: Vivek Gautam <gautam.vivek@samsung.com>
Subject: [PATCH v8 4/4] USB: ohci-exynos: Add phy driver support
Date: Tue, 22 Jan 2013 18:30:43 +0530
Message-ID: <1358859643-5030-5-git-send-email-gautam.vivek@samsung.com>
References: <1358859643-5030-1-git-send-email-gautam.vivek@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:22273 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751951Ab3AVM6W (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 22 Jan 2013 07:58:22 -0500
In-reply-to: <1358859643-5030-1-git-send-email-gautam.vivek@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-usb@vger.kernel.org
Cc: devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, gregkh@linuxfoundation.org, balbi@ti.com, stern@rowland.harvard.edu, kgene.kim@samsung.com, thomas.abraham@linaro.org, rob.herring@calxeda.com, grant.likely@secretlab.ca, sylvester.nawrocki@gmail.com, dianders@chromium.org, jg1.han@samsung.com, p.paneri@samsung.com

Adding the phy-driver to ohci-exynos. Keeping the platform data
for continuing the smooth operation for boards which still uses it

Signed-off-by: Vivek Gautam <gautam.vivek@samsung.com>
Acked-by: Jingoo Han <jg1.han@samsung.com>
Acked-by: Alan Stern <stern@rowland.harvard.edu>
Acked-by: Kukjin Kim <kgene.kim@samsung.com>
---
 drivers/usb/host/ohci-exynos.c |   84 ++++++++++++++++++++++++++++++----------
 1 files changed, 63 insertions(+), 21 deletions(-)

diff --git a/drivers/usb/host/ohci-exynos.c b/drivers/usb/host/ohci-exynos.c
index 804fb62..1b38409 100644
--- a/drivers/usb/host/ohci-exynos.c
+++ b/drivers/usb/host/ohci-exynos.c
@@ -15,6 +15,7 @@
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/platform_data/usb-exynos.h>
+#include <linux/usb/phy.h>
 #include <linux/usb/samsung_usb_phy.h>
 #include <plat/usb-phy.h>
 
@@ -22,8 +23,31 @@ struct exynos_ohci_hcd {
 	struct device *dev;
 	struct usb_hcd *hcd;
 	struct clk *clk;
+	struct usb_phy *phy;
+	struct usb_otg *otg;
+	struct exynos4_ohci_platdata *pdata;
 };
 
+static void exynos_ohci_phy_enable(struct exynos_ohci_hcd *exynos_ohci)
+{
+	struct platform_device *pdev = to_platform_device(exynos_ohci->dev);
+
+	if (exynos_ohci->phy)
+		usb_phy_init(exynos_ohci->phy);
+	else if (exynos_ohci->pdata->phy_init)
+		exynos_ohci->pdata->phy_init(pdev, USB_PHY_TYPE_HOST);
+}
+
+static void exynos_ohci_phy_disable(struct exynos_ohci_hcd *exynos_ohci)
+{
+	struct platform_device *pdev = to_platform_device(exynos_ohci->dev);
+
+	if (exynos_ohci->phy)
+		usb_phy_shutdown(exynos_ohci->phy);
+	else if (exynos_ohci->pdata->phy_exit)
+		exynos_ohci->pdata->phy_exit(pdev, USB_PHY_TYPE_HOST);
+}
+
 static int ohci_exynos_reset(struct usb_hcd *hcd)
 {
 	return ohci_init(hcd_to_ohci(hcd));
@@ -79,20 +103,15 @@ static u64 ohci_exynos_dma_mask = DMA_BIT_MASK(32);
 
 static int exynos_ohci_probe(struct platform_device *pdev)
 {
-	struct exynos4_ohci_platdata *pdata;
+	struct exynos4_ohci_platdata *pdata = pdev->dev.platform_data;
 	struct exynos_ohci_hcd *exynos_ohci;
 	struct usb_hcd *hcd;
 	struct ohci_hcd *ohci;
 	struct resource *res;
+	struct usb_phy *phy;
 	int irq;
 	int err;
 
-	pdata = pdev->dev.platform_data;
-	if (!pdata) {
-		dev_err(&pdev->dev, "No platform data defined\n");
-		return -EINVAL;
-	}
-
 	/*
 	 * Right now device-tree probed devices don't get dma_mask set.
 	 * Since shared usb code relies on it, set it here for now.
@@ -108,6 +127,20 @@ static int exynos_ohci_probe(struct platform_device *pdev)
 	if (!exynos_ohci)
 		return -ENOMEM;
 
+	phy = devm_usb_get_phy(&pdev->dev, USB_PHY_TYPE_USB2);
+	if (IS_ERR_OR_NULL(phy)) {
+		/* Fallback to pdata */
+		if (!pdata) {
+			dev_warn(&pdev->dev, "no platform data or transceiver defined\n");
+			return -EPROBE_DEFER;
+		} else {
+			exynos_ohci->pdata = pdata;
+		}
+	} else {
+		exynos_ohci->phy = phy;
+		exynos_ohci->otg = phy->otg;
+	}
+
 	exynos_ohci->dev = &pdev->dev;
 
 	hcd = usb_create_hcd(&exynos_ohci_hc_driver, &pdev->dev,
@@ -153,8 +186,11 @@ static int exynos_ohci_probe(struct platform_device *pdev)
 		goto fail_io;
 	}
 
-	if (pdata->phy_init)
-		pdata->phy_init(pdev, USB_PHY_TYPE_HOST);
+	if (exynos_ohci->otg)
+		exynos_ohci->otg->set_host(exynos_ohci->otg,
+					&exynos_ohci->hcd->self);
+
+	exynos_ohci_phy_enable(exynos_ohci);
 
 	ohci = hcd_to_ohci(hcd);
 	ohci_hcd_init(ohci);
@@ -162,13 +198,15 @@ static int exynos_ohci_probe(struct platform_device *pdev)
 	err = usb_add_hcd(hcd, irq, IRQF_SHARED);
 	if (err) {
 		dev_err(&pdev->dev, "Failed to add USB HCD\n");
-		goto fail_io;
+		goto fail_add_hcd;
 	}
 
 	platform_set_drvdata(pdev, exynos_ohci);
 
 	return 0;
 
+fail_add_hcd:
+	exynos_ohci_phy_disable(exynos_ohci);
 fail_io:
 	clk_disable_unprepare(exynos_ohci->clk);
 fail_clk:
@@ -178,14 +216,16 @@ fail_clk:
 
 static int exynos_ohci_remove(struct platform_device *pdev)
 {
-	struct exynos4_ohci_platdata *pdata = pdev->dev.platform_data;
 	struct exynos_ohci_hcd *exynos_ohci = platform_get_drvdata(pdev);
 	struct usb_hcd *hcd = exynos_ohci->hcd;
 
 	usb_remove_hcd(hcd);
 
-	if (pdata && pdata->phy_exit)
-		pdata->phy_exit(pdev, USB_PHY_TYPE_HOST);
+	if (exynos_ohci->otg)
+		exynos_ohci->otg->set_host(exynos_ohci->otg,
+					&exynos_ohci->hcd->self);
+
+	exynos_ohci_phy_disable(exynos_ohci);
 
 	clk_disable_unprepare(exynos_ohci->clk);
 
@@ -209,8 +249,6 @@ static int exynos_ohci_suspend(struct device *dev)
 	struct exynos_ohci_hcd *exynos_ohci = dev_get_drvdata(dev);
 	struct usb_hcd *hcd = exynos_ohci->hcd;
 	struct ohci_hcd *ohci = hcd_to_ohci(hcd);
-	struct platform_device *pdev = to_platform_device(dev);
-	struct exynos4_ohci_platdata *pdata = pdev->dev.platform_data;
 	unsigned long flags;
 	int rc = 0;
 
@@ -229,8 +267,11 @@ static int exynos_ohci_suspend(struct device *dev)
 
 	clear_bit(HCD_FLAG_HW_ACCESSIBLE, &hcd->flags);
 
-	if (pdata && pdata->phy_exit)
-		pdata->phy_exit(pdev, USB_PHY_TYPE_HOST);
+	if (exynos_ohci->otg)
+		exynos_ohci->otg->set_host(exynos_ohci->otg,
+					&exynos_ohci->hcd->self);
+
+	exynos_ohci_phy_disable(exynos_ohci);
 
 	clk_disable_unprepare(exynos_ohci->clk);
 
@@ -244,13 +285,14 @@ static int exynos_ohci_resume(struct device *dev)
 {
 	struct exynos_ohci_hcd *exynos_ohci = dev_get_drvdata(dev);
 	struct usb_hcd *hcd = exynos_ohci->hcd;
-	struct platform_device *pdev = to_platform_device(dev);
-	struct exynos4_ohci_platdata *pdata = pdev->dev.platform_data;
 
 	clk_prepare_enable(exynos_ohci->clk);
 
-	if (pdata && pdata->phy_init)
-		pdata->phy_init(pdev, USB_PHY_TYPE_HOST);
+	if (exynos_ohci->otg)
+		exynos_ohci->otg->set_host(exynos_ohci->otg,
+					&exynos_ohci->hcd->self);
+
+	exynos_ohci_phy_enable(exynos_ohci);
 
 	ohci_resume(hcd, false);
 
-- 
1.7.6.5
