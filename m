From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v3 6/7] drm/exynos: mixer: also allow ARGB1555 and ARGB4444
Date: Wed, 16 Dec 2015 13:21:47 +0100
Message-ID: <1450268508-15028-7-git-send-email-m.szyprowski@samsung.com>
References: <1450268508-15028-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:61908 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932862AbbLPMWR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 16 Dec 2015 07:22:17 -0500
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NZG00CUXAD3YN80@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 16 Dec 2015 12:22:15 +0000 (GMT)
In-reply-to: <1450268508-15028-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Gustavo Padovan <gustavo@padovan.org>

From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>

Allow the remaining alpha formats now that blending
is properly setup.

Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_mixer.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exynos/exynos_mixer.c
index ae7b122274ac..31a9a228744e 100644
--- a/drivers/gpu/drm/exynos/exynos_mixer.c
+++ b/drivers/gpu/drm/exynos/exynos_mixer.c
@@ -76,7 +76,9 @@ enum mixer_flag_bits {
 
 static const uint32_t mixer_formats[] = {
 	DRM_FORMAT_XRGB4444,
+	DRM_FORMAT_ARGB4444,
 	DRM_FORMAT_XRGB1555,
+	DRM_FORMAT_ARGB1555,
 	DRM_FORMAT_RGB565,
 	DRM_FORMAT_XRGB8888,
 	DRM_FORMAT_ARGB8888,
@@ -169,6 +171,8 @@ static inline bool is_alpha_format(unsigned int pixel_format)
 {
 	switch (pixel_format) {
 	case DRM_FORMAT_ARGB8888:
+	case DRM_FORMAT_ARGB1555:
+	case DRM_FORMAT_ARGB4444:
 		return true;
 	default:
 		return false;
@@ -595,10 +599,12 @@ static void mixer_graph_buffer(struct mixer_context *ctx,
 
 	switch (fb->pixel_format) {
 	case DRM_FORMAT_XRGB4444:
+	case DRM_FORMAT_ARGB4444:
 		fmt = MXR_FORMAT_ARGB4444;
 		break;
 
 	case DRM_FORMAT_XRGB1555:
+	case DRM_FORMAT_ARGB1555:
 		fmt = MXR_FORMAT_ARGB1555;
 		break;
 
-- 
1.9.2
