From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [PATCH] drm/exynos: hdmi: move mode_fixup to drm common hdmi
Date: Tue, 26 Feb 2013 07:36:28 -0500
Message-ID: <1361882188-17956-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:29743 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754751Ab3BZMQy (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 26 Feb 2013 07:16:54 -0500
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MIT00E3PU44RO60@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 26 Feb 2013 21:16:52 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: inki.dae@samsung.com, r.sh.open@gmail.com, sw0312.kim@samsung.com, joshi@samsung.com

Currently, mode_fixup code doesn't consider the limitations of mixer as it
is implemented inside the hdmi driver. Following fix, moves the mode_fixup
to common drm hdmi driver. To check the mode support, it calls both, mixer
and hdmi check_timing callbacks for a given resolution mode.

This patch is dependent on https://patchwork.kernel.org/patch/2176021/.

Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
---
 It is based on exynos-drm-next-todo branch at
git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git

drivers/gpu/drm/exynos/exynos_drm_hdmi.c | 40 ++++++++++++++++++++++++---
 drivers/gpu/drm/exynos/exynos_drm_hdmi.h |  3 --
 drivers/gpu/drm/exynos/exynos_hdmi.c     | 47 --------------------------------
 3 files changed, 36 insertions(+), 54 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_hdmi.c b/drivers/gpu/drm/exynos/exynos_drm_hdmi.c
index d7db69b..5dc956b 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_hdmi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_hdmi.c
@@ -205,13 +205,45 @@ static void drm_hdmi_mode_fixup(struct device *subdrv_dev,
 				const struct drm_display_mode *mode,
 				struct drm_display_mode *adjusted_mode)
 {
-	struct drm_hdmi_context *ctx = to_context(subdrv_dev);
+	struct drm_display_mode *m;
+	int mode_ok;
 
 	DRM_DEBUG_KMS("%s\n", __FILE__);
 
-	if (hdmi_ops && hdmi_ops->mode_fixup)
-		hdmi_ops->mode_fixup(ctx->hdmi_ctx->ctx, connector, mode,
-				     adjusted_mode);
+	drm_mode_set_crtcinfo(adjusted_mode, 0);
+
+	mode_ok = drm_hdmi_check_timing(subdrv_dev, adjusted_mode);
+
+	/* just return if user desired mode exists. */
+	if (mode_ok == 0)
+		return;
+
+	/*
+	 * otherwise, find the most suitable mode among modes and change it
+	 * to adjusted_mode.
+	 */
+	list_for_each_entry(m, &connector->modes, head) {
+		mode_ok = drm_hdmi_check_timing(subdrv_dev, m);
+
+		if (mode_ok == 0) {
+			struct drm_mode_object base;
+			struct list_head head;
+
+			DRM_INFO("desired mode doesn't exist so\n");
+			DRM_INFO("use the most suitable mode among modes.\n");
+
+			DRM_DEBUG_KMS("Adjusted Mode: [%d]x[%d] [%d]Hz\n",
+				m->hdisplay, m->vdisplay, m->vrefresh);
+
+			/* preserve display mode header while copying. */
+			head = adjusted_mode->head;
+			base = adjusted_mode->base;
+			memcpy(adjusted_mode, m, sizeof(*m));
+			adjusted_mode->head = head;
+			adjusted_mode->base = base;
+			break;
+		}
+	}
 }
 
 static void drm_hdmi_mode_set(struct device *subdrv_dev, void *mode)
diff --git a/drivers/gpu/drm/exynos/exynos_drm_hdmi.h b/drivers/gpu/drm/exynos/exynos_drm_hdmi.h
index 844addb..fd2ff9f 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_hdmi.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_hdmi.h
@@ -36,9 +36,6 @@ struct exynos_hdmi_ops {
 	int (*power_on)(void *ctx, int mode);
 
 	/* manager */
-	void (*mode_fixup)(void *ctx, struct drm_connector *connector,
-				const struct drm_display_mode *mode,
-				struct drm_display_mode *adjusted_mode);
 	void (*mode_set)(void *ctx, struct drm_display_mode *mode);
 	void (*get_max_resol)(void *ctx, unsigned int *width,
 				unsigned int *height);
diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
index d8d78a6..a5ca2cc 100644
--- a/drivers/gpu/drm/exynos/exynos_hdmi.c
+++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
@@ -1431,52 +1431,6 @@ static void hdmi_conf_apply(struct hdmi_context *hdata)
 	hdmi_regs_dump(hdata, "start");
 }
 
-static void hdmi_mode_fixup(void *ctx, struct drm_connector *connector,
-				const struct drm_display_mode *mode,
-				struct drm_display_mode *adjusted_mode)
-{
-	struct drm_display_mode *m;
-	struct hdmi_context *hdata = ctx;
-	int index;
-
-	DRM_DEBUG_KMS("[%d] %s\n", __LINE__, __func__);
-
-	drm_mode_set_crtcinfo(adjusted_mode, 0);
-
-	index = hdmi_find_phy_conf(hdata, adjusted_mode->clock * 1000);
-
-	/* just return if user desired mode exists. */
-	if (index >= 0)
-		return;
-
-	/*
-	 * otherwise, find the most suitable mode among modes and change it
-	 * to adjusted_mode.
-	 */
-	list_for_each_entry(m, &connector->modes, head) {
-		index = hdmi_find_phy_conf(hdata, m->clock * 1000);
-
-		if (index >= 0) {
-			struct drm_mode_object base;
-			struct list_head head;
-
-			DRM_INFO("desired mode doesn't exist so\n");
-			DRM_INFO("use the most suitable mode among modes.\n");
-
-			DRM_DEBUG_KMS("Adjusted Mode: [%d]x[%d] [%d]Hz\n",
-				m->hdisplay, m->vdisplay, m->vrefresh);
-
-			/* preserve display mode header while copying. */
-			head = adjusted_mode->head;
-			base = adjusted_mode->base;
-			memcpy(adjusted_mode, m, sizeof(*m));
-			adjusted_mode->head = head;
-			adjusted_mode->base = base;
-			break;
-		}
-	}
-}
-
 static void hdmi_set_reg(u8 *reg_pair, int num_bytes, u32 value)
 {
 	int i;
@@ -1810,7 +1764,6 @@ static struct exynos_hdmi_ops hdmi_ops = {
 	.check_timing	= hdmi_check_timing,
 
 	/* manager */
-	.mode_fixup	= hdmi_mode_fixup,
 	.mode_set	= hdmi_mode_set,
 	.get_max_resol	= hdmi_get_max_resol,
 	.commit		= hdmi_commit,
-- 
1.8.0
