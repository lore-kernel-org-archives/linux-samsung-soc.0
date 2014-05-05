From: Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v4 1/4] usb: ohci-exynos: Use struct device instead of platform_device
Date: Mon,  5 May 2014 10:33:42 +0530
Message-ID: <1399266222-31802-1-git-send-email-gautam.vivek@samsung.com>
References: <1399034855-9686-2-git-send-email-gautam.vivek@samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1399034855-9686-2-git-send-email-gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, k.debski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Change to use struct device instead of struct platform_device
for some static functions.

Signed-off-by: Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Acked-by: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
Acked-by: Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Acked-by: Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---

Changes since v1:
 - none

 drivers/usb/host/ohci-exynos.c |   20 +++++++++-----------
 1 file changed, 9 insertions(+), 11 deletions(-)

diff --git a/drivers/usb/host/ohci-exynos.c b/drivers/usb/host/ohci-exynos.c
index 9cf80cb..05f00e3 100644
--- a/drivers/usb/host/ohci-exynos.c
+++ b/drivers/usb/host/ohci-exynos.c
@@ -39,18 +39,18 @@ struct exynos_ohci_hcd {
 	struct usb_otg *otg;
 };
 
-static void exynos_ohci_phy_enable(struct platform_device *pdev)
+static void exynos_ohci_phy_enable(struct device *dev)
 {
-	struct usb_hcd *hcd = platform_get_drvdata(pdev);
+	struct usb_hcd *hcd = dev_get_drvdata(dev);
 	struct exynos_ohci_hcd *exynos_ohci = to_exynos_ohci(hcd);
 
 	if (exynos_ohci->phy)
 		usb_phy_init(exynos_ohci->phy);
 }
 
-static void exynos_ohci_phy_disable(struct platform_device *pdev)
+static void exynos_ohci_phy_disable(struct device *dev)
 {
-	struct usb_hcd *hcd = platform_get_drvdata(pdev);
+	struct usb_hcd *hcd = dev_get_drvdata(dev);
 	struct exynos_ohci_hcd *exynos_ohci = to_exynos_ohci(hcd);
 
 	if (exynos_ohci->phy)
@@ -139,7 +139,7 @@ skip_phy:
 
 	platform_set_drvdata(pdev, hcd);
 
-	exynos_ohci_phy_enable(pdev);
+	exynos_ohci_phy_enable(&pdev->dev);
 
 	err = usb_add_hcd(hcd, irq, IRQF_SHARED);
 	if (err) {
@@ -150,7 +150,7 @@ skip_phy:
 	return 0;
 
 fail_add_hcd:
-	exynos_ohci_phy_disable(pdev);
+	exynos_ohci_phy_disable(&pdev->dev);
 fail_io:
 	clk_disable_unprepare(exynos_ohci->clk);
 fail_clk:
@@ -168,7 +168,7 @@ static int exynos_ohci_remove(struct platform_device *pdev)
 	if (exynos_ohci->otg)
 		exynos_ohci->otg->set_host(exynos_ohci->otg, &hcd->self);
 
-	exynos_ohci_phy_disable(pdev);
+	exynos_ohci_phy_disable(&pdev->dev);
 
 	clk_disable_unprepare(exynos_ohci->clk);
 
@@ -190,7 +190,6 @@ static int exynos_ohci_suspend(struct device *dev)
 {
 	struct usb_hcd *hcd = dev_get_drvdata(dev);
 	struct exynos_ohci_hcd *exynos_ohci = to_exynos_ohci(hcd);
-	struct platform_device *pdev = to_platform_device(dev);
 	bool do_wakeup = device_may_wakeup(dev);
 	int rc = ohci_suspend(hcd, do_wakeup);
 
@@ -200,7 +199,7 @@ static int exynos_ohci_suspend(struct device *dev)
 	if (exynos_ohci->otg)
 		exynos_ohci->otg->set_host(exynos_ohci->otg, &hcd->self);
 
-	exynos_ohci_phy_disable(pdev);
+	exynos_ohci_phy_disable(dev);
 
 	clk_disable_unprepare(exynos_ohci->clk);
 
@@ -211,14 +210,13 @@ static int exynos_ohci_resume(struct device *dev)
 {
 	struct usb_hcd *hcd			= dev_get_drvdata(dev);
 	struct exynos_ohci_hcd *exynos_ohci	= to_exynos_ohci(hcd);
-	struct platform_device *pdev		= to_platform_device(dev);
 
 	clk_prepare_enable(exynos_ohci->clk);
 
 	if (exynos_ohci->otg)
 		exynos_ohci->otg->set_host(exynos_ohci->otg, &hcd->self);
 
-	exynos_ohci_phy_enable(pdev);
+	exynos_ohci_phy_enable(dev);
 
 	ohci_resume(hcd, false);
 
-- 
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
