From: Inki Dae <inki.dae@samsung.com>
Subject: [PATCH] drm/exynos: dsi: add runtime pm support
Date: Mon, 16 Nov 2015 21:26:43 +0900
Message-ID: <1447676803-30314-1-git-send-email-inki.dae@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:36698 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750932AbbKPM0q (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 16 Nov 2015 07:26:46 -0500
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0NXW02LD8QKKXJ60@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 16 Nov 2015 21:26:44 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org
Cc: airlied@linux.ie, linux-samsung-soc@vger.kernel.org, Inki Dae <inki.dae@samsung.com>

This patch adds runtime pm interfaces to dsi driver.

Each sub driver should control not only its own clocks and
regulator but also its power domain.

For this, it removes existing exynos_dsi_poweron/poweroff interfaces
and uses runtime pm interfaces instead.

Signed-off-by: Inki Dae <inki.dae@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 147 ++++++++++++++++++--------------
 1 file changed, 81 insertions(+), 66 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index 12b03b3..7c3606a 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -1458,66 +1458,6 @@ static const struct mipi_dsi_host_ops exynos_dsi_ops = {
 	.transfer = exynos_dsi_host_transfer,
 };
 
-static int exynos_dsi_poweron(struct exynos_dsi *dsi)
-{
-	struct exynos_dsi_driver_data *driver_data = dsi->driver_data;
-	int ret, i;
-
-	ret = regulator_bulk_enable(ARRAY_SIZE(dsi->supplies), dsi->supplies);
-	if (ret < 0) {
-		dev_err(dsi->dev, "cannot enable regulators %d\n", ret);
-		return ret;
-	}
-
-	for (i = 0; i < driver_data->num_clks; i++) {
-		ret = clk_prepare_enable(dsi->clks[i]);
-		if (ret < 0)
-			goto err_clk;
-	}
-
-	ret = phy_power_on(dsi->phy);
-	if (ret < 0) {
-		dev_err(dsi->dev, "cannot enable phy %d\n", ret);
-		goto err_clk;
-	}
-
-	return 0;
-
-err_clk:
-	while (--i > -1)
-		clk_disable_unprepare(dsi->clks[i]);
-	regulator_bulk_disable(ARRAY_SIZE(dsi->supplies), dsi->supplies);
-
-	return ret;
-}
-
-static void exynos_dsi_poweroff(struct exynos_dsi *dsi)
-{
-	struct exynos_dsi_driver_data *driver_data = dsi->driver_data;
-	int ret, i;
-
-	usleep_range(10000, 20000);
-
-	if (dsi->state & DSIM_STATE_INITIALIZED) {
-		dsi->state &= ~DSIM_STATE_INITIALIZED;
-
-		exynos_dsi_disable_clock(dsi);
-
-		exynos_dsi_disable_irq(dsi);
-	}
-
-	dsi->state &= ~DSIM_STATE_CMD_LPM;
-
-	phy_power_off(dsi->phy);
-
-	for (i = driver_data->num_clks - 1; i > -1; i--)
-		clk_disable_unprepare(dsi->clks[i]);
-
-	ret = regulator_bulk_disable(ARRAY_SIZE(dsi->supplies), dsi->supplies);
-	if (ret < 0)
-		dev_err(dsi->dev, "cannot disable regulators %d\n", ret);
-}
-
 static void exynos_dsi_enable(struct drm_encoder *encoder)
 {
 	struct exynos_dsi *dsi = encoder_to_dsi(encoder);
@@ -1526,16 +1466,14 @@ static void exynos_dsi_enable(struct drm_encoder *encoder)
 	if (dsi->state & DSIM_STATE_ENABLED)
 		return;
 
-	ret = exynos_dsi_poweron(dsi);
-	if (ret < 0)
-		return;
+	pm_runtime_get_sync(dsi->dev);
 
 	dsi->state |= DSIM_STATE_ENABLED;
 
 	ret = drm_panel_prepare(dsi->panel);
 	if (ret < 0) {
 		dsi->state &= ~DSIM_STATE_ENABLED;
-		exynos_dsi_poweroff(dsi);
+		pm_runtime_put_sync(dsi->dev);
 		return;
 	}
 
@@ -1547,7 +1485,7 @@ static void exynos_dsi_enable(struct drm_encoder *encoder)
 		dsi->state &= ~DSIM_STATE_ENABLED;
 		exynos_dsi_set_display_enable(dsi, false);
 		drm_panel_unprepare(dsi->panel);
-		exynos_dsi_poweroff(dsi);
+		pm_runtime_put_sync(dsi->dev);
 		return;
 	}
 
@@ -1569,7 +1507,7 @@ static void exynos_dsi_disable(struct drm_encoder *encoder)
 
 	dsi->state &= ~DSIM_STATE_ENABLED;
 
-	exynos_dsi_poweroff(dsi);
+	pm_runtime_put_sync(dsi->dev);
 }
 
 static enum drm_connector_status
