From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 05/16] drm/exynos/hdmi: simplify HDMI-PHY power sequence
Date: Fri, 25 Sep 2015 14:48:18 +0200
Message-ID: <1443185309-13827-6-git-send-email-a.hajda@samsung.com>
References: <1443185309-13827-1-git-send-email-a.hajda@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:41335 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932207AbbIYMtE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 25 Sep 2015 08:49:04 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NV800AZYGXO9J10@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 25 Sep 2015 13:49:00 +0100 (BST)
In-reply-to: <1443185309-13827-1-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org

Currently driver tries to set specific HDMI-PHY registers in three situations:
- before reset,
- before power off,
- after applying HDMI-PHY configuration.

First two cases seems to be unnecessary - register contents will be lost
anyway. The third case can be merged with HDMI-PHY configuration by fixing
the last byte of configuration data.

The patch has been tested with following platforms:
- exynos4210-universal_c210,
- exynos4412-odroidu3,
- exynos5422-odroidxu3.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_hdmi.c | 93 ++++--------------------------------
 1 file changed, 8 insertions(+), 85 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
index 414ea2d..814dd8c 100644
--- a/drivers/gpu/drm/exynos/exynos_hdmi.c
+++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
@@ -148,7 +148,7 @@ static const struct hdmiphy_config hdmiphy_v13_configs[] = {
 			0x01, 0x05, 0x00, 0xD8, 0x10, 0x1C, 0x30, 0x40,
 			0x6B, 0x10, 0x02, 0x51, 0xDF, 0xF2, 0x54, 0x87,
 			0x84, 0x00, 0x30, 0x38, 0x00, 0x08, 0x10, 0xE0,
-			0x22, 0x40, 0xE3, 0x26, 0x00, 0x00, 0x00, 0x00,
+			0x22, 0x40, 0xE3, 0x26, 0x00, 0x00, 0x00, 0x80,
 		},
 	},
 	{
@@ -157,7 +157,7 @@ static const struct hdmiphy_config hdmiphy_v13_configs[] = {
 			0x01, 0x05, 0x00, 0xD4, 0x10, 0x9C, 0x09, 0x64,
 			0x6B, 0x10, 0x02, 0x51, 0xDF, 0xF2, 0x54, 0x87,
 			0x84, 0x00, 0x30, 0x38, 0x00, 0x08, 0x10, 0xE0,
-			0x22, 0x40, 0xE3, 0x26, 0x00, 0x00, 0x00, 0x00,
+			0x22, 0x40, 0xE3, 0x26, 0x00, 0x00, 0x00, 0x80,
 		},
 	},
 	{
@@ -166,7 +166,7 @@ static const struct hdmiphy_config hdmiphy_v13_configs[] = {
 			0x01, 0x05, 0x00, 0xD8, 0x10, 0x9C, 0xef, 0x5B,
 			0x6D, 0x10, 0x01, 0x51, 0xef, 0xF3, 0x54, 0xb9,
 			0x84, 0x00, 0x30, 0x38, 0x00, 0x08, 0x10, 0xE0,
-			0x22, 0x40, 0xa5, 0x26, 0x01, 0x00, 0x00, 0x00,
+			0x22, 0x40, 0xa5, 0x26, 0x01, 0x00, 0x00, 0x80,
 		},
 	},
 	{
@@ -175,7 +175,7 @@ static const struct hdmiphy_config hdmiphy_v13_configs[] = {
 			0x01, 0x05, 0x00, 0xd8, 0x10, 0x9c, 0xf8, 0x40,
 			0x6a, 0x10, 0x01, 0x51, 0xff, 0xf1, 0x54, 0xba,
 			0x84, 0x00, 0x10, 0x38, 0x00, 0x08, 0x10, 0xe0,
-			0x22, 0x40, 0xa4, 0x26, 0x01, 0x00, 0x00, 0x00,
+			0x22, 0x40, 0xa4, 0x26, 0x01, 0x00, 0x00, 0x80,
 		},
 	},
 	{
@@ -184,7 +184,7 @@ static const struct hdmiphy_config hdmiphy_v13_configs[] = {
 			0x01, 0x05, 0x00, 0xD8, 0x10, 0x9C, 0xf8, 0x40,
 			0x6A, 0x18, 0x00, 0x51, 0xff, 0xF1, 0x54, 0xba,
 			0x84, 0x00, 0x10, 0x38, 0x00, 0x08, 0x10, 0xE0,
-			0x22, 0x40, 0xa4, 0x26, 0x02, 0x00, 0x00, 0x00,
+			0x22, 0x40, 0xa4, 0x26, 0x02, 0x00, 0x00, 0x80,
 		},
 	},
 };
