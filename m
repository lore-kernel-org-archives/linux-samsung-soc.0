From: Gustavo Padovan <gustavo@padovan.org>
Subject: [PATCH v2 10/11] drm/exynos: remove wait queue for pending page flip
Date: Wed, 26 Aug 2015 14:43:27 -0300
Message-ID: <1440611008-3473-12-git-send-email-gustavo@padovan.org>
References: <1440611008-3473-1-git-send-email-gustavo@padovan.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qg0-f48.google.com ([209.85.192.48]:36233 "EHLO
	mail-qg0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752307AbbHZRoD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 26 Aug 2015 13:44:03 -0400
Received: by qgeb6 with SMTP id b6so130896016qge.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 26 Aug 2015 10:44:02 -0700 (PDT)
In-Reply-To: <1440611008-3473-1-git-send-email-gustavo@padovan.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, inki.dae@samsung.com, jy0922.shim@samsung.com, tjakobi@math.uni-bielefeld.de, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>

Exynos atomic commit procedures already does this job of waiting for
pending updates to finish, that means using pending_flip_queue is
pointless now because the disable CRTC procedure will never happen
during a page_flip.

Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
---
 drivers/gpu/drm/exynos/exynos_drm_crtc.c | 11 +----------
 drivers/gpu/drm/exynos/exynos_drm_drv.h  |  1 -
 2 files changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_crtc.c b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
index d6c2c3f..0872aa2f 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_crtc.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
@@ -35,11 +35,6 @@ static void exynos_drm_crtc_disable(struct drm_crtc *crtc)
 {
 	struct exynos_drm_crtc *exynos_crtc = to_exynos_crtc(crtc);
 
-	/* wait for the completion of page flip. */
-	if (!wait_event_timeout(exynos_crtc->pending_flip_queue,
-				(exynos_crtc->event == NULL), HZ/20))
-		exynos_crtc->event = NULL;
-
 	drm_crtc_vblank_off(crtc);
 
 	if (exynos_crtc->ops->disable)
@@ -146,8 +141,6 @@ struct exynos_drm_crtc *exynos_drm_crtc_create(struct drm_device *drm_dev,
 	if (!exynos_crtc)
 		return ERR_PTR(-ENOMEM);
 
-	init_waitqueue_head(&exynos_crtc->pending_flip_queue);
-
 	exynos_crtc->pipe = pipe;
 	exynos_crtc->type = type;
 	exynos_crtc->ops = ops;
@@ -215,10 +208,8 @@ void exynos_drm_crtc_finish_update(struct exynos_drm_crtc *exynos_crtc,
 		wake_up(&exynos_crtc->wait_update);
 
 	spin_lock_irqsave(&crtc->dev->event_lock, flags);
-	if (exynos_crtc->event) {
+	if (exynos_crtc->event)
 		drm_crtc_send_vblank_event(crtc, exynos_crtc->event);
-		wake_up(&exynos_crtc->pending_flip_queue);
-	}
 
 	exynos_crtc->event = NULL;
 	spin_unlock_irqrestore(&crtc->dev->event_lock, flags);
diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.h b/drivers/gpu/drm/exynos/exynos_drm_drv.h
index 7193d94..b7ba21d 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.h
@@ -145,7 +145,6 @@ struct exynos_drm_crtc {
 	struct drm_crtc			base;
 	enum exynos_drm_output_type	type;
 	unsigned int			pipe;
-	wait_queue_head_t		pending_flip_queue;
 	struct drm_pending_vblank_event	*event;
 	wait_queue_head_t		wait_update;
 	atomic_t			pending_update;
-- 
2.1.0
