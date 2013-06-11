From: Rahul Sharma <rahul.sharma-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 1/9] drm/exynos: use SoC name to identify hdmi version
Date: Tue, 11 Jun 2013 19:41:23 +0530
Message-ID: <1370959891-8923-2-git-send-email-rahul.sharma@samsung.com>
References: <1370959891-8923-1-git-send-email-rahul.sharma@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-reply-to: <1370959891-8923-1-git-send-email-rahul.sharma-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, joshi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, r.sh.open-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Rahul Sharma <rahul.sharma-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Exynos hdmi IP version is named after hdmi specification version i.e.
1.3 and 1.4. This versioning mechanism is not sufficient to handle
the diversity in the hdmi/phy IPs which are present across the exynos
SoC family.

This patch changes the hdmi version to the name of the SoC in which
the IP was introduced for the first time. Same version is applicable
to all subsequent SoCs having the same IP version.

Exynos4210 has 1.3 HDMI, i2c mapped phy with configuration set.
Exynos5250 has 1.4 HDMI, i2c mapped phy with configuration set.
Exynos5420 has 1.4 HDMI, Platform Bus mapped phy with configuration set.

Based on the HDMI IP version we cannot decide to pick Exynos5250 phy conf
and use i2c for data transfer or Exynos5420 phy confs and platform bus
calls for communication.

Signed-off-by: Rahul Sharma <rahul.sharma-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---
 drivers/gpu/drm/exynos/exynos_hdmi.c |  249 +++++++++++++++++-----------------
 drivers/gpu/drm/exynos/regs-hdmi.h   |   78 +++++------
 2 files changed, 164 insertions(+), 163 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
index 75a6bf3..9384ffc 100644
--- a/drivers/gpu/drm/exynos/exynos_hdmi.c
+++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
@@ -73,9 +73,9 @@ enum HDMI_PACKET_TYPE {
 	HDMI_PACKET_TYPE_AUI = HDMI_PACKET_TYPE_INFOFRAME + 4
 };
 
