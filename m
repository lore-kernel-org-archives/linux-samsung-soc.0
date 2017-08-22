From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: [PATCH v2 9/9] drm/exynos: simplify set_pixfmt() in DECON and FIMD drivers
Date: Tue, 22 Aug 2017 16:19:44 +0200
Message-ID: <20170822141944.8138-10-tjakobi@math.uni-bielefeld.de>
References: <20170822141944.8138-1-tjakobi@math.uni-bielefeld.de>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:55889 "EHLO
        smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S932513AbdHVOYy (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 22 Aug 2017 10:24:54 -0400
In-Reply-To: <20170822141944.8138-1-tjakobi@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, m.szyprowski@samsung.com, inki.dae@samsung.com, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>

DRM core already checks the validity of the pixelformat.

Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
---
 drivers/gpu/drm/exynos/exynos5433_drm_decon.c | 4 +---
 drivers/gpu/drm/exynos/exynos7_drm_decon.c    | 7 +------
 drivers/gpu/drm/exynos/exynos_drm_fimd.c      | 8 +-------
 3 files changed, 3 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
index 66ceca0af2a0..3dfba34be24d 100644
--- a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
+++ b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
@@ -277,13 +277,11 @@ static void decon_win_set_pixfmt(struct decon_context *ctx, unsigned int win,
 		val |= WINCONx_BURSTLEN_16WORD;
 		break;
 	case DRM_FORMAT_ARGB8888:
+	default:
 		val |= WINCONx_BPPMODE_32BPP_A8888;
 		val |= WINCONx_WSWP_F | WINCONx_BLD_PIX_F | WINCONx_ALPHA_SEL_F;
 		val |= WINCONx_BURSTLEN_16WORD;
 		break;
-	default:
-		DRM_ERROR("Proper pixel format is not set\n");
-		return;
 	}
 
 	DRM_DEBUG_KMS("cpp = %u\n", fb->format->cpp[0]);
diff --git a/drivers/gpu/drm/exynos/exynos7_drm_decon.c b/drivers/gpu/drm/exynos/exynos7_drm_decon.c
index 4662d55ed988..615efcf7782a 100644
--- a/drivers/gpu/drm/exynos/exynos7_drm_decon.c
+++ b/drivers/gpu/drm/exynos/exynos7_drm_decon.c
@@ -309,16 +309,11 @@ static void decon_win_set_pixfmt(struct decon_context *ctx, unsigned int win,
 		val |= WINCONx_BURSTLEN_16WORD;
 		break;
 	case DRM_FORMAT_BGRA8888:
+	default:
 		val |= WINCONx_BPPMODE_32BPP_BGRA | WINCONx_BLD_PIX |
 			WINCONx_ALPHA_SEL;
 		val |= WINCONx_BURSTLEN_16WORD;
 		break;
-	default:
-		DRM_DEBUG_KMS("invalid pixel size so using unpacked 24bpp.\n");
-
-		val |= WINCONx_BPPMODE_24BPP_xRGB;
-		val |= WINCONx_BURSTLEN_16WORD;
-		break;
 	}
 
 	DRM_DEBUG_KMS("cpp = %d\n", fb->format->cpp[0]);
diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
index 9b83d1846589..91c62e7afdd5 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
@@ -583,18 +583,12 @@ static void fimd_win_set_pixfmt(struct fimd_context *ctx, unsigned int win,
 		val |= WINCONx_BURSTLEN_16WORD;
 		break;
 	case DRM_FORMAT_ARGB8888:
+	default:
 		val |= WINCON1_BPPMODE_25BPP_A1888
 			| WINCON1_BLD_PIX | WINCON1_ALPHA_SEL;
 		val |= WINCONx_WSWP;
 		val |= WINCONx_BURSTLEN_16WORD;
 		break;
-	default:
-		DRM_DEBUG_KMS("invalid pixel size so using unpacked 24bpp.\n");
-
-		val |= WINCON0_BPPMODE_24BPP_888;
-		val |= WINCONx_WSWP;
-		val |= WINCONx_BURSTLEN_16WORD;
-		break;
 	}
 
 	/*
-- 
2.13.0
