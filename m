From: Gustavo Padovan <gustavo@padovan.org>
Subject: [PATCH v5 05/12] drm/exynos: atomic phase 2: keep track of framebuffer pointer
Date: Thu, 21 May 2015 12:02:49 -0300
Message-ID: <1432220576-18532-7-git-send-email-gustavo@padovan.org>
References: <1432220576-18532-1-git-send-email-gustavo@padovan.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qg0-f41.google.com ([209.85.192.41]:36029 "EHLO
	mail-qg0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753309AbbEUPDZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 21 May 2015 11:03:25 -0400
Received: by qget53 with SMTP id t53so41500327qge.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 21 May 2015 08:03:24 -0700 (PDT)
In-Reply-To: <1432220576-18532-1-git-send-email-gustavo@padovan.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, inki.dae@samsung.com, jy0922.shim@samsung.com, tjakobi@math.uni-bielefeld.de, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>

Use drm_atomic_set_fb_for_plane() in the legacy page_flip path to keep
track of the framebuffer pointer and reference.

Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
---
 drivers/gpu/drm/exynos/exynos_drm_crtc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_crtc.c b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
index 44e73d0..b080e83 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_crtc.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
@@ -174,6 +174,9 @@ static int exynos_drm_crtc_page_flip(struct drm_crtc *crtc,
 			    crtc_w, crtc_h, crtc->x, crtc->y,
 			    crtc_w, crtc_h);
 
+	if (crtc->primary->state)
+		drm_atomic_set_fb_for_plane(crtc->primary->state, fb);
+
 	return 0;
 
 out:
-- 
2.1.0
