From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [PATCH v4 1/4] drm/exynos: add display-mode-check operation to
 exynos_mixer_ops struct
Date: Tue, 15 Jan 2013 08:11:05 -0500
Message-ID: <1358255468-14287-2-git-send-email-rahul.sharma@samsung.com>
References: <1358255468-14287-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:52178 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754772Ab3AOMvD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 15 Jan 2013 07:51:03 -0500
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MGO002MX3OW4210@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 15 Jan 2013 21:51:01 +0900 (KST)
Received: from chrome-ubuntu.sisodomain.com ([107.108.73.106])
 by mmp1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTPA id <0MGO00A5V3M1A810@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 15 Jan 2013 21:51:01 +0900 (KST)
In-reply-to: <1358255468-14287-1-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: inki.dae@samsung.com, seanpaul@google.com, r.sh.open@gmail.com, sw0312.kim@samsung.com, joshi@samsung.com

This patch adds the display mode check operation to exynos_mixer_ops
in drm-common-hdmi. In Exynos SoCs, mixer IP can put certain restrictions
on the proposed display modes. These restriction needs to be considered
during mode negotiation, which happens immediately after edid parsing.

Both, mixer check-mode and hdmi check-timing callbacks are called one after
another and ANDed result is returned back.

Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
Reviewed-by: Sean Paul <seanpaul@chromium.org>
---
 drivers/gpu/drm/exynos/exynos_drm_hdmi.c | 12 ++++++++++++
 drivers/gpu/drm/exynos/exynos_drm_hdmi.h |  5 ++++-
 drivers/gpu/drm/exynos/exynos_hdmi.c     | 13 ++++++-------
 3 files changed, 22 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_hdmi.c b/drivers/gpu/drm/exynos/exynos_drm_hdmi.c
index 427d2de..d7db69b 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_hdmi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_hdmi.c
@@ -124,9 +124,21 @@ struct edid *drm_hdmi_get_edid(struct device *dev,
 static int drm_hdmi_check_timing(struct device *dev, void *timing)
 {
 	struct drm_hdmi_context *ctx = to_context(dev);
+	int ret = 0;
 
 	DRM_DEBUG_KMS("%s\n", __FILE__);
 
+	/*
+	* Both, mixer and hdmi should be able to handle the requested mode.
+	* If any of the two fails, return mode as BAD.
+	*/
+
+	if (mixer_ops && mixer_ops->check_timing)
+		ret = mixer_ops->check_timing(ctx->mixer_ctx->ctx, timing);
+
+	if (ret)
+		return ret;
+
 	if (hdmi_ops && hdmi_ops->check_timing)
 		return hdmi_ops->check_timing(ctx->hdmi_ctx->ctx, timing);
 
diff --git a/drivers/gpu/drm/exynos/exynos_drm_hdmi.h b/drivers/gpu/drm/exynos/exynos_drm_hdmi.h
index d80516f..b7faa36 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_hdmi.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_hdmi.h
@@ -32,7 +32,7 @@ struct exynos_hdmi_ops {
 	bool (*is_connected)(void *ctx);
 	struct edid *(*get_edid)(void *ctx,
 			struct drm_connector *connector);
-	int (*check_timing)(void *ctx, void *timing);
+	int (*check_timing)(void *ctx, struct fb_videomode *timing);
 	int (*power_on)(void *ctx, int mode);
 
 	/* manager */
@@ -58,6 +58,9 @@ struct exynos_mixer_ops {
 	void (*win_mode_set)(void *ctx, struct exynos_drm_overlay *overlay);
 	void (*win_commit)(void *ctx, int zpos);
 	void (*win_disable)(void *ctx, int zpos);
+
+	/* display */
+	int (*check_timing)(void *ctx, struct fb_videomode *timing);
 };
 
 void exynos_hdmi_drv_attach(struct exynos_drm_hdmi_context *ctx);
diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
index 24dbb7f..7332a6f 100644
--- a/drivers/gpu/drm/exynos/exynos_hdmi.c
+++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
@@ -1459,21 +1459,20 @@ static int hdmi_v14_check_timing(struct fb_videomode *check_timing)
 	return -EINVAL;
 }
 
-static int hdmi_check_timing(void *ctx, void *timing)
+static int hdmi_check_timing(void *ctx, struct fb_videomode *timing)
 {
 	struct hdmi_context *hdata = ctx;
-	struct fb_videomode *check_timing = timing;
 
 	DRM_DEBUG_KMS("[%d] %s\n", __LINE__, __func__);
 
-	DRM_DEBUG_KMS("[%d]x[%d] [%d]Hz [%x]\n", check_timing->xres,
-			check_timing->yres, check_timing->refresh,
-			check_timing->vmode);
+	DRM_DEBUG_KMS("[%d]x[%d] [%d]Hz [%x]\n", timing->xres,
+			timing->yres, timing->refresh,
+			timing->vmode);
 
 	if (hdata->type == HDMI_TYPE13)
-		return hdmi_v13_check_timing(check_timing);
+		return hdmi_v13_check_timing(timing);
 	else
-		return hdmi_v14_check_timing(check_timing);
+		return hdmi_v14_check_timing(timing);
 }
 
 static void hdmi_set_acr(u32 freq, u8 *acr)
-- 
1.8.0
