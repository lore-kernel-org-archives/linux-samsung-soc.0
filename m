From: Gustavo Padovan <gustavo@padovan.org>
Subject: [PATCH v10 07/17] drm/exynos: atomic phase 2: keep track of framebuffer pointer
Date: Mon,  1 Jun 2015 12:04:45 -0300
Message-ID: <1433171095-23773-8-git-send-email-gustavo@padovan.org>
References: <1433171095-23773-1-git-send-email-gustavo@padovan.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vn0-f45.google.com ([209.85.216.45]:33618 "EHLO
	mail-vn0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752860AbbFAPFV (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 1 Jun 2015 11:05:21 -0400
Received: by vnbf190 with SMTP id f190so16439823vnb.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 01 Jun 2015 08:05:21 -0700 (PDT)
In-Reply-To: <1433171095-23773-1-git-send-email-gustavo@padovan.org>
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
index 73ccfa7..f782d1f 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_crtc.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
@@ -168,6 +168,9 @@ static int exynos_drm_crtc_page_flip(struct drm_crtc *crtc,
 			    crtc_w, crtc_h, crtc->x << 16, crtc->y << 16,
 			    crtc_w << 16, crtc_h << 16);
 
+	if (crtc->primary->state)
+		drm_atomic_set_fb_for_plane(crtc->primary->state, fb);
+
 	return 0;
 
 out:
-- 
2.1.0
