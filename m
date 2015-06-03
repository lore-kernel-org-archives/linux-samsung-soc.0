From: Gustavo Padovan <gustavo@padovan.org>
Subject: [PATCH 6/9] drm/exynos: remove duplicated check for suspend
Date: Wed,  3 Jun 2015 11:30:29 -0300
Message-ID: <1433341832-2686-6-git-send-email-gustavo@padovan.org>
References: <1433341832-2686-1-git-send-email-gustavo@padovan.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yk0-f171.google.com ([209.85.160.171]:34217 "EHLO
	mail-yk0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754837AbbFCOaw (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 3 Jun 2015 10:30:52 -0400
Received: by ykfl8 with SMTP id l8so4168456ykf.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 03 Jun 2015 07:30:51 -0700 (PDT)
In-Reply-To: <1433341832-2686-1-git-send-email-gustavo@padovan.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, inki.dae@samsung.com, jy0922.shim@samsung.com, tjakobi@math.uni-bielefeld.de, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>

The same check is place twice in fimd/decon_update_plane(), remove
one of them.

Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
---
 drivers/gpu/drm/exynos/exynos7_drm_decon.c | 3 ---
 drivers/gpu/drm/exynos/exynos_drm_fimd.c   | 3 ---
 2 files changed, 6 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos7_drm_decon.c b/drivers/gpu/drm/exynos/exynos7_drm_decon.c
index acbb712..b773a48 100644
--- a/drivers/gpu/drm/exynos/exynos7_drm_decon.c
+++ b/drivers/gpu/drm/exynos/exynos7_drm_decon.c
@@ -403,9 +403,6 @@ static void decon_update_plane(struct exynos_drm_crtc *crtc,
 	unsigned int last_y;
 	unsigned int win = plane->zpos;
 
-	if (ctx->suspended)
-		return;
-
 	/* If suspended, enable this on resume */
 	if (ctx->suspended) {
 		plane->resume = true;
diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
index 5a3f9f2..f586002 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
@@ -627,9 +627,6 @@ static void fimd_update_plane(struct exynos_drm_crtc *crtc,
 	unsigned int last_x, last_y, buf_offsize, line_size;
 	unsigned int win = plane->zpos;
 
-	if (ctx->suspended)
-		return;
-
 	/* If suspended, enable this on resume */
 	if (ctx->suspended) {
 		plane->resume = true;
-- 
2.1.0