@@ -214,7 +214,7 @@ static const struct hdmiphy_config hdmiphy_v14_configs[] = {
 			0x01, 0xd1, 0x2d, 0x72, 0x40, 0x64, 0x12, 0x08,
 			0x43, 0xa0, 0x0e, 0xd9, 0x45, 0xa0, 0xac, 0x80,
 			0x08, 0x80, 0x11, 0x04, 0x02, 0x22, 0x44, 0x86,
-			0x54, 0xe3, 0x24, 0x00, 0x00, 0x00, 0x01, 0x00,
+			0x54, 0xe3, 0x24, 0x00, 0x00, 0x00, 0x01, 0x80,
 		},
 	},
 	{
@@ -277,7 +277,7 @@ static const struct hdmiphy_config hdmiphy_v14_configs[] = {
 			0x01, 0xd1, 0x1f, 0x10, 0x40, 0x40, 0xf8, 0x08,
 			0x81, 0xa0, 0xba, 0xd8, 0x45, 0xa0, 0xac, 0x80,
 			0x3c, 0x80, 0x11, 0x04, 0x02, 0x22, 0x44, 0x86,
-			0x54, 0xa5, 0x24, 0x01, 0x00, 0x00, 0x01, 0x00,
+			0x54, 0xa5, 0x24, 0x01, 0x00, 0x00, 0x01, 0x80,
 		},
 	},
 	{
@@ -340,7 +340,7 @@ static const struct hdmiphy_config hdmiphy_v14_configs[] = {
 			0x01, 0xd1, 0x1f, 0x00, 0x40, 0x40, 0xf8, 0x08,
 			0x81, 0xa0, 0xba, 0xd8, 0x45, 0xa0, 0xac, 0x80,
 			0x3c, 0x80, 0x11, 0x04, 0x02, 0x22, 0x44, 0x86,
-			0x54, 0x4b, 0x25, 0x03, 0x00, 0x00, 0x01, 0x00,
+			0x54, 0x4b, 0x25, 0x03, 0x00, 0x00, 0x01, 0x80,
 		},
 	},
 };
@@ -563,26 +563,6 @@ static inline void hdmi_reg_writemask(struct hdmi_context *hdata,
 	writel(value, hdata->regs + reg_id);
 }
 
-static int hdmiphy_reg_writeb(struct hdmi_context *hdata,
-			u32 reg_offset, u8 value)
-{
-	if (hdata->hdmiphy_port) {
-		u8 buffer[2];
-		int ret;
-
-		buffer[0] = reg_offset;
-		buffer[1] = value;
-
-		ret = i2c_master_send(hdata->hdmiphy_port, buffer, 2);
-		if (ret == 2)
-			return 0;
-		return ret;
-	} else {
-		writeb(value, hdata->regs_hdmiphy + (reg_offset<<2));
-		return 0;
-	}
-}
-
 static int hdmiphy_reg_write_buf(struct hdmi_context *hdata,
 			u32 reg_offset, const u8 *buf, u32 len)
 {
@@ -1598,10 +1578,6 @@ static void hdmiphy_conf_reset(struct hdmi_context *hdata)
 	clk_set_parent(hdata->res.mout_hdmi, hdata->res.sclk_pixel);
 	clk_prepare_enable(hdata->res.sclk_hdmi);
 
-	/* operation mode */
-	hdmiphy_reg_writeb(hdata, HDMIPHY_MODE_SET_DONE,
-				HDMI_PHY_ENABLE_MODE_SET);
-
 	/* reset hdmiphy */
 	hdmi_reg_writemask(hdata, HDMI_PHY_RSTOUT, ~0, HDMI_PHY_SW_RSTOUT);
 	usleep_range(10000, 12000);
@@ -1609,48 +1585,6 @@ static void hdmiphy_conf_reset(struct hdmi_context *hdata)
 	usleep_range(10000, 12000);
 }
 
