From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 09/14] drm/exynos/vidi: embed display into private context
Date: Mon, 17 Nov 2014 09:54:22 +0100
Message-ID: <1416214467-6179-10-git-send-email-a.hajda@samsung.com>
References: <1416214467-6179-1-git-send-email-a.hajda@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:50260 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751668AbaKQIzL (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 17 Nov 2014 03:55:11 -0500
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0NF600GO5E8LBZ40@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 17 Nov 2014 08:57:57 +0000 (GMT)
In-reply-to: <1416214467-6179-1-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: Andrzej Hajda <a.hajda@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, "open list:DRM DRIVERS FOR E..." <dri-devel@lists.freedesktop.org>, "moderated list:ARM/S5P EXYNOS AR..." <linux-samsung-soc@vger.kernel.org>

exynos_drm_display is used by internal Exynos DRM framework for
representing encoder:connector pair. As it should be mapped 1:1 to vidi
private context it seems more reasonable to embed it directly in that context.
As a result further code simplification will be possible.
Moreover it will be possible to handle multiple vidi devices in the system.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_vidi.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_vidi.c b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
index f048a90..f58dd52 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_vidi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
@@ -47,6 +47,7 @@ struct vidi_win_data {
 
 struct vidi_context {
 	struct exynos_drm_manager	manager;
+	struct exynos_drm_display	display;
 	struct drm_device		*drm_dev;
 	struct drm_crtc			*crtc;
 	struct drm_encoder		*encoder;
@@ -554,11 +555,6 @@ static struct exynos_drm_display_ops vidi_display_ops = {
 	.create_connector = vidi_create_connector,
 };
 
-static struct exynos_drm_display vidi_display = {
-	.type = EXYNOS_DISPLAY_TYPE_VIDI,
-	.ops = &vidi_display_ops,
-};
-
 static int vidi_subdrv_probe(struct drm_device *drm_dev, struct device *dev)
 {
 	struct vidi_context *ctx = dev_get_drvdata(dev);
@@ -573,7 +569,7 @@ static int vidi_subdrv_probe(struct drm_device *drm_dev, struct device *dev)
 		return ret;
 	}
 
-	ret = exynos_drm_create_enc_conn(drm_dev, &vidi_display);
+	ret = exynos_drm_create_enc_conn(drm_dev, &ctx->display);
 	if (ret) {
 		crtc->funcs->destroy(crtc);
 		DRM_ERROR("failed to create encoder and connector.\n");
@@ -595,11 +591,13 @@ static int vidi_probe(struct platform_device *pdev)
 
 	ctx->manager.type = EXYNOS_DISPLAY_TYPE_VIDI;
 	ctx->manager.ops = &vidi_manager_ops;
+	ctx->display.type = EXYNOS_DISPLAY_TYPE_VIDI;
+	ctx->display.ops = &vidi_display_ops;
 	ctx->default_win = 0;
 
 	INIT_WORK(&ctx->work, vidi_fake_vblank_handler);
 
-	vidi_display.ctx = ctx;
+	ctx->display.ctx = ctx;
 
 	mutex_init(&ctx->lock);
 
-- 
1.9.1
