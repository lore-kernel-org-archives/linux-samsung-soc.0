From: Gustavo Padovan <gustavo@padovan.org>
Subject: [PATCH v2 07/11] drm/exynos: fimd: only finish update if START == START_S
Date: Wed, 26 Aug 2015 14:43:24 -0300
Message-ID: <1440611008-3473-9-git-send-email-gustavo@padovan.org>
References: <1440611008-3473-1-git-send-email-gustavo@padovan.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qk0-f169.google.com ([209.85.220.169]:35675 "EHLO
	mail-qk0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752307AbbHZRnz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 26 Aug 2015 13:43:55 -0400
Received: by qkbm65 with SMTP id m65so123604950qkb.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 26 Aug 2015 10:43:54 -0700 (PDT)
In-Reply-To: <1440611008-3473-1-git-send-email-gustavo@padovan.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, inki.dae@samsung.com, jy0922.shim@samsung.com, tjakobi@math.uni-bielefeld.de, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>

fimd_update_plane() programs BUF_START[win] and during the update
BUF_START[win] is copied to BUF_START_S[win] (its shadow register)
and starts scanning out, then it raises a irq.

The fimd_irq_handler, in the case we have a pending_fb, will check
the fb value was copied to START_S register and finish the update
in case of success.

Based on patch from Daniel Kurtz <djkurtz@chromium.org>

Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
---
 drivers/gpu/drm/exynos/exynos_drm_fimd.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
index fc26c3e..d96044f 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
@@ -59,6 +59,7 @@
 #define VIDWnALPHA1(win)	(VIDW_ALPHA + 0x04 + (win) * 8)
 
 #define VIDWx_BUF_START(win, buf)	(VIDW_BUF_START(buf) + (win) * 8)
+#define VIDWx_BUF_START_S(win, buf)	(VIDW_BUF_START_S(buf) + (win) * 8)
 #define VIDWx_BUF_END(win, buf)		(VIDW_BUF_END(buf) + (win) * 8)
 #define VIDWx_BUF_SIZE(win, buf)	(VIDW_BUF_SIZE(buf) + (win) * 4)
 
@@ -895,7 +896,7 @@ static const struct exynos_drm_crtc_ops fimd_crtc_ops = {
 static irqreturn_t fimd_irq_handler(int irq, void *dev_id)
 {
 	struct fimd_context *ctx = (struct fimd_context *)dev_id;
-	u32 val, clear_bit;
+	u32 val, clear_bit, start, start_s;
 	int win;
 
 	val = readl(ctx->regs + VIDINTCON1);
@@ -917,7 +918,10 @@ static irqreturn_t fimd_irq_handler(int irq, void *dev_id)
 		if (!plane->pending_fb)
 			continue;
 
-		exynos_drm_crtc_finish_update(ctx->crtc, plane);
+		start = readl(ctx->regs + VIDWx_BUF_START(win, 0));
+		start_s = readl(ctx->regs + VIDWx_BUF_START_S(win, 0));
+		if (start == start_s)
+			exynos_drm_crtc_finish_update(ctx->crtc, plane);
 	}
 
 	if (ctx->i80_if) {
-- 
2.1.0