@@ -1954,22 +1892,99 @@ static int exynos_dsi_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, &dsi->encoder);
 
+	pm_runtime_enable(dev);
+
 	return component_add(dev, &exynos_dsi_component_ops);
 }
 
 static int exynos_dsi_remove(struct platform_device *pdev)
 {
+	pm_runtime_disable(&pdev->dev);
+
 	component_del(&pdev->dev, &exynos_dsi_component_ops);
 
 	return 0;
 }
 
+#ifdef CONFIG_PM
+static int exynos_dsi_suspend(struct device *dev)
+{
+	struct drm_encoder *encoder = dev_get_drvdata(dev);
+	struct exynos_dsi *dsi = encoder_to_dsi(encoder);
+	struct exynos_dsi_driver_data *driver_data = dsi->driver_data;
+	int ret, i;
+
+	usleep_range(10000, 20000);
+
+	if (dsi->state & DSIM_STATE_INITIALIZED) {
+		dsi->state &= ~DSIM_STATE_INITIALIZED;
+
+		exynos_dsi_disable_clock(dsi);
+
+		exynos_dsi_disable_irq(dsi);
+	}
+
+	dsi->state &= ~DSIM_STATE_CMD_LPM;
+
+	phy_power_off(dsi->phy);
+
+	for (i = driver_data->num_clks - 1; i > -1; i--)
+		clk_disable_unprepare(dsi->clks[i]);
+
+	ret = regulator_bulk_disable(ARRAY_SIZE(dsi->supplies), dsi->supplies);
+	if (ret < 0)
+		dev_err(dsi->dev, "cannot disable regulators %d\n", ret);
+
+	return 0;
+}
+
+static int exynos_dsi_resume(struct device *dev)
+{
+	struct drm_encoder *encoder = dev_get_drvdata(dev);
+	struct exynos_dsi *dsi = encoder_to_dsi(encoder);
+	struct exynos_dsi_driver_data *driver_data = dsi->driver_data;
+	int ret, i;
+
+	ret = regulator_bulk_enable(ARRAY_SIZE(dsi->supplies), dsi->supplies);
+	if (ret < 0) {
+		dev_err(dsi->dev, "cannot enable regulators %d\n", ret);
+		return ret;
+	}
+
+	for (i = 0; i < driver_data->num_clks; i++) {
+		ret = clk_prepare_enable(dsi->clks[i]);
+		if (ret < 0)
+			goto err_clk;
+	}
+
+	ret = phy_power_on(dsi->phy);
+	if (ret < 0) {
+		dev_err(dsi->dev, "cannot enable phy %d\n", ret);
+		goto err_clk;
+	}
+
+	return 0;
+
+err_clk:
+	while (--i > -1)
+		clk_disable_unprepare(dsi->clks[i]);
+	regulator_bulk_disable(ARRAY_SIZE(dsi->supplies), dsi->supplies);
+
+	return ret;
+}
+#endif
+
+static const struct dev_pm_ops exynos_dsi_pm_ops = {
+	SET_RUNTIME_PM_OPS(exynos_dsi_suspend, exynos_dsi_resume, NULL)
+};
+
 struct platform_driver dsi_driver = {
 	.probe = exynos_dsi_probe,
 	.remove = exynos_dsi_remove,
 	.driver = {
 		   .name = "exynos-dsi",
 		   .owner = THIS_MODULE,
+		   .pm = &exynos_dsi_pm_ops,
 		   .of_match_table = exynos_dsi_of_match,
 	},
 };
-- 
1.9.1
