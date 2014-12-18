From: Gustavo Padovan <gustavo@padovan.org>
Subject: [PATCH 17/29] drm/exynos: move 'type' from manager to crtc struct
Date: Thu, 18 Dec 2014 11:58:43 -0200
Message-ID: <1418911135-5207-18-git-send-email-gustavo@padovan.org>
References: <1418911135-5207-1-git-send-email-gustavo@padovan.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qg0-f51.google.com ([209.85.192.51]:58430 "EHLO
	mail-qg0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752287AbaLROAE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 18 Dec 2014 09:00:04 -0500
Received: by mail-qg0-f51.google.com with SMTP id e89so832029qgf.24
        for <linux-samsung-soc@vger.kernel.org>; Thu, 18 Dec 2014 06:00:04 -0800 (PST)
In-Reply-To: <1418911135-5207-1-git-send-email-gustavo@padovan.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, inki.dae@samsung.com, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>

'type' is now part of the struct exynos_drm_crtc. This is just another
step in the struct exynos_drm_manager removal.

Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
---
 drivers/gpu/drm/exynos/exynos_drm_crtc.c | 6 ++++--
 drivers/gpu/drm/exynos/exynos_drm_crtc.h | 3 ++-
 drivers/gpu/drm/exynos/exynos_drm_drv.h  | 4 ++--
 drivers/gpu/drm/exynos/exynos_drm_fimd.c | 6 +++---
 drivers/gpu/drm/exynos/exynos_drm_vidi.c | 6 +++---
 drivers/gpu/drm/exynos/exynos_mixer.c    | 6 +++---
 6 files changed, 17 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_crtc.c b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
index 0fe981b..224b9af 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_crtc.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
@@ -299,7 +299,8 @@ static void exynos_drm_crtc_attach_mode_property(struct drm_crtc *crtc)
 	drm_object_attach_property(&crtc->base, prop, 0);
 }
 
