From: Gustavo Padovan <gustavo@padovan.org>
Subject: [PATCH v9 09/18] drm/exynos: atomic phase 3: convert page flips
Date: Thu, 28 May 2015 18:42:47 -0300
Message-ID: <1432849376-12828-10-git-send-email-gustavo@padovan.org>
References: <1432849376-12828-1-git-send-email-gustavo@padovan.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vn0-f46.google.com ([209.85.216.46]:37477 "EHLO
	mail-vn0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754566AbbE1Vni (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 28 May 2015 17:43:38 -0400
Received: by vnbg190 with SMTP id g190so6374358vnb.4
        for <linux-samsung-soc@vger.kernel.org>; Thu, 28 May 2015 14:43:38 -0700 (PDT)
In-Reply-To: <1432849376-12828-1-git-send-email-gustavo@padovan.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, inki.dae@samsung.com, jy0922.shim@samsung.com, tjakobi@math.uni-bielefeld.de, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>

PageFlips now use the atomic helper to work through the atomic modesetting
API. Async page flips are not supported yet.

v2: Add .atomic_begin() step to handle the vblank part we removed from
exynos page_flip code.

Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
Reviewed-by: Joonyoung Shim <jy0922.shim@samsung.com>
Tested-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
---
 drivers/gpu/drm/exynos/exynos_drm_crtc.c | 79 +++++++-------------------------
 drivers/gpu/drm/exynos/exynos_drm_fb.c   |  9 +++-
 2 files changed, 25 insertions(+), 63 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_crtc.c b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
index dd1ee7f..a137799 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_crtc.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
@@ -101,75 +101,30 @@ static void exynos_drm_crtc_disable(struct drm_crtc *crtc)
 	}
 }
 
+static void exynos_crtc_atomic_begin(struct drm_crtc *crtc)
+{
+	struct exynos_drm_crtc *exynos_crtc = to_exynos_crtc(crtc);
+
+	if (crtc->state->event) {
+		WARN_ON(drm_crtc_vblank_get(crtc) != 0);
+		exynos_crtc->event = crtc->state->event;
+	}
+}
+
+static void exynos_crtc_atomic_flush(struct drm_crtc *crtc)
+{
+}
+
 static struct drm_crtc_helper_funcs exynos_crtc_helper_funcs = {
 	.dpms		= exynos_drm_crtc_dpms,
 	.commit		= exynos_drm_crtc_commit,
 	.mode_fixup	= exynos_drm_crtc_mode_fixup,
 	.mode_set_nofb	= exynos_drm_crtc_mode_set_nofb,
 	.disable	= exynos_drm_crtc_disable,
+	.atomic_begin	= exynos_crtc_atomic_begin,
+	.atomic_flush	= exynos_crtc_atomic_flush,
 };
 
-static int exynos_drm_crtc_page_flip(struct drm_crtc *crtc,
-				     struct drm_framebuffer *fb,
-				     struct drm_pending_vblank_event *event,
-				     uint32_t page_flip_flags)
-{
-	struct drm_device *dev = crtc->dev;
-	struct exynos_drm_crtc *exynos_crtc = to_exynos_crtc(crtc);
-	unsigned int crtc_w, crtc_h;
-	int ret;
-
-	/* when the page flip is requested, crtc's dpms should be on */
-	if (exynos_crtc->dpms > DRM_MODE_DPMS_ON) {
-		DRM_ERROR("failed page flip request.\n");
-		return -EINVAL;
-	}
-
-	if (!event)
-		return -EINVAL;
-
-	spin_lock_irq(&dev->event_lock);
-	if (exynos_crtc->event) {
-		ret = -EBUSY;
-		goto out;
-	}
-
-	ret = exynos_check_plane(crtc->primary, fb);
-	if (ret)
-		goto out;
-
-	ret = drm_vblank_get(dev, exynos_crtc->pipe);
-	if (ret) {
-		DRM_DEBUG("failed to acquire vblank counter\n");
-		goto out;
-	}
-
-	exynos_crtc->event = event;
-	spin_unlock_irq(&dev->event_lock);
-
-	/*
-	 * the pipe from user always is 0 so we can set pipe number
-	 * of current owner to event.
-	 */
-	event->pipe = exynos_crtc->pipe;
-
-	crtc->primary->fb = fb;
-	crtc_w = fb->width - crtc->x;
-	crtc_h = fb->height - crtc->y;
-	exynos_update_plane(crtc->primary, crtc, fb, 0, 0,
-			    crtc_w, crtc_h, crtc->x << 16, crtc->y << 16,
-			    crtc_w << 16, crtc_h << 16);
-
-	if (crtc->primary->state)
-		drm_atomic_set_fb_for_plane(crtc->primary->state, fb);
-
-	return 0;
-
-out:
-	spin_unlock_irq(&dev->event_lock);
-	return ret;
-}
-
 static void exynos_drm_crtc_destroy(struct drm_crtc *crtc)
 {
 	struct exynos_drm_crtc *exynos_crtc = to_exynos_crtc(crtc);
@@ -183,7 +138,7 @@ static void exynos_drm_crtc_destroy(struct drm_crtc *crtc)
 
 static struct drm_crtc_funcs exynos_crtc_funcs = {
 	.set_config	= drm_atomic_helper_set_config,
-	.page_flip	= exynos_drm_crtc_page_flip,
+	.page_flip	= drm_atomic_helper_page_flip,
 	.destroy	= exynos_drm_crtc_destroy,
 	.reset = drm_atomic_helper_crtc_reset,
 	.atomic_duplicate_state = drm_atomic_helper_crtc_duplicate_state,
diff --git a/drivers/gpu/drm/exynos/exynos_drm_fb.c b/drivers/gpu/drm/exynos/exynos_drm_fb.c
index 19c0642..05d229c 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fb.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fb.c
@@ -266,11 +266,18 @@ static void exynos_drm_output_poll_changed(struct drm_device *dev)
 		exynos_drm_fbdev_init(dev);
 }
 
+static int exynos_atomic_commit(struct drm_device *dev,
+				struct drm_atomic_state *state,
+				bool async)
+{
+	return drm_atomic_helper_commit(dev, state, false);
+}
+
 static const struct drm_mode_config_funcs exynos_drm_mode_config_funcs = {
 	.fb_create = exynos_user_fb_create,
 	.output_poll_changed = exynos_drm_output_poll_changed,
 	.atomic_check = drm_atomic_helper_check,
-	.atomic_commit = drm_atomic_helper_commit,
+	.atomic_commit = exynos_atomic_commit,
 };
 
 void exynos_drm_mode_config_init(struct drm_device *dev)
-- 
2.1.0
