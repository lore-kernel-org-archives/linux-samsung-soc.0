From: Inki Dae <inki.dae@samsung.com>
Subject: [PATCH] drm/exynos: do not free pended event at postclose callback
Date: Fri, 08 Jan 2016 17:45:59 +0900
Message-ID: <1452242760-20298-1-git-send-email-inki.dae@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:56474 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754124AbcAHIqF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 8 Jan 2016 03:46:05 -0500
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0O0M01WLWLOR3C30@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 08 Jan 2016 17:46:03 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org
Cc: linux-samsung-soc@vger.kernel.org, Inki Dae <inki.dae@samsung.com>

These events will be freed by drm_events_release of DRM core so
it doesn't need to free these events in SoC specific driver.
This patch removes relevant codes from Exynos DRM driver.

Signed-off-by: Inki Dae <inki.dae@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_drv.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/gpu/drm/exynos/exynos_drm_drv.c
index 57c0e7d..59041d7 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
@@ -340,20 +340,9 @@ static void exynos_drm_preclose(struct drm_device *dev,
 
 static void exynos_drm_postclose(struct drm_device *dev, struct drm_file *file)
 {
-	struct drm_pending_event *e, *et;
-	unsigned long flags;
-
 	if (!file->driver_priv)
 		return;
 
-	spin_lock_irqsave(&dev->event_lock, flags);
-	/* Release all events handled by page flip handler but not freed. */
-	list_for_each_entry_safe(e, et, &file->event_list, link) {
-		list_del(&e->link);
-		e->destroy(e);
-	}
-	spin_unlock_irqrestore(&dev->event_lock, flags);
-
 	kfree(file->driver_priv);
 	file->driver_priv = NULL;
 }
-- 
1.9.1
