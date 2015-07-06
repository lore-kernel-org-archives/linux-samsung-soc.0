From: Gustavo Padovan <gustavo@padovan.org>
Subject: [PATCH v2 21/23] drm/exynos: remove exynos_drm_create_enc_conn()
Date: Mon,  6 Jul 2015 11:20:22 -0300
Message-ID: <1436192424-18194-22-git-send-email-gustavo@padovan.org>
References: <1436192424-18194-1-git-send-email-gustavo@padovan.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qk0-f175.google.com ([209.85.220.175]:36307 "EHLO
	mail-qk0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750765AbbGFOVj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 6 Jul 2015 10:21:39 -0400
Received: by qkei195 with SMTP id i195so117965971qke.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 06 Jul 2015 07:21:38 -0700 (PDT)
In-Reply-To: <1436192424-18194-1-git-send-email-gustavo@padovan.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, inki.dae@samsung.com, jy0922.shim@samsung.com, tjakobi@math.uni-bielefeld.de, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>

This functions was just hiding the encoder and connector creation in
a way that was less clean than if we get rid of it. For example,
exynos_encoder ops had .create_connector() defined only because we were
handing off the encoder and connector creation to
exynos_drm_create_enc_conn(). Without this function we can directly call
the create_connector function internally in the code, without the need of
any vtable access.

It also does some refactoring in the code like creating a bind function
for dpi devices.

Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
---
 drivers/gpu/drm/exynos/exynos7_drm_decon.c  |  3 +--
 drivers/gpu/drm/exynos/exynos_dp_core.c     | 20 ++++++++++++++++---
 drivers/gpu/drm/exynos/exynos_drm_core.c    | 30 -----------------------------
 drivers/gpu/drm/exynos/exynos_drm_dpi.c     | 26 +++++++++++++++++++++++--
 drivers/gpu/drm/exynos/exynos_drm_drv.h     | 13 ++++++-------
 drivers/gpu/drm/exynos/exynos_drm_dsi.c     | 20 ++++++++++++-------
 drivers/gpu/drm/exynos/exynos_drm_encoder.c | 11 +++++++----
 drivers/gpu/drm/exynos/exynos_drm_encoder.h |  4 +++-
 drivers/gpu/drm/exynos/exynos_drm_fimd.c    |  3 +--
 drivers/gpu/drm/exynos/exynos_drm_vidi.c    | 20 ++++++++++---------
 drivers/gpu/drm/exynos/exynos_hdmi.c        | 21 +++++++++++++++++---
 11 files changed, 101 insertions(+), 70 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos7_drm_decon.c b/drivers/gpu/drm/exynos/exynos7_drm_decon.c
index e9854d4..4bcc161 100644
--- a/drivers/gpu/drm/exynos/exynos7_drm_decon.c
+++ b/drivers/gpu/drm/exynos/exynos7_drm_decon.c
@@ -682,8 +682,7 @@ static int decon_bind(struct device *dev, struct device *master, void *data)
 	}
 
 	if (ctx->encoder)
-		exynos_drm_create_enc_conn(drm_dev, ctx->encoder,
-					   EXYNOS_DISPLAY_TYPE_LCD);
+		exynos_dpi_bind(drm_dev, ctx->encoder);
 
 	return 0;
 
diff --git a/drivers/gpu/drm/exynos/exynos_dp_core.c b/drivers/gpu/drm/exynos/exynos_dp_core.c
index 253f955..a4a902a 100644
--- a/drivers/gpu/drm/exynos/exynos_dp_core.c
+++ b/drivers/gpu/drm/exynos/exynos_dp_core.c
@@ -32,6 +32,7 @@
 #include <drm/drm_panel.h>
 
 #include "exynos_dp_core.h"
+#include "exynos_drm_encoder.h"
 
 #define ctx_from_connector(c)	container_of(c, struct exynos_dp_device, \
 					connector)
