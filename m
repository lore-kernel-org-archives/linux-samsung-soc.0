From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH] drm/exynos: simplify sleep PM ops
Date: Fri, 27 Nov 2015 15:32:45 +0100
Message-ID: <1448634765-19480-1-git-send-email-a.hajda@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:56282 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754013AbbK0Odh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 27 Nov 2015 09:33:37 -0500
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NYH0007F9RYBFC0@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 27 Nov 2015 14:33:34 +0000 (GMT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: inki.dae@samsung.com
Cc: Andrzej Hajda <a.hajda@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org

PM ops in exynos_drm_drv were split into two separate function as they were
used also by drm device. Since PM ops have been removed from drm device, the
functions can be merged together.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
Hi Inki,

This is the patch I have promised during our discussion about
PM callbcks in components.

Regards
Andrzej

 drivers/gpu/drm/exynos/exynos_drm_drv.c | 76 +++++++++++++--------------------
 1 file changed, 30 insertions(+), 46 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/gpu/drm/exynos/exynos_drm_drv.c
index 2c6019d..9756797a 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
@@ -304,45 +304,6 @@ int exynos_atomic_commit(struct drm_device *dev, struct drm_atomic_state *state,
 	return 0;
 }
 
-#ifdef CONFIG_PM_SLEEP
-static int exynos_drm_suspend(struct drm_device *dev, pm_message_t state)
-{
-	struct drm_connector *connector;
-
-	drm_modeset_lock_all(dev);
-	list_for_each_entry(connector, &dev->mode_config.connector_list, head) {
-		int old_dpms = connector->dpms;
-
-		if (connector->funcs->dpms)
-			connector->funcs->dpms(connector, DRM_MODE_DPMS_OFF);
-
-		/* Set the old mode back to the connector for resume */
-		connector->dpms = old_dpms;
-	}
-	drm_modeset_unlock_all(dev);
-
-	return 0;
-}
-
-static int exynos_drm_resume(struct drm_device *dev)
-{
-	struct drm_connector *connector;
-
-	drm_modeset_lock_all(dev);
-	list_for_each_entry(connector, &dev->mode_config.connector_list, head) {
-		if (connector->funcs->dpms) {
-			int dpms = connector->dpms;
-
-			connector->dpms = DRM_MODE_DPMS_OFF;
-			connector->funcs->dpms(connector, dpms);
-		}
-	}
-	drm_modeset_unlock_all(dev);
-
-	return 0;
-}
-#endif
-
 static int exynos_drm_open(struct drm_device *dev, struct drm_file *file)
 {
 	struct drm_exynos_file_private *file_priv;
@@ -476,31 +437,54 @@ static struct drm_driver exynos_drm_driver = {
 };
 
 #ifdef CONFIG_PM_SLEEP
-static int exynos_drm_sys_suspend(struct device *dev)
+static int exynos_drm_suspend(struct device *dev)
 {
 	struct drm_device *drm_dev = dev_get_drvdata(dev);
-	pm_message_t message;
+	struct drm_connector *connector;
 
 	if (pm_runtime_suspended(dev) || !drm_dev)
 		return 0;
 
-	message.event = PM_EVENT_SUSPEND;
-	return exynos_drm_suspend(drm_dev, message);
+	drm_modeset_lock_all(drm_dev);
+	drm_for_each_connector(connector, drm_dev) {
+		int old_dpms = connector->dpms;
+
+		if (connector->funcs->dpms)
+			connector->funcs->dpms(connector, DRM_MODE_DPMS_OFF);
+
+		/* Set the old mode back to the connector for resume */
+		connector->dpms = old_dpms;
+	}
+	drm_modeset_unlock_all(drm_dev);
+
+	return 0;
 }
 
-static int exynos_drm_sys_resume(struct device *dev)
+static int exynos_drm_resume(struct device *dev)
 {
 	struct drm_device *drm_dev = dev_get_drvdata(dev);
+	struct drm_connector *connector;
 
 	if (pm_runtime_suspended(dev) || !drm_dev)
 		return 0;
 
-	return exynos_drm_resume(drm_dev);
+	drm_modeset_lock_all(drm_dev);
+	drm_for_each_connector(connector, drm_dev) {
+		if (connector->funcs->dpms) {
+			int dpms = connector->dpms;
+
+			connector->dpms = DRM_MODE_DPMS_OFF;
+			connector->funcs->dpms(connector, dpms);
+		}
+	}
+	drm_modeset_unlock_all(drm_dev);
+
+	return 0;
 }
 #endif
 
 static const struct dev_pm_ops exynos_drm_pm_ops = {
-	SET_SYSTEM_SLEEP_PM_OPS(exynos_drm_sys_suspend, exynos_drm_sys_resume)
+	SET_SYSTEM_SLEEP_PM_OPS(exynos_drm_suspend, exynos_drm_resume)
 };
 
 /* forward declaration */
-- 
1.9.1
