From: Vivek Gautam <gautam.vivek@samsung.com>
Subject: [PATCH v4 2/2] usb: ohci-exynos: Make provision for vdd regulators
Date: Mon, 08 Jun 2015 16:37:13 +0530
Message-ID: <1433761633-8542-2-git-send-email-gautam.vivek@samsung.com>
References: <1433761633-8542-1-git-send-email-gautam.vivek@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:54289 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752293AbbFHLGj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 8 Jun 2015 07:06:39 -0400
In-reply-to: <1433761633-8542-1-git-send-email-gautam.vivek@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org, gregkh@linuxfoundation.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Jingoo Han <jg1.han@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Alan Stern <stern@rowland.harvard.edu>

Facilitate getting required 3.3V and 1.0V VDD supply for
OHCI controller on Exynos.

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

Changes since v3:
 - added a if (!IS_ERR()) check for regulators before disabling
   them in error path.

Changes since v2:
 - replaced devm_regulator_get() with devm_regulator_get_optional().
 - Added Documentation for the vdd supplies for the controller.
 - Re-did the commit message.

 .../devicetree/bindings/usb/exynos-usb.txt         |  2 +
 .../devicetree/bindings/usb/exynos-usb.txt         |  4 ++
 drivers/usb/host/ohci-exynos.c                     | 57 +++++++++++++++++++++-
 2 files changed, 60 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/exynos-usb.txt b/Documentation/devicetree/bindings/usb/exynos-usb.txt
index 776fa03..3883baa 100644
--- a/Documentation/devicetree/bindings/usb/exynos-usb.txt
+++ b/Documentation/devicetree/bindings/usb/exynos-usb.txt
@@ -63,6 +63,10 @@ Required properties:
 			      port 2 is HSIC phy1
 	- phys: from the *Generic PHY* bindings, specifying phy used by port.
 
+Optional properties:
+ - vdd33-supply: handle to 3.3V Vdd supply regulator for the controller.
+ - vdd10-supply: handle to 1.0V Vdd supply regulator for the controller.
+
 Example:
 	usb@12120000 {
 		compatible = "samsung,exynos4210-ohci";
diff --git a/drivers/usb/host/ohci-exynos.c b/drivers/usb/host/ohci-exynos.c
index 2cd105b..4d6dea4 100644
--- a/drivers/usb/host/ohci-exynos.c
+++ b/drivers/usb/host/ohci-exynos.c
@@ -19,6 +19,7 @@
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/phy/phy.h>
+#include <linux/regulator/consumer.h>
 #include <linux/usb.h>
 #include <linux/usb/hcd.h>
 
@@ -36,6 +37,8 @@ static struct hc_driver __read_mostly exynos_ohci_hc_driver;
 struct exynos_ohci_hcd {
 	struct clk *clk;
 	struct phy *phy[PHY_NUMBER];
+	struct regulator *vdd33;
+	struct regulator *vdd10;
 };
 
 static int exynos_ohci_get_phy(struct device *dev,
@@ -139,7 +142,27 @@ static int exynos_ohci_probe(struct platform_device *pdev)
 
 	err = exynos_ohci_get_phy(&pdev->dev, exynos_ohci);
 	if (err)
-		goto fail_clk;
+		goto fail_regulator1;
+
+	exynos_ohci->vdd33 = devm_regulator_get_optional(&pdev->dev, "vdd33");
+	if (!IS_ERR(exynos_ohci->vdd33)) {
+		err = regulator_enable(exynos_ohci->vdd33);
+		if (err) {
+			dev_err(&pdev->dev,
+				"Failed to enable 3.3V Vdd supply\n");
+			goto fail_regulator1;
+		}
+	}
+
+	exynos_ohci->vdd10 = devm_regulator_get_optional(&pdev->dev, "vdd10");
+	if (!IS_ERR(exynos_ohci->vdd10)) {
+		err = regulator_enable(exynos_ohci->vdd10);
+		if (err) {
+			dev_err(&pdev->dev,
+				"Failed to enable 1.0V Vdd supply\n");
+			goto fail_regulator2;
+		}
+	}
 
 skip_phy:
 	exynos_ohci->clk = devm_clk_get(&pdev->dev, "usbhost");
@@ -191,6 +214,12 @@ fail_add_hcd:
 fail_io:
 	clk_disable_unprepare(exynos_ohci->clk);
 fail_clk:
+	if (!IS_ERR(exynos_ohci->vdd10))
+		regulator_disable(exynos_ohci->vdd10);
+fail_regulator2:
+	if (!IS_ERR(exynos_ohci->vdd33))
+		regulator_disable(exynos_ohci->vdd33);
+fail_regulator1:
 	usb_put_hcd(hcd);
 	return err;
 }
@@ -206,6 +235,11 @@ static int exynos_ohci_remove(struct platform_device *pdev)
 
 	clk_disable_unprepare(exynos_ohci->clk);
 
+	if (!IS_ERR(exynos_ohci->vdd33))
+		regulator_disable(exynos_ohci->vdd33);
+	if (!IS_ERR(exynos_ohci->vdd10))
+		regulator_disable(exynos_ohci->vdd10);
+
 	usb_put_hcd(hcd);
 
 	return 0;
@@ -234,6 +268,11 @@ static int exynos_ohci_suspend(struct device *dev)
 
 	clk_disable_unprepare(exynos_ohci->clk);
 
+	if (!IS_ERR(exynos_ohci->vdd33))
+		regulator_disable(exynos_ohci->vdd33);
+	if (!IS_ERR(exynos_ohci->vdd10))
+		regulator_disable(exynos_ohci->vdd10);
+
 	return 0;
 }
 
@@ -243,6 +282,22 @@ static int exynos_ohci_resume(struct device *dev)
 	struct exynos_ohci_hcd *exynos_ohci	= to_exynos_ohci(hcd);
 	int ret;
 
+	if (!IS_ERR(exynos_ohci->vdd33)) {
+		ret = regulator_enable(exynos_ohci->vdd33);
+		if (ret) {
+			dev_err(dev, "Failed to enable 3.3V Vdd supply\n");
+			return ret;
+		}
+	}
+
+	if (!IS_ERR(exynos_ohci->vdd10)) {
+		ret = regulator_enable(exynos_ohci->vdd10);
+		if (ret) {
+			dev_err(dev, "Failed to enable 1.0V Vdd supply\n");
+			return ret;
+		}
+	}
+
 	clk_prepare_enable(exynos_ohci->clk);
 
 	ret = exynos_ohci_phy_enable(dev);
-- 
2.2.0