@@ -1104,7 +1105,6 @@ static void exynos_dp_disable(struct exynos_drm_encoder *encoder)
 }
 
 static struct exynos_drm_encoder_ops exynos_dp_encoder_ops = {
-	.create_connector = exynos_dp_create_connector,
 	.enable = exynos_dp_enable,
 	.disable = exynos_dp_disable,
 };
@@ -1185,6 +1185,7 @@ static int exynos_dp_bind(struct device *dev, struct device *master, void *data)
 	struct exynos_dp_device *dp = dev_get_drvdata(dev);
 	struct platform_device *pdev = to_platform_device(dev);
 	struct drm_device *drm_dev = data;
+	struct exynos_drm_encoder *exynos_encoder = &dp->encoder;
 	struct resource *res;
 	unsigned int irq_flags;
 	int ret = 0;
@@ -1277,8 +1278,21 @@ static int exynos_dp_bind(struct device *dev, struct device *master, void *data)
 
 	dp->drm_dev = drm_dev;
 
-	return exynos_drm_create_enc_conn(drm_dev, &dp->encoder,
-					  EXYNOS_DISPLAY_TYPE_LCD);
+	ret = exynos_drm_encoder_create(drm_dev, exynos_encoder,
+					EXYNOS_DISPLAY_TYPE_LCD);
+	if (ret) {
+		DRM_ERROR("failed to create encoder\n");
+		return ret;
+	}
+
+	ret = exynos_dp_create_connector(exynos_encoder);
+	if (ret) {
+		DRM_ERROR("failed to create connector ret = %d\n", ret);
+		drm_encoder_cleanup(&exynos_encoder->base);
+		return ret;
+	}
+
+	return 0;
 }
 
 static void exynos_dp_unbind(struct device *dev, struct device *master,
diff --git a/drivers/gpu/drm/exynos/exynos_drm_core.c b/drivers/gpu/drm/exynos/exynos_drm_core.c
index e386452..1f38a44 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_core.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_core.c
@@ -20,36 +20,6 @@
 
 static LIST_HEAD(exynos_drm_subdrv_list);
 
-int exynos_drm_create_enc_conn(struct drm_device *dev,
-			       struct exynos_drm_encoder *exynos_encoder,
-			       enum exynos_drm_output_type type)
-{
-	int ret;
-	unsigned long possible_crtcs = 0;
-
-	ret = exynos_drm_crtc_get_pipe_from_type(dev, type);
-	if (ret < 0)
-		return ret;
-
-	possible_crtcs |= 1 << ret;
-
-	/* create and initialize a encoder for this sub driver. */
-	ret = exynos_drm_encoder_create(dev, exynos_encoder, possible_crtcs);
-	if (ret) {
-		DRM_ERROR("failed to create encoder\n");
-		return ret;
-	}
-
-	ret = exynos_encoder->ops->create_connector(exynos_encoder);
-	if (ret) {
-		DRM_ERROR("failed to create connector ret = %d\n", ret);
-		drm_encoder_cleanup(&exynos_encoder->base);
-		return ret;
-	}
-
-	return 0;
-}
-
 int exynos_drm_subdrv_register(struct exynos_drm_subdrv *subdrv)
 {
 	if (!subdrv)
diff --git a/drivers/gpu/drm/exynos/exynos_drm_dpi.c b/drivers/gpu/drm/exynos/exynos_drm_dpi.c
index 60a3161..6850ce5 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dpi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dpi.c
@@ -20,7 +20,8 @@
 #include <video/of_videomode.h>
 #include <video/videomode.h>
 
-#include "exynos_drm_drv.h"
+#include "exynos_drm_encoder.h"
+#include "exynos_drm_crtc.h"
 
 struct exynos_dpi {
 	struct exynos_drm_encoder encoder;
@@ -151,7 +152,6 @@ static void exynos_dpi_disable(struct exynos_drm_encoder *encoder)
 }
 
 static struct exynos_drm_encoder_ops exynos_dpi_encoder_ops = {
-	.create_connector = exynos_dpi_create_connector,
 	.enable = exynos_dpi_enable,
 	.disable = exynos_dpi_disable,
 };
@@ -280,6 +280,28 @@ static int exynos_dpi_parse_dt(struct exynos_dpi *ctx)
 	return 0;
 }
 
+int exynos_dpi_bind(struct drm_device *dev,
+		    struct exynos_drm_encoder *exynos_encoder)
+{
+	int ret;
+
+	ret = exynos_drm_encoder_create(dev, exynos_encoder,
+					EXYNOS_DISPLAY_TYPE_LCD);
+	if (ret) {
+		DRM_ERROR("failed to create encoder\n");
+		return ret;
+	}
+
+	ret = exynos_dpi_create_connector(exynos_encoder);
+	if (ret) {
+		DRM_ERROR("failed to create connector ret = %d\n", ret);
+		drm_encoder_cleanup(&exynos_encoder->base);
+		return ret;
+	}
+
+	return 0;
+}
+
 struct exynos_drm_encoder *exynos_dpi_probe(struct device *dev)
 {
 	struct exynos_dpi *ctx;
diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.h b/drivers/gpu/drm/exynos/exynos_drm_drv.h
index b940bcca..926dd29 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.h
@@ -81,7 +81,6 @@ struct exynos_drm_plane {
  * Exynos DRM Encoder Structure.
  *	- this structure is common to analog tv, digital tv and lcd panel.
  *
- * @create_connector: initialize and register a new connector
  * @mode_fixup: fix mode data comparing to hw specific display mode.
  * @mode_set: convert drm_display_mode to hw specific display mode and
  *	      would be called by encoder->mode_set().
@@ -90,7 +89,6 @@ struct exynos_drm_plane {
  */
 struct exynos_drm_encoder;
 struct exynos_drm_encoder_ops {
-	int (*create_connector)(struct exynos_drm_encoder *encoder);
 	void (*mode_fixup)(struct exynos_drm_encoder *encoder,
 				struct drm_connector *connector,
 				const struct drm_display_mode *mode,
@@ -263,6 +261,7 @@ void exynos_drm_subdrv_close(struct drm_device *dev, struct drm_file *file);
 #ifdef CONFIG_DRM_EXYNOS_DPI
 struct exynos_drm_encoder *exynos_dpi_probe(struct device *dev);
 int exynos_dpi_remove(struct exynos_drm_encoder *encoder);
+int exynos_dpi_bind(struct drm_device *dev, struct exynos_drm_encoder *encoder);
 #else
 static inline struct exynos_drm_encoder *
 exynos_dpi_probe(struct device *dev) { return NULL; }
@@ -270,15 +269,15 @@ static inline int exynos_dpi_remove(struct exynos_drm_encoder *encoder)
 {
 	return 0;
 }
+static inline int exynos_dpi_bind(struct drm_device *dev,
+				  struct exynos_drm_encoder *encoder)
+{
+	return 0;
+}
 #endif
 
 void exynos_drm_atomic_work(struct work_struct *work);
 
-/* This function creates a encoder and a connector, and initializes them. */
-int exynos_drm_create_enc_conn(struct drm_device *dev,
-			       struct exynos_drm_encoder *encoder,
-			       enum exynos_drm_output_type type);
-
 extern struct platform_driver fimd_driver;
 extern struct platform_driver exynos5433_decon_driver;
 extern struct platform_driver decon_driver;
diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index 0f78a59..f2b8288 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -30,6 +30,7 @@
 #include <video/videomode.h>
 
 #include "exynos_drm_crtc.h"
+#include "exynos_drm_encoder.h"
 #include "exynos_drm_drv.h"
 
 /* returns true iff both arguments logically differs */
@@ -1678,7 +1679,6 @@ static void exynos_dsi_mode_set(struct exynos_drm_encoder *encoder,
 }
 
 static struct exynos_drm_encoder_ops exynos_dsi_encoder_ops = {
-	.create_connector = exynos_dsi_create_connector,
 	.mode_set = exynos_dsi_mode_set,
 	.enable = exynos_dsi_enable,
 	.disable = exynos_dsi_disable,
@@ -1804,17 +1804,23 @@ end:
 static int exynos_dsi_bind(struct device *dev, struct device *master,
 				void *data)
 {
-	struct exynos_drm_encoder *encoder = dev_get_drvdata(dev);
-	struct exynos_dsi *dsi = encoder_to_dsi(encoder);
+	struct exynos_drm_encoder *exynos_encoder = dev_get_drvdata(dev);
+	struct exynos_dsi *dsi = encoder_to_dsi(exynos_encoder);
 	struct drm_device *drm_dev = data;
 	struct drm_bridge *bridge;
 	int ret;
 
-	ret = exynos_drm_create_enc_conn(drm_dev, encoder,
-					 EXYNOS_DISPLAY_TYPE_LCD);
+	ret = exynos_drm_encoder_create(drm_dev, exynos_encoder,
+					EXYNOS_DISPLAY_TYPE_LCD);
+	if (ret) {
+		DRM_ERROR("failed to create encoder\n");
+		return ret;
+	}
+
+	ret = exynos_dsi_create_connector(exynos_encoder);
 	if (ret) {
-		DRM_ERROR("Encoder create [%d] failed with %d\n",
-			  EXYNOS_DISPLAY_TYPE_LCD, ret);
+		DRM_ERROR("failed to create connector ret = %d\n", ret);
+		drm_encoder_cleanup(&exynos_encoder->base);
 		return ret;
 	}
 
diff --git a/drivers/gpu/drm/exynos/exynos_drm_encoder.c b/drivers/gpu/drm/exynos/exynos_drm_encoder.c
index ce7b97e..4ed360b 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_encoder.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_encoder.c
@@ -17,6 +17,7 @@
 
 #include "exynos_drm_drv.h"
 #include "exynos_drm_encoder.h"
+#include "exynos_drm_crtc.h"
 
 static bool
 exynos_drm_encoder_mode_fixup(struct drm_encoder *encoder,
@@ -92,15 +93,17 @@ void exynos_drm_encoder_setup(struct drm_device *dev)
 
 int exynos_drm_encoder_create(struct drm_device *dev,
 			      struct exynos_drm_encoder *exynos_encoder,
-			      unsigned long possible_crtcs)
+			      enum exynos_drm_output_type type)
 {
 	struct drm_encoder *encoder;
+	int pipe;
 
-	if (!possible_crtcs)
-		return -EINVAL;
+	pipe = exynos_drm_crtc_get_pipe_from_type(dev, type);
+	if (pipe < 0)
+		return pipe;
 
 	encoder = &exynos_encoder->base;
-	encoder->possible_crtcs = possible_crtcs;
+	encoder->possible_crtcs = 1 << pipe;
 
 	DRM_DEBUG_KMS("possible_crtcs = 0x%x\n", encoder->possible_crtcs);
 
diff --git a/drivers/gpu/drm/exynos/exynos_drm_encoder.h b/drivers/gpu/drm/exynos/exynos_drm_encoder.h
index 005f583..e998b82 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_encoder.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_encoder.h
@@ -14,8 +14,10 @@
 #ifndef _EXYNOS_DRM_ENCODER_H_
 #define _EXYNOS_DRM_ENCODER_H_
 
+#include "exynos_drm_drv.h"
+
 void exynos_drm_encoder_setup(struct drm_device *dev);
 int exynos_drm_encoder_create(struct drm_device *dev, struct exynos_drm_encoder
-			      *encoder, unsigned long possible_crtcs);
+			      *encoder, enum exynos_drm_output_type type);
 
 #endif
diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
index 7157432..088a768 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
@@ -954,8 +954,7 @@ static int fimd_bind(struct device *dev, struct device *master, void *data)
 		return PTR_ERR(ctx->crtc);
 
 	if (ctx->encoder)
-		exynos_drm_create_enc_conn(drm_dev, ctx->encoder,
-					   EXYNOS_DISPLAY_TYPE_LCD);
+		exynos_dpi_bind(drm_dev, ctx->encoder);
 
 	ret = drm_iommu_attach_device_if_possible(ctx->crtc, drm_dev, dev);
 	if (ret)
diff --git a/drivers/gpu/drm/exynos/exynos_drm_vidi.c b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
index d7f9501..9b64c77 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_vidi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
@@ -389,15 +389,11 @@ static int vidi_create_connector(struct exynos_drm_encoder *exynos_encoder)
 	return 0;
 }
 
-
-static struct exynos_drm_encoder_ops vidi_encoder_ops = {
-	.create_connector = vidi_create_connector,
-};
-
 static int vidi_bind(struct device *dev, struct device *master, void *data)
 {
 	struct vidi_context *ctx = dev_get_drvdata(dev);
 	struct drm_device *drm_dev = data;
+	struct exynos_drm_encoder *exynos_encoder = &ctx->encoder;
 	struct exynos_drm_plane *exynos_plane;
 	enum drm_plane_type type;
 	unsigned int zpos;
@@ -423,10 +419,17 @@ static int vidi_bind(struct device *dev, struct device *master, void *data)
 		return PTR_ERR(ctx->crtc);
 	}
 
-	ret = exynos_drm_create_enc_conn(drm_dev, &ctx->encoder,
-					 EXYNOS_DISPLAY_TYPE_VIDI);
+	ret = exynos_drm_encoder_create(drm_dev, exynos_encoder,
+					EXYNOS_DISPLAY_TYPE_VIDI);
+	if (ret) {
+		DRM_ERROR("failed to create encoder\n");
+		return ret;
+	}
+
+	ret = vidi_create_connector(exynos_encoder);
 	if (ret) {
-		ctx->crtc->base.funcs->destroy(&ctx->crtc->base);
+		DRM_ERROR("failed to create connector ret = %d\n", ret);
+		drm_encoder_cleanup(&exynos_encoder->base);
 		return ret;
 	}
 
@@ -452,7 +455,6 @@ static int vidi_probe(struct platform_device *pdev)
 	if (!ctx)
 		return -ENOMEM;
 
-	ctx->encoder.ops = &vidi_encoder_ops;
 	ctx->default_win = 0;
 	ctx->pdev = pdev;
 
diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
index 1fc01fe..7d55070 100644
--- a/drivers/gpu/drm/exynos/exynos_hdmi.c
+++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
@@ -45,6 +45,7 @@
 
 #include "exynos_drm_drv.h"
 #include "exynos_drm_crtc.h"
+#include "exynos_drm_encoder.h"
 #include "exynos_mixer.h"
 
 #include <linux/gpio.h>
@@ -2102,7 +2103,6 @@ out:
 }
 
 static struct exynos_drm_encoder_ops hdmi_encoder_ops = {
-	.create_connector = hdmi_create_connector,
 	.mode_fixup	= hdmi_mode_fixup,
 	.mode_set	= hdmi_mode_set,
 	.enable		= hdmi_enable,
@@ -2264,11 +2264,26 @@ static int hdmi_bind(struct device *dev, struct device *master, void *data)
 {
 	struct drm_device *drm_dev = data;
 	struct hdmi_context *hdata = dev_get_drvdata(dev);
+	struct exynos_drm_encoder *exynos_encoder = &hdata->encoder;
+	int ret;
 
 	hdata->drm_dev = drm_dev;
 
-	return exynos_drm_create_enc_conn(drm_dev, &hdata->encoder,
-					  EXYNOS_DISPLAY_TYPE_HDMI);
+	ret = exynos_drm_encoder_create(drm_dev, exynos_encoder,
+					EXYNOS_DISPLAY_TYPE_HDMI);
+	if (ret) {
+		DRM_ERROR("failed to create encoder\n");
+		return ret;
+	}
+
+	hdmi_create_connector(exynos_encoder);
+	if (ret) {
+		DRM_ERROR("failed to create connector ret = %d\n", ret);
+		drm_encoder_cleanup(&exynos_encoder->base);
+		return ret;
+	}
+
+	return 0;
 }
 
 static void hdmi_unbind(struct device *dev, struct device *master, void *data)
-- 
2.1.0
