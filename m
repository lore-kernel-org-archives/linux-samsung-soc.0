From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: [PATCH] usb: ohci-exynos: use clk_prepare_enable and clk_disable_unprepare
Date: Wed,  3 Oct 2012 08:41:37 +0900
Message-ID: <1349221297-2815-1-git-send-email-thomas.abraham@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f46.google.com ([209.85.220.46]:60725 "EHLO
	mail-pa0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753702Ab2JBXo2 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 2 Oct 2012 19:44:28 -0400
Received: by padhz1 with SMTP id hz1so5723241pad.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 02 Oct 2012 16:44:28 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-usb@vger.kernel.org
Cc: gregkh@linuxfoundation.org, jg1.han@samsung.com, kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org

Convert clk_enable/clk_disable to clk_prepare_enable/clk_disable_unprepare
calls as required by common clock framework.

Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
---
 drivers/usb/host/ohci-exynos.c |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/host/ohci-exynos.c b/drivers/usb/host/ohci-exynos.c
index 20a5008..7bca600 100644
--- a/drivers/usb/host/ohci-exynos.c
+++ b/drivers/usb/host/ohci-exynos.c
@@ -123,7 +123,7 @@ static int __devinit exynos_ohci_probe(struct platform_device *pdev)
 		goto fail_clk;
 	}
 
-	err = clk_enable(exynos_ohci->clk);
+	err = clk_prepare_enable(exynos_ohci->clk);
 	if (err)
 		goto fail_clken;
 
@@ -167,7 +167,7 @@ static int __devinit exynos_ohci_probe(struct platform_device *pdev)
 	return 0;
 
 fail_io:
-	clk_disable(exynos_ohci->clk);
+	clk_disable_unprepare(exynos_ohci->clk);
 fail_clken:
 	clk_put(exynos_ohci->clk);
 fail_clk:
@@ -186,7 +186,7 @@ static int __devexit exynos_ohci_remove(struct platform_device *pdev)
 	if (pdata && pdata->phy_exit)
 		pdata->phy_exit(pdev, S5P_USB_PHY_HOST);
 
-	clk_disable(exynos_ohci->clk);
+	clk_disable_unprepare(exynos_ohci->clk);
 	clk_put(exynos_ohci->clk);
 
 	usb_put_hcd(hcd);
@@ -232,7 +232,7 @@ static int exynos_ohci_suspend(struct device *dev)
 	if (pdata && pdata->phy_exit)
 		pdata->phy_exit(pdev, S5P_USB_PHY_HOST);
 
-	clk_disable(exynos_ohci->clk);
+	clk_disable_unprepare(exynos_ohci->clk);
 
 fail:
 	spin_unlock_irqrestore(&ohci->lock, flags);
@@ -247,7 +247,7 @@ static int exynos_ohci_resume(struct device *dev)
 	struct platform_device *pdev = to_platform_device(dev);
 	struct exynos4_ohci_platdata *pdata = pdev->dev.platform_data;
 
-	clk_enable(exynos_ohci->clk);
+	clk_prepare_enable(exynos_ohci->clk);
 
 	if (pdata && pdata->phy_init)
 		pdata->phy_init(pdev, S5P_USB_PHY_HOST);
-- 
1.7.4.1
