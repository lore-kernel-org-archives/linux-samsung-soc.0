From: Vivek Gautam <gautam.vivek@samsung.com>
Subject: [PATCH 4/5] usb: s5p-ehci: Adding phy driver support
Date: Mon, 08 Oct 2012 19:42:27 +0530
Message-ID: <1349705548-15207-5-git-send-email-gautam.vivek@samsung.com>
References: <1349705548-15207-1-git-send-email-gautam.vivek@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:26781 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750779Ab2JHOKc (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 8 Oct 2012 10:10:32 -0400
In-reply-to: <1349705548-15207-1-git-send-email-gautam.vivek@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-usb@vger.kernel.org
Cc: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, gregkh@linuxfoundation.org, stern@rowland.harvard.edu, balbi@ti.com, rob.herring@calxeda.com, kgene.kim@samsung.com, jg1.han@samsung.com, thomas.abraham@linaro.org, kishon@ti.com, p.paneri@samsung.com, yulgon.kim@samsung.com

Adding the transceiver to ehci driver. Keeping the platform data
for continuing the smooth operation for boards which still uses it

Signed-off-by: Vivek Gautam <gautam.vivek@samsung.com>
---
 drivers/usb/host/ehci-s5p.c |   62 +++++++++++++++++++++++++++++-------------
 1 files changed, 43 insertions(+), 19 deletions(-)

diff --git a/drivers/usb/host/ehci-s5p.c b/drivers/usb/host/ehci-s5p.c
index 85b74be..ac22893 100644
--- a/drivers/usb/host/ehci-s5p.c
+++ b/drivers/usb/host/ehci-s5p.c
@@ -18,6 +18,7 @@
 #include <linux/of_gpio.h>
 #include <linux/platform_data/usb-ehci-s5p.h>
 #include <plat/usb-phy.h>
+#include <linux/usb/phy.h>
 
 #define EHCI_INSNREG00(base)			(base + 0x90)
 #define EHCI_INSNREG00_ENA_INCR16		(0x1 << 25)
@@ -32,6 +33,8 @@ struct s5p_ehci_hcd {
 	struct device *dev;
 	struct usb_hcd *hcd;
 	struct clk *clk;
+	struct usb_phy *phy;
+	struct s5p_ehci_platdata *pdata;
 };
 
 static const struct hc_driver s5p_ehci_hc_driver = {
@@ -65,6 +68,26 @@ static const struct hc_driver s5p_ehci_hc_driver = {
 	.clear_tt_buffer_complete	= ehci_clear_tt_buffer_complete,
 };
 
+static void s5p_ehci_phy_enable(struct s5p_ehci_hcd *s5p_ehci)
+{
+	struct platform_device *pdev = to_platform_device(s5p_ehci->dev);
+
+	if (s5p_ehci->phy)
+		usb_phy_init(s5p_ehci->phy);
+	else if (s5p_ehci->pdata->phy_init)
+		s5p_ehci->pdata->phy_init(pdev, S5P_USB_PHY_HOST);
+}
+
+static void s5p_ehci_phy_disable(struct s5p_ehci_hcd *s5p_ehci)
+{
+	struct platform_device *pdev = to_platform_device(s5p_ehci->dev);
+
+	if (s5p_ehci->phy)
+		usb_phy_shutdown(s5p_ehci->phy);
+	else if (s5p_ehci->pdata->phy_exit)
+		s5p_ehci->pdata->phy_exit(pdev, S5P_USB_PHY_HOST);
+}
+
 static void s5p_setup_vbus_gpio(struct platform_device *pdev)
 {
 	int err;
@@ -92,15 +115,10 @@ static int __devinit s5p_ehci_probe(struct platform_device *pdev)
 	struct usb_hcd *hcd;
 	struct ehci_hcd *ehci;
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
@@ -118,6 +136,20 @@ static int __devinit s5p_ehci_probe(struct platform_device *pdev)
 	if (!s5p_ehci)
 		return -ENOMEM;
 
+	pdata = pdev->dev.platform_data;
+	if (!pdata) {
+		/* Fallback to Phy transceiver */
+		phy = devm_usb_get_phy(&pdev->dev, USB_PHY_TYPE_USB2);
+		if (IS_ERR_OR_NULL(phy)) {
+			dev_err(&pdev->dev, "no platform data or transceiver defined\n");
+			return -EPROBE_DEFER;
+		} else {
+			s5p_ehci->phy = phy;
+		}
+	} else {
+		s5p_ehci->pdata = pdata;
+	}
+
 	s5p_ehci->dev = &pdev->dev;
 
 	hcd = usb_create_hcd(&s5p_ehci_hc_driver, &pdev->dev,
@@ -163,8 +195,7 @@ static int __devinit s5p_ehci_probe(struct platform_device *pdev)
 		goto fail_io;
 	}
 
-	if (pdata->phy_init)
-		pdata->phy_init(pdev, S5P_USB_PHY_HOST);
+	s5p_ehci_phy_enable(s5p_ehci);
 
 	ehci = hcd_to_ehci(hcd);
 	ehci->caps = hcd->regs;
@@ -184,6 +215,7 @@ static int __devinit s5p_ehci_probe(struct platform_device *pdev)
 
 fail_io:
 	clk_disable(s5p_ehci->clk);
+	s5p_ehci_phy_disable(s5p_ehci);
 fail_clk:
 	usb_put_hcd(hcd);
 	return err;
@@ -191,14 +223,12 @@ fail_clk:
 
 static int __devexit s5p_ehci_remove(struct platform_device *pdev)
 {
-	struct s5p_ehci_platdata *pdata = pdev->dev.platform_data;
 	struct s5p_ehci_hcd *s5p_ehci = platform_get_drvdata(pdev);
 	struct usb_hcd *hcd = s5p_ehci->hcd;
 
 	usb_remove_hcd(hcd);
 
-	if (pdata && pdata->phy_exit)
-		pdata->phy_exit(pdev, S5P_USB_PHY_HOST);
+	s5p_ehci_phy_disable(s5p_ehci);
 
 	clk_disable(s5p_ehci->clk);
 
@@ -222,14 +252,11 @@ static int s5p_ehci_suspend(struct device *dev)
 	struct s5p_ehci_hcd *s5p_ehci = dev_get_drvdata(dev);
 	struct usb_hcd *hcd = s5p_ehci->hcd;
 	bool do_wakeup = device_may_wakeup(dev);
-	struct platform_device *pdev = to_platform_device(dev);
-	struct s5p_ehci_platdata *pdata = pdev->dev.platform_data;
 	int rc;
 
 	rc = ehci_suspend(hcd, do_wakeup);
 
-	if (pdata && pdata->phy_exit)
-		pdata->phy_exit(pdev, S5P_USB_PHY_HOST);
+	s5p_ehci_phy_disable(s5p_ehci);
 
 	clk_disable(s5p_ehci->clk);
 
@@ -240,13 +267,10 @@ static int s5p_ehci_resume(struct device *dev)
 {
 	struct s5p_ehci_hcd *s5p_ehci = dev_get_drvdata(dev);
 	struct usb_hcd *hcd = s5p_ehci->hcd;
-	struct platform_device *pdev = to_platform_device(dev);
-	struct s5p_ehci_platdata *pdata = pdev->dev.platform_data;
 
 	clk_enable(s5p_ehci->clk);
 
-	if (pdata && pdata->phy_init)
-		pdata->phy_init(pdev, S5P_USB_PHY_HOST);
+	s5p_ehci_phy_enable(s5p_ehci);
 
 	/* DMA burst Enable */
 	writel(EHCI_INSNREG00_ENABLE_DMA_BURST, EHCI_INSNREG00(hcd->regs));
-- 
1.7.6.5
