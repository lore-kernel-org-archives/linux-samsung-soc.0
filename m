From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 1/7] phy: exynos-usb2: add vbus regulator support
Date: Fri, 21 Aug 2015 14:38:37 +0200
Message-ID: <1440160723-6636-2-git-send-email-m.szyprowski@samsung.com>
References: <1440160723-6636-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1440160723-6636-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Robert Baldyga <r.baldyga@samsung.com>, John Youn <johnyoun@synopsys.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Kukjin Kim <kgene@kernel.org>, Kamil Debski <k.debski@samsung.com>, Kishon Vijay Abraham I <kishon@ti.com>
List-Id: linux-samsung-soc@vger.kernel.org

Exynos USB2 PHY has separate power supply, which is usually provided by
VBUS regulator. This patch adds support for it. VBUS regulator is
optional, to keep compatibility with boards, which have VBUS provided
from some always-on power source.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 .../devicetree/bindings/phy/samsung-phy.txt        |  3 +++
 drivers/phy/phy-samsung-usb2.c                     | 25 ++++++++++++++++++++--
 drivers/phy/phy-samsung-usb2.h                     |  2 ++
 3 files changed, 28 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/samsung-phy.txt b/Documentation/devicetree/bindings/phy/samsung-phy.txt
index 60c6f2a633e0..0289d3b07853 100644
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
index f278a9c547e1..1d22d93b552d 100644
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
index 44bead9b8f34..6563e7ca0ac4 100644
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
