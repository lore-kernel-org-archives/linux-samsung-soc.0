From: Gustavo Padovan <gustavo@padovan.org>
Subject: [PATCH 15/29] drm/exynos: add pipe param to exynos_drm_crtc_create()
Date: Thu, 18 Dec 2014 11:58:41 -0200
Message-ID: <1418911135-5207-16-git-send-email-gustavo@padovan.org>
References: <1418911135-5207-1-git-send-email-gustavo@padovan.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qc0-f172.google.com ([209.85.216.172]:46734 "EHLO
	mail-qc0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752287AbaLRN75 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 18 Dec 2014 08:59:57 -0500
Received: by mail-qc0-f172.google.com with SMTP id m20so873025qcx.31
        for <linux-samsung-soc@vger.kernel.org>; Thu, 18 Dec 2014 05:59:57 -0800 (PST)
In-Reply-To: <1418911135-5207-1-git-send-email-gustavo@padovan.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, inki.dae@samsung.com, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>

Get the pipe value from a parameter instead of getting it from
manager->pipe. We are removing manager->pipe.

Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
---
 drivers/gpu/drm/exynos/exynos_drm_crtc.c | 8 ++++----
 drivers/gpu/drm/exynos/exynos_drm_crtc.h | 2 +-
 drivers/gpu/drm/exynos/exynos_drm_fimd.c | 2 +-
 drivers/gpu/drm/exynos/exynos_drm_vidi.c | 2 +-
 drivers/gpu/drm/exynos/exynos_mixer.c    | 2 +-
 5 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_crtc.c b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
index 1cdf705..68aae38 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_crtc.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
@@ -299,7 +299,7 @@ static void exynos_drm_crtc_attach_mode_property(struct drm_crtc *crtc)
 	drm_object_attach_property(&crtc->base, prop, 0);
 }
 
-int exynos_drm_crtc_create(struct exynos_drm_manager *manager)
+int exynos_drm_crtc_create(struct exynos_drm_manager *manager, int pipe)
 {
 	struct exynos_drm_crtc *exynos_crtc;
 	struct drm_plane *plane;
@@ -316,8 +316,8 @@ int exynos_drm_crtc_create(struct exynos_drm_manager *manager)
 
 	exynos_crtc->dpms = DRM_MODE_DPMS_OFF;
 	exynos_crtc->manager = manager;
-	exynos_crtc->pipe = manager->pipe;
-	plane = exynos_plane_init(manager->drm_dev, 1 << manager->pipe,
+	exynos_crtc->pipe = pipe;
+	plane = exynos_plane_init(manager->drm_dev, 1 << pipe,
 				  DRM_PLANE_TYPE_PRIMARY);
 	if (IS_ERR(plane)) {
 		ret = PTR_ERR(plane);
@@ -327,7 +327,7 @@ int exynos_drm_crtc_create(struct exynos_drm_manager *manager)
 	manager->crtc = &exynos_crtc->base;
 	crtc = &exynos_crtc->base;
 
-	private->crtc[manager->pipe] = crtc;
+	private->crtc[pipe] = crtc;
 
 	ret = drm_crtc_init_with_planes(manager->drm_dev, crtc, plane, NULL,
 					&exynos_crtc_funcs);
diff --git a/drivers/gpu/drm/exynos/exynos_drm_crtc.h b/drivers/gpu/drm/exynos/exynos_drm_crtc.h
index dbd4227..f1bee84 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_crtc.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_crtc.h
@@ -17,7 +17,7 @@
 
 #include "exynos_drm_drv.h"
 
-int exynos_drm_crtc_create(struct exynos_drm_manager *manager);
+int exynos_drm_crtc_create(struct exynos_drm_manager *manager, int pipe);
 int exynos_drm_crtc_enable_vblank(struct drm_device *dev, int pipe);
 void exynos_drm_crtc_disable_vblank(struct drm_device *dev, int pipe);
 void exynos_drm_crtc_finish_pageflip(struct drm_device *dev, int pipe);
diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
index 495d7e2..5e94fea 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
@@ -1094,7 +1094,7 @@ static int fimd_bind(struct device *dev, struct device *master, void *data)
 	struct drm_device *drm_dev = data;
 
 	fimd_mgr_initialize(&ctx->manager, drm_dev);
-	exynos_drm_crtc_create(&ctx->manager);
+	exynos_drm_crtc_create(&ctx->manager, ctx->pipe);
 	if (ctx->display)
 		exynos_drm_create_enc_conn(drm_dev, ctx->display);
 
diff --git a/drivers/gpu/drm/exynos/exynos_drm_vidi.c b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
index 7f9ce73..e78764f 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_vidi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
@@ -558,7 +558,7 @@ static int vidi_bind(struct device *dev, struct device *master, void *data)
 
 	vidi_mgr_initialize(&ctx->manager, drm_dev);
 
-	ret = exynos_drm_crtc_create(&ctx->manager);
+	ret = exynos_drm_crtc_create(&ctx->manager, ctx->pipe);
 	if (ret) {
 		DRM_ERROR("failed to create crtc.\n");
 		return ret;
diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exynos/exynos_mixer.c
index b64674a..9d7dcfc 100644
--- a/drivers/gpu/drm/exynos/exynos_mixer.c
+++ b/drivers/gpu/drm/exynos/exynos_mixer.c
@@ -1256,7 +1256,7 @@ static int mixer_bind(struct device *dev, struct device *manager, void *data)
 	if (ret)
 		return ret;
 
-	ret = exynos_drm_crtc_create(&ctx->manager);
+	ret = exynos_drm_crtc_create(&ctx->manager, ctx->pipe);
 	if (ret) {
 		mixer_mgr_remove(&ctx->manager);
 		return ret;
-- 
1.9.3
