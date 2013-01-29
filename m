From: Vivek Gautam <gautam.vivek@samsung.com>
Subject: [PATCH] usb: ehci: s5p: Power-off VBUS during suspend.
Date: Tue, 29 Jan 2013 16:22:45 +0530
Message-ID: <1359456765-7335-1-git-send-email-gautam.vivek@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:40313 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753640Ab3A2KqB (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 29 Jan 2013 05:46:01 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-usb@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, gregkh@linuxfoundation.org, stern@rowland.harvard.edu, jg1.han@samsung.com, Doug Anderson <dianders@chromium.org>

This change de-asserts vbus_gpio on suspend and
re-asserts on resume in order to save power.
NOTE, this change means no USB charging in suspend
mode.

Signed-off-by: Vivek Gautam <gautam.vivek@samsung.com>
CC: Doug Anderson <dianders@chromium.org>
---

Based on 'usb-next'.

 drivers/usb/host/ehci-s5p.c |   29 ++++++++++++++++++++++-------
 1 files changed, 22 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/host/ehci-s5p.c b/drivers/usb/host/ehci-s5p.c
index 20ebf6a..297f6f2 100644
--- a/drivers/usb/host/ehci-s5p.c
+++ b/drivers/usb/host/ehci-s5p.c
@@ -37,6 +37,7 @@ struct s5p_ehci_hcd {
 	struct usb_phy *phy;
 	struct usb_otg *otg;
 	struct s5p_ehci_platdata *pdata;
+	int vbus_gpio;
 };
 
 static const struct hc_driver s5p_ehci_hc_driver = {
@@ -90,22 +91,28 @@ static void s5p_ehci_phy_disable(struct s5p_ehci_hcd *s5p_ehci)
 		s5p_ehci->pdata->phy_exit(pdev, USB_PHY_TYPE_HOST);
 }
 
-static void s5p_setup_vbus_gpio(struct platform_device *pdev)
+static int s5p_setup_vbus_gpio(struct platform_device *pdev)
 {
 	int err;
 	int gpio;
 
-	if (!pdev->dev.of_node)
-		return;
+	if (!pdev->dev.of_node) {
+		dev_err(&pdev->dev, "No device node present\n");
+		return -ENODEV;
+	}
 
 	gpio = of_get_named_gpio(pdev->dev.of_node,
 			"samsung,vbus-gpio", 0);
 	if (!gpio_is_valid(gpio))
-		return;
+		return -EINVAL;
 
 	err = gpio_request_one(gpio, GPIOF_OUT_INIT_HIGH, "ehci_vbus_gpio");
-	if (err)
+	if (err) {
 		dev_err(&pdev->dev, "can't request ehci vbus gpio %d", gpio);
+		return err;
+	}
+
+	return gpio;
 }
 
 static u64 ehci_s5p_dma_mask = DMA_BIT_MASK(32);
@@ -131,8 +138,6 @@ static int s5p_ehci_probe(struct platform_device *pdev)
 	if (!pdev->dev.coherent_dma_mask)
 		pdev->dev.coherent_dma_mask = DMA_BIT_MASK(32);
 
-	s5p_setup_vbus_gpio(pdev);
-
 	s5p_ehci = devm_kzalloc(&pdev->dev, sizeof(struct s5p_ehci_hcd),
 				GFP_KERNEL);
 	if (!s5p_ehci)
@@ -154,6 +159,10 @@ static int s5p_ehci_probe(struct platform_device *pdev)
 
 	s5p_ehci->dev = &pdev->dev;
 
+	s5p_ehci->vbus_gpio = s5p_setup_vbus_gpio(pdev);
+	if (!gpio_is_valid(s5p_ehci->vbus_gpio))
+		dev_warn(&pdev->dev, "Failed to setup vbus gpio\n");
+
 	hcd = usb_create_hcd(&s5p_ehci_hc_driver, &pdev->dev,
 					dev_name(&pdev->dev));
 	if (!hcd) {
@@ -270,6 +279,9 @@ static int s5p_ehci_suspend(struct device *dev)
 
 	s5p_ehci_phy_disable(s5p_ehci);
 
+	if (gpio_is_valid(s5p_ehci->vbus_gpio))
+		gpio_set_value(s5p_ehci->vbus_gpio, 0);
+
 	clk_disable_unprepare(s5p_ehci->clk);
 
 	return rc;
@@ -282,6 +294,9 @@ static int s5p_ehci_resume(struct device *dev)
 
 	clk_prepare_enable(s5p_ehci->clk);
 
+	if (gpio_is_valid(s5p_ehci->vbus_gpio))
+		gpio_set_value(s5p_ehci->vbus_gpio, 1);
+
 	if (s5p_ehci->otg)
 		s5p_ehci->otg->set_host(s5p_ehci->otg, &s5p_ehci->hcd->self);
 
-- 
1.7.6.5
