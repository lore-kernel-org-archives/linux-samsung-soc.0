From: Inki Dae <inki.dae@samsung.com>
Subject: [PATCH] drm/exynos: dsi: remove unnecessary pm interfaces
Date: Thu, 17 Apr 2014 14:52:31 +0900
Message-ID: <1397713951-25872-1-git-send-email-inki.dae@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:54844 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755142AbaDQFwk (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 17 Apr 2014 01:52:40 -0400
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N45005VSUZL5FB0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 17 Apr 2014 14:52:33 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: airlied@linux.ie, dri-devel@lists.freedesktop.org
Cc: linux-samsung-soc@vger.kernel.org, kyungmin.park@samsung.com, seanpaul@chromium.org, a.hajda@samsung.com, jy0922.shim@samsung.com, sw0312.kim@samsung.com, Inki Dae <inki.dae@samsung.com>

Exynos drm driver is a single driver so pm operation
for kms drivers should be done by connector->dpms
at top level driver.

If kms driver has its own pm interfaces, single driver model
would be broken so this patch removes unnecessary pm interfaces
from dsi driver.

Signed-off-by: Inki Dae <inki.dae@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_dsi.c |   31 -------------------------------
 1 file changed, 31 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index 09cc4bae..ae81124 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -1412,36 +1412,6 @@ static void exynos_dsi_unbind(struct device *dev, struct device *master,
 	drm_connector_cleanup(&dsi->connector);
 }
 
-#if CONFIG_PM_SLEEP
-static int exynos_dsi_resume(struct device *dev)
-{
-	struct exynos_dsi *dsi = exynos_dsi_display.ctx;
-
-	if (dsi->state & DSIM_STATE_ENABLED) {
-		dsi->state &= ~DSIM_STATE_ENABLED;
-		exynos_dsi_enable(dsi);
-	}
-
-	return 0;
-}
-
-static int exynos_dsi_suspend(struct device *dev)
-{
-	struct exynos_dsi *dsi = exynos_dsi_display.ctx;
-
-	if (dsi->state & DSIM_STATE_ENABLED) {
-		exynos_dsi_disable(dsi);
-		dsi->state |= DSIM_STATE_ENABLED;
-	}
-
-	return 0;
-}
-#endif
-
-static const struct dev_pm_ops exynos_dsi_pm_ops = {
-	SET_SYSTEM_SLEEP_PM_OPS(exynos_dsi_suspend, exynos_dsi_resume)
-};
-
 static const struct component_ops exynos_dsi_component_ops = {
 	.bind	= exynos_dsi_bind,
 	.unbind	= exynos_dsi_unbind,
@@ -1545,7 +1515,6 @@ struct platform_driver dsi_driver = {
 	.driver = {
 		   .name = "exynos-dsi",
 		   .owner = THIS_MODULE,
-		   .pm = &exynos_dsi_pm_ops,
 		   .of_match_table = exynos_dsi_of_match,
 	},
 };
-- 
1.7.9.5
