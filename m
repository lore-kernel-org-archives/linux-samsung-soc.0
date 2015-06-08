From: Vivek Gautam <gautam.vivek@samsung.com>
Subject: [PATCH v4 1/2] usb: ehci-exynos: Make provision for vdd regulators
Date: Mon, 08 Jun 2015 16:37:12 +0530
Message-ID: <1433761633-8542-1-git-send-email-gautam.vivek@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:48252 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752202AbbFHLGi (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 8 Jun 2015 07:06:38 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org, gregkh@linuxfoundation.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Jingoo Han <jg1.han@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Alan Stern <stern@rowland.harvard.edu>

Facilitate getting required 3.3V and 1.0V VDD supply for
EHCI controller on Exynos.

For example, patches for regulators' nodes:
c8c253f ARM: dts: Add regulator entries to smdk5420
275dcd2 ARM: dts: add max77686 pmic node for smdk5250,
enable only minimum number of regulators on smdk5250.

So ensuring now that the controller driver requests the necessary
VDD regulators (if available, unless there are direct VDD rails),
and enable them so as to make them working on exynos systems.

Signed-off-by: Vivek Gautam <gautam.vivek@samsung.com>
Cc: Jingoo Han <jg1.han@samsung.com>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Alan Stern <stern@rowland.harvard.edu>
---

These patches had long been posted, and i lost track of them.
My apologies for that.
Thanks to Krzysztof for catching this.

Kindly review.

Changes since v3:
 - added a if (!IS_ERR()) check for regulators before disabling
   them in error path.

Changes since v2:
 - replaced devm_regulator_get() with devm_regulator_get_optional().
 - Added Documentation for the vdd supplies for the controller.
 - Re-did the commit message.

 .../devicetree/bindings/usb/exynos-usb.txt         |  2 +
 drivers/usb/host/ehci-exynos.c                     | 57 +++++++++++++++++++++-
 2 files changed, 58 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/exynos-usb.txt b/Documentation/devicetree/bindings/usb/exynos-usb.txt
index 9b4dbe3..776fa03 100644
--- a/Documentation/devicetree/bindings/usb/exynos-usb.txt
+++ b/Documentation/devicetree/bindings/usb/exynos-usb.txt
@@ -23,6 +23,8 @@ Required properties:
 Optional properties:
  - samsung,vbus-gpio:  if present, specifies the GPIO that
    needs to be pulled up for the bus to be powered.
+ - vdd33-supply: handle to 3.3V Vdd supply regulator for the controller.
+ - vdd10-supply: handle to 1.0V Vdd supply regulator for the controller.
 
 Example:
 
diff --git a/drivers/usb/host/ehci-exynos.c b/drivers/usb/host/ehci-exynos.c
index df538fd..160ad66 100644
--- a/drivers/usb/host/ehci-exynos.c
+++ b/drivers/usb/host/ehci-exynos.c
@@ -21,6 +21,7 @@
 #include <linux/of_gpio.h>
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
+#include <linux/regulator/consumer.h>
 #include <linux/usb.h>
 #include <linux/usb/hcd.h>
 
@@ -45,6 +46,8 @@ static struct hc_driver __read_mostly exynos_ehci_hc_driver;
 struct exynos_ehci_hcd {
 	struct clk *clk;
 	struct phy *phy[PHY_NUMBER];
+	struct regulator *vdd33;
+	struct regulator *vdd10;
 };
 
 #define to_exynos_ehci(hcd) (struct exynos_ehci_hcd *)(hcd_to_ehci(hcd)->priv)
@@ -170,7 +173,27 @@ static int exynos_ehci_probe(struct platform_device *pdev)
 
 	err = exynos_ehci_get_phy(&pdev->dev, exynos_ehci);
 	if (err)
-		goto fail_clk;
+		goto fail_regulator1;
+
+	exynos_ehci->vdd33 = devm_regulator_get_optional(&pdev->dev, "vdd33");
+	if (!IS_ERR(exynos_ehci->vdd33)) {
+		err = regulator_enable(exynos_ehci->vdd33);
+		if (err) {
+			dev_err(&pdev->dev,
+				"Failed to enable 3.3V Vdd supply\n");
+			goto fail_regulator1;
+		}
+	}
+
+	exynos_ehci->vdd10 = devm_regulator_get_optional(&pdev->dev, "vdd10");
+	if (!IS_ERR(exynos_ehci->vdd10)) {
+		err = regulator_enable(exynos_ehci->vdd10);
+		if (err) {
+			dev_err(&pdev->dev,
+				"Failed to enable 1.0V Vdd supply\n");
+			goto fail_regulator2;
+		}
+	}
 
 skip_phy:
 
@@ -231,6 +254,12 @@ fail_add_hcd:
 fail_io:
 	clk_disable_unprepare(exynos_ehci->clk);
 fail_clk:
+	if (!IS_ERR(exynos_ehci->vdd10))
+		regulator_disable(exynos_ehci->vdd10);
+fail_regulator2:
+	if (!IS_ERR(exynos_ehci->vdd33))
+		regulator_disable(exynos_ehci->vdd33);
+fail_regulator1:
 	usb_put_hcd(hcd);
 	return err;
 }
@@ -246,6 +275,11 @@ static int exynos_ehci_remove(struct platform_device *pdev)
 
 	clk_disable_unprepare(exynos_ehci->clk);
 
+	if (!IS_ERR(exynos_ehci->vdd33))
+		regulator_disable(exynos_ehci->vdd33);
+	if (!IS_ERR(exynos_ehci->vdd10))
+		regulator_disable(exynos_ehci->vdd10);
+
 	usb_put_hcd(hcd);
 
 	return 0;
@@ -268,6 +302,11 @@ static int exynos_ehci_suspend(struct device *dev)
 
 	clk_disable_unprepare(exynos_ehci->clk);
 
+	if (!IS_ERR(exynos_ehci->vdd33))
+		regulator_disable(exynos_ehci->vdd33);
+	if (!IS_ERR(exynos_ehci->vdd10))
+		regulator_disable(exynos_ehci->vdd10);
+
 	return rc;
 }
 
@@ -277,6 +316,22 @@ static int exynos_ehci_resume(struct device *dev)
 	struct exynos_ehci_hcd *exynos_ehci = to_exynos_ehci(hcd);
 	int ret;
 
+	if (!IS_ERR(exynos_ehci->vdd33)) {
+		ret = regulator_enable(exynos_ehci->vdd33);
+		if (ret) {
+			dev_err(dev, "Failed to enable 3.3V Vdd supply\n");
+			return ret;
+		}
+	}
+
+	if (!IS_ERR(exynos_ehci->vdd10)) {
+		ret = regulator_enable(exynos_ehci->vdd10);
+		if (ret) {
+			dev_err(dev, "Failed to enable 1.0V Vdd supply\n");
+			return ret;
+		}
+	}
+
 	clk_prepare_enable(exynos_ehci->clk);
 
 	ret = exynos_ehci_phy_enable(dev);
-- 
2.2.0
