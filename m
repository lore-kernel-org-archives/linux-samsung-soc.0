From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 1/7] drm/exynos/hdmi: fix PHY configuration sequence
Date: Wed, 23 Mar 2016 14:15:12 +0100
Message-ID: <1458738918-32054-2-git-send-email-a.hajda@samsung.com>
References: <1458738918-32054-1-git-send-email-a.hajda@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:36081 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755438AbcCWNPf (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 23 Mar 2016 09:15:35 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0O4H00CTEU5WNN90@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 23 Mar 2016 13:15:32 +0000 (GMT)
In-reply-to: <1458738918-32054-1-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: Andrzej Hajda <a.hajda@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, "open list:DRM DRIVERS FOR EXYNOS" <dri-devel@lists.freedesktop.org>, "moderated list:ARM/SAMSUNG EXYNOS
	ARM ARCHITECTURES" <linux-samsung-soc@vger.kernel.org>

Proper PHY configuration should be as follow:
1. set HDMI clock parents to OSCCLK.
2. reconfigure PHY.
3. set HDMI clock parents to PHY.
4. wait for PLL stabilization.

The patch fixes it and consolidates the code.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_hdmi.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
index 839ad70..5c7dbfc 100644
--- a/drivers/gpu/drm/exynos/exynos_hdmi.c
+++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
@@ -1657,15 +1657,11 @@ static void hdmi_mode_apply(struct hdmi_context *hdata)
 	else
 		hdmi_v14_mode_apply(hdata);
 
-	hdmiphy_wait_for_pll(hdata);
-	hdmi_clk_set_parents(hdata, true);
 	hdmi_start(hdata, true);
 }
 
 static void hdmiphy_conf_reset(struct hdmi_context *hdata)
 {
-	hdmi_clk_set_parents(hdata, false);
-
 	hdmi_reg_writemask(hdata, HDMI_PHY_RSTOUT, ~0, HDMI_PHY_SW_RSTOUT);
 	usleep_range(10000, 12000);
 	hdmi_reg_writemask(hdata, HDMI_PHY_RSTOUT, 0, HDMI_PHY_SW_RSTOUT);
@@ -1683,29 +1679,33 @@ static void hdmiphy_enable_mode_set(struct hdmi_context *hdata, bool enable)
 static void hdmiphy_conf_apply(struct hdmi_context *hdata)
 {
 	int ret;
-	int i;
+	const u8 *phy_conf;
 
-	i = hdmi_find_phy_conf(hdata, hdata->current_mode.clock * 1000);
-	if (i < 0) {
+	ret = hdmi_find_phy_conf(hdata, hdata->current_mode.clock * 1000);
+	if (ret < 0) {
 		DRM_ERROR("failed to find hdmiphy conf\n");
 		return;
 	}
+	phy_conf = hdata->drv_data->phy_confs.data[ret].conf;
+
+	hdmi_clk_set_parents(hdata, false);
+
+	hdmiphy_conf_reset(hdata);
 
 	hdmiphy_enable_mode_set(hdata, true);
-	ret = hdmiphy_reg_write_buf(hdata, 0,
-			hdata->drv_data->phy_confs.data[i].conf, 32);
+	ret = hdmiphy_reg_write_buf(hdata, 0, phy_conf, 32);
 	if (ret) {
 		DRM_ERROR("failed to configure hdmiphy\n");
 		return;
 	}
 	hdmiphy_enable_mode_set(hdata, false);
-
+	hdmi_clk_set_parents(hdata, true);
 	usleep_range(10000, 12000);
+	hdmiphy_wait_for_pll(hdata);
 }
 
 static void hdmi_conf_apply(struct hdmi_context *hdata)
 {
-	hdmiphy_conf_reset(hdata);
 	hdmiphy_conf_apply(hdata);
 	hdmi_start(hdata, false);
 	hdmi_conf_init(hdata);
-- 
1.9.1
