From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 01/15] drm/exynos/ipp: remove fake pm callbacks
Date: Fri, 22 Aug 2014 09:52:12 +0200
Message-ID: <1408693946-15456-2-git-send-email-a.hajda@samsung.com>
References: <1408693946-15456-1-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <1408693946-15456-1-git-send-email-a.hajda@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Inki Dae <inki.dae@samsung.com>
Cc: "moderated list:ARM/S5P EXYNOS AR..." <linux-samsung-soc@vger.kernel.org>, Seung-Woo Kim <sw0312.kim@samsung.com>, open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

PM callbacks in ipp core do nothing, so the patch removes it.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_ipp.c | 51 ---------------------------------
 1 file changed, 51 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_ipp.c b/drivers/gpu/drm/exynos/exynos_drm_ipp.c
index c411399..da917ca 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_ipp.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_ipp.c
@@ -1808,63 +1808,12 @@ static int ipp_remove(struct platform_device *pdev)
 	return 0;
 }
 
-static int ipp_power_ctrl(struct ipp_context *ctx, bool enable)
-{
-	DRM_DEBUG_KMS("enable[%d]\n", enable);
-
-	return 0;
-}
-
-#ifdef CONFIG_PM_SLEEP
-static int ipp_suspend(struct device *dev)
-{
-	struct ipp_context *ctx = get_ipp_context(dev);
-
-	if (pm_runtime_suspended(dev))
-		return 0;
-
-	return ipp_power_ctrl(ctx, false);
-}
-
-static int ipp_resume(struct device *dev)
-{
-	struct ipp_context *ctx = get_ipp_context(dev);
-
-	if (!pm_runtime_suspended(dev))
-		return ipp_power_ctrl(ctx, true);
-
-	return 0;
-}
-#endif
-
-#ifdef CONFIG_PM_RUNTIME
-static int ipp_runtime_suspend(struct device *dev)
-{
-	struct ipp_context *ctx = get_ipp_context(dev);
-
-	return ipp_power_ctrl(ctx, false);
-}
-
-static int ipp_runtime_resume(struct device *dev)
-{
-	struct ipp_context *ctx = get_ipp_context(dev);
-
-	return ipp_power_ctrl(ctx, true);
-}
-#endif
-
-static const struct dev_pm_ops ipp_pm_ops = {
-	SET_SYSTEM_SLEEP_PM_OPS(ipp_suspend, ipp_resume)
-	SET_RUNTIME_PM_OPS(ipp_runtime_suspend, ipp_runtime_resume, NULL)
-};
-
 struct platform_driver ipp_driver = {
 	.probe		= ipp_probe,
 	.remove		= ipp_remove,
 	.driver		= {
 		.name	= "exynos-drm-ipp",
 		.owner	= THIS_MODULE,
-		.pm	= &ipp_pm_ops,
 	},
 };
 
-- 
1.9.1
