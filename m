From: Inki Dae <inki.dae@samsung.com>
Subject: [PATCH v5 1/9] drm/exynos: add super device support
Date: Mon, 14 Apr 2014 15:09:46 +0900
Message-ID: <1397455794-7759-2-git-send-email-inki.dae@samsung.com>
References: <1397455794-7759-1-git-send-email-inki.dae@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:48848 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751369AbaDNGJ6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 14 Apr 2014 02:09:58 -0400
In-reply-to: <1397455794-7759-1-git-send-email-inki.dae@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: airlied@linux.ie, dri-devel@lists.freedesktop.org
Cc: devicetree@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux-samsung-soc@vger.kernel.org, kyungmin.park@samsung.com, inki.dae@samsung.com, seanpaul@chromium.org, a.hajda@samsung.com, kgene.kim@samsung.com, jy0922.shim@samsung.com, sw0312.kim@samsung.com

This patch adds super device support to bind sub drivers
using device tree.

For this, you should add a super device node to each machine dt files
like belows,

In case of using MIPI-DSI,
	display-subsystem {
		compatible = "samsung,exynos-display-subsystem";
		ports = <&fimd>, <&dsi>;
	};

In case of using DisplayPort,
	display-subsystem {
		compatible = "samsung,exynos-display-subsystem";
		ports = <&fimd>, <&dp>;
	};

In case of using Parallel panel,
	display-subsystem {
		compatible = "samsung,exynos-display-subsystem";
		ports = <&fimd>;
	};

And if you don't add connector device node to ports property,
default parallel panel driver, exynos_drm_dpi module, will be used.

ports property can have the following device nodes,
	fimd, mixer, Image Enhancer, MIPI-DSI, eDP, LVDS Bridge, or HDMI

With this patch, we can resolve the probing order issue without
some global lists. So this patch also removes the unnecessary lists and
stuff related to these lists.

Previous RFC patch,
	 http://www.spinics.net/lists/dri-devel/msg54671.html

Changelog since RFC patch:
- Register sub drivers and probe them at load(). In case of non sub
  drivers, sub driver probe is needed.
- Enable runtime pm at fimd_probe() instead of fimd_bind(). runtime pm
  should be enabled before iommu device is attached to fimd device.
- Do not return an error with component_master_add fail.
- Remove super device support from mipi dsi driver which was in RFC.
- Add super device support to parallel driver.

Changelog v2:
- Add super device support to mipi dsi driver.
- Bind fimd driver only in case that a drm_panel for parallel panel driver
  is added to panel_list of drm_panel module.
- Change super node name to 'display-subsystem'
  . 'exynos-drm' is specific to Linux so change it to generic name.
- Change propery name of super node to 'ports'
  . crtcs and connectors propery names are also specific to Linux so
    change them to generic name.

Changlog v3:
- Do not probe/remove dpi module if fimd node has no port node.

Changelog v4:
- Move some codes for getting resources from each bind function to
  each probe function.
  . if -EPROBE_DEFER is returned at bind context, components will be
    bound and unbound repeatedly by deferred probe feature.

Changelog v5:
- Return error only in case that there is no any compoment attached
  to master.
- Add legacy dt binding support
- Probe vidi driver in exynos_drm_init(), and release vidi driver
  correctly.
- Remove duplicated coherent_dma_mask setting.

Signed-off-by: Inki Dae <inki.dae@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_dp_core.c  |   45 +++--
 drivers/gpu/drm/exynos/exynos_drm_core.c |  216 ++++-------------------
 drivers/gpu/drm/exynos/exynos_drm_crtc.c |   17 ++
 drivers/gpu/drm/exynos/exynos_drm_crtc.h |    4 +
 drivers/gpu/drm/exynos/exynos_drm_dpi.c  |   16 +-
 drivers/gpu/drm/exynos/exynos_drm_drv.c  |  273 ++++++++++++++++++++----------
 drivers/gpu/drm/exynos/exynos_drm_drv.h  |   78 ++++-----
 drivers/gpu/drm/exynos/exynos_drm_dsi.c  |  110 +++++++-----
 drivers/gpu/drm/exynos/exynos_drm_fimd.c |   87 ++++++++--
 drivers/gpu/drm/exynos/exynos_drm_vidi.c |  101 +++++++++--
 drivers/gpu/drm/exynos/exynos_hdmi.c     |   59 ++++---
 drivers/gpu/drm/exynos/exynos_mixer.c    |   54 ++++--
 12 files changed, 616 insertions(+), 444 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_dp_core.c b/drivers/gpu/drm/exynos/exynos_dp_core.c
index aed533b..1cc3981 100644
--- a/drivers/gpu/drm/exynos/exynos_dp_core.c
+++ b/drivers/gpu/drm/exynos/exynos_dp_core.c
@@ -18,6 +18,7 @@
 #include <linux/interrupt.h>
 #include <linux/delay.h>
 #include <linux/of.h>
+#include <linux/component.h>
 #include <linux/phy/phy.h>
 #include <video/of_display_timing.h>
 #include <video/of_videomode.h>
@@ -969,16 +970,6 @@ static struct drm_connector_helper_funcs exynos_dp_connector_helper_funcs = {
 	.best_encoder = exynos_dp_best_encoder,
 };
 
-static int exynos_dp_initialize(struct exynos_drm_display *display,
-				struct drm_device *drm_dev)
-{
-	struct exynos_dp_device *dp = display->ctx;
-
-	dp->drm_dev = drm_dev;
-
-	return 0;
-}
-
 static bool find_bridge(const char *compat, struct bridge_init *bridge)
 {
 	bridge->client = NULL;
@@ -1106,7 +1097,6 @@ static void exynos_dp_dpms(struct exynos_drm_display *display, int mode)
 }
 
 static struct exynos_drm_display_ops exynos_dp_display_ops = {
-	.initialize = exynos_dp_initialize,
 	.create_connector = exynos_dp_create_connector,
 	.dpms = exynos_dp_dpms,
 };
@@ -1230,8 +1220,10 @@ static int exynos_dp_dt_parse_panel(struct exynos_dp_device *dp)
 	return 0;
 }
 
-static int exynos_dp_probe(struct platform_device *pdev)
+static int exynos_dp_bind(struct device *dev, struct device *master, void *data)
 {
+	struct platform_device *pdev = to_platform_device(dev);
+	struct drm_device *drm_dev = data;
 	struct resource *res;
 	struct exynos_dp_device *dp;
 
@@ -1293,21 +1285,40 @@ static int exynos_dp_probe(struct platform_device *pdev)
 	}
 	disable_irq(dp->irq);
 
+	dp->drm_dev = drm_dev;
 	exynos_dp_display.ctx = dp;
 
 	platform_set_drvdata(pdev, &exynos_dp_display);
-	exynos_drm_display_register(&exynos_dp_display);
 
-	return 0;
+	return exynos_drm_create_enc_conn(drm_dev, &exynos_dp_display);
 }
 