-int exynos_drm_crtc_create(struct exynos_drm_manager *manager, int pipe)
+int exynos_drm_crtc_create(struct exynos_drm_manager *manager, int pipe,
+			   enum exynos_drm_output_type type)
 {
 	struct exynos_drm_crtc *exynos_crtc;
 	struct drm_plane *plane;
@@ -317,6 +318,7 @@ int exynos_drm_crtc_create(struct exynos_drm_manager *manager, int pipe)
 	exynos_crtc->dpms = DRM_MODE_DPMS_OFF;
 	exynos_crtc->manager = manager;
 	exynos_crtc->pipe = pipe;
+	exynos_crtc->type = type;
 	plane = exynos_plane_init(manager->drm_dev, 1 << pipe,
 				  DRM_PLANE_TYPE_PRIMARY);
 	if (IS_ERR(plane)) {
@@ -435,7 +437,7 @@ int exynos_drm_crtc_get_pipe_from_type(struct drm_device *drm_dev,
 		struct exynos_drm_crtc *exynos_crtc;
 
 		exynos_crtc = to_exynos_crtc(crtc);
-		if (exynos_crtc->manager->type == out_type)
+		if (exynos_crtc->type == out_type)
 			return exynos_crtc->pipe;
 	}
 
diff --git a/drivers/gpu/drm/exynos/exynos_drm_crtc.h b/drivers/gpu/drm/exynos/exynos_drm_crtc.h
index f1bee84..a705941 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_crtc.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_crtc.h
@@ -17,7 +17,8 @@
 
 #include "exynos_drm_drv.h"
 
-int exynos_drm_crtc_create(struct exynos_drm_manager *manager, int pipe);
+int exynos_drm_crtc_create(struct exynos_drm_manager *manager, int pipe,
+			   enum exynos_drm_output_type type);
 int exynos_drm_crtc_enable_vblank(struct drm_device *dev, int pipe);
 void exynos_drm_crtc_disable_vblank(struct drm_device *dev, int pipe);
 void exynos_drm_crtc_finish_pageflip(struct drm_device *dev, int pipe);
diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.h b/drivers/gpu/drm/exynos/exynos_drm_drv.h
index 1d024c0..a3ae95f 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.h
@@ -204,7 +204,6 @@ struct exynos_drm_manager_ops {
  * Exynos drm common manager structure, maps 1:1 with a crtc
  *
  * @list: the list entry for this manager
- * @type: one of EXYNOS_DISPLAY_TYPE_LCD and HDMI.
  * @drm_dev: pointer to the drm device
  * @crtc: crtc object.
  * @ops: pointer to callbacks for exynos drm specific functionality
@@ -212,7 +211,6 @@ struct exynos_drm_manager_ops {
  */
 struct exynos_drm_manager {
 	struct list_head list;
-	enum exynos_drm_output_type type;
 	struct drm_device *drm_dev;
 	struct drm_crtc *crtc;
 	struct exynos_drm_manager_ops *ops;
@@ -228,6 +226,7 @@ enum exynos_crtc_mode {
  *
  * @base: crtc object.
  * @manager: the manager associated with this crtc
+ * @type: one of EXYNOS_DISPLAY_TYPE_LCD and HDMI.
  * @pipe: a crtc index created at load() with a new crtc object creation
  *	and the crtc object would be set to private->crtc array
  *	to get a crtc object corresponding to this pipe from private->crtc
@@ -241,6 +240,7 @@ enum exynos_crtc_mode {
 struct exynos_drm_crtc {
 	struct drm_crtc			base;
 	struct exynos_drm_manager	*manager;
+	enum exynos_drm_output_type	type;
 	unsigned int			pipe;
 	unsigned int			dpms;
 	enum exynos_crtc_mode		mode;
diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
index a749418..f85c60a 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
@@ -1094,7 +1094,8 @@ static int fimd_bind(struct device *dev, struct device *master, void *data)
 	struct drm_device *drm_dev = data;
 
 	fimd_mgr_initialize(&ctx->manager, drm_dev);
-	exynos_drm_crtc_create(&ctx->manager, ctx->pipe);
+	exynos_drm_crtc_create(&ctx->manager, ctx->pipe,
+			       EXYNOS_DISPLAY_TYPE_LCD);
 	if (ctx->display)
 		exynos_drm_create_enc_conn(drm_dev, ctx->display);
 
@@ -1135,11 +1136,10 @@ static int fimd_probe(struct platform_device *pdev)
 	if (!ctx)
 		return -ENOMEM;
 
-	ctx->manager.type = EXYNOS_DISPLAY_TYPE_LCD;
 	ctx->manager.ops = &fimd_manager_ops;
 
 	ret = exynos_drm_component_add(dev, EXYNOS_DEVICE_TYPE_CRTC,
-				       ctx->manager.type);
+				       EXYNOS_DISPLAY_TYPE_LCD);
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/exynos/exynos_drm_vidi.c b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
index 785d2fe..3cee0fd 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_vidi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
@@ -558,7 +558,8 @@ static int vidi_bind(struct device *dev, struct device *master, void *data)
 
 	vidi_mgr_initialize(&ctx->manager, drm_dev);
 
-	ret = exynos_drm_crtc_create(&ctx->manager, ctx->pipe);
+	ret = exynos_drm_crtc_create(&ctx->manager, ctx->pipe,
+				     EXYNOS_DISPLAY_TYPE_VIDI);
 	if (ret) {
 		DRM_ERROR("failed to create crtc.\n");
 		return ret;
@@ -593,7 +594,6 @@ static int vidi_probe(struct platform_device *pdev)
 	if (!ctx)
 		return -ENOMEM;
 
-	ctx->manager.type = EXYNOS_DISPLAY_TYPE_VIDI;
 	ctx->manager.ops = &vidi_manager_ops;
 	ctx->display.type = EXYNOS_DISPLAY_TYPE_VIDI;
 	ctx->display.ops = &vidi_display_ops;
@@ -601,7 +601,7 @@ static int vidi_probe(struct platform_device *pdev)
 	ctx->pdev = pdev;
 
 	ret = exynos_drm_component_add(&pdev->dev, EXYNOS_DEVICE_TYPE_CRTC,
-					ctx->manager.type);
+					EXYNOS_DISPLAY_TYPE_VIDI);
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exynos/exynos_mixer.c
index 8301503..1167099 100644
--- a/drivers/gpu/drm/exynos/exynos_mixer.c
+++ b/drivers/gpu/drm/exynos/exynos_mixer.c
@@ -1256,7 +1256,8 @@ static int mixer_bind(struct device *dev, struct device *manager, void *data)
 	if (ret)
 		return ret;
 
-	ret = exynos_drm_crtc_create(&ctx->manager, ctx->pipe);
+	ret = exynos_drm_crtc_create(&ctx->manager, ctx->pipe,
+				     EXYNOS_DISPLAY_TYPE_HDMI);
 	if (ret) {
 		mixer_mgr_remove(&ctx->manager);
 		return ret;
@@ -1296,7 +1297,6 @@ static int mixer_probe(struct platform_device *pdev)
 
 	mutex_init(&ctx->mixer_mutex);
 
-	ctx->manager.type = EXYNOS_DISPLAY_TYPE_HDMI;
 	ctx->manager.ops = &mixer_manager_ops;
 
 	if (dev->of_node) {
@@ -1320,7 +1320,7 @@ static int mixer_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, ctx);
 
 	ret = exynos_drm_component_add(&pdev->dev, EXYNOS_DEVICE_TYPE_CRTC,
-					ctx->manager.type);
+					EXYNOS_DISPLAY_TYPE_HDMI);
 	if (ret)
 		return ret;
 
-- 
1.9.3
