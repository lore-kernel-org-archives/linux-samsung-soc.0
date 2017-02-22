From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 1/4] drm/exynos: move crtc event handling to drivers callbacks
Date: Wed, 22 Feb 2017 17:05:02 +0100
Message-ID: <1487779505-4062-2-git-send-email-a.hajda@samsung.com>
References: <1487779505-4062-1-git-send-email-a.hajda@samsung.com>
 <CGME20170222160515eucas1p2ced846577ae3e435ffb2e17fa60fbd6e@eucas1p2.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:64767 "EHLO
        mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754685AbdBVQFU (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 22 Feb 2017 11:05:20 -0500
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OLS00KRNA0TPR80@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 22 Feb 2017 16:05:17 +0000 (GMT)
In-reply-to: <1487779505-4062-1-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: Andrzej Hajda <a.hajda@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>

CRTC event is currently send with next vblank, or instantly in case crtc
is being disabled. This approach usually works, but in corner cases it can
result in premature event generation. Only device driver is able to verify
if the event can be sent. This patch is a first step in that direction - it
moves event handling to the drivers.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 drivers/gpu/drm/exynos/exynos5433_drm_decon.c |  1 +
 drivers/gpu/drm/exynos/exynos7_drm_decon.c    |  1 +
 drivers/gpu/drm/exynos/exynos_drm_crtc.c      | 29 +++++++++++++++------------
 drivers/gpu/drm/exynos/exynos_drm_crtc.h      |  2 ++
 drivers/gpu/drm/exynos/exynos_drm_fimd.c      |  2 ++
 drivers/gpu/drm/exynos/exynos_drm_vidi.c      |  1 +
 drivers/gpu/drm/exynos/exynos_mixer.c         |  1 +
 7 files changed, 24 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
index 0fd6f7a..147911e 100644
--- a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
+++ b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
@@ -378,6 +378,7 @@ static void decon_atomic_flush(struct exynos_drm_crtc *crtc)
 
 	if (ctx->out_type & IFTYPE_I80)
 		set_bit(BIT_WIN_UPDATED, &ctx->flags);
+	exynos_crtc_handle_event(crtc);
 }
 
 static void decon_swreset(struct decon_context *ctx)
diff --git a/drivers/gpu/drm/exynos/exynos7_drm_decon.c b/drivers/gpu/drm/exynos/exynos7_drm_decon.c
index f9ab19e..4881180 100644
--- a/drivers/gpu/drm/exynos/exynos7_drm_decon.c
+++ b/drivers/gpu/drm/exynos/exynos7_drm_decon.c
@@ -526,6 +526,7 @@ static void decon_atomic_flush(struct exynos_drm_crtc *crtc)
 
 	for (i = 0; i < WINDOWS_NR; i++)
 		decon_shadow_protect_win(ctx, i, false);
+	exynos_crtc_handle_event(crtc);
 }
 
 static void decon_init(struct decon_context *ctx)
diff --git a/drivers/gpu/drm/exynos/exynos_drm_crtc.c b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
index 5367b66..c65f450 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_crtc.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
@@ -85,16 +85,28 @@ static void exynos_crtc_atomic_flush(struct drm_crtc *crtc,
 				     struct drm_crtc_state *old_crtc_state)
 {
 	struct exynos_drm_crtc *exynos_crtc = to_exynos_crtc(crtc);
-	struct drm_pending_vblank_event *event;
-	unsigned long flags;
 
 	if (exynos_crtc->ops->atomic_flush)
 		exynos_crtc->ops->atomic_flush(exynos_crtc);
+}
+
+static const struct drm_crtc_helper_funcs exynos_crtc_helper_funcs = {
+	.enable		= exynos_drm_crtc_enable,
+	.disable	= exynos_drm_crtc_disable,
+	.mode_set_nofb	= exynos_drm_crtc_mode_set_nofb,
+	.atomic_check	= exynos_crtc_atomic_check,
+	.atomic_begin	= exynos_crtc_atomic_begin,
+	.atomic_flush	= exynos_crtc_atomic_flush,
+};
+
+void exynos_crtc_handle_event(struct exynos_drm_crtc *exynos_crtc)
+{
+	struct drm_crtc *crtc = &exynos_crtc->base;
+	struct drm_pending_vblank_event *event = crtc->state->event;
+	unsigned long flags;
 
-	event = crtc->state->event;
 	if (event) {
 		crtc->state->event = NULL;
-
 		spin_lock_irqsave(&crtc->dev->event_lock, flags);
 		if (drm_crtc_vblank_get(crtc) == 0)
 			drm_crtc_arm_vblank_event(crtc, event);
@@ -105,15 +117,6 @@ static void exynos_crtc_atomic_flush(struct drm_crtc *crtc,
 
 }
 
-static const struct drm_crtc_helper_funcs exynos_crtc_helper_funcs = {
-	.enable		= exynos_drm_crtc_enable,
-	.disable	= exynos_drm_crtc_disable,
-	.mode_set_nofb	= exynos_drm_crtc_mode_set_nofb,
-	.atomic_check	= exynos_crtc_atomic_check,
-	.atomic_begin	= exynos_crtc_atomic_begin,
-	.atomic_flush	= exynos_crtc_atomic_flush,
-};
-
 static void exynos_drm_crtc_destroy(struct drm_crtc *crtc)
 {
 	struct exynos_drm_crtc *exynos_crtc = to_exynos_crtc(crtc);
diff --git a/drivers/gpu/drm/exynos/exynos_drm_crtc.h b/drivers/gpu/drm/exynos/exynos_drm_crtc.h
index 6a581a8..abd5d6c 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_crtc.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_crtc.h
@@ -40,4 +40,6 @@ int exynos_drm_crtc_get_pipe_from_type(struct drm_device *drm_dev,
  */
 void exynos_drm_crtc_te_handler(struct drm_crtc *crtc);
 
+void exynos_crtc_handle_event(struct exynos_drm_crtc *exynos_crtc);
+
 #endif
diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
index a9fa444..69ebed0 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
@@ -723,6 +723,8 @@ static void fimd_atomic_flush(struct exynos_drm_crtc *crtc)
 
 	for (i = 0; i < WINDOWS_NR; i++)
 		fimd_shadow_protect_win(ctx, i, false);
+
+	exynos_crtc_handle_event(crtc);
 }
 
 static void fimd_update_plane(struct exynos_drm_crtc *crtc,
diff --git a/drivers/gpu/drm/exynos/exynos_drm_vidi.c b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
index 57fe514..5d9a62a 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_vidi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
@@ -170,6 +170,7 @@ static const struct exynos_drm_crtc_ops vidi_crtc_ops = {
 	.enable_vblank = vidi_enable_vblank,
 	.disable_vblank = vidi_disable_vblank,
 	.update_plane = vidi_update_plane,
+	.atomic_flush = exynos_crtc_handle_event,
 };
 
 static void vidi_fake_vblank_timer(unsigned long arg)
diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exynos/exynos_mixer.c
index 72143ac..25edb63 100644
--- a/drivers/gpu/drm/exynos/exynos_mixer.c
+++ b/drivers/gpu/drm/exynos/exynos_mixer.c
@@ -1012,6 +1012,7 @@ static void mixer_atomic_flush(struct exynos_drm_crtc *crtc)
 		return;
 
 	mixer_vsync_set_update(mixer_ctx, true);
+	exynos_crtc_handle_event(crtc);
 }
 
 static void mixer_enable(struct exynos_drm_crtc *crtc)
-- 
2.7.4
