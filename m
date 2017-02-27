From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 2/2] drm/exynos: kill exynos_drm_private::pipe
Date: Mon, 27 Feb 2017 11:15:21 +0100
Message-ID: <1488190521-3946-2-git-send-email-a.hajda@samsung.com>
References: <1488190521-3946-1-git-send-email-a.hajda@samsung.com>
 <CGME20170227101526eucas1p211b35ca6a35483a0cb53179d09d962d9@eucas1p2.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:15044 "EHLO
        mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751668AbdB0KPb (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 27 Feb 2017 05:15:31 -0500
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OM1003Z435R2W00@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 27 Feb 2017 10:15:27 +0000 (GMT)
In-reply-to: <1488190521-3946-1-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>, dri-devel@lists.freedesktop.org
Cc: Andrzej Hajda <a.hajda@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org

The field duplicates drm_dev->mode_config.num_crtc.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 drivers/gpu/drm/exynos/exynos5433_drm_decon.c | 18 ++++--------------
 drivers/gpu/drm/exynos/exynos7_drm_decon.c    | 11 ++---------
 drivers/gpu/drm/exynos/exynos_drm_drv.h       |  3 ---
 drivers/gpu/drm/exynos/exynos_drm_fimd.c      |  9 ++-------
 drivers/gpu/drm/exynos/exynos_drm_vidi.c      |  4 +---
 drivers/gpu/drm/exynos/exynos_mixer.c         |  8 ++------
 6 files changed, 11 insertions(+), 42 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
index 1168fec..2cb7736 100644
--- a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
+++ b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
@@ -531,14 +531,13 @@ static int decon_bind(struct device *dev, struct device *master, void *data)
 {
 	struct decon_context *ctx = dev_get_drvdata(dev);
 	struct drm_device *drm_dev = data;
-	struct exynos_drm_private *priv = drm_dev->dev_private;
 	struct exynos_drm_plane *exynos_plane;
 	enum exynos_drm_output_type out_type;
 	unsigned int win;
 	int ret;
 
 	ctx->drm_dev = drm_dev;
-	ctx->pipe = priv->pipe++;
+	ctx->pipe = drm_dev->mode_config.num_crtc;
 
 	for (win = ctx->first_win; win < WINDOWS_NR; win++) {
 		int tmp = (win == ctx->first_win) ? 0 : win;
@@ -559,21 +558,12 @@ static int decon_bind(struct device *dev, struct device *master, void *data)
 						  : EXYNOS_DISPLAY_TYPE_LCD;
 	ctx->crtc = exynos_drm_crtc_create(drm_dev, &exynos_plane->base,
 			out_type, &decon_crtc_ops, ctx);
-	if (IS_ERR(ctx->crtc)) {
-		ret = PTR_ERR(ctx->crtc);
-		goto err;
-	}
+	if (IS_ERR(ctx->crtc))
+		return PTR_ERR(ctx->crtc);
 
 	decon_clear_channels(ctx->crtc);
 
-	ret = drm_iommu_attach_device(drm_dev, dev);
-	if (ret)
-		goto err;
-
-	return ret;
-err:
-	priv->pipe--;
-	return ret;
+	return drm_iommu_attach_device(drm_dev, dev);
 }
 
 static void decon_unbind(struct device *dev, struct device *master, void *data)
diff --git a/drivers/gpu/drm/exynos/exynos7_drm_decon.c b/drivers/gpu/drm/exynos/exynos7_drm_decon.c
index 0ccb334..206e779 100644
--- a/drivers/gpu/drm/exynos/exynos7_drm_decon.c
+++ b/drivers/gpu/drm/exynos/exynos7_drm_decon.c
@@ -130,19 +130,12 @@ static void decon_clear_channels(struct exynos_drm_crtc *crtc)
 static int decon_ctx_initialize(struct decon_context *ctx,
 			struct drm_device *drm_dev)
 {
-	struct exynos_drm_private *priv = drm_dev->dev_private;
-	int ret;
-
 	ctx->drm_dev = drm_dev;
-	ctx->pipe = priv->pipe++;
+	ctx->pipe = drm_dev->mode_config.num_crtc;
 
 	decon_clear_channels(ctx->crtc);
 
-	ret = drm_iommu_attach_device(drm_dev, ctx->dev);
-	if (ret)
-		priv->pipe--;
-
-	return ret;
+	return drm_iommu_attach_device(drm_dev, ctx->dev);
 }
 
 static void decon_ctx_remove(struct decon_context *ctx)
diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.h b/drivers/gpu/drm/exynos/exynos_drm_drv.h
index d819d0c..c12b390 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.h
@@ -195,7 +195,6 @@ struct drm_exynos_file_private {
  *	otherwise default one.
  * @da_space_size: size of device address space.
  *	if 0 then default value is used for it.
- * @pipe: the pipe number for this crtc/manager.
  * @pending: the crtcs that have pending updates to finish
  * @lock: protect access to @pending
  * @wait: wait an atomic commit to finish
@@ -206,8 +205,6 @@ struct exynos_drm_private {
 	struct device *dma_dev;
 	void *mapping;
 
-	unsigned int pipe;
-
 	/* for atomic commit */
 	u32			pending;
 	spinlock_t		lock;
diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
index dc736c2..df4dc34 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
@@ -996,13 +996,12 @@ static int fimd_bind(struct device *dev, struct device *master, void *data)
 {
 	struct fimd_context *ctx = dev_get_drvdata(dev);
 	struct drm_device *drm_dev = data;
-	struct exynos_drm_private *priv = drm_dev->dev_private;
 	struct exynos_drm_plane *exynos_plane;
 	unsigned int i;
 	int ret;
 
 	ctx->drm_dev = drm_dev;
-	ctx->pipe = priv->pipe++;
+	ctx->pipe = drm_dev->mode_config.num_crtc;
 
 	for (i = 0; i < WINDOWS_NR; i++) {
 		ctx->configs[i].pixel_formats = fimd_formats;
@@ -1032,11 +1031,7 @@ static int fimd_bind(struct device *dev, struct device *master, void *data)
 	if (is_drm_iommu_supported(drm_dev))
 		fimd_clear_channels(ctx->crtc);
 
-	ret = drm_iommu_attach_device(drm_dev, dev);
-	if (ret)
-		priv->pipe--;
-
-	return ret;
+	return drm_iommu_attach_device(drm_dev, dev);
 }
 
 static void fimd_unbind(struct device *dev, struct device *master,
diff --git a/drivers/gpu/drm/exynos/exynos_drm_vidi.c b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
index 67f365f..cb5e3c6 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_vidi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
@@ -156,10 +156,8 @@ static void vidi_disable(struct exynos_drm_crtc *crtc)
 static int vidi_ctx_initialize(struct vidi_context *ctx,
 			struct drm_device *drm_dev)
 {
-	struct exynos_drm_private *priv = drm_dev->dev_private;
-
 	ctx->drm_dev = drm_dev;
-	ctx->pipe = priv->pipe++;
+	ctx->pipe = drm_dev->mode_config.num_crtc;
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exynos/exynos_mixer.c
index 3fb8cf3..1474982 100644
--- a/drivers/gpu/drm/exynos/exynos_mixer.c
+++ b/drivers/gpu/drm/exynos/exynos_mixer.c
@@ -900,7 +900,7 @@ static int mixer_initialize(struct mixer_context *mixer_ctx,
 	priv = drm_dev->dev_private;
 
 	mixer_ctx->drm_dev = drm_dev;
-	mixer_ctx->pipe = priv->pipe++;
+	mixer_ctx->pipe = drm_dev->mode_config.num_crtc;
 
 	/* acquire resources: regs, irqs, clocks */
 	ret = mixer_resources_init(mixer_ctx);
@@ -918,11 +918,7 @@ static int mixer_initialize(struct mixer_context *mixer_ctx,
 		}
 	}
 
-	ret = drm_iommu_attach_device(drm_dev, mixer_ctx->dev);
-	if (ret)
-		priv->pipe--;
-
-	return ret;
+	return drm_iommu_attach_device(drm_dev, mixer_ctx->dev);
 }
 
 static void mixer_ctx_remove(struct mixer_context *mixer_ctx)
-- 
2.7.4
