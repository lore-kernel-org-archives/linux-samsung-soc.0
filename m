From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [PATCH v4 4/4] drm/exynos: hdmi: support extra resolutions using
 drm_display_mode timings
Date: Tue, 15 Jan 2013 08:11:08 -0500
Message-ID: <1358255468-14287-5-git-send-email-rahul.sharma@samsung.com>
References: <1358255468-14287-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:52287 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752730Ab3AOMxR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 15 Jan 2013 07:53:17 -0500
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MGO00MDP3SLOK20@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 15 Jan 2013 21:53:15 +0900 (KST)
Received: from chrome-ubuntu.sisodomain.com ([107.108.73.106])
 by mmp1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTPA id <0MGO00A5V3M1A810@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 15 Jan 2013 21:53:15 +0900 (KST)
In-reply-to: <1358255468-14287-1-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: inki.dae@samsung.com, seanpaul@google.com, r.sh.open@gmail.com, sw0312.kim@samsung.com, joshi@samsung.com

From: Sean Paul <seanpaul@chromium.org>

This patch programs the core and timing generator registers using the
timing data provided in drm_display_mode and not using hard-coded
configurations.

Additional PHY configs has been added. This allows us to support more
permissible resolutions and refresh rates.

Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
Signed-off-by: Sean Paul <seanpaul@chromium.org>
Signed-off-by: Shirish S <s.shirish@samsung.com>
Signed-off-by: Akshay Saraswat <Akshay.s@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_hdmi.c | 1022 +++++++++++++---------------------
 1 file changed, 374 insertions(+), 648 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
index 7332a6f..a9a3538 100644
--- a/drivers/gpu/drm/exynos/exynos_hdmi.c
+++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
@@ -88,6 +88,73 @@ struct hdmi_resources {
 	int				regul_count;
 };
 
