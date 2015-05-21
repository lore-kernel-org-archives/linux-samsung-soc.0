From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: [PATCH v4] drm/exynos: calculate vrefresh instead of use a fixed value
Date: Thu, 21 May 2015 22:36:01 +0200
Message-ID: <1432240561-7371-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:39620 "EHLO
	smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1030190AbbEUUgF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 21 May 2015 16:36:05 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, gustavo.padovan@collabora.co.uk, jy0922.shim@samsung.com, inki.dae@samsung.com, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>

From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>

When mode's vrefresh is zero we should ask DRM core to calculate vrefresh
for us so we can get the correct value instead of relying on fixed value
defined in a macro. But if vrefresh is still zero we should fail the
update.

Suggested-by: Daniel Stone <daniels@collabora.com>
Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
---
 drivers/gpu/drm/exynos/exynos_drm_fimd.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
index a0edab8..780c9df 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
@@ -41,7 +41,6 @@
  * CPU Interface.
  */
 
-#define FIMD_DEFAULT_FRAMERATE 60
 #define MIN_FB_WIDTH_FOR_16WORD_BURST 128
 
 /* position control register for hardware window 0, 2 ~ 4.*/
@@ -329,7 +328,9 @@ static bool fimd_mode_fixup(struct exynos_drm_crtc *crtc,
 		struct drm_display_mode *adjusted_mode)
 {
 	if (adjusted_mode->vrefresh == 0)
-		adjusted_mode->vrefresh = FIMD_DEFAULT_FRAMERATE;
+		adjusted_mode->vrefresh = drm_mode_vrefresh(mode);
+	if (adjusted_mode->vrefresh == 0)
+		return false;
 
 	return true;
 }
@@ -337,11 +338,16 @@ static bool fimd_mode_fixup(struct exynos_drm_crtc *crtc,
 static void fimd_commit(struct exynos_drm_crtc *crtc)
 {
 	struct fimd_context *ctx = crtc->ctx;
-	struct drm_display_mode *mode = &crtc->base.mode;
+	struct drm_display_mode *mode;
 	struct fimd_driver_data *driver_data = ctx->driver_data;
 	void *timing_base = ctx->regs + driver_data->timing_base;
 	u32 val, clkdiv;
 
+	if (crtc->base.state)
+		mode = &crtc->base.state->adjusted_mode;
+	else
+		mode = &crtc->base.mode;
+
 	if (ctx->suspended)
 		return;
 
-- 
2.0.5
