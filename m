From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 6/7] drm/exynos/hdmi: remove hdmi_v13_conf struct
Date: Thu, 09 Jul 2015 16:28:11 +0200
Message-ID: <1436452092-20757-7-git-send-email-a.hajda@samsung.com>
References: <1436452092-20757-1-git-send-email-a.hajda@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:46354 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752732AbbGIO2a (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 9 Jul 2015 10:28:30 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NR800DWS5JE2F70@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 09 Jul 2015 15:28:26 +0100 (BST)
In-reply-to: <1436452092-20757-1-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: Andrzej Hajda <a.hajda@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org

The patch removes intermediate struct for HDMIv13 register configuration,
instead registry values are calculated on the fly.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_hdmi.c | 280 +++++++++++++----------------------
 1 file changed, 101 insertions(+), 179 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
index a3fe2f0..60663ad 100644
--- a/drivers/gpu/drm/exynos/exynos_hdmi.c
+++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
@@ -107,19 +107,6 @@ struct hdmi_tg_regs {
 	u8 tg_3d[1];
 };
 
-struct hdmi_v13_core_regs {
-	u8 h_blank[2];
-	u8 v_blank[3];
-	u8 h_v_line[3];
-	u8 vsync_pol[1];
-	u8 int_pro_mode[1];
-	u8 v_blank_f[3];
-	u8 h_sync_gen[3];
-	u8 v_sync_gen1[3];
-	u8 v_sync_gen2[3];
-	u8 v_sync_gen3[3];
-};
-
 struct hdmi_v14_core_regs {
 	u8 h_blank[2];
 	u8 v2_blank[2];
@@ -159,21 +146,11 @@ struct hdmi_v14_core_regs {
 	u8 vact_space_6[2];
 };
 
-struct hdmi_v13_conf {
-	struct hdmi_v13_core_regs core;
-	struct hdmi_tg_regs tg;
-};
-
 struct hdmi_v14_conf {
 	struct hdmi_v14_core_regs core;
 	struct hdmi_tg_regs tg;
 };
 
-union hdmi_conf_regs {
-	struct hdmi_v13_conf v13_conf;
-	struct hdmi_v14_conf v14_conf;
-};
-
 struct hdmi_context {
 	struct exynos_drm_display	display;
 	struct device			*dev;
@@ -193,7 +170,7 @@ struct hdmi_context {
 	/* current hdmiphy conf regs */
 	struct drm_display_mode		current_mode;
 	u8				cea_video_id;
-	union hdmi_conf_regs		mode_conf;
+	struct hdmi_v14_conf		mode_conf;
 
 	struct hdmi_resources		res;
 	const struct hdmi_driver_data	*drv_data;
@@ -614,6 +591,16 @@ static inline void hdmi_reg_writeb(struct hdmi_context *hdata,
 	writeb(value, hdata->regs + reg_id);
 }
 
+static inline void hdmi_reg_writev(struct hdmi_context *hdata, u32 reg_id,
+				   int bytes, u32 val)
+{
+	while (--bytes >= 0) {
+		writeb(val & 0xff, hdata->regs + reg_id);
+		val >>= 8;
+		reg_id += 4;
+	}
+}
+
 static inline void hdmi_reg_writemask(struct hdmi_context *hdata,
 				 u32 reg_id, u32 value, u32 mask)
 {
@@ -1409,65 +1396,94 @@ static void hdmi_conf_init(struct hdmi_context *hdata)
 
 static void hdmi_v13_mode_apply(struct hdmi_context *hdata)
 {
-	const struct hdmi_tg_regs *tg = &hdata->mode_conf.v13_conf.tg;
-	const struct hdmi_v13_core_regs *core = &hdata->mode_conf.v13_conf.core;
+	struct drm_display_mode *m = &hdata->current_mode;
+	unsigned int val;
 	int tries;
 
-	/* setting core registers */
-	hdmi_reg_writeb(hdata, HDMI_H_BLANK_0, core->h_blank[0]);
-	hdmi_reg_writeb(hdata, HDMI_H_BLANK_1, core->h_blank[1]);
-	hdmi_reg_writeb(hdata, HDMI_V13_V_BLANK_0, core->v_blank[0]);
-	hdmi_reg_writeb(hdata, HDMI_V13_V_BLANK_1, core->v_blank[1]);
-	hdmi_reg_writeb(hdata, HDMI_V13_V_BLANK_2, core->v_blank[2]);
-	hdmi_reg_writeb(hdata, HDMI_V13_H_V_LINE_0, core->h_v_line[0]);
-	hdmi_reg_writeb(hdata, HDMI_V13_H_V_LINE_1, core->h_v_line[1]);
-	hdmi_reg_writeb(hdata, HDMI_V13_H_V_LINE_2, core->h_v_line[2]);
-	hdmi_reg_writeb(hdata, HDMI_VSYNC_POL, core->vsync_pol[0]);
-	hdmi_reg_writeb(hdata, HDMI_INT_PRO_MODE, core->int_pro_mode[0]);
-	hdmi_reg_writeb(hdata, HDMI_V13_V_BLANK_F_0, core->v_blank_f[0]);
-	hdmi_reg_writeb(hdata, HDMI_V13_V_BLANK_F_1, core->v_blank_f[1]);
-	hdmi_reg_writeb(hdata, HDMI_V13_V_BLANK_F_2, core->v_blank_f[2]);
-	hdmi_reg_writeb(hdata, HDMI_V13_H_SYNC_GEN_0, core->h_sync_gen[0]);
-	hdmi_reg_writeb(hdata, HDMI_V13_H_SYNC_GEN_1, core->h_sync_gen[1]);
-	hdmi_reg_writeb(hdata, HDMI_V13_H_SYNC_GEN_2, core->h_sync_gen[2]);
-	hdmi_reg_writeb(hdata, HDMI_V13_V_SYNC_GEN_1_0, core->v_sync_gen1[0]);
-	hdmi_reg_writeb(hdata, HDMI_V13_V_SYNC_GEN_1_1, core->v_sync_gen1[1]);
-	hdmi_reg_writeb(hdata, HDMI_V13_V_SYNC_GEN_1_2, core->v_sync_gen1[2]);
-	hdmi_reg_writeb(hdata, HDMI_V13_V_SYNC_GEN_2_0, core->v_sync_gen2[0]);
-	hdmi_reg_writeb(hdata, HDMI_V13_V_SYNC_GEN_2_1, core->v_sync_gen2[1]);
-	hdmi_reg_writeb(hdata, HDMI_V13_V_SYNC_GEN_2_2, core->v_sync_gen2[2]);
-	hdmi_reg_writeb(hdata, HDMI_V13_V_SYNC_GEN_3_0, core->v_sync_gen3[0]);
-	hdmi_reg_writeb(hdata, HDMI_V13_V_SYNC_GEN_3_1, core->v_sync_gen3[1]);
-	hdmi_reg_writeb(hdata, HDMI_V13_V_SYNC_GEN_3_2, core->v_sync_gen3[2]);
+	hdmi_reg_writev(hdata, HDMI_H_BLANK_0, 2, m->htotal - m->hdisplay);
+	hdmi_reg_writev(hdata, HDMI_V13_H_V_LINE_0, 3,
+			(m->htotal << 12) | m->vtotal);
+
+	val = (m->flags & DRM_MODE_FLAG_NVSYNC) ? 1 : 0;
+	hdmi_reg_writev(hdata, HDMI_VSYNC_POL, 1, val);
+
+	val = (m->flags & DRM_MODE_FLAG_INTERLACE) ? 1 : 0;
+	hdmi_reg_writev(hdata, HDMI_INT_PRO_MODE, 1, val);
+
+	val = (m->hsync_start - m->hdisplay - 2);
+	val |= ((m->hsync_end - m->hdisplay - 2) << 10);
+	val |= ((m->flags & DRM_MODE_FLAG_NHSYNC)  ? 1 : 0)<<20;
+	hdmi_reg_writev(hdata, HDMI_V13_H_SYNC_GEN_0, 3, val);
+
+	/*
+	 * Quirk requirement for exynos HDMI IP design,
+	 * 2 pixels less than the actual calculation for hsync_start
+	 * and end.
+	 */
+
+	/* Following values & calculations differ for different type of modes */
+	if (m->flags & DRM_MODE_FLAG_INTERLACE) {
+		/* Interlaced Mode */
+		val = ((m->vsync_end - m->vdisplay) / 2);
+		val |= ((m->vsync_start - m->vdisplay) / 2) << 12;
+		hdmi_reg_writev(hdata, HDMI_V13_V_SYNC_GEN_1_0, 3, val);
+
+		val = m->vtotal / 2;
+		val |= ((m->vtotal - m->vdisplay) / 2) << 11;
+		hdmi_reg_writev(hdata, HDMI_V13_V_BLANK_0, 3, val);
+
+		val = (m->vtotal +
+			((m->vsync_end - m->vsync_start) * 4) + 5) / 2;
+		val |= m->vtotal << 11;
+		hdmi_reg_writev(hdata, HDMI_V13_V_BLANK_F_0, 3, val);
+
+		val = ((m->vtotal / 2) + 7);
+		val |= ((m->vtotal / 2) + 2) << 12;
+		hdmi_reg_writev(hdata, HDMI_V13_V_SYNC_GEN_2_0, 3, val);
+
+		val = ((m->htotal / 2) + (m->hsync_start - m->hdisplay));
+		val |= ((m->htotal / 2) +
+			(m->hsync_start - m->hdisplay)) << 12;
+		hdmi_reg_writev(hdata, HDMI_V13_V_SYNC_GEN_3_0, 3, val);
+
+		hdmi_reg_writev(hdata, HDMI_TG_VACT_ST_L, 2,
+				(m->vtotal - m->vdisplay) / 2);
+		hdmi_reg_writev(hdata, HDMI_TG_VACT_SZ_L, 2, m->vdisplay / 2);
+
+		hdmi_reg_writev(hdata, HDMI_TG_VACT_ST2_L, 2, 0x249);
+	} else {
+		/* Progressive Mode */
+
+		val = m->vtotal;
+		val |= (m->vtotal - m->vdisplay) << 11;
+		hdmi_reg_writev(hdata, HDMI_V13_V_BLANK_0, 3, val);
+
+		hdmi_reg_writev(hdata, HDMI_V13_V_BLANK_F_0, 3, 0);
+
+		val = (m->vsync_end - m->vdisplay);
+		val |= ((m->vsync_start - m->vdisplay) << 12);
+		hdmi_reg_writev(hdata, HDMI_V13_V_SYNC_GEN_1_0, 3, val);
+
+		hdmi_reg_writev(hdata, HDMI_V13_V_SYNC_GEN_2_0, 3, 0x1001);
+		hdmi_reg_writev(hdata, HDMI_V13_V_SYNC_GEN_3_0, 3, 0x1001);
+		hdmi_reg_writev(hdata, HDMI_TG_VACT_ST_L, 2,
+				m->vtotal - m->vdisplay);
+		hdmi_reg_writev(hdata, HDMI_TG_VACT_SZ_L, 2, m->vdisplay);
+		hdmi_reg_writev(hdata, HDMI_TG_VACT_ST2_L, 2, 0x248);
+	}
+
 	/* Timing generator registers */
-	hdmi_reg_writeb(hdata, HDMI_TG_H_FSZ_L, tg->h_fsz[0]);
-	hdmi_reg_writeb(hdata, HDMI_TG_H_FSZ_H, tg->h_fsz[1]);
-	hdmi_reg_writeb(hdata, HDMI_TG_HACT_ST_L, tg->hact_st[0]);
-	hdmi_reg_writeb(hdata, HDMI_TG_HACT_ST_H, tg->hact_st[1]);
-	hdmi_reg_writeb(hdata, HDMI_TG_HACT_SZ_L, tg->hact_sz[0]);
-	hdmi_reg_writeb(hdata, HDMI_TG_HACT_SZ_H, tg->hact_sz[1]);
-	hdmi_reg_writeb(hdata, HDMI_TG_V_FSZ_L, tg->v_fsz[0]);
-	hdmi_reg_writeb(hdata, HDMI_TG_V_FSZ_H, tg->v_fsz[1]);
-	hdmi_reg_writeb(hdata, HDMI_TG_VSYNC_L, tg->vsync[0]);
-	hdmi_reg_writeb(hdata, HDMI_TG_VSYNC_H, tg->vsync[1]);
-	hdmi_reg_writeb(hdata, HDMI_TG_VSYNC2_L, tg->vsync2[0]);
-	hdmi_reg_writeb(hdata, HDMI_TG_VSYNC2_H, tg->vsync2[1]);
-	hdmi_reg_writeb(hdata, HDMI_TG_VACT_ST_L, tg->vact_st[0]);
-	hdmi_reg_writeb(hdata, HDMI_TG_VACT_ST_H, tg->vact_st[1]);
-	hdmi_reg_writeb(hdata, HDMI_TG_VACT_SZ_L, tg->vact_sz[0]);
-	hdmi_reg_writeb(hdata, HDMI_TG_VACT_SZ_H, tg->vact_sz[1]);
-	hdmi_reg_writeb(hdata, HDMI_TG_FIELD_CHG_L, tg->field_chg[0]);
-	hdmi_reg_writeb(hdata, HDMI_TG_FIELD_CHG_H, tg->field_chg[1]);
-	hdmi_reg_writeb(hdata, HDMI_TG_VACT_ST2_L, tg->vact_st2[0]);
-	hdmi_reg_writeb(hdata, HDMI_TG_VACT_ST2_H, tg->vact_st2[1]);
-	hdmi_reg_writeb(hdata, HDMI_TG_VSYNC_TOP_HDMI_L, tg->vsync_top_hdmi[0]);
-	hdmi_reg_writeb(hdata, HDMI_TG_VSYNC_TOP_HDMI_H, tg->vsync_top_hdmi[1]);
-	hdmi_reg_writeb(hdata, HDMI_TG_VSYNC_BOT_HDMI_L, tg->vsync_bot_hdmi[0]);
-	hdmi_reg_writeb(hdata, HDMI_TG_VSYNC_BOT_HDMI_H, tg->vsync_bot_hdmi[1]);
-	hdmi_reg_writeb(hdata, HDMI_TG_FIELD_TOP_HDMI_L, tg->field_top_hdmi[0]);
-	hdmi_reg_writeb(hdata, HDMI_TG_FIELD_TOP_HDMI_H, tg->field_top_hdmi[1]);
-	hdmi_reg_writeb(hdata, HDMI_TG_FIELD_BOT_HDMI_L, tg->field_bot_hdmi[0]);
-	hdmi_reg_writeb(hdata, HDMI_TG_FIELD_BOT_HDMI_H, tg->field_bot_hdmi[1]);
+	hdmi_reg_writev(hdata, HDMI_TG_H_FSZ_L, 2, m->htotal);
+	hdmi_reg_writev(hdata, HDMI_TG_HACT_ST_L, 2, m->htotal - m->hdisplay);
+	hdmi_reg_writev(hdata, HDMI_TG_HACT_SZ_L, 2, m->hdisplay);
+	hdmi_reg_writev(hdata, HDMI_TG_V_FSZ_L, 2, m->vtotal);
+	hdmi_reg_writev(hdata, HDMI_TG_VSYNC_L, 2, 0x1);
+	hdmi_reg_writev(hdata, HDMI_TG_VSYNC2_L, 2, 0x233);
+	hdmi_reg_writev(hdata, HDMI_TG_FIELD_CHG_L, 2, 0x233);
+	hdmi_reg_writev(hdata, HDMI_TG_VSYNC_TOP_HDMI_L, 2, 0x1);
+	hdmi_reg_writev(hdata, HDMI_TG_VSYNC_BOT_HDMI_L, 2, 0x233);
+	hdmi_reg_writev(hdata, HDMI_TG_FIELD_TOP_HDMI_L, 2, 0x1);
+	hdmi_reg_writev(hdata, HDMI_TG_FIELD_BOT_HDMI_L, 2, 0x233);
 
 	/* waiting for HDMIPHY's PLL to get to steady state */
 	for (tries = 100; tries; --tries) {
@@ -1492,8 +1508,8 @@ static void hdmi_v13_mode_apply(struct hdmi_context *hdata)
 
 static void hdmi_v14_mode_apply(struct hdmi_context *hdata)
 {
-	const struct hdmi_tg_regs *tg = &hdata->mode_conf.v14_conf.tg;
-	const struct hdmi_v14_core_regs *core = &hdata->mode_conf.v14_conf.core;
+	const struct hdmi_tg_regs *tg = &hdata->mode_conf.tg;
+	const struct hdmi_v14_core_regs *core = &hdata->mode_conf.core;
 	int tries;
 
 	/* setting core registers */
@@ -1780,103 +1796,11 @@ static void hdmi_set_reg(u8 *reg_pair, int num_bytes, u32 value)
 		reg_pair[i] = (value >> (8 * i)) & 0xff;
 }
 
-static void hdmi_v13_mode_set(struct hdmi_context *hdata,
-			struct drm_display_mode *m)
-{
-	struct hdmi_v13_core_regs *core = &hdata->mode_conf.v13_conf.core;
-	struct hdmi_tg_regs *tg = &hdata->mode_conf.v13_conf.tg;
-	unsigned int val;
-
-	hdmi_set_reg(core->h_blank, 2, m->htotal - m->hdisplay);
-	hdmi_set_reg(core->h_v_line, 3, (m->htotal << 12) | m->vtotal);
-
-	val = (m->flags & DRM_MODE_FLAG_NVSYNC) ? 1 : 0;
-	hdmi_set_reg(core->vsync_pol, 1, val);
-
-	val = (m->flags & DRM_MODE_FLAG_INTERLACE) ? 1 : 0;
-	hdmi_set_reg(core->int_pro_mode, 1, val);
-
-	val = (m->hsync_start - m->hdisplay - 2);
-	val |= ((m->hsync_end - m->hdisplay - 2) << 10);
-	val |= ((m->flags & DRM_MODE_FLAG_NHSYNC)  ? 1 : 0)<<20;
-	hdmi_set_reg(core->h_sync_gen, 3, val);
-
-	/*
-	 * Quirk requirement for exynos HDMI IP design,
-	 * 2 pixels less than the actual calculation for hsync_start
-	 * and end.
-	 */
-
-	/* Following values & calculations differ for different type of modes */
-	if (m->flags & DRM_MODE_FLAG_INTERLACE) {
-		/* Interlaced Mode */
-		val = ((m->vsync_end - m->vdisplay) / 2);
-		val |= ((m->vsync_start - m->vdisplay) / 2) << 12;
-		hdmi_set_reg(core->v_sync_gen1, 3, val);
-
-		val = m->vtotal / 2;
-		val |= ((m->vtotal - m->vdisplay) / 2) << 11;
-		hdmi_set_reg(core->v_blank, 3, val);
-
-		val = (m->vtotal +
-			((m->vsync_end - m->vsync_start) * 4) + 5) / 2;
-		val |= m->vtotal << 11;
-		hdmi_set_reg(core->v_blank_f, 3, val);
-
-		val = ((m->vtotal / 2) + 7);
-		val |= ((m->vtotal / 2) + 2) << 12;
-		hdmi_set_reg(core->v_sync_gen2, 3, val);
-
-		val = ((m->htotal / 2) + (m->hsync_start - m->hdisplay));
-		val |= ((m->htotal / 2) +
-			(m->hsync_start - m->hdisplay)) << 12;
-		hdmi_set_reg(core->v_sync_gen3, 3, val);
-
-		hdmi_set_reg(tg->vact_st, 2, (m->vtotal - m->vdisplay) / 2);
-		hdmi_set_reg(tg->vact_sz, 2, m->vdisplay / 2);
-
-		hdmi_set_reg(tg->vact_st2, 2, 0x249);/* Reset value + 1*/
-	} else {
-		/* Progressive Mode */
-
-		val = m->vtotal;
-		val |= (m->vtotal - m->vdisplay) << 11;
-		hdmi_set_reg(core->v_blank, 3, val);
-
-		hdmi_set_reg(core->v_blank_f, 3, 0);
-
-		val = (m->vsync_end - m->vdisplay);
-		val |= ((m->vsync_start - m->vdisplay) << 12);
-		hdmi_set_reg(core->v_sync_gen1, 3, val);
-
-		hdmi_set_reg(core->v_sync_gen2, 3, 0x1001);/* Reset value  */
-		hdmi_set_reg(core->v_sync_gen3, 3, 0x1001);/* Reset value  */
-		hdmi_set_reg(tg->vact_st, 2, m->vtotal - m->vdisplay);
-		hdmi_set_reg(tg->vact_sz, 2, m->vdisplay);
-		hdmi_set_reg(tg->vact_st2, 2, 0x248); /* Reset value */
-	}
-
-	/* Timing generator registers */
-	hdmi_set_reg(tg->cmd, 1, 0x0);
-	hdmi_set_reg(tg->h_fsz, 2, m->htotal);
-	hdmi_set_reg(tg->hact_st, 2, m->htotal - m->hdisplay);
-	hdmi_set_reg(tg->hact_sz, 2, m->hdisplay);
-	hdmi_set_reg(tg->v_fsz, 2, m->vtotal);
-	hdmi_set_reg(tg->vsync, 2, 0x1);
-	hdmi_set_reg(tg->vsync2, 2, 0x233); /* Reset value */
-	hdmi_set_reg(tg->field_chg, 2, 0x233); /* Reset value */
-	hdmi_set_reg(tg->vsync_top_hdmi, 2, 0x1); /* Reset value */
-	hdmi_set_reg(tg->vsync_bot_hdmi, 2, 0x233); /* Reset value */
-	hdmi_set_reg(tg->field_top_hdmi, 2, 0x1); /* Reset value */
-	hdmi_set_reg(tg->field_bot_hdmi, 2, 0x233); /* Reset value */
-	hdmi_set_reg(tg->tg_3d, 1, 0x0); /* Not used */
-}
-
 static void hdmi_v14_mode_set(struct hdmi_context *hdata,
 			struct drm_display_mode *m)
 {
-	struct hdmi_tg_regs *tg = &hdata->mode_conf.v14_conf.tg;
-	struct hdmi_v14_core_regs *core = &hdata->mode_conf.v14_conf.core;
+	struct hdmi_tg_regs *tg = &hdata->mode_conf.tg;
+	struct hdmi_v14_core_regs *core = &hdata->mode_conf.core;
 
 	hdmi_set_reg(core->h_blank, 2, m->htotal - m->hdisplay);
 	hdmi_set_reg(core->v_line, 2, m->vtotal);
@@ -1994,9 +1918,7 @@ static void hdmi_mode_set(struct exynos_drm_display *display,
 
 	hdata->cea_video_id = drm_match_cea_mode(mode);
 
-	if (hdata->drv_data->type == HDMI_TYPE13)
-		hdmi_v13_mode_set(hdata, mode);
-	else
+	if (hdata->drv_data->type == HDMI_TYPE14)
 		hdmi_v14_mode_set(hdata, mode);
 }
 
-- 
1.9.1
