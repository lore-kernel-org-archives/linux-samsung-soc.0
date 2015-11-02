From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 1/7] drm/exynos/hdmi: clock code re-factoring
Date: Mon, 02 Nov 2015 14:16:39 +0100
Message-ID: <1446470205-15606-2-git-send-email-a.hajda@samsung.com>
References: <1446470205-15606-1-git-send-email-a.hajda@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:34586 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752450AbbKBNR5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 2 Nov 2015 08:17:57 -0500
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NX600G9SVLV7690@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 02 Nov 2015 13:17:55 +0000 (GMT)
In-reply-to: <1446470205-15606-1-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: Andrzej Hajda <a.hajda@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>

With incoming support for newer SoCs different set of clocks will be required,
depending on IP version. The patch prepares the driver for it.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_hdmi.c | 184 ++++++++++++++++++++++++++---------
 1 file changed, 137 insertions(+), 47 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
index 57b6755..d720b77 100644
--- a/drivers/gpu/drm/exynos/exynos_hdmi.c
+++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
@@ -90,11 +90,24 @@ static const char * const supply[] = {
 	"vdd_pll",
 };
 
+struct string_array_spec {
+	int count;
+	const char * const *data;
+};
+
+#define INIT_ARRAY_SPEC(a) { .count = ARRAY_SIZE(a), .data = a }
+
 struct hdmi_driver_data {
 	unsigned int type;
 	const struct hdmiphy_config *phy_confs;
 	unsigned int phy_conf_count;
 	unsigned int is_apb_phy:1;
+	struct string_array_spec clk_gates;
+	/*
+	 * Array of triplets (p_off, p_on, clock), where p_off and p_on are
+	 * required parents of clock when HDMI-PHY is respectively off or on.
+	 */
+	struct string_array_spec clk_muxes;
 };
 
 struct hdmi_context {
@@ -116,11 +129,8 @@ struct hdmi_context {
 	struct gpio_desc 		*hpd_gpio;
 	int				irq;
 	struct regmap			*pmureg;
-	struct clk			*hdmi;
-	struct clk			*sclk_hdmi;
-	struct clk			*sclk_pixel;
-	struct clk			*sclk_hdmiphy;
-	struct clk			*mout_hdmi;
+	struct clk			**clk_gates;
+	struct clk			**clk_muxes;
 	struct regulator_bulk_data	regul_bulk[ARRAY_SIZE(supply)];
 	struct regulator		*reg_hdmi_en;
 };
@@ -501,11 +511,21 @@ static const struct hdmiphy_config hdmiphy_5420_configs[] = {
 	},
 };
 
