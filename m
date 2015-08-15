From: Gustavo Padovan <gustavo@padovan.org>
Subject: [PATCH 01/11] drm/exynos: don't track enabled state at exynos_crtc
Date: Sat, 15 Aug 2015 13:26:10 -0300
Message-ID: <1439655980-32146-2-git-send-email-gustavo@padovan.org>
References: <1439655980-32146-1-git-send-email-gustavo@padovan.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yk0-f196.google.com ([209.85.160.196]:34091 "EHLO
	mail-yk0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753216AbbHOQ0a (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 15 Aug 2015 12:26:30 -0400
Received: by ykel23 with SMTP id l23so2888536yke.1
        for <linux-samsung-soc@vger.kernel.org>; Sat, 15 Aug 2015 09:26:29 -0700 (PDT)
In-Reply-To: <1439655980-32146-1-git-send-email-gustavo@padovan.org>
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
index b9b0e9c..5a19e16 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_crtc.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
@@ -25,14 +25,9 @@ static void exynos_drm_crtc_enable(struct drm_crtc *crtc)
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
 
@@ -40,9 +35,6 @@ static void exynos_drm_crtc_disable(struct drm_crtc *crtc)
 {
 	struct exynos_drm_crtc *exynos_crtc = to_exynos_crtc(crtc);
 
-	if (!exynos_crtc->enabled)
-		return;
-
 	/* wait for the completion of page flip. */
 	if (!wait_event_timeout(exynos_crtc->pending_flip_queue,
 				(exynos_crtc->event == NULL), HZ/20))
@@ -52,8 +44,6 @@ static void exynos_drm_crtc_disable(struct drm_crtc *crtc)
 
 	if (exynos_crtc->ops->disable)
 		exynos_crtc->ops->disable(exynos_crtc);
-
-	exynos_crtc->enabled = false;
 }
 
 static bool
@@ -170,9 +160,6 @@ int exynos_drm_crtc_enable_vblank(struct drm_device *dev, int pipe)
 	struct exynos_drm_crtc *exynos_crtc =
 		to_exynos_crtc(private->crtc[pipe]);
 
-	if (!exynos_crtc->enabled)
-		return -EPERM;
-
 	if (exynos_crtc->ops->enable_vblank)
 		return exynos_crtc->ops->enable_vblank(exynos_crtc);
 
@@ -185,9 +172,6 @@ void exynos_drm_crtc_disable_vblank(struct drm_device *dev, int pipe)
 	struct exynos_drm_crtc *exynos_crtc =
 		to_exynos_crtc(private->crtc[pipe]);
 
-	if (!exynos_crtc->enabled)
-		return;
-
 	if (exynos_crtc->ops->disable_vblank)
 		exynos_crtc->ops->disable_vblank(exynos_crtc);
 }
diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.h b/drivers/gpu/drm/exynos/exynos_drm_drv.h
index 6b8a30f..a993aac 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.h
@@ -136,7 +136,6 @@ struct exynos_drm_crtc {
 	struct drm_crtc			base;
 	enum exynos_drm_output_type	type;
 	unsigned int			pipe;
-	bool				enabled;
 	wait_queue_head_t		pending_flip_queue;
 	struct drm_pending_vblank_event	*event;
 	const struct exynos_drm_crtc_ops	*ops;
-- 
2.1.0
