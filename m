From: Gustavo Padovan <gustavo@padovan.org>
Subject: [PATCH v3 3/9] drm/exynos: remove duplicated check for suspend
Date: Thu, 16 Jul 2015 12:23:33 -0300
Message-ID: <1437060219-32278-3-git-send-email-gustavo@padovan.org>
References: <1437060219-32278-1-git-send-email-gustavo@padovan.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qk0-f176.google.com ([209.85.220.176]:36829 "EHLO
	mail-qk0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753132AbbGPPXx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 16 Jul 2015 11:23:53 -0400
Received: by qkdv3 with SMTP id v3so52249188qkd.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 16 Jul 2015 08:23:53 -0700 (PDT)
In-Reply-To: <1437060219-32278-1-git-send-email-gustavo@padovan.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, inki.dae@samsung.com, jy0922.shim@samsung.com, tjakobi@math.uni-bielefeld.de, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>

The same check is placed twice in fimd/decon_update_plane(), remove
one of them.

Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
Reviewed-by: Joonyoung Shim <jy0922.shim@samsung.com>
---
 drivers/gpu/drm/exynos/exynos7_drm_decon.c | 3 ---
 drivers/gpu/drm/exynos/exynos_drm_fimd.c   | 3 ---
 2 files changed, 6 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos7_drm_decon.c b/drivers/gpu/drm/exynos/exynos7_drm_decon.c
index 5a1174a..f720f2a 100644
--- a/drivers/gpu/drm/exynos/exynos7_drm_decon.c
+++ b/drivers/gpu/drm/exynos/exynos7_drm_decon.c
@@ -400,9 +400,6 @@ static void decon_win_commit(struct exynos_drm_crtc *crtc, unsigned int win)
 
 	plane = &ctx->planes[win];
 
-	if (ctx->suspended)
-		return;
-
 	/*
 	 * SHADOWCON/PRTCON register is used for enabling timing.
 	 *
diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
index 9eb9e33..0875f111 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
@@ -630,9 +630,6 @@ static void fimd_win_commit(struct exynos_drm_crtc *crtc, unsigned int win)
 
 	plane = &ctx->planes[win];
 
-	if (ctx->suspended)
-		return;
-
 	/*
 	 * SHADOWCON/PRTCON register is used for enabling timing.
 	 *
-- 
2.1.0
