From: Gustavo Padovan <gustavo@padovan.org>
Subject: [PATCH 3/6] drm/exynos: remove pipe member of struct exynos_drm_manager
Date: Wed, 26 Nov 2014 19:09:02 -0200
Message-ID: <1417036145-11017-4-git-send-email-gustavo@padovan.org>
References: <1417036145-11017-1-git-send-email-gustavo@padovan.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qa0-f53.google.com ([209.85.216.53]:48413 "EHLO
	mail-qa0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751028AbaKZVJY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 26 Nov 2014 16:09:24 -0500
Received: by mail-qa0-f53.google.com with SMTP id bm13so2535788qab.12
        for <linux-samsung-soc@vger.kernel.org>; Wed, 26 Nov 2014 13:09:24 -0800 (PST)
In-Reply-To: <1417036145-11017-1-git-send-email-gustavo@padovan.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, inki.dae@samsung.com, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>

It is not longer used. This is part of the process of removing
struct exynos_drm_manager entirely.

Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
---
 drivers/gpu/drm/exynos/exynos_drm_crtc.c | 2 +-
 drivers/gpu/drm/exynos/exynos_drm_drv.h  | 2 --
 drivers/gpu/drm/exynos/exynos_drm_fimd.c | 2 +-
 drivers/gpu/drm/exynos/exynos_drm_vidi.c | 2 +-
 drivers/gpu/drm/exynos/exynos_mixer.c    | 2 +-
 5 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_crtc.c b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
index 68aae38..0fe981b 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_crtc.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
@@ -436,7 +436,7 @@ int exynos_drm_crtc_get_pipe_from_type(struct drm_device *drm_dev,
 
 		exynos_crtc = to_exynos_crtc(crtc);
 		if (exynos_crtc->manager->type == out_type)
-			return exynos_crtc->manager->pipe;
+			return exynos_crtc->pipe;
 	}
 
 	return -EPERM;
diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.h b/drivers/gpu/drm/exynos/exynos_drm_drv.h
index 0a565f8..1d024c0 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.h
@@ -207,7 +207,6 @@ struct exynos_drm_manager_ops {
  * @type: one of EXYNOS_DISPLAY_TYPE_LCD and HDMI.
  * @drm_dev: pointer to the drm device
  * @crtc: crtc object.
- * @pipe: the pipe number for this crtc/manager
  * @ops: pointer to callbacks for exynos drm specific functionality
  * @ctx: A pointer to the manager's implementation specific context
  */
@@ -216,7 +215,6 @@ struct exynos_drm_manager {
 	enum exynos_drm_output_type type;
 	struct drm_device *drm_dev;
 	struct drm_crtc *crtc;
-	int pipe;
 	struct exynos_drm_manager_ops *ops;
 };
 
diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
index 1f83a75..6e2092d 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
@@ -300,7 +300,7 @@ static int fimd_mgr_initialize(struct exynos_drm_manager *mgr,
 	priv = drm_dev->dev_private;
 
 	mgr->drm_dev = ctx->drm_dev = drm_dev;
-	mgr->pipe = ctx->pipe = priv->pipe++;
+	ctx->pipe = priv->pipe++;
 
 	/* attach this sub driver to iommu mapping if supported. */
 	if (is_drm_iommu_supported(ctx->drm_dev)) {
diff --git a/drivers/gpu/drm/exynos/exynos_drm_vidi.c b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
index e78764f..785d2fe 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_vidi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
@@ -302,7 +302,7 @@ static int vidi_mgr_initialize(struct exynos_drm_manager *mgr,
 	struct exynos_drm_private *priv = drm_dev->dev_private;
 
 	mgr->drm_dev = ctx->drm_dev = drm_dev;
-	mgr->pipe = ctx->pipe = priv->pipe++;
+	ctx->pipe = priv->pipe++;
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exynos/exynos_mixer.c
index 9d7dcfc..8301503 100644
--- a/drivers/gpu/drm/exynos/exynos_mixer.c
+++ b/drivers/gpu/drm/exynos/exynos_mixer.c
@@ -863,7 +863,7 @@ static int mixer_initialize(struct exynos_drm_manager *mgr,
 	priv = drm_dev->dev_private;
 
 	mgr->drm_dev = mixer_ctx->drm_dev = drm_dev;
-	mgr->pipe = mixer_ctx->pipe = priv->pipe++;
+	mixer_ctx->pipe = priv->pipe++;
 
 	/* acquire resources: regs, irqs, clocks */
 	ret = mixer_resources_init(mixer_ctx);
-- 
1.9.3
