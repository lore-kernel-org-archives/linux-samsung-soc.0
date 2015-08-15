From: Gustavo Padovan <gustavo@padovan.org>
Subject: [PATCH 04/11] drm/exynos: fimd: move window protect code to prepare/cleanup_plane
Date: Sat, 15 Aug 2015 13:26:13 -0300
Message-ID: <1439655980-32146-5-git-send-email-gustavo@padovan.org>
References: <1439655980-32146-1-git-send-email-gustavo@padovan.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yk0-f172.google.com ([209.85.160.172]:36809 "EHLO
	mail-yk0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753216AbbHOQ0g (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 15 Aug 2015 12:26:36 -0400
Received: by ykfw73 with SMTP id w73so39400198ykf.3
        for <linux-samsung-soc@vger.kernel.org>; Sat, 15 Aug 2015 09:26:36 -0700 (PDT)
In-Reply-To: <1439655980-32146-1-git-send-email-gustavo@padovan.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, inki.dae@samsung.com, jy0922.shim@samsung.com, tjakobi@math.uni-bielefeld.de, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>

Only set/clear the update bit in the CRTC's .atomic_begin()/flush()
so all planes are really committed at the same time.

Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
---
 drivers/gpu/drm/exynos/exynos_drm_fimd.c | 57 +++++++++++++++++++-------------
 1 file changed, 34 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
index 30c1409..48d4fbe 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
@@ -591,6 +591,16 @@ static void fimd_shadow_protect_win(struct fimd_context *ctx,
 {
 	u32 reg, bits, val;
 
+	/*
+	 * SHADOWCON/PRTCON register is used for enabling timing.
+	 *
+	 * for example, once only width value of a register is set,
+	 * if the dma is started then fimd hardware could malfunction so
+	 * with protect window setting, the register fields with prefix '_F'
+	 * wouldn't be updated at vsync also but updated once unprotect window
+	 * is set.
+	 */
+
 	if (ctx->driver_data->has_shadowcon) {
 		reg = SHADOWCON;
 		bits = SHADOWCON_WINx_PROTECT(win);
@@ -607,6 +617,28 @@ static void fimd_shadow_protect_win(struct fimd_context *ctx,
 	writel(val, ctx->regs + reg);
 }
 
+static void fimd_prepare_plane(struct exynos_drm_crtc *crtc,
+			       struct exynos_drm_plane *plane)
+{
+	struct fimd_context *ctx = crtc->ctx;
+
+	if (ctx->suspended)
+		return;
+
+	fimd_shadow_protect_win(ctx, plane->zpos, true);
+}
+
+static void fimd_cleanup_plane(struct exynos_drm_crtc *crtc,
+			       struct exynos_drm_plane *plane)
+{
+	struct fimd_context *ctx = crtc->ctx;
+
+	if (ctx->suspended)
+		return;
+
+	fimd_shadow_protect_win(ctx, plane->zpos, false);
+}
+
 static void fimd_update_plane(struct exynos_drm_crtc *crtc,
 			      struct exynos_drm_plane *plane)
 {
@@ -622,20 +654,6 @@ static void fimd_update_plane(struct exynos_drm_crtc *crtc,
 	if (ctx->suspended)
 		return;
 
-	/*
-	 * SHADOWCON/PRTCON register is used for enabling timing.
-	 *
-	 * for example, once only width value of a register is set,
-	 * if the dma is started then fimd hardware could malfunction so
-	 * with protect window setting, the register fields with prefix '_F'
-	 * wouldn't be updated at vsync also but updated once unprotect window
-	 * is set.
-	 */
-
-	/* protect windows */
-	fimd_shadow_protect_win(ctx, win, true);
-
-
 	offset = plane->src_x * bpp;
 	offset += plane->src_y * pitch;
 
@@ -707,9 +725,6 @@ static void fimd_update_plane(struct exynos_drm_crtc *crtc,
 	if (ctx->driver_data->has_shadowcon)
 		fimd_enable_shadow_channel_path(ctx, win, true);
 
-	/* Enable DMA channel and unprotect windows */
-	fimd_shadow_protect_win(ctx, win, false);
-
 	if (ctx->i80_if)
 		atomic_set(&ctx->win_updated, 1);
 }
@@ -723,16 +738,10 @@ static void fimd_disable_plane(struct exynos_drm_crtc *crtc,
 	if (ctx->suspended)
 		return;
 
-	/* protect windows */
-	fimd_shadow_protect_win(ctx, win, true);
-
 	fimd_enable_video_output(ctx, win, false);
 
 	if (ctx->driver_data->has_shadowcon)
 		fimd_enable_shadow_channel_path(ctx, win, false);
-
-	/* unprotect windows */
-	fimd_shadow_protect_win(ctx, win, false);
 }
 
 static void fimd_enable(struct exynos_drm_crtc *crtc)
@@ -875,8 +884,10 @@ static const struct exynos_drm_crtc_ops fimd_crtc_ops = {
 	.enable_vblank = fimd_enable_vblank,
 	.disable_vblank = fimd_disable_vblank,
 	.wait_for_vblank = fimd_wait_for_vblank,
+	.prepare_plane = fimd_prepare_plane,
 	.update_plane = fimd_update_plane,
 	.disable_plane = fimd_disable_plane,
+	.cleanup_plane = fimd_cleanup_plane,
 	.te_handler = fimd_te_handler,
 	.clock_enable = fimd_dp_clock_enable,
 };
-- 
2.1.0
