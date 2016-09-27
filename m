From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: [PATCH 1/6] Revert "drm/exynos: g2d: fix system and runtime pm integration"
Date: Tue, 27 Sep 2016 17:50:06 +0200
Message-ID: <1474991411-2937-2-git-send-email-tjakobi@math.uni-bielefeld.de>
References: <1474991411-2937-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:40846 "EHLO
        smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S933939AbcI0Puq (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 27 Sep 2016 11:50:46 -0400
In-Reply-To: <1474991411-2937-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, m.szyprowski@samsung.com, inki.dae@samsung.com, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>

This reverts commit b05984e21a7e000bf5074ace00d7a574944b2c16.

The change, i.e. merging the sleep and runpm operations, produces
a deadlock situation:
(1) exynos_g2d_exec_ioctl() prepares a runqueue node and
    calls g2d_exec_runqueue()
(2) g2d_exec_runqueue() calls g2d_dma_start() which gets
    runtime PM sync
(3) runtime PM core calls g2d_runtime_resume()
(4) g2d_runtime_resume() calls g2d_exec_runqueue(), which
    loops back to (2)

Due to mutexes that are in place, a deadlock situation is created.

Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
---
 drivers/gpu/drm/exynos/exynos_drm_g2d.c | 29 ++++++++++++++++++++++-------
 1 file changed, 22 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_g2d.c b/drivers/gpu/drm/exynos/exynos_drm_g2d.c
index 6eca8bb..4bf00f5 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_g2d.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_g2d.c
@@ -1475,8 +1475,8 @@ static int g2d_remove(struct platform_device *pdev)
 	return 0;
 }
 
-#ifdef CONFIG_PM
-static int g2d_runtime_suspend(struct device *dev)
+#ifdef CONFIG_PM_SLEEP
+static int g2d_suspend(struct device *dev)
 {
 	struct g2d_data *g2d = dev_get_drvdata(dev);
 
@@ -1490,6 +1490,25 @@ static int g2d_runtime_suspend(struct device *dev)
 
 	flush_work(&g2d->runqueue_work);
 
+	return 0;
+}
+
+static int g2d_resume(struct device *dev)
+{
+	struct g2d_data *g2d = dev_get_drvdata(dev);
+
+	g2d->suspended = false;
+	g2d_exec_runqueue(g2d);
+
+	return 0;
+}
+#endif
+
+#ifdef CONFIG_PM
+static int g2d_runtime_suspend(struct device *dev)
+{
+	struct g2d_data *g2d = dev_get_drvdata(dev);
+
 	clk_disable_unprepare(g2d->gate_clk);
 
 	return 0;
@@ -1504,16 +1523,12 @@ static int g2d_runtime_resume(struct device *dev)
 	if (ret < 0)
 		dev_warn(dev, "failed to enable clock.\n");
 
-	g2d->suspended = false;
-	g2d_exec_runqueue(g2d);
-
 	return ret;
 }
 #endif
 
 static const struct dev_pm_ops g2d_pm_ops = {
-	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
-				pm_runtime_force_resume)
+	SET_SYSTEM_SLEEP_PM_OPS(g2d_suspend, g2d_resume)
 	SET_RUNTIME_PM_OPS(g2d_runtime_suspend, g2d_runtime_resume, NULL)
 };
 
-- 
2.7.3