-static void hdmiphy_poweron(struct hdmi_context *hdata)
-{
-	if (hdata->drv_data->type != HDMI_TYPE14)
-		return;
-
-	DRM_DEBUG_KMS("\n");
-
-	/* For PHY Mode Setting */
-	hdmiphy_reg_writeb(hdata, HDMIPHY_MODE_SET_DONE,
-				HDMI_PHY_ENABLE_MODE_SET);
-	/* Phy Power On */
-	hdmiphy_reg_writeb(hdata, HDMIPHY_POWER,
-				HDMI_PHY_POWER_ON);
-	/* For PHY Mode Setting */
-	hdmiphy_reg_writeb(hdata, HDMIPHY_MODE_SET_DONE,
-				HDMI_PHY_DISABLE_MODE_SET);
-	/* PHY SW Reset */
-	hdmiphy_conf_reset(hdata);
-}
-
-static void hdmiphy_poweroff(struct hdmi_context *hdata)
-{
-	if (hdata->drv_data->type != HDMI_TYPE14)
-		return;
-
-	DRM_DEBUG_KMS("\n");
-
-	/* PHY SW Reset */
-	hdmiphy_conf_reset(hdata);
-	/* For PHY Mode Setting */
-	hdmiphy_reg_writeb(hdata, HDMIPHY_MODE_SET_DONE,
-				HDMI_PHY_ENABLE_MODE_SET);
-
-	/* PHY Power Off */
-	hdmiphy_reg_writeb(hdata, HDMIPHY_POWER,
-				HDMI_PHY_POWER_OFF);
-
-	/* For PHY Mode Setting */
-	hdmiphy_reg_writeb(hdata, HDMIPHY_MODE_SET_DONE,
-				HDMI_PHY_DISABLE_MODE_SET);
-}
-
 static void hdmiphy_conf_apply(struct hdmi_context *hdata)
 {
 	int ret;
@@ -1671,14 +1605,6 @@ static void hdmiphy_conf_apply(struct hdmi_context *hdata)
 	}
 
 	usleep_range(10000, 12000);
-
-	ret = hdmiphy_reg_writeb(hdata, HDMIPHY_MODE_SET_DONE,
-				HDMI_PHY_DISABLE_MODE_SET);
-	if (ret) {
-		DRM_ERROR("failed to enable hdmiphy\n");
-		return;
-	}
-
 }
 
 static void hdmi_conf_apply(struct hdmi_context *hdata)
@@ -1736,7 +1662,6 @@ static void hdmi_enable(struct drm_encoder *encoder)
 	clk_prepare_enable(res->hdmi);
 	clk_prepare_enable(res->sclk_hdmi);
 
-	hdmiphy_poweron(hdata);
 	hdmi_conf_apply(hdata);
 }
 
@@ -1767,8 +1692,6 @@ static void hdmi_disable(struct drm_encoder *encoder)
 	/* HDMI System Disable */
 	hdmi_reg_writemask(hdata, HDMI_CON_0, 0, HDMI_EN);
 
-	hdmiphy_poweroff(hdata);
-
 	cancel_delayed_work(&hdata->hotplug_work);
 
 	clk_disable_unprepare(res->sclk_hdmi);
-- 
1.9.1
