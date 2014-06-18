From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [PATCH] drm/exynos: defer hdmi probe when fail to get regulators
Date: Wed, 18 Jun 2014 19:12:56 +0530
Message-ID: <1403098976-6506-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:42716 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751312AbaFRNoj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 18 Jun 2014 09:44:39 -0400
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N7D00CMDA6D8BC0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 18 Jun 2014 22:44:37 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org
Cc: linux-samsung-soc@vger.kernel.org, inki.dae@samsung.com, kgene.kim@samsung.com, joshi@samsung.com, r.sh.open@gmail.com, Rahul Sharma <rahul.sharma@samsung.com>

HDMI probe proceeds with dummy regulators when the regulators
are not provided in DT node or regulator provider has not get
probed or failed to register the regulators.

This patch modify hdmi driver to defer the probe in case the
regulators are not available.

Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
---
Based on exynos-drm-fixes branch in Inki dae's tree.
 drivers/gpu/drm/exynos/exynos_hdmi.c |   69 ++++++++++++++++++++++++----------
 1 file changed, 50 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
index aa259b0..3f24c49 100644
--- a/drivers/gpu/drm/exynos/exynos_hdmi.c
+++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
@@ -83,7 +83,7 @@ struct hdmi_resources {
 	struct clk			*sclk_pixel;
 	struct clk			*sclk_hdmiphy;
 	struct clk			*mout_hdmi;
-	struct regulator_bulk_data	*regul_bulk;
+	struct regulator		**regulators;
 	int				regul_count;
 };
 
@@ -2022,6 +2022,36 @@ static void hdmi_commit(struct exynos_drm_display *display)
 	hdmi_conf_apply(hdata);
 }
 
+int hdmi_regulator_enable(struct hdmi_context *hdata)
+{
+	struct hdmi_resources *res = &hdata->res;
+	int i, ret;
+
+	for (i = 0; i < res->regul_count; ++i) {
+		ret = regulator_enable(res->regulators[i]);
+		if (ret < 0) {
+			DRM_ERROR("fail to enable regulators.\n");
+			return ret;
+		}
+	}
+	return 0;
+}
+
+int hdmi_regulator_disable(struct hdmi_context *hdata)
+{
+	struct hdmi_resources *res = &hdata->res;
+	int i, ret;
+
+	for (i = 0; i < res->regul_count; ++i) {
+		ret = regulator_disable(res->regulators[i]);
+		if (ret < 0) {
+			DRM_ERROR("fail to disable regulators.\n");
+			return ret;
+		}
+	}
+	return 0;
+}
+
 static void hdmi_poweron(struct exynos_drm_display *display)
 {
 	struct hdmi_context *hdata = display->ctx;
@@ -2039,8 +2069,8 @@ static void hdmi_poweron(struct exynos_drm_display *display)
 
 	pm_runtime_get_sync(hdata->dev);
 
-	if (regulator_bulk_enable(res->regul_count, res->regul_bulk))
-		DRM_DEBUG_KMS("failed to enable regulator bulk\n");
+	if (hdmi_regulator_enable(hdata))
+		DRM_DEBUG_KMS("failed to enable regulators\n");
 
 	/* set pmu hdmiphy control bit to enable hdmiphy */
 	regmap_update_bits(hdata->pmureg, PMU_HDMI_PHY_CONTROL,
@@ -2077,7 +2107,8 @@ static void hdmi_poweroff(struct exynos_drm_display *display)
 	regmap_update_bits(hdata->pmureg, PMU_HDMI_PHY_CONTROL,
 			PMU_HDMI_PHY_ENABLE_BIT, 0);
 
-	regulator_bulk_disable(res->regul_count, res->regul_bulk);
+	if (hdmi_regulator_disable(hdata))
+		DRM_DEBUG_KMS("failed to disable regulators\n");
 
 	pm_runtime_put_sync(hdata->dev);
 
@@ -2211,24 +2242,24 @@ static int hdmi_resources_init(struct hdmi_context *hdata)
 
 	clk_set_parent(res->mout_hdmi, res->sclk_pixel);
 
-	res->regul_bulk = devm_kzalloc(dev, ARRAY_SIZE(supply) *
-		sizeof(res->regul_bulk[0]), GFP_KERNEL);
-	if (!res->regul_bulk) {
-		ret = -ENOMEM;
-		goto fail;
-	}
+	res->regul_count = ARRAY_SIZE(supply);
+
+	res->regulators = devm_kzalloc(dev, res->regul_count *
+		sizeof(res->regulators[0]), GFP_KERNEL);
+	if (!res->regulators)
+		return -ENOMEM;
+
 	for (i = 0; i < ARRAY_SIZE(supply); ++i) {
-		res->regul_bulk[i].supply = supply[i];
-		res->regul_bulk[i].consumer = NULL;
-	}
-	ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(supply), res->regul_bulk);
-	if (ret) {
-		DRM_ERROR("failed to get regulators\n");
-		return ret;
+		res->regulators[i] =
+			devm_regulator_get_optional(dev, supply[i]);
+		if (IS_ERR(res->regulators[i])) {
+			DRM_ERROR("fail to get regulator: %s.\n",
+				supply[i]);
+			return -EPROBE_DEFER;
+		}
 	}
-	res->regul_count = ARRAY_SIZE(supply);
 
-	return ret;
+	return 0;
 fail:
 	DRM_ERROR("HDMI resource init - failed\n");
 	return ret;
-- 
1.7.9.5
