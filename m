From: Gustavo Padovan <gustavo@padovan.org>
Subject: [PATCH 13/29] drm/exynos: remove exynos_drm_crtc_mode_set_commit()
Date: Thu, 18 Dec 2014 11:58:39 -0200
Message-ID: <1418911135-5207-14-git-send-email-gustavo@padovan.org>
References: <1418911135-5207-1-git-send-email-gustavo@padovan.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qa0-f53.google.com ([209.85.216.53]:48825 "EHLO
	mail-qa0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752287AbaLRN7u (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 18 Dec 2014 08:59:50 -0500
Received: by mail-qa0-f53.google.com with SMTP id j7so828064qaq.12
        for <linux-samsung-soc@vger.kernel.org>; Thu, 18 Dec 2014 05:59:50 -0800 (PST)
In-Reply-To: <1418911135-5207-1-git-send-email-gustavo@padovan.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, inki.dae@samsung.com, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>

This was just as extra chain in the call stack. We just rename it to
_set_base() and let it do everything alone.

Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
---
 drivers/gpu/drm/exynos/exynos_drm_crtc.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_crtc.c b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
index 185dabe..5b3d182 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_crtc.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
@@ -113,7 +113,7 @@ exynos_drm_crtc_mode_set(struct drm_crtc *crtc, struct drm_display_mode *mode,
 				     crtc_w, crtc_h, x, y, crtc_w, crtc_h);
 }
 
-static int exynos_drm_crtc_mode_set_commit(struct drm_crtc *crtc, int x, int y,
+static int exynos_drm_crtc_mode_set_base(struct drm_crtc *crtc, int x, int y,
 					  struct drm_framebuffer *old_fb)
 {
 	struct exynos_drm_crtc *exynos_crtc = to_exynos_crtc(crtc);
@@ -134,12 +134,6 @@ static int exynos_drm_crtc_mode_set_commit(struct drm_crtc *crtc, int x, int y,
 				   crtc_w, crtc_h, x, y, crtc_w, crtc_h);
 }
 
-static int exynos_drm_crtc_mode_set_base(struct drm_crtc *crtc, int x, int y,
-					  struct drm_framebuffer *old_fb)
-{
-	return exynos_drm_crtc_mode_set_commit(crtc, x, y, old_fb);
-}
-
 static void exynos_drm_crtc_disable(struct drm_crtc *crtc)
 {
 	struct drm_plane *plane;
-- 
1.9.3
