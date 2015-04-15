From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: [RFC 5/6] drm/exynos: mixer: use more general check for VP format
Date: Wed, 15 Apr 2015 17:01:59 +0200
Message-ID: <1429110120-7043-6-git-send-email-tjakobi@math.uni-bielefeld.de>
References: <1429110120-7043-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:56669 "EHLO
	smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1755663AbbDOPD6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 15 Apr 2015 11:03:58 -0400
In-Reply-To: <1429110120-7043-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, jy0922.shim@samsung.com, inki.dae@samsung.com, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>

The mixer itself can't handle 'video' formats like NV12 or
NV21. It needs the VP (video processor) for this task.

With the previous patch we ensure that DRM planes with
a NV12 format can only be created when this setup is
supported. Hence the check now reduces to checking the
pixel format (currently only NV12).

Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
---
 drivers/gpu/drm/exynos/exynos_mixer.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exynos/exynos_mixer.c
index 50df981..512f7b3 100644
--- a/drivers/gpu/drm/exynos/exynos_mixer.c
+++ b/drivers/gpu/drm/exynos/exynos_mixer.c
@@ -133,6 +133,16 @@ static const uint32_t vp_formats[] = {
 	DRM_FORMAT_NV12,
 };
 
+static inline bool is_vp_format(const struct mixer_context *ctx, unsigned int win)
+{
+	switch (ctx->planes[win].pixel_format) {
+	case DRM_FORMAT_NV12:
+		return true;
+	default:
+		return false;
+	}
+}
+
 static inline u32 vp_reg_read(struct mixer_resources *res, u32 reg_id)
 {
 	return readl(res->vp_regs + reg_id);
@@ -970,7 +980,7 @@ static void mixer_win_commit(struct exynos_drm_crtc *crtc, unsigned int win)
 	}
 	mutex_unlock(&mixer_ctx->mixer_mutex);
 
-	if (win > 1 && mixer_ctx->vp_enabled)
+	if (is_vp_format(mixer_ctx, win))
 		vp_video_buffer(mixer_ctx, win);
 	else
 		mixer_graph_buffer(mixer_ctx, win);
-- 
2.0.5