-static int exynos_dp_remove(struct platform_device *pdev)
+static void exynos_dp_unbind(struct device *dev, struct device *master,
+				void *data)
 {
-	struct exynos_drm_display *display = platform_get_drvdata(pdev);
+	struct exynos_drm_display *display = dev_get_drvdata(dev);
+	struct exynos_dp_device *dp = display->ctx;
+	struct drm_encoder *encoder = dp->encoder;
 
 	exynos_dp_dpms(display, DRM_MODE_DPMS_OFF);
-	exynos_drm_display_unregister(&exynos_dp_display);
 
+	encoder->funcs->destroy(encoder);
+	drm_connector_cleanup(&dp->connector);
+}
+
+static const struct component_ops exynos_dp_ops = {
+	.bind	= exynos_dp_bind,
+	.unbind	= exynos_dp_unbind,
+};
+
+static int exynos_dp_probe(struct platform_device *pdev)
+{
+	return component_add(&pdev->dev, &exynos_dp_ops);
+}
+
+static int exynos_dp_remove(struct platform_device *pdev)
+{
+	component_del(&pdev->dev, &exynos_dp_ops);
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/exynos/exynos_drm_core.c b/drivers/gpu/drm/exynos/exynos_drm_core.c
index 0e9e06c..4c9f972 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_core.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_core.c
@@ -19,21 +19,19 @@
 #include "exynos_drm_fbdev.h"
 
 static LIST_HEAD(exynos_drm_subdrv_list);
-static LIST_HEAD(exynos_drm_manager_list);
-static LIST_HEAD(exynos_drm_display_list);
 
-static int exynos_drm_create_enc_conn(struct drm_device *dev,
+int exynos_drm_create_enc_conn(struct drm_device *dev,
 					struct exynos_drm_display *display)
 {
 	struct drm_encoder *encoder;
-	struct exynos_drm_manager *manager;
 	int ret;
 	unsigned long possible_crtcs = 0;
 
-	/* Find possible crtcs for this display */
-	list_for_each_entry(manager, &exynos_drm_manager_list, list)
-		if (manager->type == display->type)
-			possible_crtcs |= 1 << manager->pipe;
+	ret = exynos_drm_crtc_get_pipe_from_type(dev, display->type);
+	if (ret < 0)
+		return ret;
+
+	possible_crtcs |= 1 << ret;
 
 	/* create and initialize a encoder for this sub driver. */
 	encoder = exynos_drm_encoder_create(dev, display, possible_crtcs);
@@ -57,127 +55,29 @@ err_destroy_encoder:
 	return ret;
 }
 
-static int exynos_drm_subdrv_probe(struct drm_device *dev,
-					struct exynos_drm_subdrv *subdrv)
-{
-	if (subdrv->probe) {
-		int ret;
-
-		subdrv->drm_dev = dev;
-
-		/*
-		 * this probe callback would be called by sub driver
-		 * after setting of all resources to this sub driver,
-		 * such as clock, irq and register map are done or by load()
-		 * of exynos drm driver.
-		 *
-		 * P.S. note that this driver is considered for modularization.
-		 */
-		ret = subdrv->probe(dev, subdrv->dev);
-		if (ret)
-			return ret;
-	}
-
-	return 0;
-}
-
-static void exynos_drm_subdrv_remove(struct drm_device *dev,
-				      struct exynos_drm_subdrv *subdrv)
-{
-	if (subdrv->remove)
-		subdrv->remove(dev, subdrv->dev);
-}
-
-int exynos_drm_initialize_managers(struct drm_device *dev)
+int exynos_drm_subdrv_register(struct exynos_drm_subdrv *subdrv)
 {
-	struct exynos_drm_manager *manager, *n;
-	int ret, pipe = 0;
-
-	list_for_each_entry(manager, &exynos_drm_manager_list, list) {
-		if (manager->ops->initialize) {
-			ret = manager->ops->initialize(manager, dev, pipe);
-			if (ret) {
-				DRM_ERROR("Mgr init [%d] failed with %d\n",
-						manager->type, ret);
-				goto err;
-			}
-		}
+	if (!subdrv)
+		return -EINVAL;
 
-		manager->drm_dev = dev;
-		manager->pipe = pipe++;
+	list_add_tail(&subdrv->list, &exynos_drm_subdrv_list);
 
-		ret = exynos_drm_crtc_create(manager);
-		if (ret) {
-			DRM_ERROR("CRTC create [%d] failed with %d\n",
-					manager->type, ret);
-			goto err;
-		}
-	}
 	return 0;
-
-err:
-	list_for_each_entry_safe(manager, n, &exynos_drm_manager_list, list) {
-		if (pipe-- > 0)
-			exynos_drm_manager_unregister(manager);
-		else
-			list_del(&manager->list);
-	}
-	return ret;
-}
-
-void exynos_drm_remove_managers(struct drm_device *dev)
-{
-	struct exynos_drm_manager *manager, *n;
-
-	list_for_each_entry_safe(manager, n, &exynos_drm_manager_list, list)
-		exynos_drm_manager_unregister(manager);
 }
+EXPORT_SYMBOL_GPL(exynos_drm_subdrv_register);
 
-int exynos_drm_initialize_displays(struct drm_device *dev)
+int exynos_drm_subdrv_unregister(struct exynos_drm_subdrv *subdrv)
 {
-	struct exynos_drm_display *display, *n;
-	int ret, initialized = 0;
-
-	list_for_each_entry(display, &exynos_drm_display_list, list) {
-		if (display->ops->initialize) {
-			ret = display->ops->initialize(display, dev);
-			if (ret) {
-				DRM_ERROR("Display init [%d] failed with %d\n",
-						display->type, ret);
-				goto err;
-			}
-		}
+	if (!subdrv)
+		return -EINVAL;
 
-		initialized++;
+	list_del(&subdrv->list);
 
-		ret = exynos_drm_create_enc_conn(dev, display);
-		if (ret) {
-			DRM_ERROR("Encoder create [%d] failed with %d\n",
-					display->type, ret);
-			goto err;
-		}
-	}
 	return 0;
-
-err:
-	list_for_each_entry_safe(display, n, &exynos_drm_display_list, list) {
-		if (initialized-- > 0)
-			exynos_drm_display_unregister(display);
-		else
-			list_del(&display->list);
-	}
-	return ret;
-}
-
-void exynos_drm_remove_displays(struct drm_device *dev)
-{
-	struct exynos_drm_display *display, *n;
-
-	list_for_each_entry_safe(display, n, &exynos_drm_display_list, list)
-		exynos_drm_display_unregister(display);
 }
+EXPORT_SYMBOL_GPL(exynos_drm_subdrv_unregister);
 
-int exynos_drm_device_register(struct drm_device *dev)
+int exynos_drm_device_subdrv_probe(struct drm_device *dev)
 {
 	struct exynos_drm_subdrv *subdrv, *n;
 	int err;
@@ -186,19 +86,28 @@ int exynos_drm_device_register(struct drm_device *dev)
 		return -EINVAL;
 
 	list_for_each_entry_safe(subdrv, n, &exynos_drm_subdrv_list, list) {
-		err = exynos_drm_subdrv_probe(dev, subdrv);
-		if (err) {
-			DRM_DEBUG("exynos drm subdrv probe failed.\n");
-			list_del(&subdrv->list);
-			continue;
+		if (subdrv->probe) {
+			subdrv->drm_dev = dev;
+
+			/*
+			 * this probe callback would be called by sub driver
+			 * after setting of all resources to this sub driver,
+			 * such as clock, irq and register map are done.
+			 */
+			err = subdrv->probe(dev, subdrv->dev);
+			if (err) {
+				DRM_DEBUG("exynos drm subdrv probe failed.\n");
+				list_del(&subdrv->list);
+				continue;
+			}
 		}
 	}
 
 	return 0;
 }
-EXPORT_SYMBOL_GPL(exynos_drm_device_register);
+EXPORT_SYMBOL_GPL(exynos_drm_device_subdrv_probe);
 
-int exynos_drm_device_unregister(struct drm_device *dev)
+int exynos_drm_device_subdrv_remove(struct drm_device *dev)
 {
 	struct exynos_drm_subdrv *subdrv;
 
@@ -208,66 +117,13 @@ int exynos_drm_device_unregister(struct drm_device *dev)
 	}
 
 	list_for_each_entry(subdrv, &exynos_drm_subdrv_list, list) {
-		exynos_drm_subdrv_remove(dev, subdrv);
+		if (subdrv->remove)
+			subdrv->remove(dev, subdrv->dev);
 	}
 
 	return 0;
 }
-EXPORT_SYMBOL_GPL(exynos_drm_device_unregister);
-
-int exynos_drm_manager_register(struct exynos_drm_manager *manager)
-{
-	BUG_ON(!manager->ops);
-	list_add_tail(&manager->list, &exynos_drm_manager_list);
-	return 0;
-}
-
-int exynos_drm_manager_unregister(struct exynos_drm_manager *manager)
-{
-	if (manager->ops->remove)
-		manager->ops->remove(manager);
-
-	list_del(&manager->list);
-	return 0;
-}
-
-int exynos_drm_display_register(struct exynos_drm_display *display)
-{
-	BUG_ON(!display->ops);
-	list_add_tail(&display->list, &exynos_drm_display_list);
-	return 0;
-}
-
-int exynos_drm_display_unregister(struct exynos_drm_display *display)
-{
-	if (display->ops->remove)
-		display->ops->remove(display);
-
-	list_del(&display->list);
-	return 0;
-}
-
-int exynos_drm_subdrv_register(struct exynos_drm_subdrv *subdrv)
-{
-	if (!subdrv)
-		return -EINVAL;
-
-	list_add_tail(&subdrv->list, &exynos_drm_subdrv_list);
-
-	return 0;
-}
-EXPORT_SYMBOL_GPL(exynos_drm_subdrv_register);
-
-int exynos_drm_subdrv_unregister(struct exynos_drm_subdrv *subdrv)
-{
-	if (!subdrv)
-		return -EINVAL;
-
-	list_del(&subdrv->list);
-
-	return 0;
-}
-EXPORT_SYMBOL_GPL(exynos_drm_subdrv_unregister);
+EXPORT_SYMBOL_GPL(exynos_drm_device_subdrv_remove);
 
 int exynos_drm_subdrv_open(struct drm_device *dev, struct drm_file *file)
 {
diff --git a/drivers/gpu/drm/exynos/exynos_drm_crtc.c b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
index e930d4f..36a80d9 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_crtc.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
@@ -367,6 +367,7 @@ int exynos_drm_crtc_create(struct exynos_drm_manager *manager)
 		return -ENOMEM;
 	}
 
+	manager->crtc = &exynos_crtc->drm_crtc;
 	crtc = &exynos_crtc->drm_crtc;
 
 	private->crtc[manager->pipe] = crtc;
@@ -490,3 +491,19 @@ void exynos_drm_crtc_complete_scanout(struct drm_framebuffer *fb)
 			manager->ops->wait_for_vblank(manager);
 	}
 }
