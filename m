From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: [PATCH 2/2] exynos: remove DRM_EXYNOS_GEM_{MAP_OFFSET/MMAP} ioctls
Date: Fri, 16 Jan 2015 23:57:34 +0100
Message-ID: <1421449054-2808-3-git-send-email-tjakobi@math.uni-bielefeld.de>
References: <1421449054-2808-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:49763 "EHLO
	smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1750983AbbAPW6D (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 16 Jan 2015 17:58:03 -0500
In-Reply-To: <1421449054-2808-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org
Cc: linux-samsung-soc@vger.kernel.org, Hyungwon Hwang <human.hwang@samsung.com>, Inki Dae <inki.dae@samsung.com>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>

From: Hyungwon Hwang <human.hwang@samsung.com>

This patch removes the ioctls which are removed from the linux kernel.

Signed-off-by: Hyungwon Hwang <human.hwang@samsung.com>
Signed-off-by: Inki Dae <inki.dae@samsung.com>
Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
---
 exynos/exynos_drm.h | 40 ----------------------------------------
 1 file changed, 40 deletions(-)

diff --git a/exynos/exynos_drm.h b/exynos/exynos_drm.h
index c3c6579..256c02f 100644
--- a/exynos/exynos_drm.h
+++ b/exynos/exynos_drm.h
@@ -47,38 +47,6 @@ struct drm_exynos_gem_create {
 };
 
 /**
- * A structure for getting buffer offset.
- *
- * @handle: a pointer to gem object created.
- * @pad: just padding to be 64-bit aligned.
- * @offset: relatived offset value of the memory region allocated.
- *	- this value should be set by user.
- */
-struct drm_exynos_gem_map_off {
-	unsigned int handle;
-	unsigned int pad;
-	uint64_t offset;
-};
-
-/**
- * A structure for mapping buffer.
- *
- * @handle: a handle to gem object created.
- * @pad: just padding to be 64-bit aligned.
- * @size: memory size to be mapped.
- * @mapped: having user virtual address mmaped.
- *	- this variable would be filled by exynos gem module
- *	of kernel side with user virtual address which is allocated
- *	by do_mmap().
- */
-struct drm_exynos_gem_mmap {
-	unsigned int handle;
-	unsigned int pad;
-	uint64_t size;
-	uint64_t mapped;
-};
-
-/**
  * A structure to gem information.
  *
  * @handle: a handle to gem object created.
@@ -164,8 +132,6 @@ struct drm_exynos_g2d_exec {
 };
 
 #define DRM_EXYNOS_GEM_CREATE		0x00
-#define DRM_EXYNOS_GEM_MAP_OFFSET	0x01
-#define DRM_EXYNOS_GEM_MMAP		0x02
 /* Reserved 0x04 ~ 0x05 for exynos specific gem ioctl */
 #define DRM_EXYNOS_GEM_GET		0x04
 #define DRM_EXYNOS_VIDI_CONNECTION	0x07
@@ -178,12 +144,6 @@ struct drm_exynos_g2d_exec {
 #define DRM_IOCTL_EXYNOS_GEM_CREATE		DRM_IOWR(DRM_COMMAND_BASE + \
 		DRM_EXYNOS_GEM_CREATE, struct drm_exynos_gem_create)
 
-#define DRM_IOCTL_EXYNOS_GEM_MAP_OFFSET	DRM_IOWR(DRM_COMMAND_BASE + \
-		DRM_EXYNOS_GEM_MAP_OFFSET, struct drm_exynos_gem_map_off)
-
-#define DRM_IOCTL_EXYNOS_GEM_MMAP	DRM_IOWR(DRM_COMMAND_BASE + \
-		DRM_EXYNOS_GEM_MMAP, struct drm_exynos_gem_mmap)
-
 #define DRM_IOCTL_EXYNOS_GEM_GET	DRM_IOWR(DRM_COMMAND_BASE + \
 		DRM_EXYNOS_GEM_GET,	struct drm_exynos_gem_info)
 
-- 
2.0.5
