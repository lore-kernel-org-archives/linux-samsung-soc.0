From: Gustavo Padovan <gustavo@padovan.org>
Subject: [PATCH v10 01/17] drm/exynos: fix source data argument for plane
Date: Mon,  1 Jun 2015 12:04:39 -0300
Message-ID: <1433171095-23773-2-git-send-email-gustavo@padovan.org>
References: <1433171095-23773-1-git-send-email-gustavo@padovan.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vn0-f45.google.com ([209.85.216.45]:45145 "EHLO
	mail-vn0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751234AbbFAPFF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 1 Jun 2015 11:05:05 -0400
Received: by vnbg7 with SMTP id g7so16603288vnb.12
        for <linux-samsung-soc@vger.kernel.org>; Mon, 01 Jun 2015 08:05:05 -0700 (PDT)
In-Reply-To: <1433171095-23773-1-git-send-email-gustavo@padovan.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, inki.dae@samsung.com, jy0922.shim@samsung.com, tjakobi@math.uni-bielefeld.de

From: Joonyoung Shim <jy0922.shim@samsung.com>

The exynos_update_plane function needs 16.16 fixed point source data.

Signed-off-by: Joonyoung Shim <jy0922.shim@samsung.com>
Reviewed-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
---
 drivers/gpu/drm/exynos/exynos_drm_crtc.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_crtc.c b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
index 9006b94..363b019 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_crtc.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
@@ -127,7 +127,8 @@ static int exynos_drm_crtc_mode_set_base(struct drm_crtc *crtc, int x, int y,
 	crtc_h = fb->height - y;
 
 	return exynos_update_plane(crtc->primary, crtc, fb, 0, 0,
-				   crtc_w, crtc_h, x, y, crtc_w, crtc_h);
+				   crtc_w, crtc_h, x << 16, y << 16,
+				   crtc_w << 16, crtc_h << 16);
 }
 
 static void exynos_drm_crtc_disable(struct drm_crtc *crtc)
@@ -202,8 +203,8 @@ static int exynos_drm_crtc_page_flip(struct drm_crtc *crtc,
 	crtc_w = fb->width - crtc->x;
 	crtc_h = fb->height - crtc->y;
 	ret = exynos_update_plane(crtc->primary, crtc, fb, 0, 0,
-				  crtc_w, crtc_h, crtc->x, crtc->y,
-				  crtc_w, crtc_h);
+				  crtc_w, crtc_h, crtc->x << 16, crtc->y << 16,
+				  crtc_w << 16, crtc_h << 16);
 	if (ret) {
 		crtc->primary->fb = old_fb;
 		spin_lock_irq(&dev->event_lock);
-- 
2.1.0
