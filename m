From: Inki Dae <inki.dae@samsung.com>
Subject: [PATCH v2 2/7] drm/exynos: add pm_runtime to DP
Date: Tue, 03 Nov 2015 19:47:04 +0900
Message-ID: <1446547629-12521-3-git-send-email-inki.dae@samsung.com>
References: <1446547629-12521-1-git-send-email-inki.dae@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:40050 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751418AbbKCKrO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 3 Nov 2015 05:47:14 -0500
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0NX802DO2JAOHS60@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 03 Nov 2015 19:47:12 +0900 (KST)
In-reply-to: <1446547629-12521-1-git-send-email-inki.dae@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org
Cc: airlied@linux.ie, linux-samsung-soc@vger.kernel.org, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, Inki Dae <inki.dae@samsung.com>

From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>

Let pm_runtime handle the enabling/disabling of the device with
proper refcnt instead of rely on specific flags to track the enabled
state.

Changelog v2:
- no change

Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
Signed-off-by: Inki Dae <inki.dae@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_dp_core.c | 58 ++++++++++++++++++++++++++-------
 1 file changed, 46 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_dp_core.c b/drivers/gpu/drm/exynos/exynos_dp_core.c
index e4d32a1..b6e8b89 100644
--- a/drivers/gpu/drm/exynos/exynos_dp_core.c
+++ b/drivers/gpu/drm/exynos/exynos_dp_core.c
@@ -1058,8 +1058,7 @@ static void exynos_dp_bridge_enable(struct drm_bridge *bridge)
 	struct exynos_dp_device *dp = bridge->driver_private;
 	struct exynos_drm_crtc *crtc = dp_to_crtc(dp);
 
-	if (dp->dpms_mode == DRM_MODE_DPMS_ON)
-		return;
+	pm_runtime_get_sync(dp->dev);
 
 	if (dp->panel) {
 		if (drm_panel_prepare(dp->panel)) {
@@ -1071,13 +1070,10 @@ static void exynos_dp_bridge_enable(struct drm_bridge *bridge)
 	if (crtc->ops->clock_enable)
 		crtc->ops->clock_enable(dp_to_crtc(dp), true);
 
-	clk_prepare_enable(dp->clock);
 	phy_power_on(dp->phy);
 	exynos_dp_init_dp(dp);
 	enable_irq(dp->irq);
 	exynos_dp_commit(&dp->encoder);
-
-	dp->dpms_mode = DRM_MODE_DPMS_ON;
 }
 
 static void exynos_dp_bridge_disable(struct drm_bridge *bridge)
@@ -1085,9 +1081,6 @@ static void exynos_dp_bridge_disable(struct drm_bridge *bridge)
 	struct exynos_dp_device *dp = bridge->driver_private;
 	struct exynos_drm_crtc *crtc = dp_to_crtc(dp);
 
-	if (dp->dpms_mode != DRM_MODE_DPMS_ON)
-		return;
-
 	if (dp->panel) {
 		if (drm_panel_disable(dp->panel)) {
 			DRM_ERROR("failed to disable the panel\n");
@@ -1098,7 +1091,6 @@ static void exynos_dp_bridge_disable(struct drm_bridge *bridge)
 	disable_irq(dp->irq);
 	flush_work(&dp->hotplug_work);
 	phy_power_off(dp->phy);
-	clk_disable_unprepare(dp->clock);
 
 	if (crtc->ops->clock_enable)
 		crtc->ops->clock_enable(dp_to_crtc(dp), false);
@@ -1108,7 +1100,7 @@ static void exynos_dp_bridge_disable(struct drm_bridge *bridge)
 			DRM_ERROR("failed to turnoff the panel\n");
 	}
 
-	dp->dpms_mode = DRM_MODE_DPMS_OFF;
+	pm_runtime_put_sync(dp->dev);
 }
 
 static void exynos_dp_bridge_nop(struct drm_bridge *bridge)
@@ -1267,7 +1259,6 @@ static int exynos_dp_bind(struct device *dev, struct device *master, void *data)
 	int pipe, ret = 0;
 
 	dp->dev = &pdev->dev;
-	dp->dpms_mode = DRM_MODE_DPMS_OFF;
 
 	dp->video_info = exynos_dp_dt_parse_pdata(&pdev->dev);
 	if (IS_ERR(dp->video_info))
@@ -1392,6 +1383,7 @@ static int exynos_dp_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct device_node *panel_node, *bridge_node, *endpoint;
 	struct exynos_dp_device *dp;
+	int ret;
 
 	dp = devm_kzalloc(&pdev->dev, sizeof(struct exynos_dp_device),
 				GFP_KERNEL);
@@ -1420,16 +1412,57 @@ static int exynos_dp_probe(struct platform_device *pdev)
 			return -EPROBE_DEFER;
 	}
 
-	return component_add(&pdev->dev, &exynos_dp_ops);
+	pm_runtime_enable(dev);
+
+	ret = component_add(&pdev->dev, &exynos_dp_ops);
+	if (ret)
+		goto err_disable_pm_runtime;
+
+	return ret;
+
+err_disable_pm_runtime:
+	pm_runtime_disable(dev);
+
+	return ret;
 }
 
 static int exynos_dp_remove(struct platform_device *pdev)
 {
+	pm_runtime_disable(&pdev->dev);
 	component_del(&pdev->dev, &exynos_dp_ops);
 
 	return 0;
 }
 
+#ifdef CONFIG_PM
+static int exynos_dp_suspend(struct device *dev)
+{
+	struct exynos_dp_device *dp = dev_get_drvdata(dev);
+
+	clk_disable_unprepare(dp->clock);
+
+	return 0;
+}
+
+static int exynos_dp_resume(struct device *dev)
+{
+	struct exynos_dp_device *dp = dev_get_drvdata(dev);
+	int ret;
+
+	ret = clk_prepare_enable(dp->clock);
+	if (ret < 0) {
+		DRM_ERROR("Failed to prepare_enable the clock clk [%d]\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+#endif
+
+static const struct dev_pm_ops exynos_dp_pm_ops = {
+	SET_RUNTIME_PM_OPS(exynos_dp_suspend, exynos_dp_resume, NULL)
+};
+
 static const struct of_device_id exynos_dp_match[] = {
 	{ .compatible = "samsung,exynos5-dp" },
 	{},
@@ -1442,6 +1475,7 @@ struct platform_driver dp_driver = {
 	.driver		= {
 		.name	= "exynos-dp",
 		.owner	= THIS_MODULE,
+		.pm	= &exynos_dp_pm_ops,
 		.of_match_table = exynos_dp_match,
 	},
 };
-- 
1.9.1
