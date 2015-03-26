From: Gustavo Padovan <gustavo@padovan.org>
Subject: [PATCH -v2 7/8] drm/exynos: remove leftover functions declarations
Date: Thu, 26 Mar 2015 11:11:00 -0300
Message-ID: <1427379061-30621-8-git-send-email-gustavo@padovan.org>
References: <1427379061-30621-1-git-send-email-gustavo@padovan.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qg0-f50.google.com ([209.85.192.50]:34531 "EHLO
	mail-qg0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752940AbbCZOL1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 26 Mar 2015 10:11:27 -0400
Received: by qgep97 with SMTP id p97so97362260qge.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Mar 2015 07:11:26 -0700 (PDT)
In-Reply-To: <1427379061-30621-1-git-send-email-gustavo@padovan.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, inki.dae@samsung.com, jy0922.shim@samsung.com, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>

These functions were already removed by previous cleanup work, but these
ones were left behind.

Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
Acked-by: Joonyoung Shim <jy0922.shim@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_crtc.h | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_crtc.h b/drivers/gpu/drm/exynos/exynos_drm_crtc.h
index e1fd2ef..0ecd8fc 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_crtc.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_crtc.h
@@ -28,12 +28,6 @@ void exynos_drm_crtc_disable_vblank(struct drm_device *dev, int pipe);
 void exynos_drm_crtc_finish_pageflip(struct drm_device *dev, int pipe);
 void exynos_drm_crtc_complete_scanout(struct drm_framebuffer *fb);
 
-void exynos_drm_crtc_plane_mode_set(struct drm_crtc *crtc,
-			struct exynos_drm_plane *plane);
-void exynos_drm_crtc_plane_commit(struct drm_crtc *crtc, int zpos);
-void exynos_drm_crtc_plane_enable(struct drm_crtc *crtc, int zpos);
-void exynos_drm_crtc_plane_disable(struct drm_crtc *crtc, int zpos);
-
 /* This function gets pipe value to crtc device matched with out_type. */
 int exynos_drm_crtc_get_pipe_from_type(struct drm_device *drm_dev,
 					unsigned int out_type);
-- 
2.1.0
