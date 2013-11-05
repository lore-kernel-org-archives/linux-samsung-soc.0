From: Kamil Debski <k.debski@samsung.com>
Subject: [PATCH v3 3/3] usb: s3c-hsotg: Use the new Exynos USB phy driver with
 the generic phy framework
Date: Tue, 05 Nov 2013 17:13:21 +0100
Message-ID: <1383668001-19141-4-git-send-email-k.debski@samsung.com>
References: <1383668001-19141-1-git-send-email-k.debski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:49882 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752812Ab3KEQQz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 5 Nov 2013 11:16:55 -0500
In-reply-to: <1383668001-19141-1-git-send-email-k.debski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-arm@vger.kernel.org
Cc: kyungmin.park@samsung.com, kishon@ti.com, t.figa@samsung.com, s.nawrocki@samsung.com, m.szyprowski@samsung.com, gautam.vivek@samsung.com, mat.krawczuk@gmail.com, yulgon.kim@samsung.com, p.paneri@samsung.com, av.tikhomirov@samsung.com, jg1.han@samsung.com, galak@codeaurora.org, Kamil Debski <k.debski@samsung.com>

Change the used phy driver to the new Exynos USB phy driver that uses the
generic phy framework.

Signed-off-by: Kamil Debski <k.debski@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 drivers/usb/gadget/s3c-hsotg.c |   12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/gadget/s3c-hsotg.c b/drivers/usb/gadget/s3c-hsotg.c
index bb31262..dc7f20c 100644
--- a/drivers/usb/gadget/s3c-hsotg.c
+++ b/drivers/usb/gadget/s3c-hsotg.c
@@ -31,6 +31,7 @@
 #include <linux/regulator/consumer.h>
 #include <linux/of.h>
 #include <linux/of_platform.h>
+#include <linux/phy/phy.h>
 
 #include <linux/usb/ch9.h>
 #include <linux/usb/gadget.h>
@@ -162,7 +163,7 @@ struct s3c_hsotg_ep {
 struct s3c_hsotg {
 	struct device		 *dev;
 	struct usb_gadget_driver *driver;
-	struct usb_phy		*phy;
+	struct phy		 *phy;
 	struct s3c_hsotg_plat	 *plat;
 
 	spinlock_t              lock;
@@ -2905,9 +2906,10 @@ static void s3c_hsotg_phy_enable(struct s3c_hsotg *hsotg)
 	dev_dbg(hsotg->dev, "pdev 0x%p\n", pdev);
 
 	if (hsotg->phy)
-		usb_phy_init(hsotg->phy);
+		phy_power_on(hsotg->phy);
 	else if (hsotg->plat->phy_init)
 		hsotg->plat->phy_init(pdev, hsotg->plat->phy_type);
+
 }
 
 /**
@@ -2922,7 +2924,7 @@ static void s3c_hsotg_phy_disable(struct s3c_hsotg *hsotg)
 	struct platform_device *pdev = to_platform_device(hsotg->dev);
 
 	if (hsotg->phy)
-		usb_phy_shutdown(hsotg->phy);
+		phy_power_off(hsotg->phy);
 	else if (hsotg->plat->phy_exit)
 		hsotg->plat->phy_exit(pdev, hsotg->plat->phy_type);
 }
@@ -3529,7 +3531,7 @@ static void s3c_hsotg_delete_debug(struct s3c_hsotg *hsotg)
 static int s3c_hsotg_probe(struct platform_device *pdev)
 {
 	struct s3c_hsotg_plat *plat = dev_get_platdata(&pdev->dev);
-	struct usb_phy *phy;
+	struct phy *phy;
 	struct device *dev = &pdev->dev;
 	struct s3c_hsotg_ep *eps;
 	struct s3c_hsotg *hsotg;
@@ -3544,7 +3546,7 @@ static int s3c_hsotg_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	}
 
-	phy = devm_usb_get_phy(dev, USB_PHY_TYPE_USB2);
+	phy = devm_phy_get(&pdev->dev, "device");
 	if (IS_ERR(phy)) {
 		/* Fallback for pdata */
 		plat = dev_get_platdata(&pdev->dev);
-- 
1.7.9.5
