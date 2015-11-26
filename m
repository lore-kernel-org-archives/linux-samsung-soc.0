From: Inki Dae <inki.dae@samsung.com>
Subject: [PATCH v3] drm/exynos: add pm_runtime to Mixer
Date: Thu, 26 Nov 2015 20:53:54 +0900
Message-ID: <1448538834-26378-5-git-send-email-inki.dae@samsung.com>
References: <1448538834-26378-1-git-send-email-inki.dae@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:46284 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750943AbbKZLx7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 26 Nov 2015 06:53:59 -0500
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0NYF02H367PX0420@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 26 Nov 2015 20:53:57 +0900 (KST)
In-reply-to: <1448538834-26378-1-git-send-email-inki.dae@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org
Cc: airlied@linux.ie, linux-samsung-soc@vger.kernel.org, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, Inki Dae <inki.dae@samsung.com>

From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>

Let pm_runtime handle the enabling/disabling of the device with proper
refcnt instead of rely on specific flags to track the enabled state.

Changelog v3:
- revive MXR_BIT_POWERED flag to keep current dpms mode.

Changelog v2:
- no change

Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
Signed-off-by: Inki Dae <inki.dae@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_mixer.c | 106 ++++++++++++++++++++--------------
 1 file changed, 64 insertions(+), 42 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exynos/exynos_mixer.c
index d09f8f9..47777be 100644
--- a/drivers/gpu/drm/exynos/exynos_mixer.c
+++ b/drivers/gpu/drm/exynos/exynos_mixer.c
@@ -1020,43 +1020,12 @@ static void mixer_enable(struct exynos_drm_crtc *crtc)
 {
 	struct mixer_context *ctx = crtc->ctx;
 	struct mixer_resources *res = &ctx->mixer_res;
-	int ret;
 
 	if (test_bit(MXR_BIT_POWERED, &ctx->flags))
 		return;
 
 	pm_runtime_get_sync(ctx->dev);
 
-	ret = clk_prepare_enable(res->mixer);
-	if (ret < 0) {
-		DRM_ERROR("Failed to prepare_enable the mixer clk [%d]\n", ret);
-		return;
-	}
-	ret = clk_prepare_enable(res->hdmi);
-	if (ret < 0) {
-		DRM_ERROR("Failed to prepare_enable the hdmi clk [%d]\n", ret);
-		return;
-	}
-	if (ctx->vp_enabled) {
-		ret = clk_prepare_enable(res->vp);
-		if (ret < 0) {
-			DRM_ERROR("Failed to prepare_enable the vp clk [%d]\n",
-				  ret);
-			return;
-		}
-		if (ctx->has_sclk) {
-			ret = clk_prepare_enable(res->sclk_mixer);
-			if (ret < 0) {
-				DRM_ERROR("Failed to prepare_enable the " \
-					   "sclk_mixer clk [%d]\n",
-					  ret);
-				return;
-			}
-		}
-	}
-
-	set_bit(MXR_BIT_POWERED, &ctx->flags);
-
 	mixer_reg_writemask(res, MXR_STATUS, ~0, MXR_STATUS_SOFT_RESET);
 
 	if (test_bit(MXR_BIT_VSYNC, &ctx->flags)) {
@@ -1064,12 +1033,13 @@ static void mixer_enable(struct exynos_drm_crtc *crtc)
 		mixer_reg_writemask(res, MXR_INT_EN, ~0, MXR_INT_EN_VSYNC);
 	}
 	mixer_win_reset(ctx);
+
+	set_bit(MXR_BIT_POWERED, &ctx->flags);
 }
 
 static void mixer_disable(struct exynos_drm_crtc *crtc)
 {
 	struct mixer_context *ctx = crtc->ctx;
-	struct mixer_resources *res = &ctx->mixer_res;
 	int i;
 
 	if (!test_bit(MXR_BIT_POWERED, &ctx->flags))
@@ -1081,17 +1051,9 @@ static void mixer_disable(struct exynos_drm_crtc *crtc)
 	for (i = 0; i < MIXER_WIN_NR; i++)
 		mixer_disable_plane(crtc, &ctx->planes[i]);
 
-	clear_bit(MXR_BIT_POWERED, &ctx->flags);
+	pm_runtime_put(ctx->dev);
 
-	clk_disable_unprepare(res->hdmi);
-	clk_disable_unprepare(res->mixer);
-	if (ctx->vp_enabled) {
-		clk_disable_unprepare(res->vp);
-		if (ctx->has_sclk)
-			clk_disable_unprepare(res->sclk_mixer);
-	}
-
-	pm_runtime_put_sync(ctx->dev);
+	clear_bit(MXR_BIT_POWERED, &ctx->flags);
 }
 
 /* Only valid for Mixer version 16.0.33.0 */
@@ -1293,10 +1255,70 @@ static int mixer_remove(struct platform_device *pdev)
 	return 0;
 }
 
+#ifdef CONFIG_PM_SLEEP
+static int exynos_mixer_suspend(struct device *dev)
+{
+	struct mixer_context *ctx = dev_get_drvdata(dev);
+	struct mixer_resources *res = &ctx->mixer_res;
+
+	clk_disable_unprepare(res->hdmi);
+	clk_disable_unprepare(res->mixer);
+	if (ctx->vp_enabled) {
+		clk_disable_unprepare(res->vp);
+		if (ctx->has_sclk)
+			clk_disable_unprepare(res->sclk_mixer);
+	}
+
+	return 0;
+}
+
+static int exynos_mixer_resume(struct device *dev)
+{
+	struct mixer_context *ctx = dev_get_drvdata(dev);
+	struct mixer_resources *res = &ctx->mixer_res;
+	int ret;
+
+	ret = clk_prepare_enable(res->mixer);
+	if (ret < 0) {
+		DRM_ERROR("Failed to prepare_enable the mixer clk [%d]\n", ret);
+		return ret;
+	}
+	ret = clk_prepare_enable(res->hdmi);
+	if (ret < 0) {
+		DRM_ERROR("Failed to prepare_enable the hdmi clk [%d]\n", ret);
+		return ret;
+	}
+	if (ctx->vp_enabled) {
+		ret = clk_prepare_enable(res->vp);
+		if (ret < 0) {
+			DRM_ERROR("Failed to prepare_enable the vp clk [%d]\n",
+				  ret);
+			return ret;
+		}
+		if (ctx->has_sclk) {
+			ret = clk_prepare_enable(res->sclk_mixer);
+			if (ret < 0) {
+				DRM_ERROR("Failed to prepare_enable the " \
+					   "sclk_mixer clk [%d]\n",
+					  ret);
+				return ret;
+			}
+		}
+	}
+
+	return 0;
+}
+#endif
+
+static const struct dev_pm_ops exynos_mixer_pm_ops = {
+	SET_RUNTIME_PM_OPS(exynos_mixer_suspend, exynos_mixer_resume, NULL)
+};
+
 struct platform_driver mixer_driver = {
 	.driver = {
 		.name = "exynos-mixer",
 		.owner = THIS_MODULE,
+		.pm = &exynos_mixer_pm_ops,
 		.of_match_table = mixer_match_types,
 	},
 	.probe = mixer_probe,
-- 
1.9.1