+
+int exynos_drm_crtc_get_pipe_from_type(struct drm_device *drm_dev,
+					unsigned int out_type)
+{
+	struct drm_crtc *crtc;
+
+	list_for_each_entry(crtc, &drm_dev->mode_config.crtc_list, head) {
+		struct exynos_drm_crtc *exynos_crtc;
+
+		exynos_crtc = to_exynos_crtc(crtc);
+		if (exynos_crtc->manager->type == out_type)
+			return exynos_crtc->manager->pipe;
+	}
+
+	return -EPERM;
+}
diff --git a/drivers/gpu/drm/exynos/exynos_drm_crtc.h b/drivers/gpu/drm/exynos/exynos_drm_crtc.h
index c27b66c..9f74b10 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_crtc.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_crtc.h
@@ -32,4 +32,8 @@ void exynos_drm_crtc_plane_commit(struct drm_crtc *crtc, int zpos);
 void exynos_drm_crtc_plane_enable(struct drm_crtc *crtc, int zpos);
 void exynos_drm_crtc_plane_disable(struct drm_crtc *crtc, int zpos);
 
+/* This function gets pipe value to crtc device matched with out_type. */
+int exynos_drm_crtc_get_pipe_from_type(struct drm_device *drm_dev,
+					unsigned int out_type);
+
 #endif
diff --git a/drivers/gpu/drm/exynos/exynos_drm_dpi.c b/drivers/gpu/drm/exynos/exynos_drm_dpi.c
index 2b09c7c..c1f4b35 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dpi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dpi.c
@@ -255,7 +255,7 @@ enum {
 	FIMD_PORT_WRB,
 };
 
-static struct device_node *exynos_dpi_of_find_panel_node(struct device *dev)
+struct device_node *exynos_dpi_of_find_panel_node(struct device *dev)
 {
 	struct device_node *np, *ep;
 
@@ -308,7 +308,7 @@ static int exynos_dpi_parse_dt(struct exynos_dpi *ctx)
 	return 0;
 }
 
-int exynos_dpi_probe(struct device *dev)
+int exynos_dpi_probe(struct drm_device *drm_dev, struct device *dev)
 {
 	struct exynos_dpi *ctx;
 	int ret;
@@ -325,15 +325,17 @@ int exynos_dpi_probe(struct device *dev)
 	if (ret < 0)
 		return ret;
 
-	exynos_drm_display_register(&exynos_dpi_display);
-
-	return 0;
+	return exynos_drm_create_enc_conn(drm_dev, &exynos_dpi_display);
 }
 