+struct hdmi_tg_regs {
+	u8 cmd[1];
+	u8 h_fsz[2];
+	u8 hact_st[2];
+	u8 hact_sz[2];
+	u8 v_fsz[2];
+	u8 vsync[2];
+	u8 vsync2[2];
+	u8 vact_st[2];
+	u8 vact_sz[2];
+	u8 field_chg[2];
+	u8 vact_st2[2];
+	u8 vact_st3[2];
+	u8 vact_st4[2];
+	u8 vsync_top_hdmi[2];
+	u8 vsync_bot_hdmi[2];
+	u8 field_top_hdmi[2];
+	u8 field_bot_hdmi[2];
+	u8 tg_3d[1];
+};
+
+struct hdmi_core_regs {
+	u8 h_blank[2];
+	u8 v2_blank[2];
+	u8 v1_blank[2];
+	u8 v_line[2];
+	u8 h_line[2];
+	u8 hsync_pol[1];
+	u8 vsync_pol[1];
+	u8 int_pro_mode[1];
+	u8 v_blank_f0[2];
+	u8 v_blank_f1[2];
+	u8 h_sync_start[2];
+	u8 h_sync_end[2];
+	u8 v_sync_line_bef_2[2];
+	u8 v_sync_line_bef_1[2];
+	u8 v_sync_line_aft_2[2];
+	u8 v_sync_line_aft_1[2];
+	u8 v_sync_line_aft_pxl_2[2];
+	u8 v_sync_line_aft_pxl_1[2];
+	u8 v_blank_f2[2]; /* for 3D mode */
+	u8 v_blank_f3[2]; /* for 3D mode */
+	u8 v_blank_f4[2]; /* for 3D mode */
+	u8 v_blank_f5[2]; /* for 3D mode */
+	u8 v_sync_line_aft_3[2];
+	u8 v_sync_line_aft_4[2];
+	u8 v_sync_line_aft_5[2];
+	u8 v_sync_line_aft_6[2];
+	u8 v_sync_line_aft_pxl_3[2];
+	u8 v_sync_line_aft_pxl_4[2];
+	u8 v_sync_line_aft_pxl_5[2];
+	u8 v_sync_line_aft_pxl_6[2];
+	u8 vact_space_1[2];
+	u8 vact_space_2[2];
+	u8 vact_space_3[2];
+	u8 vact_space_4[2];
+	u8 vact_space_5[2];
+	u8 vact_space_6[2];
+};
+
+struct hdmi_v14_conf {
+	int pixel_clock;
+	struct hdmi_core_regs core;
+	struct hdmi_tg_regs tg;
+	int cea_video_id;
+};
+
 struct hdmi_context {
 	struct device			*dev;
 	struct drm_device		*drm_dev;
@@ -106,6 +173,7 @@ struct hdmi_context {
 
 	/* current hdmiphy conf index */
 	int cur_conf;
+	struct hdmi_v14_conf		mode_conf;
 
 	struct hdmi_resources		res;
 
@@ -394,586 +462,132 @@ static const struct hdmi_v13_conf hdmi_v13_confs[] = {
 };
 
 /* HDMI Version 1.4 */
-static const u8 hdmiphy_conf27_027[32] = {
-	0x01, 0xd1, 0x2d, 0x72, 0x40, 0x64, 0x12, 0x08,
-	0x43, 0xa0, 0x0e, 0xd9, 0x45, 0xa0, 0xac, 0x80,
-	0x08, 0x80, 0x11, 0x04, 0x02, 0x22, 0x44, 0x86,
-	0x54, 0xe3, 0x24, 0x00, 0x00, 0x00, 0x01, 0x00,
-};
-
-static const u8 hdmiphy_conf74_176[32] = {
-	0x01, 0xd1, 0x1f, 0x10, 0x40, 0x5b, 0xef, 0x08,
-	0x81, 0xa0, 0xb9, 0xd8, 0x45, 0xa0, 0xac, 0x80,
-	0x5a, 0x80, 0x11, 0x04, 0x02, 0x22, 0x44, 0x86,
-	0x54, 0xa6, 0x24, 0x01, 0x00, 0x00, 0x01, 0x00,
-};
-
-static const u8 hdmiphy_conf74_25[32] = {
-	0x01, 0xd1, 0x1f, 0x10, 0x40, 0x40, 0xf8, 0x08,
-	0x81, 0xa0, 0xba, 0xd8, 0x45, 0xa0, 0xac, 0x80,
-	0x3c, 0x80, 0x11, 0x04, 0x02, 0x22, 0x44, 0x86,
-	0x54, 0xa5, 0x24, 0x01, 0x00, 0x00, 0x01, 0x00,
-};
-
-static const u8 hdmiphy_conf148_5[32] = {
-	0x01, 0xd1, 0x1f, 0x00, 0x40, 0x40, 0xf8, 0x08,
-	0x81, 0xa0, 0xba, 0xd8, 0x45, 0xa0, 0xac, 0x80,
-	0x3c, 0x80, 0x11, 0x04, 0x02, 0x22, 0x44, 0x86,
-	0x54, 0x4b, 0x25, 0x03, 0x00, 0x00, 0x01, 0x00,
-};
-
-struct hdmi_tg_regs {
-	u8 cmd;
-	u8 h_fsz_l;
-	u8 h_fsz_h;
-	u8 hact_st_l;
-	u8 hact_st_h;
-	u8 hact_sz_l;
-	u8 hact_sz_h;
-	u8 v_fsz_l;
-	u8 v_fsz_h;
-	u8 vsync_l;
-	u8 vsync_h;
-	u8 vsync2_l;
-	u8 vsync2_h;
-	u8 vact_st_l;
-	u8 vact_st_h;
-	u8 vact_sz_l;
-	u8 vact_sz_h;
-	u8 field_chg_l;
-	u8 field_chg_h;
-	u8 vact_st2_l;
-	u8 vact_st2_h;
-	u8 vact_st3_l;
-	u8 vact_st3_h;
-	u8 vact_st4_l;
-	u8 vact_st4_h;
-	u8 vsync_top_hdmi_l;
-	u8 vsync_top_hdmi_h;
-	u8 vsync_bot_hdmi_l;
-	u8 vsync_bot_hdmi_h;
-	u8 field_top_hdmi_l;
-	u8 field_top_hdmi_h;
-	u8 field_bot_hdmi_l;
-	u8 field_bot_hdmi_h;
-	u8 tg_3d;
-};
-
-struct hdmi_core_regs {
-	u8 h_blank[2];
-	u8 v2_blank[2];
-	u8 v1_blank[2];
-	u8 v_line[2];
-	u8 h_line[2];
-	u8 hsync_pol[1];
-	u8 vsync_pol[1];
-	u8 int_pro_mode[1];
-	u8 v_blank_f0[2];
-	u8 v_blank_f1[2];
-	u8 h_sync_start[2];
-	u8 h_sync_end[2];
-	u8 v_sync_line_bef_2[2];
-	u8 v_sync_line_bef_1[2];
-	u8 v_sync_line_aft_2[2];
-	u8 v_sync_line_aft_1[2];
-	u8 v_sync_line_aft_pxl_2[2];
-	u8 v_sync_line_aft_pxl_1[2];
-	u8 v_blank_f2[2]; /* for 3D mode */
-	u8 v_blank_f3[2]; /* for 3D mode */
-	u8 v_blank_f4[2]; /* for 3D mode */
-	u8 v_blank_f5[2]; /* for 3D mode */
-	u8 v_sync_line_aft_3[2];
-	u8 v_sync_line_aft_4[2];
-	u8 v_sync_line_aft_5[2];
-	u8 v_sync_line_aft_6[2];
-	u8 v_sync_line_aft_pxl_3[2];
-	u8 v_sync_line_aft_pxl_4[2];
-	u8 v_sync_line_aft_pxl_5[2];
-	u8 v_sync_line_aft_pxl_6[2];
-	u8 vact_space_1[2];
-	u8 vact_space_2[2];
-	u8 vact_space_3[2];
-	u8 vact_space_4[2];
-	u8 vact_space_5[2];
-	u8 vact_space_6[2];
-};
-
-struct hdmi_preset_conf {
-	struct hdmi_core_regs core;
-	struct hdmi_tg_regs tg;
-};
-
-struct hdmi_conf {
-	int width;
-	int height;
-	int vrefresh;
-	bool interlace;
-	int cea_video_id;
-	const u8 *hdmiphy_data;
-	const struct hdmi_preset_conf *conf;
-};
-
-static const struct hdmi_preset_conf hdmi_conf_480p60 = {
-	.core = {
-		.h_blank = {0x8a, 0x00},
-		.v2_blank = {0x0d, 0x02},
-		.v1_blank = {0x2d, 0x00},
-		.v_line = {0x0d, 0x02},
-		.h_line = {0x5a, 0x03},
-		.hsync_pol = {0x01},
-		.vsync_pol = {0x01},
-		.int_pro_mode = {0x00},
-		.v_blank_f0 = {0xff, 0xff},
-		.v_blank_f1 = {0xff, 0xff},
-		.h_sync_start = {0x0e, 0x00},
-		.h_sync_end = {0x4c, 0x00},
-		.v_sync_line_bef_2 = {0x0f, 0x00},
-		.v_sync_line_bef_1 = {0x09, 0x00},
-		.v_sync_line_aft_2 = {0xff, 0xff},
-		.v_sync_line_aft_1 = {0xff, 0xff},
-		.v_sync_line_aft_pxl_2 = {0xff, 0xff},
-		.v_sync_line_aft_pxl_1 = {0xff, 0xff},
-		.v_blank_f2 = {0xff, 0xff},
-		.v_blank_f3 = {0xff, 0xff},
-		.v_blank_f4 = {0xff, 0xff},
-		.v_blank_f5 = {0xff, 0xff},
-		.v_sync_line_aft_3 = {0xff, 0xff},
-		.v_sync_line_aft_4 = {0xff, 0xff},
-		.v_sync_line_aft_5 = {0xff, 0xff},
-		.v_sync_line_aft_6 = {0xff, 0xff},
-		.v_sync_line_aft_pxl_3 = {0xff, 0xff},
-		.v_sync_line_aft_pxl_4 = {0xff, 0xff},
-		.v_sync_line_aft_pxl_5 = {0xff, 0xff},
-		.v_sync_line_aft_pxl_6 = {0xff, 0xff},
-		.vact_space_1 = {0xff, 0xff},
-		.vact_space_2 = {0xff, 0xff},
-		.vact_space_3 = {0xff, 0xff},
-		.vact_space_4 = {0xff, 0xff},
-		.vact_space_5 = {0xff, 0xff},
-		.vact_space_6 = {0xff, 0xff},
-		/* other don't care */
-	},
-	.tg = {
-		0x00, /* cmd */
-		0x5a, 0x03, /* h_fsz */
-		0x8a, 0x00, 0xd0, 0x02, /* hact */
-		0x0d, 0x02, /* v_fsz */
-		0x01, 0x00, 0x33, 0x02, /* vsync */
-		0x2d, 0x00, 0xe0, 0x01, /* vact */
-		0x33, 0x02, /* field_chg */
-		0x48, 0x02, /* vact_st2 */
-		0x00, 0x00, /* vact_st3 */
-		0x00, 0x00, /* vact_st4 */
-		0x01, 0x00, 0x01, 0x00, /* vsync top/bot */
-		0x01, 0x00, 0x33, 0x02, /* field top/bot */
-		0x00, /* 3d FP */
-	},
+struct hdmiphy_config {
+	int pixel_clock;
+	u8 conf[32];
 };
 
-static const struct hdmi_preset_conf hdmi_conf_720p50 = {
-	.core = {
-		.h_blank = {0xbc, 0x02},
-		.v2_blank = {0xee, 0x02},
-		.v1_blank = {0x1e, 0x00},
-		.v_line = {0xee, 0x02},
-		.h_line = {0xbc, 0x07},
-		.hsync_pol = {0x00},
-		.vsync_pol = {0x00},
-		.int_pro_mode = {0x00},
-		.v_blank_f0 = {0xff, 0xff},
-		.v_blank_f1 = {0xff, 0xff},
-		.h_sync_start = {0xb6, 0x01},
-		.h_sync_end = {0xde, 0x01},
-		.v_sync_line_bef_2 = {0x0a, 0x00},
-		.v_sync_line_bef_1 = {0x05, 0x00},
-		.v_sync_line_aft_2 = {0xff, 0xff},
-		.v_sync_line_aft_1 = {0xff, 0xff},
-		.v_sync_line_aft_pxl_2 = {0xff, 0xff},
-		.v_sync_line_aft_pxl_1 = {0xff, 0xff},
-		.v_blank_f2 = {0xff, 0xff},
-		.v_blank_f3 = {0xff, 0xff},
-		.v_blank_f4 = {0xff, 0xff},
-		.v_blank_f5 = {0xff, 0xff},
-		.v_sync_line_aft_3 = {0xff, 0xff},
-		.v_sync_line_aft_4 = {0xff, 0xff},
-		.v_sync_line_aft_5 = {0xff, 0xff},
-		.v_sync_line_aft_6 = {0xff, 0xff},
-		.v_sync_line_aft_pxl_3 = {0xff, 0xff},
-		.v_sync_line_aft_pxl_4 = {0xff, 0xff},
-		.v_sync_line_aft_pxl_5 = {0xff, 0xff},
-		.v_sync_line_aft_pxl_6 = {0xff, 0xff},
-		.vact_space_1 = {0xff, 0xff},
-		.vact_space_2 = {0xff, 0xff},
-		.vact_space_3 = {0xff, 0xff},
-		.vact_space_4 = {0xff, 0xff},
-		.vact_space_5 = {0xff, 0xff},
-		.vact_space_6 = {0xff, 0xff},
-		/* other don't care */
-	},
-	.tg = {
-		0x00, /* cmd */
-		0xbc, 0x07, /* h_fsz */
-		0xbc, 0x02, 0x00, 0x05, /* hact */
-		0xee, 0x02, /* v_fsz */
-		0x01, 0x00, 0x33, 0x02, /* vsync */
-		0x1e, 0x00, 0xd0, 0x02, /* vact */
-		0x33, 0x02, /* field_chg */
-		0x48, 0x02, /* vact_st2 */
-		0x00, 0x00, /* vact_st3 */
-		0x00, 0x00, /* vact_st4 */
-		0x01, 0x00, 0x01, 0x00, /* vsync top/bot */
-		0x01, 0x00, 0x33, 0x02, /* field top/bot */
-		0x00, /* 3d FP */
+/* list of all required phy config settings */
+static const struct hdmiphy_config hdmiphy_v14_configs[] = {
+	{
+		.pixel_clock = 25200000,
+		.conf = {
+			0x01, 0x51, 0x2A, 0x75, 0x40, 0x01, 0x00, 0x08,
+			0x82, 0x80, 0xfc, 0xd8, 0x45, 0xa0, 0xac, 0x80,
+			0x08, 0x80, 0x11, 0x04, 0x02, 0x22, 0x44, 0x86,
+			0x54, 0xf4, 0x24, 0x00, 0x00, 0x00, 0x01, 0x80,
+		},
 	},
-};
-
-static const struct hdmi_preset_conf hdmi_conf_720p60 = {
-	.core = {
-		.h_blank = {0x72, 0x01},
-		.v2_blank = {0xee, 0x02},
-		.v1_blank = {0x1e, 0x00},
-		.v_line = {0xee, 0x02},
-		.h_line = {0x72, 0x06},
-		.hsync_pol = {0x00},
-		.vsync_pol = {0x00},
-		.int_pro_mode = {0x00},
-		.v_blank_f0 = {0xff, 0xff},
-		.v_blank_f1 = {0xff, 0xff},
-		.h_sync_start = {0x6c, 0x00},
-		.h_sync_end = {0x94, 0x00},
-		.v_sync_line_bef_2 = {0x0a, 0x00},
-		.v_sync_line_bef_1 = {0x05, 0x00},
-		.v_sync_line_aft_2 = {0xff, 0xff},
-		.v_sync_line_aft_1 = {0xff, 0xff},
-		.v_sync_line_aft_pxl_2 = {0xff, 0xff},
-		.v_sync_line_aft_pxl_1 = {0xff, 0xff},
-		.v_blank_f2 = {0xff, 0xff},
-		.v_blank_f3 = {0xff, 0xff},
-		.v_blank_f4 = {0xff, 0xff},
-		.v_blank_f5 = {0xff, 0xff},
-		.v_sync_line_aft_3 = {0xff, 0xff},
-		.v_sync_line_aft_4 = {0xff, 0xff},
-		.v_sync_line_aft_5 = {0xff, 0xff},
-		.v_sync_line_aft_6 = {0xff, 0xff},
-		.v_sync_line_aft_pxl_3 = {0xff, 0xff},
-		.v_sync_line_aft_pxl_4 = {0xff, 0xff},
-		.v_sync_line_aft_pxl_5 = {0xff, 0xff},
-		.v_sync_line_aft_pxl_6 = {0xff, 0xff},
-		.vact_space_1 = {0xff, 0xff},
-		.vact_space_2 = {0xff, 0xff},
-		.vact_space_3 = {0xff, 0xff},
-		.vact_space_4 = {0xff, 0xff},
-		.vact_space_5 = {0xff, 0xff},
-		.vact_space_6 = {0xff, 0xff},
-		/* other don't care */
+	{
+		.pixel_clock = 27000000,
+		.conf = {
+			0x01, 0xd1, 0x22, 0x51, 0x40, 0x08, 0xfc, 0x20,
+			0x98, 0xa0, 0xcb, 0xd8, 0x45, 0xa0, 0xac, 0x80,
+			0x06, 0x80, 0x11, 0x04, 0x02, 0x22, 0x44, 0x86,
+			0x54, 0xe4, 0x24, 0x00, 0x00, 0x00, 0x01, 0x80,
+		},
 	},
-	.tg = {
-		0x00, /* cmd */
-		0x72, 0x06, /* h_fsz */
-		0x72, 0x01, 0x00, 0x05, /* hact */
-		0xee, 0x02, /* v_fsz */
-		0x01, 0x00, 0x33, 0x02, /* vsync */
-		0x1e, 0x00, 0xd0, 0x02, /* vact */
-		0x33, 0x02, /* field_chg */
-		0x48, 0x02, /* vact_st2 */
-		0x00, 0x00, /* vact_st3 */
-		0x00, 0x00, /* vact_st4 */
-		0x01, 0x00, 0x01, 0x00, /* vsync top/bot */
-		0x01, 0x00, 0x33, 0x02, /* field top/bot */
-		0x00, /* 3d FP */
+	{
+		.pixel_clock = 27027000,
+		.conf = {
+			0x01, 0xd1, 0x2d, 0x72, 0x40, 0x64, 0x12, 0x08,
+			0x43, 0xa0, 0x0e, 0xd9, 0x45, 0xa0, 0xac, 0x80,
+			0x08, 0x80, 0x11, 0x04, 0x02, 0x22, 0x44, 0x86,
+			0x54, 0xe3, 0x24, 0x00, 0x00, 0x00, 0x01, 0x00,
+		},
 	},
-};
-
-static const struct hdmi_preset_conf hdmi_conf_1080i50 = {
-	.core = {
-		.h_blank = {0xd0, 0x02},
-		.v2_blank = {0x32, 0x02},
-		.v1_blank = {0x16, 0x00},
-		.v_line = {0x65, 0x04},
-		.h_line = {0x50, 0x0a},
-		.hsync_pol = {0x00},
-		.vsync_pol = {0x00},
-		.int_pro_mode = {0x01},
-		.v_blank_f0 = {0x49, 0x02},
-		.v_blank_f1 = {0x65, 0x04},
-		.h_sync_start = {0x0e, 0x02},
-		.h_sync_end = {0x3a, 0x02},
-		.v_sync_line_bef_2 = {0x07, 0x00},
-		.v_sync_line_bef_1 = {0x02, 0x00},
-		.v_sync_line_aft_2 = {0x39, 0x02},
-		.v_sync_line_aft_1 = {0x34, 0x02},
-		.v_sync_line_aft_pxl_2 = {0x38, 0x07},
-		.v_sync_line_aft_pxl_1 = {0x38, 0x07},
-		.v_blank_f2 = {0xff, 0xff},
-		.v_blank_f3 = {0xff, 0xff},
-		.v_blank_f4 = {0xff, 0xff},
-		.v_blank_f5 = {0xff, 0xff},
-		.v_sync_line_aft_3 = {0xff, 0xff},
-		.v_sync_line_aft_4 = {0xff, 0xff},
-		.v_sync_line_aft_5 = {0xff, 0xff},
-		.v_sync_line_aft_6 = {0xff, 0xff},
-		.v_sync_line_aft_pxl_3 = {0xff, 0xff},
-		.v_sync_line_aft_pxl_4 = {0xff, 0xff},
-		.v_sync_line_aft_pxl_5 = {0xff, 0xff},
-		.v_sync_line_aft_pxl_6 = {0xff, 0xff},
-		.vact_space_1 = {0xff, 0xff},
-		.vact_space_2 = {0xff, 0xff},
-		.vact_space_3 = {0xff, 0xff},
-		.vact_space_4 = {0xff, 0xff},
-		.vact_space_5 = {0xff, 0xff},
-		.vact_space_6 = {0xff, 0xff},
-		/* other don't care */
+	{
+		.pixel_clock = 36000000,
+		.conf = {
+			0x01, 0x51, 0x2d, 0x55, 0x40, 0x01, 0x00, 0x08,
+			0x82, 0x80, 0x0e, 0xd9, 0x45, 0xa0, 0xac, 0x80,
+			0x08, 0x80, 0x11, 0x04, 0x02, 0x22, 0x44, 0x86,
+			0x54, 0xab, 0x24, 0x00, 0x00, 0x00, 0x01, 0x80,
+		},
 	},
-	.tg = {
-		0x00, /* cmd */
-		0x50, 0x0a, /* h_fsz */
-		0xd0, 0x02, 0x80, 0x07, /* hact */
-		0x65, 0x04, /* v_fsz */
-		0x01, 0x00, 0x33, 0x02, /* vsync */
-		0x16, 0x00, 0x1c, 0x02, /* vact */
-		0x33, 0x02, /* field_chg */
-		0x49, 0x02, /* vact_st2 */
-		0x00, 0x00, /* vact_st3 */
-		0x00, 0x00, /* vact_st4 */
-		0x01, 0x00, 0x33, 0x02, /* vsync top/bot */
-		0x01, 0x00, 0x33, 0x02, /* field top/bot */
-		0x00, /* 3d FP */
+	{
+		.pixel_clock = 40000000,
+		.conf = {
+			0x01, 0x51, 0x32, 0x55, 0x40, 0x01, 0x00, 0x08,
+			0x82, 0x80, 0x2c, 0xd9, 0x45, 0xa0, 0xac, 0x80,
+			0x08, 0x80, 0x11, 0x04, 0x02, 0x22, 0x44, 0x86,
+			0x54, 0x9a, 0x24, 0x00, 0x00, 0x00, 0x01, 0x80,
+		},
 	},
-};
-
-static const struct hdmi_preset_conf hdmi_conf_1080i60 = {
-	.core = {
-		.h_blank = {0x18, 0x01},
-		.v2_blank = {0x32, 0x02},
-		.v1_blank = {0x16, 0x00},
-		.v_line = {0x65, 0x04},
-		.h_line = {0x98, 0x08},
-		.hsync_pol = {0x00},
-		.vsync_pol = {0x00},
-		.int_pro_mode = {0x01},
-		.v_blank_f0 = {0x49, 0x02},
-		.v_blank_f1 = {0x65, 0x04},
-		.h_sync_start = {0x56, 0x00},
-		.h_sync_end = {0x82, 0x00},
-		.v_sync_line_bef_2 = {0x07, 0x00},
-		.v_sync_line_bef_1 = {0x02, 0x00},
-		.v_sync_line_aft_2 = {0x39, 0x02},
-		.v_sync_line_aft_1 = {0x34, 0x02},
-		.v_sync_line_aft_pxl_2 = {0xa4, 0x04},
-		.v_sync_line_aft_pxl_1 = {0xa4, 0x04},
-		.v_blank_f2 = {0xff, 0xff},
-		.v_blank_f3 = {0xff, 0xff},
-		.v_blank_f4 = {0xff, 0xff},
-		.v_blank_f5 = {0xff, 0xff},
-		.v_sync_line_aft_3 = {0xff, 0xff},
-		.v_sync_line_aft_4 = {0xff, 0xff},
-		.v_sync_line_aft_5 = {0xff, 0xff},
-		.v_sync_line_aft_6 = {0xff, 0xff},
-		.v_sync_line_aft_pxl_3 = {0xff, 0xff},
-		.v_sync_line_aft_pxl_4 = {0xff, 0xff},
-		.v_sync_line_aft_pxl_5 = {0xff, 0xff},
-		.v_sync_line_aft_pxl_6 = {0xff, 0xff},
-		.vact_space_1 = {0xff, 0xff},
-		.vact_space_2 = {0xff, 0xff},
-		.vact_space_3 = {0xff, 0xff},
-		.vact_space_4 = {0xff, 0xff},
-		.vact_space_5 = {0xff, 0xff},
-		.vact_space_6 = {0xff, 0xff},
-		/* other don't care */
+	{
+		.pixel_clock = 65000000,
+		.conf = {
+			0x01, 0xd1, 0x36, 0x34, 0x40, 0x1e, 0x0a, 0x08,
+			0x82, 0xa0, 0x45, 0xd9, 0x45, 0xa0, 0xac, 0x80,
+			0x08, 0x80, 0x11, 0x04, 0x02, 0x22, 0x44, 0x86,
+			0x54, 0xbd, 0x24, 0x01, 0x00, 0x00, 0x01, 0x80,
+		},
 	},
-	.tg = {
-		0x00, /* cmd */
-		0x98, 0x08, /* h_fsz */
-		0x18, 0x01, 0x80, 0x07, /* hact */
-		0x65, 0x04, /* v_fsz */
-		0x01, 0x00, 0x33, 0x02, /* vsync */
-		0x16, 0x00, 0x1c, 0x02, /* vact */
-		0x33, 0x02, /* field_chg */
-		0x49, 0x02, /* vact_st2 */
-		0x00, 0x00, /* vact_st3 */
-		0x00, 0x00, /* vact_st4 */
-		0x01, 0x00, 0x33, 0x02, /* vsync top/bot */
-		0x01, 0x00, 0x33, 0x02, /* field top/bot */
-		0x00, /* 3d FP */
+	{
+		.pixel_clock = 74176000,
+		.conf = {
+			0x01, 0xd1, 0x3e, 0x35, 0x40, 0x5b, 0xde, 0x08,
+			0x82, 0xa0, 0x73, 0xd9, 0x45, 0xa0, 0xac, 0x80,
+			0x56, 0x80, 0x11, 0x04, 0x02, 0x22, 0x44, 0x86,
+			0x54, 0xa6, 0x24, 0x01, 0x00, 0x00, 0x01, 0x80,
+		},
 	},
-};
-
-static const struct hdmi_preset_conf hdmi_conf_1080p30 = {
-	.core = {
-		.h_blank = {0x18, 0x01},
-		.v2_blank = {0x65, 0x04},
-		.v1_blank = {0x2d, 0x00},
-		.v_line = {0x65, 0x04},
-		.h_line = {0x98, 0x08},
-		.hsync_pol = {0x00},
-		.vsync_pol = {0x00},
-		.int_pro_mode = {0x00},
-		.v_blank_f0 = {0xff, 0xff},
-		.v_blank_f1 = {0xff, 0xff},
-		.h_sync_start = {0x56, 0x00},
-		.h_sync_end = {0x82, 0x00},
-		.v_sync_line_bef_2 = {0x09, 0x00},
-		.v_sync_line_bef_1 = {0x04, 0x00},
-		.v_sync_line_aft_2 = {0xff, 0xff},
-		.v_sync_line_aft_1 = {0xff, 0xff},
-		.v_sync_line_aft_pxl_2 = {0xff, 0xff},
-		.v_sync_line_aft_pxl_1 = {0xff, 0xff},
-		.v_blank_f2 = {0xff, 0xff},
-		.v_blank_f3 = {0xff, 0xff},
-		.v_blank_f4 = {0xff, 0xff},
-		.v_blank_f5 = {0xff, 0xff},
-		.v_sync_line_aft_3 = {0xff, 0xff},
-		.v_sync_line_aft_4 = {0xff, 0xff},
-		.v_sync_line_aft_5 = {0xff, 0xff},
-		.v_sync_line_aft_6 = {0xff, 0xff},
-		.v_sync_line_aft_pxl_3 = {0xff, 0xff},
-		.v_sync_line_aft_pxl_4 = {0xff, 0xff},
-		.v_sync_line_aft_pxl_5 = {0xff, 0xff},
-		.v_sync_line_aft_pxl_6 = {0xff, 0xff},
-		.vact_space_1 = {0xff, 0xff},
-		.vact_space_2 = {0xff, 0xff},
-		.vact_space_3 = {0xff, 0xff},
-		.vact_space_4 = {0xff, 0xff},
-		.vact_space_5 = {0xff, 0xff},
-		.vact_space_6 = {0xff, 0xff},
-		/* other don't care */
+	{
+		.pixel_clock = 74250000,
+		.conf = {
+			0x01, 0xd1, 0x1f, 0x10, 0x40, 0x40, 0xf8, 0x08,
+			0x81, 0xa0, 0xba, 0xd8, 0x45, 0xa0, 0xac, 0x80,
+			0x3c, 0x80, 0x11, 0x04, 0x02, 0x22, 0x44, 0x86,
+			0x54, 0xa5, 0x24, 0x01, 0x00, 0x00, 0x01, 0x00,
+		},
 	},
-	.tg = {
-		0x00, /* cmd */
-		0x98, 0x08, /* h_fsz */
-		0x18, 0x01, 0x80, 0x07, /* hact */
-		0x65, 0x04, /* v_fsz */
-		0x01, 0x00, 0x33, 0x02, /* vsync */
-		0x2d, 0x00, 0x38, 0x04, /* vact */
-		0x33, 0x02, /* field_chg */
-		0x48, 0x02, /* vact_st2 */
-		0x00, 0x00, /* vact_st3 */
-		0x00, 0x00, /* vact_st4 */
-		0x01, 0x00, 0x01, 0x00, /* vsync top/bot */
-		0x01, 0x00, 0x33, 0x02, /* field top/bot */
-		0x00, /* 3d FP */
+	{
+		.pixel_clock = 83500000,
+		.conf = {
+			0x01, 0xd1, 0x23, 0x11, 0x40, 0x0c, 0xfb, 0x08,
+			0x85, 0xa0, 0xd1, 0xd8, 0x45, 0xa0, 0xac, 0x80,
+			0x08, 0x80, 0x11, 0x04, 0x02, 0x22, 0x44, 0x86,
+			0x54, 0x93, 0x24, 0x01, 0x00, 0x00, 0x01, 0x80,
+		},
 	},
-};
-
-static const struct hdmi_preset_conf hdmi_conf_1080p50 = {
-	.core = {
-		.h_blank = {0xd0, 0x02},
-		.v2_blank = {0x65, 0x04},
-		.v1_blank = {0x2d, 0x00},
-		.v_line = {0x65, 0x04},
-		.h_line = {0x50, 0x0a},
-		.hsync_pol = {0x00},
-		.vsync_pol = {0x00},
-		.int_pro_mode = {0x00},
-		.v_blank_f0 = {0xff, 0xff},
-		.v_blank_f1 = {0xff, 0xff},
-		.h_sync_start = {0x0e, 0x02},
-		.h_sync_end = {0x3a, 0x02},
-		.v_sync_line_bef_2 = {0x09, 0x00},
-		.v_sync_line_bef_1 = {0x04, 0x00},
-		.v_sync_line_aft_2 = {0xff, 0xff},
-		.v_sync_line_aft_1 = {0xff, 0xff},
-		.v_sync_line_aft_pxl_2 = {0xff, 0xff},
-		.v_sync_line_aft_pxl_1 = {0xff, 0xff},
-		.v_blank_f2 = {0xff, 0xff},
-		.v_blank_f3 = {0xff, 0xff},
-		.v_blank_f4 = {0xff, 0xff},
-		.v_blank_f5 = {0xff, 0xff},
-		.v_sync_line_aft_3 = {0xff, 0xff},
-		.v_sync_line_aft_4 = {0xff, 0xff},
-		.v_sync_line_aft_5 = {0xff, 0xff},
-		.v_sync_line_aft_6 = {0xff, 0xff},
-		.v_sync_line_aft_pxl_3 = {0xff, 0xff},
-		.v_sync_line_aft_pxl_4 = {0xff, 0xff},
-		.v_sync_line_aft_pxl_5 = {0xff, 0xff},
-		.v_sync_line_aft_pxl_6 = {0xff, 0xff},
-		.vact_space_1 = {0xff, 0xff},
-		.vact_space_2 = {0xff, 0xff},
-		.vact_space_3 = {0xff, 0xff},
-		.vact_space_4 = {0xff, 0xff},
-		.vact_space_5 = {0xff, 0xff},
-		.vact_space_6 = {0xff, 0xff},
-		/* other don't care */
+	{
+		.pixel_clock = 106500000,
+		.conf = {
+			0x01, 0xd1, 0x2c, 0x12, 0x40, 0x0c, 0x09, 0x08,
+			0x84, 0xa0, 0x0a, 0xd9, 0x45, 0xa0, 0xac, 0x80,
+			0x08, 0x80, 0x11, 0x04, 0x02, 0x22, 0x44, 0x86,
+			0x54, 0x73, 0x24, 0x01, 0x00, 0x00, 0x01, 0x80,
+		},
 	},
-	.tg = {
-		0x00, /* cmd */
-		0x50, 0x0a, /* h_fsz */
-		0xd0, 0x02, 0x80, 0x07, /* hact */
-		0x65, 0x04, /* v_fsz */
-		0x01, 0x00, 0x33, 0x02, /* vsync */
-		0x2d, 0x00, 0x38, 0x04, /* vact */
-		0x33, 0x02, /* field_chg */
-		0x48, 0x02, /* vact_st2 */
-		0x00, 0x00, /* vact_st3 */
-		0x00, 0x00, /* vact_st4 */
-		0x01, 0x00, 0x01, 0x00, /* vsync top/bot */
-		0x01, 0x00, 0x33, 0x02, /* field top/bot */
-		0x00, /* 3d FP */
+	{
+		.pixel_clock = 108000000,
+		.conf = {
+			0x01, 0x51, 0x2d, 0x15, 0x40, 0x01, 0x00, 0x08,
+			0x82, 0x80, 0x0e, 0xd9, 0x45, 0xa0, 0xac, 0x80,
+			0x08, 0x80, 0x11, 0x04, 0x02, 0x22, 0x44, 0x86,
+			0x54, 0xc7, 0x25, 0x03, 0x00, 0x00, 0x01, 0x80,
+		},
 	},
-};
-
-static const struct hdmi_preset_conf hdmi_conf_1080p60 = {
-	.core = {
-		.h_blank = {0x18, 0x01},
-		.v2_blank = {0x65, 0x04},
-		.v1_blank = {0x2d, 0x00},
-		.v_line = {0x65, 0x04},
-		.h_line = {0x98, 0x08},
-		.hsync_pol = {0x00},
-		.vsync_pol = {0x00},
-		.int_pro_mode = {0x00},
-		.v_blank_f0 = {0xff, 0xff},
-		.v_blank_f1 = {0xff, 0xff},
-		.h_sync_start = {0x56, 0x00},
-		.h_sync_end = {0x82, 0x00},
-		.v_sync_line_bef_2 = {0x09, 0x00},
-		.v_sync_line_bef_1 = {0x04, 0x00},
-		.v_sync_line_aft_2 = {0xff, 0xff},
-		.v_sync_line_aft_1 = {0xff, 0xff},
-		.v_sync_line_aft_pxl_2 = {0xff, 0xff},
-		.v_sync_line_aft_pxl_1 = {0xff, 0xff},
-		.v_blank_f2 = {0xff, 0xff},
-		.v_blank_f3 = {0xff, 0xff},
-		.v_blank_f4 = {0xff, 0xff},
-		.v_blank_f5 = {0xff, 0xff},
-		.v_sync_line_aft_3 = {0xff, 0xff},
-		.v_sync_line_aft_4 = {0xff, 0xff},
-		.v_sync_line_aft_5 = {0xff, 0xff},
-		.v_sync_line_aft_6 = {0xff, 0xff},
-		.v_sync_line_aft_pxl_3 = {0xff, 0xff},
-		.v_sync_line_aft_pxl_4 = {0xff, 0xff},
-		.v_sync_line_aft_pxl_5 = {0xff, 0xff},
-		.v_sync_line_aft_pxl_6 = {0xff, 0xff},
-		/* other don't care */
+	{
+		.pixel_clock = 146250000,
+		.conf = {
+			0x01, 0xd1, 0x3d, 0x15, 0x40, 0x18, 0xfd, 0x08,
+			0x83, 0xa0, 0x6e, 0xd9, 0x45, 0xa0, 0xac, 0x80,
+			0x08, 0x80, 0x11, 0x04, 0x02, 0x22, 0x44, 0x86,
+			0x54, 0x50, 0x25, 0x03, 0x00, 0x00, 0x01, 0x80,
+		},
 	},
-	.tg = {
-		0x00, /* cmd */
-		0x98, 0x08, /* h_fsz */
-		0x18, 0x01, 0x80, 0x07, /* hact */
-		0x65, 0x04, /* v_fsz */
-		0x01, 0x00, 0x33, 0x02, /* vsync */
-		0x2d, 0x00, 0x38, 0x04, /* vact */
-		0x33, 0x02, /* field_chg */
-		0x48, 0x02, /* vact_st2 */
-		0x00, 0x00, /* vact_st3 */
-		0x00, 0x00, /* vact_st4 */
-		0x01, 0x00, 0x01, 0x00, /* vsync top/bot */
-		0x01, 0x00, 0x33, 0x02, /* field top/bot */
-		0x00, /* 3d FP */
+	{
+		.pixel_clock = 148500000,
+		.conf = {
+			0x01, 0xd1, 0x1f, 0x00, 0x40, 0x40, 0xf8, 0x08,
+			0x81, 0xa0, 0xba, 0xd8, 0x45, 0xa0, 0xac, 0x80,
+			0x3c, 0x80, 0x11, 0x04, 0x02, 0x22, 0x44, 0x86,
+			0x54, 0x4b, 0x25, 0x03, 0x00, 0x00, 0x01, 0x00,
+		},
 	},
 };
 
-static const struct hdmi_conf hdmi_confs[] = {
-	{ 720, 480, 60, false, 3, hdmiphy_conf27_027, &hdmi_conf_480p60 },
-	{ 1280, 720, 50, false, 19, hdmiphy_conf74_25, &hdmi_conf_720p50 },
-	{ 1280, 720, 60, false, 4, hdmiphy_conf74_25, &hdmi_conf_720p60 },
-	{ 1920, 1080, 50, true, 20, hdmiphy_conf74_25, &hdmi_conf_1080i50 },
-	{ 1920, 1080, 60, true, 5, hdmiphy_conf74_25, &hdmi_conf_1080i60 },
-	{ 1920, 1080, 30, false, 34, hdmiphy_conf74_176, &hdmi_conf_1080p30 },
-	{ 1920, 1080, 50, false, 31, hdmiphy_conf148_5, &hdmi_conf_1080p50 },
-	{ 1920, 1080, 60, false, 16, hdmiphy_conf148_5, &hdmi_conf_1080p60 },
-};
-
 struct hdmi_infoframe {
 	enum HDMI_PACKET_TYPE type;
 	u8 ver;
@@ -1277,31 +891,6 @@ static int hdmi_v13_conf_index(struct drm_display_mode *mode)
 	return -EINVAL;
 }
 
-static int hdmi_v14_conf_index(struct drm_display_mode *mode)
-{
-	int i;
-
-	for (i = 0; i < ARRAY_SIZE(hdmi_confs); ++i)
-		if (hdmi_confs[i].width == mode->hdisplay &&
-				hdmi_confs[i].height == mode->vdisplay &&
-				hdmi_confs[i].vrefresh == mode->vrefresh &&
-				hdmi_confs[i].interlace ==
-				((mode->flags & DRM_MODE_FLAG_INTERLACE) ?
-				 true : false))
-			return i;
-
-	return -EINVAL;
-}
-
-static int hdmi_conf_index(struct hdmi_context *hdata,
-			   struct drm_display_mode *mode)
-{
-	if (hdata->type == HDMI_TYPE13)
-		return hdmi_v13_conf_index(mode);
-
-	return hdmi_v14_conf_index(mode);
-}
-
 static u8 hdmi_chksum(struct hdmi_context *hdata,
 			u32 start, u8 len, u32 hdr_sum)
 {
@@ -1359,7 +948,7 @@ static void hdmi_reg_infoframe(struct hdmi_context *hdata,
 		if (hdata->type == HDMI_TYPE13)
 			vic = hdmi_v13_confs[hdata->cur_conf].cea_video_id;
 		else
-			vic = hdmi_confs[hdata->cur_conf].cea_video_id;
+			vic = hdata->mode_conf.cea_video_id;
 
 		hdmi_reg_writeb(hdata, HDMI_AVI_BYTE(4), vic);
 
@@ -1436,25 +1025,33 @@ static int hdmi_v13_check_timing(struct fb_videomode *check_timing)
 	return -EINVAL;
 }
 
+static int hdmi_v14_find_phy_conf(int pixel_clock)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(hdmiphy_v14_configs); i++) {
+		if (hdmiphy_v14_configs[i].pixel_clock == pixel_clock)
+			return i;
+	}
+
+	DRM_DEBUG_KMS("Could not find phy config for %d\n", pixel_clock);
+	return -EINVAL;
+}
+
 static int hdmi_v14_check_timing(struct fb_videomode *check_timing)
 {
 	int i;
 
-	DRM_DEBUG_KMS("valid mode : xres=%d, yres=%d, refresh=%d, intl=%d\n",
+	DRM_DEBUG_KMS("mode: xres=%d, yres=%d, refresh=%d, clock=%d, intl=%d\n",
 			check_timing->xres, check_timing->yres,
-			check_timing->refresh, (check_timing->vmode &
-			FB_VMODE_INTERLACED) ? true : false);
+			check_timing->refresh, check_timing->pixclock,
+			(check_timing->vmode & FB_VMODE_INTERLACED) ?
+			true : false);
 
-	for (i = 0; i < ARRAY_SIZE(hdmi_confs); i++)
-		if (hdmi_confs[i].width == check_timing->xres &&
-			hdmi_confs[i].height == check_timing->yres &&
-			hdmi_confs[i].vrefresh == check_timing->refresh &&
-			hdmi_confs[i].interlace ==
-			((check_timing->vmode & FB_VMODE_INTERLACED) ?
-			 true : false))
-				return 0;
-
-	/* TODO */
+	for (i = 0; i < ARRAY_SIZE(hdmiphy_v14_configs); i++)
+		if (hdmiphy_v14_configs[i].pixel_clock ==
+			check_timing->pixclock)
+			return 0;
 
 	return -EINVAL;
 }
@@ -1796,9 +1393,8 @@ static void hdmi_v13_timing_apply(struct hdmi_context *hdata)
 
 static void hdmi_v14_timing_apply(struct hdmi_context *hdata)
 {
-	const struct hdmi_preset_conf *conf = hdmi_confs[hdata->cur_conf].conf;
-	const struct hdmi_core_regs *core = &conf->core;
-	const struct hdmi_tg_regs *tg = &conf->tg;
+	struct hdmi_core_regs *core = &hdata->mode_conf.core;
+	struct hdmi_tg_regs *tg = &hdata->mode_conf.tg;
 	int tries;
 
 	/* setting core registers */
@@ -1901,39 +1497,39 @@ static void hdmi_v14_timing_apply(struct hdmi_context *hdata)
 	hdmi_reg_writeb(hdata, HDMI_VACT_SPACE_6_1, core->vact_space_6[1]);
 
 	/* Timing generator registers */
-	hdmi_reg_writeb(hdata, HDMI_TG_H_FSZ_L, tg->h_fsz_l);
-	hdmi_reg_writeb(hdata, HDMI_TG_H_FSZ_H, tg->h_fsz_h);
-	hdmi_reg_writeb(hdata, HDMI_TG_HACT_ST_L, tg->hact_st_l);
-	hdmi_reg_writeb(hdata, HDMI_TG_HACT_ST_H, tg->hact_st_h);
-	hdmi_reg_writeb(hdata, HDMI_TG_HACT_SZ_L, tg->hact_sz_l);
-	hdmi_reg_writeb(hdata, HDMI_TG_HACT_SZ_H, tg->hact_sz_h);
-	hdmi_reg_writeb(hdata, HDMI_TG_V_FSZ_L, tg->v_fsz_l);
-	hdmi_reg_writeb(hdata, HDMI_TG_V_FSZ_H, tg->v_fsz_h);
-	hdmi_reg_writeb(hdata, HDMI_TG_VSYNC_L, tg->vsync_l);
-	hdmi_reg_writeb(hdata, HDMI_TG_VSYNC_H, tg->vsync_h);
-	hdmi_reg_writeb(hdata, HDMI_TG_VSYNC2_L, tg->vsync2_l);
-	hdmi_reg_writeb(hdata, HDMI_TG_VSYNC2_H, tg->vsync2_h);
-	hdmi_reg_writeb(hdata, HDMI_TG_VACT_ST_L, tg->vact_st_l);
-	hdmi_reg_writeb(hdata, HDMI_TG_VACT_ST_H, tg->vact_st_h);
-	hdmi_reg_writeb(hdata, HDMI_TG_VACT_SZ_L, tg->vact_sz_l);
-	hdmi_reg_writeb(hdata, HDMI_TG_VACT_SZ_H, tg->vact_sz_h);
-	hdmi_reg_writeb(hdata, HDMI_TG_FIELD_CHG_L, tg->field_chg_l);
-	hdmi_reg_writeb(hdata, HDMI_TG_FIELD_CHG_H, tg->field_chg_h);
-	hdmi_reg_writeb(hdata, HDMI_TG_VACT_ST2_L, tg->vact_st2_l);
-	hdmi_reg_writeb(hdata, HDMI_TG_VACT_ST2_H, tg->vact_st2_h);
-	hdmi_reg_writeb(hdata, HDMI_TG_VACT_ST3_L, tg->vact_st3_l);
-	hdmi_reg_writeb(hdata, HDMI_TG_VACT_ST3_H, tg->vact_st3_h);
-	hdmi_reg_writeb(hdata, HDMI_TG_VACT_ST4_L, tg->vact_st4_l);
-	hdmi_reg_writeb(hdata, HDMI_TG_VACT_ST4_H, tg->vact_st4_h);
-	hdmi_reg_writeb(hdata, HDMI_TG_VSYNC_TOP_HDMI_L, tg->vsync_top_hdmi_l);
-	hdmi_reg_writeb(hdata, HDMI_TG_VSYNC_TOP_HDMI_H, tg->vsync_top_hdmi_h);
-	hdmi_reg_writeb(hdata, HDMI_TG_VSYNC_BOT_HDMI_L, tg->vsync_bot_hdmi_l);
-	hdmi_reg_writeb(hdata, HDMI_TG_VSYNC_BOT_HDMI_H, tg->vsync_bot_hdmi_h);
-	hdmi_reg_writeb(hdata, HDMI_TG_FIELD_TOP_HDMI_L, tg->field_top_hdmi_l);
-	hdmi_reg_writeb(hdata, HDMI_TG_FIELD_TOP_HDMI_H, tg->field_top_hdmi_h);
-	hdmi_reg_writeb(hdata, HDMI_TG_FIELD_BOT_HDMI_L, tg->field_bot_hdmi_l);
-	hdmi_reg_writeb(hdata, HDMI_TG_FIELD_BOT_HDMI_H, tg->field_bot_hdmi_h);
-	hdmi_reg_writeb(hdata, HDMI_TG_3D, tg->tg_3d);
+	hdmi_reg_writeb(hdata, HDMI_TG_H_FSZ_L, tg->h_fsz[0]);
+	hdmi_reg_writeb(hdata, HDMI_TG_H_FSZ_H, tg->h_fsz[1]);
+	hdmi_reg_writeb(hdata, HDMI_TG_HACT_ST_L, tg->hact_st[0]);
+	hdmi_reg_writeb(hdata, HDMI_TG_HACT_ST_H, tg->hact_st[1]);
+	hdmi_reg_writeb(hdata, HDMI_TG_HACT_SZ_L, tg->hact_sz[0]);
+	hdmi_reg_writeb(hdata, HDMI_TG_HACT_SZ_H, tg->hact_sz[1]);
+	hdmi_reg_writeb(hdata, HDMI_TG_V_FSZ_L, tg->v_fsz[0]);
+	hdmi_reg_writeb(hdata, HDMI_TG_V_FSZ_H, tg->v_fsz[1]);
+	hdmi_reg_writeb(hdata, HDMI_TG_VSYNC_L, tg->vsync[0]);
+	hdmi_reg_writeb(hdata, HDMI_TG_VSYNC_H, tg->vsync[1]);
+	hdmi_reg_writeb(hdata, HDMI_TG_VSYNC2_L, tg->vsync2[0]);
+	hdmi_reg_writeb(hdata, HDMI_TG_VSYNC2_H, tg->vsync2[1]);
+	hdmi_reg_writeb(hdata, HDMI_TG_VACT_ST_L, tg->vact_st[0]);
+	hdmi_reg_writeb(hdata, HDMI_TG_VACT_ST_H, tg->vact_st[1]);
+	hdmi_reg_writeb(hdata, HDMI_TG_VACT_SZ_L, tg->vact_sz[0]);
+	hdmi_reg_writeb(hdata, HDMI_TG_VACT_SZ_H, tg->vact_sz[1]);
+	hdmi_reg_writeb(hdata, HDMI_TG_FIELD_CHG_L, tg->field_chg[0]);
+	hdmi_reg_writeb(hdata, HDMI_TG_FIELD_CHG_H, tg->field_chg[1]);
+	hdmi_reg_writeb(hdata, HDMI_TG_VACT_ST2_L, tg->vact_st2[0]);
+	hdmi_reg_writeb(hdata, HDMI_TG_VACT_ST2_H, tg->vact_st2[1]);
+	hdmi_reg_writeb(hdata, HDMI_TG_VACT_ST3_L, tg->vact_st3[0]);
+	hdmi_reg_writeb(hdata, HDMI_TG_VACT_ST3_H, tg->vact_st3[1]);
+	hdmi_reg_writeb(hdata, HDMI_TG_VACT_ST4_L, tg->vact_st4[0]);
+	hdmi_reg_writeb(hdata, HDMI_TG_VACT_ST4_H, tg->vact_st4[1]);
+	hdmi_reg_writeb(hdata, HDMI_TG_VSYNC_TOP_HDMI_L, tg->vsync_top_hdmi[0]);
+	hdmi_reg_writeb(hdata, HDMI_TG_VSYNC_TOP_HDMI_H, tg->vsync_top_hdmi[1]);
+	hdmi_reg_writeb(hdata, HDMI_TG_VSYNC_BOT_HDMI_L, tg->vsync_bot_hdmi[0]);
+	hdmi_reg_writeb(hdata, HDMI_TG_VSYNC_BOT_HDMI_H, tg->vsync_bot_hdmi[1]);
+	hdmi_reg_writeb(hdata, HDMI_TG_FIELD_TOP_HDMI_L, tg->field_top_hdmi[0]);
+	hdmi_reg_writeb(hdata, HDMI_TG_FIELD_TOP_HDMI_H, tg->field_top_hdmi[1]);
+	hdmi_reg_writeb(hdata, HDMI_TG_FIELD_BOT_HDMI_L, tg->field_bot_hdmi[0]);
+	hdmi_reg_writeb(hdata, HDMI_TG_FIELD_BOT_HDMI_H, tg->field_bot_hdmi[1]);
+	hdmi_reg_writeb(hdata, HDMI_TG_3D, tg->tg_3d[0]);
 
 	/* waiting for HDMIPHY's PLL to get to steady state */
 	for (tries = 100; tries; --tries) {
@@ -2030,10 +1626,17 @@ static void hdmiphy_conf_apply(struct hdmi_context *hdata)
 	}
 
 	/* pixel clock */
-	if (hdata->type == HDMI_TYPE13)
+	if (hdata->type == HDMI_TYPE13) {
 		hdmiphy_data = hdmi_v13_confs[hdata->cur_conf].hdmiphy_data;
-	else
-		hdmiphy_data = hdmi_confs[hdata->cur_conf].hdmiphy_data;
+	} else {
+		i = hdmi_v14_find_phy_conf(hdata->mode_conf.pixel_clock);
+		if (i < 0) {
+			DRM_ERROR("failed to find hdmiphy conf\n");
+			return;
+		}
+
+		hdmiphy_data = hdmiphy_v14_configs[i].conf;
+	}
 
 	memcpy(buffer, hdmiphy_data, 32);
 	ret = i2c_master_send(hdata->hdmiphy_port, buffer, 32);
@@ -2101,7 +1704,7 @@ static void hdmi_mode_fixup(void *ctx, struct drm_connector *connector,
 	if (hdata->type == HDMI_TYPE13)
 		index = hdmi_v13_conf_index(adjusted_mode);
 	else
-		index = hdmi_v14_conf_index(adjusted_mode);
+		index = hdmi_v14_find_phy_conf(adjusted_mode->clock * 1000);
 
 	/* just return if user desired mode exists. */
 	if (index >= 0)
@@ -2115,7 +1718,7 @@ static void hdmi_mode_fixup(void *ctx, struct drm_connector *connector,
 		if (hdata->type == HDMI_TYPE13)
 			index = hdmi_v13_conf_index(m);
 		else
-			index = hdmi_v14_conf_index(m);
+			index = hdmi_v14_find_phy_conf(m->clock * 1000);
 
 		if (index >= 0) {
 			struct drm_mode_object base;
@@ -2124,6 +1727,9 @@ static void hdmi_mode_fixup(void *ctx, struct drm_connector *connector,
 			DRM_INFO("desired mode doesn't exist so\n");
 			DRM_INFO("use the most suitable mode among modes.\n");
 
+			DRM_DEBUG_KMS("Adjusted Mode: [%d]x[%d] [%d]Hz\n",
+				m->hdisplay, m->vdisplay, m->vrefresh);
+
 			/* preserve display mode header while copying. */
 			head = adjusted_mode->head;
 			base = adjusted_mode->base;
@@ -2135,6 +1741,122 @@ static void hdmi_mode_fixup(void *ctx, struct drm_connector *connector,
 	}
 }
 
+static void hdmi_set_reg(u8 *reg_pair, int num_bytes, u32 value)
+{
+	int i;
+	BUG_ON(num_bytes > 4);
+	for (i = 0; i < num_bytes; i++)
+		reg_pair[i] = (value >> (8 * i)) & 0xff;
+}
+
+static void hdmi_v14_mode_set(struct hdmi_context *hdata,
+			struct drm_display_mode *m)
+{
+	struct hdmi_core_regs *core = &hdata->mode_conf.core;
+	struct hdmi_tg_regs *tg = &hdata->mode_conf.tg;
+
+	hdata->mode_conf.cea_video_id = drm_match_cea_mode(m);
+
+	hdata->mode_conf.pixel_clock = m->clock * 1000;
+	hdmi_set_reg(core->h_blank, 2, m->htotal - m->hdisplay);
+	hdmi_set_reg(core->v_line, 2, m->vtotal);
+	hdmi_set_reg(core->h_line, 2, m->htotal);
+	hdmi_set_reg(core->hsync_pol, 1,
+			(m->flags & DRM_MODE_FLAG_NHSYNC)  ? 1 : 0);
+	hdmi_set_reg(core->vsync_pol, 1,
+			(m->flags & DRM_MODE_FLAG_NVSYNC) ? 1 : 0);
+	hdmi_set_reg(core->int_pro_mode, 1,
+			(m->flags & DRM_MODE_FLAG_INTERLACE) ? 1 : 0);
+
+	/*
+	 * Quirk requirement for exynos 5 HDMI IP design,
+	 * 2 pixels less than the actual calculation for hsync_start
+	 * and end.
+	 */
+
+	/* Following values & calculations differ for different type of modes */
+	if (m->flags & DRM_MODE_FLAG_INTERLACE) {
+		/* Interlaced Mode */
+		hdmi_set_reg(core->v_sync_line_bef_2, 2,
+			(m->vsync_end - m->vdisplay) / 2);
+		hdmi_set_reg(core->v_sync_line_bef_1, 2,
+			(m->vsync_start - m->vdisplay) / 2);
+		hdmi_set_reg(core->v2_blank, 2, m->vtotal / 2);
+		hdmi_set_reg(core->v1_blank, 2, (m->vtotal - m->vdisplay) / 2);
+		hdmi_set_reg(core->v_blank_f0, 2, (m->vtotal +
+			((m->vsync_end - m->vsync_start) * 4) + 5) / 2);
+		hdmi_set_reg(core->v_blank_f1, 2, m->vtotal);
+		hdmi_set_reg(core->v_sync_line_aft_2, 2, (m->vtotal / 2) + 7);
+		hdmi_set_reg(core->v_sync_line_aft_1, 2, (m->vtotal / 2) + 2);
+		hdmi_set_reg(core->v_sync_line_aft_pxl_2, 2,
+			(m->htotal / 2) + (m->hsync_start - m->hdisplay));
+		hdmi_set_reg(core->v_sync_line_aft_pxl_1, 2,
+			(m->htotal / 2) + (m->hsync_start - m->hdisplay));
+		hdmi_set_reg(tg->vact_st, 2, (m->vtotal - m->vdisplay) / 2);
+		hdmi_set_reg(tg->vact_sz, 2, m->vdisplay / 2);
+		hdmi_set_reg(tg->vact_st2, 2, 0x249);/* Reset value + 1*/
+		hdmi_set_reg(tg->vact_st3, 2, 0x0);
+		hdmi_set_reg(tg->vact_st4, 2, 0x0);
+	} else {
+		/* Progressive Mode */
+		hdmi_set_reg(core->v_sync_line_bef_2, 2,
+			m->vsync_end - m->vdisplay);
+		hdmi_set_reg(core->v_sync_line_bef_1, 2,
+			m->vsync_start - m->vdisplay);
+		hdmi_set_reg(core->v2_blank, 2, m->vtotal);
+		hdmi_set_reg(core->v1_blank, 2, m->vtotal - m->vdisplay);
+		hdmi_set_reg(core->v_blank_f0, 2, 0xffff);
+		hdmi_set_reg(core->v_blank_f1, 2, 0xffff);
+		hdmi_set_reg(core->v_sync_line_aft_2, 2, 0xffff);
+		hdmi_set_reg(core->v_sync_line_aft_1, 2, 0xffff);
+		hdmi_set_reg(core->v_sync_line_aft_pxl_2, 2, 0xffff);
+		hdmi_set_reg(core->v_sync_line_aft_pxl_1, 2, 0xffff);
+		hdmi_set_reg(tg->vact_st, 2, m->vtotal - m->vdisplay);
+		hdmi_set_reg(tg->vact_sz, 2, m->vdisplay);
+		hdmi_set_reg(tg->vact_st2, 2, 0x248); /* Reset value */
+		hdmi_set_reg(tg->vact_st3, 2, 0x47b); /* Reset value */
+		hdmi_set_reg(tg->vact_st4, 2, 0x6ae); /* Reset value */
+	}
+
+	/* Following values & calculations are same irrespective of mode type */
+	hdmi_set_reg(core->h_sync_start, 2, m->hsync_start - m->hdisplay - 2);
+	hdmi_set_reg(core->h_sync_end, 2, m->hsync_end - m->hdisplay - 2);
+	hdmi_set_reg(core->vact_space_1, 2, 0xffff);
+	hdmi_set_reg(core->vact_space_2, 2, 0xffff);
+	hdmi_set_reg(core->vact_space_3, 2, 0xffff);
+	hdmi_set_reg(core->vact_space_4, 2, 0xffff);
+	hdmi_set_reg(core->vact_space_5, 2, 0xffff);
+	hdmi_set_reg(core->vact_space_6, 2, 0xffff);
+	hdmi_set_reg(core->v_blank_f2, 2, 0xffff);
+	hdmi_set_reg(core->v_blank_f3, 2, 0xffff);
+	hdmi_set_reg(core->v_blank_f4, 2, 0xffff);
+	hdmi_set_reg(core->v_blank_f5, 2, 0xffff);
+	hdmi_set_reg(core->v_sync_line_aft_3, 2, 0xffff);
+	hdmi_set_reg(core->v_sync_line_aft_4, 2, 0xffff);
+	hdmi_set_reg(core->v_sync_line_aft_5, 2, 0xffff);
+	hdmi_set_reg(core->v_sync_line_aft_6, 2, 0xffff);
+	hdmi_set_reg(core->v_sync_line_aft_pxl_3, 2, 0xffff);
+	hdmi_set_reg(core->v_sync_line_aft_pxl_4, 2, 0xffff);
+	hdmi_set_reg(core->v_sync_line_aft_pxl_5, 2, 0xffff);
+	hdmi_set_reg(core->v_sync_line_aft_pxl_6, 2, 0xffff);
+
+	/* Timing generator registers */
+	hdmi_set_reg(tg->cmd, 1, 0x0);
+	hdmi_set_reg(tg->h_fsz, 2, m->htotal);
+	hdmi_set_reg(tg->hact_st, 2, m->htotal - m->hdisplay);
+	hdmi_set_reg(tg->hact_sz, 2, m->hdisplay);
+	hdmi_set_reg(tg->v_fsz, 2, m->vtotal);
+	hdmi_set_reg(tg->vsync, 2, 0x1);
+	hdmi_set_reg(tg->vsync2, 2, 0x233); /* Reset value */
+	hdmi_set_reg(tg->field_chg, 2, 0x233); /* Reset value */
+	hdmi_set_reg(tg->vsync_top_hdmi, 2, 0x1); /* Reset value */
+	hdmi_set_reg(tg->vsync_bot_hdmi, 2, 0x233); /* Reset value */
+	hdmi_set_reg(tg->field_top_hdmi, 2, 0x1); /* Reset value */
+	hdmi_set_reg(tg->field_bot_hdmi, 2, 0x233); /* Reset value */
+	hdmi_set_reg(tg->tg_3d, 1, 0x0);
+
+}
+
 static void hdmi_mode_set(void *ctx, void *mode)
 {
 	struct hdmi_context *hdata = ctx;
@@ -2142,11 +1864,15 @@ static void hdmi_mode_set(void *ctx, void *mode)
 
 	DRM_DEBUG_KMS("[%d] %s\n", __LINE__, __func__);
 
-	conf_idx = hdmi_conf_index(hdata, mode);
-	if (conf_idx >= 0)
-		hdata->cur_conf = conf_idx;
-	else
-		DRM_DEBUG_KMS("not supported mode\n");
+	if (hdata->type == HDMI_TYPE13) {
+		conf_idx = hdmi_v13_conf_index(mode);
+		if (conf_idx >= 0)
+			hdata->cur_conf = conf_idx;
+		else
+			DRM_DEBUG_KMS("not supported mode\n");
+	} else {
+		hdmi_v14_mode_set(hdata, mode);
+	}
 }
 
 static void hdmi_get_max_resol(void *ctx, unsigned int *width,
-- 
1.8.0
