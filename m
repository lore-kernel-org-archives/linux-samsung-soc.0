From: Gustavo Padovan <gustavo@padovan.org>
Subject: [PATCH 4/6] drm/exynos: remove leftover functions declarations
Date: Fri, 23 Jan 2015 10:42:58 -0200
Message-ID: <1422016980-23806-4-git-send-email-gustavo@padovan.org>
References: <1422016980-23806-1-git-send-email-gustavo@padovan.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qc0-f169.google.com ([209.85.216.169]:39519 "EHLO
	mail-qc0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751856AbbAWMnO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 23 Jan 2015 07:43:14 -0500
Received: by mail-qc0-f169.google.com with SMTP id b13so6022831qcw.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 23 Jan 2015 04:43:14 -0800 (PST)
In-Reply-To: <1422016980-23806-1-git-send-email-gustavo@padovan.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, inki.dae@samsung.com, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>

These functions were already removed by previous cleanup work, but these
ones were left behind.

Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
---
 drivers/gpu/drm/exynos/exynos_drm_crtc.h | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_crtc.h b/drivers/gpu/drm/exynos/exynos_drm_crtc.h
index 6258b80..628b787 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_crtc.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_crtc.h
@@ -27,12 +27,6 @@ void exynos_drm_crtc_disable_vblank(struct drm_device *dev, int pipe);
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