-int exynos_dpi_remove(struct device *dev)
+int exynos_dpi_remove(struct drm_device *drm_dev, struct device *dev)
 {
+	struct drm_encoder *encoder = exynos_dpi_display.encoder;
+	struct exynos_dpi *ctx = exynos_dpi_display.ctx;
+
 	exynos_dpi_dpms(&exynos_dpi_display, DRM_MODE_DPMS_OFF);
-	exynos_drm_display_unregister(&exynos_dpi_display);
+	encoder->funcs->destroy(encoder);
+	drm_connector_cleanup(&ctx->connector);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/gpu/drm/exynos/exynos_drm_drv.c
index 2d27ba2..63dabba 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
@@ -16,6 +16,7 @@
 #include <drm/drm_crtc_helper.h>
 
 #include <linux/anon_inodes.h>
+#include <linux/component.h>
 
 #include <drm/exynos_drm.h>
 
@@ -40,7 +41,6 @@
 
 #define VBLANK_OFF_DELAY	50000
 
-/* platform device pointer for eynos drm device. */
 static struct platform_device *exynos_drm_pdev;
 
 static int exynos_drm_load(struct drm_device *dev, unsigned long flags)
@@ -73,38 +73,21 @@ static int exynos_drm_load(struct drm_device *dev, unsigned long flags)
 
 	exynos_drm_mode_config_init(dev);
 
-	ret = exynos_drm_initialize_managers(dev);
-	if (ret)
-		goto err_mode_config_cleanup;
-
 	for (nr = 0; nr < MAX_PLANE; nr++) {
 		struct drm_plane *plane;
 		unsigned long possible_crtcs = (1 << MAX_CRTC) - 1;
 
 		plane = exynos_plane_init(dev, possible_crtcs, false);
 		if (!plane)
-			goto err_manager_cleanup;
+			goto err_mode_config_cleanup;
 	}
 
-	ret = exynos_drm_initialize_displays(dev);
-	if (ret)
-		goto err_manager_cleanup;
-
 	/* init kms poll for handling hpd */
 	drm_kms_helper_poll_init(dev);
 
 	ret = drm_vblank_init(dev, MAX_CRTC);
 	if (ret)
-		goto err_display_cleanup;
-
-	/*
-	 * probe sub drivers such as display controller and hdmi driver,
-	 * that were registered at probe() of platform driver
-	 * to the sub driver and create encoder and connector for them.
-	 */
-	ret = exynos_drm_device_register(dev);
-	if (ret)
-		goto err_vblank;
+		goto err_mode_config_cleanup;
 
 	/* setup possible_clones. */
 	exynos_drm_encoder_setup(dev);
@@ -113,17 +96,25 @@ static int exynos_drm_load(struct drm_device *dev, unsigned long flags)
 
 	platform_set_drvdata(dev->platformdev, dev);
 
+	/* Try to bind all sub drivers. */
+	ret = component_bind_all(dev->dev, dev);
+	if (ret)
+		goto err_cleanup_vblank;
+
+	/* Probe non kms sub drivers. */
+	ret = exynos_drm_device_subdrv_probe(dev);
+	if (ret)
+		goto err_unbind_all;
+
 	/* force connectors detection */
 	drm_helper_hpd_irq_event(dev);
 
 	return 0;
 
-err_vblank:
+err_unbind_all:
+	component_unbind_all(dev->dev, dev);
+err_cleanup_vblank:
 	drm_vblank_cleanup(dev);
-err_display_cleanup:
-	exynos_drm_remove_displays(dev);
-err_manager_cleanup:
-	exynos_drm_remove_managers(dev);
 err_mode_config_cleanup:
 	drm_mode_config_cleanup(dev);
 	drm_release_iommu_mapping(dev);
@@ -135,17 +126,17 @@ err_free_private:
 
 static int exynos_drm_unload(struct drm_device *dev)
 {
+	exynos_drm_device_subdrv_remove(dev);
+
 	exynos_drm_fbdev_fini(dev);
-	exynos_drm_device_unregister(dev);
 	drm_vblank_cleanup(dev);
 	drm_kms_helper_poll_fini(dev);
-	exynos_drm_remove_displays(dev);
-	exynos_drm_remove_managers(dev);
 	drm_mode_config_cleanup(dev);
 
 	drm_release_iommu_mapping(dev);
 	kfree(dev->dev_private);
 
+	component_unbind_all(dev->dev, dev);
 	dev->dev_private = NULL;
 
 	return 0;
@@ -355,27 +346,6 @@ static struct drm_driver exynos_drm_driver = {
 	.minor	= DRIVER_MINOR,
 };
 
-static int exynos_drm_platform_probe(struct platform_device *pdev)
-{
-	int ret;
-
-	ret = dma_set_coherent_mask(&pdev->dev, DMA_BIT_MASK(32));
-	if (ret)
-		return ret;
-
-	pm_runtime_enable(&pdev->dev);
-	pm_runtime_get_sync(&pdev->dev);
-
-	return drm_platform_init(&exynos_drm_driver, pdev);
-}
-
-static int exynos_drm_platform_remove(struct platform_device *pdev)
-{
-	drm_put_dev(platform_get_drvdata(pdev));
-
-	return 0;
-}
-
 #ifdef CONFIG_PM_SLEEP
 static int exynos_drm_sys_suspend(struct device *dev)
 {
@@ -430,20 +400,105 @@ static const struct dev_pm_ops exynos_drm_pm_ops = {
 			exynos_drm_runtime_resume, NULL)
 };
 
-static struct platform_driver exynos_drm_platform_driver = {
-	.probe		= exynos_drm_platform_probe,
-	.remove		= exynos_drm_platform_remove,
-	.driver		= {
-		.owner	= THIS_MODULE,
-		.name	= "exynos-drm",
-		.pm	= &exynos_drm_pm_ops,
-	},
+static int compare_of(struct device *dev, void *data)
+{
+	return dev->of_node == data;
+}
+
+static int exynos_drm_bind_lagacy_dt(struct device *dev, struct master *m)
+{
+	const char *compatible_tbls[] =
+			{ "samsung,exynos4210-fimd",
+			  "samsung,exynos5250-fimd",
+			  "samsung,exynos4210-mipi-dsi",
+			  "samsung,exynos5-dp",
+			  "samsung,exynos4212-hdmi",
+			  "samsung,exynos5250-mixer",
+			  "samsung,exynos5420-mixer",
+			};
+	unsigned int attached_cnt = 0;
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(compatible_tbls); i++) {
+		struct device_node *node;
+		int ret;
+
+		node = of_find_compatible_node(NULL, NULL,
+				compatible_tbls[i]);
+
+		ret = of_device_is_available(node);
+		if (!ret)
+			continue;
+
+		ret = component_master_add_child(m, compare_of, node);
+		of_node_put(node);
+
+		if (!ret)
+			attached_cnt++;
+	}
+
+	if (!attached_cnt)
+		return -ENXIO;
+
+	return 0;
+}
+
+static int exynos_drm_add_components(struct device *dev, struct master *m)
+{
+	struct device_node *np = dev->of_node;
+	unsigned int attached_cnt = 0;
+	unsigned int i;
+
+	if (!dev->of_node)
+		return exynos_drm_bind_lagacy_dt(dev, m);
+
+	for (i = 0;; i++) {
+		struct device_node *node;
+		int ret;
+
+		node = of_parse_phandle(np, "ports", i);
+		if (!node)
+			break;
+
+		ret = component_master_add_child(m, compare_of, node);
+		of_node_put(node);
+
+		if (!ret)
+			attached_cnt++;
+	}
+
+	if (!attached_cnt)
+		return -ENXIO;
+
+	return 0;
+}
+
+static int exynos_drm_bind(struct device *dev)
+{
+	pm_runtime_enable(dev);
+	pm_runtime_get_sync(dev);
+
+	return drm_platform_init(&exynos_drm_driver, to_platform_device(dev));
+}
+
+static void exynos_drm_unbind(struct device *dev)
+{
+	drm_put_dev(dev_get_drvdata(dev));
+}
+
+static const struct component_master_ops exynos_drm_ops = {
+	.add_components = exynos_drm_add_components,
+	.bind		= exynos_drm_bind,
+	.unbind		= exynos_drm_unbind,
 };
 
-static int __init exynos_drm_init(void)
+static int exynos_drm_platform_probe(struct platform_device *pdev)
 {
 	int ret;
 
+	pdev->dev.coherent_dma_mask = DMA_BIT_MASK(32);
+	exynos_drm_driver.num_ioctls = DRM_ARRAY_SIZE(exynos_ioctls);
+
 #ifdef CONFIG_DRM_EXYNOS_DP
 	ret = platform_driver_register(&dp_driver);
 	if (ret < 0)
@@ -471,12 +526,6 @@ static int __init exynos_drm_init(void)
 		goto out_mixer;
 #endif
 
-#ifdef CONFIG_DRM_EXYNOS_VIDI
-	ret = platform_driver_register(&vidi_driver);
-	if (ret < 0)
-		goto out_vidi;
-#endif
-
 #ifdef CONFIG_DRM_EXYNOS_G2D
 	ret = platform_driver_register(&g2d_driver);
 	if (ret < 0)
@@ -511,23 +560,12 @@ static int __init exynos_drm_init(void)
 		goto out_ipp_dev;
 #endif
 
-	ret = platform_driver_register(&exynos_drm_platform_driver);
+	ret = component_master_add(&pdev->dev, &exynos_drm_ops);
 	if (ret < 0)
-		goto out_drm;
-
-	exynos_drm_pdev = platform_device_register_simple("exynos-drm", -1,
-				NULL, 0);
-	if (IS_ERR(exynos_drm_pdev)) {
-		ret = PTR_ERR(exynos_drm_pdev);
-		goto out;
-	}
+		DRM_DEBUG_KMS("re-tried by last sub driver probed later.\n");
 
 	return 0;
 
-out:
-	platform_driver_unregister(&exynos_drm_platform_driver);
-
-out_drm:
 #ifdef CONFIG_DRM_EXYNOS_IPP
 	exynos_platform_device_ipp_unregister();
 out_ipp_dev:
@@ -555,11 +593,6 @@ out_fimc:
 out_g2d:
 #endif
 
-#ifdef CONFIG_DRM_EXYNOS_VIDI
-	platform_driver_unregister(&vidi_driver);
-out_vidi:
-#endif
-
 #ifdef CONFIG_DRM_EXYNOS_HDMI
 	platform_driver_unregister(&mixer_driver);
 out_mixer:
@@ -584,12 +617,8 @@ out_dp:
 	return ret;
 }
 
-static void __exit exynos_drm_exit(void)
+static int exynos_drm_platform_remove(struct platform_device *pdev)
 {
-	platform_device_unregister(exynos_drm_pdev);
-
-	platform_driver_unregister(&exynos_drm_platform_driver);
-
 #ifdef CONFIG_DRM_EXYNOS_IPP
 	exynos_platform_device_ipp_unregister();
 	platform_driver_unregister(&ipp_driver);
@@ -616,10 +645,6 @@ static void __exit exynos_drm_exit(void)
 	platform_driver_unregister(&hdmi_driver);
 #endif
 
-#ifdef CONFIG_DRM_EXYNOS_VIDI
-	platform_driver_unregister(&vidi_driver);
-#endif
-
 #ifdef CONFIG_DRM_EXYNOS_FIMD
 	platform_driver_unregister(&fimd_driver);
 #endif
@@ -631,6 +656,72 @@ static void __exit exynos_drm_exit(void)
 #ifdef CONFIG_DRM_EXYNOS_DP
 	platform_driver_unregister(&dp_driver);
 #endif
+	component_master_del(&pdev->dev, &exynos_drm_ops);
+	return 0;
+}
+
+static const struct of_device_id exynos_drm_dt_match[] = {
+	{ .compatible = "samsung,exynos-display-subsystem", },
+	{},
+};
+
+MODULE_DEVICE_TABLE(of, exynos_drm_dt_match);
+
+static struct platform_driver exynos_drm_platform_driver = {
+	.probe	= exynos_drm_platform_probe,
+	.remove	= exynos_drm_platform_remove,
+	.driver	= {
+		.owner	= THIS_MODULE,
+		.name	= "exynos-drm",
+		.pm	= &exynos_drm_pm_ops,
+		.of_match_table	= exynos_drm_dt_match,
+	},
+};
+
+static int exynos_drm_init(void)
+{
+	const char *name = "samsung,exynos-display-subsystem";
+	struct device_node *node;
+	int ret;
+
+	node = of_find_compatible_node(NULL, NULL, name);
+	if (!node) {
+		exynos_drm_pdev = platform_device_register_simple("exynos-drm",
+				-1, NULL, 0);
+		if (IS_ERR(exynos_drm_pdev))
+			return PTR_ERR(exynos_drm_pdev);
+	}
+
+#ifdef CONFIG_DRM_EXYNOS_VIDI
+	ret = exynos_drm_probe_vidi();
+	if (ret < 0)
+		goto err_unregister_pd;
+#endif
+
+	ret = platform_driver_register(&exynos_drm_platform_driver);
+	if (ret)
+		goto err_remove_vidi;
+
+	return 0;
+
+err_unregister_pd:
+	platform_device_unregister(exynos_drm_pdev);
+
+err_remove_vidi:
+#ifdef CONFIG_DRM_EXYNOS_VIDI
+	exynos_drm_remove_vidi();
+#endif
+
+	return ret;
+}
+
+static void exynos_drm_exit(void)
+{
+#ifdef CONFIG_DRM_EXYNOS_VIDI
+	exynos_drm_remove_vidi();
+#endif
+	platform_device_unregister(exynos_drm_pdev);
+	platform_driver_unregister(&exynos_drm_platform_driver);
 }
 
 module_init(exynos_drm_init);
diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.h b/drivers/gpu/drm/exynos/exynos_drm_drv.h
index 4c5cf68..a589dfb 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.h
@@ -122,7 +122,6 @@ struct exynos_drm_overlay {
  * Exynos DRM Display Structure.
  *	- this structure is common to analog tv, digital tv and lcd panel.
  *
- * @initialize: initializes the display with drm_dev
  * @remove: cleans up the display for removal
  * @mode_fixup: fix mode data comparing to hw specific display mode.
  * @mode_set: convert drm_display_mode to hw specific display mode and
@@ -133,8 +132,6 @@ struct exynos_drm_overlay {
  */
 struct exynos_drm_display;
 struct exynos_drm_display_ops {
-	int (*initialize)(struct exynos_drm_display *display,
-				struct drm_device *drm_dev);
 	int (*create_connector)(struct exynos_drm_display *display,
 				struct drm_encoder *encoder);
 	void (*remove)(struct exynos_drm_display *display);
@@ -172,8 +169,6 @@ struct exynos_drm_display {
 /*
  * Exynos drm manager ops
  *
- * @initialize: initializes the manager with drm_dev
- * @remove: cleans up the manager for removal
  * @dpms: control device power.
  * @mode_fixup: fix mode data before applying it
  * @mode_set: set the given mode to the manager
@@ -189,9 +184,6 @@ struct exynos_drm_display {
  */
 struct exynos_drm_manager;
 struct exynos_drm_manager_ops {
-	int (*initialize)(struct exynos_drm_manager *mgr,
-				struct drm_device *drm_dev, int pipe);
-	void (*remove)(struct exynos_drm_manager *mgr);
 	void (*dpms)(struct exynos_drm_manager *mgr, int mode);
 	bool (*mode_fixup)(struct exynos_drm_manager *mgr,
 				const struct drm_display_mode *mode,
@@ -215,6 +207,7 @@ struct exynos_drm_manager_ops {
  * @list: the list entry for this manager
  * @type: one of EXYNOS_DISPLAY_TYPE_LCD and HDMI.
  * @drm_dev: pointer to the drm device
+ * @crtc: crtc object.
  * @pipe: the pipe number for this crtc/manager
  * @ops: pointer to callbacks for exynos drm specific functionality
  * @ctx: A pointer to the manager's implementation specific context
@@ -223,6 +216,7 @@ struct exynos_drm_manager {
 	struct list_head list;
 	enum exynos_drm_output_type type;
 	struct drm_device *drm_dev;
+	struct drm_crtc *crtc;
 	int pipe;
 	struct exynos_drm_manager_ops *ops;
 	void *ctx;
@@ -255,6 +249,7 @@ struct drm_exynos_file_private {
  * @da_space_size: size of device address space.
  *	if 0 then default value is used for it.
  * @da_space_order: order to device address space.
+ * @pipe: the pipe number for this crtc/manager.
  */
 struct exynos_drm_private {
 	struct drm_fb_helper *fb_helper;
@@ -273,6 +268,8 @@ struct exynos_drm_private {
 	unsigned long da_start;
 	unsigned long da_space_size;
 	unsigned long da_space_order;
+
+	unsigned int pipe;
 };
 
 /*
@@ -283,11 +280,11 @@ struct exynos_drm_private {
  * @drm_dev: pointer to drm_device and this pointer would be set
  *	when sub driver calls exynos_drm_subdrv_register().
  * @manager: subdrv has its own manager to control a hardware appropriately
- *	and we can access a hardware drawing on this manager.
+ *     and we can access a hardware drawing on this manager.
  * @probe: this callback would be called by exynos drm driver after
- *	subdrv is registered to it.
+ *     subdrv is registered to it.
  * @remove: this callback is used to release resources created
- *	by probe callback.
+ *     by probe callback.
  * @open: this would be called with drm device file open.
  * @close: this would be called with drm device file close.
  */
@@ -304,39 +301,14 @@ struct exynos_drm_subdrv {
 			struct drm_file *file);
 };
 
-/*
- * this function calls a probe callback registered to sub driver list and
- * create its own encoder and connector and then set drm_device object
- * to global one.
- */
-int exynos_drm_device_register(struct drm_device *dev);
-/*
- * this function calls a remove callback registered to sub driver list and
- * destroy its own encoder and connetor.
- */
-int exynos_drm_device_unregister(struct drm_device *dev);
-
-int exynos_drm_initialize_managers(struct drm_device *dev);
-void exynos_drm_remove_managers(struct drm_device *dev);
-int exynos_drm_initialize_displays(struct drm_device *dev);
-void exynos_drm_remove_displays(struct drm_device *dev);
-
-int exynos_drm_manager_register(struct exynos_drm_manager *manager);
-int exynos_drm_manager_unregister(struct exynos_drm_manager *manager);
-int exynos_drm_display_register(struct exynos_drm_display *display);
-int exynos_drm_display_unregister(struct exynos_drm_display *display);
-
-/*
- * this function would be called by sub drivers such as display controller
- * or hdmi driver to register this sub driver object to exynos drm driver
- * and when a sub driver is registered to exynos drm driver a probe callback
- * of the sub driver is called and creates its own encoder and connector.
- */
+ /* This function would be called by non kms drivers such as g2d and ipp. */
 int exynos_drm_subdrv_register(struct exynos_drm_subdrv *drm_subdrv);
 
 /* this function removes subdrv list from exynos drm driver */
 int exynos_drm_subdrv_unregister(struct exynos_drm_subdrv *drm_subdrv);
 
+int exynos_drm_device_subdrv_probe(struct drm_device *dev);
+int exynos_drm_device_subdrv_remove(struct drm_device *dev);
 int exynos_drm_subdrv_open(struct drm_device *dev, struct drm_file *file);
 void exynos_drm_subdrv_close(struct drm_device *dev, struct drm_file *file);
 
@@ -362,13 +334,33 @@ int exynos_platform_device_ipp_register(void);
 void exynos_platform_device_ipp_unregister(void);
 
 #ifdef CONFIG_DRM_EXYNOS_DPI
-int exynos_dpi_probe(struct device *dev);
-int exynos_dpi_remove(struct device *dev);
+int exynos_dpi_probe(struct drm_device *drm_dev, struct device *dev);
+int exynos_dpi_remove(struct drm_device *drm_dev, struct device *dev);
+struct device_node *exynos_dpi_of_find_panel_node(struct device *dev);
 #else
-static inline int exynos_dpi_probe(struct device *dev) { return 0; }
-static inline int exynos_dpi_remove(struct device *dev) { return 0; }
+static inline int exynos_dpi_probe(struct drm_device *drm_dev,
+					struct device *dev) { return 0; }
+static inline int exynos_dpi_remove(struct drm_device *drm_dev,
+					struct device *dev) { return 0; }
+static inline struct device_node
+			*exynos_dpi_of_find_panel_node(struct device *dev)
+{ return NULL; }
 #endif
 
+/*
+ * this function registers exynos drm vidi platform device/driver.
+ */
+int exynos_drm_probe_vidi(void);
+
+/*
+ * this function unregister exynos drm vidi platform device/driver.
+ */
+void exynos_drm_remove_vidi(void);
+
+/* This function creates a encoder and a connector, and initializes them. */
+int exynos_drm_create_enc_conn(struct drm_device *dev,
+				struct exynos_drm_display *display);
+
 extern struct platform_driver dp_driver;
 extern struct platform_driver dsi_driver;
 extern struct platform_driver fimd_driver;
diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index eb73e3b..36857b0 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -19,6 +19,7 @@
 #include <linux/irq.h>
 #include <linux/phy/phy.h>
 #include <linux/regulator/consumer.h>
+#include <linux/component.h>
 
 #include <video/mipi_display.h>
 #include <video/videomode.h>
@@ -1378,6 +1379,74 @@ end:
 	return ret;
 }
 
+static int exynos_dsi_bind(struct device *dev, struct device *master,
+				void *data)
+{
+	struct drm_device *drm_dev = data;
+	struct exynos_dsi *dsi;
+	int ret;
+
+	ret = exynos_drm_create_enc_conn(drm_dev, &exynos_dsi_display);
+	if (ret) {
+		DRM_ERROR("Encoder create [%d] failed with %d\n",
+				exynos_dsi_display.type, ret);
+		return ret;
+	}
+
+	dsi = exynos_dsi_display.ctx;
+
+	return mipi_dsi_host_register(&dsi->dsi_host);
+}
+
+static void exynos_dsi_unbind(struct device *dev, struct device *master,
+				void *data)
+{
+	struct exynos_dsi *dsi = exynos_dsi_display.ctx;
+	struct drm_encoder *encoder = dsi->encoder;
+
+	exynos_dsi_dpms(&exynos_dsi_display, DRM_MODE_DPMS_OFF);
+
+	mipi_dsi_host_unregister(&dsi->dsi_host);
+
+	encoder->funcs->destroy(encoder);
+	drm_connector_cleanup(&dsi->connector);
+}
+
+#if CONFIG_PM_SLEEP
+static int exynos_dsi_resume(struct device *dev)
+{
+	struct exynos_dsi *dsi = exynos_dsi_display.ctx;
+
+	if (dsi->state & DSIM_STATE_ENABLED) {
+		dsi->state &= ~DSIM_STATE_ENABLED;
+		exynos_dsi_enable(dsi);
+	}
+
+	return 0;
+}
+
+static int exynos_dsi_suspend(struct device *dev)
+{
+	struct exynos_dsi *dsi = exynos_dsi_display.ctx;
+
+	if (dsi->state & DSIM_STATE_ENABLED) {
+		exynos_dsi_disable(dsi);
+		dsi->state |= DSIM_STATE_ENABLED;
+	}
+
+	return 0;
+}
+#endif
+
+static const struct dev_pm_ops exynos_dsi_pm_ops = {
+	SET_SYSTEM_SLEEP_PM_OPS(exynos_dsi_suspend, exynos_dsi_resume)
+};
+
+static const struct component_ops exynos_dsi_component_ops = {
+	.bind	= exynos_dsi_bind,
+	.unbind	= exynos_dsi_unbind,
+};
+
 static int exynos_dsi_probe(struct platform_device *pdev)
 {
 	struct resource *res;
@@ -1455,53 +1524,16 @@ static int exynos_dsi_probe(struct platform_device *pdev)
 	exynos_dsi_display.ctx = dsi;
 
 	platform_set_drvdata(pdev, &exynos_dsi_display);
-	exynos_drm_display_register(&exynos_dsi_display);
 
-	return mipi_dsi_host_register(&dsi->dsi_host);
+	return component_add(&pdev->dev, &exynos_dsi_component_ops);
 }
 
 static int exynos_dsi_remove(struct platform_device *pdev)
 {
-	struct exynos_dsi *dsi = exynos_dsi_display.ctx;
-
-	exynos_dsi_dpms(&exynos_dsi_display, DRM_MODE_DPMS_OFF);
-
-	exynos_drm_display_unregister(&exynos_dsi_display);
-	mipi_dsi_host_unregister(&dsi->dsi_host);
-
+	component_del(&pdev->dev, &exynos_dsi_component_ops);
 	return 0;
 }
 
-#if CONFIG_PM_SLEEP
-static int exynos_dsi_resume(struct device *dev)
-{
-	struct exynos_dsi *dsi = exynos_dsi_display.ctx;
-
-	if (dsi->state & DSIM_STATE_ENABLED) {
-		dsi->state &= ~DSIM_STATE_ENABLED;
-		exynos_dsi_enable(dsi);
-	}
-
-	return 0;
-}
-
-static int exynos_dsi_suspend(struct device *dev)
-{
-	struct exynos_dsi *dsi = exynos_dsi_display.ctx;
-
-	if (dsi->state & DSIM_STATE_ENABLED) {
-		exynos_dsi_disable(dsi);
-		dsi->state |= DSIM_STATE_ENABLED;
-	}
-
-	return 0;
-}
-#endif
-
-static const struct dev_pm_ops exynos_dsi_pm_ops = {
-	SET_SYSTEM_SLEEP_PM_OPS(exynos_dsi_suspend, exynos_dsi_resume)
-};
-
 static struct of_device_id exynos_dsi_of_match[] = {
 	{ .compatible = "samsung,exynos4210-mipi-dsi" },
 	{ }
diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
index 40fd6cc..b26b27e 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
@@ -19,10 +19,12 @@
 #include <linux/of.h>
 #include <linux/of_device.h>
 #include <linux/pm_runtime.h>
+#include <linux/component.h>
 
 #include <video/of_display_timing.h>
 #include <video/of_videomode.h>
 #include <video/samsung_fimd.h>
+#include <drm/drm_panel.h>
 #include <drm/exynos_drm.h>
 
 #include "exynos_drm_drv.h"
@@ -144,12 +146,14 @@ static inline struct fimd_driver_data *drm_fimd_get_driver_data(
 }
 
 static int fimd_mgr_initialize(struct exynos_drm_manager *mgr,
-			struct drm_device *drm_dev, int pipe)
+			struct drm_device *drm_dev)
 {
 	struct fimd_context *ctx = mgr->ctx;
+	struct exynos_drm_private *priv;
+	priv = drm_dev->dev_private;
 
-	ctx->drm_dev = drm_dev;
-	ctx->pipe = pipe;
+	mgr->drm_dev = ctx->drm_dev = drm_dev;
+	mgr->pipe = ctx->pipe = priv->pipe++;
 
 	/*
 	 * enable drm irq mode.
@@ -803,8 +807,6 @@ static void fimd_dpms(struct exynos_drm_manager *mgr, int mode)
 }
 
 static struct exynos_drm_manager_ops fimd_manager_ops = {
-	.initialize = fimd_mgr_initialize,
-	.remove = fimd_mgr_remove,
 	.dpms = fimd_dpms,
 	.mode_fixup = fimd_mode_fixup,
 	.mode_set = fimd_mode_set,
@@ -849,10 +851,12 @@ out:
 	return IRQ_HANDLED;
 }
 
-static int fimd_probe(struct platform_device *pdev)
+static int fimd_bind(struct device *dev, struct device *master, void *data)
 {
-	struct device *dev = &pdev->dev;
+	struct platform_device *pdev = to_platform_device(dev);
+	struct drm_device *drm_dev = data;
 	struct fimd_context *ctx;
+	struct device_node *dn;
 	struct resource *res;
 	int win;
 	int ret = -EINVAL;
@@ -910,11 +914,19 @@ static int fimd_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, &fimd_manager);
 
 	fimd_manager.ctx = ctx;
-	exynos_drm_manager_register(&fimd_manager);
-
-	exynos_dpi_probe(ctx->dev);
-
-	pm_runtime_enable(dev);
+	fimd_mgr_initialize(&fimd_manager, drm_dev);
+
+	exynos_drm_crtc_create(&fimd_manager);
+
+	dn = exynos_dpi_of_find_panel_node(&pdev->dev);
+	if (dn) {
+		/*
+		 * It should be called after exynos_drm_crtc_create call
+		 * because exynos_dpi_probe call will try to find same lcd
+		 * type of manager to setup possible_crtcs.
+		 */
+		exynos_dpi_probe(drm_dev, dev);
+	}
 
 	for (win = 0; win < WINDOWS_NR; win++)
 		fimd_clear_win(ctx, win);
@@ -922,18 +934,59 @@ static int fimd_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int fimd_remove(struct platform_device *pdev)
+static void fimd_unbind(struct device *dev, struct device *master,
+			void *data)
 {
-	struct exynos_drm_manager *mgr = platform_get_drvdata(pdev);
+	struct exynos_drm_manager *mgr = dev_get_drvdata(dev);
+	struct drm_crtc *crtc = mgr->crtc;
+	struct device_node *dn;
 
-	exynos_dpi_remove(&pdev->dev);
+	fimd_dpms(mgr, DRM_MODE_DPMS_OFF);
 
-	exynos_drm_manager_unregister(&fimd_manager);
+	dn = exynos_dpi_of_find_panel_node(dev);
+	if (dn)
+		exynos_dpi_remove(mgr->drm_dev, dev);
 
-	fimd_dpms(mgr, DRM_MODE_DPMS_OFF);
+	fimd_mgr_remove(mgr);
+
+	crtc->funcs->destroy(crtc);
+}
+
+static const struct component_ops fimd_component_ops = {
+	.bind	= fimd_bind,
+	.unbind = fimd_unbind,
+};
+
+static int fimd_probe(struct platform_device *pdev)
+{
+	struct device_node *dn;
+
+	/* Check if fimd node has port node. */
+	dn = exynos_dpi_of_find_panel_node(&pdev->dev);
+	if (dn) {
+		struct drm_panel *panel;
+
+		/*
+		 * Do not bind if there is the port node but a drm_panel
+		 * isn't added to panel_list yet.
+		 * In this case, fimd_probe will be called by defered probe
+		 * again after the drm_panel is added to panel_list.
+		 */
+		panel = of_drm_find_panel(dn);
+		if (!panel)
+			return -EPROBE_DEFER;
+	}
 
+	pm_runtime_enable(&pdev->dev);
+
+	return component_add(&pdev->dev, &fimd_component_ops);
+}
+
+static int fimd_remove(struct platform_device *pdev)
+{
 	pm_runtime_disable(&pdev->dev);
 
+	component_del(&pdev->dev, &fimd_component_ops);
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/exynos/exynos_drm_vidi.c b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
index 7afead9..3319289 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_vidi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
@@ -51,6 +51,7 @@ struct vidi_context {
 	struct drm_crtc			*crtc;
 	struct drm_encoder		*encoder;
 	struct drm_connector		connector;
+	struct exynos_drm_subdrv	subdrv;
 	struct vidi_win_data		win_data[WINDOWS_NR];
 	struct edid			*raw_edid;
 	unsigned int			clkdiv;
@@ -294,14 +295,13 @@ static void vidi_dpms(struct exynos_drm_manager *mgr, int mode)
 }
 
 static int vidi_mgr_initialize(struct exynos_drm_manager *mgr,
-			struct drm_device *drm_dev, int pipe)
+			struct drm_device *drm_dev)
 {
 	struct vidi_context *ctx = mgr->ctx;
+	struct exynos_drm_private *priv = drm_dev->dev_private;
 
-	DRM_ERROR("vidi initialize ct=%p dev=%p pipe=%d\n", ctx, drm_dev, pipe);
-
-	ctx->drm_dev = drm_dev;
-	ctx->pipe = pipe;
+	mgr->drm_dev = ctx->drm_dev = drm_dev;
+	mgr->pipe = ctx->pipe = priv->pipe++;
 
 	/*
 	 * enable drm irq mode.
@@ -324,7 +324,6 @@ static int vidi_mgr_initialize(struct exynos_drm_manager *mgr,
 }
 
 static struct exynos_drm_manager_ops vidi_manager_ops = {
-	.initialize = vidi_mgr_initialize,
 	.dpms = vidi_dpms,
 	.commit = vidi_commit,
 	.enable_vblank = vidi_enable_vblank,
@@ -586,13 +585,38 @@ static struct exynos_drm_display vidi_display = {
 	.ops = &vidi_display_ops,
 };
 
+static int vidi_subdrv_probe(struct drm_device *drm_dev, struct device *dev)
+{
+	struct exynos_drm_manager *mgr = get_vidi_mgr(dev);
+	struct vidi_context *ctx = mgr->ctx;
+	struct drm_crtc *crtc = ctx->crtc;
+	int ret;
+
+	vidi_mgr_initialize(mgr, drm_dev);
+
+	ret = exynos_drm_crtc_create(&vidi_manager);
+	if (ret) {
+		DRM_ERROR("failed to create crtc.\n");
+		return ret;
+	}
+
+	ret = exynos_drm_create_enc_conn(drm_dev, &vidi_display);
+	if (ret) {
+		crtc->funcs->destroy(crtc);
+		DRM_ERROR("failed to create encoder and connector.\n");
+		return ret;
+	}
+
+	return 0;
+}
+
 static int vidi_probe(struct platform_device *pdev)
 {
-	struct device *dev = &pdev->dev;
+	struct exynos_drm_subdrv *subdrv;
 	struct vidi_context *ctx;
 	int ret;
 
-	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
+	ctx = devm_kzalloc(&pdev->dev, sizeof(*ctx), GFP_KERNEL);
 	if (!ctx)
 		return -ENOMEM;
 
@@ -607,28 +631,43 @@ static int vidi_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, &vidi_manager);
 
-	ret = device_create_file(dev, &dev_attr_connection);
-	if (ret < 0)
-		DRM_INFO("failed to create connection sysfs.\n");
+	subdrv = &ctx->subdrv;
+	subdrv->dev = &pdev->dev;
+	subdrv->probe = vidi_subdrv_probe;
 
-	exynos_drm_manager_register(&vidi_manager);
-	exynos_drm_display_register(&vidi_display);
+	ret = exynos_drm_subdrv_register(subdrv);
+	if (ret < 0) {
+		dev_err(&pdev->dev, "failed to register drm vidi device\n");
+		return ret;
+	}
+
+	ret = device_create_file(&pdev->dev, &dev_attr_connection);
+	if (ret < 0) {
+		exynos_drm_subdrv_unregister(subdrv);
+		DRM_INFO("failed to create connection sysfs.\n");
+	}
 
 	return 0;
 }
 
 static int vidi_remove(struct platform_device *pdev)
 {
-	struct vidi_context *ctx = platform_get_drvdata(pdev);
-
-	exynos_drm_display_unregister(&vidi_display);
-	exynos_drm_manager_unregister(&vidi_manager);
+	struct exynos_drm_manager *mgr = platform_get_drvdata(pdev);
+	struct vidi_context *ctx = mgr->ctx;
+	struct drm_encoder *encoder = ctx->encoder;
+	struct drm_crtc *crtc = mgr->crtc;
 
 	if (ctx->raw_edid != (struct edid *)fake_edid_info) {
 		kfree(ctx->raw_edid);
 		ctx->raw_edid = NULL;
+
+		return -EINVAL;
 	}
 
+	crtc->funcs->destroy(crtc);
+	encoder->funcs->destroy(encoder);
+	drm_connector_cleanup(&ctx->connector);
+
 	return 0;
 }
 
@@ -640,3 +679,31 @@ struct platform_driver vidi_driver = {
 		.owner	= THIS_MODULE,
 	},
 };
+
+int exynos_drm_probe_vidi(void)
+{
+	struct platform_device *pdev;
+	int ret;
+
+	pdev = platform_device_register_simple("exynos-drm-vidi", -1, NULL, 0);
+	if (IS_ERR(pdev))
+		return PTR_ERR(pdev);
+
+	ret = platform_driver_register(&vidi_driver);
+	if (ret) {
+		platform_device_unregister(pdev);
+		return ret;
+	}
+
+	return ret;
+}
+
+void exynos_drm_remove_vidi(void)
+{
+	struct vidi_context *ctx = vidi_manager.ctx;
+	struct exynos_drm_subdrv *subdrv = &ctx->subdrv;
+	struct platform_device *pdev = to_platform_device(subdrv->dev);
+
+	platform_driver_unregister(&vidi_driver);
+	platform_device_unregister(pdev);
+}
diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
index 9a6d652..de23090 100644
--- a/drivers/gpu/drm/exynos/exynos_hdmi.c
+++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
@@ -36,10 +36,12 @@
 #include <linux/i2c.h>
 #include <linux/of_gpio.h>
 #include <linux/hdmi.h>
+#include <linux/component.h>
 
 #include <drm/exynos_drm.h>
 
 #include "exynos_drm_drv.h"
+#include "exynos_drm_crtc.h"
 #include "exynos_mixer.h"
 
 #include <linux/gpio.h>
@@ -928,16 +930,6 @@ static int hdmi_create_connector(struct exynos_drm_display *display,
 	return 0;
 }
 
-static int hdmi_initialize(struct exynos_drm_display *display,
-			struct drm_device *drm_dev)
-{
-	struct hdmi_context *hdata = display->ctx;
-
-	hdata->drm_dev = drm_dev;
-
-	return 0;
-}
-
 static void hdmi_mode_fixup(struct exynos_drm_display *display,
 				struct drm_connector *connector,
 				const struct drm_display_mode *mode,
@@ -1913,7 +1905,6 @@ static void hdmi_dpms(struct exynos_drm_display *display, int mode)
 }
 
 static struct exynos_drm_display_ops hdmi_display_ops = {
-	.initialize	= hdmi_initialize,
 	.create_connector = hdmi_create_connector,
 	.mode_fixup	= hdmi_mode_fixup,
 	.mode_set	= hdmi_mode_set,
@@ -2047,18 +2038,44 @@ static struct of_device_id hdmi_match_types[] = {
 	}
 };
 
+static int hdmi_bind(struct device *dev, struct device *master, void *data)
+{
+	struct drm_device *drm_dev = data;
+	struct hdmi_context *hdata;
+
+	hdata = hdmi_display.ctx;
+	hdata->drm_dev = drm_dev;
+
+	return exynos_drm_create_enc_conn(drm_dev, &hdmi_display);
+}
+
+static void hdmi_unbind(struct device *dev, struct device *master, void *data)
+{
+	struct exynos_drm_display *display = get_hdmi_display(dev);
+	struct drm_encoder *encoder = display->encoder;
+	struct hdmi_context *hdata = display->ctx;
+
+	encoder->funcs->destroy(encoder);
+	drm_connector_cleanup(&hdata->connector);
+}
+
+static const struct component_ops hdmi_component_ops = {
+	.bind	= hdmi_bind,
+	.unbind = hdmi_unbind,
+};
+
 static int hdmi_probe(struct platform_device *pdev)
 {
+	struct device_node *ddc_node, *phy_node;
+	struct s5p_hdmi_platform_data *pdata;
+	struct hdmi_driver_data *drv_data;
+	const struct of_device_id *match;
 	struct device *dev = &pdev->dev;
 	struct hdmi_context *hdata;
-	struct s5p_hdmi_platform_data *pdata;
 	struct resource *res;
-	const struct of_device_id *match;
-	struct device_node *ddc_node, *phy_node;
-	struct hdmi_driver_data *drv_data;
 	int ret;
 
-	 if (!dev->of_node)
+	if (!dev->of_node)
 		return -ENODEV;
 
 	pdata = drm_hdmi_dt_parse_pdata(dev);
@@ -2149,11 +2166,9 @@ static int hdmi_probe(struct platform_device *pdev)
 	}
 
 	pm_runtime_enable(dev);
-
 	hdmi_display.ctx = hdata;
-	exynos_drm_display_register(&hdmi_display);
 
-	return 0;
+	return component_add(&pdev->dev, &hdmi_component_ops);
 
 err_hdmiphy:
 	put_device(&hdata->hdmiphy_port->dev);
@@ -2164,14 +2179,14 @@ err_ddc:
 
 static int hdmi_remove(struct platform_device *pdev)
 {
-	struct device *dev = &pdev->dev;
-	struct exynos_drm_display *display = get_hdmi_display(dev);
-	struct hdmi_context *hdata = display->ctx;
+	struct hdmi_context *hdata = hdmi_display.ctx;
 
 	put_device(&hdata->hdmiphy_port->dev);
 	put_device(&hdata->ddc_adpt->dev);
+
 	pm_runtime_disable(&pdev->dev);
 
+	component_del(&pdev->dev, &hdmi_component_ops);
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exynos/exynos_mixer.c
index ce28881..d46a262 100644
--- a/drivers/gpu/drm/exynos/exynos_mixer.c
+++ b/drivers/gpu/drm/exynos/exynos_mixer.c
@@ -31,6 +31,7 @@
 #include <linux/clk.h>
 #include <linux/regulator/consumer.h>
 #include <linux/of.h>
+#include <linux/component.h>
 
 #include <drm/exynos_drm.h>
 
@@ -830,13 +831,15 @@ static int vp_resources_init(struct mixer_context *mixer_ctx)
 }
 
 static int mixer_initialize(struct exynos_drm_manager *mgr,
-			struct drm_device *drm_dev, int pipe)
+			struct drm_device *drm_dev)
 {
 	int ret;
 	struct mixer_context *mixer_ctx = mgr->ctx;
+	struct exynos_drm_private *priv;
+	priv = drm_dev->dev_private;
 
-	mixer_ctx->drm_dev = drm_dev;
-	mixer_ctx->pipe = pipe;
+	mgr->drm_dev = mixer_ctx->drm_dev = drm_dev;
+	mgr->pipe = mixer_ctx->pipe = priv->pipe++;
 
 	/* acquire resources: regs, irqs, clocks */
 	ret = mixer_resources_init(mixer_ctx);
@@ -1142,8 +1145,6 @@ int mixer_check_mode(struct drm_display_mode *mode)
 }
 
 static struct exynos_drm_manager_ops mixer_manager_ops = {
-	.initialize		= mixer_initialize,
-	.remove			= mixer_mgr_remove,
 	.dpms			= mixer_dpms,
 	.enable_vblank		= mixer_enable_vblank,
 	.disable_vblank		= mixer_disable_vblank,
@@ -1200,11 +1201,13 @@ static struct of_device_id mixer_match_types[] = {
 	}
 };
 
-static int mixer_probe(struct platform_device *pdev)
+static int mixer_bind(struct device *dev, struct device *manager, void *data)
 {
-	struct device *dev = &pdev->dev;
+	struct platform_device *pdev = to_platform_device(dev);
+	struct drm_device *drm_dev = data;
 	struct mixer_context *ctx;
 	struct mixer_drv_data *drv;
+	int ret;
 
 	dev_info(dev, "probe start\n");
 
@@ -1233,20 +1236,49 @@ static int mixer_probe(struct platform_device *pdev)
 	atomic_set(&ctx->wait_vsync_event, 0);
 
 	mixer_manager.ctx = ctx;
+	ret = mixer_initialize(&mixer_manager, drm_dev);
+	if (ret)
+		return ret;
+
 	platform_set_drvdata(pdev, &mixer_manager);
-	exynos_drm_manager_register(&mixer_manager);
+	ret = exynos_drm_crtc_create(&mixer_manager);
+	if (ret) {
+		mixer_mgr_remove(&mixer_manager);
+		return ret;
+	}
 
 	pm_runtime_enable(dev);
 
 	return 0;
 }
 
-static int mixer_remove(struct platform_device *pdev)
+static void mixer_unbind(struct device *dev, struct device *master, void *data)
 {
-	dev_info(&pdev->dev, "remove successful\n");
+	struct exynos_drm_manager *mgr = dev_get_drvdata(dev);
+	struct drm_crtc *crtc = mgr->crtc;
+
+	dev_info(dev, "remove successful\n");
+
+	mixer_mgr_remove(mgr);
 
-	pm_runtime_disable(&pdev->dev);
+	pm_runtime_disable(dev);
 
+	crtc->funcs->destroy(crtc);
+}
+
+static const struct component_ops mixer_component_ops = {
+	.bind	= mixer_bind,
+	.unbind	= mixer_unbind,
+};
+
+static int mixer_probe(struct platform_device *pdev)
+{
+	return component_add(&pdev->dev, &mixer_component_ops);
+}
+
+static int mixer_remove(struct platform_device *pdev)
+{
+	component_del(&pdev->dev, &mixer_component_ops);
 	return 0;
 }
 
-- 
1.7.9.5
