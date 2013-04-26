From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [PATCH] drm/exynos: hdmi: move hdmiphy related code to hdmiphy driver
Date: Fri, 26 Apr 2013 18:52:38 +0530
Message-ID: <1366982558-505-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:39923 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751387Ab3DZM6w (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 26 Apr 2013 08:58:52 -0400
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MLV00EHH5E1U1I0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 26 Apr 2013 21:58:50 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: inki.dae@samsung.com, seanpaul@google.com, r.sh.open@gmail.com, sw0312.kim@samsung.com, joshi@samsung.com, Rahul Sharma <rahul.sharma@samsung.com>

Right now hdmiphy operations and configs are kept inside hdmi driver. hdmiphy
related code is tightly coupled with hdmi ip driver. Physicaly they are
different devices and should be instantiated independently.

In terms of versions/mapping/configurations Hdmi and hdmiphy are independent
of each other. It seems logical to isolate them and maintained independently.

This implementations is tested for:
1) Resolutions supported by exynos4 and 5 hdmi.
2) Runtime PM and S2R scenarions for exynos5.

This patch is dependent on the patch, posted at
http://www.mail-archive.com/dri-devel@lists.freedesktop.org/msg34861.html

v2:
1) Moved hdmi subsystem registration to drm-common-hdmi.
2) removed __func__ as DRM_DEBUG_KMS print it by default.
3) removed devname from "hdmiphy" clock as it needs to be accessed by hdmi
and hdmiphy driver.

Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
---
It is based on exynos-drm-next branch at
git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git

 arch/arm/mach-exynos/clock-exynos5.c     |    1 -
 drivers/gpu/drm/exynos/exynos_drm_drv.c  |   25 +-
 drivers/gpu/drm/exynos/exynos_drm_drv.h  |   14 +-
 drivers/gpu/drm/exynos/exynos_drm_hdmi.c |  109 +++++-
 drivers/gpu/drm/exynos/exynos_drm_hdmi.h |   20 +
 drivers/gpu/drm/exynos/exynos_hdmi.c     |  372 ++-----------------
 drivers/gpu/drm/exynos/exynos_hdmi.h     |    1 -
 drivers/gpu/drm/exynos/exynos_hdmiphy.c  |  585 +++++++++++++++++++++++++++++-
 drivers/gpu/drm/exynos/regs-hdmiphy.h    |   61 ++++
 9 files changed, 783 insertions(+), 405 deletions(-)
 create mode 100644 drivers/gpu/drm/exynos/regs-hdmiphy.h

diff --git a/arch/arm/mach-exynos/clock-exynos5.c b/arch/arm/mach-exynos/clock-exynos5.c
index b0ea31f..4f39027 100644
--- a/arch/arm/mach-exynos/clock-exynos5.c
+++ b/arch/arm/mach-exynos/clock-exynos5.c
@@ -690,7 +690,6 @@ static struct clk exynos5_init_clocks_off[] = {
 		.ctrlbit	= (1 << 6),
 	}, {
 		.name		= "hdmiphy",
-		.devname	= "exynos5-hdmi",
 		.enable		= exynos5_clk_hdmiphy_ctrl,
 		.ctrlbit	= (1 << 0),
 	}, {
diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/gpu/drm/exynos/exynos_drm_drv.c
index 3da5c2d..2ec8ab1 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
@@ -331,19 +331,9 @@ static int __init exynos_drm_init(void)
 #endif
 
 #ifdef CONFIG_DRM_EXYNOS_HDMI
-	ret = platform_driver_register(&hdmi_driver);
+	ret = exynos_common_hdmi_register();
 	if (ret < 0)
 		goto out_hdmi;
-	ret = platform_driver_register(&mixer_driver);
-	if (ret < 0)
-		goto out_mixer;
-	ret = platform_driver_register(&exynos_drm_common_hdmi_driver);
-	if (ret < 0)
-		goto out_common_hdmi;
-
-	ret = exynos_platform_device_hdmi_register();
-	if (ret < 0)
-		goto out_common_hdmi_dev;
 #endif
 
 #ifdef CONFIG_DRM_EXYNOS_VIDI
@@ -430,13 +420,7 @@ out_vidi:
 #endif
 
 #ifdef CONFIG_DRM_EXYNOS_HDMI
-	exynos_platform_device_hdmi_unregister();
-out_common_hdmi_dev:
-	platform_driver_unregister(&exynos_drm_common_hdmi_driver);
-out_common_hdmi:
-	platform_driver_unregister(&mixer_driver);
-out_mixer:
-	platform_driver_unregister(&hdmi_driver);
+	exynos_common_hdmi_unregister();
 out_hdmi:
 #endif
 
@@ -476,10 +460,7 @@ static void __exit exynos_drm_exit(void)
 #endif
 
 #ifdef CONFIG_DRM_EXYNOS_HDMI
-	exynos_platform_device_hdmi_unregister();
-	platform_driver_unregister(&exynos_drm_common_hdmi_driver);
-	platform_driver_unregister(&mixer_driver);
-	platform_driver_unregister(&hdmi_driver);
+	exynos_common_hdmi_unregister();
 #endif
 
 #ifdef CONFIG_DRM_EXYNOS_VIDI
diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.h b/drivers/gpu/drm/exynos/exynos_drm_drv.h
index 4606fac..7e6d070 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.h
@@ -319,20 +319,18 @@ int exynos_drm_subdrv_open(struct drm_device *dev, struct drm_file *file);
 void exynos_drm_subdrv_close(struct drm_device *dev, struct drm_file *file);
 
 /*
- * this function registers exynos drm hdmi platform device. It ensures only one
- * instance of the device is created.
+ * this function registers exynos drm hdmi platform driver and singleton
+ * device. It also registers subdrivers like mixer, hdmi and hdmiphy.
  */
-extern int exynos_platform_device_hdmi_register(void);
+extern int exynos_common_hdmi_register(void);
 
 /*
- * this function unregisters exynos drm hdmi platform device if it exists.
+ * this function unregisters exynos drm hdmi platform driver and device,
+ * subdrivers for mixer, hdmi and hdmiphy.
  */
-void exynos_platform_device_hdmi_unregister(void);
+void exynos_common_hdmi_unregister(void);
 
 extern struct platform_driver fimd_driver;
-extern struct platform_driver hdmi_driver;
-extern struct platform_driver mixer_driver;
-extern struct platform_driver exynos_drm_common_hdmi_driver;
 extern struct platform_driver vidi_driver;
 extern struct platform_driver g2d_driver;
 extern struct platform_driver fimc_driver;
diff --git a/drivers/gpu/drm/exynos/exynos_drm_hdmi.c b/drivers/gpu/drm/exynos/exynos_drm_hdmi.c
index 5285509..fe66029 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_hdmi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_hdmi.c
@@ -32,40 +32,88 @@
 /* platform device pointer for common drm hdmi device. */
 static struct platform_device *exynos_drm_hdmi_pdev;
 
-/* Common hdmi subdrv needs to access the hdmi and mixer though context.
-* These should be initialied by the repective drivers */
+/* Common hdmi subdrv needs to access the hdmi, hdmiphy and mixer though
+*  context. These should be initialied by the repective drivers */
+static struct exynos_drm_hdmi_context *hdmiphy_ctx;
 static struct exynos_drm_hdmi_context *hdmi_ctx;
 static struct exynos_drm_hdmi_context *mixer_ctx;
 
 /* these callback points shoud be set by specific drivers. */
+static struct exynos_hdmiphy_ops *hdmiphy_ops;
 static struct exynos_hdmi_ops *hdmi_ops;
 static struct exynos_mixer_ops *mixer_ops;
 
+struct platform_driver exynos_drm_common_hdmi_driver;
+
 struct drm_hdmi_context {
 	struct exynos_drm_subdrv	subdrv;
+	struct exynos_drm_hdmi_context	*hdmiphy_ctx;
 	struct exynos_drm_hdmi_context	*hdmi_ctx;
 	struct exynos_drm_hdmi_context	*mixer_ctx;
 
 	bool	enabled[MIXER_WIN_NR];
 };
 
-int exynos_platform_device_hdmi_register(void)
+int exynos_common_hdmi_register(void)
 {
+	int ret;
+
 	if (exynos_drm_hdmi_pdev)
 		return -EEXIST;
 
+	ret = exynos_hdmiphy_driver_register();
+	if (ret < 0)
+		goto out_hdmiphy;
+
+	ret = platform_driver_register(&hdmi_driver);
+	if (ret < 0)
+		goto out_hdmi;
+
+	ret = platform_driver_register(&mixer_driver);
+	if (ret < 0)
+		goto out_mixer;
+
+	ret = platform_driver_register(&exynos_drm_common_hdmi_driver);
+	if (ret < 0)
+		goto out_common_hdmi;
+
 	exynos_drm_hdmi_pdev = platform_device_register_simple(
 			"exynos-drm-hdmi", -1, NULL, 0);
-	if (IS_ERR_OR_NULL(exynos_drm_hdmi_pdev))
-		return PTR_ERR(exynos_drm_hdmi_pdev);
+	if (IS_ERR_OR_NULL(exynos_drm_hdmi_pdev)) {
+		ret = PTR_ERR(exynos_drm_hdmi_pdev);
+		goto out_common_hdmi_dev;
+	}
 
 	return 0;
+
+out_common_hdmi_dev:
+	platform_driver_unregister(&exynos_drm_common_hdmi_driver);
+out_common_hdmi:
+	platform_driver_unregister(&mixer_driver);
+out_mixer:
+	platform_driver_unregister(&hdmi_driver);
+out_hdmi:
+	exynos_hdmiphy_driver_unregister();
+out_hdmiphy:
+	return ret;
 }
 
-void exynos_platform_device_hdmi_unregister(void)
+void exynos_common_hdmi_unregister(void)
 {
-	if (exynos_drm_hdmi_pdev)
-		platform_device_unregister(exynos_drm_hdmi_pdev);
+	if (!exynos_drm_hdmi_pdev)
+		return;
+
+	platform_device_unregister(exynos_drm_hdmi_pdev);
+	platform_driver_unregister(&exynos_drm_common_hdmi_driver);
+	platform_driver_unregister(&mixer_driver);
+	platform_driver_unregister(&hdmi_driver);
+	exynos_hdmiphy_driver_unregister();
+}
+
+void exynos_hdmiphy_drv_attach(struct exynos_drm_hdmi_context *ctx)
+{
+	if (ctx)
+		hdmiphy_ctx = ctx;
 }
 
 void exynos_hdmi_drv_attach(struct exynos_drm_hdmi_context *ctx)
@@ -80,6 +128,14 @@ void exynos_mixer_drv_attach(struct exynos_drm_hdmi_context *ctx)
 		mixer_ctx = ctx;
 }
 
