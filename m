From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [RFC 1/2] drm/exynos: replace dummy hdmiphy clock with pmu register
 control
Date: Tue, 11 Jun 2013 12:47:52 +0530
Message-ID: <1370935073-7475-2-git-send-email-rahul.sharma@samsung.com>
References: <1370935073-7475-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:47437 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751798Ab3FKGyR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 11 Jun 2013 02:54:17 -0400
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MO700FTIV6C5DQ0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 11 Jun 2013 15:54:15 +0900 (KST)
In-reply-to: <1370935073-7475-1-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, dri-devel@lists.freedesktop.org
Cc: kgene.kim@samsung.com, sw0312.kim@samsung.com, inki.dae@samsung.com, seanpaul@chromium.org, joshi@samsung.com, r.sh.open@gmail.com, Rahul Sharma <rahul.sharma@samsung.com>

Previous to CCF, hdmiphy is added as a dummy clock in clock file for
exynos SoCs. Enable/Disable to this clock, actually toggles the power
control bit in PMU, instead of controlling the clock gate.

Patch adds the support to parse hdmiphy control node which is a child
node to hdmi, and map the pmu register to toggle the power control bit.

Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_hdmi.c |   69 ++++++++++++++++++++++++++++++----
 drivers/gpu/drm/exynos/regs-hdmi.h   |    4 ++
 2 files changed, 65 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
index 3b5e215..75a6bf3 100644
--- a/drivers/gpu/drm/exynos/exynos_hdmi.c
+++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
@@ -34,6 +34,7 @@
 #include <linux/regulator/consumer.h>
 #include <linux/io.h>
 #include <linux/of_gpio.h>
+#include <linux/of_address.h>
 
 #include <drm/exynos_drm.h>
 
