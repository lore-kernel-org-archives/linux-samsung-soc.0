From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [PATCH] drm/exynos: remove hardware overlays disable from fimd probe
Date: Wed, 28 May 2014 11:41:11 +0530
Message-ID: <1401257471-31994-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:52900 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751155AbaE1GMC (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 28 May 2014 02:12:02 -0400
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N6900JWST80I540@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 28 May 2014 15:12:00 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org
Cc: linux-samsung-soc@vger.kernel.org, inki.dae@samsung.com, kgene.kim@samsung.com, joshi@samsung.com, r.sh.open@gmail.com, Rahul Sharma <rahul.sharma@samsung.com>

System hangs when FIMD registers are accessed to disable
hardware overlays. This is because of the clocks which are
not enabled before register access.

'Hardware overlay disable' is cleaned from the FIMD probe.

Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
---
Based on exynos-drm-next branch.

 drivers/gpu/drm/exynos/exynos_drm_fimd.c |   17 -----------------
 1 file changed, 17 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
index bd30d0c..2ec634f 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
@@ -703,19 +703,6 @@ static void fimd_win_disable(struct exynos_drm_manager *mgr, int zpos)
 	win_data->enabled = false;
 }
 
-static void fimd_clear_win(struct fimd_context *ctx, int win)
-{
-	writel(0, ctx->regs + WINCON(win));
-	writel(0, ctx->regs + VIDOSD_A(win));
-	writel(0, ctx->regs + VIDOSD_B(win));
-	writel(0, ctx->regs + VIDOSD_C(win));
-
-	if (win == 1 || win == 2)
-		writel(0, ctx->regs + VIDOSD_D(win));
-
-	fimd_shadow_protect_win(ctx, win, false);
-}
-
 static void fimd_window_suspend(struct exynos_drm_manager *mgr)
 {
 	struct fimd_context *ctx = mgr->ctx;
@@ -898,16 +885,12 @@ static int fimd_bind(struct device *dev, struct device *master, void *data)
 {
 	struct fimd_context *ctx = fimd_manager.ctx;
 	struct drm_device *drm_dev = data;
-	int win;
 
 	fimd_mgr_initialize(&fimd_manager, drm_dev);
 	exynos_drm_crtc_create(&fimd_manager);
 	if (ctx->display)
 		exynos_drm_create_enc_conn(drm_dev, ctx->display);
 
-	for (win = 0; win < WINDOWS_NR; win++)
-		fimd_clear_win(ctx, win);
-
 	return 0;
 
 }
-- 
1.7.9.5
