From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [PATCH 7/7] drm/exynos: replace hdmi reset with hdmi disable
Date: Thu, 03 Apr 2014 20:41:04 +0530
Message-ID: <1396537864-29291-8-git-send-email-rahul.sharma@samsung.com>
References: <1396537864-29291-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:56598 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752283AbaDCPMT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 3 Apr 2014 11:12:19 -0400
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N3G00B1LNKINV30@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 04 Apr 2014 00:12:18 +0900 (KST)
In-reply-to: <1396537864-29291-1-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: inki.dae@samsung.com, r.sh.open@gmail.com, joshi@samsung.com, Rahul Sharma <rahul.sharma@samsung.com>, Shirish S <s.shirish@samsung.com>

Before setting the core and timing generation registers,
hdmi driver resets the whole hdmi hardware, which also
resets the audio related registers.

Hdmi reset is replaced by hdmi disable which is called
just before setting the core and timing registers. It
also ensure that audio settings are not changed.

Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
Signed-off-by: Shirish S <s.shirish@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_hdmi.c |   40 ++++++++++++++--------------------
 1 file changed, 16 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
index fce2f7b..4c69139 100644
--- a/drivers/gpu/drm/exynos/exynos_hdmi.c
+++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
@@ -197,6 +197,7 @@ struct hdmi_context {
 	struct i2c_client		*hdmiphy_port;
 
 	/* current hdmiphy conf regs */
+	struct drm_display_mode		current_mode;
 	struct hdmi_conf_regs		mode_conf;
 
 	struct hdmi_resources		res;
@@ -1350,20 +1351,15 @@ static void hdmi_audio_control(struct hdmi_context *hdata, bool onoff)
 			HDMI_ASP_EN : HDMI_ASP_DIS, HDMI_ASP_MASK);
 }
 
-static void hdmi_conf_reset(struct hdmi_context *hdata)
+static void hdmi_start(struct hdmi_context *hdata, bool start)
 {
-	u32 reg;
+	u32 val = start ? HDMI_TG_EN : 0;
 
-	if (hdata->type == HDMI_TYPE13)
-		reg = HDMI_V13_CORE_RSTOUT;
-	else
-		reg = HDMI_CORE_RSTOUT;
+	if (hdata->current_mode.flags & DRM_MODE_FLAG_INTERLACE)
+		val |= HDMI_FIELD_EN;
 
-	/* resetting HDMI core */
-	hdmi_reg_writemask(hdata, reg,  0, HDMI_CORE_SW_RSTOUT);
-	usleep_range(10000, 12000);
-	hdmi_reg_writemask(hdata, reg, ~0, HDMI_CORE_SW_RSTOUT);
-	usleep_range(10000, 12000);
+	hdmi_reg_writemask(hdata, HDMI_CON_0, val, HDMI_EN);
+	hdmi_reg_writemask(hdata, HDMI_TG_CMD, val, HDMI_TG_EN | HDMI_FIELD_EN);
 }
 
 static void hdmi_conf_init(struct hdmi_context *hdata)
@@ -1500,12 +1496,7 @@ static void hdmi_v13_mode_apply(struct hdmi_context *hdata)
 	clk_prepare_enable(hdata->res.sclk_hdmi);
 
 	/* enable HDMI and timing generator */
-	hdmi_reg_writemask(hdata, HDMI_CON_0, ~0, HDMI_EN);
-	if (core->int_pro_mode[0])
-		hdmi_reg_writemask(hdata, HDMI_TG_CMD, ~0, HDMI_TG_EN |
-				HDMI_FIELD_EN);
-	else
-		hdmi_reg_writemask(hdata, HDMI_TG_CMD, ~0, HDMI_TG_EN);
+	hdmi_start(hdata, true);
 }
 
 static void hdmi_v14_mode_apply(struct hdmi_context *hdata)
@@ -1667,12 +1658,7 @@ static void hdmi_v14_mode_apply(struct hdmi_context *hdata)
 	clk_prepare_enable(hdata->res.sclk_hdmi);
 
 	/* enable HDMI and timing generator */
-	hdmi_reg_writemask(hdata, HDMI_CON_0, ~0, HDMI_EN);
-	if (core->int_pro_mode[0])
-		hdmi_reg_writemask(hdata, HDMI_TG_CMD, ~0, HDMI_TG_EN |
-				HDMI_FIELD_EN);
-	else
-		hdmi_reg_writemask(hdata, HDMI_TG_CMD, ~0, HDMI_TG_EN);
+	hdmi_start(hdata, true);
 }
 
 static void hdmi_mode_apply(struct hdmi_context *hdata)
@@ -1788,7 +1774,7 @@ static void hdmi_conf_apply(struct hdmi_context *hdata)
 	hdmiphy_conf_apply(hdata);
 
 	mutex_lock(&hdata->hdmi_mutex);
-	hdmi_conf_reset(hdata);
+	hdmi_start(hdata, false);
 	hdmi_conf_init(hdata);
 	mutex_unlock(&hdata->hdmi_mutex);
 
@@ -2029,6 +2015,9 @@ static void hdmi_mode_set(struct exynos_drm_display *display,
 		m->vrefresh, (m->flags & DRM_MODE_FLAG_INTERLACE) ?
 		"INTERLACED" : "PROGERESSIVE");
 
+	/* preserve mode information for later use. */
+	drm_mode_copy(&hdata->current_mode, mode);
+
 	if (hdata->type == HDMI_TYPE13)
 		hdmi_v13_mode_set(hdata, mode);
 	else
@@ -2089,6 +2078,9 @@ static void hdmi_poweroff(struct exynos_drm_display *display)
 		goto out;
 	mutex_unlock(&hdata->hdmi_mutex);
 
+	/* HDMI System Disable */
+	hdmi_reg_writemask(hdata, HDMI_CON_0, 0, HDMI_EN);
+
 	hdmiphy_poweroff(hdata);
 
 	cancel_delayed_work(&hdata->hotplug_work);
-- 
1.7.9.5
