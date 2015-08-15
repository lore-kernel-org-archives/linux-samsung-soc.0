From: Gustavo Padovan <gustavo@padovan.org>
Subject: [PATCH 09/11] drm/exynos: wait all planes updates to finish
Date: Sat, 15 Aug 2015 13:26:18 -0300
Message-ID: <1439655980-32146-10-git-send-email-gustavo@padovan.org>
References: <1439655980-32146-1-git-send-email-gustavo@padovan.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yk0-f176.google.com ([209.85.160.176]:32988 "EHLO
	mail-yk0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753923AbbHOQ0t (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 15 Aug 2015 12:26:49 -0400
Received: by ykll84 with SMTP id l84so29599591ykl.0
        for <linux-samsung-soc@vger.kernel.org>; Sat, 15 Aug 2015 09:26:48 -0700 (PDT)
In-Reply-To: <1439655980-32146-1-git-send-email-gustavo@padovan.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, inki.dae@samsung.com, jy0922.shim@samsung.com, tjakobi@math.uni-bielefeld.de, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>

Add infrastructure to wait for all planes updates to finish by using
an atomic_t variable to track how many pending updates we are waiting
plus a wait_queue for the wait part.

It also changes vblank behaviour and keeps it enabled for all types
of updates

Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
---
 drivers/gpu/drm/exynos/exynos_drm_crtc.c | 18 +++++++++----
 drivers/gpu/drm/exynos/exynos_drm_crtc.h |  1 +
 drivers/gpu/drm/exynos/exynos_drm_drv.c  | 44 +++++++++++++++++++++++++++++++-
 drivers/gpu/drm/exynos/exynos_drm_drv.h  |  4 +++
 4 files changed, 61 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_crtc.c b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
index 7a2ad3e..049ab67 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_crtc.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
@@ -74,10 +74,7 @@ static void exynos_crtc_atomic_begin(struct drm_crtc *crtc)
 	struct exynos_drm_crtc *exynos_crtc = to_exynos_crtc(crtc);
 	struct drm_plane *plane;
 
-	if (crtc->state->event) {
-		WARN_ON(drm_crtc_vblank_get(crtc) != 0);
-		exynos_crtc->event = crtc->state->event;
-	}
+	exynos_crtc->event = crtc->state->event;
 
 	drm_atomic_crtc_for_each_plane(plane, crtc) {
 		struct exynos_drm_plane *exynos_plane = to_exynos_plane(plane);
@@ -154,6 +151,8 @@ struct exynos_drm_crtc *exynos_drm_crtc_create(struct drm_device *drm_dev,
 	exynos_crtc->ops = ops;
 	exynos_crtc->ctx = ctx;
 
+	init_waitqueue_head(&exynos_crtc->wait_update);
+
 	crtc = &exynos_crtc->base;
 
 	private->crtc[pipe] = crtc;
@@ -195,6 +194,13 @@ void exynos_drm_crtc_disable_vblank(struct drm_device *dev, int pipe)
 		exynos_crtc->ops->disable_vblank(exynos_crtc);
 }
 
+void exynos_drm_crtc_wait_pending_update(struct exynos_drm_crtc *exynos_crtc)
+{
+	wait_event_timeout(exynos_crtc->wait_update,
+			   (atomic_read(&exynos_crtc->pending_update) == 0),
+			   msecs_to_jiffies(50));
+}
+
 void exynos_drm_crtc_finish_update(struct exynos_drm_crtc *exynos_crtc,
 				struct exynos_drm_plane *exynos_plane)
 {
@@ -203,10 +209,12 @@ void exynos_drm_crtc_finish_update(struct exynos_drm_crtc *exynos_crtc,
 
 	exynos_plane->pending_fb = NULL;
 
+	if (atomic_dec_and_test(&exynos_crtc->pending_update))
+		wake_up(&exynos_crtc->wait_update);
+
 	spin_lock_irqsave(&crtc->dev->event_lock, flags);
 	if (exynos_crtc->event) {
 		drm_crtc_send_vblank_event(crtc, exynos_crtc->event);
-		drm_crtc_vblank_put(crtc);
 		wake_up(&exynos_crtc->pending_flip_queue);
 	}
 
diff --git a/drivers/gpu/drm/exynos/exynos_drm_crtc.h b/drivers/gpu/drm/exynos/exynos_drm_crtc.h
index 8bedfde..f87d4ab 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_crtc.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_crtc.h
@@ -25,6 +25,7 @@ struct exynos_drm_crtc *exynos_drm_crtc_create(struct drm_device *drm_dev,
 					void *context);
 int exynos_drm_crtc_enable_vblank(struct drm_device *dev, int pipe);
 void exynos_drm_crtc_disable_vblank(struct drm_device *dev, int pipe);
+void exynos_drm_crtc_wait_pending_update(struct exynos_drm_crtc *exynos_crtc);
 void exynos_drm_crtc_finish_update(struct exynos_drm_crtc *exynos_crtc,
 				   struct exynos_drm_plane *exynos_plane);
 void exynos_drm_crtc_complete_scanout(struct drm_framebuffer *fb);
diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/gpu/drm/exynos/exynos_drm_drv.c
index a4937b5..241453f 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
@@ -46,11 +46,37 @@ struct exynos_atomic_commit {
 	u32			crtcs;
 };
 
+static void exynos_atomic_wait_for_commit(struct drm_atomic_state *state)
+{
+	struct drm_crtc_state *crtc_state;
+	struct drm_crtc *crtc;
+	int i, ret;
+
+	for_each_crtc_in_state(state, crtc, crtc_state, i) {
+		struct exynos_drm_crtc *exynos_crtc = to_exynos_crtc(crtc);
+
+		if (!crtc->state->enable)
+			continue;
+
+		ret = drm_crtc_vblank_get(crtc);
+		if (ret)
+			continue;
+
+		exynos_drm_crtc_wait_pending_update(exynos_crtc);
+		drm_crtc_vblank_put(crtc);
+	}
+}
+
 static void exynos_atomic_commit_complete(struct exynos_atomic_commit *commit)
 {
 	struct drm_device *dev = commit->dev;
 	struct exynos_drm_private *priv = dev->dev_private;
 	struct drm_atomic_state *state = commit->state;
+	struct drm_plane *plane;
+	struct drm_crtc *crtc;
+	struct drm_plane_state *plane_state;
+	struct drm_crtc_state *crtc_state;
+	int i;
 
 	drm_atomic_helper_commit_modeset_disables(dev, state);
 
@@ -64,9 +90,25 @@ static void exynos_atomic_commit_complete(struct exynos_atomic_commit *commit)
 	 * have the relevant clocks enabled to perform the update.
 	 */
 
+	for_each_crtc_in_state(state, crtc, crtc_state, i) {
+		struct exynos_drm_crtc *exynos_crtc = to_exynos_crtc(crtc);
+
+		atomic_set(&exynos_crtc->pending_update, 0);
+	}
+
+	for_each_plane_in_state(state, plane, plane_state, i) {
+		struct exynos_drm_crtc *exynos_crtc =
+						to_exynos_crtc(plane->crtc);
+
+		if (!plane->crtc)
+			continue;
+
+		atomic_inc(&exynos_crtc->pending_update);
+	}
+
 	drm_atomic_helper_commit_planes(dev, state);
 
-	drm_atomic_helper_wait_for_vblanks(dev, state);
+	exynos_atomic_wait_for_commit(state);
 
 	drm_atomic_helper_cleanup_planes(dev, state);
 
diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.h b/drivers/gpu/drm/exynos/exynos_drm_drv.h
index 406b278..d77dca4 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.h
@@ -136,6 +136,8 @@ struct exynos_drm_crtc_ops {
  *	this pipe value.
  * @enabled: if the crtc is enabled or not
  * @event: vblank event that is currently queued for flip
+ * @wait_update: wait all pending planes updates to finish
+ * @pending_update: number of pending plane updates in this crtc
  * @ops: pointer to callbacks for exynos drm specific functionality
  * @ctx: A pointer to the crtc's implementation specific context
  */
@@ -145,6 +147,8 @@ struct exynos_drm_crtc {
 	unsigned int			pipe;
 	wait_queue_head_t		pending_flip_queue;
 	struct drm_pending_vblank_event	*event;
+	wait_queue_head_t		wait_update;
+	atomic_t			pending_update;
 	const struct exynos_drm_crtc_ops	*ops;
 	void				*ctx;
 };
-- 
2.1.0
