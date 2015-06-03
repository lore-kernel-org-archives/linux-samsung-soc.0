From: Gustavo Padovan <gustavo@padovan.org>
Subject: [PATCH 8/9] drm/exynos: remove unused fields from struct exynos_drm_plane
Date: Wed,  3 Jun 2015 11:30:31 -0300
Message-ID: <1433341832-2686-8-git-send-email-gustavo@padovan.org>
References: <1433341832-2686-1-git-send-email-gustavo@padovan.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yk0-f175.google.com ([209.85.160.175]:36122 "EHLO
	mail-yk0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755261AbbFCObB (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 3 Jun 2015 10:31:01 -0400
Received: by yked142 with SMTP id d142so4154733yke.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 03 Jun 2015 07:31:01 -0700 (PDT)
In-Reply-To: <1433341832-2686-1-git-send-email-gustavo@padovan.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, inki.dae@samsung.com, jy0922.shim@samsung.com, tjakobi@math.uni-bielefeld.de, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>

Now after the mode to use drm_plane_state directly struct drm_plane_state
has many unused fields, along with others that weren't used before the
plane state change. Thus remove them all.

Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
---
 drivers/gpu/drm/exynos/exynos_drm_drv.h | 18 ------------------
 1 file changed, 18 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.h b/drivers/gpu/drm/exynos/exynos_drm_drv.h
index 0d19aaf..b83d487 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.h
@@ -53,21 +53,12 @@ enum exynos_drm_output_type {
  *	- the unit is screen coordinates.
  * @src_width: width of a partial image to be displayed from framebuffer.
  * @src_height: height of a partial image to be displayed from framebuffer.
- * @fb_width: width of a framebuffer.
- * @fb_height: height of a framebuffer.
  * @crtc_x: offset x on hardware screen.
  * @crtc_y: offset y on hardware screen.
  * @crtc_width: window width to be displayed (hardware screen).
  * @crtc_height: window height to be displayed (hardware screen).
- * @mode_width: width of screen mode.
- * @mode_height: height of screen mode.
  * @h_ratio: horizontal scaling ratio, 16.16 fixed point
  * @v_ratio: vertical scaling ratio, 16.16 fixed point
- * @refresh: refresh rate.
- * @scan_flag: interlace or progressive way.
- *	(it could be DRM_MODE_FLAG_*)
- * @bpp: pixel size.(in bit)
- * @pixel_format: fourcc pixel format of this overlay
  * @dma_addr: array of bus(accessed by dma) address to the memory region
  *	      allocated for a overlay.
  * @zpos: order of overlay layer(z position).
@@ -84,21 +75,12 @@ struct exynos_drm_plane {
 	unsigned int src_y;
 	unsigned int src_width;
 	unsigned int src_height;
-	unsigned int fb_width;
-	unsigned int fb_height;
 	unsigned int crtc_x;
 	unsigned int crtc_y;
 	unsigned int crtc_width;
 	unsigned int crtc_height;
-	unsigned int mode_width;
-	unsigned int mode_height;
 	unsigned int h_ratio;
 	unsigned int v_ratio;
-	unsigned int refresh;
-	unsigned int scan_flag;
-	unsigned int bpp;
-	unsigned int pitch;
-	uint32_t pixel_format;
 	dma_addr_t dma_addr[MAX_FB_BUFFER];
 	unsigned int zpos;
 
-- 
2.1.0
