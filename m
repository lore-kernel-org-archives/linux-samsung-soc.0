From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 5/7] drm/exynos/hdmi: remove redundant configuration fields
Date: Thu, 09 Jul 2015 16:28:10 +0200
Message-ID: <1436452092-20757-6-git-send-email-a.hajda@samsung.com>
References: <1436452092-20757-1-git-send-email-a.hajda@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:46354 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752670AbbGIO20 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 9 Jul 2015 10:28:26 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NR800ETW5JD3G70@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 09 Jul 2015 15:28:25 +0100 (BST)
In-reply-to: <1436452092-20757-1-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: Andrzej Hajda <a.hajda@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org

The patch removes redundant fields from hdmi_conf_regs. Their values
can be calculated from current_mode. This patch is the first step to remove
whole hdmi_conf_regs structure.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_hdmi.c | 68 +++++++++++++-----------------------
 1 file changed, 24 insertions(+), 44 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
index f9c4de1..a3fe2f0 100644
--- a/drivers/gpu/drm/exynos/exynos_hdmi.c
+++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
@@ -169,14 +169,9 @@ struct hdmi_v14_conf {
 	struct hdmi_tg_regs tg;
 };
 
-struct hdmi_conf_regs {
-	int pixel_clock;
-	int cea_video_id;
-	enum hdmi_picture_aspect aspect_ratio;
-	union {
-		struct hdmi_v13_conf v13_conf;
-		struct hdmi_v14_conf v14_conf;
-	} conf;
+union hdmi_conf_regs {
+	struct hdmi_v13_conf v13_conf;
+	struct hdmi_v14_conf v14_conf;
 };
 
 struct hdmi_context {
@@ -197,7 +192,8 @@ struct hdmi_context {
 
 	/* current hdmiphy conf regs */
 	struct drm_display_mode		current_mode;
-	struct hdmi_conf_regs		mode_conf;
+	u8				cea_video_id;
+	union hdmi_conf_regs		mode_conf;
 
 	struct hdmi_resources		res;
 	const struct hdmi_driver_data	*drv_data;
@@ -951,7 +947,7 @@ static void hdmi_reg_infoframe(struct hdmi_context *hdata,
 	u32 hdr_sum;
 	u8 chksum;
 	u32 mod;
-	u32 vic;
+	u8 ar;
 
 	mod = hdmi_reg_read(hdata, HDMI_MODE_SEL);
 	if (hdata->dvi_mode) {
@@ -982,27 +978,22 @@ static void hdmi_reg_infoframe(struct hdmi_context *hdata,
 		 * Set the aspect ratio as per the mode, mentioned in
 		 * Table 9 AVI InfoFrame Data Byte 2 of CEA-861-D Standard
 		 */
-		switch (hdata->mode_conf.aspect_ratio) {
+		ar = hdata->current_mode.picture_aspect_ratio;
+		switch (ar) {
 		case HDMI_PICTURE_ASPECT_4_3:
-			hdmi_reg_writeb(hdata, HDMI_AVI_BYTE(2),
-					hdata->mode_conf.aspect_ratio |
-					AVI_4_3_CENTER_RATIO);
+			ar |= AVI_4_3_CENTER_RATIO;
 			break;
 		case HDMI_PICTURE_ASPECT_16_9:
-			hdmi_reg_writeb(hdata, HDMI_AVI_BYTE(2),
-					hdata->mode_conf.aspect_ratio |
-					AVI_16_9_CENTER_RATIO);
+			ar |= AVI_16_9_CENTER_RATIO;
 			break;
 		case HDMI_PICTURE_ASPECT_NONE:
 		default:
-			hdmi_reg_writeb(hdata, HDMI_AVI_BYTE(2),
-					hdata->mode_conf.aspect_ratio |
-					AVI_SAME_AS_PIC_ASPECT_RATIO);
+			ar |= AVI_SAME_AS_PIC_ASPECT_RATIO;
 			break;
 		}
+		hdmi_reg_writeb(hdata, HDMI_AVI_BYTE(2), ar);
 
-		vic = hdata->mode_conf.cea_video_id;
-		hdmi_reg_writeb(hdata, HDMI_AVI_BYTE(4), vic);
+		hdmi_reg_writeb(hdata, HDMI_AVI_BYTE(4), hdata->cea_video_id);
 
 		chksum = hdmi_chksum(hdata, HDMI_AVI_BYTE(1),
 					infoframe->any.length, hdr_sum);
@@ -1418,9 +1409,8 @@ static void hdmi_conf_init(struct hdmi_context *hdata)
 
 static void hdmi_v13_mode_apply(struct hdmi_context *hdata)
 {
-	const struct hdmi_tg_regs *tg = &hdata->mode_conf.conf.v13_conf.tg;
-	const struct hdmi_v13_core_regs *core =
-		&hdata->mode_conf.conf.v13_conf.core;
+	const struct hdmi_tg_regs *tg = &hdata->mode_conf.v13_conf.tg;
+	const struct hdmi_v13_core_regs *core = &hdata->mode_conf.v13_conf.core;
 	int tries;
 
 	/* setting core registers */
@@ -1502,9 +1492,8 @@ static void hdmi_v13_mode_apply(struct hdmi_context *hdata)
 
 static void hdmi_v14_mode_apply(struct hdmi_context *hdata)
 {
-	const struct hdmi_tg_regs *tg = &hdata->mode_conf.conf.v14_conf.tg;
-	const struct hdmi_v14_core_regs *core =
-		&hdata->mode_conf.conf.v14_conf.core;
+	const struct hdmi_tg_regs *tg = &hdata->mode_conf.v14_conf.tg;
+	const struct hdmi_v14_core_regs *core = &hdata->mode_conf.v14_conf.core;
 	int tries;
 
 	/* setting core registers */
@@ -1742,7 +1731,7 @@ static void hdmiphy_conf_apply(struct hdmi_context *hdata)
 	int i;
 
 	/* pixel clock */
-	i = hdmi_find_phy_conf(hdata, hdata->mode_conf.pixel_clock);
+	i = hdmi_find_phy_conf(hdata, hdata->current_mode.clock * 1000);
 	if (i < 0) {
 		DRM_ERROR("failed to find hdmiphy conf\n");
 		return;
@@ -1794,15 +1783,10 @@ static void hdmi_set_reg(u8 *reg_pair, int num_bytes, u32 value)
 static void hdmi_v13_mode_set(struct hdmi_context *hdata,
 			struct drm_display_mode *m)
 {
-	struct hdmi_v13_core_regs *core = &hdata->mode_conf.conf.v13_conf.core;
-	struct hdmi_tg_regs *tg = &hdata->mode_conf.conf.v13_conf.tg;
+	struct hdmi_v13_core_regs *core = &hdata->mode_conf.v13_conf.core;
+	struct hdmi_tg_regs *tg = &hdata->mode_conf.v13_conf.tg;
 	unsigned int val;
 
-	hdata->mode_conf.cea_video_id =
-		drm_match_cea_mode((struct drm_display_mode *)m);
-	hdata->mode_conf.pixel_clock = m->clock * 1000;
-	hdata->mode_conf.aspect_ratio = m->picture_aspect_ratio;
-
 	hdmi_set_reg(core->h_blank, 2, m->htotal - m->hdisplay);
 	hdmi_set_reg(core->h_v_line, 3, (m->htotal << 12) | m->vtotal);
 
@@ -1891,14 +1875,8 @@ static void hdmi_v13_mode_set(struct hdmi_context *hdata,
 static void hdmi_v14_mode_set(struct hdmi_context *hdata,
 			struct drm_display_mode *m)
 {
-	struct hdmi_tg_regs *tg = &hdata->mode_conf.conf.v14_conf.tg;
-	struct hdmi_v14_core_regs *core =
-		&hdata->mode_conf.conf.v14_conf.core;
-
-	hdata->mode_conf.cea_video_id =
-		drm_match_cea_mode((struct drm_display_mode *)m);
-	hdata->mode_conf.pixel_clock = m->clock * 1000;
-	hdata->mode_conf.aspect_ratio = m->picture_aspect_ratio;
+	struct hdmi_tg_regs *tg = &hdata->mode_conf.v14_conf.tg;
+	struct hdmi_v14_core_regs *core = &hdata->mode_conf.v14_conf.core;
 
 	hdmi_set_reg(core->h_blank, 2, m->htotal - m->hdisplay);
 	hdmi_set_reg(core->v_line, 2, m->vtotal);
@@ -2014,6 +1992,8 @@ static void hdmi_mode_set(struct exynos_drm_display *display,
 	/* preserve mode information for later use. */
 	drm_mode_copy(&hdata->current_mode, mode);
 
+	hdata->cea_video_id = drm_match_cea_mode(mode);
+
 	if (hdata->drv_data->type == HDMI_TYPE13)
 		hdmi_v13_mode_set(hdata, mode);
 	else
-- 
1.9.1
