From: Gustavo Padovan <gustavo@padovan.org>
Subject: [PATCH 2/2] drm/exynos: use KMS version of DRM vblanks functions
Date: Thu, 18 Jun 2015 17:50:52 -0300
Message-ID: <1434660652-20367-2-git-send-email-gustavo@padovan.org>
References: <1434660652-20367-1-git-send-email-gustavo@padovan.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qc0-f178.google.com ([209.85.216.178]:34192 "EHLO
	mail-qc0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750752AbbFRUvE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 18 Jun 2015 16:51:04 -0400
Received: by qcwx2 with SMTP id x2so27910464qcw.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 18 Jun 2015 13:51:03 -0700 (PDT)
In-Reply-To: <1434660652-20367-1-git-send-email-gustavo@padovan.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, inki.dae@samsung.com, jy0922.shim@samsung.com, tjakobi@math.uni-bielefeld.de, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>

Get rid of legacy DRM vblank function that are less clear to use.
The new only basically requires only the crtc as paramenters.

It also clean ups exynos_drm_crtc_finish_pageflip() parameters as a
consequence.

Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
---
 drivers/gpu/drm/exynos/exynos7_drm_decon.c |  4 ++--
 drivers/gpu/drm/exynos/exynos_drm_crtc.c   | 14 ++++++--------
 drivers/gpu/drm/exynos/exynos_drm_crtc.h   |  2 +-
 drivers/gpu/drm/exynos/exynos_drm_fimd.c   |  8 ++++----
 drivers/gpu/drm/exynos/exynos_drm_vidi.c   |  4 ++--
 drivers/gpu/drm/exynos/exynos_mixer.c      |  4 ++--
 6 files changed, 17 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos7_drm_decon.c b/drivers/gpu/drm/exynos/exynos7_drm_decon.c
index 2b9221c..43c0ab7 100644
--- a/drivers/gpu/drm/exynos/exynos7_drm_decon.c
+++ b/drivers/gpu/drm/exynos/exynos7_drm_decon.c
@@ -652,8 +652,8 @@ static irqreturn_t decon_irq_handler(int irq, void *dev_id)
 		goto out;
 
 	if (!ctx->i80_if) {
-		drm_handle_vblank(ctx->drm_dev, ctx->pipe);
-		exynos_drm_crtc_finish_pageflip(ctx->drm_dev, ctx->pipe);
+		drm_crtc_handle_vblank(&ctx->crtc->base);
+		exynos_drm_crtc_finish_pageflip(ctx->crtc);
 
 		/* set wait vsync event to zero and wake up queue. */
 		if (atomic_read(&ctx->wait_vsync_event)) {
diff --git a/drivers/gpu/drm/exynos/exynos_drm_crtc.c b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
index 22b9ca0..e9c291f 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_crtc.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
@@ -193,24 +193,22 @@ void exynos_drm_crtc_disable_vblank(struct drm_device *dev, int pipe)
 		exynos_crtc->ops->disable_vblank(exynos_crtc);
 }
 
-void exynos_drm_crtc_finish_pageflip(struct drm_device *dev, int pipe)
+void exynos_drm_crtc_finish_pageflip(struct exynos_drm_crtc *exynos_crtc)
 {
-	struct exynos_drm_private *dev_priv = dev->dev_private;
-	struct drm_crtc *drm_crtc = dev_priv->crtc[pipe];
-	struct exynos_drm_crtc *exynos_crtc = to_exynos_crtc(drm_crtc);
+	struct drm_crtc *crtc = &exynos_crtc->base;
 	unsigned long flags;
 
-	spin_lock_irqsave(&dev->event_lock, flags);
+	spin_lock_irqsave(&crtc->dev->event_lock, flags);
 	if (exynos_crtc->event) {
 
-		drm_send_vblank_event(dev, pipe, exynos_crtc->event);
-		drm_vblank_put(dev, pipe);
+		drm_crtc_send_vblank_event(crtc, exynos_crtc->event);
+		drm_crtc_vblank_put(crtc);
 		wake_up(&exynos_crtc->pending_flip_queue);
 
 	}
 
 	exynos_crtc->event = NULL;
-	spin_unlock_irqrestore(&dev->event_lock, flags);
+	spin_unlock_irqrestore(&crtc->dev->event_lock, flags);
 }
 
 void exynos_drm_crtc_complete_scanout(struct drm_framebuffer *fb)
diff --git a/drivers/gpu/drm/exynos/exynos_drm_crtc.h b/drivers/gpu/drm/exynos/exynos_drm_crtc.h
index 0f3aa70..d01d49a 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_crtc.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_crtc.h
@@ -25,7 +25,7 @@ struct exynos_drm_crtc *exynos_drm_crtc_create(struct drm_device *drm_dev,
 					void *context);
 int exynos_drm_crtc_enable_vblank(struct drm_device *dev, int pipe);
 void exynos_drm_crtc_disable_vblank(struct drm_device *dev, int pipe);
-void exynos_drm_crtc_finish_pageflip(struct drm_device *dev, int pipe);
+void exynos_drm_crtc_finish_pageflip(struct exynos_drm_crtc *exynos_crtc);
 void exynos_drm_crtc_complete_scanout(struct drm_framebuffer *fb);
 
 /* This function gets pipe value to crtc device matched with out_type. */
diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
index 7ba348e..659976c 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
@@ -886,7 +886,7 @@ static void fimd_te_handler(struct exynos_drm_crtc *crtc)
 	}
 
 	if (test_bit(0, &ctx->irq_flags))
-		drm_handle_vblank(ctx->drm_dev, ctx->pipe);
+		drm_crtc_handle_vblank(&ctx->crtc->base);
 }
 
 static void fimd_dp_clock_enable(struct exynos_drm_crtc *crtc, bool enable)
