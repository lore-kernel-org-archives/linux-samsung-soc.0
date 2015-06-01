From: Gustavo Padovan <gustavo@padovan.org>
Subject: [PATCH v10 09/17] drm/exynos: atomic phase 3: use atomic .set_config helper
Date: Mon,  1 Jun 2015 12:04:47 -0300
Message-ID: <1433171095-23773-10-git-send-email-gustavo@padovan.org>
References: <1433171095-23773-1-git-send-email-gustavo@padovan.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vn0-f49.google.com ([209.85.216.49]:44653 "EHLO
	mail-vn0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751783AbbFAPF0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 1 Jun 2015 11:05:26 -0400
Received: by vnbg129 with SMTP id g129so16465280vnb.11
        for <linux-samsung-soc@vger.kernel.org>; Mon, 01 Jun 2015 08:05:26 -0700 (PDT)
In-Reply-To: <1433171095-23773-1-git-send-email-gustavo@padovan.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, inki.dae@samsung.com, jy0922.shim@samsung.com, tjakobi@math.uni-bielefeld.de, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>

Now that phase 1 and 2 are complete switch .set_config helper to
use the atomic one.

v2: also remove .prepare() callback

v3: remove .mode_set() and .mode_set_base() and encoder's
.prepare() callbacks

Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
Reviewed-by: Joonyoung Shim <jy0922.shim@samsung.com>
Tested-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
---
 drivers/gpu/drm/exynos/exynos_drm_crtc.c    | 10 +---------
 drivers/gpu/drm/exynos/exynos_drm_encoder.c |  6 ------
 2 files changed, 1 insertion(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_crtc.c b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
index f782d1f..dd1ee7f 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_crtc.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
@@ -50,11 +50,6 @@ static void exynos_drm_crtc_dpms(struct drm_crtc *crtc, int mode)
 		drm_crtc_vblank_on(crtc);
 }
 
-static void exynos_drm_crtc_prepare(struct drm_crtc *crtc)
-{
-	/* drm framework doesn't check NULL. */
-}
-
 static void exynos_drm_crtc_commit(struct drm_crtc *crtc)
 {
 	struct exynos_drm_crtc *exynos_crtc = to_exynos_crtc(crtc);
@@ -108,12 +103,9 @@ static void exynos_drm_crtc_disable(struct drm_crtc *crtc)
 
 static struct drm_crtc_helper_funcs exynos_crtc_helper_funcs = {
 	.dpms		= exynos_drm_crtc_dpms,
-	.prepare	= exynos_drm_crtc_prepare,
 	.commit		= exynos_drm_crtc_commit,
 	.mode_fixup	= exynos_drm_crtc_mode_fixup,
-	.mode_set	= drm_helper_crtc_mode_set,
 	.mode_set_nofb	= exynos_drm_crtc_mode_set_nofb,
-	.mode_set_base	= drm_helper_crtc_mode_set_base,
 	.disable	= exynos_drm_crtc_disable,
 };
 
@@ -190,7 +182,7 @@ static void exynos_drm_crtc_destroy(struct drm_crtc *crtc)
 }
 
 static struct drm_crtc_funcs exynos_crtc_funcs = {
-	.set_config	= drm_crtc_helper_set_config,
+	.set_config	= drm_atomic_helper_set_config,
 	.page_flip	= exynos_drm_crtc_page_flip,
 	.destroy	= exynos_drm_crtc_destroy,
 	.reset = drm_atomic_helper_crtc_reset,
diff --git a/drivers/gpu/drm/exynos/exynos_drm_encoder.c b/drivers/gpu/drm/exynos/exynos_drm_encoder.c
index 57de0bd..915de13 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_encoder.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_encoder.c
@@ -76,11 +76,6 @@ static void exynos_drm_encoder_mode_set(struct drm_encoder *encoder,
 		display->ops->mode_set(display, adjusted_mode);
 }
 
-static void exynos_drm_encoder_prepare(struct drm_encoder *encoder)
-{
-	/* drm framework doesn't check NULL. */
-}
-
 static void exynos_drm_encoder_commit(struct drm_encoder *encoder)
 {
 	struct exynos_drm_encoder *exynos_encoder = to_exynos_encoder(encoder);
@@ -111,7 +106,6 @@ static struct drm_encoder_helper_funcs exynos_encoder_helper_funcs = {
 	.dpms		= exynos_drm_encoder_dpms,
 	.mode_fixup	= exynos_drm_encoder_mode_fixup,
 	.mode_set	= exynos_drm_encoder_mode_set,
-	.prepare	= exynos_drm_encoder_prepare,
 	.commit		= exynos_drm_encoder_commit,
 	.disable	= exynos_drm_encoder_disable,
 };
-- 
2.1.0
