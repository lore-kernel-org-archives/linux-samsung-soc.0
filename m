From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: [RFC 1/1] drm/exynos/hdmi: add 257px offset timing hack
Date: Fri, 25 Aug 2017 16:10:05 +0200
Message-ID: <20170825141005.662-2-tjakobi@math.uni-bielefeld.de>
References: <20170825141005.662-1-tjakobi@math.uni-bielefeld.de>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:60871 "EHLO
        smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1755659AbdHYOKR (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 25 Aug 2017 10:10:17 -0400
In-Reply-To: <20170825141005.662-1-tjakobi@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, a.hajda@samsung.com, m.szyprowski@samsung.com, inki.dae@samsung.com, Daniel Drake <drake@endlessm.com>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>

From: Daniel Drake <drake@endlessm.com>

As discussed in
http://www.spinics.net/lists/linux-samsung-soc/msg24617.html
the 1024x768 timings don't quite work out of the box, for unknown reasons.

However, massaging of the values in the way implemented in this patch
makes the system usable, although it is missing the top row of pixels,
and the rightmost column too.

Apply the timing hack to both 1280x1024 and 1024x768.

Signed-off-by: Daniel Drake <drake@endlessm.com>
Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
---
 drivers/gpu/drm/exynos/exynos_hdmi.c  | 16 ++++++++++++----
 drivers/gpu/drm/exynos/exynos_mixer.c |  6 ++++++
 2 files changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
index d5e923452121..2b14cc7def6f 100644
--- a/drivers/gpu/drm/exynos/exynos_hdmi.c
+++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
@@ -1241,6 +1241,14 @@ static void hdmi_v13_mode_apply(struct hdmi_context *hdata)
 static void hdmi_v14_mode_apply(struct hdmi_context *hdata)
 {
 	struct drm_display_mode *m = &hdata->current_mode;
+	int hcorrect = 0;
+	int vcorrect = 0;
+
+	if ((m->hdisplay == 1024 && m->vdisplay == 768) ||
+	    (m->hdisplay == 1280 && m->vdisplay == 1024)) {
+		hcorrect = 257;
+		vcorrect = 1;
+	}
 
 	hdmi_reg_writev(hdata, HDMI_H_BLANK_0, 2, m->htotal - m->hdisplay);
 	hdmi_reg_writev(hdata, HDMI_V_LINE_0, 2, m->vtotal);
@@ -1306,8 +1314,8 @@ static void hdmi_v14_mode_apply(struct hdmi_context *hdata)
 		hdmi_reg_writev(hdata, HDMI_V_SYNC_LINE_AFT_PXL_2_0, 2, 0xffff);
 		hdmi_reg_writev(hdata, HDMI_V_SYNC_LINE_AFT_PXL_1_0, 2, 0xffff);
 		hdmi_reg_writev(hdata, HDMI_TG_VACT_ST_L, 2,
-				m->vtotal - m->vdisplay);
-		hdmi_reg_writev(hdata, HDMI_TG_VACT_SZ_L, 2, m->vdisplay);
+				(m->vtotal - m->vdisplay) - vcorrect);
+		hdmi_reg_writev(hdata, HDMI_TG_VACT_SZ_L, 2, m->vdisplay + vcorrect);
 	}
 
 	hdmi_reg_writev(hdata, HDMI_H_SYNC_START_0, 2,
@@ -1334,8 +1342,8 @@ static void hdmi_v14_mode_apply(struct hdmi_context *hdata)
 	hdmi_reg_writev(hdata, HDMI_V_SYNC_LINE_AFT_PXL_6_0, 2, 0xffff);
 
 	hdmi_reg_writev(hdata, HDMI_TG_H_FSZ_L, 2, m->htotal);
-	hdmi_reg_writev(hdata, HDMI_TG_HACT_ST_L, 2, m->htotal - m->hdisplay);
-	hdmi_reg_writev(hdata, HDMI_TG_HACT_SZ_L, 2, m->hdisplay);
+	hdmi_reg_writev(hdata, HDMI_TG_HACT_ST_L, 2, (m->htotal - m->hdisplay) - hcorrect);
+	hdmi_reg_writev(hdata, HDMI_TG_HACT_SZ_L, 2, m->hdisplay + hcorrect);
 	hdmi_reg_writev(hdata, HDMI_TG_V_FSZ_L, 2, m->vtotal);
 	if (hdata->drv_data == &exynos5433_hdmi_driver_data)
 		hdmi_reg_writeb(hdata, HDMI_TG_DECON_EN, 1);
diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exynos/exynos_mixer.c
index 600b4de45c51..96c3f61f080e 100644
--- a/drivers/gpu/drm/exynos/exynos_mixer.c
+++ b/drivers/gpu/drm/exynos/exynos_mixer.c
@@ -1119,11 +1119,17 @@ static int mixer_atomic_check(struct exynos_drm_crtc *crtc,
 		mode->hdisplay, mode->vdisplay, mode->vrefresh,
 		(mode->flags & DRM_MODE_FLAG_INTERLACE) ? 1 : 0);
 
+	/* Check against resolution ranges. */
 	if ((w >= 464 && w <= 720 && h >= 261 && h <= 576) ||
 		(w >= 1024 && w <= 1280 && h >= 576 && h <= 720) ||
 		(w >= 1664 && w <= 1920 && h >= 936 && h <= 1080))
 		return 0;
 
+	/* Check against some specific resolutions. */
+	if ((w == 1024 && h == 768) ||
+		(w == 1280 && h == 1024))
+		return 0;
+
 	return -EINVAL;
 }
 
-- 
2.13.5
