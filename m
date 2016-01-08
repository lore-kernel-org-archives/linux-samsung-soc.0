From: Inki Dae <inki.dae@samsung.com>
Subject: [PATCH v3] drm/exynos: fix kernel panic issue at drm releasing
Date: Fri, 08 Jan 2016 17:46:00 +0900
Message-ID: <1452242760-20298-2-git-send-email-inki.dae@samsung.com>
References: <1452242760-20298-1-git-send-email-inki.dae@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:56474 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754221AbcAHIqG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 8 Jan 2016 03:46:06 -0500
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0O0M029UBLORM000@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 08 Jan 2016 17:46:03 +0900 (KST)
In-reply-to: <1452242760-20298-1-git-send-email-inki.dae@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org
Cc: linux-samsung-soc@vger.kernel.org, Inki Dae <inki.dae@samsung.com>

This patch fixes a kernel panic issue which happened
when drm driver is closed while modetest.

This issue could be reproduced easily by launching modetest
with page flip repeatedly.

The reason is that invalid drm_file object could be accessed by
send_vblank_event function when finishing page flip if the drm_file
object was removed by drm_release and there was a pended page
flip event which was already committed to hardware.

So this patch makes the pended page flip event to be cancelled by
preclose callback which is called at front of drm_release function.

Changelog v2:
- free vblank event objects belonging to the request process,
  increment event space and decrease pending_update when cancelling
  the event

Changelog v3:
- initialize only device specific things. Each page flip event object
  is created by DRM core so DRM core should release the object including
  incrementing event space.

Signed-off-by: Inki Dae <inki.dae@samsung.com>
Reviewed-by: Daniel Stone <daniels@collabora.com>
---
 drivers/gpu/drm/exynos/exynos_drm_crtc.c | 15 +++++++++++++++
 drivers/gpu/drm/exynos/exynos_drm_crtc.h |  3 +++
 drivers/gpu/drm/exynos/exynos_drm_drv.c  |  5 +++++
 3 files changed, 23 insertions(+)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_crtc.c b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
index cd94981..8b503a0 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_crtc.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
@@ -226,3 +226,18 @@ void exynos_drm_crtc_te_handler(struct drm_crtc *crtc)
 	if (exynos_crtc->ops->te_handler)
 		exynos_crtc->ops->te_handler(exynos_crtc);
 }
+
+void exynos_drm_crtc_cancel_page_flip(struct drm_crtc *crtc)
+{
+	struct exynos_drm_crtc *exynos_crtc = to_exynos_crtc(crtc);
+	struct drm_pending_vblank_event *e;
+	unsigned long flags;
+
+	spin_lock_irqsave(&crtc->dev->event_lock, flags);
+	e = exynos_crtc->event;
+	if (e) {
+		exynos_crtc->event = NULL;
+		atomic_dec(&exynos_crtc->pending_update);
+	}
+	spin_unlock_irqrestore(&crtc->dev->event_lock, flags);
+}
diff --git a/drivers/gpu/drm/exynos/exynos_drm_crtc.h b/drivers/gpu/drm/exynos/exynos_drm_crtc.h
index 6a581a8..b4def6e 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_crtc.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_crtc.h
@@ -40,4 +40,7 @@ int exynos_drm_crtc_get_pipe_from_type(struct drm_device *drm_dev,
  */
 void exynos_drm_crtc_te_handler(struct drm_crtc *crtc);
 
+/* This function cancels a page flip request. */
+void exynos_drm_crtc_cancel_page_flip(struct drm_crtc *crtc);
+
 #endif
diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/gpu/drm/exynos/exynos_drm_drv.c
index 9756797a..57c0e7d 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
@@ -330,7 +330,12 @@ err_file_priv_free:
 static void exynos_drm_preclose(struct drm_device *dev,
 					struct drm_file *file)
 {
+	struct drm_crtc *crtc;
+
 	exynos_drm_subdrv_close(dev, file);
+
+	list_for_each_entry(crtc, &dev->mode_config.crtc_list, head)
+		exynos_drm_crtc_cancel_page_flip(crtc);
 }
 
 static void exynos_drm_postclose(struct drm_device *dev, struct drm_file *file)
-- 
1.9.1