@@ -82,7 +83,6 @@ struct hdmi_resources {
 	struct clk			*sclk_hdmi;
 	struct clk			*sclk_pixel;
 	struct clk			*sclk_hdmiphy;
-	struct clk			*hdmiphy;
 	struct clk			*mout_hdmi;
 	struct regulator_bulk_data	*regul_bulk;
 	int				regul_count;
@@ -189,6 +189,7 @@ struct hdmi_context {
 	struct mutex			hdmi_mutex;
 
 	void __iomem			*regs;
+	void __iomem			*phy_pow_ctrl_reg;
 	void				*parent_ctx;
 	int				irq;
 
@@ -404,6 +405,14 @@ static inline void hdmi_reg_writemask(struct hdmi_context *hdata,
 	writel(value, hdata->regs + reg_id);
 }
 
+static inline void hdmi_phy_pow_ctrl_reg_writemask(struct hdmi_context *hdata,
+				 u32 value, u32 mask)
+{
+	u32 old = readl(hdata->phy_pow_ctrl_reg);
+	value = (value & mask) | (old & ~mask);
+	writel(value, hdata->phy_pow_ctrl_reg);
+}
+
 static void hdmi_v13_regs_dump(struct hdmi_context *hdata, char *prefix)
 {
 #define DUMPREG(reg_id) \
@@ -1702,7 +1711,8 @@ static void hdmi_poweron(struct hdmi_context *hdata)
 	if (regulator_bulk_enable(res->regul_count, res->regul_bulk))
 		DRM_DEBUG_KMS("failed to enable regulator bulk\n");
 
-	clk_prepare_enable(res->hdmiphy);
+	hdmi_phy_pow_ctrl_reg_writemask(hdata, PMU_HDMI_PHY_ENABLE,
+		PMU_HDMI_PHY_CONTROL_MASK);
 	clk_prepare_enable(res->hdmi);
 	clk_prepare_enable(res->sclk_hdmi);
 
@@ -1729,7 +1739,8 @@ static void hdmi_poweroff(struct hdmi_context *hdata)
 
 	clk_disable_unprepare(res->sclk_hdmi);
 	clk_disable_unprepare(res->hdmi);
-	clk_disable_unprepare(res->hdmiphy);
+	hdmi_phy_pow_ctrl_reg_writemask(hdata, PMU_HDMI_PHY_DISABLE,
+		PMU_HDMI_PHY_CONTROL_MASK);
 	regulator_bulk_disable(res->regul_count, res->regul_bulk);
 
 	mutex_lock(&hdata->hdmi_mutex);
@@ -1828,11 +1839,6 @@ static int hdmi_resources_init(struct hdmi_context *hdata)
 		DRM_ERROR("failed to get clock 'sclk_hdmiphy'\n");
 		goto fail;
 	}
-	res->hdmiphy = devm_clk_get(dev, "hdmiphy");
-	if (IS_ERR(res->hdmiphy)) {
-		DRM_ERROR("failed to get clock 'hdmiphy'\n");
-		goto fail;
-	}
 	res->mout_hdmi = devm_clk_get(dev, "mout_hdmi");
 	if (IS_ERR(res->mout_hdmi)) {
 		DRM_ERROR("failed to get clock 'mout_hdmi'\n");
@@ -1905,12 +1911,52 @@ static struct s5p_hdmi_platform_data *drm_hdmi_dt_parse_pdata
 err_data:
 	return NULL;
 }
+
+static int drm_hdmi_dt_parse_phy_pow_control(struct hdmi_context *hdata)
+{
+	struct device_node *phy_pow_ctrl_node;
+	u32 buf[2];
+	int ret = 0;
+
+	phy_pow_ctrl_node = of_find_node_by_name(NULL, "phy-power-control");
+	if (!phy_pow_ctrl_node) {
+		DRM_ERROR("Failed to find phy power control node\n");
+		ret = -ENODEV;
+		goto fail;
+	}
+
+	/* reg property holds two informations: addr of pmu register, size */
+	if (of_property_read_u32_array(phy_pow_ctrl_node, "reg",
+			(u32 *)&buf, 2)) {
+		DRM_ERROR("faild to get phy power control reg\n");
+		ret = -EINVAL;
+		goto fail;
+	}
+
+	hdata->phy_pow_ctrl_reg = devm_ioremap(hdata->dev, buf[0],  buf[1]);
+	if (!hdata->phy_pow_ctrl_reg) {
+		DRM_ERROR("failed to ioremap phy pmu reg\n");
+		ret = -ENOMEM;
+		goto fail;
+	}
+
+fail:
+	of_node_put(phy_pow_ctrl_node);
+	return ret;
+}
+
 #else
 static struct s5p_hdmi_platform_data *drm_hdmi_dt_parse_pdata
 					(struct device *dev)
 {
 	return NULL;
 }
+
+static int drm_hdmi_dt_parse_phy_pow_control(struct hdmi_context *hdata)
+{
+	return 0;
+}
+
 #endif
 
 static struct platform_device_id hdmi_driver_types[] = {
@@ -2022,6 +2068,13 @@ static int hdmi_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	/* map hdmiphy power control reg */
+	ret = drm_hdmi_dt_parse_phy_pow_control(hdata);
+	if (ret) {
+		DRM_ERROR("failed to map phy power control registers\n");
+		return ret;
+	}
+
 	/* DDC i2c driver */
 	if (i2c_add_driver(&ddc_driver)) {
 		DRM_ERROR("failed to register ddc i2c driver\n");
diff --git a/drivers/gpu/drm/exynos/regs-hdmi.h b/drivers/gpu/drm/exynos/regs-hdmi.h
index ef1b3eb..8d9ca25 100644
--- a/drivers/gpu/drm/exynos/regs-hdmi.h
+++ b/drivers/gpu/drm/exynos/regs-hdmi.h
@@ -578,4 +578,8 @@
 #define HDMI_TG_VACT_ST4_H		HDMI_TG_BASE(0x0074)
 #define HDMI_TG_3D			HDMI_TG_BASE(0x00F0)
 
+#define PMU_HDMI_PHY_CONTROL_MASK	(1 << 0)
+#define PMU_HDMI_PHY_ENABLE		(1)
+#define PMU_HDMI_PHY_DISABLE		(0)
+
 #endif /* SAMSUNG_REGS_HDMI_H */
-- 
1.7.10.4
