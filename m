From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 2/5] drm/exynos/decon5433: fix vblank event handling
Date: Tue, 14 Mar 2017 09:27:57 +0100
Message-ID: <1489480080-25633-3-git-send-email-a.hajda@samsung.com>
References: <1489480080-25633-1-git-send-email-a.hajda@samsung.com>
 <CGME20170314082811eucas1p108416d2ab30335f6644cec5d43c0b847@eucas1p1.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:56136 "EHLO
        mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751020AbdCNI2Q (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 14 Mar 2017 04:28:16 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OMS00GSNQ706H50@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 14 Mar 2017 08:28:12 +0000 (GMT)
In-reply-to: <1489480080-25633-1-git-send-email-a.hajda@samsung.com>
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
v3:
  - handle wrap-around of frame counter
v2:
  - added internal decon_get_frame_count function,
  - updated frame counter on flush,
  - misc style fixes (thank Inki)
---
 drivers/gpu/drm/exynos/exynos5433_drm_decon.c | 78 ++++++++++++++++++++++++++-
 include/video/exynos5433_decon.h              |  8 +++
 2 files changed, 85 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
index 2130ccf..cfe6f8a 100644
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
@@ -122,6 +124,48 @@ static void decon_disable_vblank(struct exynos_drm_crtc *crtc)
 		writel(0, ctx->addr + DECON_VIDINTCON0);
 }
 
+/* return number of starts/ends of frame transmissions since reset */
+static u32 decon_get_frame_count(struct decon_context *ctx, bool end)
+{
+	u32 frm, pfrm, status, cnt = 2;
+
+	/* To get consistent result repeat read until frame id is stable.
+	 * Usually the loop will be executed once, in rare cases when the loop
+	 * is executed at frame change time 2nd pass will be needed.
+	 */
+	frm = readl(ctx->addr + DECON_CRFMID);
+	do {
+		status = readl(ctx->addr + DECON_VIDCON1);
+		pfrm = frm;
+		frm = readl(ctx->addr + DECON_CRFMID);
+	} while (frm != pfrm && --cnt);
+
+	/* CRFMID is incremented on BPORCH in case of I80 and on VSYNC in case
+	 * of RGB, it should be taken into account.
+	 */
+	if (!frm)
+		return 0;
+
+	switch (status & (VIDCON1_VSTATUS_MASK | VIDCON1_I80_ACTIVE)) {
+	case VIDCON1_VSTATUS_VS:
+		if (!(ctx->out_type & IFTYPE_I80))
+			--frm;
+		break;
+	case VIDCON1_VSTATUS_BP:
+		--frm;
+		break;
+	case VIDCON1_I80_ACTIVE:
+	case VIDCON1_VSTATUS_AC:
+		if (end)
+			--frm;
+		break;
+	default:
+		break;
+	}
+
+	return frm;
+}
+
 static void decon_setup_trigger(struct decon_context *ctx)
 {
 	if (!(ctx->out_type & (IFTYPE_I80 | I80_HW_TRG)))
@@ -365,11 +409,14 @@ static void decon_disable_plane(struct exynos_drm_crtc *crtc,
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
 
@@ -378,12 +425,18 @@ static void decon_atomic_flush(struct exynos_drm_crtc *crtc)
 
 	if (ctx->out_type & IFTYPE_I80)
 		set_bit(BIT_WIN_UPDATED, &ctx->flags);
+
+	ctx->frame_id = decon_get_frame_count(ctx, true);
+
 	exynos_crtc_handle_event(crtc);
+
+	spin_unlock_irqrestore(&ctx->vblank_lock, flags);
 }
 
 static void decon_swreset(struct decon_context *ctx)
 {
 	unsigned int tries;
+	unsigned long flags;
 
 	writel(0, ctx->addr + DECON_VIDCON0);
 	for (tries = 2000; tries; --tries) {
@@ -401,6 +454,10 @@ static void decon_swreset(struct decon_context *ctx)
 
 	WARN(tries == 0, "failed to software reset DECON\n");
 
+	spin_lock_irqsave(&ctx->vblank_lock, flags);
+	ctx->frame_id = 0;
+	spin_unlock_irqrestore(&ctx->vblank_lock, flags);
+
 	if (!(ctx->out_type & IFTYPE_HDMI))
 		return;
 
@@ -579,6 +636,24 @@ static const struct component_ops decon_component_ops = {
 	.unbind = decon_unbind,
 };
 
+static void decon_handle_vblank(struct decon_context *ctx)
+{
+	u32 frm;
+
+	spin_lock(&ctx->vblank_lock);
+
+	frm = decon_get_frame_count(ctx, true);
+
+	if (frm != ctx->frame_id) {
+		/* handle only if incremented, take care of wrap-around */
+		if ((s32)(frm - ctx->frame_id) > 0)
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
@@ -599,7 +674,7 @@ static irqreturn_t decon_irq_handler(int irq, void *dev_id)
 			    (VIDOUT_INTERLACE_EN_F | VIDOUT_INTERLACE_FIELD_F))
 				return IRQ_HANDLED;
 		}
-		drm_crtc_handle_vblank(&ctx->crtc->base);
+		decon_handle_vblank(ctx);
 	}
 
 out:
@@ -672,6 +747,7 @@ static int exynos5433_decon_probe(struct platform_device *pdev)
 	__set_bit(BIT_SUSPENDED, &ctx->flags);
 	ctx->dev = dev;
 	ctx->out_type = (unsigned long)of_device_get_match_data(dev);
+	spin_lock_init(&ctx->vblank_lock);
 
 	if (ctx->out_type & IFTYPE_HDMI) {
 		ctx->first_win = 1;
diff --git a/include/video/exynos5433_decon.h b/include/video/exynos5433_decon.h
index ef8e2a8..352fc0d 100644
--- a/include/video/exynos5433_decon.h
+++ b/include/video/exynos5433_decon.h
@@ -46,6 +46,7 @@
 #define DECON_FRAMEFIFO_STATUS		0x0524
 #define DECON_CMU			0x1404
 #define DECON_UPDATE			0x1410
+#define DECON_CRFMID			0x1414
 #define DECON_UPDATE_SCHEME		0x1438
 #define DECON_VIDCON1			0x2000
 #define DECON_VIDCON2			0x2004
@@ -142,6 +143,13 @@
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