+static const char *hdmi_clk_gates4[] = {
+	"hdmi", "sclk_hdmi"
+};
+
+static const char *hdmi_clk_muxes4[] = {
+	"sclk_pixel", "sclk_hdmiphy", "mout_hdmi"
+};
+
 static struct hdmi_driver_data exynos5420_hdmi_driver_data = {
 	.type		= HDMI_TYPE14,
 	.phy_confs	= hdmiphy_5420_configs,
 	.phy_conf_count	= ARRAY_SIZE(hdmiphy_5420_configs),
 	.is_apb_phy	= 1,
+	.clk_gates	= INIT_ARRAY_SPEC(hdmi_clk_gates4),
+	.clk_muxes	= INIT_ARRAY_SPEC(hdmi_clk_muxes4),
 };
 
 static struct hdmi_driver_data exynos4212_hdmi_driver_data = {
@@ -513,6 +533,8 @@ static struct hdmi_driver_data exynos4212_hdmi_driver_data = {
 	.phy_confs	= hdmiphy_v14_configs,
 	.phy_conf_count	= ARRAY_SIZE(hdmiphy_v14_configs),
 	.is_apb_phy	= 0,
+	.clk_gates	= INIT_ARRAY_SPEC(hdmi_clk_gates4),
+	.clk_muxes	= INIT_ARRAY_SPEC(hdmi_clk_muxes4),
 };
 
 static struct hdmi_driver_data exynos4210_hdmi_driver_data = {
@@ -520,6 +542,8 @@ static struct hdmi_driver_data exynos4210_hdmi_driver_data = {
 	.phy_confs	= hdmiphy_v13_configs,
 	.phy_conf_count	= ARRAY_SIZE(hdmiphy_v13_configs),
 	.is_apb_phy	= 0,
+	.clk_gates	= INIT_ARRAY_SPEC(hdmi_clk_gates4),
+	.clk_muxes	= INIT_ARRAY_SPEC(hdmi_clk_muxes4),
 };
 
 static inline u32 hdmi_map_reg(struct hdmi_context *hdata, u32 reg_id)
@@ -847,6 +871,54 @@ static void hdmi_regs_dump(struct hdmi_context *hdata, char *prefix)
 		hdmi_v14_regs_dump(hdata, prefix);
 }
 
+static int hdmi_clk_enable_gates(struct hdmi_context *hdata)
+{
+	int i, ret;
+
+	for (i = 0; i < hdata->drv_data->clk_gates.count; ++i) {
+		ret = clk_prepare_enable(hdata->clk_gates[i]);
+		if (!ret)
+			continue;
+
+		dev_err(hdata->dev, "Cannot enable clock '%s', %d\n",
+			hdata->drv_data->clk_gates.data[i], ret);
+		while (i--)
+			clk_disable_unprepare(hdata->clk_gates[i]);
+		return ret;
+	}
+
+	return 0;
+}
+
+static void hdmi_clk_disable_gates(struct hdmi_context *hdata)
+{
+	int i = hdata->drv_data->clk_gates.count;
+
+	while (i--)
+		clk_disable_unprepare(hdata->clk_gates[i]);
+}
+
+static int hdmi_clk_set_parents(struct hdmi_context *hdata, bool to_phy)
+{
+	struct device *dev = hdata->dev;
+	int ret = 0;
+	int i;
+
+	for (i = 0; i < hdata->drv_data->clk_muxes.count; i += 3) {
+		struct clk **c = &hdata->clk_muxes[i];
+
+		ret = clk_set_parent(c[2], c[to_phy]);
+		if (!ret)
+			continue;
+
+		dev_err(dev, "Cannot set clock parent of '%s' to '%s', %d\n",
+			hdata->drv_data->clk_muxes.data[i + 2],
+			hdata->drv_data->clk_muxes.data[i + to_phy], ret);
+	}
+
+	return ret;
+}
+
 static u8 hdmi_chksum(struct hdmi_context *hdata,
 			u32 start, u8 len, u32 hdr_sum)
 {
@@ -1509,7 +1581,7 @@ static void hdmi_mode_apply(struct hdmi_context *hdata)
 
 	hdmiphy_wait_for_pll(hdata);
 
-	clk_set_parent(hdata->mout_hdmi, hdata->sclk_hdmiphy);
+	hdmi_clk_set_parents(hdata, true);
 
 	/* enable HDMI and timing generator */
 	hdmi_start(hdata, true);
@@ -1517,7 +1589,7 @@ static void hdmi_mode_apply(struct hdmi_context *hdata)
 
 static void hdmiphy_conf_reset(struct hdmi_context *hdata)
 {
-	clk_set_parent(hdata->mout_hdmi, hdata->sclk_pixel);
+	hdmi_clk_set_parents(hdata, false);
 
 	/* reset hdmiphy */
 	hdmi_reg_writemask(hdata, HDMI_PHY_RSTOUT, ~0, HDMI_PHY_SW_RSTOUT);
@@ -1599,8 +1671,7 @@ static void hdmi_enable(struct drm_encoder *encoder)
 	regmap_update_bits(hdata->pmureg, PMU_HDMI_PHY_CONTROL,
 			PMU_HDMI_PHY_ENABLE_BIT, 1);
 
-	clk_prepare_enable(hdata->hdmi);
-	clk_prepare_enable(hdata->sclk_hdmi);
+	hdmi_clk_enable_gates(hdata);
 
 	hdmi_conf_apply(hdata);
 }
@@ -1633,8 +1704,7 @@ static void hdmi_disable(struct drm_encoder *encoder)
 
 	cancel_delayed_work(&hdata->hotplug_work);
 
-	clk_disable_unprepare(hdata->sclk_hdmi);
-	clk_disable_unprepare(hdata->hdmi);
+	hdmi_clk_disable_gates(hdata);
 
 	/* reset pmu hdmiphy control bit to disable hdmiphy */
 	regmap_update_bits(hdata->pmureg, PMU_HDMI_PHY_CONTROL,
@@ -1678,6 +1748,56 @@ static irqreturn_t hdmi_irq_thread(int irq, void *arg)
 	return IRQ_HANDLED;
 }
 
+static int hdmi_clks_get(struct hdmi_context *hdata,
+			 const struct string_array_spec *names,
+			 struct clk **clks)
+{
+	struct device *dev = hdata->dev;
+	int i;
+
+	for (i = 0; i < names->count; ++i) {
+		struct clk *clk = devm_clk_get(dev, names->data[i]);
+
+		if (IS_ERR(clk)) {
+			int ret = PTR_ERR(clk);
+
+			dev_err(dev, "Cannot get clock %s, %d\n",
+				names->data[i], ret);
+
+			return ret;
+		}
+
+		clks[i] = clk;
+	}
+
+	return 0;
+}
+
+static int hdmi_clk_init(struct hdmi_context *hdata)
+{
+	const struct hdmi_driver_data *drv_data = hdata->drv_data;
+	int count = drv_data->clk_gates.count + drv_data->clk_muxes.count;
+	struct device *dev = hdata->dev;
+	struct clk **clks;
+	int ret;
+
+	if (!count)
+		return 0;
+
+	clks = devm_kzalloc(dev, sizeof(*clks) * count, GFP_KERNEL);
+	if (!clks)
+	return -ENOMEM;
+
+	hdata->clk_gates = clks;
+	hdata->clk_muxes = clks + drv_data->clk_gates.count;
+
+	ret = hdmi_clks_get(hdata, &drv_data->clk_gates, hdata->clk_gates);
+	if (ret)
+		return ret;
+
+	return hdmi_clks_get(hdata, &drv_data->clk_muxes, hdata->clk_muxes);
+}
+
 static int hdmi_resources_init(struct hdmi_context *hdata)
 {
 	struct device *dev = hdata->dev;
@@ -1694,41 +1814,14 @@ static int hdmi_resources_init(struct hdmi_context *hdata)
 	hdata->irq = gpiod_to_irq(hdata->hpd_gpio);
 	if (hdata->irq < 0) {
 		DRM_ERROR("failed to get GPIO irq\n");
-		return  hdata->irq;
-	}
-	/* get clocks, power */
-	hdata->hdmi = devm_clk_get(dev, "hdmi");
-	if (IS_ERR(hdata->hdmi)) {
-		DRM_ERROR("failed to get clock 'hdmi'\n");
-		ret = PTR_ERR(hdata->hdmi);
-		goto fail;
-	}
-	hdata->sclk_hdmi = devm_clk_get(dev, "sclk_hdmi");
-	if (IS_ERR(hdata->sclk_hdmi)) {
-		DRM_ERROR("failed to get clock 'sclk_hdmi'\n");
-		ret = PTR_ERR(hdata->sclk_hdmi);
-		goto fail;
-	}
-	hdata->sclk_pixel = devm_clk_get(dev, "sclk_pixel");
-	if (IS_ERR(hdata->sclk_pixel)) {
-		DRM_ERROR("failed to get clock 'sclk_pixel'\n");
-		ret = PTR_ERR(hdata->sclk_pixel);
-		goto fail;
-	}
-	hdata->sclk_hdmiphy = devm_clk_get(dev, "sclk_hdmiphy");
-	if (IS_ERR(hdata->sclk_hdmiphy)) {
-		DRM_ERROR("failed to get clock 'sclk_hdmiphy'\n");
-		ret = PTR_ERR(hdata->sclk_hdmiphy);
-		goto fail;
-	}
-	hdata->mout_hdmi = devm_clk_get(dev, "mout_hdmi");
-	if (IS_ERR(hdata->mout_hdmi)) {
-		DRM_ERROR("failed to get clock 'mout_hdmi'\n");
-		ret = PTR_ERR(hdata->mout_hdmi);
-		goto fail;
+		return hdata->irq;
 	}
 
-	clk_set_parent(hdata->mout_hdmi, hdata->sclk_pixel);
+	ret = hdmi_clk_init(hdata);
+	if (ret)
+		return ret;
+
+	hdmi_clk_set_parents(hdata, false);
 
 	for (i = 0; i < ARRAY_SIZE(supply); ++i) {
 		hdata->regul_bulk[i].supply = supply[i];
@@ -1753,9 +1846,6 @@ static int hdmi_resources_init(struct hdmi_context *hdata)
 		DRM_ERROR("failed to enable hdmi-en regulator\n");
 
 	return ret;
-fail:
-	DRM_ERROR("HDMI resource init - failed\n");
-	return ret;
 }
 
 static struct of_device_id hdmi_match_types[] = {
-- 
1.9.1
