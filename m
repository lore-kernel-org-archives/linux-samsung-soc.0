From: Gustavo Padovan <gustavo@padovan.org>
Subject: [PATCH -v2 06/14] drm/exynos: remove leftover functions declarations
Date: Fri,  6 Feb 2015 17:37:50 -0200
Message-ID: <1423251478-17043-7-git-send-email-gustavo@padovan.org>
References: <1423251478-17043-1-git-send-email-gustavo@padovan.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qc0-f177.google.com ([209.85.216.177]:42137 "EHLO
	mail-qc0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751083AbbBFTkS (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 6 Feb 2015 14:40:18 -0500
Received: by mail-qc0-f177.google.com with SMTP id p6so13651108qcv.8
        for <linux-samsung-soc@vger.kernel.org>; Fri, 06 Feb 2015 11:40:17 -0800 (PST)
In-Reply-To: <1423251478-17043-1-git-send-email-gustavo@padovan.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: jy0922.shim@samsung.com, inki.dae@samsung.com, dri-devel@lists.freedesktop.org, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

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
1.9.3
