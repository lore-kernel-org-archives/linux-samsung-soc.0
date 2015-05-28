From: Gustavo Padovan <gustavo@padovan.org>
Subject: [PATCH v9 18/18] drm/exynos: don't disable planes already disabled
Date: Thu, 28 May 2015 18:42:56 -0300
Message-ID: <1432849376-12828-19-git-send-email-gustavo@padovan.org>
References: <1432849376-12828-1-git-send-email-gustavo@padovan.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vn0-f46.google.com ([209.85.216.46]:40967 "EHLO
	mail-vn0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754895AbbE1VoG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 28 May 2015 17:44:06 -0400
Received: by vnbg62 with SMTP id g62so6397655vnb.8
        for <linux-samsung-soc@vger.kernel.org>; Thu, 28 May 2015 14:44:06 -0700 (PDT)
In-Reply-To: <1432849376-12828-1-git-send-email-gustavo@padovan.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, inki.dae@samsung.com, jy0922.shim@samsung.com, tjakobi@math.uni-bielefeld.de, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>

on resume (or enable()) do not call disable_plane() on planes that
are already disabled.

Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
---
 drivers/gpu/drm/exynos/exynos_drm_fimd.c | 15 +--------------
 1 file changed, 1 insertion(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
index e55a8b0..7dae3a7 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
@@ -786,23 +786,10 @@ static void fimd_window_resume(struct fimd_context *ctx)
 		plane = &ctx->planes[i];
 		plane->enabled = plane->resume;
 		plane->resume = false;
-	}
-}
 
-static void fimd_apply(struct fimd_context *ctx)
-{
-	struct exynos_drm_plane *plane;
-	int i;
-
-	for (i = 0; i < WINDOWS_NR; i++) {
-		plane = &ctx->planes[i];
 		if (plane->enabled)
 			fimd_update_plane(ctx->crtc, i);
-		else
-			fimd_disable_plane(ctx->crtc, i);
 	}
-
-	fimd_commit(ctx->crtc);
 }
 
 static int fimd_enable(struct exynos_drm_crtc *crtc)
@@ -840,7 +827,7 @@ static int fimd_enable(struct exynos_drm_crtc *crtc)
 
 	fimd_window_resume(ctx);
 
-	fimd_apply(ctx);
+	fimd_commit(ctx->crtc);
 
 	return 0;
 
-- 
2.1.0
