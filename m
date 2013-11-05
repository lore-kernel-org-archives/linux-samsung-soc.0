From: Kamil Debski <k.debski@samsung.com>
Subject: [PATCH v3 2/3] usb: ehci-s5p: Change to use phy provided by the
 generic phy framework
Date: Tue, 05 Nov 2013 17:13:20 +0100
Message-ID: <1383668001-19141-3-git-send-email-k.debski@samsung.com>
References: <1383668001-19141-1-git-send-email-k.debski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:36794 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750838Ab3KEQPk (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 5 Nov 2013 11:15:40 -0500
In-reply-to: <1383668001-19141-1-git-send-email-k.debski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-arm@vger.kernel.org
Cc: kyungmin.park@samsung.com, kishon@ti.com, t.figa@samsung.com, s.nawrocki@samsung.com, m.szyprowski@samsung.com, gautam.vivek@samsung.com, mat.krawczuk@gmail.com, yulgon.kim@samsung.com, p.paneri@samsung.com, av.tikhomirov@samsung.com, jg1.han@samsung.com, galak@codeaurora.org, Kamil Debski <k.debski@samsung.com>

Change the phy provider used from the old usb phy specific to a new one
using the generic phy framework.

Signed-off-by: Kamil Debski <k.debski@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 drivers/usb/host/ehci-exynos.c |   34 +++++++++++-----------------------
 1 file changed, 11 insertions(+), 23 deletions(-)

diff --git a/drivers/usb/host/ehci-exynos.c b/drivers/usb/host/ehci-exynos.c
index 8898c01..974001b 100644
--- a/drivers/usb/host/ehci-exynos.c
+++ b/drivers/usb/host/ehci-exynos.c
@@ -19,12 +19,12 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_gpio.h>
+#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/usb/phy.h>
 #include <linux/usb/samsung_usb_phy.h>
 #include <linux/usb.h>
 #include <linux/usb/hcd.h>
-#include <linux/usb/otg.h>
 
 #include "ehci.h"
 
@@ -44,8 +44,7 @@ static struct hc_driver __read_mostly exynos_ehci_hc_driver;
 
 struct exynos_ehci_hcd {
 	struct clk *clk;
-	struct usb_phy *phy;
-	struct usb_otg *otg;
+	struct phy *phy;
 };
 
 #define to_exynos_ehci(hcd) (struct exynos_ehci_hcd *)(hcd_to_ehci(hcd)->priv)
@@ -75,7 +74,8 @@ static int exynos_ehci_probe(struct platform_device *pdev)
 	struct usb_hcd *hcd;
 	struct ehci_hcd *ehci;
 	struct resource *res;
-	struct usb_phy *phy;
+	struct phy *phy;
+	const char *phy_name;
 	int irq;
 	int err;
 
@@ -98,12 +98,12 @@ static int exynos_ehci_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	}
 	exynos_ehci = to_exynos_ehci(hcd);
-
 	if (of_device_is_compatible(pdev->dev.of_node,
 					"samsung,exynos5440-ehci"))
 		goto skip_phy;
 
-	phy = devm_usb_get_phy(&pdev->dev, USB_PHY_TYPE_USB2);
+	phy_name = of_get_property(pdev->dev.of_node, "phy-names", NULL);
+	phy =  devm_phy_get(&pdev->dev, phy_name);
 	if (IS_ERR(phy)) {
 		usb_put_hcd(hcd);
 		dev_warn(&pdev->dev, "no platform data or transceiver defined\n");
@@ -149,11 +149,8 @@ skip_phy:
 		goto fail_io;
 	}
 
-	if (exynos_ehci->otg)
-		exynos_ehci->otg->set_host(exynos_ehci->otg, &hcd->self);
-
 	if (exynos_ehci->phy)
-		usb_phy_init(exynos_ehci->phy);
+		phy_power_on(exynos_ehci->phy);
 
 	ehci = hcd_to_ehci(hcd);
 	ehci->caps = hcd->regs;
@@ -173,7 +170,7 @@ skip_phy:
 
 fail_add_hcd:
 	if (exynos_ehci->phy)
-		usb_phy_shutdown(exynos_ehci->phy);
+		phy_power_off(exynos_ehci->phy);
 fail_io:
 	clk_disable_unprepare(exynos_ehci->clk);
 fail_clk:
@@ -188,11 +185,8 @@ static int exynos_ehci_remove(struct platform_device *pdev)
 
 	usb_remove_hcd(hcd);
 
-	if (exynos_ehci->otg)
-		exynos_ehci->otg->set_host(exynos_ehci->otg, &hcd->self);
-
 	if (exynos_ehci->phy)
-		usb_phy_shutdown(exynos_ehci->phy);
+		phy_power_off(exynos_ehci->phy);
 
 	clk_disable_unprepare(exynos_ehci->clk);
 
@@ -212,11 +206,8 @@ static int exynos_ehci_suspend(struct device *dev)
 
 	rc = ehci_suspend(hcd, do_wakeup);
 
-	if (exynos_ehci->otg)
-		exynos_ehci->otg->set_host(exynos_ehci->otg, &hcd->self);
-
 	if (exynos_ehci->phy)
-		usb_phy_shutdown(exynos_ehci->phy);
+		phy_power_off(exynos_ehci->phy);
 
 	clk_disable_unprepare(exynos_ehci->clk);
 
@@ -230,11 +221,8 @@ static int exynos_ehci_resume(struct device *dev)
 
 	clk_prepare_enable(exynos_ehci->clk);
 
-	if (exynos_ehci->otg)
-		exynos_ehci->otg->set_host(exynos_ehci->otg, &hcd->self);
-
 	if (exynos_ehci->phy)
-		usb_phy_init(exynos_ehci->phy);
+		phy_power_on(exynos_ehci->phy);
 
 	/* DMA burst Enable */
 	writel(EHCI_INSNREG00_ENABLE_DMA_BURST, EHCI_INSNREG00(hcd->regs));
-- 
1.7.9.5
