From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 2/7] drm/exynos: use helper to set possible crtcs
Date: Tue, 18 Apr 2017 14:39:58 +0200
Message-ID: <1492519203-23537-3-git-send-email-a.hajda@samsung.com>
References: <1492519203-23537-1-git-send-email-a.hajda@samsung.com>
 <CGME20170418124012eucas1p134bb81c1737d95d685dca1cf4836b24b@eucas1p1.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:42879 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753094AbdDRMkQ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 18 Apr 2017 08:40:16 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OOL00CXUV71RL90@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 18 Apr 2017 13:40:13 +0100 (BST)
In-reply-to: <1492519203-23537-1-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: Andrzej Hajda <a.hajda@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org

All encoders share the same code to set encoders possible_crtcs field.
The patch creates helper to abstract out this code.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_dp.c       | 15 +++++----------
 drivers/gpu/drm/exynos/exynos_drm_core.c |  1 +
 drivers/gpu/drm/exynos/exynos_drm_crtc.c | 21 ++++++++++++++++++---
 drivers/gpu/drm/exynos/exynos_drm_crtc.h | 10 +++++++---
 drivers/gpu/drm/exynos/exynos_drm_dpi.c  | 12 ++++--------
 drivers/gpu/drm/exynos/exynos_drm_dsi.c  | 13 ++++---------
 drivers/gpu/drm/exynos/exynos_drm_vidi.c | 15 +++++----------
 drivers/gpu/drm/exynos/exynos_hdmi.c     | 25 +++++++++----------------
 8 files changed, 53 insertions(+), 59 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_dp.c b/drivers/gpu/drm/exynos/exynos_dp.c
index 385537b..39629e7 100644
--- a/drivers/gpu/drm/exynos/exynos_dp.c
+++ b/drivers/gpu/drm/exynos/exynos_dp.c
@@ -155,7 +155,7 @@ static int exynos_dp_bind(struct device *dev, struct device *master, void *data)
 	struct exynos_dp_device *dp = dev_get_drvdata(dev);
 	struct drm_encoder *encoder = &dp->encoder;
 	struct drm_device *drm_dev = data;
-	int pipe, ret;
+	int ret;
 
 	/*
 	 * Just like the probe function said, we don't need the
@@ -179,20 +179,15 @@ static int exynos_dp_bind(struct device *dev, struct device *master, void *data)
 			return ret;
 	}
 
-	pipe = exynos_drm_crtc_get_pipe_from_type(drm_dev,
-						  EXYNOS_DISPLAY_TYPE_LCD);
-	if (pipe < 0)
-		return pipe;
-
-	encoder->possible_crtcs = 1 << pipe;
-
-	DRM_DEBUG_KMS("possible_crtcs = 0x%x\n", encoder->possible_crtcs);
-
 	drm_encoder_init(drm_dev, encoder, &exynos_dp_encoder_funcs,
 			 DRM_MODE_ENCODER_TMDS, NULL);
 
 	drm_encoder_helper_add(encoder, &exynos_dp_encoder_helper_funcs);
 
+	ret = exynos_drm_set_possible_crtcs(encoder, EXYNOS_DISPLAY_TYPE_LCD);
+	if (ret < 0)
+		return ret;
+
 	dp->plat_data.encoder = encoder;
 
 	return analogix_dp_bind(dev, dp->drm_dev, &dp->plat_data);
diff --git a/drivers/gpu/drm/exynos/exynos_drm_core.c b/drivers/gpu/drm/exynos/exynos_drm_core.c
index edbd98f..b0c0621 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_core.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_core.c
@@ -13,6 +13,7 @@
  */
 
 #include <drm/drmP.h>
+
 #include "exynos_drm_drv.h"
 #include "exynos_drm_crtc.h"
 
diff --git a/drivers/gpu/drm/exynos/exynos_drm_crtc.c b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
index d72777f..5dc1aab 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_crtc.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
@@ -16,6 +16,7 @@
 #include <drm/drm_crtc_helper.h>
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_encoder.h>
 
 #include "exynos_drm_crtc.h"
 #include "exynos_drm_drv.h"
@@ -189,16 +190,30 @@ struct exynos_drm_crtc *exynos_drm_crtc_create(struct drm_device *drm_dev,
 	return ERR_PTR(ret);
 }
 
