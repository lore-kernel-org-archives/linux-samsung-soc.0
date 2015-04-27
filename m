From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: [PATCH v2 1/4] drm/exynos: fb: use drm_format_num_planes to get buffer count
Date: Mon, 27 Apr 2015 23:10:13 +0200
Message-ID: <1430169016-4966-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:49448 "EHLO
	smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S965133AbbD0VKS (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 27 Apr 2015 17:10:18 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, gustavo.padovan@collabora.co.uk, jy0922.shim@samsung.com, inki.dae@samsung.com, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>

The previous code had some special case handling for the buffer
count in exynos_drm_format_num_buffers().

This code was incorrect though, since this special case doesn't
exist for DRM. It stemmed from the existence of the special NV12M
V4L2 format. NV12 is a bi-planar format (separate planes for luma
and chroma) and V4L2 differentiates between a NV12 buffer where
luma and chroma is contiguous in memory (so no data between
luma/chroma), and a NV12 buffer where luma and chroma have two
explicit memory locations (which is then called NV12M).

This distinction doesn't exist for DRM. A bi-planar format always
explicitly comes with the information about its two planes (even
if these planes should be contiguous).

Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
---
 drivers/gpu/drm/exynos/exynos_drm_fb.c | 39 +---------------------------------
 1 file changed, 1 insertion(+), 38 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_fb.c b/drivers/gpu/drm/exynos/exynos_drm_fb.c
index 929cb03..142eb4e 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fb.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fb.c
@@ -171,43 +171,6 @@ exynos_drm_framebuffer_init(struct drm_device *dev,
 	return &exynos_fb->fb;
 }
 
-static u32 exynos_drm_format_num_buffers(struct drm_mode_fb_cmd2 *mode_cmd)
-{
-	unsigned int cnt = 0;
-
-	if (mode_cmd->pixel_format != DRM_FORMAT_NV12)
-		return drm_format_num_planes(mode_cmd->pixel_format);
-
-	while (cnt != MAX_FB_BUFFER) {
-		if (!mode_cmd->handles[cnt])
-			break;
-		cnt++;
-	}
-
-	/*
-	 * check if NV12 or NV12M.
-	 *
-	 * NV12
-	 * handles[0] = base1, offsets[0] = 0
-	 * handles[1] = base1, offsets[1] = Y_size
-	 *
-	 * NV12M
-	 * handles[0] = base1, offsets[0] = 0
-	 * handles[1] = base2, offsets[1] = 0
-	 */
-	if (cnt == 2) {
-		/*
-		 * in case of NV12 format, offsets[1] is not 0 and
-		 * handles[0] is same as handles[1].
-		 */
-		if (mode_cmd->offsets[1] &&
-			mode_cmd->handles[0] == mode_cmd->handles[1])
-			cnt = 1;
-	}
-
-	return cnt;
-}
-
 static struct drm_framebuffer *
 exynos_user_fb_create(struct drm_device *dev, struct drm_file *file_priv,
 		      struct drm_mode_fb_cmd2 *mode_cmd)
@@ -230,7 +193,7 @@ exynos_user_fb_create(struct drm_device *dev, struct drm_file *file_priv,
 
 	drm_helper_mode_fill_fb_struct(&exynos_fb->fb, mode_cmd);
 	exynos_fb->exynos_gem_obj[0] = to_exynos_gem_obj(obj);
-	exynos_fb->buf_cnt = exynos_drm_format_num_buffers(mode_cmd);
+	exynos_fb->buf_cnt = drm_format_num_planes(mode_cmd->pixel_format);
 
 	DRM_DEBUG_KMS("buf_cnt = %d\n", exynos_fb->buf_cnt);
 
-- 
2.0.5
