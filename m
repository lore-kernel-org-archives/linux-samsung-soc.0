From: Inki Dae <inki.dae@samsung.com>
Subject: [PATCH] drm/exynos: remove unnecessary runtime pm interfaces
Date: Thu, 17 Apr 2014 14:52:20 +0900
Message-ID: <1397713940-25838-1-git-send-email-inki.dae@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: airlied@linux.ie, dri-devel@lists.freedesktop.org
Cc: linux-samsung-soc@vger.kernel.org, sw0312.kim@samsung.com, a.hajda@samsung.com, kyungmin.park@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

Exyno drm driver has no real hardware device, and
runtime pm operation should be done by sub drivers.

Signed-off-by: Inki Dae <inki.dae@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_drv.c |   29 -----------------------------
 1 file changed, 29 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/gpu/drm/exynos/exynos_drm_drv.c
index 6fa6f07..ab8ffbb 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
@@ -378,34 +378,8 @@ static int exynos_drm_sys_resume(struct device *dev)
 }
 #endif
 
-#ifdef CONFIG_PM_RUNTIME
-static int exynos_drm_runtime_suspend(struct device *dev)
-{
-	struct drm_device *drm_dev = dev_get_drvdata(dev);
-	pm_message_t message;
-
-	if (pm_runtime_suspended(dev))
-		return 0;
-
-	message.event = PM_EVENT_SUSPEND;
-	return exynos_drm_suspend(drm_dev, message);
-}
-
-static int exynos_drm_runtime_resume(struct device *dev)
-{
-	struct drm_device *drm_dev = dev_get_drvdata(dev);
-
-	if (!pm_runtime_suspended(dev))
-		return 0;
-
-	return exynos_drm_resume(drm_dev);
-}
-#endif
-
 static const struct dev_pm_ops exynos_drm_pm_ops = {
 	SET_SYSTEM_SLEEP_PM_OPS(exynos_drm_sys_suspend, exynos_drm_sys_resume)
-	SET_RUNTIME_PM_OPS(exynos_drm_runtime_suspend,
-			exynos_drm_runtime_resume, NULL)
 };
 
 int exynos_drm_component_add(struct device *dev,
@@ -488,9 +462,6 @@ static int exynos_drm_add_components(struct device *dev, struct master *m)
 
 static int exynos_drm_bind(struct device *dev)
 {
-	pm_runtime_enable(dev);
-	pm_runtime_get_sync(dev);
-
 	return drm_platform_init(&exynos_drm_driver, to_platform_device(dev));
 }
 
-- 
1.7.9.5
