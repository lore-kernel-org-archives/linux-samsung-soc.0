From: YoungJun Cho <yj44.cho@samsung.com>
Subject: [PATCH 4/9] drm/exynos: fimd: add fimd_enable_shadow_channel_path() to
 cleanup
Date: Mon, 17 Nov 2014 22:00:11 +0900
Message-ID: <1416229216-32018-5-git-send-email-yj44.cho@samsung.com>
References: <1416229216-32018-1-git-send-email-yj44.cho@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:39821 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751064AbaKQNAW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 17 Nov 2014 08:00:22 -0500
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0NF6003YSPGKH720@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 17 Nov 2014 22:00:20 +0900 (KST)
In-reply-to: <1416229216-32018-1-git-send-email-yj44.cho@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org
Cc: linux-samsung-soc@vger.kernel.org, inki.dae@samsung.com, jy0922.shim@samsung.com, sw0312.kim@samsung.com, a.hajda@samsung.com, kyungmin.park@samsung.com

This function is valid only the SoC has SHADOWCON register
and it should be used together with fimd_enable_video_output()
to match the ENWIN_F bit in WINCON# and C#_EN_F bit in SHADOWCON.

Signed-off-by: YoungJun Cho <yj44.cho@samsung.com>
Acked-by: Inki Dae <inki.dae@samsung.com>
Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_fimd.c | 40 ++++++++++++++++++--------------
 1 file changed, 22 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
index 5cfd251..fd7b469 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
@@ -242,6 +242,19 @@ static void fimd_enable_video_output(struct fimd_context *ctx, int win,
 	writel(val, ctx->regs + WINCON(win));
 }
 
+static void fimd_enable_shadow_channel_path(struct fimd_context *ctx, int win,
+						bool enable)
+{
+	u32 val = readl(ctx->regs + SHADOWCON);
+
+	if (enable)
+		val |= SHADOWCON_CHx_ENABLE(win);
+	else
+		val &= ~SHADOWCON_CHx_ENABLE(win);
+
+	writel(val, ctx->regs + SHADOWCON);
+}
+
 static void fimd_clear_channel(struct exynos_drm_manager *mgr)
 {
 	struct fimd_context *ctx = mgr->ctx;
@@ -256,12 +269,10 @@ static void fimd_clear_channel(struct exynos_drm_manager *mgr)
 		if (val & WINCONx_ENWIN) {
 			fimd_enable_video_output(ctx, win, false);
 
-			/* unprotect windows */
-			if (ctx->driver_data->has_shadowcon) {
-				val = readl(ctx->regs + SHADOWCON);
-				val &= ~SHADOWCON_CHx_ENABLE(win);
-				writel(val, ctx->regs + SHADOWCON);
-			}
+			if (ctx->driver_data->has_shadowcon)
+				fimd_enable_shadow_channel_path(ctx, win,
+								false);
+
 			ch_enabled = 1;
 		}
 	}
@@ -759,11 +770,8 @@ static void fimd_win_commit(struct exynos_drm_manager *mgr, int zpos)
 
 	fimd_enable_video_output(ctx, win, true);
 
-	if (ctx->driver_data->has_shadowcon) {
-		val = readl(ctx->regs + SHADOWCON);
-		val |= SHADOWCON_CHx_ENABLE(win);
-		writel(val, ctx->regs + SHADOWCON);
-	}
+	if (ctx->driver_data->has_shadowcon)
+		fimd_enable_shadow_channel_path(ctx, win, true);
 
 	/* Enable DMA channel and unprotect windows */
 	fimd_shadow_protect_win(ctx, win, false);
@@ -779,7 +787,6 @@ static void fimd_win_disable(struct exynos_drm_manager *mgr, int zpos)
 	struct fimd_context *ctx = mgr->ctx;
 	struct fimd_win_data *win_data;
 	int win = zpos;
-	u32 val;
 
 	if (win == DEFAULT_ZPOS)
 		win = ctx->default_win;
@@ -800,13 +807,10 @@ static void fimd_win_disable(struct exynos_drm_manager *mgr, int zpos)
 
 	fimd_enable_video_output(ctx, win, false);
 
-	/* unprotect windows */
-	if (ctx->driver_data->has_shadowcon) {
-		val = readl(ctx->regs + SHADOWCON);
-		val &= ~SHADOWCON_CHx_ENABLE(win);
-		writel(val, ctx->regs + SHADOWCON);
-	}
+	if (ctx->driver_data->has_shadowcon)
+		fimd_enable_shadow_channel_path(ctx, win, false);
 
+	/* unprotect windows */
 	fimd_shadow_protect_win(ctx, win, false);
 
 	win_data->enabled = false;
-- 
1.9.0
