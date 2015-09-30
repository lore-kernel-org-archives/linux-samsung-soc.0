From: Inki Dae <inki.dae@samsung.com>
Subject: [PATCH] drm/exynos: dp: remove suspend/resume functions
Date: Wed, 30 Sep 2015 20:21:19 +0900
Message-ID: <1443612079-28094-1-git-send-email-inki.dae@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:37048 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756104AbbI3LVW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 30 Sep 2015 07:21:22 -0400
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0NVH01RV3M7KPTB0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 30 Sep 2015 20:21:20 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org
Cc: linux-samsung-soc@vger.kernel.org, jg1.han@samsung.com, Inki Dae <inki.dae@samsung.com>

This patch removes unnecessary pm suspend/resume functions.

All kms sub drivers will be controlled by top of Exynos drm driver
and connector dpms so these sub drivers shouldn't have their own
pm interfaces.

Signed-off-by: Inki Dae <inki.dae@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_dp_core.c | 23 -----------------------
 1 file changed, 23 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_dp_core.c b/drivers/gpu/drm/exynos/exynos_dp_core.c
index d66ade0..124fb9a 100644
--- a/drivers/gpu/drm/exynos/exynos_dp_core.c
+++ b/drivers/gpu/drm/exynos/exynos_dp_core.c
@@ -1383,28 +1383,6 @@ static int exynos_dp_remove(struct platform_device *pdev)
 	return 0;
 }
 
-#ifdef CONFIG_PM_SLEEP
-static int exynos_dp_suspend(struct device *dev)
-{
-	struct exynos_dp_device *dp = dev_get_drvdata(dev);
-
-	exynos_dp_disable(&dp->encoder);
-	return 0;
-}
-
-static int exynos_dp_resume(struct device *dev)
-{
-	struct exynos_dp_device *dp = dev_get_drvdata(dev);
-
-	exynos_dp_enable(&dp->encoder);
-	return 0;
-}
-#endif
-
-static const struct dev_pm_ops exynos_dp_pm_ops = {
-	SET_SYSTEM_SLEEP_PM_OPS(exynos_dp_suspend, exynos_dp_resume)
-};
-
 static const struct of_device_id exynos_dp_match[] = {
 	{ .compatible = "samsung,exynos5-dp" },
 	{},
@@ -1417,7 +1395,6 @@ struct platform_driver dp_driver = {
 	.driver		= {
 		.name	= "exynos-dp",
 		.owner	= THIS_MODULE,
-		.pm	= &exynos_dp_pm_ops,
 		.of_match_table = exynos_dp_match,
 	},
 };
-- 
1.9.1
