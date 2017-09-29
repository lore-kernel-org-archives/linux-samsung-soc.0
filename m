From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH v2 03/11] drm/exynos/mixer: move resolution configuration to
 single function
Date: Fri, 29 Sep 2017 12:05:34 +0200
Message-ID: <20170929100542.12849-4-a.hajda@samsung.com>
References: <20170929100542.12849-1-a.hajda@samsung.com>
        <CGME20170929100546eucas1p2b1f4313dc1f769609b10b310c2185786@eucas1p2.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:42636 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751831AbdI2KFu (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 29 Sep 2017 06:05:50 -0400
In-reply-to: <20170929100542.12849-1-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: Andrzej Hajda <a.hajda@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Daniel Drake <drake@endlessm.com>

Screen resolution configuration depends on HW version, let's put it into
single function to make it consistent and simplify the code.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
Reviewed-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
---
 drivers/gpu/drm/exynos/exynos_mixer.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exynos/exynos_mixer.c
index ae89e53186ee..a87f60bbf2c2 100644
--- a/drivers/gpu/drm/exynos/exynos_mixer.c
+++ b/drivers/gpu/drm/exynos/exynos_mixer.c
@@ -367,7 +367,7 @@ static void mixer_vsync_set_update(struct mixer_context *ctx, bool enable)
 			VP_SHADOW_UPDATE_ENABLE : 0);
 }
 
-static void mixer_cfg_scan(struct mixer_context *ctx, unsigned int height)
+static void mixer_cfg_scan(struct mixer_context *ctx, int width, int height)
 {
 	struct mixer_resources *res = &ctx->mixer_res;
 	u32 val;
@@ -376,7 +376,11 @@ static void mixer_cfg_scan(struct mixer_context *ctx, unsigned int height)
 	val = test_bit(MXR_BIT_INTERLACE, &ctx->flags) ?
 		MXR_CFG_SCAN_INTERLACE : MXR_CFG_SCAN_PROGRESSIVE;
 
-	if (ctx->mxr_ver != MXR_VER_128_0_0_184) {
+	/* setup display size */
+	if (ctx->mxr_ver == MXR_VER_128_0_0_184) {
+		mixer_reg_write(&ctx->mixer_res, MXR_RESOLUTION,
+			MXR_MXR_RES_HEIGHT(height) | MXR_MXR_RES_WIDTH(width));
+	} else {
 		/* choosing between proper HD and SD mode */
 		if (height <= 480)
 			val |= MXR_CFG_SCAN_NTSC | MXR_CFG_SCAN_SD;
@@ -482,14 +486,7 @@ static void mixer_commit(struct mixer_context *ctx)
 	else
 		__clear_bit(MXR_BIT_INTERLACE, &ctx->flags);
 
-	/* setup display size */
-	if (ctx->mxr_ver == MXR_VER_128_0_0_184) {
-		u32 val  = MXR_MXR_RES_HEIGHT(mode->vdisplay)
-			 | MXR_MXR_RES_WIDTH(mode->hdisplay);
-		mixer_reg_write(&ctx->mixer_res, MXR_RESOLUTION, val);
-	}
-
-	mixer_cfg_scan(ctx, mode->vdisplay);
+	mixer_cfg_scan(ctx, mode->hdisplay, mode->vdisplay);
 	mixer_cfg_rgb_fmt(ctx, mode->vdisplay);
 	mixer_run(ctx);
 }
-- 
2.14.1
