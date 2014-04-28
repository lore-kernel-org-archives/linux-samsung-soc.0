From: Vivek Gautam <gautam.vivek@samsung.com>
Subject: [PATCH 2/4] usb: ehci-exynos: Use struct device instead of platform_device
Date: Mon, 28 Apr 2014 14:55:30 +0530
Message-ID: <1398677132-30600-3-git-send-email-gautam.vivek@samsung.com>
References: <1398677132-30600-1-git-send-email-gautam.vivek@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f182.google.com ([209.85.192.182]:37766 "EHLO
	mail-pd0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754251AbaD1JZz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 28 Apr 2014 05:25:55 -0400
In-Reply-To: <1398677132-30600-1-git-send-email-gautam.vivek@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, gregkh@linuxfoundation.org, balbi@ti.com, kgene.kim@samsung.com, k.debski@samsung.com, Vivek Gautam <gautam.vivek@samsung.com>, Jingoo Han <jg1.han@samsung.com>, Alan Stern <stern@rowland.harvard.edu>

Change to use struct device instead of struct platform_device
for some static functions.

Signed-off-by: Vivek Gautam <gautam.vivek@samsung.com>
Cc: Jingoo Han <jg1.han@samsung.com>
Cc: Alan Stern <stern@rowland.harvard.edu>
---
 drivers/usb/host/ehci-exynos.c |    5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/host/ehci-exynos.c b/drivers/usb/host/ehci-exynos.c
index 7f425ac..4d763dc 100644
--- a/drivers/usb/host/ehci-exynos.c
+++ b/drivers/usb/host/ehci-exynos.c
@@ -50,9 +50,8 @@ struct exynos_ehci_hcd {
 
 #define to_exynos_ehci(hcd) (struct exynos_ehci_hcd *)(hcd_to_ehci(hcd)->priv)
 
-static void exynos_setup_vbus_gpio(struct platform_device *pdev)
+static void exynos_setup_vbus_gpio(struct device *dev)
 {
-	struct device *dev = &pdev->dev;
 	int err;
 	int gpio;
 
@@ -88,7 +87,7 @@ static int exynos_ehci_probe(struct platform_device *pdev)
 	if (err)
 		return err;
 
-	exynos_setup_vbus_gpio(pdev);
+	exynos_setup_vbus_gpio(&pdev->dev);
 
 	hcd = usb_create_hcd(&exynos_ehci_hc_driver,
 			     &pdev->dev, dev_name(&pdev->dev));
-- 
1.7.10.4
