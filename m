From: Gustavo Padovan <gustavo@padovan.org>
Subject: [PATCH 03/10] drm/exynos: add pm_runtime to HDMI
Date: Fri,  4 Sep 2015 17:15:45 -0300
Message-ID: <1441397752-6672-4-git-send-email-gustavo@padovan.org>
References: <1441397752-6672-1-git-send-email-gustavo@padovan.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yk0-f195.google.com ([209.85.160.195]:36129 "EHLO
	mail-yk0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1760474AbbIDUQG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 4 Sep 2015 16:16:06 -0400
Received: by ykcf206 with SMTP id f206so2756921ykc.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 04 Sep 2015 13:16:05 -0700 (PDT)
In-Reply-To: <1441397752-6672-1-git-send-email-gustavo@padovan.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, inki.dae@samsung.com, jy0922.shim@samsung.com, tjakobi@math.uni-bielefeld.de, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>

Let pm_runtime handle the enabling/disabling of the device with proper
refcnt instead of rely on specific flags to track the enabled state.

Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
---
 drivers/gpu/drm/exynos/exynos_hdmi.c | 56 +++++++++++++++++++++++++-----------
 1 file changed, 39 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
index 932f7fa..5fcbdda 100644
--- a/drivers/gpu/drm/exynos/exynos_hdmi.c
+++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
@@ -92,7 +92,6 @@ struct hdmi_context {
 	struct drm_device		*drm_dev;
 	struct drm_connector		connector;
 	bool				hpd;
-	bool				powered;
 	bool				dvi_mode;
 
 	void __iomem			*regs;
@@ -1726,11 +1725,6 @@ static void hdmi_enable(struct drm_encoder *encoder)
 	struct hdmi_context *hdata = encoder_to_hdmi(encoder);
 	struct hdmi_resources *res = &hdata->res;
 
-	if (hdata->powered)
-		return;
-
-	hdata->powered = true;
-
 	pm_runtime_get_sync(hdata->dev);
 
 	if (regulator_bulk_enable(res->regul_count, res->regul_bulk))
@@ -1740,9 +1734,6 @@ static void hdmi_enable(struct drm_encoder *encoder)
 	regmap_update_bits(hdata->pmureg, PMU_HDMI_PHY_CONTROL,
 			PMU_HDMI_PHY_ENABLE_BIT, 1);
 
-	clk_prepare_enable(res->hdmi);
-	clk_prepare_enable(res->sclk_hdmi);
-
 	hdmiphy_poweron(hdata);
 	hdmi_conf_apply(hdata);
 }
@@ -1754,9 +1745,6 @@ static void hdmi_disable(struct drm_encoder *encoder)
 	struct drm_crtc *crtc = encoder->crtc;
 	const struct drm_crtc_helper_funcs *funcs = NULL;
 
-	if (!hdata->powered)
-		return;
-
 	/*
 	 * The SFRs of VP and Mixer are updated by Vertical Sync of
 	 * Timing generator which is a part of HDMI so the sequence
@@ -1778,9 +1766,6 @@ static void hdmi_disable(struct drm_encoder *encoder)
 
 	cancel_delayed_work(&hdata->hotplug_work);
 
-	clk_disable_unprepare(res->sclk_hdmi);
-	clk_disable_unprepare(res->hdmi);
-
 	/* reset pmu hdmiphy control bit to disable hdmiphy */
 	regmap_update_bits(hdata->pmureg, PMU_HDMI_PHY_CONTROL,
 			PMU_HDMI_PHY_ENABLE_BIT, 0);
@@ -1788,8 +1773,6 @@ static void hdmi_disable(struct drm_encoder *encoder)
 	regulator_bulk_disable(res->regul_count, res->regul_bulk);
 
 	pm_runtime_put_sync(hdata->dev);
-
-	hdata->powered = false;
 }
 
 static struct drm_encoder_helper_funcs exynos_hdmi_encoder_helper_funcs = {
@@ -2146,12 +2129,51 @@ static int hdmi_remove(struct platform_device *pdev)
 	return 0;
 }
 
+#ifdef CONFIG_PM_SLEEP
+static int exynos_hdmi_suspend(struct device *dev)
+{
+	struct hdmi_context *hdata = dev_get_drvdata(dev);
+	struct hdmi_resources *res = &hdata->res;
+
+	clk_disable_unprepare(res->sclk_hdmi);
+	clk_disable_unprepare(res->hdmi);
+
+	return 0;
+}
+
+static int exynos_hdmi_resume(struct device *dev)
+{
+	struct hdmi_context *hdata = dev_get_drvdata(dev);
+	struct hdmi_resources *res = &hdata->res;
+	int ret;
+
+	ret = clk_prepare_enable(res->hdmi);
+	if (ret < 0) {
+		DRM_ERROR("Failed to prepare_enable the hdmi clk [%d]\n", ret);
+		return ret;
+	}
+	ret = clk_prepare_enable(res->sclk_hdmi);
+	if (ret < 0) {
+		DRM_ERROR("Failed to prepare_enable the sclk_mixer clk [%d]\n",
+			  ret);
+		return ret;
+	}
+
+	return 0;
+}
+#endif
+
+static const struct dev_pm_ops exynos_hdmi_pm_ops = {
+	SET_RUNTIME_PM_OPS(exynos_hdmi_suspend, exynos_hdmi_resume, NULL)
+};
+
 struct platform_driver hdmi_driver = {
 	.probe		= hdmi_probe,
 	.remove		= hdmi_remove,
 	.driver		= {
 		.name	= "exynos-hdmi",
 		.owner	= THIS_MODULE,
+		.pm	= &exynos_hdmi_pm_ops,
 		.of_match_table = hdmi_match_types,
 	},
 };
-- 
2.1.0
