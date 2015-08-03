From: Gustavo Padovan <gustavo@padovan.org>
Subject: [PATCH 11/11] drm/exynos: remove struct exynos_drm_encoder layer
Date: Mon,  3 Aug 2015 16:09:58 -0300
Message-ID: <1438628998-3435-12-git-send-email-gustavo@padovan.org>
References: <1438628998-3435-1-git-send-email-gustavo@padovan.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yk0-f177.google.com ([209.85.160.177]:36546 "EHLO
	mail-yk0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754917AbbHCTKd (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 3 Aug 2015 15:10:33 -0400
Received: by ykeo23 with SMTP id o23so21938654yke.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 03 Aug 2015 12:10:32 -0700 (PDT)
In-Reply-To: <1438628998-3435-1-git-send-email-gustavo@padovan.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, inki.dae@samsung.com, jy0922.shim@samsung.com, tjakobi@math.uni-bielefeld.de, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>

struct exynos_drm_encoder was justing wrapping struct drm_encoder, it had
only a drm_encoder member and the internal exynos_drm_encoders ops that
was directly mapped to the drm_encoder helper funcs.

So now exynos DRM uses struct drm_encoder directly, this removes
completely the struct exynos_drm_encoder.

Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
---
 drivers/gpu/drm/exynos/Makefile             |   7 +-
 drivers/gpu/drm/exynos/exynos7_drm_decon.c  |   2 +-
 drivers/gpu/drm/exynos/exynos_dp_core.c     |  68 ++++++++++++------
 drivers/gpu/drm/exynos/exynos_dp_core.h     |   2 +-
 drivers/gpu/drm/exynos/exynos_drm_core.c    |   1 -
 drivers/gpu/drm/exynos/exynos_drm_crtc.c    |   1 -
 drivers/gpu/drm/exynos/exynos_drm_dpi.c     |  51 ++++++++------
 drivers/gpu/drm/exynos/exynos_drm_drv.c     |   1 -
 drivers/gpu/drm/exynos/exynos_drm_drv.h     |  47 ++-----------
 drivers/gpu/drm/exynos/exynos_drm_dsi.c     |  80 +++++++++++----------
 drivers/gpu/drm/exynos/exynos_drm_encoder.c | 105 ----------------------------
 drivers/gpu/drm/exynos/exynos_drm_encoder.h |  22 ------
 drivers/gpu/drm/exynos/exynos_drm_fimd.c    |   2 +-
 drivers/gpu/drm/exynos/exynos_drm_vidi.c    |  71 ++++++++++++++-----
 drivers/gpu/drm/exynos/exynos_hdmi.c        |  85 +++++++++++++---------
 15 files changed, 236 insertions(+), 309 deletions(-)
 delete mode 100644 drivers/gpu/drm/exynos/exynos_drm_encoder.c
 delete mode 100644 drivers/gpu/drm/exynos/exynos_drm_encoder.h

diff --git a/drivers/gpu/drm/exynos/Makefile b/drivers/gpu/drm/exynos/Makefile
index 7de0b10..61c2906 100644
--- a/drivers/gpu/drm/exynos/Makefile
+++ b/drivers/gpu/drm/exynos/Makefile
@@ -3,10 +3,9 @@
 # Direct Rendering Infrastructure (DRI) in XFree86 4.1.0 and higher.
 
 ccflags-y := -Iinclude/drm -Idrivers/gpu/drm/exynos
-exynosdrm-y := exynos_drm_drv.o exynos_drm_encoder.o \
-		exynos_drm_crtc.o exynos_drm_fbdev.o exynos_drm_fb.o \
-		exynos_drm_buf.o exynos_drm_gem.o exynos_drm_core.o \
-		exynos_drm_plane.o exynos_drm_dmabuf.o
+exynosdrm-y := exynos_drm_drv.o exynos_drm_crtc.o exynos_drm_fbdev.o \
+		exynos_drm_fb.o exynos_drm_buf.o exynos_drm_gem.o \
+		exynos_drm_core.o exynos_drm_plane.o exynos_drm_dmabuf.o
 
 exynosdrm-$(CONFIG_DRM_EXYNOS_IOMMU) += exynos_drm_iommu.o
 exynosdrm-$(CONFIG_DRM_EXYNOS_FIMD)	+= exynos_drm_fimd.o
diff --git a/drivers/gpu/drm/exynos/exynos7_drm_decon.c b/drivers/gpu/drm/exynos/exynos7_drm_decon.c
index e1a2ce7..0792654 100644
--- a/drivers/gpu/drm/exynos/exynos7_drm_decon.c
+++ b/drivers/gpu/drm/exynos/exynos7_drm_decon.c
@@ -61,7 +61,7 @@ struct decon_context {
 	atomic_t			wait_vsync_event;
 
 	struct exynos_drm_panel_info panel;
-	struct exynos_drm_encoder *encoder;
+	struct drm_encoder *encoder;
 };
 
 static const struct of_device_id decon_driver_dt_match[] = {
diff --git a/drivers/gpu/drm/exynos/exynos_dp_core.c b/drivers/gpu/drm/exynos/exynos_dp_core.c
index a4a902a..19ed422 100644
--- a/drivers/gpu/drm/exynos/exynos_dp_core.c
+++ b/drivers/gpu/drm/exynos/exynos_dp_core.c
@@ -32,18 +32,18 @@
 #include <drm/drm_panel.h>
 
 #include "exynos_dp_core.h"
-#include "exynos_drm_encoder.h"
+#include "exynos_drm_crtc.h"
 
 #define ctx_from_connector(c)	container_of(c, struct exynos_dp_device, \
 					connector)
 
 static inline struct exynos_drm_crtc *dp_to_crtc(struct exynos_dp_device *dp)
 {
-	return to_exynos_crtc(dp->encoder.base.crtc);
+	return to_exynos_crtc(dp->encoder.crtc);
 }
 
 static inline struct exynos_dp_device *encoder_to_dp(
-						struct exynos_drm_encoder *e)
+						struct drm_encoder *e)
 {
 	return container_of(e, struct exynos_dp_device, encoder);
 }
@@ -889,7 +889,7 @@ static void exynos_dp_hotplug(struct work_struct *work)
 		drm_helper_hpd_irq_event(dp->drm_dev);
 }
 
