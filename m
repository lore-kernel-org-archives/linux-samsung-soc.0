From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH] drm/exynos: use drm core to handle page-flip event
Date: Fri, 23 Sep 2016 15:21:38 +0200
Message-ID: <1474636898-11853-1-git-send-email-a.hajda@samsung.com>
References: <CGME20160923132141eucas1p28da217dacbb02efaecfad3246bd05590@eucas1p2.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:12691 "EHLO
        mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1757839AbcIWNVq (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 23 Sep 2016 09:21:46 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0ODY00D2CL474RB0@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 23 Sep 2016 14:21:43 +0100 (BST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, Daniel Vetter <daniel.vetter@ffwll.ch>, Andrzej Hajda <a.hajda@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>

Exynos DRM framework handled page-flip event with custom code.
The patch replaces it with drm-core vblank queue.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
Hi Inki,

This patch is next step of vblank re-factoring in Exynos-DRM.
I have tested the code on fimd, vidi, decon5433, mixer.
I hope I have not introduced bugs.

Regards
Andrzej
---
 drivers/gpu/drm/exynos/exynos5433_drm_decon.c | 11 -------
 drivers/gpu/drm/exynos/exynos7_drm_decon.c    |  9 ------
 drivers/gpu/drm/exynos/exynos_drm_crtc.c      | 42 +++++++++++++--------------
 drivers/gpu/drm/exynos/exynos_drm_drv.h       |  2 --
 drivers/gpu/drm/exynos/exynos_drm_fimd.c      | 15 +---------
 drivers/gpu/drm/exynos/exynos_drm_plane.c     |  1 -
 drivers/gpu/drm/exynos/exynos_drm_vidi.c      | 10 -------
 drivers/gpu/drm/exynos/exynos_mixer.c         |  9 ------
 8 files changed, 21 insertions(+), 78 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
index ac21b40..6ca1f31 100644
--- a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
+++ b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
@@ -551,7 +551,6 @@ static irqreturn_t decon_irq_handler(int irq, void *dev_id)
 {
 	struct decon_context *ctx = dev_id;
 	u32 val;
-	int win;
 
 	if (!test_bit(BIT_CLKS_ENABLED, &ctx->flags))
 		goto out;
@@ -560,16 +559,6 @@ static irqreturn_t decon_irq_handler(int irq, void *dev_id)
 	val &= VIDINTCON1_INTFRMDONEPEND | VIDINTCON1_INTFRMPEND;
 
 	if (val) {
-		for (win = ctx->first_win; win < WINDOWS_NR ; win++) {
-			struct exynos_drm_plane *plane = &ctx->planes[win];
-
-			if (!plane->pending_fb)
-				continue;
-
-			exynos_drm_crtc_finish_update(ctx->crtc, plane);
-		}
-
-		/* clear */
 		writel(val, ctx->addr + DECON_VIDINTCON1);
 		drm_crtc_handle_vblank(&ctx->crtc->base);
 	}
diff --git a/drivers/gpu/drm/exynos/exynos7_drm_decon.c b/drivers/gpu/drm/exynos/exynos7_drm_decon.c
index 7f9901b..f4d5a21 100644
--- a/drivers/gpu/drm/exynos/exynos7_drm_decon.c
+++ b/drivers/gpu/drm/exynos/exynos7_drm_decon.c
@@ -603,7 +603,6 @@ static irqreturn_t decon_irq_handler(int irq, void *dev_id)
 {
 	struct decon_context *ctx = (struct decon_context *)dev_id;
 	u32 val, clear_bit;
-	int win;
 
 	val = readl(ctx->regs + VIDINTCON1);
 
@@ -617,14 +616,6 @@ static irqreturn_t decon_irq_handler(int irq, void *dev_id)
 
 	if (!ctx->i80_if) {
 		drm_crtc_handle_vblank(&ctx->crtc->base);
-		for (win = 0 ; win < WINDOWS_NR ; win++) {
-			struct exynos_drm_plane *plane = &ctx->planes[win];
-
-			if (!plane->pending_fb)
-				continue;
-
-			exynos_drm_crtc_finish_update(ctx->crtc, plane);
-		}
 
 		/* set wait vsync event to zero and wake up queue. */
 		if (atomic_read(&ctx->wait_vsync_event)) {
diff --git a/drivers/gpu/drm/exynos/exynos_drm_crtc.c b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
index 5b6845b..2530bf5 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_crtc.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
@@ -69,8 +69,6 @@ static void exynos_crtc_atomic_begin(struct drm_crtc *crtc,
 {
 	struct exynos_drm_crtc *exynos_crtc = to_exynos_crtc(crtc);
 
-	exynos_crtc->event = crtc->state->event;
-
 	if (exynos_crtc->ops->atomic_begin)
 		exynos_crtc->ops->atomic_begin(exynos_crtc);
 }
@@ -79,9 +77,24 @@ static void exynos_crtc_atomic_flush(struct drm_crtc *crtc,
 				     struct drm_crtc_state *old_crtc_state)
 {
 	struct exynos_drm_crtc *exynos_crtc = to_exynos_crtc(crtc);
+	struct drm_pending_vblank_event *event;
+	unsigned long flags;
 
 	if (exynos_crtc->ops->atomic_flush)
 		exynos_crtc->ops->atomic_flush(exynos_crtc);
+
+	event = crtc->state->event;
+	if (event) {
+		crtc->state->event = NULL;
+
+		spin_lock_irqsave(&crtc->dev->event_lock, flags);
+		if (drm_crtc_vblank_get(crtc) == 0)
+			drm_crtc_arm_vblank_event(crtc, event);
+		else
+			drm_crtc_send_vblank_event(crtc, event);
+		spin_unlock_irqrestore(&crtc->dev->event_lock, flags);
+	}
+
 }
 
 static const struct drm_crtc_helper_funcs exynos_crtc_helper_funcs = {
@@ -173,22 +186,6 @@ void exynos_drm_crtc_disable_vblank(struct drm_device *dev, unsigned int pipe)
 		exynos_crtc->ops->disable_vblank(exynos_crtc);
 }
 
-void exynos_drm_crtc_finish_update(struct exynos_drm_crtc *exynos_crtc,
-				struct exynos_drm_plane *exynos_plane)
-{
-	struct drm_crtc *crtc = &exynos_crtc->base;
-	unsigned long flags;
-
-	exynos_plane->pending_fb = NULL;
-
-	spin_lock_irqsave(&crtc->dev->event_lock, flags);
-	if (exynos_crtc->event)
-		drm_crtc_send_vblank_event(crtc, exynos_crtc->event);
-
-	exynos_crtc->event = NULL;
-	spin_unlock_irqrestore(&crtc->dev->event_lock, flags);
-}
-
 int exynos_drm_crtc_get_pipe_from_type(struct drm_device *drm_dev,
 				       enum exynos_drm_output_type out_type)
 {
@@ -216,18 +213,19 @@ void exynos_drm_crtc_te_handler(struct drm_crtc *crtc)
 void exynos_drm_crtc_cancel_page_flip(struct drm_crtc *crtc,
 					struct drm_file *file)
 {
-	struct exynos_drm_crtc *exynos_crtc = to_exynos_crtc(crtc);
 	struct drm_pending_vblank_event *e;
 	unsigned long flags;
 
 	spin_lock_irqsave(&crtc->dev->event_lock, flags);
 
-	e = exynos_crtc->event;
+	e = crtc->state->event;
 	if (e && e->base.file_priv == file)
-		exynos_crtc->event = NULL;
+		crtc->state->event = NULL;
+	else
+		e = NULL;
 
 	spin_unlock_irqrestore(&crtc->dev->event_lock, flags);
 
-	if (e && e->base.file_priv == file)
+	if (e)
 		drm_event_cancel_free(crtc->dev, &e->base);
 }
diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.h b/drivers/gpu/drm/exynos/exynos_drm_drv.h
index cee3a4c..d215149 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.h
@@ -86,7 +86,6 @@ struct exynos_drm_plane {
 	struct drm_plane base;
 	const struct exynos_drm_plane_config *config;
 	unsigned int index;
-	struct drm_framebuffer *pending_fb;
 };
 
 #define EXYNOS_DRM_PLANE_CAP_DOUBLE	(1 << 0)
@@ -172,7 +171,6 @@ struct exynos_drm_crtc {
 	struct drm_crtc			base;
 	enum exynos_drm_output_type	type;
 	unsigned int			pipe;
-	struct drm_pending_vblank_event	*event;
 	const struct exynos_drm_crtc_ops	*ops;
 	void				*ctx;
 	struct exynos_drm_clk		*pipe_clk;
diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
index 0e74999..343d7c5 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
@@ -962,8 +962,7 @@ static const struct exynos_drm_crtc_ops fimd_crtc_ops = {
 static irqreturn_t fimd_irq_handler(int irq, void *dev_id)
 {
 	struct fimd_context *ctx = (struct fimd_context *)dev_id;
-	u32 val, clear_bit, start, start_s;
-	int win;
+	u32 val, clear_bit;
 
 	val = readl(ctx->regs + VIDINTCON1);
 
@@ -978,18 +977,6 @@ static irqreturn_t fimd_irq_handler(int irq, void *dev_id)
 	if (!ctx->i80_if)
 		drm_crtc_handle_vblank(&ctx->crtc->base);
 
-	for (win = 0 ; win < WINDOWS_NR ; win++) {
-		struct exynos_drm_plane *plane = &ctx->planes[win];
-
-		if (!plane->pending_fb)
-			continue;
-
-		start = readl(ctx->regs + VIDWx_BUF_START(win, 0));
-		start_s = readl(ctx->regs + VIDWx_BUF_START_S(win, 0));
-		if (start == start_s)
-			exynos_drm_crtc_finish_update(ctx->crtc, plane);
-	}
-
 	if (ctx->i80_if) {
 		/* Exits triggering mode */
 		atomic_set(&ctx->triggering, 0);
diff --git a/drivers/gpu/drm/exynos/exynos_drm_plane.c b/drivers/gpu/drm/exynos/exynos_drm_plane.c
index 7f32419..c2f17f3 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_plane.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_plane.c
@@ -238,7 +238,6 @@ static void exynos_plane_atomic_update(struct drm_plane *plane,
 		return;
 
 	plane->crtc = state->crtc;
-	exynos_plane->pending_fb = state->fb;
 
 	if (exynos_crtc->ops->update_plane)
 		exynos_crtc->ops->update_plane(exynos_crtc, exynos_plane);
diff --git a/drivers/gpu/drm/exynos/exynos_drm_vidi.c b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
index a91dad6..57fe514 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_vidi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
@@ -175,7 +175,6 @@ static const struct exynos_drm_crtc_ops vidi_crtc_ops = {
 static void vidi_fake_vblank_timer(unsigned long arg)
 {
 	struct vidi_context *ctx = (void *)arg;
-	int win;
 
 	if (ctx->pipe < 0)
 		return;
@@ -183,15 +182,6 @@ static void vidi_fake_vblank_timer(unsigned long arg)
 	if (drm_crtc_handle_vblank(&ctx->crtc->base))
 		mod_timer(&ctx->timer,
 			jiffies + msecs_to_jiffies(VIDI_REFRESH_TIME) - 1);
-
-	for (win = 0 ; win < WINDOWS_NR ; win++) {
-		struct exynos_drm_plane *plane = &ctx->planes[win];
-
-		if (!plane->pending_fb)
-			continue;
-
-		exynos_drm_crtc_finish_update(ctx->crtc, plane);
-	}
 }
 
 static ssize_t vidi_show_connection(struct device *dev,
diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exynos/exynos_mixer.c
index e1d47f9..6b7a633 100644
--- a/drivers/gpu/drm/exynos/exynos_mixer.c
+++ b/drivers/gpu/drm/exynos/exynos_mixer.c
@@ -753,7 +753,6 @@ static irqreturn_t mixer_irq_handler(int irq, void *arg)
 	struct mixer_context *ctx = arg;
 	struct mixer_resources *res = &ctx->mixer_res;
 	u32 val, base, shadow;
-	int win;
 
 	spin_lock(&res->reg_slock);
 
@@ -780,14 +779,6 @@ static irqreturn_t mixer_irq_handler(int irq, void *arg)
 		}
 
 		drm_crtc_handle_vblank(&ctx->crtc->base);
-		for (win = 0 ; win < MIXER_WIN_NR ; win++) {
-			struct exynos_drm_plane *plane = &ctx->planes[win];
-
-			if (!plane->pending_fb)
-				continue;
-
-			exynos_drm_crtc_finish_update(ctx->crtc, plane);
-		}
 	}
 
 out:
-- 
2.7.4
