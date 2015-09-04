From: Gustavo Padovan <gustavo@padovan.org>
Subject: [PATCH 06/10] drm/exynos: Remove exynos_crtc commit() callback
Date: Fri,  4 Sep 2015 17:15:48 -0300
Message-ID: <1441397752-6672-7-git-send-email-gustavo@padovan.org>
References: <1441397752-6672-1-git-send-email-gustavo@padovan.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yk0-f179.google.com ([209.85.160.179]:35888 "EHLO
	mail-yk0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1760503AbbIDUQM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 4 Sep 2015 16:16:12 -0400
Received: by ykcf206 with SMTP id f206so31819417ykc.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 04 Sep 2015 13:16:12 -0700 (PDT)
In-Reply-To: <1441397752-6672-1-git-send-email-gustavo@padovan.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, inki.dae@samsung.com, jy0922.shim@samsung.com, tjakobi@math.uni-bielefeld.de, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>

This callback is no longer used by any of the exynos_crtc drivers, remove
it.

Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
---
 drivers/gpu/drm/exynos/exynos_drm_crtc.c | 10 ----------
 drivers/gpu/drm/exynos/exynos_drm_drv.h  |  2 --
 2 files changed, 12 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_crtc.c b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
index 0872aa2f..deff5a7 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_crtc.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
@@ -55,15 +55,6 @@ exynos_drm_crtc_mode_fixup(struct drm_crtc *crtc,
 	return true;
 }
 
-static void
-exynos_drm_crtc_mode_set_nofb(struct drm_crtc *crtc)
-{
-	struct exynos_drm_crtc *exynos_crtc = to_exynos_crtc(crtc);
-
-	if (exynos_crtc->ops->commit)
-		exynos_crtc->ops->commit(exynos_crtc);
-}
-
 static void exynos_crtc_atomic_begin(struct drm_crtc *crtc,
 				     struct drm_crtc_state *old_crtc_state)
 {
@@ -100,7 +91,6 @@ static struct drm_crtc_helper_funcs exynos_crtc_helper_funcs = {
 	.enable		= exynos_drm_crtc_enable,
 	.disable	= exynos_drm_crtc_disable,
 	.mode_fixup	= exynos_drm_crtc_mode_fixup,
-	.mode_set_nofb	= exynos_drm_crtc_mode_set_nofb,
 	.atomic_begin	= exynos_crtc_atomic_begin,
 	.atomic_flush	= exynos_crtc_atomic_flush,
 };
diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.h b/drivers/gpu/drm/exynos/exynos_drm_drv.h
index cc56c3d..5f1a4d6 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.h
@@ -86,7 +86,6 @@ struct exynos_drm_plane {
  * @enable: enable the device
  * @disable: disable the device
  * @mode_fixup: fix mode data before applying it
- * @commit: set current hw specific display mode to hw.
  * @enable_vblank: specific driver callback for enabling vblank interrupt.
  * @disable_vblank: specific driver callback for disabling vblank interrupt.
  * @wait_for_vblank: wait for vblank interrupt to make sure that
@@ -109,7 +108,6 @@ struct exynos_drm_crtc_ops {
 	bool (*mode_fixup)(struct exynos_drm_crtc *crtc,
 				const struct drm_display_mode *mode,
 				struct drm_display_mode *adjusted_mode);
-	void (*commit)(struct exynos_drm_crtc *crtc);
 	int (*enable_vblank)(struct exynos_drm_crtc *crtc);
 	void (*disable_vblank)(struct exynos_drm_crtc *crtc);
 	void (*wait_for_vblank)(struct exynos_drm_crtc *crtc);
-- 
2.1.0