-static void exynos_dp_commit(struct exynos_drm_encoder *encoder)
+static void exynos_dp_commit(struct drm_encoder *encoder)
 {
 	struct exynos_dp_device *dp = encoder_to_dp(encoder);
 	int ret;
@@ -995,7 +995,7 @@ static struct drm_encoder *exynos_dp_best_encoder(
 {
 	struct exynos_dp_device *dp = ctx_from_connector(connector);
 
-	return &dp->encoder.base;
+	return &dp->encoder;
 }
 
 static struct drm_connector_helper_funcs exynos_dp_connector_helper_funcs = {
@@ -1020,10 +1020,9 @@ static int exynos_drm_attach_lcd_bridge(struct exynos_dp_device *dp,
 	return 0;
 }
 
-static int exynos_dp_create_connector(struct exynos_drm_encoder *exynos_encoder)
+static int exynos_dp_create_connector(struct drm_encoder *encoder)
 {
-	struct exynos_dp_device *dp = encoder_to_dp(exynos_encoder);
-	struct drm_encoder *encoder = &exynos_encoder->base;
+	struct exynos_dp_device *dp = encoder_to_dp(encoder);
 	struct drm_connector *connector = &dp->connector;
 	int ret;
 
@@ -1053,7 +1052,20 @@ static int exynos_dp_create_connector(struct exynos_drm_encoder *exynos_encoder)
 	return ret;
 }
 
-static void exynos_dp_enable(struct exynos_drm_encoder *encoder)
+static bool exynos_dp_mode_fixup(struct drm_encoder *encoder,
+				 const struct drm_display_mode *mode,
+				 struct drm_display_mode *adjusted_mode)
+{
+	return true;
+}
+
+static void exynos_dp_mode_set(struct drm_encoder *encoder,
+			       struct drm_display_mode *mode,
+			       struct drm_display_mode *adjusted_mode)
+{
+}
+
+static void exynos_dp_enable(struct drm_encoder *encoder)
 {
 	struct exynos_dp_device *dp = encoder_to_dp(encoder);
 	struct exynos_drm_crtc *crtc = dp_to_crtc(dp);
@@ -1078,7 +1090,7 @@ static void exynos_dp_enable(struct exynos_drm_encoder *encoder)
 	exynos_dp_commit(&dp->encoder);
 }
 
-static void exynos_dp_disable(struct exynos_drm_encoder *encoder)
+static void exynos_dp_disable(struct drm_encoder *encoder)
 {
 	struct exynos_dp_device *dp = encoder_to_dp(encoder);
 	struct exynos_drm_crtc *crtc = dp_to_crtc(dp);
@@ -1104,11 +1116,17 @@ static void exynos_dp_disable(struct exynos_drm_encoder *encoder)
 	}
 }
 
-static struct exynos_drm_encoder_ops exynos_dp_encoder_ops = {
+static struct drm_encoder_helper_funcs exynos_dp_encoder_helper_funcs = {
+	.mode_fixup = exynos_dp_mode_fixup,
+	.mode_set = exynos_dp_mode_set,
 	.enable = exynos_dp_enable,
 	.disable = exynos_dp_disable,
 };
 
+static struct drm_encoder_funcs exynos_dp_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
+
 static struct video_info *exynos_dp_dt_parse_pdata(struct device *dev)
 {
 	struct device_node *dp_node = dev->of_node;
@@ -1185,10 +1203,10 @@ static int exynos_dp_bind(struct device *dev, struct device *master, void *data)
 	struct exynos_dp_device *dp = dev_get_drvdata(dev);
 	struct platform_device *pdev = to_platform_device(dev);
 	struct drm_device *drm_dev = data;
-	struct exynos_drm_encoder *exynos_encoder = &dp->encoder;
+	struct drm_encoder *encoder = &dp->encoder;
 	struct resource *res;
 	unsigned int irq_flags;
-	int ret = 0;
+	int pipe, ret = 0;
 
 	dp->dev = &pdev->dev;
 	dp->dpms_mode = DRM_MODE_DPMS_OFF;
@@ -1278,17 +1296,24 @@ static int exynos_dp_bind(struct device *dev, struct device *master, void *data)
 
 	dp->drm_dev = drm_dev;
 
-	ret = exynos_drm_encoder_create(drm_dev, exynos_encoder,
-					EXYNOS_DISPLAY_TYPE_LCD);
-	if (ret) {
-		DRM_ERROR("failed to create encoder\n");
-		return ret;
-	}
+	pipe = exynos_drm_crtc_get_pipe_from_type(drm_dev,
+						  EXYNOS_DISPLAY_TYPE_LCD);
+	if (pipe < 0)
+		return pipe;
+
+	encoder->possible_crtcs = 1 << pipe;
+
+	DRM_DEBUG_KMS("possible_crtcs = 0x%x\n", encoder->possible_crtcs);
+
+	drm_encoder_init(drm_dev, encoder, &exynos_dp_encoder_funcs,
+			 DRM_MODE_ENCODER_TMDS);
+
+	drm_encoder_helper_add(encoder, &exynos_dp_encoder_helper_funcs);
 
-	ret = exynos_dp_create_connector(exynos_encoder);
+	ret = exynos_dp_create_connector(encoder);
 	if (ret) {
 		DRM_ERROR("failed to create connector ret = %d\n", ret);
-		drm_encoder_cleanup(&exynos_encoder->base);
+		drm_encoder_cleanup(encoder);
 		return ret;
 	}
 
@@ -1319,7 +1344,6 @@ static int exynos_dp_probe(struct platform_device *pdev)
 	if (!dp)
 		return -ENOMEM;
 
-	dp->encoder.ops = &exynos_dp_encoder_ops;
 	platform_set_drvdata(pdev, dp);
 
 	panel_node = of_parse_phandle(dev->of_node, "panel", 0);
diff --git a/drivers/gpu/drm/exynos/exynos_dp_core.h b/drivers/gpu/drm/exynos/exynos_dp_core.h
index f8cc202..e413b6f 100644
--- a/drivers/gpu/drm/exynos/exynos_dp_core.h
+++ b/drivers/gpu/drm/exynos/exynos_dp_core.h
@@ -147,7 +147,7 @@ struct link_train {
 };
 
 struct exynos_dp_device {
-	struct exynos_drm_encoder encoder;
+	struct drm_encoder	encoder;
 	struct device		*dev;
 	struct drm_device	*drm_dev;
 	struct drm_connector	connector;
diff --git a/drivers/gpu/drm/exynos/exynos_drm_core.c b/drivers/gpu/drm/exynos/exynos_drm_core.c
index 1f38a44..c68a6a2 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_core.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_core.c
@@ -15,7 +15,6 @@
 #include <drm/drmP.h>
 #include "exynos_drm_drv.h"
 #include "exynos_drm_crtc.h"
-#include "exynos_drm_encoder.h"
 #include "exynos_drm_fbdev.h"
 
 static LIST_HEAD(exynos_drm_subdrv_list);
diff --git a/drivers/gpu/drm/exynos/exynos_drm_crtc.c b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
index 2715c2a..b9b0e9c 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_crtc.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
@@ -19,7 +19,6 @@
 
 #include "exynos_drm_crtc.h"
 #include "exynos_drm_drv.h"
-#include "exynos_drm_encoder.h"
 #include "exynos_drm_plane.h"
 
 static void exynos_drm_crtc_enable(struct drm_crtc *crtc)
diff --git a/drivers/gpu/drm/exynos/exynos_drm_dpi.c b/drivers/gpu/drm/exynos/exynos_drm_dpi.c
index 6850ce5..0476260 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dpi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dpi.c
@@ -20,11 +20,10 @@
 #include <video/of_videomode.h>
 #include <video/videomode.h>
 
-#include "exynos_drm_encoder.h"
 #include "exynos_drm_crtc.h"
 
 struct exynos_dpi {
-	struct exynos_drm_encoder encoder;
+	struct drm_encoder encoder;
 	struct device *dev;
 	struct device_node *panel_node;
 
@@ -36,7 +35,7 @@ struct exynos_dpi {
 
 #define connector_to_dpi(c) container_of(c, struct exynos_dpi, connector)
 
-static inline struct exynos_dpi *encoder_to_dpi(struct exynos_drm_encoder *e)
+static inline struct exynos_dpi *encoder_to_dpi(struct drm_encoder *e)
 {
 	return container_of(e, struct exynos_dpi, encoder);
 }
@@ -98,7 +97,7 @@ exynos_dpi_best_encoder(struct drm_connector *connector)
 {
 	struct exynos_dpi *ctx = connector_to_dpi(connector);
 
-	return &ctx->encoder.base;
+	return &ctx->encoder;
 }
 
 static struct drm_connector_helper_funcs exynos_dpi_connector_helper_funcs = {
@@ -106,11 +105,9 @@ static struct drm_connector_helper_funcs exynos_dpi_connector_helper_funcs = {
 	.best_encoder = exynos_dpi_best_encoder,
 };
 
-static int exynos_dpi_create_connector(
-				struct exynos_drm_encoder *exynos_encoder)
+static int exynos_dpi_create_connector(struct drm_encoder *encoder)
 {
-	struct exynos_dpi *ctx = encoder_to_dpi(exynos_encoder);
-	struct drm_encoder *encoder = &exynos_encoder->base;
+	struct exynos_dpi *ctx = encoder_to_dpi(encoder);
 	struct drm_connector *connector = &ctx->connector;
 	int ret;
 
@@ -131,7 +128,7 @@ static int exynos_dpi_create_connector(
 	return 0;
 }
 
-static void exynos_dpi_enable(struct exynos_drm_encoder *encoder)
+static void exynos_dpi_enable(struct drm_encoder *encoder)
 {
 	struct exynos_dpi *ctx = encoder_to_dpi(encoder);
 
@@ -141,7 +138,7 @@ static void exynos_dpi_enable(struct exynos_drm_encoder *encoder)
 	}
 }
 
-static void exynos_dpi_disable(struct exynos_drm_encoder *encoder)
+static void exynos_dpi_disable(struct drm_encoder *encoder)
 {
 	struct exynos_dpi *ctx = encoder_to_dpi(encoder);
 
@@ -151,11 +148,15 @@ static void exynos_dpi_disable(struct exynos_drm_encoder *encoder)
 	}
 }
 
-static struct exynos_drm_encoder_ops exynos_dpi_encoder_ops = {
+static struct drm_encoder_helper_funcs exynos_dpi_encoder_helper_funcs = {
 	.enable = exynos_dpi_enable,
 	.disable = exynos_dpi_disable,
 };
 
+static struct drm_encoder_funcs exynos_dpi_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
+
 /* of_* functions will be removed after merge of of_graph patches */
 static struct device_node *
 of_get_child_by_name_reg(struct device_node *parent, const char *name, u32 reg)
@@ -280,29 +281,34 @@ static int exynos_dpi_parse_dt(struct exynos_dpi *ctx)
 	return 0;
 }
 
-int exynos_dpi_bind(struct drm_device *dev,
-		    struct exynos_drm_encoder *exynos_encoder)
+int exynos_dpi_bind(struct drm_device *dev, struct drm_encoder *encoder)
 {
 	int ret;
 
-	ret = exynos_drm_encoder_create(dev, exynos_encoder,
-					EXYNOS_DISPLAY_TYPE_LCD);
-	if (ret) {
-		DRM_ERROR("failed to create encoder\n");
+	ret = exynos_drm_crtc_get_pipe_from_type(dev, EXYNOS_DISPLAY_TYPE_LCD);
+	if (ret < 0)
 		return ret;
-	}
 
-	ret = exynos_dpi_create_connector(exynos_encoder);
+	encoder->possible_crtcs = 1 << ret;
+
+	DRM_DEBUG_KMS("possible_crtcs = 0x%x\n", encoder->possible_crtcs);
+
+	drm_encoder_init(dev, encoder, &exynos_dpi_encoder_funcs,
+			 DRM_MODE_ENCODER_TMDS);
+
+	drm_encoder_helper_add(encoder, &exynos_dpi_encoder_helper_funcs);
+
+	ret = exynos_dpi_create_connector(encoder);
 	if (ret) {
 		DRM_ERROR("failed to create connector ret = %d\n", ret);
-		drm_encoder_cleanup(&exynos_encoder->base);
+		drm_encoder_cleanup(encoder);
 		return ret;
 	}
 
 	return 0;
 }
 
-struct exynos_drm_encoder *exynos_dpi_probe(struct device *dev)
+struct drm_encoder *exynos_dpi_probe(struct device *dev)
 {
 	struct exynos_dpi *ctx;
 	int ret;
@@ -311,7 +317,6 @@ struct exynos_drm_encoder *exynos_dpi_probe(struct device *dev)
 	if (!ctx)
 		return ERR_PTR(-ENOMEM);
 
-	ctx->encoder.ops = &exynos_dpi_encoder_ops;
 	ctx->dev = dev;
 
 	ret = exynos_dpi_parse_dt(ctx);
@@ -329,7 +334,7 @@ struct exynos_drm_encoder *exynos_dpi_probe(struct device *dev)
 	return &ctx->encoder;
 }
 
-int exynos_dpi_remove(struct exynos_drm_encoder *encoder)
+int exynos_dpi_remove(struct drm_encoder *encoder)
 {
 	struct exynos_dpi *ctx = encoder_to_dpi(encoder);
 
diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/gpu/drm/exynos/exynos_drm_drv.c
index 105f10e..6675e76 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
@@ -21,7 +21,6 @@
 
 #include "exynos_drm_drv.h"
 #include "exynos_drm_crtc.h"
-#include "exynos_drm_encoder.h"
 #include "exynos_drm_fbdev.h"
 #include "exynos_drm_fb.h"
 #include "exynos_drm_gem.h"
diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.h b/drivers/gpu/drm/exynos/exynos_drm_drv.h
index a4977be..6b8a30f 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.h
@@ -22,7 +22,6 @@
 #define MAX_PLANE	5
 #define MAX_FB_BUFFER	4
 
-#define to_exynos_encoder(x)	container_of(x, struct exynos_drm_encoder, base)
 #define to_exynos_crtc(x)	container_of(x, struct exynos_drm_crtc, base)
 #define to_exynos_plane(x)	container_of(x, struct exynos_drm_plane, base)
 
@@ -78,40 +77,6 @@ struct exynos_drm_plane {
 };
 
 /*
- * Exynos DRM Encoder Structure.
- *	- this structure is common to analog tv, digital tv and lcd panel.
- *
- * @mode_fixup: fix mode data comparing to hw specific display mode.
- * @mode_set: convert drm_display_mode to hw specific display mode and
- *	      would be called by encoder->mode_set().
- * @enable: display device on.
- * @disable: display device off.
- */
-struct exynos_drm_encoder;
-struct exynos_drm_encoder_ops {
-	void (*mode_fixup)(struct exynos_drm_encoder *encoder,
-				struct drm_connector *connector,
-				const struct drm_display_mode *mode,
-				struct drm_display_mode *adjusted_mode);
-	void (*mode_set)(struct exynos_drm_encoder *encoder,
-				struct drm_display_mode *mode);
-	void (*enable)(struct exynos_drm_encoder *encoder);
-	void (*disable)(struct exynos_drm_encoder *encoder);
-};
-
-/*
- * exynos specific encoder structure.
- *
- * @drm_encoder: encoder object.
- * @type: one of EXYNOS_DISPLAY_TYPE_LCD and HDMI.
- * @ops: pointer to callbacks for exynos drm specific functionality
- */
-struct exynos_drm_encoder {
-	struct drm_encoder		base;
-	struct exynos_drm_encoder_ops	*ops;
-};
-
-/*
  * Exynos drm crtc ops
  *
  * @enable: enable the device
@@ -255,18 +220,18 @@ int exynos_drm_subdrv_open(struct drm_device *dev, struct drm_file *file);
 void exynos_drm_subdrv_close(struct drm_device *dev, struct drm_file *file);
 
 #ifdef CONFIG_DRM_EXYNOS_DPI
-struct exynos_drm_encoder *exynos_dpi_probe(struct device *dev);
-int exynos_dpi_remove(struct exynos_drm_encoder *encoder);
-int exynos_dpi_bind(struct drm_device *dev, struct exynos_drm_encoder *encoder);
+struct drm_encoder *exynos_dpi_probe(struct device *dev);
+int exynos_dpi_remove(struct drm_encoder *encoder);
+int exynos_dpi_bind(struct drm_device *dev, struct drm_encoder *encoder);
 #else
-static inline struct exynos_drm_encoder *
+static inline struct drm_encoder *
 exynos_dpi_probe(struct device *dev) { return NULL; }
-static inline int exynos_dpi_remove(struct exynos_drm_encoder *encoder)
+static inline int exynos_dpi_remove(struct drm_encoder *encoder)
 {
 	return 0;
 }
 static inline int exynos_dpi_bind(struct drm_device *dev,
-				  struct exynos_drm_encoder *encoder)
+				  struct drm_encoder *encoder)
 {
 	return 0;
 }
diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index d791ad4..a87d030 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -30,7 +30,6 @@
 #include <video/videomode.h>
 
 #include "exynos_drm_crtc.h"
-#include "exynos_drm_encoder.h"
 #include "exynos_drm_drv.h"
 
 /* returns true iff both arguments logically differs */
@@ -260,7 +259,7 @@ struct exynos_dsi_driver_data {
 };
 
 struct exynos_dsi {
-	struct exynos_drm_encoder encoder;
+	struct drm_encoder encoder;
 	struct mipi_dsi_host dsi_host;
 	struct drm_connector connector;
 	struct device_node *panel_node;
@@ -296,7 +295,7 @@ struct exynos_dsi {
 #define host_to_dsi(host) container_of(host, struct exynos_dsi, dsi_host)
 #define connector_to_dsi(c) container_of(c, struct exynos_dsi, connector)
 
-static inline struct exynos_dsi *encoder_to_dsi(struct exynos_drm_encoder *e)
+static inline struct exynos_dsi *encoder_to_dsi(struct drm_encoder *e)
 {
 	return container_of(e, struct exynos_dsi, encoder);
 }
@@ -1273,7 +1272,7 @@ static irqreturn_t exynos_dsi_irq(int irq, void *dev_id)
 static irqreturn_t exynos_dsi_te_irq_handler(int irq, void *dev_id)
 {
 	struct exynos_dsi *dsi = (struct exynos_dsi *)dev_id;
-	struct drm_encoder *encoder = &dsi->encoder.base;
+	struct drm_encoder *encoder = &dsi->encoder;
 
 	if (dsi->state & DSIM_STATE_VIDOUT_AVAILABLE)
 		exynos_drm_crtc_te_handler(encoder->crtc);
@@ -1519,7 +1518,7 @@ static void exynos_dsi_poweroff(struct exynos_dsi *dsi)
 		dev_err(dsi->dev, "cannot disable regulators %d\n", ret);
 }
 
-static void exynos_dsi_enable(struct exynos_drm_encoder *encoder)
+static void exynos_dsi_enable(struct drm_encoder *encoder)
 {
 	struct exynos_dsi *dsi = encoder_to_dsi(encoder);
 	int ret;
@@ -1555,7 +1554,7 @@ static void exynos_dsi_enable(struct exynos_drm_encoder *encoder)
 	dsi->state |= DSIM_STATE_VIDOUT_AVAILABLE;
 }
 
-static void exynos_dsi_disable(struct exynos_drm_encoder *encoder)
+static void exynos_dsi_disable(struct drm_encoder *encoder)
 {
 	struct exynos_dsi *dsi = encoder_to_dsi(encoder);
 
@@ -1583,7 +1582,7 @@ exynos_dsi_detect(struct drm_connector *connector, bool force)
 		if (dsi->panel)
 			drm_panel_attach(dsi->panel, &dsi->connector);
 	} else if (!dsi->panel_node) {
-		struct exynos_drm_encoder *encoder;
+		struct drm_encoder *encoder;
 
 		encoder = platform_get_drvdata(to_platform_device(dsi->dev));
 		exynos_dsi_disable(encoder);
@@ -1629,7 +1628,7 @@ exynos_dsi_best_encoder(struct drm_connector *connector)
 {
 	struct exynos_dsi *dsi = connector_to_dsi(connector);
 
-	return &dsi->encoder.base;
+	return &dsi->encoder;
 }
 
 static struct drm_connector_helper_funcs exynos_dsi_connector_helper_funcs = {
@@ -1637,11 +1636,9 @@ static struct drm_connector_helper_funcs exynos_dsi_connector_helper_funcs = {
 	.best_encoder = exynos_dsi_best_encoder,
 };
 
-static int exynos_dsi_create_connector(
-				struct exynos_drm_encoder *exynos_encoder)
+static int exynos_dsi_create_connector(struct drm_encoder *encoder)
 {
-	struct exynos_dsi *dsi = encoder_to_dsi(exynos_encoder);
-	struct drm_encoder *encoder = &exynos_encoder->base;
+	struct exynos_dsi *dsi = encoder_to_dsi(encoder);
 	struct drm_connector *connector = &dsi->connector;
 	int ret;
 
@@ -1662,28 +1659,34 @@ static int exynos_dsi_create_connector(
 	return 0;
 }
 
-static void exynos_dsi_mode_set(struct exynos_drm_encoder *encoder,
-			 struct drm_display_mode *mode)
+static void exynos_dsi_mode_set(struct drm_encoder *encoder,
+				struct drm_display_mode *mode,
+				struct drm_display_mode *adjusted_mode)
 {
 	struct exynos_dsi *dsi = encoder_to_dsi(encoder);
 	struct videomode *vm = &dsi->vm;
-
-	vm->hactive = mode->hdisplay;
-	vm->vactive = mode->vdisplay;
-	vm->vfront_porch = mode->vsync_start - mode->vdisplay;
-	vm->vback_porch = mode->vtotal - mode->vsync_end;
-	vm->vsync_len = mode->vsync_end - mode->vsync_start;
-	vm->hfront_porch = mode->hsync_start - mode->hdisplay;
-	vm->hback_porch = mode->htotal - mode->hsync_end;
-	vm->hsync_len = mode->hsync_end - mode->hsync_start;
+	struct drm_display_mode *m = adjusted_mode;
+
+	vm->hactive = m->hdisplay;
+	vm->vactive = m->vdisplay;
+	vm->vfront_porch = m->vsync_start - m->vdisplay;
+	vm->vback_porch = m->vtotal - m->vsync_end;
+	vm->vsync_len = m->vsync_end - m->vsync_start;
+	vm->hfront_porch = m->hsync_start - m->hdisplay;
+	vm->hback_porch = m->htotal - m->hsync_end;
+	vm->hsync_len = m->hsync_end - m->hsync_start;
 }
 
-static struct exynos_drm_encoder_ops exynos_dsi_encoder_ops = {
+static struct drm_encoder_helper_funcs exynos_dsi_encoder_helper_funcs = {
 	.mode_set = exynos_dsi_mode_set,
 	.enable = exynos_dsi_enable,
 	.disable = exynos_dsi_disable,
 };
 
+static struct drm_encoder_funcs exynos_dsi_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
+
 MODULE_DEVICE_TABLE(of, exynos_dsi_of_match);
 
 /* of_* functions will be removed after merge of of_graph patches */
@@ -1804,23 +1807,30 @@ end:
 static int exynos_dsi_bind(struct device *dev, struct device *master,
 				void *data)
 {
-	struct exynos_drm_encoder *exynos_encoder = dev_get_drvdata(dev);
-	struct exynos_dsi *dsi = encoder_to_dsi(exynos_encoder);
+	struct drm_encoder *encoder = dev_get_drvdata(dev);
+	struct exynos_dsi *dsi = encoder_to_dsi(encoder);
 	struct drm_device *drm_dev = data;
 	struct drm_bridge *bridge;
 	int ret;
 
-	ret = exynos_drm_encoder_create(drm_dev, exynos_encoder,
-					EXYNOS_DISPLAY_TYPE_LCD);
-	if (ret) {
-		DRM_ERROR("failed to create encoder\n");
+	ret = exynos_drm_crtc_get_pipe_from_type(drm_dev,
+						  EXYNOS_DISPLAY_TYPE_LCD);
+	if (ret < 0)
 		return ret;
-	}
 
-	ret = exynos_dsi_create_connector(exynos_encoder);
+	encoder->possible_crtcs = 1 << ret;
+
+	DRM_DEBUG_KMS("possible_crtcs = 0x%x\n", encoder->possible_crtcs);
+
+	drm_encoder_init(drm_dev, encoder, &exynos_dsi_encoder_funcs,
+			 DRM_MODE_ENCODER_TMDS);
+
+	drm_encoder_helper_add(encoder, &exynos_dsi_encoder_helper_funcs);
+
+	ret = exynos_dsi_create_connector(encoder);
 	if (ret) {
 		DRM_ERROR("failed to create connector ret = %d\n", ret);
-		drm_encoder_cleanup(&exynos_encoder->base);
+		drm_encoder_cleanup(encoder);
 		return ret;
 	}
 
@@ -1835,7 +1845,7 @@ static int exynos_dsi_bind(struct device *dev, struct device *master,
 static void exynos_dsi_unbind(struct device *dev, struct device *master,
 				void *data)
 {
-	struct exynos_drm_encoder *encoder = dev_get_drvdata(dev);
+	struct drm_encoder *encoder = dev_get_drvdata(dev);
 	struct exynos_dsi *dsi = encoder_to_dsi(encoder);
 
 	exynos_dsi_disable(encoder);
@@ -1859,8 +1869,6 @@ static int exynos_dsi_probe(struct platform_device *pdev)
 	if (!dsi)
 		return -ENOMEM;
 
-	dsi->encoder.ops = &exynos_dsi_encoder_ops;
-
 	/* To be checked as invalid one */
 	dsi->te_gpio = -ENOENT;
 
diff --git a/drivers/gpu/drm/exynos/exynos_drm_encoder.c b/drivers/gpu/drm/exynos/exynos_drm_encoder.c
deleted file mode 100644
index d45a5c5..0000000
--- a/drivers/gpu/drm/exynos/exynos_drm_encoder.c
+++ /dev/null
@@ -1,105 +0,0 @@
-/* exynos_drm_encoder.c
- *
- * Copyright (c) 2011 Samsung Electronics Co., Ltd.
- * Authors:
- *	Inki Dae <inki.dae@samsung.com>
- *	Joonyoung Shim <jy0922.shim@samsung.com>
- *	Seung-Woo Kim <sw0312.kim@samsung.com>
- *
- * This program is free software; you can redistribute  it and/or modify it
- * under  the terms of  the GNU General  Public License as published by the
- * Free Software Foundation;  either version 2 of the  License, or (at your
- * option) any later version.
- */
-
-#include <drm/drmP.h>
-#include <drm/drm_crtc_helper.h>
-
-#include "exynos_drm_drv.h"
-#include "exynos_drm_encoder.h"
-#include "exynos_drm_crtc.h"
-
-static bool
-exynos_drm_encoder_mode_fixup(struct drm_encoder *encoder,
-			       const struct drm_display_mode *mode,
-			       struct drm_display_mode *adjusted_mode)
-{
-	struct drm_device *dev = encoder->dev;
-	struct exynos_drm_encoder *exynos_encoder = to_exynos_encoder(encoder);
-	struct drm_connector *connector;
-
-	list_for_each_entry(connector, &dev->mode_config.connector_list, head) {
-		if (connector->encoder != encoder)
-			continue;
-
-		if (exynos_encoder->ops->mode_fixup)
-			exynos_encoder->ops->mode_fixup(exynos_encoder,
-							connector, mode,
-							adjusted_mode);
-	}
-
-	return true;
-}
-
-static void exynos_drm_encoder_mode_set(struct drm_encoder *encoder,
-					 struct drm_display_mode *mode,
-					 struct drm_display_mode *adjusted_mode)
-{
-	struct exynos_drm_encoder *exynos_encoder = to_exynos_encoder(encoder);
-
-	if (exynos_encoder->ops->mode_set)
-		exynos_encoder->ops->mode_set(exynos_encoder, adjusted_mode);
-}
-
-static void exynos_drm_encoder_enable(struct drm_encoder *encoder)
-{
-	struct exynos_drm_encoder *exynos_encoder = to_exynos_encoder(encoder);
-
-	if (exynos_encoder->ops->enable)
-		exynos_encoder->ops->enable(exynos_encoder);
-}
-
-static void exynos_drm_encoder_disable(struct drm_encoder *encoder)
-{
-	struct exynos_drm_encoder *exynos_encoder = to_exynos_encoder(encoder);
-
-	if (exynos_encoder->ops->disable)
-		exynos_encoder->ops->disable(exynos_encoder);
-}
-
-static struct drm_encoder_helper_funcs exynos_encoder_helper_funcs = {
-	.mode_fixup	= exynos_drm_encoder_mode_fixup,
-	.mode_set	= exynos_drm_encoder_mode_set,
-	.enable		= exynos_drm_encoder_enable,
-	.disable	= exynos_drm_encoder_disable,
-};
-
-static struct drm_encoder_funcs exynos_encoder_funcs = {
-	.destroy = drm_encoder_cleanup,
-};
-
-int exynos_drm_encoder_create(struct drm_device *dev,
-			      struct exynos_drm_encoder *exynos_encoder,
-			      enum exynos_drm_output_type type)
-{
-	struct drm_encoder *encoder;
-	int pipe;
-
-	pipe = exynos_drm_crtc_get_pipe_from_type(dev, type);
-	if (pipe < 0)
-		return pipe;
-
-	encoder = &exynos_encoder->base;
-	encoder->possible_crtcs = 1 << pipe;
-
-	DRM_DEBUG_KMS("possible_crtcs = 0x%x\n", encoder->possible_crtcs);
-
-	drm_encoder_init(dev, encoder, &exynos_encoder_funcs,
-			DRM_MODE_ENCODER_TMDS);
-
-	drm_encoder_helper_add(encoder, &exynos_encoder_helper_funcs);
-
-	DRM_DEBUG_KMS("encoder has been created\n");
-
-	return 0;
-}
diff --git a/drivers/gpu/drm/exynos/exynos_drm_encoder.h b/drivers/gpu/drm/exynos/exynos_drm_encoder.h
deleted file mode 100644
index 6610dee..0000000
--- a/drivers/gpu/drm/exynos/exynos_drm_encoder.h
+++ /dev/null
@@ -1,22 +0,0 @@
-/*
- * Copyright (c) 2011 Samsung Electronics Co., Ltd.
- * Authors:
- *	Inki Dae <inki.dae@samsung.com>
- *	Joonyoung Shim <jy0922.shim@samsung.com>
- *	Seung-Woo Kim <sw0312.kim@samsung.com>
- *
- * This program is free software; you can redistribute  it and/or modify it
- * under  the terms of  the GNU General  Public License as published by the
- * Free Software Foundation;  either version 2 of the  License, or (at your
- * option) any later version.
- */
-
-#ifndef _EXYNOS_DRM_ENCODER_H_
-#define _EXYNOS_DRM_ENCODER_H_
-
-#include "exynos_drm_drv.h"
-
-int exynos_drm_encoder_create(struct drm_device *dev, struct exynos_drm_encoder
-			      *encoder, enum exynos_drm_output_type type);
-
-#endif
diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
index 6c0d3de..5def6bc 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
@@ -169,7 +169,7 @@ struct fimd_context {
 
 	struct exynos_drm_panel_info panel;
 	struct fimd_driver_data *driver_data;
-	struct exynos_drm_encoder *encoder;
+	struct drm_encoder *encoder;
 };
 
 static const struct of_device_id fimd_driver_dt_match[] = {
diff --git a/drivers/gpu/drm/exynos/exynos_drm_vidi.c b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
index 9b64c77..581af35 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_vidi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
@@ -25,7 +25,6 @@
 #include "exynos_drm_drv.h"
 #include "exynos_drm_crtc.h"
 #include "exynos_drm_plane.h"
-#include "exynos_drm_encoder.h"
 #include "exynos_drm_vidi.h"
 
 /* vidi has totally three virtual windows. */
@@ -35,7 +34,7 @@
 					connector)
 
 struct vidi_context {
-	struct exynos_drm_encoder	encoder;
+	struct drm_encoder		encoder;
 	struct platform_device		*pdev;
 	struct drm_device		*drm_dev;
 	struct exynos_drm_crtc		*crtc;
@@ -54,7 +53,7 @@ struct vidi_context {
 	int				pipe;
 };
 
-static inline struct vidi_context *encoder_to_vidi(struct exynos_drm_encoder *e)
+static inline struct vidi_context *encoder_to_vidi(struct drm_encoder *e)
 {
 	return container_of(e, struct vidi_context, encoder);
 }
@@ -358,7 +357,7 @@ static struct drm_encoder *vidi_best_encoder(struct drm_connector *connector)
 {
 	struct vidi_context *ctx = ctx_from_connector(connector);
 
-	return &ctx->encoder.base;
+	return &ctx->encoder;
 }
 
 static struct drm_connector_helper_funcs vidi_connector_helper_funcs = {
@@ -366,10 +365,9 @@ static struct drm_connector_helper_funcs vidi_connector_helper_funcs = {
 	.best_encoder = vidi_best_encoder,
 };
 
-static int vidi_create_connector(struct exynos_drm_encoder *exynos_encoder)
+static int vidi_create_connector(struct drm_encoder *encoder)
 {
-	struct vidi_context *ctx = encoder_to_vidi(exynos_encoder);
-	struct drm_encoder *encoder = &exynos_encoder->base;
+	struct vidi_context *ctx = encoder_to_vidi(encoder);
 	struct drm_connector *connector = &ctx->connector;
 	int ret;
 
@@ -389,15 +387,47 @@ static int vidi_create_connector(struct exynos_drm_encoder *exynos_encoder)
 	return 0;
 }
 
+static bool exynos_vidi_mode_fixup(struct drm_encoder *encoder,
+				 const struct drm_display_mode *mode,
+				 struct drm_display_mode *adjusted_mode)
+{
+	return true;
+}
+
+static void exynos_vidi_mode_set(struct drm_encoder *encoder,
+			       struct drm_display_mode *mode,
+			       struct drm_display_mode *adjusted_mode)
+{
+}
+
+static void exynos_vidi_enable(struct drm_encoder *encoder)
+{
+}
+
+static void exynos_vidi_disable(struct drm_encoder *encoder)
+{
+}
+
+static struct drm_encoder_helper_funcs exynos_vidi_encoder_helper_funcs = {
+	.mode_fixup = exynos_vidi_mode_fixup,
+	.mode_set = exynos_vidi_mode_set,
+	.enable = exynos_vidi_enable,
+	.disable = exynos_vidi_disable,
+};
+
+static struct drm_encoder_funcs exynos_vidi_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
+
 static int vidi_bind(struct device *dev, struct device *master, void *data)
 {
 	struct vidi_context *ctx = dev_get_drvdata(dev);
 	struct drm_device *drm_dev = data;
-	struct exynos_drm_encoder *exynos_encoder = &ctx->encoder;
+	struct drm_encoder *encoder = &ctx->encoder;
 	struct exynos_drm_plane *exynos_plane;
 	enum drm_plane_type type;
 	unsigned int zpos;
-	int ret;
+	int pipe, ret;
 
 	vidi_ctx_initialize(ctx, drm_dev);
 
@@ -419,17 +449,24 @@ static int vidi_bind(struct device *dev, struct device *master, void *data)
 		return PTR_ERR(ctx->crtc);
 	}
 
-	ret = exynos_drm_encoder_create(drm_dev, exynos_encoder,
-					EXYNOS_DISPLAY_TYPE_VIDI);
-	if (ret) {
-		DRM_ERROR("failed to create encoder\n");
-		return ret;
-	}
+	pipe = exynos_drm_crtc_get_pipe_from_type(drm_dev,
+						  EXYNOS_DISPLAY_TYPE_VIDI);
+	if (pipe < 0)
+		return pipe;
+
+	encoder->possible_crtcs = 1 << pipe;
+
+	DRM_DEBUG_KMS("possible_crtcs = 0x%x\n", encoder->possible_crtcs);
+
+	drm_encoder_init(drm_dev, encoder, &exynos_vidi_encoder_funcs,
+			 DRM_MODE_ENCODER_TMDS);
+
+	drm_encoder_helper_add(encoder, &exynos_vidi_encoder_helper_funcs);
 
-	ret = vidi_create_connector(exynos_encoder);
+	ret = vidi_create_connector(encoder);
 	if (ret) {
 		DRM_ERROR("failed to create connector ret = %d\n", ret);
-		drm_encoder_cleanup(&exynos_encoder->base);
+		drm_encoder_cleanup(encoder);
 		return ret;
 	}
 
diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
index f72ceeb..932f7fa 100644
--- a/drivers/gpu/drm/exynos/exynos_hdmi.c
+++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
@@ -44,7 +44,6 @@
 
 #include "exynos_drm_drv.h"
 #include "exynos_drm_crtc.h"
-#include "exynos_drm_encoder.h"
 #include "exynos_mixer.h"
 
 #include <linux/gpio.h>
@@ -88,7 +87,7 @@ struct hdmi_resources {
 };
 
 struct hdmi_context {
-	struct exynos_drm_encoder	encoder;
+	struct drm_encoder		encoder;
 	struct device			*dev;
 	struct drm_device		*drm_dev;
 	struct drm_connector		connector;
@@ -116,7 +115,7 @@ struct hdmi_context {
 	struct regmap			*pmureg;
 };
 
-static inline struct hdmi_context *encoder_to_hdmi(struct exynos_drm_encoder *e)
+static inline struct hdmi_context *encoder_to_hdmi(struct drm_encoder *e)
 {
 	return container_of(e, struct hdmi_context, encoder);
 }
@@ -1032,7 +1031,7 @@ static struct drm_encoder *hdmi_best_encoder(struct drm_connector *connector)
 {
 	struct hdmi_context *hdata = ctx_from_connector(connector);
 
-	return &hdata->encoder.base;
+	return &hdata->encoder;
 }
 
 static struct drm_connector_helper_funcs hdmi_connector_helper_funcs = {
@@ -1041,9 +1040,9 @@ static struct drm_connector_helper_funcs hdmi_connector_helper_funcs = {
 	.best_encoder = hdmi_best_encoder,
 };
 
-static int hdmi_create_connector(struct exynos_drm_encoder *exynos_encoder)
+static int hdmi_create_connector(struct drm_encoder *encoder)
 {
-	struct hdmi_context *hdata = encoder_to_hdmi(exynos_encoder);
+	struct hdmi_context *hdata = encoder_to_hdmi(encoder);
 	struct drm_connector *connector = &hdata->connector;
 	int ret;
 
@@ -1059,28 +1058,35 @@ static int hdmi_create_connector(struct exynos_drm_encoder *exynos_encoder)
 
 	drm_connector_helper_add(connector, &hdmi_connector_helper_funcs);
 	drm_connector_register(connector);
-	drm_mode_connector_attach_encoder(connector, &exynos_encoder->base);
+	drm_mode_connector_attach_encoder(connector, encoder);
 
 	return 0;
 }
 
-static void hdmi_mode_fixup(struct exynos_drm_encoder *encoder,
-				struct drm_connector *connector,
-				const struct drm_display_mode *mode,
-				struct drm_display_mode *adjusted_mode)
+static bool hdmi_mode_fixup(struct drm_encoder *encoder,
+			    const struct drm_display_mode *mode,
+			    struct drm_display_mode *adjusted_mode)
 {
+	struct drm_device *dev = encoder->dev;
+	struct drm_connector *connector;
 	struct drm_display_mode *m;
 	int mode_ok;
 
-	DRM_DEBUG_KMS("%s\n", __FILE__);
-
 	drm_mode_set_crtcinfo(adjusted_mode, 0);
 
+	list_for_each_entry(connector, &dev->mode_config.connector_list, head) {
+		if (connector->encoder == encoder)
+			break;
+	}
+
+	if (connector->encoder != encoder)
+		return true;
+
 	mode_ok = hdmi_mode_valid(connector, adjusted_mode);
 
 	/* just return if user desired mode exists. */
 	if (mode_ok == MODE_OK)
-		return;
+		return true;
 
 	/*
 	 * otherwise, find the most suitable mode among modes and change it
@@ -1100,6 +1106,8 @@ static void hdmi_mode_fixup(struct exynos_drm_encoder *encoder,
 			break;
 		}
 	}
+
+	return true;
 }
 
 static void hdmi_set_acr(u32 freq, u8 *acr)
@@ -1697,22 +1705,23 @@ static void hdmi_conf_apply(struct hdmi_context *hdata)
 	hdmi_regs_dump(hdata, "start");
 }
 
-static void hdmi_mode_set(struct exynos_drm_encoder *encoder,
-			struct drm_display_mode *mode)
+static void hdmi_mode_set(struct drm_encoder *encoder,
+			  struct drm_display_mode *mode,
+			  struct drm_display_mode *adjusted_mode)
 {
 	struct hdmi_context *hdata = encoder_to_hdmi(encoder);
-	struct drm_display_mode *m = mode;
+	struct drm_display_mode *m = adjusted_mode;
 
 	DRM_DEBUG_KMS("xres=%d, yres=%d, refresh=%d, intl=%s\n",
 		m->hdisplay, m->vdisplay,
 		m->vrefresh, (m->flags & DRM_MODE_FLAG_INTERLACE) ?
 		"INTERLACED" : "PROGRESSIVE");
 
-	drm_mode_copy(&hdata->current_mode, mode);
+	drm_mode_copy(&hdata->current_mode, m);
 	hdata->cea_video_id = drm_match_cea_mode(mode);
 }
 
-static void hdmi_enable(struct exynos_drm_encoder *encoder)
+static void hdmi_enable(struct drm_encoder *encoder)
 {
 	struct hdmi_context *hdata = encoder_to_hdmi(encoder);
 	struct hdmi_resources *res = &hdata->res;
@@ -1738,11 +1747,11 @@ static void hdmi_enable(struct exynos_drm_encoder *encoder)
 	hdmi_conf_apply(hdata);
 }
 
-static void hdmi_disable(struct exynos_drm_encoder *encoder)
+static void hdmi_disable(struct drm_encoder *encoder)
 {
 	struct hdmi_context *hdata = encoder_to_hdmi(encoder);
 	struct hdmi_resources *res = &hdata->res;
-	struct drm_crtc *crtc = hdata->encoder.base.crtc;
+	struct drm_crtc *crtc = encoder->crtc;
 	const struct drm_crtc_helper_funcs *funcs = NULL;
 
 	if (!hdata->powered)
@@ -1783,13 +1792,17 @@ static void hdmi_disable(struct exynos_drm_encoder *encoder)
 	hdata->powered = false;
 }
 
-static struct exynos_drm_encoder_ops hdmi_encoder_ops = {
+static struct drm_encoder_helper_funcs exynos_hdmi_encoder_helper_funcs = {
 	.mode_fixup	= hdmi_mode_fixup,
 	.mode_set	= hdmi_mode_set,
 	.enable		= hdmi_enable,
 	.disable	= hdmi_disable,
 };
 
+static struct drm_encoder_funcs exynos_hdmi_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
+
 static void hdmi_hotplug_work_func(struct work_struct *work)
 {
 	struct hdmi_context *hdata;
@@ -1917,22 +1930,29 @@ static int hdmi_bind(struct device *dev, struct device *master, void *data)
 {
 	struct drm_device *drm_dev = data;
 	struct hdmi_context *hdata = dev_get_drvdata(dev);
-	struct exynos_drm_encoder *exynos_encoder = &hdata->encoder;
-	int ret;
+	struct drm_encoder *encoder = &hdata->encoder;
+	int ret, pipe;
 
 	hdata->drm_dev = drm_dev;
 
-	ret = exynos_drm_encoder_create(drm_dev, exynos_encoder,
-					EXYNOS_DISPLAY_TYPE_HDMI);
-	if (ret) {
-		DRM_ERROR("failed to create encoder\n");
-		return ret;
-	}
+	pipe = exynos_drm_crtc_get_pipe_from_type(drm_dev,
+						  EXYNOS_DISPLAY_TYPE_HDMI);
+	if (pipe < 0)
+		return pipe;
+
+	encoder->possible_crtcs = 1 << pipe;
+
+	DRM_DEBUG_KMS("possible_crtcs = 0x%x\n", encoder->possible_crtcs);
+
+	drm_encoder_init(drm_dev, encoder, &exynos_hdmi_encoder_funcs,
+			 DRM_MODE_ENCODER_TMDS);
+
+	drm_encoder_helper_add(encoder, &exynos_hdmi_encoder_helper_funcs);
 
-	hdmi_create_connector(exynos_encoder);
+	ret = hdmi_create_connector(encoder);
 	if (ret) {
 		DRM_ERROR("failed to create connector ret = %d\n", ret);
-		drm_encoder_cleanup(&exynos_encoder->base);
+		drm_encoder_cleanup(encoder);
 		return ret;
 	}
 
@@ -1985,7 +2005,6 @@ static int hdmi_probe(struct platform_device *pdev)
 		return -ENODEV;
 
 	hdata->drv_data = match->data;
-	hdata->encoder.ops = &hdmi_encoder_ops;
 
 	platform_set_drvdata(pdev, hdata);
 
-- 
2.1.0