+void exynos_hdmiphy_ops_register(struct exynos_hdmiphy_ops *ops)
+{
+	DRM_DEBUG_KMS("%s\n", __FILE__);
+
+	if (ops)
+		hdmiphy_ops = ops;
+}
+
 void exynos_hdmi_ops_register(struct exynos_hdmi_ops *ops)
 {
 	DRM_DEBUG_KMS("%s\n", __FILE__);
@@ -121,7 +177,7 @@ static struct edid *drm_hdmi_get_edid(struct device *dev,
 	return NULL;
 }
 
-static int drm_hdmi_check_timing(struct device *dev, void *timing)
+static int drm_hdmi_check_timing(struct device *dev, void *mode)
 {
 	struct drm_hdmi_context *ctx = to_context(dev);
 	int ret = 0;
@@ -129,18 +185,24 @@ static int drm_hdmi_check_timing(struct device *dev, void *timing)
 	DRM_DEBUG_KMS("%s\n", __FILE__);
 
 	/*
-	* Both, mixer and hdmi should be able to handle the requested mode.
-	* If any of the two fails, return mode as BAD.
+	* Mixer, hdmi and hdmiphy should be able to handle the requested mode.
+	* If any of the them fails, return mode as BAD.
 	*/
 
 	if (mixer_ops && mixer_ops->check_timing)
-		ret = mixer_ops->check_timing(ctx->mixer_ctx->ctx, timing);
+		ret = mixer_ops->check_timing(ctx->mixer_ctx->ctx, mode);
 
 	if (ret)
 		return ret;
 
 	if (hdmi_ops && hdmi_ops->check_timing)
-		return hdmi_ops->check_timing(ctx->hdmi_ctx->ctx, timing);
+		ret = hdmi_ops->check_timing(ctx->hdmi_ctx->ctx, mode);
+
+	if (ret)
+		return ret;
+
+	if (hdmiphy_ops && hdmiphy_ops->check_timing)
+		return hdmiphy_ops->check_timing(ctx->hdmiphy_ctx->ctx, mode);
 
 	return 0;
 }
@@ -254,6 +316,9 @@ static void drm_hdmi_mode_set(struct device *subdrv_dev, void *mode)
 
 	if (hdmi_ops && hdmi_ops->mode_set)
 		hdmi_ops->mode_set(ctx->hdmi_ctx->ctx, mode);
+
+	if (hdmiphy_ops && hdmiphy_ops->mode_set)
+		hdmiphy_ops->mode_set(ctx->hdmiphy_ctx->ctx, mode);
 }
 
 static void drm_hdmi_get_max_resol(struct device *subdrv_dev,
@@ -273,6 +338,15 @@ static void drm_hdmi_commit(struct device *subdrv_dev)
 
 	DRM_DEBUG_KMS("%s\n", __FILE__);
 
+	if (hdmiphy_ops && hdmiphy_ops->prepare)
+		hdmiphy_ops->prepare(ctx->hdmiphy_ctx->ctx);
+
+	if (hdmi_ops && hdmi_ops->prepare)
+		hdmi_ops->prepare(ctx->hdmi_ctx->ctx);
+
+	if (hdmiphy_ops && hdmiphy_ops->config_apply)
+		hdmiphy_ops->config_apply(ctx->hdmiphy_ctx->ctx);
+
 	if (hdmi_ops && hdmi_ops->commit)
 		hdmi_ops->commit(ctx->hdmi_ctx->ctx);
 }
@@ -288,6 +362,9 @@ static void drm_hdmi_dpms(struct device *subdrv_dev, int mode)
 
 	if (hdmi_ops && hdmi_ops->dpms)
 		hdmi_ops->dpms(ctx->hdmi_ctx->ctx, mode);
+
+	if (hdmiphy_ops && hdmiphy_ops->dpms)
+		hdmiphy_ops->dpms(ctx->hdmiphy_ctx->ctx, mode);
 }
 
 static void drm_hdmi_apply(struct device *subdrv_dev)
@@ -393,6 +470,11 @@ static int hdmi_subdrv_probe(struct drm_device *drm_dev,
 		return -EFAULT;
 	}
 
