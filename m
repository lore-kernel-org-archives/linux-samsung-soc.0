From: Inki Dae <inki.dae@samsung.com>
Subject: [PATCH 1/2] drm/exynos: dsi: move of_drm_find_bridge call into
 probe
Date: Mon, 03 Jul 2017 16:27:58 +0900
Message-ID: <1499066879-13241-2-git-send-email-inki.dae@samsung.com>
References: <1499066879-13241-1-git-send-email-inki.dae@samsung.com>
        <CGME20170703072801epcas1p3cbabe54a8457771f906378b1036294b6@epcas1p3.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:58102 "EHLO
        mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752291AbdGCH2E (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 3 Jul 2017 03:28:04 -0400
In-reply-to: <1499066879-13241-1-git-send-email-inki.dae@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org
Cc: linux-samsung-soc@vger.kernel.org, Inki Dae <inki.dae@samsung.com>, Shuah Khan <shuahkh@osg.samsung.com>

This patch moves of_drm_find_bridge call into probe.

It doesn't need to call of_drm_find_bridge function every time
bind callback is called. It's enough to call this funcation
at probe one time.

Suggested-by: Inki Dae <inki.dae@samsung.com>
Signed-off-by: Shuah Khan <shuahkh@osg.samsung.com>
Signed-off-by: Inki Dae <inki.dae@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index b6a46d9..2412b23 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -1661,7 +1661,6 @@ static int exynos_dsi_bind(struct device *dev, struct device *master,
 	struct drm_encoder *encoder = dev_get_drvdata(dev);
 	struct exynos_dsi *dsi = encoder_to_dsi(encoder);
 	struct drm_device *drm_dev = data;
-	struct drm_bridge *bridge;
 	int ret;
 
 	ret = exynos_drm_crtc_get_pipe_from_type(drm_dev,
@@ -1685,12 +1684,6 @@ static int exynos_dsi_bind(struct device *dev, struct device *master,
 		return ret;
 	}
 
-	if (dsi->bridge_node) {
-		bridge = of_drm_find_bridge(dsi->bridge_node);
-		if (bridge)
-			drm_bridge_attach(encoder, bridge, NULL);
-	}
-
 	return mipi_dsi_host_register(&dsi->dsi_host);
 }
 
@@ -1798,6 +1791,18 @@ static int exynos_dsi_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, &dsi->encoder);
 
+	if (dsi->bridge_node) {
+		struct drm_bridge *bridge;
+
+		bridge = of_drm_find_bridge(dsi->bridge_node);
+		if (!bridge)
+			return -EPROBE_DEFER;
+
+		of_node_put(dsi->bridge_node);
+		drm_bridge_attach(&dsi->encoder, bridge, NULL);
+	}
+
+
 	pm_runtime_enable(dev);
 
 	return component_add(dev, &exynos_dsi_component_ops);
@@ -1805,10 +1810,6 @@ static int exynos_dsi_probe(struct platform_device *pdev)
 
 static int exynos_dsi_remove(struct platform_device *pdev)
 {
-	struct exynos_dsi *dsi = platform_get_drvdata(pdev);
-
-	of_node_put(dsi->bridge_node);
-
 	pm_runtime_disable(&pdev->dev);
 
 	component_del(&pdev->dev, &exynos_dsi_component_ops);
-- 
1.9.1
