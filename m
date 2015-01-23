From: Gustavo Padovan <gustavo@padovan.org>
Subject: [PATCH 3/6] drm/exynos: Remove exynos_plane_dpms() call with no effect
Date: Fri, 23 Jan 2015 10:42:57 -0200
Message-ID: <1422016980-23806-3-git-send-email-gustavo@padovan.org>
References: <1422016980-23806-1-git-send-email-gustavo@padovan.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qa0-f50.google.com ([209.85.216.50]:56937 "EHLO
	mail-qa0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751856AbbAWMnM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 23 Jan 2015 07:43:12 -0500
Received: by mail-qa0-f50.google.com with SMTP id k15so5564759qaq.9
        for <linux-samsung-soc@vger.kernel.org>; Fri, 23 Jan 2015 04:43:12 -0800 (PST)
In-Reply-To: <1422016980-23806-1-git-send-email-gustavo@padovan.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, inki.dae@samsung.com, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

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
index b1f1b25..d0f4e1b 100644
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
