From: Gustavo Padovan <gustavo@padovan.org>
Subject: [PATCH 20/29] drm/exynos: don't duplicate drm_display_mode in fimd context
Date: Thu, 18 Dec 2014 11:58:46 -0200
Message-ID: <1418911135-5207-21-git-send-email-gustavo@padovan.org>
References: <1418911135-5207-1-git-send-email-gustavo@padovan.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qg0-f53.google.com ([209.85.192.53]:48414 "EHLO
	mail-qg0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752316AbaLROAX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 18 Dec 2014 09:00:23 -0500
Received: by mail-qg0-f53.google.com with SMTP id l89so836421qgf.26
        for <linux-samsung-soc@vger.kernel.org>; Thu, 18 Dec 2014 06:00:23 -0800 (PST)
In-Reply-To: <1418911135-5207-1-git-send-email-gustavo@padovan.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, inki.dae@samsung.com, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>

We can safely use the mode stored in the crtc.

Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
---
 drivers/gpu/drm/exynos/exynos_drm_crtc.c |  5 -----
 drivers/gpu/drm/exynos/exynos_drm_fimd.c | 12 +-----------
 2 files changed, 1 insertion(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_crtc.c b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
index 9e8ed5f..357fcd5 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_crtc.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
@@ -89,7 +89,6 @@ exynos_drm_crtc_mode_set(struct drm_crtc *crtc, struct drm_display_mode *mode,
 			  struct drm_display_mode *adjusted_mode, int x, int y,
 			  struct drm_framebuffer *old_fb)
 {
-	struct exynos_drm_crtc *exynos_crtc = to_exynos_crtc(crtc);
 	struct drm_framebuffer *fb = crtc->primary->fb;
 	unsigned int crtc_w;
 	unsigned int crtc_h;
@@ -102,10 +101,6 @@ exynos_drm_crtc_mode_set(struct drm_crtc *crtc, struct drm_display_mode *mode,
 
 	crtc_w = fb->width - x;
 	crtc_h = fb->height - y;
-
-	if (exynos_crtc->ops->mode_set)
-		exynos_crtc->ops->mode_set(exynos_crtc, &crtc->mode);
-
 	return exynos_plane_mode_set(crtc->primary, crtc, fb, 0, 0,
 				     crtc_w, crtc_h, x, y, crtc_w, crtc_h);
 }
diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
index 25c41f7..0e01b17 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
@@ -165,7 +165,6 @@ struct fimd_context {
 	struct clk			*lcd_clk;
 	void __iomem			*regs;
 	struct regmap			*sysreg;
-	struct drm_display_mode		mode;
 	struct fimd_win_data		win_data[WINDOWS_NR];
 	unsigned int			default_win;
 	unsigned long			irq_flags;
@@ -346,18 +345,10 @@ static bool fimd_mode_fixup(struct exynos_drm_crtc *crtc,
 	return true;
 }
 
-static void fimd_mode_set(struct exynos_drm_crtc *crtc,
-		const struct drm_display_mode *in_mode)
-{
-	struct fimd_context *ctx = crtc->ctx;
-
-	drm_mode_copy(&ctx->mode, in_mode);
-}
-
 static void fimd_commit(struct exynos_drm_crtc *crtc)
 {
 	struct fimd_context *ctx = crtc->ctx;
-	struct drm_display_mode *mode = &ctx->mode;
+	struct drm_display_mode *mode = &crtc->base.mode;
 	struct fimd_driver_data *driver_data = ctx->driver_data;
 	void *timing_base = ctx->regs + driver_data->timing_base;
 	u32 val, clkdiv;
@@ -1017,7 +1008,6 @@ static void fimd_te_handler(struct exynos_drm_crtc *crtc)
 static struct exynos_drm_crtc_ops fimd_crtc_ops = {
 	.dpms = fimd_dpms,
 	.mode_fixup = fimd_mode_fixup,
-	.mode_set = fimd_mode_set,
 	.commit = fimd_commit,
 	.enable_vblank = fimd_enable_vblank,
 	.disable_vblank = fimd_disable_vblank,
-- 
1.9.3
