From: Gustavo Padovan <gustavo@padovan.org>
Subject: [PATCH v2 12/23] drm/exynos: don't track enabled state at exynos_crtc
Date: Mon,  6 Jul 2015 11:20:13 -0300
Message-ID: <1436192424-18194-13-git-send-email-gustavo@padovan.org>
References: <1436192424-18194-1-git-send-email-gustavo@padovan.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qg0-f41.google.com ([209.85.192.41]:35607 "EHLO
	mail-qg0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753097AbbGFOVJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 6 Jul 2015 10:21:09 -0400
Received: by qget71 with SMTP id t71so69543893qge.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 06 Jul 2015 07:21:09 -0700 (PDT)
In-Reply-To: <1436192424-18194-1-git-send-email-gustavo@padovan.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, inki.dae@samsung.com, jy0922.shim@samsung.com, tjakobi@math.uni-bielefeld.de, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>

struct drm_crtc already stores the enabled state of the crtc
thus we don't need to replicate enabled in exynos_drm_crtc.

Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
---
 drivers/gpu/drm/exynos/exynos_drm_crtc.c | 16 ----------------
 drivers/gpu/drm/exynos/exynos_drm_drv.h  |  1 -
 2 files changed, 17 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_crtc.c b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
index 9bc2353..5ab8972 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_crtc.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
@@ -26,14 +26,9 @@ static void exynos_drm_crtc_enable(struct drm_crtc *crtc)
 {
 	struct exynos_drm_crtc *exynos_crtc = to_exynos_crtc(crtc);
 
-	if (exynos_crtc->enabled)
-		return;
-
 	if (exynos_crtc->ops->enable)
 		exynos_crtc->ops->enable(exynos_crtc);
 
-	exynos_crtc->enabled = true;
-
 	drm_crtc_vblank_on(crtc);
 }
 
@@ -41,9 +36,6 @@ static void exynos_drm_crtc_disable(struct drm_crtc *crtc)
 {
 	struct exynos_drm_crtc *exynos_crtc = to_exynos_crtc(crtc);
 
-	if (!exynos_crtc->enabled)
-		return;
-
 	/* wait for the completion of page flip. */
 	if (!wait_event_timeout(exynos_crtc->pending_flip_queue,
 				(exynos_crtc->event == NULL), HZ/20))
@@ -53,8 +45,6 @@ static void exynos_drm_crtc_disable(struct drm_crtc *crtc)
 
 	if (exynos_crtc->ops->disable)
 		exynos_crtc->ops->disable(exynos_crtc);
-
-	exynos_crtc->enabled = false;
 }
 
 static bool
@@ -171,9 +161,6 @@ int exynos_drm_crtc_enable_vblank(struct drm_device *dev, int pipe)
 	struct exynos_drm_crtc *exynos_crtc =
 		to_exynos_crtc(private->crtc[pipe]);
 
-	if (!exynos_crtc->enabled)
-		return -EPERM;
-
 	if (exynos_crtc->ops->enable_vblank)
 		return exynos_crtc->ops->enable_vblank(exynos_crtc);
 
@@ -186,9 +173,6 @@ void exynos_drm_crtc_disable_vblank(struct drm_device *dev, int pipe)
 	struct exynos_drm_crtc *exynos_crtc =
 		to_exynos_crtc(private->crtc[pipe]);
 
-	if (!exynos_crtc->enabled)
-		return;
-
 	if (exynos_crtc->ops->disable_vblank)
 		exynos_crtc->ops->disable_vblank(exynos_crtc);
 }
diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.h b/drivers/gpu/drm/exynos/exynos_drm_drv.h
index 5bd1d3c..d3a8f0a 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.h
@@ -185,7 +185,6 @@ struct exynos_drm_crtc {
 	struct drm_crtc			base;
 	enum exynos_drm_output_type	type;
 	unsigned int			pipe;
-	bool				enabled;
 	wait_queue_head_t		pending_flip_queue;
 	struct drm_pending_vblank_event	*event;
 	const struct exynos_drm_crtc_ops	*ops;
-- 
2.1.0
