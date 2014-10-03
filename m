From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH RFC 3/4] drm/exynos: remove master component PM callbacks
Date: Fri, 03 Oct 2014 10:24:12 +0200
Message-ID: <1412324653-30677-4-git-send-email-a.hajda@samsung.com>
References: <1412324653-30677-1-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <1412324653-30677-1-git-send-email-a.hajda@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
Cc: Kukjin Kim <kgene.kim@samsung.com>, "open list:INTEL DRM DRIVERS..." <intel-gfx@lists.freedesktop.org>, Seung-Woo Kim <sw0312.kim@samsung.com>, open list <linux-kernel@vger.kernel.org>, Andrzej Hajda <a.hajda@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, "moderated list:ARM/S5P EXYNOS AR..." <linux-samsung-soc@vger.kernel.org>, "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>, Daniel Vetter <daniel.vetter@intel.com>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

The patch removes master PM callbacks as their functionality
is already duplicated by suspend/resume drm callbacks.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_drv.c | 29 -----------------------------
 1 file changed, 29 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/gpu/drm/exynos/exynos_drm_drv.c
index cf19e60..dca20b15 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
@@ -342,34 +342,6 @@ static struct drm_driver exynos_drm_driver = {
 	.minor	= DRIVER_MINOR,
 };
 
-#ifdef CONFIG_PM_SLEEP
-static int exynos_drm_sys_suspend(struct device *dev)
-{
-	struct drm_device *drm_dev = dev_get_drvdata(dev);
-	pm_message_t message;
-
-	if (pm_runtime_suspended(dev) || !drm_dev)
-		return 0;
-
-	message.event = PM_EVENT_SUSPEND;
-	return exynos_drm_suspend(drm_dev, message);
-}
-
-static int exynos_drm_sys_resume(struct device *dev)
-{
-	struct drm_device *drm_dev = dev_get_drvdata(dev);
-
-	if (pm_runtime_suspended(dev) || !drm_dev)
-		return 0;
-
-	return exynos_drm_resume(drm_dev);
-}
-#endif
-
-static const struct dev_pm_ops exynos_drm_pm_ops = {
-	SET_SYSTEM_SLEEP_PM_OPS(exynos_drm_sys_suspend, exynos_drm_sys_resume)
-};
-
 int exynos_drm_component_add(struct device *dev,
 				enum exynos_drm_device_type dev_type,
 				enum exynos_drm_output_type out_type)
@@ -634,7 +606,6 @@ static struct platform_driver exynos_drm_platform_driver = {
 	.driver	= {
 		.owner	= THIS_MODULE,
 		.name	= "exynos-drm",
-		.pm	= &exynos_drm_pm_ops,
 	},
 };
 
-- 
1.9.1
