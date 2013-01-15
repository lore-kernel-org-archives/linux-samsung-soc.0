From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [PATCH v4 2/4] drm/exynos: implement display-mode-check callback in
 mixer driver
Date: Tue, 15 Jan 2013 08:11:06 -0500
Message-ID: <1358255468-14287-3-git-send-email-rahul.sharma@samsung.com>
References: <1358255468-14287-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:28249 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756516Ab3AOMvn (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 15 Jan 2013 07:51:43 -0500
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MGO005J23PRDUV0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 15 Jan 2013 21:51:42 +0900 (KST)
Received: from chrome-ubuntu.sisodomain.com ([107.108.73.106])
 by mmp1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTPA id <0MGO00A5V3M1A810@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 15 Jan 2013 21:51:41 +0900 (KST)
In-reply-to: <1358255468-14287-1-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: inki.dae@samsung.com, seanpaul@google.com, r.sh.open@gmail.com, sw0312.kim@samsung.com, joshi@samsung.com

This patch adds the implementation of check_timing callback in the mixer
driver. Based on the mixer version, correct set of restrictions will be
exposed by the mixer driver. A resolution will be acceptable only if passes
the criteria set by mixer and hdmi IPs.

Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
Signed-off-by: Sean Paul <seanpaul@chromium.org>
---
 drivers/gpu/drm/exynos/exynos_mixer.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exynos/exynos_mixer.c
index c187ea3..e569395 100644
--- a/drivers/gpu/drm/exynos/exynos_mixer.c
+++ b/drivers/gpu/drm/exynos/exynos_mixer.c
@@ -811,6 +811,29 @@ static void mixer_win_disable(void *ctx, int win)
 	mixer_ctx->win_data[win].enabled = false;
 }
 
+int mixer_check_timing(void *ctx, struct fb_videomode *timing)
+{
+	struct mixer_context *mixer_ctx = ctx;
+	u32 w, h;
+
+	w = timing->xres;
+	h = timing->yres;
+
+	DRM_DEBUG_KMS("%s : xres=%d, yres=%d, refresh=%d, intl=%d\n",
+		__func__, timing->xres, timing->yres,
+		timing->refresh, (timing->vmode &
+		FB_VMODE_INTERLACED) ? true : false);
+
+	if (mixer_ctx->mxr_ver == MXR_VER_0_0_0_16)
+		return 0;
+
+	if ((w >= 464 && w <= 720 && h >= 261 && h <= 576) ||
+		(w >= 1024 && w <= 1280 && h >= 576 && h <= 720) ||
+		(w >= 1664 && w <= 1920 && h >= 936 && h <= 1080))
+		return 0;
+
+	return -EINVAL;
+}
 static void mixer_wait_for_vblank(void *ctx)
 {
 	struct mixer_context *mixer_ctx = ctx;
@@ -948,6 +971,9 @@ static struct exynos_mixer_ops mixer_ops = {
 	.win_mode_set		= mixer_win_mode_set,
 	.win_commit		= mixer_win_commit,
 	.win_disable		= mixer_win_disable,
+
+	/* display */
+	.check_timing		= mixer_check_timing,
 };
 
 static irqreturn_t mixer_irq_handler(int irq, void *arg)
-- 
1.8.0
