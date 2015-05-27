From: Gustavo Padovan <gustavo@padovan.org>
Subject: [PATCH v8 06/14] drm/exynos: atomic phase 2: keep track of framebuffer pointer
Date: Wed, 27 May 2015 17:56:15 -0300
Message-ID: <1432760183-4342-7-git-send-email-gustavo@padovan.org>
References: <1432760183-4342-1-git-send-email-gustavo@padovan.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vn0-f48.google.com ([209.85.216.48]:42962 "EHLO
	mail-vn0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751679AbbE0U4u (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 27 May 2015 16:56:50 -0400
Received: by vnbg129 with SMTP id g129so2583442vnb.9
        for <linux-samsung-soc@vger.kernel.org>; Wed, 27 May 2015 13:56:49 -0700 (PDT)
In-Reply-To: <1432760183-4342-1-git-send-email-gustavo@padovan.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, inki.dae@samsung.com, jy0922.shim@samsung.com, tjakobi@math.uni-bielefeld.de, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>

Use drm_atomic_set_fb_for_plane() in the legacy page_flip path to keep
track of the framebuffer pointer and reference.

Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
Reviewed-by: Joonyoung Shim <jy0922.shim@samsung.com>
Tested-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
---
 drivers/gpu/drm/exynos/exynos_drm_crtc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_crtc.c b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
index 5bfee9b..fe77516 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_crtc.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
@@ -171,6 +171,9 @@ static int exynos_drm_crtc_page_flip(struct drm_crtc *crtc,
 			    crtc_w, crtc_h, crtc->x << 16, crtc->y << 16,
 			    crtc_w << 16, crtc_h << 16);
 
+	if (crtc->primary->state)
+		drm_atomic_set_fb_for_plane(crtc->primary->state, fb);
+
 	return 0;
 
 out:
-- 
2.1.0
