From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH RESEND] phy: exynos-usb2: add vbus regulator support
Date: Tue, 06 Oct 2015 15:41:00 +0200
Message-ID: <1444138860-23595-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:14726 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751706AbbJFNlN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 6 Oct 2015 09:41:13 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Kishon Vijay Abraham I <kishon@ti.com>

Exynos USB2 PHY has separate power supply, which is usually provided by
VBUS regulator. This patch adds support for it. VBUS regulator is
optional, to keep compatibility with boards, which have VBUS provided
from some always-on power source.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
This is just a resend of a patch posted in the following thread:
https://lkml.org/lkml/2015/8/21/306

I really hope that it will finally get merged to v4.4. For more
information and background, please refer to the mentioned thread.

Marek Szyprowski
---
 .../devicetree/bindings/phy/samsung-phy.txt        |  3 +++
 drivers/phy/phy-samsung-usb2.c                     | 25 ++++++++++++++++++++--
 drivers/phy/phy-samsung-usb2.h                     |  2 ++
 3 files changed, 28 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/samsung-phy.txt b/Documentation/devicetree/bindings/phy/samsung-phy.txt
index 60c6f2a..0289d3b 100644
--- a/Documentation/devicetree/bindings/phy/samsung-phy.txt
+++ b/Documentation/devicetree/bindings/phy/samsung-phy.txt
@@ -44,6 +44,9 @@ Required properties:
 	- the "ref" clock is used to get the rate of the clock provided to the
 	  PHY module
 
+Optional properties:
+- vbus-supply: power-supply phandle for vbus power source
+
 The first phandle argument in the PHY specifier identifies the PHY, its
 meaning is compatible dependent. For the currently supported SoCs (Exynos 4210
 and Exynos 4212) it is as follows:
diff --git a/drivers/phy/phy-samsung-usb2.c b/drivers/phy/phy-samsung-usb2.c
index f278a9c..1d22d93 100644
--- a/drivers/phy/phy-samsung-usb2.c
+++ b/drivers/phy/phy-samsung-usb2.c
@@ -27,6 +27,13 @@ static int samsung_usb2_phy_power_on(struct phy *phy)
 
 	dev_dbg(drv->dev, "Request to power_on \"%s\" usb phy\n",
 		inst->cfg->label);
+
+	if (drv->vbus) {
+		ret = regulator_enable(drv->vbus);
+		if (ret)
+			goto err_regulator;
+	}
+
 	ret = clk_prepare_enable(drv->clk);
 	if (ret)
 		goto err_main_clk;
@@ -48,6 +55,9 @@ err_power_on:
 err_instance_clk:
 	clk_disable_unprepare(drv->clk);
 err_main_clk:
+	if (drv->vbus)
+		regulator_disable(drv->vbus);
+err_regulator:
 	return ret;
 }
 
@@ -55,7 +65,7 @@ static int samsung_usb2_phy_power_off(struct phy *phy)
 {
 	struct samsung_usb2_phy_instance *inst = phy_get_drvdata(phy);
 	struct samsung_usb2_phy_driver *drv = inst->drv;
-	int ret;
+	int ret = 0;
 
 	dev_dbg(drv->dev, "Request to power_off \"%s\" usb phy\n",
 		inst->cfg->label);
@@ -68,7 +78,10 @@ static int samsung_usb2_phy_power_off(struct phy *phy)
 	}
 	clk_disable_unprepare(drv->ref_clk);
 	clk_disable_unprepare(drv->clk);
-	return 0;
+	if (drv->vbus)
+		ret = regulator_disable(drv->vbus);
+
+	return ret;
 }
 
 static const struct phy_ops samsung_usb2_phy_ops = {
@@ -203,6 +216,14 @@ static int samsung_usb2_phy_probe(struct platform_device *pdev)
 			return ret;
 	}
 
+	drv->vbus = devm_regulator_get(dev, "vbus");
+	if (IS_ERR(drv->vbus)) {
+		ret = PTR_ERR(drv->vbus);
+		if (ret == -EPROBE_DEFER)
+			return ret;
+		drv->vbus = NULL;
+	}
+
 	for (i = 0; i < drv->cfg->num_phys; i++) {
 		char *label = drv->cfg->phys[i].label;
 		struct samsung_usb2_phy_instance *p = &drv->instances[i];
diff --git a/drivers/phy/phy-samsung-usb2.h b/drivers/phy/phy-samsung-usb2.h
index 44bead9..6563e7c 100644
--- a/drivers/phy/phy-samsung-usb2.h
+++ b/drivers/phy/phy-samsung-usb2.h
@@ -17,6 +17,7 @@
 #include <linux/device.h>
 #include <linux/regmap.h>
 #include <linux/spinlock.h>
+#include <linux/regulator/consumer.h>
 
 #define KHZ 1000
 #define MHZ (KHZ * KHZ)
@@ -37,6 +38,7 @@ struct samsung_usb2_phy_driver {
 	const struct samsung_usb2_phy_config *cfg;
 	struct clk *clk;
 	struct clk *ref_clk;
+	struct regulator *vbus;
 	unsigned long ref_rate;
 	u32 ref_reg_val;
 	struct device *dev;
-- 
1.9.2