-enum hdmi_type {
-	HDMI_TYPE13,
-	HDMI_TYPE14,
+enum hdmi_version {
+	HDMI_VER_EXYNOS4210,
+	HDMI_VER_EXYNOS4212,
 };
 
 struct hdmi_resources {
@@ -109,7 +109,7 @@ struct hdmi_tg_regs {
 	u8 tg_3d[1];
 };
 
-struct hdmi_v13_core_regs {
+struct hdmi_4210_core_regs {
 	u8 h_blank[2];
 	u8 v_blank[3];
 	u8 h_v_line[3];
@@ -122,7 +122,7 @@ struct hdmi_v13_core_regs {
 	u8 v_sync_gen3[3];
 };
 
-struct hdmi_v14_core_regs {
+struct hdmi_4212_core_regs {
 	u8 h_blank[2];
 	u8 v2_blank[2];
 	u8 v1_blank[2];
@@ -161,13 +161,13 @@ struct hdmi_v14_core_regs {
 	u8 vact_space_6[2];
 };
 
-struct hdmi_v13_conf {
-	struct hdmi_v13_core_regs core;
+struct hdmi_4210_conf {
+	struct hdmi_4210_core_regs core;
 	struct hdmi_tg_regs tg;
 };
 
-struct hdmi_v14_conf {
-	struct hdmi_v14_core_regs core;
+struct hdmi_4212_conf {
+	struct hdmi_4212_core_regs core;
 	struct hdmi_tg_regs tg;
 };
 
@@ -175,8 +175,8 @@ struct hdmi_conf_regs {
 	int pixel_clock;
 	int cea_video_id;
 	union {
-		struct hdmi_v13_conf v13_conf;
-		struct hdmi_v14_conf v14_conf;
+		struct hdmi_4210_conf v4210_conf;
+		struct hdmi_4212_conf v4212_conf;
 	} conf;
 };
 
@@ -203,7 +203,7 @@ struct hdmi_context {
 
 	int				hpd_gpio;
 
-	enum hdmi_type			type;
+	enum hdmi_version		version;
 };
 
 struct hdmiphy_config {
@@ -212,7 +212,7 @@ struct hdmiphy_config {
 };
 
 /* list of phy config settings */
-static const struct hdmiphy_config hdmiphy_v13_configs[] = {
+static const struct hdmiphy_config hdmiphy_4210_configs[] = {
 	{
 		.pixel_clock = 27000000,
 		.conf = {
@@ -260,7 +260,7 @@ static const struct hdmiphy_config hdmiphy_v13_configs[] = {
 	},
 };
 
-static const struct hdmiphy_config hdmiphy_v14_configs[] = {
+static const struct hdmiphy_config hdmiphy_4212_configs[] = {
 	{
 		.pixel_clock = 25200000,
 		.conf = {
@@ -413,7 +413,7 @@ static inline void hdmi_phy_pow_ctrl_reg_writemask(struct hdmi_context *hdata,
 	writel(value, hdata->phy_pow_ctrl_reg);
 }
 
-static void hdmi_v13_regs_dump(struct hdmi_context *hdata, char *prefix)
+static void hdmi_4210_regs_dump(struct hdmi_context *hdata, char *prefix)
 {
 #define DUMPREG(reg_id) \
 	DRM_DEBUG_KMS("%s:" #reg_id " = %08x\n", prefix, \
@@ -422,50 +422,50 @@ static void hdmi_v13_regs_dump(struct hdmi_context *hdata, char *prefix)
 	DUMPREG(HDMI_INTC_FLAG);
 	DUMPREG(HDMI_INTC_CON);
 	DUMPREG(HDMI_HPD_STATUS);
-	DUMPREG(HDMI_V13_PHY_RSTOUT);
-	DUMPREG(HDMI_V13_PHY_VPLL);
-	DUMPREG(HDMI_V13_PHY_CMU);
-	DUMPREG(HDMI_V13_CORE_RSTOUT);
+	DUMPREG(HDMI_4210_PHY_RSTOUT);
+	DUMPREG(HDMI_4210_PHY_VPLL);
+	DUMPREG(HDMI_4210_PHY_CMU);
+	DUMPREG(HDMI_4210_CORE_RSTOUT);
 
 	DRM_DEBUG_KMS("%s: ---- CORE REGISTERS ----\n", prefix);
 	DUMPREG(HDMI_CON_0);
 	DUMPREG(HDMI_CON_1);
 	DUMPREG(HDMI_CON_2);
 	DUMPREG(HDMI_SYS_STATUS);
-	DUMPREG(HDMI_V13_PHY_STATUS);
+	DUMPREG(HDMI_4210_PHY_STATUS);
 	DUMPREG(HDMI_STATUS_EN);
 	DUMPREG(HDMI_HPD);
 	DUMPREG(HDMI_MODE_SEL);
-	DUMPREG(HDMI_V13_HPD_GEN);
-	DUMPREG(HDMI_V13_DC_CONTROL);
-	DUMPREG(HDMI_V13_VIDEO_PATTERN_GEN);
+	DUMPREG(HDMI_4210_HPD_GEN);
+	DUMPREG(HDMI_4210_DC_CONTROL);
+	DUMPREG(HDMI_4210_VIDEO_PATTERN_GEN);
 
 	DRM_DEBUG_KMS("%s: ---- CORE SYNC REGISTERS ----\n", prefix);
 	DUMPREG(HDMI_H_BLANK_0);
 	DUMPREG(HDMI_H_BLANK_1);
-	DUMPREG(HDMI_V13_V_BLANK_0);
-	DUMPREG(HDMI_V13_V_BLANK_1);
-	DUMPREG(HDMI_V13_V_BLANK_2);
-	DUMPREG(HDMI_V13_H_V_LINE_0);
-	DUMPREG(HDMI_V13_H_V_LINE_1);
-	DUMPREG(HDMI_V13_H_V_LINE_2);
+	DUMPREG(HDMI_4210_V_BLANK_0);
+	DUMPREG(HDMI_4210_V_BLANK_1);
+	DUMPREG(HDMI_4210_V_BLANK_2);
+	DUMPREG(HDMI_4210_H_V_LINE_0);
+	DUMPREG(HDMI_4210_H_V_LINE_1);
+	DUMPREG(HDMI_4210_H_V_LINE_2);
 	DUMPREG(HDMI_VSYNC_POL);
 	DUMPREG(HDMI_INT_PRO_MODE);
-	DUMPREG(HDMI_V13_V_BLANK_F_0);
-	DUMPREG(HDMI_V13_V_BLANK_F_1);
-	DUMPREG(HDMI_V13_V_BLANK_F_2);
-	DUMPREG(HDMI_V13_H_SYNC_GEN_0);
-	DUMPREG(HDMI_V13_H_SYNC_GEN_1);
-	DUMPREG(HDMI_V13_H_SYNC_GEN_2);
-	DUMPREG(HDMI_V13_V_SYNC_GEN_1_0);
-	DUMPREG(HDMI_V13_V_SYNC_GEN_1_1);
-	DUMPREG(HDMI_V13_V_SYNC_GEN_1_2);
-	DUMPREG(HDMI_V13_V_SYNC_GEN_2_0);
-	DUMPREG(HDMI_V13_V_SYNC_GEN_2_1);
-	DUMPREG(HDMI_V13_V_SYNC_GEN_2_2);
-	DUMPREG(HDMI_V13_V_SYNC_GEN_3_0);
-	DUMPREG(HDMI_V13_V_SYNC_GEN_3_1);
-	DUMPREG(HDMI_V13_V_SYNC_GEN_3_2);
+	DUMPREG(HDMI_4210_V_BLANK_F_0);
+	DUMPREG(HDMI_4210_V_BLANK_F_1);
+	DUMPREG(HDMI_4210_V_BLANK_F_2);
+	DUMPREG(HDMI_4210_H_SYNC_GEN_0);
+	DUMPREG(HDMI_4210_H_SYNC_GEN_1);
+	DUMPREG(HDMI_4210_H_SYNC_GEN_2);
+	DUMPREG(HDMI_4210_V_SYNC_GEN_1_0);
+	DUMPREG(HDMI_4210_V_SYNC_GEN_1_1);
+	DUMPREG(HDMI_4210_V_SYNC_GEN_1_2);
+	DUMPREG(HDMI_4210_V_SYNC_GEN_2_0);
+	DUMPREG(HDMI_4210_V_SYNC_GEN_2_1);
+	DUMPREG(HDMI_4210_V_SYNC_GEN_2_2);
+	DUMPREG(HDMI_4210_V_SYNC_GEN_3_0);
+	DUMPREG(HDMI_4210_V_SYNC_GEN_3_1);
+	DUMPREG(HDMI_4210_V_SYNC_GEN_3_2);
 
 	DRM_DEBUG_KMS("%s: ---- TG REGISTERS ----\n", prefix);
 	DUMPREG(HDMI_TG_CMD);
@@ -500,7 +500,7 @@ static void hdmi_v13_regs_dump(struct hdmi_context *hdata, char *prefix)
 #undef DUMPREG
 }
 
-static void hdmi_v14_regs_dump(struct hdmi_context *hdata, char *prefix)
+static void hdmi_4212_regs_dump(struct hdmi_context *hdata, char *prefix)
 {
 	int i;
 
@@ -669,10 +669,10 @@ static void hdmi_v14_regs_dump(struct hdmi_context *hdata, char *prefix)
 
 static void hdmi_regs_dump(struct hdmi_context *hdata, char *prefix)
 {
-	if (hdata->type == HDMI_TYPE13)
-		hdmi_v13_regs_dump(hdata, prefix);
+	if (hdata->version == HDMI_VER_EXYNOS4210)
+		hdmi_4210_regs_dump(hdata, prefix);
 	else
-		hdmi_v14_regs_dump(hdata, prefix);
+		hdmi_4212_regs_dump(hdata, prefix);
 }
 
 static u8 hdmi_chksum(struct hdmi_context *hdata,
@@ -789,12 +789,12 @@ static int hdmi_find_phy_conf(struct hdmi_context *hdata, u32 pixel_clock)
 
 	DRM_DEBUG_KMS("[%d] %s\n", __LINE__, __func__);
 
-	if (hdata->type == HDMI_TYPE13) {
-		confs = hdmiphy_v13_configs;
-		count = ARRAY_SIZE(hdmiphy_v13_configs);
-	} else if (hdata->type == HDMI_TYPE14) {
-		confs = hdmiphy_v14_configs;
-		count = ARRAY_SIZE(hdmiphy_v14_configs);
+	if (hdata->version == HDMI_VER_EXYNOS4210) {
+		confs = hdmiphy_4210_configs;
+		count = ARRAY_SIZE(hdmiphy_4210_configs);
+	} else if (hdata->version == HDMI_VER_EXYNOS4212) {
+		confs = hdmiphy_4212_configs;
+		count = ARRAY_SIZE(hdmiphy_4212_configs);
 	} else
 		return -EINVAL;
 
@@ -882,8 +882,8 @@ static void hdmi_reg_acr(struct hdmi_context *hdata, u8 *acr)
 	hdmi_reg_writeb(hdata, HDMI_ACR_CTS1, acr[2]);
 	hdmi_reg_writeb(hdata, HDMI_ACR_CTS2, acr[1]);
 
-	if (hdata->type == HDMI_TYPE13)
-		hdmi_reg_writeb(hdata, HDMI_V13_ACR_CON, 4);
+	if (hdata->version == HDMI_VER_EXYNOS4210)
+		hdmi_reg_writeb(hdata, HDMI_4210_ACR_CON, 4);
 	else
 		hdmi_reg_writeb(hdata, HDMI_ACR_CON, 4);
 }
@@ -986,8 +986,8 @@ static void hdmi_conf_reset(struct hdmi_context *hdata)
 {
 	u32 reg;
 
-	if (hdata->type == HDMI_TYPE13)
-		reg = HDMI_V13_CORE_RSTOUT;
+	if (hdata->version == HDMI_VER_EXYNOS4210)
+		reg = HDMI_4210_CORE_RSTOUT;
 	else
 		reg = HDMI_CORE_RSTOUT;
 
@@ -1020,21 +1020,21 @@ static void hdmi_conf_init(struct hdmi_context *hdata)
 				HDMI_VID_PREAMBLE_DIS | HDMI_GUARD_BAND_DIS);
 	}
 
-	if (hdata->type == HDMI_TYPE13) {
+	if (hdata->version == HDMI_VER_EXYNOS4210) {
 		/* choose bluescreen (fecal) color */
-		hdmi_reg_writeb(hdata, HDMI_V13_BLUE_SCREEN_0, 0x12);
-		hdmi_reg_writeb(hdata, HDMI_V13_BLUE_SCREEN_1, 0x34);
-		hdmi_reg_writeb(hdata, HDMI_V13_BLUE_SCREEN_2, 0x56);
+		hdmi_reg_writeb(hdata, HDMI_4210_BLUE_SCREEN_0, 0x12);
+		hdmi_reg_writeb(hdata, HDMI_4210_BLUE_SCREEN_1, 0x34);
+		hdmi_reg_writeb(hdata, HDMI_4210_BLUE_SCREEN_2, 0x56);
 
 		/* enable AVI packet every vsync, fixes purple line problem */
-		hdmi_reg_writeb(hdata, HDMI_V13_AVI_CON, 0x02);
+		hdmi_reg_writeb(hdata, HDMI_4210_AVI_CON, 0x02);
 		/* force RGB, look to CEA-861-D, table 7 for more detail */
-		hdmi_reg_writeb(hdata, HDMI_V13_AVI_BYTE(0), 0 << 5);
+		hdmi_reg_writeb(hdata, HDMI_4210_AVI_BYTE(0), 0 << 5);
 		hdmi_reg_writemask(hdata, HDMI_CON_1, 0x10 << 5, 0x11 << 5);
 
-		hdmi_reg_writeb(hdata, HDMI_V13_SPD_CON, 0x02);
-		hdmi_reg_writeb(hdata, HDMI_V13_AUI_CON, 0x02);
-		hdmi_reg_writeb(hdata, HDMI_V13_ACR_CON, 0x04);
+		hdmi_reg_writeb(hdata, HDMI_4210_SPD_CON, 0x02);
+		hdmi_reg_writeb(hdata, HDMI_4210_AUI_CON, 0x02);
+		hdmi_reg_writeb(hdata, HDMI_4210_ACR_CON, 0x04);
 	} else {
 		infoframe.type = HDMI_PACKET_TYPE_AVI;
 		infoframe.ver = HDMI_AVI_VERSION;
@@ -1051,39 +1051,39 @@ static void hdmi_conf_init(struct hdmi_context *hdata)
 	}
 }
 
-static void hdmi_v13_mode_apply(struct hdmi_context *hdata)
+static void hdmi_4210_mode_apply(struct hdmi_context *hdata)
 {
-	const struct hdmi_tg_regs *tg = &hdata->mode_conf.conf.v13_conf.tg;
-	const struct hdmi_v13_core_regs *core =
-		&hdata->mode_conf.conf.v13_conf.core;
+	const struct hdmi_tg_regs *tg = &hdata->mode_conf.conf.v4210_conf.tg;
+	const struct hdmi_4210_core_regs *core =
+		&hdata->mode_conf.conf.v4210_conf.core;
 	int tries;
 
 	/* setting core registers */
 	hdmi_reg_writeb(hdata, HDMI_H_BLANK_0, core->h_blank[0]);
 	hdmi_reg_writeb(hdata, HDMI_H_BLANK_1, core->h_blank[1]);
-	hdmi_reg_writeb(hdata, HDMI_V13_V_BLANK_0, core->v_blank[0]);
-	hdmi_reg_writeb(hdata, HDMI_V13_V_BLANK_1, core->v_blank[1]);
-	hdmi_reg_writeb(hdata, HDMI_V13_V_BLANK_2, core->v_blank[2]);
-	hdmi_reg_writeb(hdata, HDMI_V13_H_V_LINE_0, core->h_v_line[0]);
-	hdmi_reg_writeb(hdata, HDMI_V13_H_V_LINE_1, core->h_v_line[1]);
-	hdmi_reg_writeb(hdata, HDMI_V13_H_V_LINE_2, core->h_v_line[2]);
+	hdmi_reg_writeb(hdata, HDMI_4210_V_BLANK_0, core->v_blank[0]);
+	hdmi_reg_writeb(hdata, HDMI_4210_V_BLANK_1, core->v_blank[1]);
+	hdmi_reg_writeb(hdata, HDMI_4210_V_BLANK_2, core->v_blank[2]);
+	hdmi_reg_writeb(hdata, HDMI_4210_H_V_LINE_0, core->h_v_line[0]);
+	hdmi_reg_writeb(hdata, HDMI_4210_H_V_LINE_1, core->h_v_line[1]);
+	hdmi_reg_writeb(hdata, HDMI_4210_H_V_LINE_2, core->h_v_line[2]);
 	hdmi_reg_writeb(hdata, HDMI_VSYNC_POL, core->vsync_pol[0]);
 	hdmi_reg_writeb(hdata, HDMI_INT_PRO_MODE, core->int_pro_mode[0]);
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
+	hdmi_reg_writeb(hdata, HDMI_4210_V_BLANK_F_0, core->v_blank_f[0]);
+	hdmi_reg_writeb(hdata, HDMI_4210_V_BLANK_F_1, core->v_blank_f[1]);
+	hdmi_reg_writeb(hdata, HDMI_4210_V_BLANK_F_2, core->v_blank_f[2]);
+	hdmi_reg_writeb(hdata, HDMI_4210_H_SYNC_GEN_0, core->h_sync_gen[0]);
+	hdmi_reg_writeb(hdata, HDMI_4210_H_SYNC_GEN_1, core->h_sync_gen[1]);
+	hdmi_reg_writeb(hdata, HDMI_4210_H_SYNC_GEN_2, core->h_sync_gen[2]);
+	hdmi_reg_writeb(hdata, HDMI_4210_V_SYNC_GEN_1_0, core->v_sync_gen1[0]);
+	hdmi_reg_writeb(hdata, HDMI_4210_V_SYNC_GEN_1_1, core->v_sync_gen1[1]);
+	hdmi_reg_writeb(hdata, HDMI_4210_V_SYNC_GEN_1_2, core->v_sync_gen1[2]);
+	hdmi_reg_writeb(hdata, HDMI_4210_V_SYNC_GEN_2_0, core->v_sync_gen2[0]);
+	hdmi_reg_writeb(hdata, HDMI_4210_V_SYNC_GEN_2_1, core->v_sync_gen2[1]);
+	hdmi_reg_writeb(hdata, HDMI_4210_V_SYNC_GEN_2_2, core->v_sync_gen2[2]);
+	hdmi_reg_writeb(hdata, HDMI_4210_V_SYNC_GEN_3_0, core->v_sync_gen3[0]);
+	hdmi_reg_writeb(hdata, HDMI_4210_V_SYNC_GEN_3_1, core->v_sync_gen3[1]);
+	hdmi_reg_writeb(hdata, HDMI_4210_V_SYNC_GEN_3_2, core->v_sync_gen3[2]);
 	/* Timing generator registers */
 	hdmi_reg_writeb(hdata, HDMI_TG_H_FSZ_L, tg->h_fsz[0]);
 	hdmi_reg_writeb(hdata, HDMI_TG_H_FSZ_H, tg->h_fsz[1]);
@@ -1116,7 +1116,7 @@ static void hdmi_v13_mode_apply(struct hdmi_context *hdata)
 
 	/* waiting for HDMIPHY's PLL to get to steady state */
 	for (tries = 100; tries; --tries) {
-		u32 val = hdmi_reg_read(hdata, HDMI_V13_PHY_STATUS);
+		u32 val = hdmi_reg_read(hdata, HDMI_4210_PHY_STATUS);
 		if (val & HDMI_PHY_STATUS_READY)
 			break;
 		usleep_range(1000, 2000);
@@ -1140,11 +1140,11 @@ static void hdmi_v13_mode_apply(struct hdmi_context *hdata)
 		hdmi_reg_writemask(hdata, HDMI_TG_CMD, ~0, HDMI_TG_EN);
 }
 
-static void hdmi_v14_mode_apply(struct hdmi_context *hdata)
+static void hdmi_4212_mode_apply(struct hdmi_context *hdata)
 {
-	const struct hdmi_tg_regs *tg = &hdata->mode_conf.conf.v14_conf.tg;
-	const struct hdmi_v14_core_regs *core =
-		&hdata->mode_conf.conf.v14_conf.core;
+	const struct hdmi_tg_regs *tg = &hdata->mode_conf.conf.v4212_conf.tg;
+	const struct hdmi_4212_core_regs *core =
+		&hdata->mode_conf.conf.v4212_conf.core;
 	int tries;
 
 	/* setting core registers */
@@ -1309,10 +1309,10 @@ static void hdmi_v14_mode_apply(struct hdmi_context *hdata)
 
 static void hdmi_mode_apply(struct hdmi_context *hdata)
 {
-	if (hdata->type == HDMI_TYPE13)
-		hdmi_v13_mode_apply(hdata);
+	if (hdata->version == HDMI_VER_EXYNOS4210)
+		hdmi_4210_mode_apply(hdata);
 	else
-		hdmi_v14_mode_apply(hdata);
+		hdmi_4212_mode_apply(hdata);
 }
 
 static void hdmiphy_conf_reset(struct hdmi_context *hdata)
@@ -1331,8 +1331,8 @@ static void hdmiphy_conf_reset(struct hdmi_context *hdata)
 	if (hdata->hdmiphy_port)
 		i2c_master_send(hdata->hdmiphy_port, buffer, 2);
 
-	if (hdata->type == HDMI_TYPE13)
-		reg = HDMI_V13_PHY_RSTOUT;
+	if (hdata->version == HDMI_VER_EXYNOS4210)
+		reg = HDMI_4210_PHY_RSTOUT;
 	else
 		reg = HDMI_PHY_RSTOUT;
 
@@ -1347,7 +1347,7 @@ static void hdmiphy_poweron(struct hdmi_context *hdata)
 {
 	DRM_DEBUG_KMS("[%d] %s\n", __LINE__, __func__);
 
-	if (hdata->type == HDMI_TYPE14)
+	if (hdata->version != HDMI_VER_EXYNOS4210)
 		hdmi_reg_writemask(hdata, HDMI_PHY_CON_0, 0,
 			HDMI_PHY_POWER_OFF_EN);
 }
@@ -1356,7 +1356,7 @@ static void hdmiphy_poweroff(struct hdmi_context *hdata)
 {
 	DRM_DEBUG_KMS("[%d] %s\n", __LINE__, __func__);
 
-	if (hdata->type == HDMI_TYPE14)
+	if (hdata->version != HDMI_VER_EXYNOS4210)
 		hdmi_reg_writemask(hdata, HDMI_PHY_CON_0, ~0,
 			HDMI_PHY_POWER_OFF_EN);
 }
@@ -1382,10 +1382,10 @@ static void hdmiphy_conf_apply(struct hdmi_context *hdata)
 		return;
 	}
 
-	if (hdata->type == HDMI_TYPE13)
-		hdmiphy_data = hdmiphy_v13_configs[i].conf;
+	if (hdata->version == HDMI_VER_EXYNOS4210)
+		hdmiphy_data = hdmiphy_4210_configs[i].conf;
 	else
-		hdmiphy_data = hdmiphy_v14_configs[i].conf;
+		hdmiphy_data = hdmiphy_4212_configs[i].conf;
 
 	memcpy(buffer, hdmiphy_data, 32);
 	ret = i2c_master_send(hdata->hdmiphy_port, buffer, 32);
@@ -1446,11 +1446,12 @@ static void hdmi_set_reg(u8 *reg_pair, int num_bytes, u32 value)
 		reg_pair[i] = (value >> (8 * i)) & 0xff;
 }
 
-static void hdmi_v13_mode_set(struct hdmi_context *hdata,
+static void hdmi_4210_mode_set(struct hdmi_context *hdata,
 			struct drm_display_mode *m)
 {
-	struct hdmi_v13_core_regs *core = &hdata->mode_conf.conf.v13_conf.core;
-	struct hdmi_tg_regs *tg = &hdata->mode_conf.conf.v13_conf.tg;
+	struct hdmi_4210_core_regs *core =
+		&hdata->mode_conf.conf.v4210_conf.core;
+	struct hdmi_tg_regs *tg = &hdata->mode_conf.conf.v4210_conf.tg;
 	unsigned int val;
 
 	hdata->mode_conf.cea_video_id =
@@ -1542,12 +1543,12 @@ static void hdmi_v13_mode_set(struct hdmi_context *hdata,
 	hdmi_set_reg(tg->tg_3d, 1, 0x0); /* Not used */
 }
 
-static void hdmi_v14_mode_set(struct hdmi_context *hdata,
+static void hdmi_4212_mode_set(struct hdmi_context *hdata,
 			struct drm_display_mode *m)
 {
-	struct hdmi_tg_regs *tg = &hdata->mode_conf.conf.v14_conf.tg;
-	struct hdmi_v14_core_regs *core =
-		&hdata->mode_conf.conf.v14_conf.core;
+	struct hdmi_tg_regs *tg = &hdata->mode_conf.conf.v4212_conf.tg;
+	struct hdmi_4212_core_regs *core =
+		&hdata->mode_conf.conf.v4212_conf.core;
 
 	hdata->mode_conf.cea_video_id =
 		drm_match_cea_mode((struct drm_display_mode *)m);
@@ -1661,10 +1662,10 @@ static void hdmi_mode_set(void *ctx, struct drm_display_mode *mode)
 		m->vrefresh, (m->flags & DRM_MODE_FLAG_INTERLACE) ?
 		"INTERLACED" : "PROGERESSIVE");
 
-	if (hdata->type == HDMI_TYPE13)
-		hdmi_v13_mode_set(hdata, mode);
+	if (hdata->version == HDMI_VER_EXYNOS4210)
+		hdmi_4210_mode_set(hdata, mode);
 	else
-		hdmi_v14_mode_set(hdata, mode);
+		hdmi_4212_mode_set(hdata, mode);
 }
 
 static void hdmi_get_max_resol(void *ctx, unsigned int *width,
@@ -1962,16 +1963,16 @@ static int drm_hdmi_dt_parse_phy_pow_control(struct hdmi_context *hdata)
 static struct platform_device_id hdmi_driver_types[] = {
 	{
 		.name		= "s5pv210-hdmi",
-		.driver_data    = HDMI_TYPE13,
+		.driver_data    = HDMI_VER_EXYNOS4210,
 	}, {
 		.name		= "exynos4-hdmi",
-		.driver_data    = HDMI_TYPE13,
+		.driver_data    = HDMI_VER_EXYNOS4210,
 	}, {
 		.name		= "exynos4-hdmi14",
-		.driver_data	= HDMI_TYPE14,
+		.driver_data	= HDMI_VER_EXYNOS4212,
 	}, {
 		.name		= "exynos5-hdmi",
-		.driver_data	= HDMI_TYPE14,
+		.driver_data	= HDMI_VER_EXYNOS4212,
 	}, {
 		/* end node */
 	}
@@ -1981,7 +1982,7 @@ static struct platform_device_id hdmi_driver_types[] = {
 static struct of_device_id hdmi_match_types[] = {
 	{
 		.compatible = "samsung,exynos5-hdmi",
-		.data	= (void	*)HDMI_TYPE14,
+		.data	= (void	*)HDMI_VER_EXYNOS4212,
 	}, {
 		/* end node */
 	}
@@ -2041,9 +2042,9 @@ static int hdmi_probe(struct platform_device *pdev)
 					dev->of_node);
 		if (match == NULL)
 			return -ENODEV;
-		hdata->type = (enum hdmi_type)match->data;
+		hdata->version = (enum hdmi_version)match->data;
 	} else {
-		hdata->type = (enum hdmi_type)platform_get_device_id
+		hdata->version = (enum hdmi_version)platform_get_device_id
 					(pdev)->driver_data;
 	}
 
diff --git a/drivers/gpu/drm/exynos/regs-hdmi.h b/drivers/gpu/drm/exynos/regs-hdmi.h
index 8d9ca25..e169847 100644
--- a/drivers/gpu/drm/exynos/regs-hdmi.h
+++ b/drivers/gpu/drm/exynos/regs-hdmi.h
@@ -19,7 +19,7 @@
  * Register part
 */
 
-/* HDMI Version 1.3 & Common */
+/* HDMI Registers in Exynos4210 & Common to other soc */
 #define HDMI_CTRL_BASE(x)		((x) + 0x00000000)
 #define HDMI_CORE_BASE(x)		((x) + 0x00010000)
 #define HDMI_I2S_BASE(x)		((x) + 0x00040000)
@@ -29,57 +29,57 @@
 #define HDMI_INTC_CON			HDMI_CTRL_BASE(0x0000)
 #define HDMI_INTC_FLAG			HDMI_CTRL_BASE(0x0004)
 #define HDMI_HPD_STATUS			HDMI_CTRL_BASE(0x000C)
-#define HDMI_V13_PHY_RSTOUT		HDMI_CTRL_BASE(0x0014)
-#define HDMI_V13_PHY_VPLL		HDMI_CTRL_BASE(0x0018)
-#define HDMI_V13_PHY_CMU		HDMI_CTRL_BASE(0x001C)
-#define HDMI_V13_CORE_RSTOUT		HDMI_CTRL_BASE(0x0020)
+#define HDMI_4210_PHY_RSTOUT		HDMI_CTRL_BASE(0x0014)
+#define HDMI_4210_PHY_VPLL		HDMI_CTRL_BASE(0x0018)
+#define HDMI_4210_PHY_CMU		HDMI_CTRL_BASE(0x001C)
+#define HDMI_4210_CORE_RSTOUT		HDMI_CTRL_BASE(0x0020)
 
 /* Core registers */
 #define HDMI_CON_0			HDMI_CORE_BASE(0x0000)
 #define HDMI_CON_1			HDMI_CORE_BASE(0x0004)
 #define HDMI_CON_2			HDMI_CORE_BASE(0x0008)
 #define HDMI_SYS_STATUS			HDMI_CORE_BASE(0x0010)
-#define HDMI_V13_PHY_STATUS		HDMI_CORE_BASE(0x0014)
+#define HDMI_4210_PHY_STATUS		HDMI_CORE_BASE(0x0014)
 #define HDMI_STATUS_EN			HDMI_CORE_BASE(0x0020)
 #define HDMI_HPD			HDMI_CORE_BASE(0x0030)
 #define HDMI_MODE_SEL			HDMI_CORE_BASE(0x0040)
 #define HDMI_ENC_EN			HDMI_CORE_BASE(0x0044)
-#define HDMI_V13_BLUE_SCREEN_0		HDMI_CORE_BASE(0x0050)
-#define HDMI_V13_BLUE_SCREEN_1		HDMI_CORE_BASE(0x0054)
-#define HDMI_V13_BLUE_SCREEN_2		HDMI_CORE_BASE(0x0058)
+#define HDMI_4210_BLUE_SCREEN_0		HDMI_CORE_BASE(0x0050)
+#define HDMI_4210_BLUE_SCREEN_1		HDMI_CORE_BASE(0x0054)
+#define HDMI_4210_BLUE_SCREEN_2		HDMI_CORE_BASE(0x0058)
 #define HDMI_H_BLANK_0			HDMI_CORE_BASE(0x00A0)
 #define HDMI_H_BLANK_1			HDMI_CORE_BASE(0x00A4)
-#define HDMI_V13_V_BLANK_0		HDMI_CORE_BASE(0x00B0)
-#define HDMI_V13_V_BLANK_1		HDMI_CORE_BASE(0x00B4)
-#define HDMI_V13_V_BLANK_2		HDMI_CORE_BASE(0x00B8)
-#define HDMI_V13_H_V_LINE_0		HDMI_CORE_BASE(0x00C0)
-#define HDMI_V13_H_V_LINE_1		HDMI_CORE_BASE(0x00C4)
-#define HDMI_V13_H_V_LINE_2		HDMI_CORE_BASE(0x00C8)
+#define HDMI_4210_V_BLANK_0		HDMI_CORE_BASE(0x00B0)
+#define HDMI_4210_V_BLANK_1		HDMI_CORE_BASE(0x00B4)
+#define HDMI_4210_V_BLANK_2		HDMI_CORE_BASE(0x00B8)
+#define HDMI_4210_H_V_LINE_0		HDMI_CORE_BASE(0x00C0)
+#define HDMI_4210_H_V_LINE_1		HDMI_CORE_BASE(0x00C4)
+#define HDMI_4210_H_V_LINE_2		HDMI_CORE_BASE(0x00C8)
 #define HDMI_VSYNC_POL			HDMI_CORE_BASE(0x00E4)
 #define HDMI_INT_PRO_MODE		HDMI_CORE_BASE(0x00E8)
-#define HDMI_V13_V_BLANK_F_0		HDMI_CORE_BASE(0x0110)
-#define HDMI_V13_V_BLANK_F_1		HDMI_CORE_BASE(0x0114)
-#define HDMI_V13_V_BLANK_F_2		HDMI_CORE_BASE(0x0118)
-#define HDMI_V13_H_SYNC_GEN_0		HDMI_CORE_BASE(0x0120)
-#define HDMI_V13_H_SYNC_GEN_1		HDMI_CORE_BASE(0x0124)
-#define HDMI_V13_H_SYNC_GEN_2		HDMI_CORE_BASE(0x0128)
-#define HDMI_V13_V_SYNC_GEN_1_0		HDMI_CORE_BASE(0x0130)
-#define HDMI_V13_V_SYNC_GEN_1_1		HDMI_CORE_BASE(0x0134)
-#define HDMI_V13_V_SYNC_GEN_1_2		HDMI_CORE_BASE(0x0138)
-#define HDMI_V13_V_SYNC_GEN_2_0		HDMI_CORE_BASE(0x0140)
-#define HDMI_V13_V_SYNC_GEN_2_1		HDMI_CORE_BASE(0x0144)
-#define HDMI_V13_V_SYNC_GEN_2_2		HDMI_CORE_BASE(0x0148)
-#define HDMI_V13_V_SYNC_GEN_3_0		HDMI_CORE_BASE(0x0150)
-#define HDMI_V13_V_SYNC_GEN_3_1		HDMI_CORE_BASE(0x0154)
-#define HDMI_V13_V_SYNC_GEN_3_2		HDMI_CORE_BASE(0x0158)
-#define HDMI_V13_ACR_CON		HDMI_CORE_BASE(0x0180)
-#define HDMI_V13_AVI_CON		HDMI_CORE_BASE(0x0300)
-#define HDMI_V13_AVI_BYTE(n)		HDMI_CORE_BASE(0x0320 + 4 * (n))
-#define HDMI_V13_DC_CONTROL		HDMI_CORE_BASE(0x05C0)
-#define HDMI_V13_VIDEO_PATTERN_GEN	HDMI_CORE_BASE(0x05C4)
-#define HDMI_V13_HPD_GEN		HDMI_CORE_BASE(0x05C8)
-#define HDMI_V13_AUI_CON		HDMI_CORE_BASE(0x0360)
-#define HDMI_V13_SPD_CON		HDMI_CORE_BASE(0x0400)
+#define HDMI_4210_V_BLANK_F_0		HDMI_CORE_BASE(0x0110)
+#define HDMI_4210_V_BLANK_F_1		HDMI_CORE_BASE(0x0114)
+#define HDMI_4210_V_BLANK_F_2		HDMI_CORE_BASE(0x0118)
+#define HDMI_4210_H_SYNC_GEN_0		HDMI_CORE_BASE(0x0120)
+#define HDMI_4210_H_SYNC_GEN_1		HDMI_CORE_BASE(0x0124)
+#define HDMI_4210_H_SYNC_GEN_2		HDMI_CORE_BASE(0x0128)
+#define HDMI_4210_V_SYNC_GEN_1_0		HDMI_CORE_BASE(0x0130)
+#define HDMI_4210_V_SYNC_GEN_1_1		HDMI_CORE_BASE(0x0134)
+#define HDMI_4210_V_SYNC_GEN_1_2		HDMI_CORE_BASE(0x0138)
+#define HDMI_4210_V_SYNC_GEN_2_0		HDMI_CORE_BASE(0x0140)
+#define HDMI_4210_V_SYNC_GEN_2_1		HDMI_CORE_BASE(0x0144)
+#define HDMI_4210_V_SYNC_GEN_2_2		HDMI_CORE_BASE(0x0148)
+#define HDMI_4210_V_SYNC_GEN_3_0		HDMI_CORE_BASE(0x0150)
+#define HDMI_4210_V_SYNC_GEN_3_1		HDMI_CORE_BASE(0x0154)
+#define HDMI_4210_V_SYNC_GEN_3_2		HDMI_CORE_BASE(0x0158)
+#define HDMI_4210_ACR_CON		HDMI_CORE_BASE(0x0180)
+#define HDMI_4210_AVI_CON		HDMI_CORE_BASE(0x0300)
+#define HDMI_4210_AVI_BYTE(n)		HDMI_CORE_BASE(0x0320 + 4 * (n))
+#define HDMI_4210_DC_CONTROL		HDMI_CORE_BASE(0x05C0)
+#define HDMI_4210_VIDEO_PATTERN_GEN	HDMI_CORE_BASE(0x05C4)
+#define HDMI_4210_HPD_GEN		HDMI_CORE_BASE(0x05C8)
+#define HDMI_4210_AUI_CON		HDMI_CORE_BASE(0x0360)
+#define HDMI_4210_SPD_CON		HDMI_CORE_BASE(0x0400)
 
 /* Timing generator registers */
 #define HDMI_TG_CMD			HDMI_TG_BASE(0x0000)
@@ -155,7 +155,7 @@
 #define HDMI_FIELD_EN			(1 << 1)
 
 
-/* HDMI Version 1.4 */
+/* HDMI Registers in Exynos4212 */
 /* Control registers */
 /* #define HDMI_INTC_CON		HDMI_CTRL_BASE(0x0000) */
 /* #define HDMI_INTC_FLAG		HDMI_CTRL_BASE(0x0004) */
-- 
1.7.10.4
