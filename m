From: Inki Dae <inki.dae@samsung.com>
Subject: [PATCH v2 3/7] drm/exynos: add pm_runtime to HDMI
Date: Tue, 03 Nov 2015 19:47:05 +0900
Message-ID: <1446547629-12521-4-git-send-email-inki.dae@samsung.com>
References: <1446547629-12521-1-git-send-email-inki.dae@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:48628 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751834AbbKCKrO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 3 Nov 2015 05:47:14 -0500
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0NX802ZA4JAPEL60@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 03 Nov 2015 19:47:13 +0900 (KST)
In-reply-to: <1446547629-12521-1-git-send-email-inki.dae@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org
Cc: airlied@linux.ie, linux-samsung-soc@vger.kernel.org, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, Inki Dae <inki.dae@samsung.com>

From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>

Let pm_runtime handle the enabling/disabling of the device with proper
refcnt instead of rely on specific flags to track the enabled state.

Changelog v2:
- Mofidy CONFIG_PM_SLEEP -> CONFIG_PM

Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
Signed-off-by: Inki Dae <inki.dae@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_hdmi.c | 56 ++++++++++++++++++++++++------------
 1 file changed, 38 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
index 57b6755..d0362af 100644
--- a/drivers/gpu/drm/exynos/exynos_hdmi.c
+++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
@@ -102,7 +102,6 @@ struct hdmi_context {
 	struct device			*dev;
 	struct drm_device		*drm_dev;
 	struct drm_connector		connector;
-	bool				powered;
 	bool				dvi_mode;
 	struct delayed_work		hotplug_work;
 	struct drm_display_mode		current_mode;
@@ -113,7 +112,7 @@ struct hdmi_context {
 	void __iomem			*regs_hdmiphy;
 	struct i2c_client		*hdmiphy_port;
 	struct i2c_adapter		*ddc_adpt;
-	struct gpio_desc 		*hpd_gpio;
+	struct gpio_desc		*hpd_gpio;
 	int				irq;
 	struct regmap			*pmureg;
 	struct clk			*hdmi;
@@ -1585,11 +1584,6 @@ static void hdmi_enable(struct drm_encoder *encoder)
 {
 	struct hdmi_context *hdata = encoder_to_hdmi(encoder);
 
-	if (hdata->powered)
-		return;
-
-	hdata->powered = true;
-
 	pm_runtime_get_sync(hdata->dev);
 
 	if (regulator_bulk_enable(ARRAY_SIZE(supply), hdata->regul_bulk))
@@ -1599,9 +1593,6 @@ static void hdmi_enable(struct drm_encoder *encoder)
 	regmap_update_bits(hdata->pmureg, PMU_HDMI_PHY_CONTROL,
 			PMU_HDMI_PHY_ENABLE_BIT, 1);
 
-	clk_prepare_enable(hdata->hdmi);
-	clk_prepare_enable(hdata->sclk_hdmi);
-
 	hdmi_conf_apply(hdata);
 }
 
@@ -1611,9 +1602,6 @@ static void hdmi_disable(struct drm_encoder *encoder)
 	struct drm_crtc *crtc = encoder->crtc;
 	const struct drm_crtc_helper_funcs *funcs = NULL;
 
-	if (!hdata->powered)
-		return;
-
 	/*
 	 * The SFRs of VP and Mixer are updated by Vertical Sync of
 	 * Timing generator which is a part of HDMI so the sequence
@@ -1633,9 +1621,6 @@ static void hdmi_disable(struct drm_encoder *encoder)
 
 	cancel_delayed_work(&hdata->hotplug_work);
 
-	clk_disable_unprepare(hdata->sclk_hdmi);
-	clk_disable_unprepare(hdata->hdmi);
-
 	/* reset pmu hdmiphy control bit to disable hdmiphy */
 	regmap_update_bits(hdata->pmureg, PMU_HDMI_PHY_CONTROL,
 			PMU_HDMI_PHY_ENABLE_BIT, 0);
@@ -1643,8 +1628,6 @@ static void hdmi_disable(struct drm_encoder *encoder)
 	regulator_bulk_disable(ARRAY_SIZE(supply), hdata->regul_bulk);
 
 	pm_runtime_put_sync(hdata->dev);
-
-	hdata->powered = false;
 }
 
 static struct drm_encoder_helper_funcs exynos_hdmi_encoder_helper_funcs = {
@@ -1978,12 +1961,49 @@ static int hdmi_remove(struct platform_device *pdev)
 	return 0;
 }
 
+#ifdef CONFIG_PM
+static int exynos_hdmi_suspend(struct device *dev)
+{
+	struct hdmi_context *hdata = dev_get_drvdata(dev);
+
+	clk_disable_unprepare(hdata->sclk_hdmi);
+	clk_disable_unprepare(hdata->hdmi);
+
+	return 0;
+}
+
+static int exynos_hdmi_resume(struct device *dev)
+{
+	struct hdmi_context *hdata = dev_get_drvdata(dev);
+	int ret;
+
+	ret = clk_prepare_enable(hdata->hdmi);
+	if (ret < 0) {
+		DRM_ERROR("Failed to prepare_enable the hdmi clk [%d]\n", ret);
+		return ret;
+	}
+	ret = clk_prepare_enable(hdata->sclk_hdmi);
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
1.9.1
