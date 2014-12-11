From: Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 2/4] phy: samsung-usb2: Add facility for VBUS supply
Date: Thu, 11 Dec 2014 17:32:45 +0530
Message-ID: <1418299367-2412-3-git-send-email-gautam.vivek@samsung.com>
References: <1418299367-2412-1-git-send-email-gautam.vivek@samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1418299367-2412-1-git-send-email-gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, k.debski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Adding support to enable/disable VBUS controlled by a regulator
on USB 2.0 port.
This is a part of moving vbus setting out of ehci-exynos.
Since vbus can be handled by USB 2.0 phy itself, so the host
need not care about it.
Moreover, setting VBUS in USB 2.0 phy helps both ehci as well
as ohci. This issue was not taken care of until now; when
ehci is not enabled and only ohci is enabled the VBUS was never
set.

Keeping the vbus setting code in ehci-exynos intact for now
to keep supporting older dt bindings.

Signed-off-by: Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---
 .../devicetree/bindings/phy/samsung-phy.txt        |    3 ++
 drivers/phy/phy-samsung-usb2.c                     |   30 ++++++++++++++++++++
 drivers/phy/phy-samsung-usb2.h                     |    1 +
 3 files changed, 34 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/samsung-phy.txt b/Documentation/devicetree/bindings/phy/samsung-phy.txt
index 0090ad1..44d82ba 100644
--- a/Documentation/devicetree/bindings/phy/samsung-phy.txt
+++ b/Documentation/devicetree/bindings/phy/samsung-phy.txt
@@ -44,6 +44,9 @@ Required properties:
 	- the "ref" clock is used to get the rate of the clock provided to the
 	  PHY module
 
+Optional properties:
+- vbus-supply : Reference to regulator node which supplies VBUS on the PHY.
+
 The first phandle argument in the PHY specifier identifies the PHY, its
 meaning is compatible dependent. For the currently supported SoCs (Exynos 4210
 and Exynos 4212) it is as follows:
diff --git a/drivers/phy/phy-samsung-usb2.c b/drivers/phy/phy-samsung-usb2.c
index 4a12f66..7fe7c84 100644
--- a/drivers/phy/phy-samsung-usb2.c
+++ b/drivers/phy/phy-samsung-usb2.c
@@ -16,6 +16,7 @@
 #include <linux/of_address.h>
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
+#include <linux/regulator/consumer.h>
 #include <linux/spinlock.h>
 #include "phy-samsung-usb2.h"
 
@@ -33,6 +34,16 @@ static int samsung_usb2_phy_power_on(struct phy *phy)
 	ret = clk_prepare_enable(drv->ref_clk);
 	if (ret)
 		goto err_instance_clk;
+
+	/* Enable VBUS supply */
+	if (drv->vbus) {
+		ret = regulator_enable(drv->vbus);
+		if (ret) {
+			dev_err(drv->dev, "Failed to enable VBUS supply\n");
+			goto err_fail_vbus;
+		}
+	}
+
 	if (inst->cfg->power_on) {
 		spin_lock(&drv->lock);
 		ret = inst->cfg->power_on(inst);
@@ -41,6 +52,8 @@ static int samsung_usb2_phy_power_on(struct phy *phy)
 
 	return 0;
 
+err_fail_vbus:
+	clk_disable_unprepare(drv->ref_clk);
 err_instance_clk:
 	clk_disable_unprepare(drv->clk);
 err_main_clk:
@@ -60,8 +73,14 @@ static int samsung_usb2_phy_power_off(struct phy *phy)
 		ret = inst->cfg->power_off(inst);
 		spin_unlock(&drv->lock);
 	}
+
+	/* Disable VBUS supply */
+	if (drv->vbus)
+		regulator_disable(drv->vbus);
+
 	clk_disable_unprepare(drv->ref_clk);
 	clk_disable_unprepare(drv->clk);
+
 	return ret;
 }
 
@@ -197,6 +216,17 @@ static int samsung_usb2_phy_probe(struct platform_device *pdev)
 			return ret;
 	}
 
+	/* Get Vbus regulators */
+	drv->vbus = devm_regulator_get(dev, "vbus");
+	if (IS_ERR(drv->vbus)) {
+		ret = PTR_ERR(drv->vbus);
+		if (ret == -EPROBE_DEFER)
+			return ret;
+
+		dev_warn(dev, "Failed to get VBUS supply regulator\n");
+		drv->vbus = NULL;
+	}
+
 	for (i = 0; i < drv->cfg->num_phys; i++) {
 		char *label = drv->cfg->phys[i].label;
 		struct samsung_usb2_phy_instance *p = &drv->instances[i];
diff --git a/drivers/phy/phy-samsung-usb2.h b/drivers/phy/phy-samsung-usb2.h
index 44bead9..cb92e3e 100644
--- a/drivers/phy/phy-samsung-usb2.h
+++ b/drivers/phy/phy-samsung-usb2.h
@@ -43,6 +43,7 @@ struct samsung_usb2_phy_driver {
 	void __iomem *reg_phy;
 	struct regmap *reg_pmu;
 	struct regmap *reg_sys;
+	struct regulator *vbus;
 	spinlock_t lock;
 	struct samsung_usb2_phy_instance instances[0];
 };
-- 
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
