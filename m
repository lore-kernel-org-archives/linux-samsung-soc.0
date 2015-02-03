From: Gustavo Padovan <gustavo@padovan.org>
Subject: [PATCH 02/14] drm/exynos: Remove exynos_plane_dpms() call with no effect
Date: Tue,  3 Feb 2015 17:14:19 -0200
Message-ID: <1422990871-21355-3-git-send-email-gustavo@padovan.org>
References: <1422990871-21355-1-git-send-email-gustavo@padovan.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qa0-f41.google.com ([209.85.216.41]:59822 "EHLO
	mail-qa0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S966250AbbBCTQn (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 3 Feb 2015 14:16:43 -0500
Received: by mail-qa0-f41.google.com with SMTP id bm13so35287482qab.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 03 Feb 2015 11:16:42 -0800 (PST)
In-Reply-To: <1422990871-21355-1-git-send-email-gustavo@padovan.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: jy0922.shim@samsung.com, inki.dae@samsung.com, dri-devel@lists.freedesktop.org, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>

exynos_plane_dpms(DRM_MODE_DPMS_ON) calls the win_enable()'s callback
from the underlying layer. However neither one of these layers implement
win_enable() - FIMD, Mixer and VIDI. Thus the call to exynos_plane_dpms()
is pointless.

Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
---
 drivers/gpu/drm/exynos/exynos_drm_crtc.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_crtc.c b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
index b2a4b84..ad675fb 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_crtc.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
@@ -65,8 +65,6 @@ static void exynos_drm_crtc_commit(struct drm_crtc *crtc)
 
 	if (exynos_crtc->ops->commit)
 		exynos_crtc->ops->commit(exynos_crtc);
-
-	exynos_plane_dpms(crtc->primary, DRM_MODE_DPMS_ON);
 }
 
 static bool
-- 
1.9.3
