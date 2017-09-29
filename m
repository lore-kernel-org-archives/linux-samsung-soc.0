From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH v2 06/11] drm/exynos/hdmi: remove redundant mode field
Date: Fri, 29 Sep 2017 12:05:37 +0200
Message-ID: <20170929100542.12849-7-a.hajda@samsung.com>
References: <20170929100542.12849-1-a.hajda@samsung.com>
        <CGME20170929100548eucas1p2cf6293ef0d013016afcafb4d6194e8be@eucas1p2.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:42656 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752002AbdI2KFw (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 29 Sep 2017 06:05:52 -0400
In-reply-to: <20170929100542.12849-1-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: Andrzej Hajda <a.hajda@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Daniel Drake <drake@endlessm.com>

Display mode is preserved in CRTC state, there is no need to keep local
copy of it. Moreover since HDMI should configure registers according to
requested mode, use it instead of adjusted_mode, which should contain
mode produced by CRTC - functionally it does not change anything, but
subsequent patches will make the difference.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
Reviewed-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
---
 drivers/gpu/drm/exynos/exynos_hdmi.c | 34 +++++++++-------------------------
 1 file changed, 9 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
index 214fa5e51963..7225b6521148 100644
--- a/drivers/gpu/drm/exynos/exynos_hdmi.c
+++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
@@ -119,7 +119,6 @@ struct hdmi_context {
 	bool				powered;
 	bool				dvi_mode;
 	struct delayed_work		hotplug_work;
-	struct drm_display_mode		current_mode;
 	struct cec_notifier		*notifier;
 	const struct hdmi_driver_data	*drv_data;
 
@@ -770,6 +769,7 @@ static int hdmi_clk_set_parents(struct hdmi_context *hdata, bool to_phy)
 
 static void hdmi_reg_infoframes(struct hdmi_context *hdata)
 {
+	struct drm_display_mode *m = &hdata->encoder.crtc->state->mode;
 	union hdmi_infoframe frm;
 	u8 buf[25];
 	int ret;
@@ -783,8 +783,7 @@ static void hdmi_reg_infoframes(struct hdmi_context *hdata)
 		return;
 	}
 
-	ret = drm_hdmi_avi_infoframe_from_display_mode(&frm.avi,
-			&hdata->current_mode, false);
+	ret = drm_hdmi_avi_infoframe_from_display_mode(&frm.avi, m, false);
 	if (!ret)
 		ret = hdmi_avi_infoframe_pack(&frm.avi, buf, sizeof(buf));
 	if (ret > 0) {
@@ -794,8 +793,7 @@ static void hdmi_reg_infoframes(struct hdmi_context *hdata)
 		DRM_INFO("%s: invalid AVI infoframe (%d)\n", __func__, ret);
 	}
 
-	ret = drm_hdmi_vendor_infoframe_from_display_mode(&frm.vendor.hdmi,
-			&hdata->current_mode);
+	ret = drm_hdmi_vendor_infoframe_from_display_mode(&frm.vendor.hdmi, m);
 	if (!ret)
 		ret = hdmi_vendor_infoframe_pack(&frm.vendor.hdmi, buf,
 				sizeof(buf));
@@ -1088,9 +1086,10 @@ static void hdmi_audio_control(struct hdmi_context *hdata, bool onoff)
 
 static void hdmi_start(struct hdmi_context *hdata, bool start)
 {
+	struct drm_display_mode *m = &hdata->encoder.crtc->state->mode;
 	u32 val = start ? HDMI_TG_EN : 0;
 
-	if (hdata->current_mode.flags & DRM_MODE_FLAG_INTERLACE)
+	if (m->flags & DRM_MODE_FLAG_INTERLACE)
 		val |= HDMI_FIELD_EN;
 
 	hdmi_reg_writemask(hdata, HDMI_CON_0, val, HDMI_EN);
@@ -1160,7 +1159,7 @@ static void hdmiphy_wait_for_pll(struct hdmi_context *hdata)
 
 static void hdmi_v13_mode_apply(struct hdmi_context *hdata)
 {
-	struct drm_display_mode *m = &hdata->current_mode;
+	struct drm_display_mode *m = &hdata->encoder.crtc->state->mode;
 	unsigned int val;
 
 	hdmi_reg_writev(hdata, HDMI_H_BLANK_0, 2, m->htotal - m->hdisplay);
@@ -1239,7 +1238,7 @@ static void hdmi_v13_mode_apply(struct hdmi_context *hdata)
 
 static void hdmi_v14_mode_apply(struct hdmi_context *hdata)
 {
-	struct drm_display_mode *m = &hdata->current_mode;
+	struct drm_display_mode *m = &hdata->encoder.crtc->state->mode;
 
 	hdmi_reg_writev(hdata, HDMI_H_BLANK_0, 2, m->htotal - m->hdisplay);
 	hdmi_reg_writev(hdata, HDMI_V_LINE_0, 2, m->vtotal);
@@ -1372,10 +1371,11 @@ static void hdmiphy_enable_mode_set(struct hdmi_context *hdata, bool enable)
 
 static void hdmiphy_conf_apply(struct hdmi_context *hdata)
 {
+	struct drm_display_mode *m = &hdata->encoder.crtc->state->mode;
 	int ret;
 	const u8 *phy_conf;
 
-	ret = hdmi_find_phy_conf(hdata, hdata->current_mode.clock * 1000);
+	ret = hdmi_find_phy_conf(hdata, m->clock * 1000);
 	if (ret < 0) {
 		DRM_ERROR("failed to find hdmiphy conf\n");
 		return;
@@ -1407,21 +1407,6 @@ static void hdmi_conf_apply(struct hdmi_context *hdata)
 	hdmi_audio_control(hdata, true);
 }
 
-static void hdmi_mode_set(struct drm_encoder *encoder,
-			  struct drm_display_mode *mode,
-			  struct drm_display_mode *adjusted_mode)
-{
-	struct hdmi_context *hdata = encoder_to_hdmi(encoder);
-	struct drm_display_mode *m = adjusted_mode;
-
-	DRM_DEBUG_KMS("xres=%d, yres=%d, refresh=%d, intl=%s\n",
-		m->hdisplay, m->vdisplay,
-		m->vrefresh, (m->flags & DRM_MODE_FLAG_INTERLACE) ?
-		"INTERLACED" : "PROGRESSIVE");
-
-	drm_mode_copy(&hdata->current_mode, m);
-}
-
 static void hdmi_set_refclk(struct hdmi_context *hdata, bool on)
 {
 	if (!hdata->sysreg)
@@ -1504,7 +1489,6 @@ static void hdmi_disable(struct drm_encoder *encoder)
 
 static const struct drm_encoder_helper_funcs exynos_hdmi_encoder_helper_funcs = {
 	.mode_fixup	= hdmi_mode_fixup,
-	.mode_set	= hdmi_mode_set,
 	.enable		= hdmi_enable,
 	.disable	= hdmi_disable,
 };
-- 
2.14.1
