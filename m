From: Gustavo Padovan <gustavo@padovan.org>
Subject: [PATCH 5/6] drm/exynos: remove drm_dev from struct exynos_drm_manager
Date: Wed, 26 Nov 2014 19:09:04 -0200
Message-ID: <1417036145-11017-6-git-send-email-gustavo@padovan.org>
References: <1417036145-11017-1-git-send-email-gustavo@padovan.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qa0-f49.google.com ([209.85.216.49]:45931 "EHLO
	mail-qa0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751028AbaKZVJb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 26 Nov 2014 16:09:31 -0500
Received: by mail-qa0-f49.google.com with SMTP id s7so2441019qap.8
        for <linux-samsung-soc@vger.kernel.org>; Wed, 26 Nov 2014 13:09:30 -0800 (PST)
In-Reply-To: <1417036145-11017-1-git-send-email-gustavo@padovan.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, inki.dae@samsung.com, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>

manager-drm_dev is only accessed by exynos_drm_crtc_create() so this patch
pass drm_dev as argument on exynos_drm_crtc_create() and remove it from
struct exynos_drm_manager.

Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
---
 drivers/gpu/drm/exynos/exynos_drm_crtc.c | 9 +++++----
 drivers/gpu/drm/exynos/exynos_drm_crtc.h | 3 ++-
 drivers/gpu/drm/exynos/exynos_drm_drv.h  | 1 -
 drivers/gpu/drm/exynos/exynos_drm_fimd.c | 4 ++--
 drivers/gpu/drm/exynos/exynos_drm_vidi.c | 4 ++--
 drivers/gpu/drm/exynos/exynos_mixer.c    | 4 ++--
 6 files changed, 13 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_crtc.c b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
index 224b9af..1eb5750 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_crtc.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
@@ -299,12 +299,13 @@ static void exynos_drm_crtc_attach_mode_property(struct drm_crtc *crtc)
 	drm_object_attach_property(&crtc->base, prop, 0);
 }
 
