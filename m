From: Inki Dae <inki.dae@samsung.com>
Subject: [PATCH v3] drm/exynos: add pm_runtime to DECON 7
Date: Thu, 26 Nov 2015 20:53:50 +0900
Message-ID: <1448538834-26378-1-git-send-email-inki.dae@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:53024 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750755AbbKZLx5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 26 Nov 2015 06:53:57 -0500
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0NYF029G77PVJ2E0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 26 Nov 2015 20:53:55 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org
Cc: airlied@linux.ie, linux-samsung-soc@vger.kernel.org, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, Inki Dae <inki.dae@samsung.com>

From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>

Let pm_runtime handle the enabling/disabling of the device with
proper refcnt instead of rely on specific flags to track the enabled
state.

Changelog v3:
- revive suspended to keep current dpms mode

Changelog v2:
- Modify CONFIG_PM_SLEEP -> CONFIG_PM

Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
Signed-off-by: Inki Dae <inki.dae@samsung.com>
---
 drivers/gpu/drm/exynos/exynos7_drm_decon.c | 93 ++++++++++++++++++------------
 1 file changed, 55 insertions(+), 38 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos7_drm_decon.c b/drivers/gpu/drm/exynos/exynos7_drm_decon.c
index ead2b16..38d7762 100644
--- a/drivers/gpu/drm/exynos/exynos7_drm_decon.c
+++ b/drivers/gpu/drm/exynos/exynos7_drm_decon.c
@@ -119,13 +119,8 @@ static void decon_clear_channels(struct exynos_drm_crtc *crtc)
 	}
 
 	/* Wait for vsync, as disable channel takes effect at next vsync */
-	if (ch_enabled) {
-		unsigned int state = ctx->suspended;
-
-		ctx->suspended = 0;
+	if (ch_enabled)
 		decon_wait_for_vblank(ctx->crtc);
-		ctx->suspended = state;
-	}
 }
 
 static int decon_ctx_initialize(struct decon_context *ctx,
@@ -555,39 +550,12 @@ static void decon_init(struct decon_context *ctx)
 static void decon_enable(struct exynos_drm_crtc *crtc)
 {
 	struct decon_context *ctx = crtc->ctx;
-	int ret;
 
 	if (!ctx->suspended)
 		return;
 
-	ctx->suspended = false;
-
 	pm_runtime_get_sync(ctx->dev);
 
-	ret = clk_prepare_enable(ctx->pclk);
-	if (ret < 0) {
-		DRM_ERROR("Failed to prepare_enable the pclk [%d]\n", ret);
-		return;
-	}
-
-	ret = clk_prepare_enable(ctx->aclk);
-	if (ret < 0) {
-		DRM_ERROR("Failed to prepare_enable the aclk [%d]\n", ret);
-		return;
-	}
-
-	ret = clk_prepare_enable(ctx->eclk);
-	if  (ret < 0) {
-		DRM_ERROR("Failed to prepare_enable the eclk [%d]\n", ret);
-		return;
-	}
-
-	ret = clk_prepare_enable(ctx->vclk);
-	if  (ret < 0) {
-		DRM_ERROR("Failed to prepare_enable the vclk [%d]\n", ret);
-		return;
-	}
-
 	decon_init(ctx);
 
 	/* if vblank was enabled status, enable it again. */
@@ -595,6 +563,8 @@ static void decon_enable(struct exynos_drm_crtc *crtc)
 		decon_enable_vblank(ctx->crtc);
 
 	decon_commit(ctx->crtc);
+
+	ctx->suspended = false;
 }
 
 static void decon_disable(struct exynos_drm_crtc *crtc)
@@ -613,11 +583,6 @@ static void decon_disable(struct exynos_drm_crtc *crtc)
 	for (i = 0; i < WINDOWS_NR; i++)
 		decon_disable_plane(crtc, &ctx->planes[i]);
 
-	clk_disable_unprepare(ctx->vclk);
-	clk_disable_unprepare(ctx->eclk);
-	clk_disable_unprepare(ctx->aclk);
-	clk_disable_unprepare(ctx->pclk);
-
 	pm_runtime_put_sync(ctx->dev);
 
 	ctx->suspended = true;
@@ -843,11 +808,63 @@ static int decon_remove(struct platform_device *pdev)
 	return 0;
 }
 
+#ifdef CONFIG_PM
+static int exynos7_decon_suspend(struct device *dev)
+{
+	struct decon_context *ctx = dev_get_drvdata(dev);
+
+	clk_disable_unprepare(ctx->vclk);
+	clk_disable_unprepare(ctx->eclk);
+	clk_disable_unprepare(ctx->aclk);
+	clk_disable_unprepare(ctx->pclk);
+
+	return 0;
+}
+
+static int exynos7_decon_resume(struct device *dev)
+{
+	struct decon_context *ctx = dev_get_drvdata(dev);
+	int ret;
+
+	ret = clk_prepare_enable(ctx->pclk);
+	if (ret < 0) {
+		DRM_ERROR("Failed to prepare_enable the pclk [%d]\n", ret);
+		return ret;
+	}
+
+	ret = clk_prepare_enable(ctx->aclk);
+	if (ret < 0) {
+		DRM_ERROR("Failed to prepare_enable the aclk [%d]\n", ret);
+		return ret;
+	}
+
+	ret = clk_prepare_enable(ctx->eclk);
+	if  (ret < 0) {
+		DRM_ERROR("Failed to prepare_enable the eclk [%d]\n", ret);
+		return ret;
+	}
+
+	ret = clk_prepare_enable(ctx->vclk);
+	if  (ret < 0) {
+		DRM_ERROR("Failed to prepare_enable the vclk [%d]\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+#endif
+
+static const struct dev_pm_ops exynos7_decon_pm_ops = {
+	SET_RUNTIME_PM_OPS(exynos7_decon_suspend, exynos7_decon_resume,
+			   NULL)
+};
+
 struct platform_driver decon_driver = {
 	.probe		= decon_probe,
 	.remove		= decon_remove,
 	.driver		= {
 		.name	= "exynos-decon",
+		.pm	= &exynos7_decon_pm_ops,
 		.of_match_table = decon_driver_dt_match,
 	},
 };
-- 
1.9.1
