From: Gustavo Padovan <gustavo@padovan.org>
Subject: [PATCH v9 14/18] drm/exynos: atomic dpms support
Date: Thu, 28 May 2015 18:42:52 -0300
Message-ID: <1432849376-12828-15-git-send-email-gustavo@padovan.org>
References: <1432849376-12828-1-git-send-email-gustavo@padovan.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vn0-f48.google.com ([209.85.216.48]:32925 "EHLO
	mail-vn0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754878AbbE1Vnx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 28 May 2015 17:43:53 -0400
Received: by vnbf190 with SMTP id f190so6340385vnb.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 28 May 2015 14:43:52 -0700 (PDT)
In-Reply-To: <1432849376-12828-1-git-send-email-gustavo@padovan.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, inki.dae@samsung.com, jy0922.shim@samsung.com, tjakobi@math.uni-bielefeld.de, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>

Run dpms operations through the atomic intefaces. This basically removes
the .dpms() callback from econders and crtcs and use .disable() and
.enable() to turn the crtc on and off.

v2: Address comments by Joonyoung:
	- make hdmi code call ->disable() instead of ->dpms()
	- do not use WARN_ON on crtc enable/disable

v3: - Fix build failure after the hdmi change in v2
    - Change dpms helper of ptn3460 bridge

v4: - remove win_commit() call from .enable()

v5: - move .atomic_check() to the atomic PageFlip patch, and transform it
in .atomic_begin()

Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
Reviewed-by: Joonyoung Shim <jy0922.shim@samsung.com>
Tested-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
---
 drivers/gpu/drm/bridge/ps8622.c             |  2 +-
 drivers/gpu/drm/bridge/ptn3460.c            |  2 +-
 drivers/gpu/drm/exynos/exynos_dp_core.c     |  2 +-
 drivers/gpu/drm/exynos/exynos_drm_crtc.c    | 58 ++++++++++++-----------------
 drivers/gpu/drm/exynos/exynos_drm_dpi.c     |  2 +-
 drivers/gpu/drm/exynos/exynos_drm_drv.h     |  4 +-
 drivers/gpu/drm/exynos/exynos_drm_dsi.c     |  2 +-
 drivers/gpu/drm/exynos/exynos_drm_encoder.c | 21 +++--------
 drivers/gpu/drm/exynos/exynos_drm_vidi.c    |  2 +-
 drivers/gpu/drm/exynos/exynos_hdmi.c        |  6 +--
 10 files changed, 40 insertions(+), 61 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ps8622.c b/drivers/gpu/drm/bridge/ps8622.c
index b604326..d686235 100644
--- a/drivers/gpu/drm/bridge/ps8622.c
+++ b/drivers/gpu/drm/bridge/ps8622.c
@@ -499,7 +499,7 @@ static void ps8622_connector_destroy(struct drm_connector *connector)
 }
 
 static const struct drm_connector_funcs ps8622_connector_funcs = {
-	.dpms = drm_helper_connector_dpms,
+	.dpms = drm_atomic_helper_connector_dpms,
 	.fill_modes = drm_helper_probe_single_connector_modes,
 	.detect = ps8622_detect,
 	.destroy = ps8622_connector_destroy,
diff --git a/drivers/gpu/drm/bridge/ptn3460.c b/drivers/gpu/drm/bridge/ptn3460.c
index 8ed3617..260bc9f 100644
--- a/drivers/gpu/drm/bridge/ptn3460.c
+++ b/drivers/gpu/drm/bridge/ptn3460.c
@@ -260,7 +260,7 @@ static void ptn3460_connector_destroy(struct drm_connector *connector)
 }
 
 static struct drm_connector_funcs ptn3460_connector_funcs = {
-	.dpms = drm_helper_connector_dpms,
+	.dpms = drm_atomic_helper_connector_dpms,
 	.fill_modes = drm_helper_probe_single_connector_modes,
 	.detect = ptn3460_detect,
 	.destroy = ptn3460_connector_destroy,
diff --git a/drivers/gpu/drm/exynos/exynos_dp_core.c b/drivers/gpu/drm/exynos/exynos_dp_core.c
index 195fe60..c9995b1 100644
--- a/drivers/gpu/drm/exynos/exynos_dp_core.c
+++ b/drivers/gpu/drm/exynos/exynos_dp_core.c
@@ -954,7 +954,7 @@ static void exynos_dp_connector_destroy(struct drm_connector *connector)
 }
 
 static struct drm_connector_funcs exynos_dp_connector_funcs = {
-	.dpms = drm_helper_connector_dpms,
+	.dpms = drm_atomic_helper_connector_dpms,
 	.fill_modes = drm_helper_probe_single_connector_modes,
 	.detect = exynos_dp_detect,
 	.destroy = exynos_dp_connector_destroy,
diff --git a/drivers/gpu/drm/exynos/exynos_drm_crtc.c b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
index 7125fbe..dd8e454 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_crtc.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
@@ -22,40 +22,41 @@
 #include "exynos_drm_encoder.h"
 #include "exynos_drm_plane.h"
 
-static void exynos_drm_crtc_dpms(struct drm_crtc *crtc, int mode)
+static void exynos_drm_crtc_enable(struct drm_crtc *crtc)
 {
 	struct exynos_drm_crtc *exynos_crtc = to_exynos_crtc(crtc);
 
-	DRM_DEBUG_KMS("crtc[%d] mode[%d]\n", crtc->base.id, mode);
-
-	if (exynos_crtc->dpms == mode) {
-		DRM_DEBUG_KMS("desired dpms mode is same as previous one.\n");
+	if (exynos_crtc->enabled)
 		return;
-	}
-
-	if (mode > DRM_MODE_DPMS_ON) {
-		/* wait for the completion of page flip. */
-		if (!wait_event_timeout(exynos_crtc->pending_flip_queue,
-				(exynos_crtc->event == NULL), HZ/20))
-			exynos_crtc->event = NULL;
-		drm_crtc_vblank_off(crtc);
-	}
 
 	if (exynos_crtc->ops->dpms)
-		exynos_crtc->ops->dpms(exynos_crtc, mode);
+		exynos_crtc->ops->dpms(exynos_crtc, DRM_MODE_DPMS_ON);
 
-	exynos_crtc->dpms = mode;
+	exynos_crtc->enabled = true;
 
-	if (mode == DRM_MODE_DPMS_ON)
-		drm_crtc_vblank_on(crtc);
+	drm_crtc_vblank_on(crtc);
 }
 
 static void exynos_drm_crtc_disable(struct drm_crtc *crtc)
 {
+	struct exynos_drm_crtc *exynos_crtc = to_exynos_crtc(crtc);
 	struct drm_plane *plane;
 	int ret;
 
-	exynos_drm_crtc_dpms(crtc, DRM_MODE_DPMS_OFF);
+	if (!exynos_crtc->enabled)
+		return;
+
+	/* wait for the completion of page flip. */
+	if (!wait_event_timeout(exynos_crtc->pending_flip_queue,
+				(exynos_crtc->event == NULL), HZ/20))
+		exynos_crtc->event = NULL;
+
+	drm_crtc_vblank_off(crtc);
+
+	if (exynos_crtc->ops->dpms)
+		exynos_crtc->ops->dpms(exynos_crtc, DRM_MODE_DPMS_OFF);
+
+	exynos_crtc->enabled = false;
 
 	drm_for_each_legacy_plane(plane, &crtc->dev->mode_config.plane_list) {
 		if (plane->crtc != crtc)
@@ -67,17 +68,6 @@ static void exynos_drm_crtc_disable(struct drm_crtc *crtc)
 	}
 }
 
-static void exynos_drm_crtc_commit(struct drm_crtc *crtc)
-{
-	struct exynos_drm_crtc *exynos_crtc = to_exynos_crtc(crtc);
-	struct exynos_drm_plane *exynos_plane = to_exynos_plane(crtc->primary);
-
-	exynos_drm_crtc_dpms(crtc, DRM_MODE_DPMS_ON);
-
-	if (exynos_crtc->ops->win_commit)
-		exynos_crtc->ops->win_commit(exynos_crtc, exynos_plane->zpos);
-}
-
 static bool
 exynos_drm_crtc_mode_fixup(struct drm_crtc *crtc,
 			    const struct drm_display_mode *mode,
@@ -116,9 +106,8 @@ static void exynos_crtc_atomic_flush(struct drm_crtc *crtc)
 }
 
 static struct drm_crtc_helper_funcs exynos_crtc_helper_funcs = {
-	.dpms		= exynos_drm_crtc_dpms,
+	.enable		= exynos_drm_crtc_enable,
 	.disable	= exynos_drm_crtc_disable,
-	.commit		= exynos_drm_crtc_commit,
 	.mode_fixup	= exynos_drm_crtc_mode_fixup,
 	.mode_set_nofb	= exynos_drm_crtc_mode_set_nofb,
 	.atomic_begin	= exynos_crtc_atomic_begin,
@@ -163,7 +152,6 @@ struct exynos_drm_crtc *exynos_drm_crtc_create(struct drm_device *drm_dev,
 
 	init_waitqueue_head(&exynos_crtc->pending_flip_queue);
 
-	exynos_crtc->dpms = DRM_MODE_DPMS_OFF;
 	exynos_crtc->pipe = pipe;
 	exynos_crtc->type = type;
 	exynos_crtc->ops = ops;
@@ -194,7 +182,7 @@ int exynos_drm_crtc_enable_vblank(struct drm_device *dev, int pipe)
 	struct exynos_drm_crtc *exynos_crtc =
 		to_exynos_crtc(private->crtc[pipe]);
 
-	if (exynos_crtc->dpms != DRM_MODE_DPMS_ON)
+	if (!exynos_crtc->enabled)
 		return -EPERM;
 
 	if (exynos_crtc->ops->enable_vblank)
@@ -209,7 +197,7 @@ void exynos_drm_crtc_disable_vblank(struct drm_device *dev, int pipe)
 	struct exynos_drm_crtc *exynos_crtc =
 		to_exynos_crtc(private->crtc[pipe]);
 
-	if (exynos_crtc->dpms != DRM_MODE_DPMS_ON)
+	if (!exynos_crtc->enabled)
 		return;
 
 	if (exynos_crtc->ops->disable_vblank)
diff --git a/drivers/gpu/drm/exynos/exynos_drm_dpi.c b/drivers/gpu/drm/exynos/exynos_drm_dpi.c
index ced5c23..6dc328e 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dpi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dpi.c
@@ -60,7 +60,7 @@ static void exynos_dpi_connector_destroy(struct drm_connector *connector)
 }
 
 static struct drm_connector_funcs exynos_dpi_connector_funcs = {
-	.dpms = drm_helper_connector_dpms,
+	.dpms = drm_atomic_helper_connector_dpms,
 	.detect = exynos_dpi_detect,
 	.fill_modes = drm_helper_probe_single_connector_modes,
 	.destroy = exynos_dpi_connector_destroy,
diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.h b/drivers/gpu/drm/exynos/exynos_drm_drv.h
index 29e3fb7..86d6894 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.h
@@ -201,7 +201,7 @@ struct exynos_drm_crtc_ops {
  *	drm framework doesn't support multiple irq yet.
  *	we can refer to the crtc to current hardware interrupt occurred through
  *	this pipe value.
- * @dpms: store the crtc dpms value
+ * @enabled: if the crtc is enabled or not
  * @event: vblank event that is currently queued for flip
  * @ops: pointer to callbacks for exynos drm specific functionality
  * @ctx: A pointer to the crtc's implementation specific context
@@ -210,7 +210,7 @@ struct exynos_drm_crtc {
 	struct drm_crtc			base;
 	enum exynos_drm_output_type	type;
 	unsigned int			pipe;
-	unsigned int			dpms;
+	bool				enabled;
 	wait_queue_head_t		pending_flip_queue;
 	struct drm_pending_vblank_event	*event;
 	const struct exynos_drm_crtc_ops	*ops;
diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index e4e7f74..190f3b3 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -1458,7 +1458,7 @@ static void exynos_dsi_connector_destroy(struct drm_connector *connector)
 }
 
 static struct drm_connector_funcs exynos_dsi_connector_funcs = {
-	.dpms = drm_helper_connector_dpms,
+	.dpms = drm_atomic_helper_connector_dpms,
 	.detect = exynos_dsi_detect,
 	.fill_modes = drm_helper_probe_single_connector_modes,
 	.destroy = exynos_dsi_connector_destroy,
diff --git a/drivers/gpu/drm/exynos/exynos_drm_encoder.c b/drivers/gpu/drm/exynos/exynos_drm_encoder.c
index 915de13..0648ba4 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_encoder.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_encoder.c
@@ -32,17 +32,6 @@ struct exynos_drm_encoder {
 	struct exynos_drm_display	*display;
 };
 
-static void exynos_drm_encoder_dpms(struct drm_encoder *encoder, int mode)
-{
-	struct exynos_drm_encoder *exynos_encoder = to_exynos_encoder(encoder);
-	struct exynos_drm_display *display = exynos_encoder->display;
-
-	DRM_DEBUG_KMS("encoder dpms: %d\n", mode);
-
-	if (display->ops->dpms)
-		display->ops->dpms(display, mode);
-}
-
 static bool
 exynos_drm_encoder_mode_fixup(struct drm_encoder *encoder,
 			       const struct drm_display_mode *mode,
@@ -76,7 +65,7 @@ static void exynos_drm_encoder_mode_set(struct drm_encoder *encoder,
 		display->ops->mode_set(display, adjusted_mode);
 }
 
-static void exynos_drm_encoder_commit(struct drm_encoder *encoder)
+static void exynos_drm_encoder_enable(struct drm_encoder *encoder)
 {
 	struct exynos_drm_encoder *exynos_encoder = to_exynos_encoder(encoder);
 	struct exynos_drm_display *display = exynos_encoder->display;
@@ -90,10 +79,13 @@ static void exynos_drm_encoder_commit(struct drm_encoder *encoder)
 
 static void exynos_drm_encoder_disable(struct drm_encoder *encoder)
 {
+	struct exynos_drm_encoder *exynos_encoder = to_exynos_encoder(encoder);
+	struct exynos_drm_display *display = exynos_encoder->display;
 	struct drm_plane *plane;
 	struct drm_device *dev = encoder->dev;
 
-	exynos_drm_encoder_dpms(encoder, DRM_MODE_DPMS_OFF);
+	if (display->ops->dpms)
+		display->ops->dpms(display, DRM_MODE_DPMS_OFF);
 
 	/* all planes connected to this encoder should be also disabled. */
 	drm_for_each_legacy_plane(plane, &dev->mode_config.plane_list) {
@@ -103,10 +95,9 @@ static void exynos_drm_encoder_disable(struct drm_encoder *encoder)
 }
 
 static struct drm_encoder_helper_funcs exynos_encoder_helper_funcs = {
-	.dpms		= exynos_drm_encoder_dpms,
 	.mode_fixup	= exynos_drm_encoder_mode_fixup,
 	.mode_set	= exynos_drm_encoder_mode_set,
-	.commit		= exynos_drm_encoder_commit,
+	.enable		= exynos_drm_encoder_enable,
 	.disable	= exynos_drm_encoder_disable,
 };
 
diff --git a/drivers/gpu/drm/exynos/exynos_drm_vidi.c b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
index fc3a14b..63c1536 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_vidi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
@@ -385,7 +385,7 @@ static void vidi_connector_destroy(struct drm_connector *connector)
 }
 
 static struct drm_connector_funcs vidi_connector_funcs = {
-	.dpms = drm_helper_connector_dpms,
+	.dpms = drm_atomic_helper_connector_dpms,
 	.fill_modes = drm_helper_probe_single_connector_modes,
 	.detect = vidi_detect,
 	.destroy = vidi_connector_destroy,
diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
index 471e486..8c3c27b 100644
--- a/drivers/gpu/drm/exynos/exynos_hdmi.c
+++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
@@ -1051,7 +1051,7 @@ static void hdmi_connector_destroy(struct drm_connector *connector)
 }
 
 static struct drm_connector_funcs hdmi_connector_funcs = {
-	.dpms = drm_helper_connector_dpms,
+	.dpms = drm_atomic_helper_connector_dpms,
 	.fill_modes = drm_helper_probe_single_connector_modes,
 	.detect = hdmi_detect,
 	.destroy = hdmi_connector_destroy,
@@ -2127,8 +2127,8 @@ static void hdmi_dpms(struct exynos_drm_display *display, int mode)
 		 */
 		if (crtc)
 			funcs = crtc->helper_private;
-		if (funcs && funcs->dpms)
-			(*funcs->dpms)(crtc, mode);
+		if (funcs && funcs->disable)
+			(*funcs->disable)(crtc);
 
 		hdmi_poweroff(hdata);
 		break;
-- 
2.1.0