-int exynos_drm_crtc_create(struct exynos_drm_manager *manager, int pipe,
+int exynos_drm_crtc_create(struct exynos_drm_manager *manager,
+			   struct drm_device *drm_dev, int pipe,
 			   enum exynos_drm_output_type type)
 {
 	struct exynos_drm_crtc *exynos_crtc;
 	struct drm_plane *plane;
-	struct exynos_drm_private *private = manager->drm_dev->dev_private;
+	struct exynos_drm_private *private = drm_dev->dev_private;
 	struct drm_crtc *crtc;
 	int ret;
 
@@ -319,7 +320,7 @@ int exynos_drm_crtc_create(struct exynos_drm_manager *manager, int pipe,
 	exynos_crtc->manager = manager;
 	exynos_crtc->pipe = pipe;
 	exynos_crtc->type = type;
-	plane = exynos_plane_init(manager->drm_dev, 1 << pipe,
+	plane = exynos_plane_init(drm_dev, 1 << pipe,
 				  DRM_PLANE_TYPE_PRIMARY);
 	if (IS_ERR(plane)) {
 		ret = PTR_ERR(plane);
@@ -331,7 +332,7 @@ int exynos_drm_crtc_create(struct exynos_drm_manager *manager, int pipe,
 
 	private->crtc[pipe] = crtc;
 
-	ret = drm_crtc_init_with_planes(manager->drm_dev, crtc, plane, NULL,
+	ret = drm_crtc_init_with_planes(drm_dev, crtc, plane, NULL,
 					&exynos_crtc_funcs);
 	if (ret < 0)
 		goto err_crtc;
diff --git a/drivers/gpu/drm/exynos/exynos_drm_crtc.h b/drivers/gpu/drm/exynos/exynos_drm_crtc.h
index a705941..d7690e9 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_crtc.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_crtc.h
@@ -17,7 +17,8 @@
 
 #include "exynos_drm_drv.h"
 
-int exynos_drm_crtc_create(struct exynos_drm_manager *manager, int pipe,
+int exynos_drm_crtc_create(struct exynos_drm_manager *manager,
+			   struct drm_device *drm_dev, int pipe,
 			   enum exynos_drm_output_type type);
 int exynos_drm_crtc_enable_vblank(struct drm_device *dev, int pipe);
 void exynos_drm_crtc_disable_vblank(struct drm_device *dev, int pipe);
diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.h b/drivers/gpu/drm/exynos/exynos_drm_drv.h
index a3ae95f..2d801a8 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.h
@@ -211,7 +211,6 @@ struct exynos_drm_manager_ops {
  */
 struct exynos_drm_manager {
 	struct list_head list;
-	struct drm_device *drm_dev;
 	struct drm_crtc *crtc;
 	struct exynos_drm_manager_ops *ops;
 };
diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
index 55154a6..3713be7 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
@@ -299,7 +299,7 @@ static int fimd_mgr_initialize(struct exynos_drm_manager *mgr,
 	struct exynos_drm_private *priv;
 	priv = drm_dev->dev_private;
 
-	mgr->drm_dev = ctx->drm_dev = drm_dev;
+	ctx->drm_dev = drm_dev;
 	ctx->pipe = priv->pipe++;
 
 	/* attach this sub driver to iommu mapping if supported. */
@@ -1102,7 +1102,7 @@ static int fimd_bind(struct device *dev, struct device *master, void *data)
 	struct drm_device *drm_dev = data;
 
 	fimd_mgr_initialize(&ctx->manager, drm_dev);
-	exynos_drm_crtc_create(&ctx->manager, ctx->pipe,
+	exynos_drm_crtc_create(&ctx->manager, drm_dev, ctx->pipe,
 			       EXYNOS_DISPLAY_TYPE_LCD);
 	if (ctx->display)
 		exynos_drm_create_enc_conn(drm_dev, ctx->display);
diff --git a/drivers/gpu/drm/exynos/exynos_drm_vidi.c b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
index 3cee0fd..03687db 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_vidi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
@@ -301,7 +301,7 @@ static int vidi_mgr_initialize(struct exynos_drm_manager *mgr,
 	struct vidi_context *ctx = manager_to_vidi(mgr);
 	struct exynos_drm_private *priv = drm_dev->dev_private;
 
-	mgr->drm_dev = ctx->drm_dev = drm_dev;
+	ctx->drm_dev = drm_dev;
 	ctx->pipe = priv->pipe++;
 
 	return 0;
@@ -558,7 +558,7 @@ static int vidi_bind(struct device *dev, struct device *master, void *data)
 
 	vidi_mgr_initialize(&ctx->manager, drm_dev);
 
-	ret = exynos_drm_crtc_create(&ctx->manager, ctx->pipe,
+	ret = exynos_drm_crtc_create(&ctx->manager, drm_dev, ctx->pipe,
 				     EXYNOS_DISPLAY_TYPE_VIDI);
 	if (ret) {
 		DRM_ERROR("failed to create crtc.\n");
diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exynos/exynos_mixer.c
index 1167099..d8f2b6d 100644
--- a/drivers/gpu/drm/exynos/exynos_mixer.c
+++ b/drivers/gpu/drm/exynos/exynos_mixer.c
@@ -862,7 +862,7 @@ static int mixer_initialize(struct exynos_drm_manager *mgr,
 	struct exynos_drm_private *priv;
 	priv = drm_dev->dev_private;
 
-	mgr->drm_dev = mixer_ctx->drm_dev = drm_dev;
+	mixer_ctx->drm_dev = drm_dev;
 	mixer_ctx->pipe = priv->pipe++;
 
 	/* acquire resources: regs, irqs, clocks */
@@ -1256,7 +1256,7 @@ static int mixer_bind(struct device *dev, struct device *manager, void *data)
 	if (ret)
 		return ret;
 
-	ret = exynos_drm_crtc_create(&ctx->manager, ctx->pipe,
+	ret = exynos_drm_crtc_create(&ctx->manager, drm_dev, ctx->pipe,
 				     EXYNOS_DISPLAY_TYPE_HDMI);
 	if (ret) {
 		mixer_mgr_remove(&ctx->manager);
-- 
1.9.3
