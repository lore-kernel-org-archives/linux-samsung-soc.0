From: Shuah Khan <shuahkh@osg.samsung.com>
Subject: [PATCH] drm: exynos: dsi: release DSI_PORT_OUT node right after of_drm_find_bridge()
Date: Fri, 23 Jun 2017 18:56:28 -0600
Message-ID: <20170624005628.5896-1-shuahkh@osg.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com ([52.27.115.49]:35016
        "EHLO osg.samsung.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1754075AbdFXA4e (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 23 Jun 2017 20:56:34 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: inki.dae@samsung.com, sw0312.kim@samsung.com, kyungmin.park@samsung.com, airlied@linux.ie, kgene@kernel.org, krzk@kernel.org, javier@osg.samsung.com
Cc: Shuah Khan <shuahkh@osg.samsung.com>, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

Fix to call of_node_put() right after of_drm_find_bridge() instead of
holding on to it until exynos_dsi_remove().

Suggested-by: Inki Dae <inki.dae@samsung.com>
Signed-off-by: Shuah Khan <shuahkh@osg.samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index e337cd2..7513b88 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -1689,6 +1689,7 @@ static int exynos_dsi_bind(struct device *dev, struct device *master,
 
 	if (dsi->bridge_node) {
 		bridge = of_drm_find_bridge(dsi->bridge_node);
+		of_node_put(dsi->bridge_node);
 		if (bridge)
 			drm_bridge_attach(encoder, bridge, NULL);
 	}
@@ -1807,10 +1808,6 @@ static int exynos_dsi_probe(struct platform_device *pdev)
 
 static int exynos_dsi_remove(struct platform_device *pdev)
 {
-	struct exynos_dsi *dsi = platform_get_drvdata(pdev);
-
-	of_node_put(dsi->bridge_node);
-
 	pm_runtime_disable(&pdev->dev);
 
 	component_del(&pdev->dev, &exynos_dsi_component_ops);
-- 
2.7.4
