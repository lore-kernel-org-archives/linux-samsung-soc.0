From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 20/25] drm/exynos: gem: set default alignment for dumb GEM
 buffers
Date: Tue, 10 Nov 2015 14:23:36 +0100
Message-ID: <1447161821-1877-21-git-send-email-m.szyprowski@samsung.com>
References: <1447161821-1877-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:55191 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753105AbbKJNY7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 10 Nov 2015 08:24:59 -0500
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NXL007KOP9LNFA0@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 10 Nov 2015 13:24:57 +0000 (GMT)
In-reply-to: <1447161821-1877-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Gustavo Padovan <gustavo@padovan.org>, Javier Martinez Canillas <javier@osg.samsung.com>

This patch forces all GEM buffers to have pitch aligned at least to 8
pixels. This is a common requirement for various Exynos IPP blocks,
which otherwise won't be able to operate on buffers of random size.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_drv.h | 2 ++
 drivers/gpu/drm/exynos/exynos_drm_gem.c | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.h b/drivers/gpu/drm/exynos/exynos_drm_drv.h
index 9ed52b04c0ba..0890e6709f10 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.h
@@ -24,6 +24,8 @@
 
 #define DEFAULT_WIN	0
 
+#define EXYNOS_DRM_PITCH_ALIGN	8
+
 #define EXYNOS_BAD_PIXEL_FORMAT 0xffffffffu
 
 #define to_exynos_crtc(x)	container_of(x, struct exynos_drm_crtc, base)
diff --git a/drivers/gpu/drm/exynos/exynos_drm_gem.c b/drivers/gpu/drm/exynos/exynos_drm_gem.c
index 252eb301470c..b5db6e6cc043 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_gem.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_gem.c
@@ -417,7 +417,7 @@ int exynos_drm_gem_dumb_create(struct drm_file *file_priv,
 	 *	with DRM_IOCTL_MODE_CREATE_DUMB command.
 	 */
 
-	args->pitch = args->width * ((args->bpp + 7) / 8);
+	args->pitch = roundup(args->width, EXYNOS_DRM_PITCH_ALIGN) * ((args->bpp + 7) / 8);
 	args->size = args->pitch * args->height;
 
 	if (is_drm_iommu_supported(dev))
-- 
1.9.2
