From: Jingoo Han <jg1.han@samsung.com>
Subject: [PATCH] usb: ohci-exynos: Change to use phy provided by the generic
 phy framework
Date: Wed, 06 Nov 2013 10:27:49 +0900
Message-ID: <001401ceda8f$67f1ee50$37d5caf0$%han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:60093 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755763Ab3KFB1w (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 5 Nov 2013 20:27:52 -0500
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-arm@vger.kernel.org
Cc: 'Kamil Debski' <k.debski@samsung.com>, 'Kyungmin Park' <kyungmin.park@samsung.com>, 'Kishon Vijay Abraham I' <kishon@ti.com>, 'Tomasz Figa' <t.figa@samsung.com>, 'Sylwester Nawrocki' <s.nawrocki@samsung.com>, m.szyprowski@samsung.com, gautam.vivek@samsung.com, 'Mateusz Krawczuk' <mat.krawczuk@gmail.com>, 'Yulgon Kim' <yulgon.kim@samsung.com>, 'Praveen Paneri' <p.paneri@samsung.com>, 'Anton Tikhomirov' <av.tikhomirov@samsung.com>, 'Kumar Gala' <galak@codeaurora.org>'Kamil Debski' <k.debski@samsung.com>, 'Jingoo Han' <jg1.han@samsung.com>

Change the phy provider used from the old usb phy specific to a new one
using the generic phy framework.

Signed-off-by: Jingoo Han <jg1.han@samsung.com>
Cc: Kamil Debski <k.debski@samsung.com>
---
Exynos OHCI driver also uses Exynos USB2.0 PHY. Thus, I make this
patch based-on Kamil Debski's patchset for adding Exynos USB 2.0 PHY
driver.
(http://www.spinics.net/lists/linux-samsung-soc/msg24104.html)

 drivers/usb/host/ohci-exynos.c |   28 ++++++++--------------------
 1 file changed, 8 insertions(+), 20 deletions(-)

diff --git a/drivers/usb/host/ohci-exynos.c b/drivers/usb/host/ohci-exynos.c
index a87baed..76eb4d3 100644
--- a/drivers/usb/host/ohci-exynos.c
+++ b/drivers/usb/host/ohci-exynos.c
@@ -17,12 +17,12 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/usb/phy.h>
 #include <linux/usb/samsung_usb_phy.h>
 #include <linux/usb.h>
 #include <linux/usb/hcd.h>
-#include <linux/usb/otg.h>
 
 #include "ohci.h"
 
@@ -35,8 +35,7 @@ static struct hc_driver __read_mostly exynos_ohci_hc_driver;
 
 struct exynos_ohci_hcd {
 	struct clk *clk;
-	struct usb_phy *phy;
-	struct usb_otg *otg;
+	struct phy *phy;
 };
 
 static void exynos_ohci_phy_enable(struct platform_device *pdev)
@@ -45,7 +44,7 @@ static void exynos_ohci_phy_enable(struct platform_device *pdev)
 	struct exynos_ohci_hcd *exynos_ohci = to_exynos_ohci(hcd);
 
 	if (exynos_ohci->phy)
-		usb_phy_init(exynos_ohci->phy);
+		phy_power_on(exynos_ohci->phy);
 }
 
 static void exynos_ohci_phy_disable(struct platform_device *pdev)
@@ -54,7 +53,7 @@ static void exynos_ohci_phy_disable(struct platform_device *pdev)
 	struct exynos_ohci_hcd *exynos_ohci = to_exynos_ohci(hcd);
 
 	if (exynos_ohci->phy)
-		usb_phy_shutdown(exynos_ohci->phy);
+		phy_power_off(exynos_ohci->phy);
 }
 
 static int exynos_ohci_probe(struct platform_device *pdev)
@@ -62,7 +61,8 @@ static int exynos_ohci_probe(struct platform_device *pdev)
 	struct exynos_ohci_hcd *exynos_ohci;
 	struct usb_hcd *hcd;
 	struct resource *res;
-	struct usb_phy *phy;
+	struct phy *phy;
+	const char *phy_name;
 	int irq;
 	int err;
 
@@ -89,14 +89,14 @@ static int exynos_ohci_probe(struct platform_device *pdev)
 					"samsung,exynos5440-ohci"))
 		goto skip_phy;
 
-	phy = devm_usb_get_phy(&pdev->dev, USB_PHY_TYPE_USB2);
+	phy_name = of_get_property(pdev->dev.of_node, "phy-names", NULL);
+	phy =  devm_phy_get(&pdev->dev, phy_name);
 	if (IS_ERR(phy)) {
 		usb_put_hcd(hcd);
 		dev_warn(&pdev->dev, "no platform data or transceiver defined\n");
 		return -EPROBE_DEFER;
 	} else {
 		exynos_ohci->phy = phy;
-		exynos_ohci->otg = phy->otg;
 	}
 
 skip_phy:
@@ -135,9 +135,6 @@ skip_phy:
 		goto fail_io;
 	}
 
-	if (exynos_ohci->otg)
-		exynos_ohci->otg->set_host(exynos_ohci->otg, &hcd->self);
-
 	platform_set_drvdata(pdev, hcd);
 
 	exynos_ohci_phy_enable(pdev);
@@ -165,9 +162,6 @@ static int exynos_ohci_remove(struct platform_device *pdev)
 
 	usb_remove_hcd(hcd);
 
-	if (exynos_ohci->otg)
-		exynos_ohci->otg->set_host(exynos_ohci->otg, &hcd->self);
-
 	exynos_ohci_phy_disable(pdev);
 
 	clk_disable_unprepare(exynos_ohci->clk);
@@ -210,9 +204,6 @@ static int exynos_ohci_suspend(struct device *dev)
 
 	clear_bit(HCD_FLAG_HW_ACCESSIBLE, &hcd->flags);
 
-	if (exynos_ohci->otg)
-		exynos_ohci->otg->set_host(exynos_ohci->otg, &hcd->self);
-
 	exynos_ohci_phy_disable(pdev);
 
 	clk_disable_unprepare(exynos_ohci->clk);
@@ -231,9 +222,6 @@ static int exynos_ohci_resume(struct device *dev)
 
 	clk_prepare_enable(exynos_ohci->clk);
 
-	if (exynos_ohci->otg)
-		exynos_ohci->otg->set_host(exynos_ohci->otg, &hcd->self);
-
 	exynos_ohci_phy_enable(pdev);
 
 	ohci_resume(hcd, false);
-- 
1.7.10.4
