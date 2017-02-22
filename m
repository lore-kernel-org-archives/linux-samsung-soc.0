From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 3/4] drm/exynos/decon5433: fix vblank event handling
Date: Wed, 22 Feb 2017 17:05:04 +0100
Message-ID: <1487779505-4062-4-git-send-email-a.hajda@samsung.com>
References: <1487779505-4062-1-git-send-email-a.hajda@samsung.com>
 <CGME20170222160516eucas1p102bcb93b7f0356cfafbb707987b9e85f@eucas1p1.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:63980 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754749AbdBVQFV (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 22 Feb 2017 11:05:21 -0500
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OLS00BVTA0URD80@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 22 Feb 2017 16:05:18 +0000 (GMT)
In-reply-to: <1487779505-4062-1-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: Andrzej Hajda <a.hajda@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>

Current implementation of event handling assumes that vblank interrupt is
always called at the right time. It is not true, it can be delayed due to
various reasons. As a result different races can happen. The patch fixes
the issue by using hardware frame counter present in DECON to serialize
vblank and commit completion events.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 drivers/gpu/drm/exynos/exynos5433_drm_decon.c | 62 +++++++++++++++++++++++++--
 include/video/exynos5433_decon.h              |  9 ++++
 2 files changed, 67 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
index 147911e..bfa9396 100644
--- a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
+++ b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
@@ -68,6 +68,8 @@ struct decon_context {
 	unsigned long			flags;
 	unsigned long			out_type;
 	int				first_win;
+	spinlock_t			vblank_lock;
+	u32				frame_id;
 };
 
 static const uint32_t decon_formats[] = {
@@ -365,25 +367,32 @@ static void decon_disable_plane(struct exynos_drm_crtc *crtc,
 static void decon_atomic_flush(struct exynos_drm_crtc *crtc)
 {
 	struct decon_context *ctx = crtc->ctx;
+	unsigned long flags;
 	int i;
 
 	if (test_bit(BIT_SUSPENDED, &ctx->flags))
 		return;
 
+	spin_lock_irqsave(&ctx->vblank_lock, flags);
+
 	for (i = ctx->first_win; i < WINDOWS_NR; i++)
 		decon_shadow_protect_win(ctx, i, false);
 
+	if (ctx->out_type & IFTYPE_I80)
+		set_bit(BIT_WIN_UPDATED, &ctx->flags);
+
 	if (test_and_clear_bit(BIT_REQUEST_UPDATE, &ctx->flags))
 		decon_set_bits(ctx, DECON_UPDATE, STANDALONE_UPDATE_F, ~0);
 
-	if (ctx->out_type & IFTYPE_I80)
-		set_bit(BIT_WIN_UPDATED, &ctx->flags);
-	exynos_crtc_handle_event(crtc);
+	exynos_crtc_handle_event(ctx->crtc);
+
+	spin_unlock_irqrestore(&ctx->vblank_lock, flags);
 }
 
 static void decon_swreset(struct decon_context *ctx)
 {
 	unsigned int tries;
+	unsigned long flags;
 
 	writel(0, ctx->addr + DECON_VIDCON0);
 	for (tries = 2000; tries; --tries) {
@@ -401,6 +410,10 @@ static void decon_swreset(struct decon_context *ctx)
 
 	WARN(tries == 0, "failed to software reset DECON\n");
 
+	spin_lock_irqsave(&ctx->vblank_lock, flags);
+	ctx->frame_id = 0;
+	spin_unlock_irqrestore(&ctx->vblank_lock, flags);
+
 	if (!(ctx->out_type & IFTYPE_HDMI))
 		return;
 
@@ -579,6 +592,46 @@ static const struct component_ops decon_component_ops = {
 	.unbind = decon_unbind,
 };
 
+static void decon_handle_vblank(struct decon_context *ctx)
+{
+	u32 frm, pfrm, status, cnt;
+
+	spin_lock(&ctx->vblank_lock);
+
+	/* To get consistent result repeat read until frame id is stable. */
+	frm = readl(ctx->addr + DECON_CRFMID);
+	cnt = 3;
+	do {
+		status = readl(ctx->addr + DECON_VIDCON1);
+		pfrm = frm;
+		frm = readl(ctx->addr + DECON_CRFMID);
+	} while (frm != pfrm && --cnt);
+
+	status &= VIDCON1_VSTATUS_MASK | VIDCON1_I80_ACTIVE;
+
+	/* In case of delayed vblank CRFMID could be already incremented,
+	 * it should be taken into account.
+	 */
+	if (frm > 0)
+		switch (status) {
+		case VIDCON1_VSTATUS_VS:
+			if (ctx->out_type & IFTYPE_I80)
+				break;
+		case VIDCON1_I80_ACTIVE:
+		case VIDCON1_VSTATUS_BP:
+		case VIDCON1_VSTATUS_AC:
+			--frm;
+		}
+
+	if (frm != ctx->frame_id) {
+		if (frm > ctx->frame_id)
+			drm_crtc_handle_vblank(&ctx->crtc->base);
+		ctx->frame_id = frm;
+	}
+
+	spin_unlock(&ctx->vblank_lock);
+}
+
 static irqreturn_t decon_irq_handler(int irq, void *dev_id)
 {
 	struct decon_context *ctx = dev_id;
@@ -599,7 +652,7 @@ static irqreturn_t decon_irq_handler(int irq, void *dev_id)
 			    (VIDOUT_INTERLACE_EN_F | VIDOUT_INTERLACE_FIELD_F))
 				return IRQ_HANDLED;
 		}
-		drm_crtc_handle_vblank(&ctx->crtc->base);
+		decon_handle_vblank(ctx);
 	}
 
 out:
@@ -672,6 +725,7 @@ static int exynos5433_decon_probe(struct platform_device *pdev)
 	__set_bit(BIT_SUSPENDED, &ctx->flags);
 	ctx->dev = dev;
 	ctx->out_type = (unsigned long)of_device_get_match_data(dev);
+	spin_lock_init(&ctx->vblank_lock);
 
 	if (ctx->out_type & IFTYPE_HDMI) {
 		ctx->first_win = 1;
diff --git a/include/video/exynos5433_decon.h b/include/video/exynos5433_decon.h
index ef8e2a8..beefc62 100644
--- a/include/video/exynos5433_decon.h
+++ b/include/video/exynos5433_decon.h
@@ -46,6 +46,8 @@
 #define DECON_FRAMEFIFO_STATUS		0x0524
 #define DECON_CMU			0x1404
 #define DECON_UPDATE			0x1410
+#define DECON_CRFMID			0x1414
+#define DECON_RRFRMID			0x1418
 #define DECON_UPDATE_SCHEME		0x1438
 #define DECON_VIDCON1			0x2000
 #define DECON_VIDCON2			0x2004
@@ -142,6 +144,13 @@
 #define STANDALONE_UPDATE_F		(1 << 0)
 
 /* DECON_VIDCON1 */
+#define VIDCON1_LINECNT_MASK		(0x0fff << 16)
+#define VIDCON1_I80_ACTIVE		(1 << 15)
+#define VIDCON1_VSTATUS_MASK		(0x3 << 13)
+#define VIDCON1_VSTATUS_VS		(0 << 13)
+#define VIDCON1_VSTATUS_BP		(1 << 13)
+#define VIDCON1_VSTATUS_AC		(2 << 13)
+#define VIDCON1_VSTATUS_FP		(3 << 13)
 #define VIDCON1_VCLK_MASK		(0x3 << 9)
 #define VIDCON1_VCLK_RUN_VDEN_DISABLE	(0x3 << 9)
 #define VIDCON1_VCLK_HOLD		(0x0 << 9)
-- 
2.7.4