+	if (!hdmiphy_ctx) {
+		DRM_ERROR("hdmiphy context not initialized.\n");
+		return -EFAULT;
+	}
+
 	if (!mixer_ctx) {
 		DRM_ERROR("mixer context not initialized.\n");
 		return -EFAULT;
@@ -406,6 +488,7 @@ static int hdmi_subdrv_probe(struct drm_device *drm_dev,
 	}
 
 	ctx->hdmi_ctx = hdmi_ctx;
+	ctx->hdmiphy_ctx = hdmiphy_ctx;
 	ctx->mixer_ctx = mixer_ctx;
 
 	ctx->hdmi_ctx->drm_dev = drm_dev;
diff --git a/drivers/gpu/drm/exynos/exynos_drm_hdmi.h b/drivers/gpu/drm/exynos/exynos_drm_hdmi.h
index fd2ff9f..249db11 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_hdmi.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_hdmi.h
@@ -39,10 +39,19 @@ struct exynos_hdmi_ops {
 	void (*mode_set)(void *ctx, struct drm_display_mode *mode);
 	void (*get_max_resol)(void *ctx, unsigned int *width,
 				unsigned int *height);
+	void (*prepare)(void *ctx);
 	void (*commit)(void *ctx);
 	void (*dpms)(void *ctx, int mode);
 };
 
+struct exynos_hdmiphy_ops {
+	int (*check_timing)(void *ctx, struct drm_display_mode *mode);
+	void (*mode_set)(void *ctx, struct drm_display_mode *mode);
+	void (*prepare)(void *ctx);
+	int (*config_apply)(void *ctx);
+	void (*dpms)(void *ctx, int mode);
+};
+
 struct exynos_mixer_ops {
 	/* manager */
 	int (*iommu_on)(void *ctx, bool enable);
@@ -60,8 +69,19 @@ struct exynos_mixer_ops {
 	int (*check_timing)(void *ctx, struct drm_display_mode *mode);
 };
 
+extern struct platform_driver hdmi_driver;
+extern struct platform_driver mixer_driver;
+
+/*
+ * these functions registers/unregisters exynos drm hdmiphy driver.
+ */
+extern int exynos_hdmiphy_driver_register(void);
+extern void exynos_hdmiphy_driver_unregister(void);
+
+void exynos_hdmiphy_drv_attach(struct exynos_drm_hdmi_context *ctx);
 void exynos_hdmi_drv_attach(struct exynos_drm_hdmi_context *ctx);
 void exynos_mixer_drv_attach(struct exynos_drm_hdmi_context *ctx);
+void exynos_hdmiphy_ops_register(struct exynos_hdmiphy_ops *ops);
 void exynos_hdmi_ops_register(struct exynos_hdmi_ops *ops);
 void exynos_mixer_ops_register(struct exynos_mixer_ops *ops);
 #endif
diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
index 81382ce..b5cb1fc 100644
--- a/drivers/gpu/drm/exynos/exynos_hdmi.c
+++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
@@ -171,7 +171,6 @@ struct hdmi_v14_conf {
 };
 
 struct hdmi_conf_regs {
-	int pixel_clock;
 	int cea_video_id;
 	union {
 		struct hdmi_v13_conf v13_conf;
@@ -192,7 +191,6 @@ struct hdmi_context {
 	int				irq;
 
 	struct i2c_client		*ddc_port;
-	struct i2c_client		*hdmiphy_port;
 
 	/* current hdmiphy conf regs */
 	struct hdmi_conf_regs		mode_conf;
@@ -204,180 +202,6 @@ struct hdmi_context {
 	enum hdmi_type			type;
 };
 
-struct hdmiphy_config {
-	int pixel_clock;
-	u8 conf[32];
-};
-
-/* list of phy config settings */
-static const struct hdmiphy_config hdmiphy_v13_configs[] = {
-	{
-		.pixel_clock = 27000000,
-		.conf = {
-			0x01, 0x05, 0x00, 0xD8, 0x10, 0x1C, 0x30, 0x40,
-			0x6B, 0x10, 0x02, 0x51, 0xDF, 0xF2, 0x54, 0x87,
-			0x84, 0x00, 0x30, 0x38, 0x00, 0x08, 0x10, 0xE0,
-			0x22, 0x40, 0xE3, 0x26, 0x00, 0x00, 0x00, 0x00,
-		},
-	},
-	{
-		.pixel_clock = 27027000,
-		.conf = {
-			0x01, 0x05, 0x00, 0xD4, 0x10, 0x9C, 0x09, 0x64,
-			0x6B, 0x10, 0x02, 0x51, 0xDF, 0xF2, 0x54, 0x87,
-			0x84, 0x00, 0x30, 0x38, 0x00, 0x08, 0x10, 0xE0,
-			0x22, 0x40, 0xE3, 0x26, 0x00, 0x00, 0x00, 0x00,
-		},
-	},
-	{
-		.pixel_clock = 74176000,
-		.conf = {
-			0x01, 0x05, 0x00, 0xD8, 0x10, 0x9C, 0xef, 0x5B,
-			0x6D, 0x10, 0x01, 0x51, 0xef, 0xF3, 0x54, 0xb9,
-			0x84, 0x00, 0x30, 0x38, 0x00, 0x08, 0x10, 0xE0,
-			0x22, 0x40, 0xa5, 0x26, 0x01, 0x00, 0x00, 0x00,
-		},
-	},
-	{
-		.pixel_clock = 74250000,
-		.conf = {
-			0x01, 0x05, 0x00, 0xd8, 0x10, 0x9c, 0xf8, 0x40,
-			0x6a, 0x10, 0x01, 0x51, 0xff, 0xf1, 0x54, 0xba,
-			0x84, 0x00, 0x10, 0x38, 0x00, 0x08, 0x10, 0xe0,
-			0x22, 0x40, 0xa4, 0x26, 0x01, 0x00, 0x00, 0x00,
-		},
-	},
-	{
-		.pixel_clock = 148500000,
-		.conf = {
-			0x01, 0x05, 0x00, 0xD8, 0x10, 0x9C, 0xf8, 0x40,
-			0x6A, 0x18, 0x00, 0x51, 0xff, 0xF1, 0x54, 0xba,
-			0x84, 0x00, 0x10, 0x38, 0x00, 0x08, 0x10, 0xE0,
-			0x22, 0x40, 0xa4, 0x26, 0x02, 0x00, 0x00, 0x00,
-		},
-	},
-};
-
-static const struct hdmiphy_config hdmiphy_v14_configs[] = {
-	{
-		.pixel_clock = 25200000,
-		.conf = {
-			0x01, 0x51, 0x2A, 0x75, 0x40, 0x01, 0x00, 0x08,
-			0x82, 0x80, 0xfc, 0xd8, 0x45, 0xa0, 0xac, 0x80,
-			0x08, 0x80, 0x11, 0x04, 0x02, 0x22, 0x44, 0x86,
-			0x54, 0xf4, 0x24, 0x00, 0x00, 0x00, 0x01, 0x80,
-		},
-	},
-	{
-		.pixel_clock = 27000000,
-		.conf = {
-			0x01, 0xd1, 0x22, 0x51, 0x40, 0x08, 0xfc, 0x20,
-			0x98, 0xa0, 0xcb, 0xd8, 0x45, 0xa0, 0xac, 0x80,
-			0x06, 0x80, 0x11, 0x04, 0x02, 0x22, 0x44, 0x86,
-			0x54, 0xe4, 0x24, 0x00, 0x00, 0x00, 0x01, 0x80,
-		},
-	},
-	{
-		.pixel_clock = 27027000,
-		.conf = {
-			0x01, 0xd1, 0x2d, 0x72, 0x40, 0x64, 0x12, 0x08,
-			0x43, 0xa0, 0x0e, 0xd9, 0x45, 0xa0, 0xac, 0x80,
-			0x08, 0x80, 0x11, 0x04, 0x02, 0x22, 0x44, 0x86,
-			0x54, 0xe3, 0x24, 0x00, 0x00, 0x00, 0x01, 0x00,
-		},
-	},
-	{
-		.pixel_clock = 36000000,
-		.conf = {
-			0x01, 0x51, 0x2d, 0x55, 0x40, 0x01, 0x00, 0x08,
-			0x82, 0x80, 0x0e, 0xd9, 0x45, 0xa0, 0xac, 0x80,
-			0x08, 0x80, 0x11, 0x04, 0x02, 0x22, 0x44, 0x86,
-			0x54, 0xab, 0x24, 0x00, 0x00, 0x00, 0x01, 0x80,
-		},
-	},
-	{
-		.pixel_clock = 40000000,
-		.conf = {
-			0x01, 0x51, 0x32, 0x55, 0x40, 0x01, 0x00, 0x08,
-			0x82, 0x80, 0x2c, 0xd9, 0x45, 0xa0, 0xac, 0x80,
-			0x08, 0x80, 0x11, 0x04, 0x02, 0x22, 0x44, 0x86,
-			0x54, 0x9a, 0x24, 0x00, 0x00, 0x00, 0x01, 0x80,
-		},
-	},
-	{
-		.pixel_clock = 65000000,
-		.conf = {
-			0x01, 0xd1, 0x36, 0x34, 0x40, 0x1e, 0x0a, 0x08,
-			0x82, 0xa0, 0x45, 0xd9, 0x45, 0xa0, 0xac, 0x80,
-			0x08, 0x80, 0x11, 0x04, 0x02, 0x22, 0x44, 0x86,
-			0x54, 0xbd, 0x24, 0x01, 0x00, 0x00, 0x01, 0x80,
-		},
-	},
-	{
-		.pixel_clock = 74176000,
-		.conf = {
-			0x01, 0xd1, 0x3e, 0x35, 0x40, 0x5b, 0xde, 0x08,
-			0x82, 0xa0, 0x73, 0xd9, 0x45, 0xa0, 0xac, 0x80,
-			0x56, 0x80, 0x11, 0x04, 0x02, 0x22, 0x44, 0x86,
-			0x54, 0xa6, 0x24, 0x01, 0x00, 0x00, 0x01, 0x80,
-		},
-	},
-	{
-		.pixel_clock = 74250000,
-		.conf = {
-			0x01, 0xd1, 0x1f, 0x10, 0x40, 0x40, 0xf8, 0x08,
-			0x81, 0xa0, 0xba, 0xd8, 0x45, 0xa0, 0xac, 0x80,
-			0x3c, 0x80, 0x11, 0x04, 0x02, 0x22, 0x44, 0x86,
-			0x54, 0xa5, 0x24, 0x01, 0x00, 0x00, 0x01, 0x00,
-		},
-	},
-	{
-		.pixel_clock = 83500000,
-		.conf = {
-			0x01, 0xd1, 0x23, 0x11, 0x40, 0x0c, 0xfb, 0x08,
-			0x85, 0xa0, 0xd1, 0xd8, 0x45, 0xa0, 0xac, 0x80,
-			0x08, 0x80, 0x11, 0x04, 0x02, 0x22, 0x44, 0x86,
-			0x54, 0x93, 0x24, 0x01, 0x00, 0x00, 0x01, 0x80,
-		},
-	},
-	{
-		.pixel_clock = 106500000,
-		.conf = {
-			0x01, 0xd1, 0x2c, 0x12, 0x40, 0x0c, 0x09, 0x08,
-			0x84, 0xa0, 0x0a, 0xd9, 0x45, 0xa0, 0xac, 0x80,
-			0x08, 0x80, 0x11, 0x04, 0x02, 0x22, 0x44, 0x86,
-			0x54, 0x73, 0x24, 0x01, 0x00, 0x00, 0x01, 0x80,
-		},
-	},
-	{
-		.pixel_clock = 108000000,
-		.conf = {
-			0x01, 0x51, 0x2d, 0x15, 0x40, 0x01, 0x00, 0x08,
-			0x82, 0x80, 0x0e, 0xd9, 0x45, 0xa0, 0xac, 0x80,
-			0x08, 0x80, 0x11, 0x04, 0x02, 0x22, 0x44, 0x86,
-			0x54, 0xc7, 0x25, 0x03, 0x00, 0x00, 0x01, 0x80,
-		},
-	},
-	{
-		.pixel_clock = 146250000,
-		.conf = {
-			0x01, 0xd1, 0x3d, 0x15, 0x40, 0x18, 0xfd, 0x08,
-			0x83, 0xa0, 0x6e, 0xd9, 0x45, 0xa0, 0xac, 0x80,
-			0x08, 0x80, 0x11, 0x04, 0x02, 0x22, 0x44, 0x86,
-			0x54, 0x50, 0x25, 0x03, 0x00, 0x00, 0x01, 0x80,
-		},
-	},
-	{
-		.pixel_clock = 148500000,
-		.conf = {
-			0x01, 0xd1, 0x1f, 0x00, 0x40, 0x40, 0xf8, 0x08,
-			0x81, 0xa0, 0xba, 0xd8, 0x45, 0xa0, 0xac, 0x80,
-			0x3c, 0x80, 0x11, 0x04, 0x02, 0x22, 0x44, 0x86,
-			0x54, 0x4b, 0x25, 0x03, 0x00, 0x00, 0x01, 0x00,
-		},
-	},
-};
-
 struct hdmi_infoframe {
 	enum HDMI_PACKET_TYPE type;
 	u8 ver;
@@ -772,46 +596,6 @@ static struct edid *hdmi_get_edid(void *ctx, struct drm_connector *connector)
 	return raw_edid;
 }
 
-static int hdmi_find_phy_conf(struct hdmi_context *hdata, u32 pixel_clock)
-{
-	const struct hdmiphy_config *confs;
-	int count, i;
-
-	DRM_DEBUG_KMS("[%d] %s\n", __LINE__, __func__);
-
-	if (hdata->type == HDMI_TYPE13) {
-		confs = hdmiphy_v13_configs;
-		count = ARRAY_SIZE(hdmiphy_v13_configs);
-	} else if (hdata->type == HDMI_TYPE14) {
-		confs = hdmiphy_v14_configs;
-		count = ARRAY_SIZE(hdmiphy_v14_configs);
-	} else
-		return -EINVAL;
-
-	for (i = 0; i < count; i++)
-		if (confs[i].pixel_clock == pixel_clock)
-			return i;
-
-	DRM_DEBUG_KMS("Could not find phy config for %d\n", pixel_clock);
-	return -EINVAL;
-}
-
-static int hdmi_check_timing(void *ctx, struct drm_display_mode *mode)
-{
-	struct hdmi_context *hdata = ctx;
-	int ret;
-
-	DRM_DEBUG_KMS("%s : xres=%d, yres=%d, refresh=%d, intl=%d clock=%d\n",
-		__func__, mode->hdisplay, mode->vdisplay,
-		mode->vrefresh, (mode->flags & DRM_MODE_FLAG_INTERLACE) ? true :
-		false, mode->clock * 1000);
-
-	ret = hdmi_find_phy_conf(hdata, mode->clock * 1000);
-	if (ret < 0)
-		return ret;
-	return 0;
-}
-
 static void hdmi_set_acr(u32 freq, u8 *acr)
 {
 	u32 n, cts;
@@ -1307,20 +1091,12 @@ static void hdmi_timing_apply(struct hdmi_context *hdata)
 
 static void hdmiphy_conf_reset(struct hdmi_context *hdata)
 {
-	u8 buffer[2];
 	u32 reg;
 
 	clk_disable(hdata->res.sclk_hdmi);
 	clk_set_parent(hdata->res.sclk_hdmi, hdata->res.sclk_pixel);
 	clk_enable(hdata->res.sclk_hdmi);
 
-	/* operation mode */
-	buffer[0] = 0x1f;
-	buffer[1] = 0x00;
-
-	if (hdata->hdmiphy_port)
-		i2c_master_send(hdata->hdmiphy_port, buffer, 2);
-
 	if (hdata->type == HDMI_TYPE13)
 		reg = HDMI_V13_PHY_RSTOUT;
 	else
@@ -1333,102 +1109,6 @@ static void hdmiphy_conf_reset(struct hdmi_context *hdata)
 	usleep_range(10000, 12000);
 }
 
-static void hdmiphy_poweron(struct hdmi_context *hdata)
-{
-	DRM_DEBUG_KMS("[%d] %s\n", __LINE__, __func__);
-
-	if (hdata->type == HDMI_TYPE14)
-		hdmi_reg_writemask(hdata, HDMI_PHY_CON_0, 0,
-			HDMI_PHY_POWER_OFF_EN);
-}
-
-static void hdmiphy_poweroff(struct hdmi_context *hdata)
-{
-	DRM_DEBUG_KMS("[%d] %s\n", __LINE__, __func__);
-
-	if (hdata->type == HDMI_TYPE14)
-		hdmi_reg_writemask(hdata, HDMI_PHY_CON_0, ~0,
-			HDMI_PHY_POWER_OFF_EN);
-}
-
-static void hdmiphy_conf_apply(struct hdmi_context *hdata)
-{
-	const u8 *hdmiphy_data;
-	u8 buffer[32];
-	u8 operation[2];
-	u8 read_buffer[32] = {0, };
-	int ret;
-	int i;
-
-	if (!hdata->hdmiphy_port) {
-		DRM_ERROR("hdmiphy is not attached\n");
-		return;
-	}
-
-	/* pixel clock */
-	i = hdmi_find_phy_conf(hdata, hdata->mode_conf.pixel_clock);
-	if (i < 0) {
-		DRM_ERROR("failed to find hdmiphy conf\n");
-		return;
-	}
-
-	if (hdata->type == HDMI_TYPE13) {
-		hdmiphy_data = hdmiphy_v13_configs[i].conf;
-	} else {
-		hdmiphy_data = hdmiphy_v14_configs[i].conf;
-	}
-
-	memcpy(buffer, hdmiphy_data, 32);
-	ret = i2c_master_send(hdata->hdmiphy_port, buffer, 32);
-	if (ret != 32) {
-		DRM_ERROR("failed to configure HDMIPHY via I2C\n");
-		return;
-	}
-
-	usleep_range(10000, 12000);
-
-	/* operation mode */
-	operation[0] = 0x1f;
-	operation[1] = 0x80;
-
-	ret = i2c_master_send(hdata->hdmiphy_port, operation, 2);
-	if (ret != 2) {
-		DRM_ERROR("failed to enable hdmiphy\n");
-		return;
-	}
-
-	ret = i2c_master_recv(hdata->hdmiphy_port, read_buffer, 32);
-	if (ret < 0) {
-		DRM_ERROR("failed to read hdmiphy config\n");
-		return;
-	}
-
-	for (i = 0; i < ret; i++)
-		DRM_DEBUG_KMS("hdmiphy[0x%02x] write[0x%02x] - "
-			"recv [0x%02x]\n", i, buffer[i], read_buffer[i]);
-}
-
-static void hdmi_conf_apply(struct hdmi_context *hdata)
-{
-	DRM_DEBUG_KMS("[%d] %s\n", __LINE__, __func__);
-
-	hdmiphy_conf_reset(hdata);
-	hdmiphy_conf_apply(hdata);
-
-	mutex_lock(&hdata->hdmi_mutex);
-	hdmi_conf_reset(hdata);
-	hdmi_conf_init(hdata);
-	mutex_unlock(&hdata->hdmi_mutex);
-
-	hdmi_audio_init(hdata);
-
-	/* setting core registers */
-	hdmi_timing_apply(hdata);
-	hdmi_audio_control(hdata, true);
-
-	hdmi_regs_dump(hdata, "start");
-}
-
 static void hdmi_set_reg(u8 *reg_pair, int num_bytes, u32 value)
 {
 	int i;
@@ -1446,7 +1126,6 @@ static void hdmi_v13_mode_set(struct hdmi_context *hdata,
 
 	hdata->mode_conf.cea_video_id =
 		drm_match_cea_mode((struct drm_display_mode *)m);
-	hdata->mode_conf.pixel_clock = m->clock * 1000;
 
 	hdmi_set_reg(core->h_blank, 2, m->htotal - m->hdisplay);
 	hdmi_set_reg(core->h_v_line, 3, (m->htotal << 12) | m->vtotal);
@@ -1542,7 +1221,6 @@ static void hdmi_v14_mode_set(struct hdmi_context *hdata,
 
 	hdata->mode_conf.cea_video_id =
 		drm_match_cea_mode((struct drm_display_mode *)m);
-	hdata->mode_conf.pixel_clock = m->clock * 1000;
 
 	hdmi_set_reg(core->h_blank, 2, m->htotal - m->hdisplay);
 	hdmi_set_reg(core->v_line, 2, m->vtotal);
@@ -1668,6 +1346,14 @@ static void hdmi_get_max_resol(void *ctx, unsigned int *width,
 	*height = MAX_HEIGHT;
 }
 
+static void hdmi_commit_prepare(void *ctx)
+{
+	struct hdmi_context *hdata = ctx;
+	DRM_DEBUG_KMS("[%d]\n", __LINE__);
+
+	hdmiphy_conf_reset(hdata);
+}
+
 static void hdmi_commit(void *ctx)
 {
 	struct hdmi_context *hdata = ctx;
@@ -1679,9 +1365,18 @@ static void hdmi_commit(void *ctx)
 		mutex_unlock(&hdata->hdmi_mutex);
 		return;
 	}
+
+	hdmi_conf_reset(hdata);
+	hdmi_conf_init(hdata);
 	mutex_unlock(&hdata->hdmi_mutex);
 
-	hdmi_conf_apply(hdata);
+	hdmi_audio_init(hdata);
+
+	/* setting core registers */
+	hdmi_timing_apply(hdata);
+	hdmi_audio_control(hdata, true);
+
+	hdmi_regs_dump(hdata, "start");
 }
 
 static void hdmi_poweron(struct hdmi_context *hdata)
@@ -1704,8 +1399,6 @@ static void hdmi_poweron(struct hdmi_context *hdata)
 	clk_enable(res->hdmiphy);
 	clk_enable(res->hdmi);
 	clk_enable(res->sclk_hdmi);
-
-	hdmiphy_poweron(hdata);
 }
 
 static void hdmi_poweroff(struct hdmi_context *hdata)
@@ -1724,7 +1417,6 @@ static void hdmi_poweroff(struct hdmi_context *hdata)
 	 * its reset state seems to meet the condition.
 	 */
 	hdmiphy_conf_reset(hdata);
-	hdmiphy_poweroff(hdata);
 
 	clk_disable(res->sclk_hdmi);
 	clk_disable(res->hdmi);
@@ -1766,11 +1458,11 @@ static struct exynos_hdmi_ops hdmi_ops = {
 	/* display */
 	.is_connected	= hdmi_is_connected,
 	.get_edid	= hdmi_get_edid,
-	.check_timing	= hdmi_check_timing,
 
 	/* manager */
 	.mode_set	= hdmi_mode_set,
 	.get_max_resol	= hdmi_get_max_resol,
+	.prepare	= hdmi_commit_prepare,
 	.commit		= hdmi_commit,
 	.dpms		= hdmi_dpms,
 };
@@ -1858,7 +1550,7 @@ fail:
 	return -ENODEV;
 }
 
-static struct i2c_client *hdmi_ddc, *hdmi_hdmiphy;
+static struct i2c_client *hdmi_ddc;
 
 void hdmi_attach_ddc_client(struct i2c_client *ddc)
 {
@@ -1866,12 +1558,6 @@ void hdmi_attach_ddc_client(struct i2c_client *ddc)
 		hdmi_ddc = ddc;
 }
 
-void hdmi_attach_hdmiphy_client(struct i2c_client *hdmiphy)
-{
-	if (hdmiphy)
-		hdmi_hdmiphy = hdmiphy;
-}
-
 #ifdef CONFIG_OF
 static struct s5p_hdmi_platform_data *drm_hdmi_dt_parse_pdata
 					(struct device *dev)
@@ -2029,20 +1715,11 @@ static int hdmi_probe(struct platform_device *pdev)
 
 	hdata->ddc_port = hdmi_ddc;
 
-	/* hdmiphy i2c driver */
-	if (i2c_add_driver(&hdmiphy_driver)) {
-		DRM_ERROR("failed to register hdmiphy i2c driver\n");
-		ret = -ENOENT;
-		goto err_ddc;
-	}
-
-	hdata->hdmiphy_port = hdmi_hdmiphy;
-
 	hdata->irq = gpio_to_irq(hdata->hpd_gpio);
 	if (hdata->irq < 0) {
 		DRM_ERROR("failed to get GPIO irq\n");
 		ret = hdata->irq;
-		goto err_hdmiphy;
+		goto err_ddc;
 	}
 
 	hdata->hpd = gpio_get_value(hdata->hpd_gpio);
@@ -2053,7 +1730,7 @@ static int hdmi_probe(struct platform_device *pdev)
 			"hdmi", drm_hdmi_ctx);
 	if (ret) {
 		DRM_ERROR("failed to register hdmi interrupt\n");
-		goto err_hdmiphy;
+		goto err_ddc;
 	}
 
 	/* Attach HDMI Driver to common hdmi. */
@@ -2066,8 +1743,6 @@ static int hdmi_probe(struct platform_device *pdev)
 
 	return 0;
 
-err_hdmiphy:
-	i2c_del_driver(&hdmiphy_driver);
 err_ddc:
 	i2c_del_driver(&ddc_driver);
 	return ret;
@@ -2085,9 +1760,6 @@ static int hdmi_remove(struct platform_device *pdev)
 
 	free_irq(hdata->irq, hdata);
 
-
-	/* hdmiphy i2c driver */
-	i2c_del_driver(&hdmiphy_driver);
 	/* DDC i2c driver */
 	i2c_del_driver(&ddc_driver);
 
diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.h b/drivers/gpu/drm/exynos/exynos_hdmi.h
index 0ddf395..6595d7b 100644
--- a/drivers/gpu/drm/exynos/exynos_hdmi.h
+++ b/drivers/gpu/drm/exynos/exynos_hdmi.h
@@ -15,7 +15,6 @@
 #define _EXYNOS_HDMI_H_
 
 void hdmi_attach_ddc_client(struct i2c_client *ddc);
-void hdmi_attach_hdmiphy_client(struct i2c_client *hdmiphy);
 
 extern struct i2c_driver hdmiphy_driver;
 extern struct i2c_driver ddc_driver;
diff --git a/drivers/gpu/drm/exynos/exynos_hdmiphy.c b/drivers/gpu/drm/exynos/exynos_hdmiphy.c
index ea49d13..de7cdfd 100644
--- a/drivers/gpu/drm/exynos/exynos_hdmiphy.c
+++ b/drivers/gpu/drm/exynos/exynos_hdmiphy.c
@@ -16,33 +16,438 @@
 #include <linux/kernel.h>
 #include <linux/i2c.h>
 #include <linux/module.h>
+#include <linux/pm_runtime.h>
+#include <linux/clk.h>
 
 #include "exynos_drm_drv.h"
+#include "exynos_drm_hdmi.h"
 #include "exynos_hdmi.h"
 
+#include "regs-hdmiphy.h"
 
-static int hdmiphy_probe(struct i2c_client *client,
-	const struct i2c_device_id *id)
+#define HDMIPHY_REG_COUNT		(32)
+
+enum hdmiphy_type {
+	HDMIPHY_EXYNOS4210,
+	HDMIPHY_EXYNOS4212,
+};
+
+struct hdmiphy_context {
+	struct device		*dev;
+	bool			powered;
+	void			*parent_ctx;
+	enum hdmiphy_type		type;
+	const struct hdmiphy_config	*conf;
+	struct clk		*hdmiphy;
+};
+
+struct hdmiphy_config {
+	int pixel_clock;
+	u8 conf[HDMIPHY_REG_COUNT];
+};
+
+/* list of all required phy config settings */
+static const struct hdmiphy_config hdmiphy_4212_configs[] = {
+	{
+		.pixel_clock = 25200000,
+		.conf = {
+			0x01, 0x51, 0x2A, 0x75, 0x40, 0x01, 0x00, 0x08,
+			0x82, 0x80, 0xfc, 0xd8, 0x45, 0xa0, 0xac, 0x80,
+			0x08, 0x80, 0x11, 0x04, 0x02, 0x22, 0x44, 0x86,
+			0x54, 0xf4, 0x24, 0x00, 0x00, 0x00, 0x01, 0x80,
+		},
+	},
+	{
+		.pixel_clock = 27000000,
+		.conf = {
+			0x01, 0xd1, 0x22, 0x51, 0x40, 0x08, 0xfc, 0x20,
+			0x98, 0xa0, 0xcb, 0xd8, 0x45, 0xa0, 0xac, 0x80,
+			0x06, 0x80, 0x11, 0x04, 0x02, 0x22, 0x44, 0x86,
+			0x54, 0xe4, 0x24, 0x00, 0x00, 0x00, 0x01, 0x80,
+		},
+	},
+	{
+		.pixel_clock = 27027000,
+		.conf = {
+			0x01, 0xd1, 0x2d, 0x72, 0x40, 0x64, 0x12, 0x08,
+			0x43, 0xa0, 0x0e, 0xd9, 0x45, 0xa0, 0xac, 0x80,
+			0x08, 0x80, 0x11, 0x04, 0x02, 0x22, 0x44, 0x86,
+			0x54, 0xe3, 0x24, 0x00, 0x00, 0x00, 0x01, 0x00,
+		},
+	},
+	{
+		.pixel_clock = 36000000,
+		.conf = {
+			0x01, 0x51, 0x2d, 0x55, 0x40, 0x01, 0x00, 0x08,
+			0x82, 0x80, 0x0e, 0xd9, 0x45, 0xa0, 0xac, 0x80,
+			0x08, 0x80, 0x11, 0x04, 0x02, 0x22, 0x44, 0x86,
+			0x54, 0xab, 0x24, 0x00, 0x00, 0x00, 0x01, 0x80,
+		},
+	},
+	{
+		.pixel_clock = 40000000,
+		.conf = {
+			0x01, 0x51, 0x32, 0x55, 0x40, 0x01, 0x00, 0x08,
+			0x82, 0x80, 0x2c, 0xd9, 0x45, 0xa0, 0xac, 0x80,
+			0x08, 0x80, 0x11, 0x04, 0x02, 0x22, 0x44, 0x86,
+			0x54, 0x9a, 0x24, 0x00, 0x00, 0x00, 0x01, 0x80,
+		},
+	},
+	{
+		.pixel_clock = 65000000,
+		.conf = {
+			0x01, 0xd1, 0x36, 0x34, 0x40, 0x1e, 0x0a, 0x08,
+			0x82, 0xa0, 0x45, 0xd9, 0x45, 0xa0, 0xac, 0x80,
+			0x08, 0x80, 0x11, 0x04, 0x02, 0x22, 0x44, 0x86,
+			0x54, 0xbd, 0x24, 0x01, 0x00, 0x00, 0x01, 0x80,
+		},
+	},
+	{
+		.pixel_clock = 74176000,
+		.conf = {
+			0x01, 0xd1, 0x3e, 0x35, 0x40, 0x5b, 0xde, 0x08,
+			0x82, 0xa0, 0x73, 0xd9, 0x45, 0xa0, 0xac, 0x80,
+			0x56, 0x80, 0x11, 0x04, 0x02, 0x22, 0x44, 0x86,
+			0x54, 0xa6, 0x24, 0x01, 0x00, 0x00, 0x01, 0x80,
+		},
+	},
+	{
+		.pixel_clock = 74250000,
+		.conf = {
+			0x01, 0xd1, 0x1f, 0x10, 0x40, 0x40, 0xf8, 0x08,
+			0x81, 0xa0, 0xba, 0xd8, 0x45, 0xa0, 0xac, 0x80,
+			0x3c, 0x80, 0x11, 0x04, 0x02, 0x22, 0x44, 0x86,
+			0x54, 0xa5, 0x24, 0x01, 0x00, 0x00, 0x01, 0x00,
+		},
+	},
+	{
+		.pixel_clock = 83500000,
+		.conf = {
+			0x01, 0xd1, 0x23, 0x11, 0x40, 0x0c, 0xfb, 0x08,
+			0x85, 0xa0, 0xd1, 0xd8, 0x45, 0xa0, 0xac, 0x80,
+			0x08, 0x80, 0x11, 0x04, 0x02, 0x22, 0x44, 0x86,
+			0x54, 0x93, 0x24, 0x01, 0x00, 0x00, 0x01, 0x80,
+		},
+	},
+	{
+		.pixel_clock = 106500000,
+		.conf = {
+			0x01, 0xd1, 0x2c, 0x12, 0x40, 0x0c, 0x09, 0x08,
+			0x84, 0xa0, 0x0a, 0xd9, 0x45, 0xa0, 0xac, 0x80,
+			0x08, 0x80, 0x11, 0x04, 0x02, 0x22, 0x44, 0x86,
+			0x54, 0x73, 0x24, 0x01, 0x00, 0x00, 0x01, 0x80,
+		},
+	},
+	{
+		.pixel_clock = 108000000,
+		.conf = {
+			0x01, 0x51, 0x2d, 0x15, 0x40, 0x01, 0x00, 0x08,
+			0x82, 0x80, 0x0e, 0xd9, 0x45, 0xa0, 0xac, 0x80,
+			0x08, 0x80, 0x11, 0x04, 0x02, 0x22, 0x44, 0x86,
+			0x54, 0xc7, 0x25, 0x03, 0x00, 0x00, 0x01, 0x80,
+		},
+	},
+	{
+		.pixel_clock = 146250000,
+		.conf = {
+			0x01, 0xd1, 0x3d, 0x15, 0x40, 0x18, 0xfd, 0x08,
+			0x83, 0xa0, 0x6e, 0xd9, 0x45, 0xa0, 0xac, 0x80,
+			0x08, 0x80, 0x11, 0x04, 0x02, 0x22, 0x44, 0x86,
+			0x54, 0x50, 0x25, 0x03, 0x00, 0x00, 0x01, 0x80,
+		},
+	},
+	{
+		.pixel_clock = 148500000,
+		.conf = {
+			0x01, 0xd1, 0x1f, 0x00, 0x40, 0x40, 0xf8, 0x08,
+			0x81, 0xa0, 0xba, 0xd8, 0x45, 0xa0, 0xac, 0x80,
+			0x3c, 0x80, 0x11, 0x04, 0x02, 0x22, 0x44, 0x86,
+			0x54, 0x4b, 0x25, 0x03, 0x00, 0x00, 0x01, 0x00,
+		},
+	},
+};
+
+static const struct hdmiphy_config hdmiphy_4210_configs[] = {
+	{
+		.pixel_clock = 27000000,
+		.conf = {
+			0x01, 0x05, 0x00, 0xD8, 0x10, 0x1C, 0x30, 0x40,
+			0x6B, 0x10, 0x02, 0x51, 0xDF, 0xF2, 0x54, 0x87,
+			0x84, 0x00, 0x30, 0x38, 0x00, 0x08, 0x10, 0xE0,
+			0x22, 0x40, 0xE3, 0x26, 0x00, 0x00, 0x00, 0x00,
+		},
+	},
+	{
+		.pixel_clock = 27027000,
+		.conf = {
+			0x01, 0x05, 0x00, 0xD4, 0x10, 0x9C, 0x09, 0x64,
+			0x6B, 0x10, 0x02, 0x51, 0xDF, 0xF2, 0x54, 0x87,
+			0x84, 0x00, 0x30, 0x38, 0x00, 0x08, 0x10, 0xE0,
+			0x22, 0x40, 0xE3, 0x26, 0x00, 0x00, 0x00, 0x00,
+		},
+	},
+	{
+		.pixel_clock = 74176000,
+		.conf = {
+			0x01, 0x05, 0x00, 0xD8, 0x10, 0x9C, 0xef, 0x5B,
+			0x6D, 0x10, 0x01, 0x51, 0xef, 0xF3, 0x54, 0xb9,
+			0x84, 0x00, 0x30, 0x38, 0x00, 0x08, 0x10, 0xE0,
+			0x22, 0x40, 0xa5, 0x26, 0x01, 0x00, 0x00, 0x00,
+		},
+	},
+	{
+		.pixel_clock = 74250000,
+		.conf = {
+			0x01, 0x05, 0x00, 0xd8, 0x10, 0x9c, 0xf8, 0x40,
+			0x6a, 0x10, 0x01, 0x51, 0xff, 0xf1, 0x54, 0xba,
+			0x84, 0x00, 0x10, 0x38, 0x00, 0x08, 0x10, 0xe0,
+			0x22, 0x40, 0xa4, 0x26, 0x01, 0x00, 0x00, 0x00,
+		},
+	},
+	{
+		.pixel_clock = 148500000,
+		.conf = {
+			0x01, 0x05, 0x00, 0xD8, 0x10, 0x9C, 0xf8, 0x40,
+			0x6A, 0x18, 0x00, 0x51, 0xff, 0xF1, 0x54, 0xba,
+			0x84, 0x00, 0x10, 0x38, 0x00, 0x08, 0x10, 0xE0,
+			0x22, 0x40, 0xa4, 0x26, 0x02, 0x00, 0x00, 0x00,
+		},
+	},
+};
+
+static const struct hdmiphy_config *hdmiphy_find_conf(void *ctx,
+			const struct drm_display_mode *mode)
+{
+	struct hdmiphy_context *hdata = ctx;
+	const struct hdmiphy_config *confs;
+	int count, i;
+
+	switch (hdata->type) {
+	case HDMIPHY_EXYNOS4212:
+		confs = hdmiphy_4212_configs;
+		count = ARRAY_SIZE(hdmiphy_4212_configs);
+		break;
+	case HDMIPHY_EXYNOS4210:
+		confs = hdmiphy_4210_configs;
+		count = ARRAY_SIZE(hdmiphy_4210_configs);
+		break;
+	default:
+		DRM_ERROR("failed to find HDMIPHY type\n");
+		return NULL;
+	}
+
+	for (i = 0; i < count; i++)
+		if (confs[i].pixel_clock == (mode->clock * 1000))
+			return &confs[i];
+
+	return NULL;
+}
+
+static int hdmiphy_check_timing(void *ctx, struct drm_display_mode *mode)
 {
-	hdmi_attach_hdmiphy_client(client);
+	const struct hdmiphy_config *conf;
+	DRM_DEBUG_KMS("xres=%d, yres=%d, refresh=%d, intl=%d clock=%d\n",
+		mode->hdisplay, mode->vdisplay,
+		mode->vrefresh, (mode->flags & DRM_MODE_FLAG_INTERLACE)
+		? true : false, mode->clock * 1000);
 
-	dev_info(&client->adapter->dev, "attached s5p_hdmiphy "
-		"into i2c adapter successfully\n");
+	conf = hdmiphy_find_conf(ctx, mode);
+	if (!conf) {
+		DRM_DEBUG_KMS("Display Mode is not supported.\n");
+		return -EINVAL;
+	}
 
 	return 0;
 }
 
-static int hdmiphy_remove(struct i2c_client *client)
+static void hdmiphy_mode_set(void *ctx, struct drm_display_mode *mode)
+{
+	struct hdmiphy_context *hdata = ctx;
+
+	DRM_DEBUG_KMS("[%d]\n", __LINE__);
+
+	hdata->conf = hdmiphy_find_conf(ctx, mode);
+}
+
+static void hdmiphy_config_prepare(void *ctx)
+{
+	struct hdmiphy_context *hdata = ctx;
+	const struct i2c_client *client = to_i2c_client(hdata->dev);
+	u8 buffer[2];
+
+	DRM_DEBUG_KMS("[%d]\n", __LINE__);
+
+	/* operation mode */
+	buffer[0] = HDMIPHY_MODE_SET_DONE;
+	buffer[1] = 0x00;
+
+	if (client)
+		i2c_master_send(client, buffer, 2);
+}
+
+static int hdmiphy_config_apply(void *ctx)
 {
-	dev_info(&client->adapter->dev, "detached s5p_hdmiphy "
-		"from i2c adapter successfully\n");
+	struct hdmiphy_context *hdata = ctx;
+	struct i2c_client *client = to_i2c_client(hdata->dev);
+	const u8 *hdmiphy_data;
+	u8 buffer[HDMIPHY_REG_COUNT];
+	u8 operation[2];
+	u8 read_buffer[HDMIPHY_REG_COUNT] = {0, };
+	int ret;
+	int i;
+
+	DRM_DEBUG_KMS("[%d]\n", __LINE__);
+
+	/* pixel clock */
+	if (hdata->conf && client)
+		hdmiphy_data = hdata->conf->conf;
+	else
+		return -EINVAL;
+
+	memcpy(buffer, hdmiphy_data, HDMIPHY_REG_COUNT);
+
+	ret = i2c_master_send(client, buffer, HDMIPHY_REG_COUNT);
+	if (ret != HDMIPHY_REG_COUNT) {
+		DRM_ERROR("failed to configure HDMIPHY via I2C\n");
+		return ret;
+	}
+
+	usleep_range(10000, 12000);
+
+	/* operation mode */
+	operation[0] = HDMIPHY_MODE_SET_DONE;
+	operation[1] = HDMIPHY_MODE_EN;
+
+	ret = i2c_master_send(client, operation, 2);
+	if (ret != 2) {
+		DRM_ERROR("failed to enable hdmiphy\n");
+		return ret;
+	}
+
+	ret = i2c_master_recv(client, read_buffer, HDMIPHY_REG_COUNT);
+	if (ret < 0) {
+		DRM_ERROR("failed to read hdmiphy config\n");
+		return ret;
+	}
+
+	for (i = 0; i < ret; i++)
+		DRM_DEBUG_KMS("hdmiphy[0x%02x] wr[0x%02x], rd[0x%02x]\n",
+				i, buffer[i], read_buffer[i]);
+	return 0;
+}
+
+static void hdmiphy_dpms(void *ctx, int mode)
+{
+	struct hdmiphy_context *hdata = ctx;
+
+	DRM_DEBUG_KMS("[%d] mode %d\n", __LINE__, mode);
+
+	switch (mode) {
+	case DRM_MODE_DPMS_ON:
+		if (pm_runtime_suspended(hdata->dev))
+			pm_runtime_get_sync(hdata->dev);
+		break;
+	case DRM_MODE_DPMS_STANDBY:
+	case DRM_MODE_DPMS_SUSPEND:
+	case DRM_MODE_DPMS_OFF:
+		if (!pm_runtime_suspended(hdata->dev))
+			pm_runtime_put_sync(hdata->dev);
+		break;
+	default:
+		DRM_DEBUG_KMS("unknown dpms mode: %d\n", mode);
+		break;
+	}
+}
+
+static int hdmiphy_update_bits(struct i2c_client *client, u8 *reg_cache,
+			       u8 reg, u8 mask, u8 val)
+{
+	int ret;
+	u8 buffer[2];
+
+	buffer[0] = reg;
+	buffer[1] = (reg_cache[reg] & ~mask) | (val & mask);
+	reg_cache[reg] = buffer[1];
+
+	ret = i2c_master_send(client, buffer, 2);
+	if (ret != 2)
+		return -EIO;
 
 	return 0;
 }
 
+static int hdmiphy_4412_turn_on(struct i2c_client *client, bool on)
+{
+	u8 reg_cache[HDMIPHY_REG_COUNT] = { 0 };
+	u8 buffer[2];
+	int ret;
+
+	DRM_DEBUG_KMS("hdmiphy is %s\n", on ? "on" : "off");
+
+	/* Cache all hdmi-phy registers to make the code below faster */
+	buffer[0] = 0x0;
+	ret = i2c_master_send(client, buffer, 1);
+	if (ret != 1) {
+		ret = -EIO;
+		goto exit;
+	}
+	ret = i2c_master_recv(client, reg_cache, HDMIPHY_REG_COUNT);
+	if (ret != HDMIPHY_REG_COUNT) {
+		ret = -EIO;
+		goto exit;
+	}
+
+	/* Change to/from configuration from/to operation mode */
+	ret = hdmiphy_update_bits(client, reg_cache, HDMIPHY_MODE_SET_DONE,
+				HDMIPHY_MODE_EN, on ? ~0 : 0);
+	if (ret)
+		goto exit;
+
+	/*
+	 * Turn off "oscpad" if !on; it turns on again in
+	 * during phy-configuration.
+	 */
+	if (!on)
+		ret = hdmiphy_update_bits(client, reg_cache,
+			HDMIPHY_4212_OSC_PAD_CON, HDMIPHY_OSC_PAD_EN, 0);
+		if (ret)
+			goto exit;
+
+	/* Disable powerdown if on; enable if !on */
+	ret = hdmiphy_update_bits(client, reg_cache, HDMIPHY_4212_PD_CON,
+			HDMIPHY_PDEN, on ? 0 : ~0);
+	if (ret)
+		goto exit;
+	ret = hdmiphy_update_bits(client, reg_cache, HDMIPHY_4212_PD_CON,
+			HDMIPHY_PD_ALL, on ? 0 : ~0);
+	if (ret)
+		goto exit;
+
+	/* Disable pixel clock generator block if !on */
+	if (!on)
+		ret = hdmiphy_update_bits(client, reg_cache,
+			HDMIPHY_4212_PCG_CON, HDMIPHY_PCG_RESET_EN, 0);
+		if (ret)
+			goto exit;
+
+exit:
+	/* Don't expect any errors so just do a single warn */
+	WARN_ON(ret);
+
+	return ret;
+}
+
+static struct exynos_hdmiphy_ops hdmiphy_ops = {
+	.check_timing	= hdmiphy_check_timing,
+	.mode_set		= hdmiphy_mode_set,
+	.prepare		= hdmiphy_config_prepare,
+	.config_apply	= hdmiphy_config_apply,
+	.dpms		= hdmiphy_dpms,
+};
+
 static const struct i2c_device_id hdmiphy_id[] = {
-	{ "s5p_hdmiphy", 0 },
-	{ "exynos5-hdmiphy", 0 },
+	{ "s5p_hdmiphy", HDMIPHY_EXYNOS4210 },
+	{ "exynos5-hdmiphy", HDMIPHY_EXYNOS4212 },
 	{ },
 };
 
@@ -50,21 +455,181 @@ static const struct i2c_device_id hdmiphy_id[] = {
 static struct of_device_id hdmiphy_match_types[] = {
 	{
 		.compatible = "samsung,exynos5-hdmiphy",
+		.data	= (void	*)HDMIPHY_EXYNOS4212,
 	}, {
 		/* end node */
 	}
 };
 #endif
 
+static int hdmiphy_probe(struct i2c_client *client,
+	const struct i2c_device_id *id)
+{
+	struct device *dev = &client->dev;
+	struct hdmiphy_context *hdata;
+	struct exynos_drm_hdmi_context *drm_hdmi_ctx;
+
+	DRM_DEBUG_KMS("[%d]\n", __LINE__);
+
+	drm_hdmi_ctx = devm_kzalloc(dev, sizeof(*drm_hdmi_ctx),
+					GFP_KERNEL);
+	if (!drm_hdmi_ctx) {
+		DRM_ERROR("failed to allocate common hdmi context.\n");
+		return -ENOMEM;
+	}
+
+	hdata = devm_kzalloc(dev, sizeof(*hdata), GFP_KERNEL);
+	if (!hdata) {
+		DRM_ERROR("failed to allocate hdmiphy context.\n");
+		return -ENOMEM;
+	}
+
+	if (dev->of_node) {
+		const struct of_device_id *match;
+		match = of_match_node(of_match_ptr(hdmiphy_match_types),
+					dev->of_node);
+		if (match == NULL)
+			return -ENODEV;
+		hdata->type = (enum hdmiphy_type)match->data;
+	} else {
+		hdata->type = (enum hdmiphy_type)id->driver_data;
+	}
+
+	drm_hdmi_ctx->ctx = (void *)hdata;
+	hdata->parent_ctx = (void *)drm_hdmi_ctx;
+	hdata->dev = dev;
+
+	hdata->hdmiphy = devm_clk_get(dev, "hdmiphy");
+	if (IS_ERR_OR_NULL(hdata->hdmiphy)) {
+		DRM_ERROR("failed to get clock 'hdmiphy'\n");
+		return PTR_ERR(hdata->hdmiphy);
+	}
+
+	i2c_set_clientdata(client, hdata);
+
+	/* Attach HDMI-PHY Driver to common hdmi. */
+	exynos_hdmiphy_drv_attach(drm_hdmi_ctx);
+
+	/* register specific callbacks to common hdmi. */
+	exynos_hdmiphy_ops_register(&hdmiphy_ops);
+
+	pm_runtime_enable(dev);
+
+	dev_info(&client->adapter->dev,
+		"attached s5p_hdmiphy into i2c adapter successfully\n");
+
+	return 0;
+}
+
+static int hdmiphy_remove(struct i2c_client *client)
+{
+	dev_info(&client->adapter->dev,
+		"detached s5p_hdmiphy from i2c adapter successfully\n");
+
+	return 0;
+}
+
+static void hdmiphy_poweroff(struct device *dev)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct hdmiphy_context *hdata = i2c_get_clientdata(client);
+
+	DRM_DEBUG_KMS("[%d]\n", __LINE__);
+
+	if (hdata->type == HDMIPHY_EXYNOS4212)
+		hdmiphy_4412_turn_on(client, 0);
+
+	clk_disable(hdata->hdmiphy);
+}
+
+static void hdmiphy_poweron(struct device *dev)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct hdmiphy_context *hdata = i2c_get_clientdata(client);
+
+	DRM_DEBUG_KMS("[%d]\n", __LINE__);
+
+	clk_enable(hdata->hdmiphy);
+
+	if (hdata->type == HDMIPHY_EXYNOS4212)
+		hdmiphy_4412_turn_on(client, 1);
+}
+
+#ifdef CONFIG_PM_SLEEP
+static int hdmiphy_suspend(struct device *dev)
+{
+	DRM_DEBUG_KMS("[%d]\n", __LINE__);
+
+	if (pm_runtime_suspended(dev)) {
+		DRM_DEBUG_KMS("already runtime-suspended.\n");
+		return 0;
+	}
+
+	hdmiphy_poweroff(dev);
+	return 0;
+}
+
+static int hdmiphy_resume(struct device *dev)
+{
+	DRM_DEBUG_KMS("[%d]\n", __LINE__);
+
+	if (pm_runtime_suspended(dev)) {
+		/* dpms callback should resume the mixer. */
+		DRM_DEBUG_KMS("already runtime-suspended.\n");
+		return 0;
+	}
+
+	hdmiphy_poweron(dev);
+	return 0;
+}
+#endif
+
+
+#ifdef CONFIG_PM_RUNTIME
+static int hdmiphy_runtime_suspend(struct device *dev)
+{
+	DRM_DEBUG_KMS("[%d]\n", __LINE__);
+
+	hdmiphy_poweroff(dev);
+	return 0;
+}
+
+static int hdmiphy_runtime_resume(struct device *dev)
+{
+	DRM_DEBUG_KMS("[%d]\n", __LINE__);
+
+	hdmiphy_poweron(dev);
+	return 0;
+}
+#endif
+
+static const struct dev_pm_ops hdmiphy_pm_ops = {
+	SET_SYSTEM_SLEEP_PM_OPS(hdmiphy_suspend, hdmiphy_resume)
+	SET_RUNTIME_PM_OPS(hdmiphy_runtime_suspend,
+		hdmiphy_runtime_resume, NULL)
+};
+
 struct i2c_driver hdmiphy_driver = {
 	.driver = {
 		.name	= "exynos-hdmiphy",
 		.owner	= THIS_MODULE,
 		.of_match_table = of_match_ptr(hdmiphy_match_types),
+		.pm	= &hdmiphy_pm_ops,
 	},
 	.id_table = hdmiphy_id,
 	.probe		= hdmiphy_probe,
 	.remove		= hdmiphy_remove,
 	.command		= NULL,
 };
+
+extern int exynos_hdmiphy_driver_register(void)
+{
+	return i2c_add_driver(&hdmiphy_driver);
+}
+
+extern void exynos_hdmiphy_driver_unregister(void)
+{
+	i2c_del_driver(&hdmiphy_driver);
+}
+
 EXPORT_SYMBOL(hdmiphy_driver);
diff --git a/drivers/gpu/drm/exynos/regs-hdmiphy.h b/drivers/gpu/drm/exynos/regs-hdmiphy.h
new file mode 100644
index 0000000..1bb0860
--- /dev/null
+++ b/drivers/gpu/drm/exynos/regs-hdmiphy.h
@@ -0,0 +1,61 @@
+/*
+ *
+ *  regs-hdmiphy.h
+ *
+ * Copyright (c) 2013 Samsung Electronics Co., Ltd.
+ * http://www.samsung.com/
+ *
+ * HDMI-PHY register header file for Samsung TVOUT driver
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+*/
+
+#ifndef SAMSUNG_REGS_HDMIPHY_H
+#define SAMSUNG_REGS_HDMIPHY_H
+
+/*
+ * Register part
+*/
+
+/* HDMI PHY Version Common */
+#define HDMIPHY_MODE_SET_DONE		(0x1f)
+
+/* HDMI PHY Version 4212 */
+#define HDMIPHY_4212_PCG_CON		(0x04)
+#define HDMIPHY_4212_OSC_PAD_CON	(0x0b)
+#define HDMIPHY_4212_PD_CON		(0x1d)
+
+/*
+ * Bit definition part
+ */
+
+/* HDMIPHY_MODE_SET_DONE */
+#define HDMIPHY_MODE_EN		(1 << 7)
+
+/* HDMIPHY_4212_PCG_CON */
+#define HDMIPHY_PCG_RESET_EN		(1 << 3)
+
+/* HDMIPHY_4212_OSC_PAD_CON */
+#define HDMIPHY_OSC_PAD_EN		(3 << 6)
+
+/* HDMIPHY_4212_PD_CON */
+#define HDMIPHY_PDEN			(1 << 7)
+
+#define HDMIPHY_PLL_PD			(1 << 6)
+#define HDMIPHY_CLKSER_PD		(1 << 5)
+#define HDMIPHY_CLKDRV_PD		(1 << 4)
+
+#define HDMIPHY_DRV_PD			(1 << 2)
+#define HDMIPHY_SER_PD			(1 << 1)
+#define HDMIPHY_ICLK_PD		(1 << 0)
+
+#define HDMIPHY_PD_ALL			(HDMIPHY_PLL_PD |\
+					HDMIPHY_CLKSER_PD |\
+					HDMIPHY_CLKDRV_PD|\
+					HDMIPHY_DRV_PD|\
+					HDMIPHY_SER_PD|\
+					HDMIPHY_ICLK_PD)
+
+#endif /* SAMSUNG_REGS_HDMIPHY_H */
-- 
1.7.10.4