@@ -936,13 +936,13 @@ static irqreturn_t fimd_irq_handler(int irq, void *dev_id)
 		goto out;
 
 	if (ctx->i80_if) {
-		exynos_drm_crtc_finish_pageflip(ctx->drm_dev, ctx->pipe);
+		exynos_drm_crtc_finish_pageflip(ctx->crtc);
 
 		/* Exits triggering mode */
 		atomic_set(&ctx->triggering, 0);
 	} else {
-		drm_handle_vblank(ctx->drm_dev, ctx->pipe);
-		exynos_drm_crtc_finish_pageflip(ctx->drm_dev, ctx->pipe);
+		drm_crtc_handle_vblank(&ctx->crtc->base);
+		exynos_drm_crtc_finish_pageflip(ctx->crtc);
 
 		/* set wait vsync event to zero and wake up queue. */
 		if (atomic_read(&ctx->wait_vsync_event)) {
diff --git a/drivers/gpu/drm/exynos/exynos_drm_vidi.c b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
index 4706d45..5f74d6c 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_vidi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
@@ -193,7 +193,7 @@ static void vidi_fake_vblank_handler(struct work_struct *work)
 	/* refresh rate is about 50Hz. */
 	usleep_range(16000, 20000);
 
-	drm_handle_vblank(ctx->drm_dev, ctx->pipe);
+	drm_crtc_handle_vblank(&ctx->crtc->base);
 
 	mutex_lock(&ctx->lock);
 
@@ -205,7 +205,7 @@ static void vidi_fake_vblank_handler(struct work_struct *work)
 
 	mutex_unlock(&ctx->lock);
 
-	exynos_drm_crtc_finish_pageflip(ctx->drm_dev, ctx->pipe);
+	exynos_drm_crtc_finish_pageflip(ctx->crtc);
 }
 
 static int vidi_show_connection(struct device *dev,
diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exynos/exynos_mixer.c
index f570687..bbcbcbc 100644
--- a/drivers/gpu/drm/exynos/exynos_mixer.c
+++ b/drivers/gpu/drm/exynos/exynos_mixer.c
@@ -731,8 +731,8 @@ static irqreturn_t mixer_irq_handler(int irq, void *arg)
 				goto out;
 		}
 
-		drm_handle_vblank(ctx->drm_dev, ctx->pipe);
-		exynos_drm_crtc_finish_pageflip(ctx->drm_dev, ctx->pipe);
+		drm_crtc_handle_vblank(&ctx->crtc->base);
+		exynos_drm_crtc_finish_pageflip(ctx->crtc);
 
 		/* set wait vsync event to zero and wake up queue. */
 		if (atomic_read(&ctx->wait_vsync_event)) {
-- 
2.1.0