-int exynos_drm_crtc_get_pipe_from_type(struct drm_device *drm_dev,
+struct exynos_drm_crtc *exynos_drm_crtc_get_by_type(struct drm_device *drm_dev,
 				       enum exynos_drm_output_type out_type)
 {
 	struct drm_crtc *crtc;
 
 	drm_for_each_crtc(crtc, drm_dev)
 		if (to_exynos_crtc(crtc)->type == out_type)
-			return drm_crtc_index(crtc);
+			return to_exynos_crtc(crtc);
 
-	return -EPERM;
+	return ERR_PTR(-EPERM);
+}
+
+int exynos_drm_set_possible_crtcs(struct drm_encoder *encoder,
+		enum exynos_drm_output_type out_type)
+{
+	struct exynos_drm_crtc *crtc = exynos_drm_crtc_get_by_type(encoder->dev,
+						out_type);
+
+	if (IS_ERR(crtc))
+		return PTR_ERR(crtc);
+
+	encoder->possible_crtcs = drm_crtc_mask(&crtc->base);
+
+	return 0;
 }
 
 void exynos_drm_crtc_te_handler(struct drm_crtc *crtc)
diff --git a/drivers/gpu/drm/exynos/exynos_drm_crtc.h b/drivers/gpu/drm/exynos/exynos_drm_crtc.h
index ef58b64..dec4461 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_crtc.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_crtc.h
@@ -15,21 +15,25 @@
 #ifndef _EXYNOS_DRM_CRTC_H_
 #define _EXYNOS_DRM_CRTC_H_
 
+
 #include "exynos_drm_drv.h"
 
 struct exynos_drm_crtc *exynos_drm_crtc_create(struct drm_device *drm_dev,
 					struct drm_plane *plane,
-					enum exynos_drm_output_type type,
+					enum exynos_drm_output_type out_type,
 					const struct exynos_drm_crtc_ops *ops,
 					void *context);
 void exynos_drm_crtc_wait_pending_update(struct exynos_drm_crtc *exynos_crtc);
 void exynos_drm_crtc_finish_update(struct exynos_drm_crtc *exynos_crtc,
 				   struct exynos_drm_plane *exynos_plane);
 
-/* This function gets pipe value to crtc device matched with out_type. */
-int exynos_drm_crtc_get_pipe_from_type(struct drm_device *drm_dev,
+/* This function gets crtc device matched with out_type. */
+struct exynos_drm_crtc *exynos_drm_crtc_get_by_type(struct drm_device *drm_dev,
 				       enum exynos_drm_output_type out_type);
 
+int exynos_drm_set_possible_crtcs(struct drm_encoder *encoder,
+		enum exynos_drm_output_type out_type);
+
 /*
  * This function calls the crtc device(manager)'s te_handler() callback
  * to trigger to transfer video image at the tearing effect synchronization
diff --git a/drivers/gpu/drm/exynos/exynos_drm_dpi.c b/drivers/gpu/drm/exynos/exynos_drm_dpi.c
index 63abcd2..2992491 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dpi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dpi.c
@@ -203,19 +203,15 @@ int exynos_dpi_bind(struct drm_device *dev, struct drm_encoder *encoder)
 {
 	int ret;
 
-	ret = exynos_drm_crtc_get_pipe_from_type(dev, EXYNOS_DISPLAY_TYPE_LCD);
-	if (ret < 0)
-		return ret;
-
-	encoder->possible_crtcs = 1 << ret;
-
-	DRM_DEBUG_KMS("possible_crtcs = 0x%x\n", encoder->possible_crtcs);
-
 	drm_encoder_init(dev, encoder, &exynos_dpi_encoder_funcs,
 			 DRM_MODE_ENCODER_TMDS, NULL);
 
 	drm_encoder_helper_add(encoder, &exynos_dpi_encoder_helper_funcs);
 
+	ret = exynos_drm_set_possible_crtcs(encoder, EXYNOS_DISPLAY_TYPE_LCD);
+	if (ret < 0)
+		return ret;
+
 	ret = exynos_dpi_create_connector(encoder);
 	if (ret) {
 		DRM_ERROR("failed to create connector ret = %d\n", ret);
diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index 1690b83..3ae459f 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -1678,20 +1678,15 @@ static int exynos_dsi_bind(struct device *dev, struct device *master,
 	struct drm_bridge *bridge;
 	int ret;
 
-	ret = exynos_drm_crtc_get_pipe_from_type(drm_dev,
-						  EXYNOS_DISPLAY_TYPE_LCD);
-	if (ret < 0)
-		return ret;
-
-	encoder->possible_crtcs = 1 << ret;
-
-	DRM_DEBUG_KMS("possible_crtcs = 0x%x\n", encoder->possible_crtcs);
-
 	drm_encoder_init(drm_dev, encoder, &exynos_dsi_encoder_funcs,
 			 DRM_MODE_ENCODER_TMDS, NULL);
 
 	drm_encoder_helper_add(encoder, &exynos_dsi_encoder_helper_funcs);
 
+	ret = exynos_drm_set_possible_crtcs(encoder, EXYNOS_DISPLAY_TYPE_LCD);
+	if (ret < 0)
+		return ret;
+
 	ret = exynos_dsi_create_connector(encoder);
 	if (ret) {
 		DRM_ERROR("failed to create connector ret = %d\n", ret);
diff --git a/drivers/gpu/drm/exynos/exynos_drm_vidi.c b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
index cb8a728..10eada6b 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_vidi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
@@ -382,7 +382,7 @@ static int vidi_bind(struct device *dev, struct device *master, void *data)
 	struct exynos_drm_plane *exynos_plane;
 	struct exynos_drm_plane_config plane_config = { 0 };
 	unsigned int i;
-	int pipe, ret;
+	int ret;
 
 	ctx->drm_dev = drm_dev;
 
@@ -407,20 +407,15 @@ static int vidi_bind(struct device *dev, struct device *master, void *data)
 		return PTR_ERR(ctx->crtc);
 	}
 
-	pipe = exynos_drm_crtc_get_pipe_from_type(drm_dev,
-						  EXYNOS_DISPLAY_TYPE_VIDI);
-	if (pipe < 0)
-		return pipe;
-
-	encoder->possible_crtcs = 1 << pipe;
-
-	DRM_DEBUG_KMS("possible_crtcs = 0x%x\n", encoder->possible_crtcs);
-
 	drm_encoder_init(drm_dev, encoder, &exynos_vidi_encoder_funcs,
 			 DRM_MODE_ENCODER_TMDS, NULL);
 
 	drm_encoder_helper_add(encoder, &exynos_vidi_encoder_helper_funcs);
 
+	ret = exynos_drm_set_possible_crtcs(encoder, EXYNOS_DISPLAY_TYPE_VIDI);
+	if (ret < 0)
+		return ret;
+
 	ret = vidi_create_connector(encoder);
 	if (ret) {
 		DRM_ERROR("failed to create connector ret = %d\n", ret);
diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
index f50bcb8..c3edfdd 100644
--- a/drivers/gpu/drm/exynos/exynos_hdmi.c
+++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
@@ -1699,32 +1699,25 @@ static int hdmi_bind(struct device *dev, struct device *master, void *data)
 	struct drm_device *drm_dev = data;
 	struct hdmi_context *hdata = dev_get_drvdata(dev);
 	struct drm_encoder *encoder = &hdata->encoder;
-	struct exynos_drm_crtc *exynos_crtc;
-	struct drm_crtc *crtc;
-	int ret, pipe;
+	struct exynos_drm_crtc *crtc;
+	int ret;
 
 	hdata->drm_dev = drm_dev;
 
-	pipe = exynos_drm_crtc_get_pipe_from_type(drm_dev,
-						  EXYNOS_DISPLAY_TYPE_HDMI);
-	if (pipe < 0)
-		return pipe;
-
 	hdata->phy_clk.enable = hdmiphy_clk_enable;
 
-	crtc = drm_crtc_from_index(drm_dev, pipe);
-	exynos_crtc = to_exynos_crtc(crtc);
-	exynos_crtc->pipe_clk = &hdata->phy_clk;
-
-	encoder->possible_crtcs = 1 << pipe;
-
-	DRM_DEBUG_KMS("possible_crtcs = 0x%x\n", encoder->possible_crtcs);
-
 	drm_encoder_init(drm_dev, encoder, &exynos_hdmi_encoder_funcs,
 			 DRM_MODE_ENCODER_TMDS, NULL);
 
 	drm_encoder_helper_add(encoder, &exynos_hdmi_encoder_helper_funcs);
 
+	ret = exynos_drm_set_possible_crtcs(encoder, EXYNOS_DISPLAY_TYPE_HDMI);
+	if (ret < 0)
+		return ret;
+
+	crtc = exynos_drm_crtc_get_by_type(drm_dev, EXYNOS_DISPLAY_TYPE_HDMI);
+	crtc->pipe_clk = &hdata->phy_clk;
+
 	ret = hdmi_create_connector(encoder);
 	if (ret) {
 		DRM_ERROR("failed to create connector ret = %d\n", ret);
-- 
2.7.4
