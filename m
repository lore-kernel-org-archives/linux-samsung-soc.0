From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 09/16] drm/exynos/hdmi: use constant size array for regulators
Date: Fri, 25 Sep 2015 14:48:22 +0200
Message-ID: <1443185309-13827-10-git-send-email-a.hajda@samsung.com>
References: <1443185309-13827-1-git-send-email-a.hajda@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:35552 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932221AbbIYMtE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 25 Sep 2015 08:49:04 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NV800CL4GXQ7C10@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 25 Sep 2015 13:49:02 +0100 (BST)
In-reply-to: <1443185309-13827-1-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org

Driver always uses the same number of regulators, so there is no point in
dynamic allocation.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_hdmi.c | 25 +++++++++----------------
 1 file changed, 9 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
index 841470c..583dd5e 100644
--- a/drivers/gpu/drm/exynos/exynos_hdmi.c
+++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
@@ -83,6 +83,12 @@ static const u32 hdmi_reg_map[][HDMI_TYPE_COUNT] = {
 	{ HDMI_V13_ACR_CON, HDMI_V14_ACR_CON },
 };
 
+static const char * const supply[] = {
+	"vdd",
+	"vdd_osc",
+	"vdd_pll",
+};
+
 struct hdmi_driver_data {
 	unsigned int type;
 	const struct hdmiphy_config *phy_confs;
@@ -96,9 +102,8 @@ struct hdmi_resources {
 	struct clk			*sclk_pixel;
 	struct clk			*sclk_hdmiphy;
 	struct clk			*mout_hdmi;
-	struct regulator_bulk_data	*regul_bulk;
+	struct regulator_bulk_data	regul_bulk[ARRAY_SIZE(supply)];
 	struct regulator		*reg_hdmi_en;
-	int				regul_count;
 };
 
 struct hdmi_context {
@@ -1652,7 +1657,7 @@ static void hdmi_enable(struct drm_encoder *encoder)
 
 	pm_runtime_get_sync(hdata->dev);
 
-	if (regulator_bulk_enable(res->regul_count, res->regul_bulk))
+	if (regulator_bulk_enable(ARRAY_SIZE(supply), res->regul_bulk))
 		DRM_DEBUG_KMS("failed to enable regulator bulk\n");
 
 	/* set pmu hdmiphy control bit to enable hdmiphy */
@@ -1701,7 +1706,7 @@ static void hdmi_disable(struct drm_encoder *encoder)
 	regmap_update_bits(hdata->pmureg, PMU_HDMI_PHY_CONTROL,
 			PMU_HDMI_PHY_ENABLE_BIT, 0);
 
-	regulator_bulk_disable(res->regul_count, res->regul_bulk);
+	regulator_bulk_disable(ARRAY_SIZE(supply), res->regul_bulk);
 
 	pm_runtime_put_sync(hdata->dev);
 
@@ -1743,11 +1748,6 @@ static int hdmi_resources_init(struct hdmi_context *hdata)
 {
 	struct device *dev = hdata->dev;
 	struct hdmi_resources *res = &hdata->res;
-	static char *supply[] = {
-		"vdd",
-		"vdd_osc",
-		"vdd_pll",
-	};
 	int i, ret;
 
 	DRM_DEBUG_KMS("HDMI resource init\n");
@@ -1786,12 +1786,6 @@ static int hdmi_resources_init(struct hdmi_context *hdata)
 
 	clk_set_parent(res->mout_hdmi, res->sclk_pixel);
 
-	res->regul_bulk = devm_kzalloc(dev, ARRAY_SIZE(supply) *
-		sizeof(res->regul_bulk[0]), GFP_KERNEL);
-	if (!res->regul_bulk) {
-		ret = -ENOMEM;
-		goto fail;
-	}
 	for (i = 0; i < ARRAY_SIZE(supply); ++i) {
 		res->regul_bulk[i].supply = supply[i];
 		res->regul_bulk[i].consumer = NULL;
@@ -1801,7 +1795,6 @@ static int hdmi_resources_init(struct hdmi_context *hdata)
 		DRM_ERROR("failed to get regulators\n");
 		return ret;
 	}
-	res->regul_count = ARRAY_SIZE(supply);
 
 	res->reg_hdmi_en = devm_regulator_get_optional(dev, "hdmi-en");
 
-- 
1.9.1
