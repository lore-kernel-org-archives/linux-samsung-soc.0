From: Kamil Debski <k.debski@samsung.com>
Subject: [PATCH v5 5/9] usb: s3c-hsotg: Use the new Exynos USB phy driver with
 the generic phy framework
Date: Fri, 20 Dec 2013 14:24:11 +0100
Message-ID: <1387545857-9472-6-git-send-email-k.debski@samsung.com>
References: <1387545857-9472-1-git-send-email-k.debski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1387545857-9472-1-git-send-email-k.debski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-usb@vger.kernel.org, devicetree@vger.kernel.org
Cc: kyungmin.park@samsung.com, kishon@ti.com, t.figa@samsung.com, s.nawrocki@samsung.com, m.szyprowski@samsung.com, gautam.vivek@samsung.com, mat.krawczuk@gmail.com, yulgon.kim@samsung.com, p.paneri@samsung.com, av.tikhomirov@samsung.com, jg1.han@samsung.com, galak@codeaurora.org, matt.porter@linaro.org, k.debski@samsung.com, tjakobi@math.uni-bielefeld.de, stern@rowland.harvard.edu
List-Id: linux-samsung-soc@vger.kernel.org

Change the used phy driver to the new Exynos USB phy driver that uses the
generic phy framework.

Signed-off-by: Kamil Debski <k.debski@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 .../devicetree/bindings/usb/samsung-hsotg.txt      |    4 ++++
 drivers/usb/gadget/s3c-hsotg.c                     |   11 ++++++-----
 2 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/samsung-hsotg.txt b/Documentation/devicetree/bindings/usb/samsung-hsotg.txt
index b83d428..75edb9d 100644
--- a/Documentation/devicetree/bindings/usb/samsung-hsotg.txt
+++ b/Documentation/devicetree/bindings/usb/samsung-hsotg.txt
@@ -24,6 +24,8 @@ Required properties:
     - first entry: must be "otg"
 - vusb_d-supply: phandle to voltage regulator of digital section,
 - vusb_a-supply: phandle to voltage regulator of analog section.
+- phys: from general PHY binding: phandle to the PHY device
+- phy-names: from general PHY binding: should be "usb2-phy"
 
 Example
 -----
@@ -36,5 +38,7 @@ Example
 		clock-names = "otg";
 		vusb_d-supply = <&vusb_reg>;
 		vusb_a-supply = <&vusbdac_reg>;
+		phys = <&usb2phy 0>;
+		phy-names = "usb2-phy";
 	};
 
diff --git a/drivers/usb/gadget/s3c-hsotg.c b/drivers/usb/gadget/s3c-hsotg.c
index 7aedaaf..a05c2f9 100644
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
@@ -2910,7 +2911,7 @@ static void s3c_hsotg_phy_enable(struct s3c_hsotg *hsotg)
 	dev_dbg(hsotg->dev, "pdev 0x%p\n", pdev);
 
 	if (hsotg->phy)
-		usb_phy_init(hsotg->phy);
+		phy_power_on(hsotg->phy);
 	else if (hsotg->plat->phy_init)
 		hsotg->plat->phy_init(pdev, hsotg->plat->phy_type);
 }
@@ -2927,7 +2928,7 @@ static void s3c_hsotg_phy_disable(struct s3c_hsotg *hsotg)
 	struct platform_device *pdev = to_platform_device(hsotg->dev);
 
 	if (hsotg->phy)
-		usb_phy_shutdown(hsotg->phy);
+		phy_power_off(hsotg->phy);
 	else if (hsotg->plat->phy_exit)
 		hsotg->plat->phy_exit(pdev, hsotg->plat->phy_type);
 }
@@ -3534,7 +3535,7 @@ static void s3c_hsotg_delete_debug(struct s3c_hsotg *hsotg)
 static int s3c_hsotg_probe(struct platform_device *pdev)
 {
 	struct s3c_hsotg_plat *plat = dev_get_platdata(&pdev->dev);
-	struct usb_phy *phy;
+	struct phy *phy;
 	struct device *dev = &pdev->dev;
 	struct s3c_hsotg_ep *eps;
 	struct s3c_hsotg *hsotg;
@@ -3549,7 +3550,7 @@ static int s3c_hsotg_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	}
 
-	phy = devm_usb_get_phy(dev, USB_PHY_TYPE_USB2);
+	phy = devm_phy_get(&pdev->dev, "usb2-phy");
 	if (IS_ERR(phy)) {
 		/* Fallback for pdata */
 		plat = dev_get_platdata(&pdev->dev);
-- 
1.7.9.5
