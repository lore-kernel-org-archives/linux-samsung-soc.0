From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 04/10] drm/exynos/mixer: fix mode validation code
Date: Wed, 06 Sep 2017 12:36:54 +0200
Message-ID: <1504694220-15818-5-git-send-email-a.hajda@samsung.com>
References: <1504694220-15818-1-git-send-email-a.hajda@samsung.com>
        <CGME20170906103729eucas1p1844077cd598fb44535719925f3279c6e@eucas1p1.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:35939 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753069AbdIFKhc (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 6 Sep 2017 06:37:32 -0400
In-reply-to: <1504694220-15818-1-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: Andrzej Hajda <a.hajda@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Daniel Drake <drake@endlessm.com>

Mode limitation checked in mixer driver affects only older HW.
Mixer in Exynos542x has no such limitations. While at it patch changes
validation callback to recently introduced mode_valid which is more
suitable for the check. Additionally little cleanup is performed.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_mixer.c | 24 +++++++++++-------------
 1 file changed, 11 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exynos/exynos_mixer.c
index a87f60b..d530c18 100644
--- a/drivers/gpu/drm/exynos/exynos_mixer.c
+++ b/drivers/gpu/drm/exynos/exynos_mixer.c
@@ -1040,26 +1040,24 @@ static void mixer_disable(struct exynos_drm_crtc *crtc)
 	clear_bit(MXR_BIT_POWERED, &ctx->flags);
 }
 
-/* Only valid for Mixer version 16.0.33.0 */
-static int mixer_atomic_check(struct exynos_drm_crtc *crtc,
-		       struct drm_crtc_state *state)
+static int mixer_mode_valid(struct exynos_drm_crtc *crtc,
+		const struct drm_display_mode *mode)
 {
-	struct drm_display_mode *mode = &state->adjusted_mode;
-	u32 w, h;
+	struct mixer_context *ctx = crtc->ctx;
+	u32 w = mode->hdisplay, h = mode->vdisplay;
 
-	w = mode->hdisplay;
-	h = mode->vdisplay;
+	DRM_DEBUG_KMS("xres=%d, yres=%d, refresh=%d, intl=%d\n", w, h,
+		mode->vrefresh, !!(mode->flags & DRM_MODE_FLAG_INTERLACE));
 
-	DRM_DEBUG_KMS("xres=%d, yres=%d, refresh=%d, intl=%d\n",
-		mode->hdisplay, mode->vdisplay, mode->vrefresh,
-		(mode->flags & DRM_MODE_FLAG_INTERLACE) ? 1 : 0);
+	if (ctx->mxr_ver == MXR_VER_128_0_0_184)
+		return MODE_OK;
 
 	if ((w >= 464 && w <= 720 && h >= 261 && h <= 576) ||
 		(w >= 1024 && w <= 1280 && h >= 576 && h <= 720) ||
 		(w >= 1664 && w <= 1920 && h >= 936 && h <= 1080))
-		return 0;
+		return MODE_OK;
 
-	return -EINVAL;
+	return MODE_BAD;
 }
 
 static const struct exynos_drm_crtc_ops mixer_crtc_ops = {
@@ -1071,7 +1069,7 @@ static const struct exynos_drm_crtc_ops mixer_crtc_ops = {
 	.update_plane		= mixer_update_plane,
 	.disable_plane		= mixer_disable_plane,
 	.atomic_flush		= mixer_atomic_flush,
-	.atomic_check		= mixer_atomic_check,
+	.mode_valid		= mixer_mode_valid,
 };
 
 static const struct mixer_drv_data exynos5420_mxr_drv_data = {
-- 
2.7.4
