From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 03/16] drm/exynos/hdmi: use mappings for registers with IP
 dependent address
Date: Fri, 25 Sep 2015 14:48:16 +0200
Message-ID: <1443185309-13827-4-git-send-email-a.hajda@samsung.com>
References: <1443185309-13827-1-git-send-email-a.hajda@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:41335 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932213AbbIYMtD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 25 Sep 2015 08:49:03 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NV800CTIGXN9810@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 25 Sep 2015 13:48:59 +0100 (BST)
In-reply-to: <1443185309-13827-1-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org

Some registers resides at different offsets depending on device version.
This patch adds infrastructure for mapping such registers to proper address
based on hdmi_type. It adds also mappings to some registers.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_hdmi.c | 56 +++++++++++++++++++++++-------------
 drivers/gpu/drm/exynos/regs-hdmi.h   |  4 +--
 2 files changed, 38 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
index c25b892..6221803 100644
--- a/drivers/gpu/drm/exynos/exynos_hdmi.c
+++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
@@ -66,6 +66,21 @@
 enum hdmi_type {
 	HDMI_TYPE13,
 	HDMI_TYPE14,
+	HDMI_TYPE_COUNT
+};
+
+#define HDMI_MAPPED_BASE 0xffff0000
+
+enum hdmi_mapped_regs {
+	HDMI_PHY_STATUS = HDMI_MAPPED_BASE,
+	HDMI_PHY_RSTOUT,
+	HDMI_ACR_CON,
+};
+
+static const u32 hdmi_reg_map[][HDMI_TYPE_COUNT] = {
+	{ HDMI_V13_PHY_STATUS, HDMI_PHY_STATUS_0 },
+	{ HDMI_V13_PHY_RSTOUT, HDMI_V14_PHY_RSTOUT },
+	{ HDMI_V13_ACR_CON, HDMI_V14_ACR_CON },
 };
 
 struct hdmi_driver_data {
@@ -507,20 +522,29 @@ static struct hdmi_driver_data exynos4210_hdmi_driver_data = {
 	.is_apb_phy	= 0,
 };
 
+static inline u32 hdmi_map_reg(struct hdmi_context *hdata, u32 reg_id)
+{
+	if ((reg_id & 0xffff0000) == HDMI_MAPPED_BASE)
+		return hdmi_reg_map[reg_id & 0xffff][hdata->drv_data->type];
+	return reg_id;
+}
+
 static inline u32 hdmi_reg_read(struct hdmi_context *hdata, u32 reg_id)
 {
-	return readl(hdata->regs + reg_id);
+	return readl(hdata->regs + hdmi_map_reg(hdata, reg_id));
 }
 
 static inline void hdmi_reg_writeb(struct hdmi_context *hdata,
 				 u32 reg_id, u8 value)
 {
-	writeb(value, hdata->regs + reg_id);
+	writeb(value, hdata->regs + hdmi_map_reg(hdata, reg_id));
 }
 
 static inline void hdmi_reg_writev(struct hdmi_context *hdata, u32 reg_id,
 				   int bytes, u32 val)
 {
+	reg_id = hdmi_map_reg(hdata, reg_id);
+
 	while (--bytes >= 0) {
 		writeb(val & 0xff, hdata->regs + reg_id);
 		val >>= 8;
@@ -531,7 +555,10 @@ static inline void hdmi_reg_writev(struct hdmi_context *hdata, u32 reg_id,
 static inline void hdmi_reg_writemask(struct hdmi_context *hdata,
 				 u32 reg_id, u32 value, u32 mask)
 {
-	u32 old = readl(hdata->regs + reg_id);
+	u32 old;
+
+	reg_id = hdmi_map_reg(hdata, reg_id);
+	old = readl(hdata->regs + reg_id);
 	value = (value & mask) | (old & ~mask);
 	writel(value, hdata->regs + reg_id);
 }
@@ -682,7 +709,7 @@ static void hdmi_v14_regs_dump(struct hdmi_context *hdata, char *prefix)
 	DUMPREG(HDMI_PHY_STATUS_0);
 	DUMPREG(HDMI_PHY_STATUS_PLL);
 	DUMPREG(HDMI_PHY_CON_0);
-	DUMPREG(HDMI_PHY_RSTOUT);
+	DUMPREG(HDMI_V14_PHY_RSTOUT);
 	DUMPREG(HDMI_PHY_VPLL);
 	DUMPREG(HDMI_PHY_CMU);
 	DUMPREG(HDMI_CORE_RSTOUT);
@@ -1162,11 +1189,7 @@ static void hdmi_reg_acr(struct hdmi_context *hdata, u8 *acr)
 	hdmi_reg_writeb(hdata, HDMI_ACR_CTS0, acr[3]);
 	hdmi_reg_writeb(hdata, HDMI_ACR_CTS1, acr[2]);
 	hdmi_reg_writeb(hdata, HDMI_ACR_CTS2, acr[1]);
-
-	if (hdata->drv_data->type == HDMI_TYPE13)
-		hdmi_reg_writeb(hdata, HDMI_V13_ACR_CON, 4);
-	else
-		hdmi_reg_writeb(hdata, HDMI_ACR_CON, 4);
+	hdmi_reg_writeb(hdata, HDMI_ACR_CON, 4);
 }
 
 static void hdmi_audio_init(struct hdmi_context *hdata)
@@ -1421,7 +1444,7 @@ static void hdmi_v13_mode_apply(struct hdmi_context *hdata)
 
 	/* waiting for HDMIPHY's PLL to get to steady state */
 	for (tries = 100; tries; --tries) {
-		u32 val = hdmi_reg_read(hdata, HDMI_V13_PHY_STATUS);
+		u32 val = hdmi_reg_read(hdata, HDMI_PHY_STATUS);
 		if (val & HDMI_PHY_STATUS_READY)
 			break;
 		usleep_range(1000, 2000);
@@ -1558,7 +1581,7 @@ static void hdmi_v14_mode_apply(struct hdmi_context *hdata)
 
 	/* waiting for HDMIPHY's PLL to get to steady state */
 	for (tries = 100; tries; --tries) {
-		u32 val = hdmi_reg_read(hdata, HDMI_PHY_STATUS_0);
+		u32 val = hdmi_reg_read(hdata, HDMI_PHY_STATUS);
 		if (val & HDMI_PHY_STATUS_READY)
 			break;
 		usleep_range(1000, 2000);
@@ -1587,8 +1610,6 @@ static void hdmi_mode_apply(struct hdmi_context *hdata)
 
 static void hdmiphy_conf_reset(struct hdmi_context *hdata)
 {
-	u32 reg;
-
 	clk_disable_unprepare(hdata->res.sclk_hdmi);
 	clk_set_parent(hdata->res.mout_hdmi, hdata->res.sclk_pixel);
 	clk_prepare_enable(hdata->res.sclk_hdmi);
@@ -1597,15 +1618,10 @@ static void hdmiphy_conf_reset(struct hdmi_context *hdata)
 	hdmiphy_reg_writeb(hdata, HDMIPHY_MODE_SET_DONE,
 				HDMI_PHY_ENABLE_MODE_SET);
 
-	if (hdata->drv_data->type == HDMI_TYPE13)
-		reg = HDMI_V13_PHY_RSTOUT;
-	else
-		reg = HDMI_PHY_RSTOUT;
-
 	/* reset hdmiphy */
-	hdmi_reg_writemask(hdata, reg, ~0, HDMI_PHY_SW_RSTOUT);
+	hdmi_reg_writemask(hdata, HDMI_PHY_RSTOUT, ~0, HDMI_PHY_SW_RSTOUT);
 	usleep_range(10000, 12000);
-	hdmi_reg_writemask(hdata, reg,  0, HDMI_PHY_SW_RSTOUT);
+	hdmi_reg_writemask(hdata, HDMI_PHY_RSTOUT,  0, HDMI_PHY_SW_RSTOUT);
 	usleep_range(10000, 12000);
 }
 
diff --git a/drivers/gpu/drm/exynos/regs-hdmi.h b/drivers/gpu/drm/exynos/regs-hdmi.h
index 3f35ac6..8b2d337 100644
--- a/drivers/gpu/drm/exynos/regs-hdmi.h
+++ b/drivers/gpu/drm/exynos/regs-hdmi.h
@@ -171,7 +171,7 @@
 #define HDMI_HPD_ST			HDMI_CTRL_BASE(0x0044)
 #define HDMI_HPD_TH_X			HDMI_CTRL_BASE(0x0050)
 #define HDMI_AUDIO_CLKSEL		HDMI_CTRL_BASE(0x0070)
-#define HDMI_PHY_RSTOUT			HDMI_CTRL_BASE(0x0074)
+#define HDMI_V14_PHY_RSTOUT		HDMI_CTRL_BASE(0x0074)
 #define HDMI_PHY_VPLL			HDMI_CTRL_BASE(0x0078)
 #define HDMI_PHY_CMU			HDMI_CTRL_BASE(0x007C)
 #define HDMI_CORE_RSTOUT		HDMI_CTRL_BASE(0x0080)
@@ -277,7 +277,7 @@
 #define HDMI_ASP_CHCFG2			HDMI_CORE_BASE(0x0318)
 #define HDMI_ASP_CHCFG3			HDMI_CORE_BASE(0x031C)
 
-#define HDMI_ACR_CON			HDMI_CORE_BASE(0x0400)
+#define HDMI_V14_ACR_CON		HDMI_CORE_BASE(0x0400)
 #define HDMI_ACR_MCTS0			HDMI_CORE_BASE(0x0410)
 #define HDMI_ACR_MCTS1			HDMI_CORE_BASE(0x0414)
 #define HDMI_ACR_MCTS2			HDMI_CORE_BASE(0x0418)
-- 
1.9.1
