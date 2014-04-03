From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [PATCH 5/7] drm/exynos: add hdmiphy power on/off sequence
Date: Thu, 03 Apr 2014 20:41:02 +0530
Message-ID: <1396537864-29291-6-git-send-email-rahul.sharma@samsung.com>
References: <1396537864-29291-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:35635 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752536AbaDCPMR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 3 Apr 2014 11:12:17 -0400
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N3G00BTWNKFZW10@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 04 Apr 2014 00:12:15 +0900 (KST)
In-reply-to: <1396537864-29291-1-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: inki.dae@samsung.com, r.sh.open@gmail.com, joshi@samsung.com, Shirish S <s.shirish@samsung.com>, Rahul Sharma <rahul.sharma@samsung.com>

From: Shirish S <s.shirish@samsung.com>

This patch implements the power on/off sequence
of HDMI PHY in exynos5420 and exynos5250 as provided
by the hardware team.

This has been verified for mulitple iterations of
S2R.

Signed-off-by: Shirish S <s.shirish@samsung.com>
Signed-off-by: Rahul Sharma <Rahul.Sharma@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_hdmi.c |   40 +++++++++++++++++++++++++++++-----
 drivers/gpu/drm/exynos/regs-hdmi.h   |    7 +++++-
 2 files changed, 40 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
index 539e603..b2cbf43 100644
--- a/drivers/gpu/drm/exynos/exynos_hdmi.c
+++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
@@ -1711,16 +1711,44 @@ static void hdmiphy_conf_reset(struct hdmi_context *hdata)
 
 static void hdmiphy_poweron(struct hdmi_context *hdata)
 {
-	if (hdata->type == HDMI_TYPE14)
-		hdmi_reg_writemask(hdata, HDMI_PHY_CON_0, 0,
-			HDMI_PHY_POWER_OFF_EN);
+	if (hdata->type != HDMI_TYPE14)
+		return;
+
+	DRM_DEBUG_KMS("\n");
+
+	/* For PHY Mode Setting */
+	hdmiphy_reg_writeb(hdata, HDMIPHY_MODE_SET_DONE,
+				HDMI_PHY_ENABLE_MODE_SET);
+	/* Phy Power On */
+	hdmiphy_reg_writeb(hdata, HDMIPHY_POWER,
+				HDMI_PHY_POWER_ON);
+	/* For PHY Mode Setting */
+	hdmiphy_reg_writeb(hdata, HDMIPHY_MODE_SET_DONE,
+				HDMI_PHY_DISABLE_MODE_SET);
+	/* PHY SW Reset */
+	hdmiphy_conf_reset(hdata);
 }
 
 static void hdmiphy_poweroff(struct hdmi_context *hdata)
 {
-	if (hdata->type == HDMI_TYPE14)
-		hdmi_reg_writemask(hdata, HDMI_PHY_CON_0, ~0,
-			HDMI_PHY_POWER_OFF_EN);
+	if (hdata->type != HDMI_TYPE14)
+		return;
+
+	DRM_DEBUG_KMS("\n");
+
+	/* PHY SW Reset */
+	hdmiphy_conf_reset(hdata);
+	/* For PHY Mode Setting */
+	hdmiphy_reg_writeb(hdata, HDMIPHY_MODE_SET_DONE,
+				HDMI_PHY_ENABLE_MODE_SET);
+
+	/* PHY Power Off */
+	hdmiphy_reg_writeb(hdata, HDMIPHY_POWER,
+				HDMI_PHY_POWER_OFF);
+
+	/* For PHY Mode Setting */
+	hdmiphy_reg_writeb(hdata, HDMIPHY_MODE_SET_DONE,
+				HDMI_PHY_DISABLE_MODE_SET);
 }
 
 static void hdmiphy_conf_apply(struct hdmi_context *hdata)
diff --git a/drivers/gpu/drm/exynos/regs-hdmi.h b/drivers/gpu/drm/exynos/regs-hdmi.h
index 344a5db..fd4c590 100644
--- a/drivers/gpu/drm/exynos/regs-hdmi.h
+++ b/drivers/gpu/drm/exynos/regs-hdmi.h
@@ -579,7 +579,12 @@
 #define HDMI_TG_3D			HDMI_TG_BASE(0x00F0)
 
 /* HDMI PHY Registers Offsets*/
-#define HDMIPHY_MODE_SET_DONE		(0x7C >> 2)
+#define HDMIPHY_POWER		(0x74 >> 2)
+#define HDMIPHY_MODE_SET_DONE		(0x7c >> 2)
+
+/* HDMI PHY Values */
+#define HDMI_PHY_POWER_ON              0x80
+#define HDMI_PHY_POWER_OFF             0xff
 
 /* HDMI PHY Values */
 #define HDMI_PHY_DISABLE_MODE_SET	0x80
-- 
1.7.9.5
