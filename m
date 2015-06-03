From: Gustavo Padovan <gustavo@padovan.org>
Subject: [PATCH 1/9] drm/exynos: add error messages if clks failed to get enabled
Date: Wed,  3 Jun 2015 11:30:24 -0300
Message-ID: <1433341832-2686-1-git-send-email-gustavo@padovan.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yh0-f48.google.com ([209.85.213.48]:35285 "EHLO
	mail-yh0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753399AbbFCOak (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 3 Jun 2015 10:30:40 -0400
Received: by yhda23 with SMTP id a23so2210671yhd.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 03 Jun 2015 07:30:39 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, inki.dae@samsung.com, jy0922.shim@samsung.com, tjakobi@math.uni-bielefeld.de, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>

Check error and call DRM_ERROR if clk_prepare_enable() fails.

Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
---
 drivers/gpu/drm/exynos/exynos7_drm_decon.c | 29 ++++++++++++++++++++++++----
 drivers/gpu/drm/exynos/exynos_drm_fimd.c   | 14 ++++++++++++--
 drivers/gpu/drm/exynos/exynos_mixer.c      | 31 +++++++++++++++++++++++++-----
 3 files changed, 63 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos7_drm_decon.c b/drivers/gpu/drm/exynos/exynos7_drm_decon.c
index d659ba2..ffd7c3b 100644
--- a/drivers/gpu/drm/exynos/exynos7_drm_decon.c
+++ b/drivers/gpu/drm/exynos/exynos7_drm_decon.c
@@ -606,6 +606,7 @@ static void decon_init(struct decon_context *ctx)
 static void decon_enable(struct exynos_drm_crtc *crtc)
 {
 	struct decon_context *ctx = crtc->ctx;
+	int ret;
 
 	if (!ctx->suspended)
 		return;
@@ -614,10 +615,30 @@ static void decon_enable(struct exynos_drm_crtc *crtc)
 
 	pm_runtime_get_sync(ctx->dev);
 
-	clk_prepare_enable(ctx->pclk);
-	clk_prepare_enable(ctx->aclk);
-	clk_prepare_enable(ctx->eclk);
-	clk_prepare_enable(ctx->vclk);
+	ret = clk_prepare_enable(ctx->pclk);
+	if (ret < 0) {
+		DRM_ERROR("Failed to prepare_enable the pclk [%d]\n", ret);
+		return;
+		goto pclk_err;
+	}
+
+	ret = clk_prepare_enable(ctx->aclk);
+	if (ret < 0) {
+		DRM_ERROR("Failed to prepare_enable the aclk [%d]\n", ret);
+		return;
+	}
+
+	ret = clk_prepare_enable(ctx->eclk);
+	if  (ret < 0) {
+		DRM_ERROR("Failed to prepare_enable the eclk [%d]\n", ret);
+		return;
+	}
+
+	ret = clk_prepare_enable(ctx->vclk);
+	if  (ret < 0) {
+		DRM_ERROR("Failed to prepare_enable the vclk [%d]\n", ret);
+		return;
+	}
 
 	decon_init(ctx);
 
diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
index 9661853..7c8ba61 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
@@ -808,6 +808,7 @@ static void fimd_apply(struct fimd_context *ctx)
 static void fimd_enable(struct exynos_drm_crtc *crtc)
 {
 	struct fimd_context *ctx = crtc->ctx;
+	int ret;
 
 	if (!ctx->suspended)
 		return;
@@ -816,8 +817,17 @@ static void fimd_enable(struct exynos_drm_crtc *crtc)
 
 	pm_runtime_get_sync(ctx->dev);
 
-	clk_prepare_enable(ctx->bus_clk);
-	clk_prepare_enable(ctx->lcd_clk);
+	ret = clk_prepare_enable(ctx->bus_clk);
+	if (ret < 0) {
+		DRM_ERROR("Failed to prepare_enable the bus clk [%d]\n", ret);
+		return;
+	}
+
+	ret = clk_prepare_enable(ctx->lcd_clk);
+	if  (ret < 0) {
+		DRM_ERROR("Failed to prepare_enable the lcd clk [%d]\n", ret);
+		return;
+	}
 
 	/* if vblank was enabled status, enable it again. */
 	if (test_and_clear_bit(0, &ctx->irq_flags))
diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exynos/exynos_mixer.c
index 6bab717..1b77fc7 100644
--- a/drivers/gpu/drm/exynos/exynos_mixer.c
+++ b/drivers/gpu/drm/exynos/exynos_mixer.c
@@ -1031,6 +1031,7 @@ static void mixer_enable(struct exynos_drm_crtc *crtc)
 {
 	struct mixer_context *ctx = crtc->ctx;
 	struct mixer_resources *res = &ctx->mixer_res;
+	int ret;
 
 	mutex_lock(&ctx->mixer_mutex);
 	if (ctx->powered) {
@@ -1042,12 +1043,32 @@ static void mixer_enable(struct exynos_drm_crtc *crtc)
 
 	pm_runtime_get_sync(ctx->dev);
 
-	clk_prepare_enable(res->mixer);
-	clk_prepare_enable(res->hdmi);
+	ret = clk_prepare_enable(res->mixer);
+	if (ret < 0) {
+		DRM_ERROR("Failed to prepare_enable the mixer clk [%d]\n", ret);
+		return;
+	}
+	ret = clk_prepare_enable(res->hdmi);
+	if (ret < 0) {
+		DRM_ERROR("Failed to prepare_enable the hdmi clk [%d]\n", ret);
+		return;
+	}
 	if (ctx->vp_enabled) {
-		clk_prepare_enable(res->vp);
-		if (ctx->has_sclk)
-			clk_prepare_enable(res->sclk_mixer);
+		ret = clk_prepare_enable(res->vp);
+		if (ret < 0) {
+			DRM_ERROR("Failed to prepare_enable the vp clk [%d]\n",
+				  ret);
+			return;
+		}
+		if (ctx->has_sclk) {
+			ret = clk_prepare_enable(res->sclk_mixer);
+			if (ret < 0) {
+				DRM_ERROR("Failed to prepare_enable the " \
+					   "sclk_mixer clk [%d]\n",
+					  ret);
+				return;
+			}
+		}
 	}
 
 	mutex_lock(&ctx->mixer_mutex);
-- 
2.1.0
