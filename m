From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 2/3] drm/exynos: fix broken component binding in case of
 multiple pipelines
Date: Mon, 08 Jun 2015 12:15:41 +0200
Message-ID: <1433758542-9843-3-git-send-email-a.hajda@samsung.com>
References: <1433758542-9843-1-git-send-email-a.hajda@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:47527 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752265AbbFHKQb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 8 Jun 2015 06:16:31 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NPM005DZF7G7S90@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 08 Jun 2015 11:16:28 +0100 (BST)
In-reply-to: <1433758542-9843-1-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: Andrzej Hajda <a.hajda@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, b.zolnierkie@samsung.com, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org

In case there are multiple pipelines and deferred probe occurs, only components
of the first pipeline were bound. As a result only one pipeline was available.
The main cause of this issue was dynamic generation of component match table -
every component driver during probe registered itself on helper list, if there
was at least one pipeline present on this list component match table were
created without deferred components.
This patch removes this helper list, instead it creates match table from
existing devices requiring exynos_drm KMS drivers. This way match table do not
depend on probe/deferral order and contains all KMS components.
As a side effect patch makes the code cleaner and significantly smaller.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 drivers/gpu/drm/exynos/exynos7_drm_decon.c |  14 +-
 drivers/gpu/drm/exynos/exynos_dp_core.c    |  13 +-
 drivers/gpu/drm/exynos/exynos_drm_dpi.c    |  20 +-
 drivers/gpu/drm/exynos/exynos_drm_drv.c    | 283 ++++++++---------------------
 drivers/gpu/drm/exynos/exynos_drm_dsi.c    |  29 +--
 drivers/gpu/drm/exynos/exynos_drm_fimd.c   |  28 +--
 drivers/gpu/drm/exynos/exynos_drm_vidi.c   |  18 +-
 drivers/gpu/drm/exynos/exynos_hdmi.c       |  22 +--
 drivers/gpu/drm/exynos/exynos_mixer.c      |  14 +-
 9 files changed, 99 insertions(+), 342 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos7_drm_decon.c b/drivers/gpu/drm/exynos/exynos7_drm_decon.c
index d659ba2..22cb067 100644
--- a/drivers/gpu/drm/exynos/exynos7_drm_decon.c
+++ b/drivers/gpu/drm/exynos/exynos7_drm_decon.c
@@ -769,11 +769,6 @@ static int decon_probe(struct platform_device *pdev)
 	if (!ctx)
 		return -ENOMEM;
 
-	ret = exynos_drm_component_add(dev, EXYNOS_DEVICE_TYPE_CRTC,
-					EXYNOS_DISPLAY_TYPE_LCD);
-	if (ret)
-		return ret;
-
 	ctx->dev = dev;
 	ctx->suspended = true;
 
@@ -783,10 +778,8 @@ static int decon_probe(struct platform_device *pdev)
 	of_node_put(i80_if_timings);
 
 	ctx->regs = of_iomap(dev->of_node, 0);
-	if (!ctx->regs) {
-		ret = -ENOMEM;
-		goto err_del_component;
-	}
+	if (!ctx->regs)
+		return -ENOMEM;
 
 	ctx->pclk = devm_clk_get(dev, "pclk_decon0");
 	if (IS_ERR(ctx->pclk)) {
@@ -856,8 +849,6 @@ err_disable_pm_runtime:
 err_iounmap:
 	iounmap(ctx->regs);
 
-err_del_component:
-	exynos_drm_component_del(dev, EXYNOS_DEVICE_TYPE_CRTC);
 	return ret;
 }
 
@@ -870,7 +861,6 @@ static int decon_remove(struct platform_device *pdev)
 	iounmap(ctx->regs);
 
 	component_del(&pdev->dev, &decon_component_ops);
-	exynos_drm_component_del(&pdev->dev, EXYNOS_DEVICE_TYPE_CRTC);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/exynos/exynos_dp_core.c b/drivers/gpu/drm/exynos/exynos_dp_core.c
index c9995b1..bf1fce2 100644
--- a/drivers/gpu/drm/exynos/exynos_dp_core.c
+++ b/drivers/gpu/drm/exynos/exynos_dp_core.c
@@ -1344,11 +1344,6 @@ static int exynos_dp_probe(struct platform_device *pdev)
 	dp->display.ops = &exynos_dp_display_ops;
 	platform_set_drvdata(pdev, dp);
 
-	ret = exynos_drm_component_add(&pdev->dev, EXYNOS_DEVICE_TYPE_CONNECTOR,
-					dp->display.type);
-	if (ret)
-		return ret;
-
 	panel_node = of_parse_phandle(dev->of_node, "panel", 0);
 	if (panel_node) {
 		dp->panel = of_drm_find_panel(panel_node);
@@ -1369,18 +1364,12 @@ static int exynos_dp_probe(struct platform_device *pdev)
 			return -EPROBE_DEFER;
 	}
 
-	ret = component_add(&pdev->dev, &exynos_dp_ops);
-	if (ret)
-		exynos_drm_component_del(&pdev->dev,
-						EXYNOS_DEVICE_TYPE_CONNECTOR);
-
-	return ret;
+	return component_add(&pdev->dev, &exynos_dp_ops);
 }
 
 static int exynos_dp_remove(struct platform_device *pdev)
 {
 	component_del(&pdev->dev, &exynos_dp_ops);
-	exynos_drm_component_del(&pdev->dev, EXYNOS_DEVICE_TYPE_CONNECTOR);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/exynos/exynos_drm_dpi.c b/drivers/gpu/drm/exynos/exynos_drm_dpi.c
index 6dc328e..7cb6595 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dpi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dpi.c
@@ -313,33 +313,19 @@ struct exynos_drm_display *exynos_dpi_probe(struct device *dev)
 	ctx->dev = dev;
 	ctx->dpms_mode = DRM_MODE_DPMS_OFF;
 
-	ret = exynos_drm_component_add(dev,
-					EXYNOS_DEVICE_TYPE_CONNECTOR,
-					ctx->display.type);
-	if (ret)
-		return ERR_PTR(ret);
-
 	ret = exynos_dpi_parse_dt(ctx);
 	if (ret < 0) {
 		devm_kfree(dev, ctx);
-		goto err_del_component;
+		return NULL;
 	}
 
 	if (ctx->panel_node) {
 		ctx->panel = of_drm_find_panel(ctx->panel_node);
-		if (!ctx->panel) {
-			exynos_drm_component_del(dev,
-						EXYNOS_DEVICE_TYPE_CONNECTOR);
+		if (!ctx->panel)
 			return ERR_PTR(-EPROBE_DEFER);
-		}
 	}
 
 	return &ctx->display;
-
-err_del_component:
-	exynos_drm_component_del(dev, EXYNOS_DEVICE_TYPE_CONNECTOR);
-
-	return NULL;
 }
 
 int exynos_dpi_remove(struct exynos_drm_display *display)
@@ -351,7 +337,5 @@ int exynos_dpi_remove(struct exynos_drm_display *display)
 	if (ctx->panel)
 		drm_panel_detach(ctx->panel);
 
-	exynos_drm_component_del(ctx->dev, EXYNOS_DEVICE_TYPE_CONNECTOR);
-
 	return 0;
 }
diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/gpu/drm/exynos/exynos_drm_drv.c
index 5c5a72a..cfbfb6c 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
@@ -38,17 +38,6 @@
 #define DRIVER_MAJOR	1
 #define DRIVER_MINOR	0
 
-static DEFINE_MUTEX(drm_component_lock);
-static LIST_HEAD(drm_component_list);
-
-struct component_dev {
-	struct list_head list;
-	struct device *crtc_dev;
-	struct device *conn_dev;
-	enum exynos_drm_output_type out_type;
-	unsigned int dev_type_flag;
-};
-
 static int exynos_drm_load(struct drm_device *dev, unsigned long flags)
 {
 	struct exynos_drm_private *private;
@@ -348,108 +337,70 @@ static const struct dev_pm_ops exynos_drm_pm_ops = {
 	SET_SYSTEM_SLEEP_PM_OPS(exynos_drm_sys_suspend, exynos_drm_sys_resume)
 };
 
-int exynos_drm_component_add(struct device *dev,
-				enum exynos_drm_device_type dev_type,
-				enum exynos_drm_output_type out_type)
-{
-	struct component_dev *cdev;
-
-	if (dev_type != EXYNOS_DEVICE_TYPE_CRTC &&
-			dev_type != EXYNOS_DEVICE_TYPE_CONNECTOR) {
-		DRM_ERROR("invalid device type.\n");
-		return -EINVAL;
-	}
-
-	mutex_lock(&drm_component_lock);
+/* forward declaration */
+static struct platform_driver exynos_drm_platform_driver;
 
-	/*
-	 * Make sure to check if there is a component which has two device
-	 * objects, for connector and for encoder/connector.
-	 * It should make sure that crtc and encoder/connector drivers are
-	 * ready before exynos drm core binds them.
-	 */
-	list_for_each_entry(cdev, &drm_component_list, list) {
-		if (cdev->out_type == out_type) {
-			/*
-			 * If crtc and encoder/connector device objects are
-			 * added already just return.
-			 */
-			if (cdev->dev_type_flag == (EXYNOS_DEVICE_TYPE_CRTC |
-						EXYNOS_DEVICE_TYPE_CONNECTOR)) {
-				mutex_unlock(&drm_component_lock);
-				return 0;
-			}
-
-			if (dev_type == EXYNOS_DEVICE_TYPE_CRTC) {
-				cdev->crtc_dev = dev;
-				cdev->dev_type_flag |= dev_type;
-			}
-
-			if (dev_type == EXYNOS_DEVICE_TYPE_CONNECTOR) {
-				cdev->conn_dev = dev;
-				cdev->dev_type_flag |= dev_type;
-			}
-
-			mutex_unlock(&drm_component_lock);
-			return 0;
-		}
-	}
-
-	mutex_unlock(&drm_component_lock);
-
-	cdev = kzalloc(sizeof(*cdev), GFP_KERNEL);
-	if (!cdev)
-		return -ENOMEM;
-
-	if (dev_type == EXYNOS_DEVICE_TYPE_CRTC)
-		cdev->crtc_dev = dev;
-	if (dev_type == EXYNOS_DEVICE_TYPE_CONNECTOR)
-		cdev->conn_dev = dev;
-
-	cdev->out_type = out_type;
-	cdev->dev_type_flag = dev_type;
-
-	mutex_lock(&drm_component_lock);
-	list_add_tail(&cdev->list, &drm_component_list);
-	mutex_unlock(&drm_component_lock);
-
-	return 0;
-}
-
-void exynos_drm_component_del(struct device *dev,
-				enum exynos_drm_device_type dev_type)
-{
-	struct component_dev *cdev, *next;
-
-	mutex_lock(&drm_component_lock);
-
-	list_for_each_entry_safe(cdev, next, &drm_component_list, list) {
-		if (dev_type == EXYNOS_DEVICE_TYPE_CRTC) {
-			if (cdev->crtc_dev == dev) {
-				cdev->crtc_dev = NULL;
-				cdev->dev_type_flag &= ~dev_type;
-			}
-		}
-
-		if (dev_type == EXYNOS_DEVICE_TYPE_CONNECTOR) {
-			if (cdev->conn_dev == dev) {
-				cdev->conn_dev = NULL;
-				cdev->dev_type_flag &= ~dev_type;
-			}
-		}
+/*
+ * Connector drivers should not be placed before associated crtc drivers,
+ * because connector requires pipe number of its crtc during initialization.
+ */
+static struct platform_driver *const exynos_drm_kms_drivers[] = {
+#ifdef CONFIG_DRM_EXYNOS_VIDI
+	&vidi_driver,
+#endif
+#ifdef CONFIG_DRM_EXYNOS_FIMD
+	&fimd_driver,
+#endif
+#ifdef CONFIG_DRM_EXYNOS5433_DECON
+	&exynos5433_decon_driver,
+#endif
+#ifdef CONFIG_DRM_EXYNOS7_DECON
+	&decon_driver,
+#endif
+#ifdef CONFIG_DRM_EXYNOS_DP
+	&dp_driver,
+#endif
+#ifdef CONFIG_DRM_EXYNOS_DSI
+	&dsi_driver,
+#endif
+#ifdef CONFIG_DRM_EXYNOS_HDMI
+	&mixer_driver,
+	&hdmi_driver,
+#endif
+};
 
-		/*
-		 * Release cdev object only in case that both of crtc and
-		 * encoder/connector device objects are NULL.
-		 */
-		if (!cdev->crtc_dev && !cdev->conn_dev) {
-			list_del(&cdev->list);
-			kfree(cdev);
-		}
-	}
+static struct platform_driver *const exynos_drm_non_kms_drivers[] = {
+#ifdef CONFIG_DRM_EXYNOS_MIC
+	&mic_driver,
+#endif
+#ifdef CONFIG_DRM_EXYNOS_G2D
+	&g2d_driver,
+#endif
+#ifdef CONFIG_DRM_EXYNOS_FIMC
+	&fimc_driver,
+#endif
+#ifdef CONFIG_DRM_EXYNOS_ROTATOR
+	&rotator_driver,
+#endif
+#ifdef CONFIG_DRM_EXYNOS_GSC
+	&gsc_driver,
+#endif
+#ifdef CONFIG_DRM_EXYNOS_IPP
+	&ipp_driver,
+#endif
+	&exynos_drm_platform_driver,
+};
 
-	mutex_unlock(&drm_component_lock);
-}
+static struct platform_driver *const exynos_drm_drv_with_simple_dev[] = {
+#ifdef CONFIG_DRM_EXYNOS_VIDI
+	&vidi_driver,
+#endif
+#ifdef CONFIG_DRM_EXYNOS_IPP
+	&ipp_driver,
+#endif
+	&exynos_drm_platform_driver,
+};
+#define PDEV_COUNT ARRAY_SIZE(exynos_drm_drv_with_simple_dev)
 
 static int compare_dev(struct device *dev, void *data)
 {
@@ -459,55 +410,22 @@ static int compare_dev(struct device *dev, void *data)
 static struct component_match *exynos_drm_match_add(struct device *dev)
 {
 	struct component_match *match = NULL;
-	struct component_dev *cdev;
-	unsigned int attach_cnt = 0;
-
-	mutex_lock(&drm_component_lock);
-
-	/* Do not retry to probe if there is no any kms driver regitered. */
-	if (list_empty(&drm_component_list)) {
-		mutex_unlock(&drm_component_lock);
-		return ERR_PTR(-ENODEV);
-	}
-
-	list_for_each_entry(cdev, &drm_component_list, list) {
-		/*
-		 * Add components to master only in case that crtc and
-		 * encoder/connector device objects exist.
-		 */
-		if (!cdev->crtc_dev || !cdev->conn_dev)
-			continue;
-
-		attach_cnt++;
+	int i;
 
-		mutex_unlock(&drm_component_lock);
+	for (i = 0; i < ARRAY_SIZE(exynos_drm_kms_drivers); ++i) {
+		struct device_driver *drv = &exynos_drm_kms_drivers[i]->driver;
+		struct device *p = NULL, *d;
 
-		/*
-		 * fimd and dpi modules have same device object so add
-		 * only crtc device object in this case.
-		 */
-		if (cdev->crtc_dev == cdev->conn_dev) {
-			component_match_add(dev, &match, compare_dev,
-						cdev->crtc_dev);
-			goto out_lock;
+		while ((d = bus_find_device(&platform_bus_type, p, drv,
+					    (void *)platform_bus_type.match))) {
+			put_device(p);
+			component_match_add(dev, &match, compare_dev, d);
+			p = d;
 		}
-
-		/*
-		 * Do not chage below call order.
-		 * crtc device first should be added to master because
-		 * connector/encoder need pipe number of crtc when they
-		 * are created.
-		 */
-		component_match_add(dev, &match, compare_dev, cdev->crtc_dev);
-		component_match_add(dev, &match, compare_dev, cdev->conn_dev);
-
-out_lock:
-		mutex_lock(&drm_component_lock);
+		put_device(p);
 	}
 
-	mutex_unlock(&drm_component_lock);
-
-	return attach_cnt ? match : ERR_PTR(-EPROBE_DEFER);
+	return match ?: ERR_PTR(-ENODEV);
 }
 
 static int exynos_drm_bind(struct device *dev)
@@ -533,9 +451,8 @@ static int exynos_drm_platform_probe(struct platform_device *pdev)
 	exynos_drm_driver.num_ioctls = ARRAY_SIZE(exynos_ioctls);
 
 	match = exynos_drm_match_add(&pdev->dev);
-	if (IS_ERR(match)) {
+	if (IS_ERR(match))
 		return PTR_ERR(match);
-	}
 
 	return component_master_add_with_match(&pdev->dev, &exynos_drm_ops,
 					       match);
@@ -556,60 +473,6 @@ static struct platform_driver exynos_drm_platform_driver = {
 	},
 };
 
-static struct platform_driver *const exynos_drm_kms_drivers[] = {
-#ifdef CONFIG_DRM_EXYNOS_VIDI
-	&vidi_driver,
-#endif
-#ifdef CONFIG_DRM_EXYNOS_FIMD
-	&fimd_driver,
-#endif
-#ifdef CONFIG_DRM_EXYNOS7_DECON
-	&decon_driver,
-#endif
-#ifdef CONFIG_DRM_EXYNOS_DP
-	&dp_driver,
-#endif
-#ifdef CONFIG_DRM_EXYNOS_DSI
-	&dsi_driver,
-#endif
-#ifdef CONFIG_DRM_EXYNOS_HDMI
-	&mixer_driver,
-	&hdmi_driver,
-#endif
-};
-
-static struct platform_driver *const exynos_drm_non_kms_drivers[] = {
-#ifdef CONFIG_DRM_EXYNOS_G2D
-	&g2d_driver,
-#endif
-#ifdef CONFIG_DRM_EXYNOS_FIMC
-	&fimc_driver,
-#endif
-#ifdef CONFIG_DRM_EXYNOS_ROTATOR
-	&rotator_driver,
-#endif
-#ifdef CONFIG_DRM_EXYNOS_GSC
-	&gsc_driver,
-#endif
-#ifdef CONFIG_DRM_EXYNOS_IPP
-	&ipp_driver,
-#endif
-	&exynos_drm_platform_driver,
-};
-
-
-static struct platform_driver *const exynos_drm_drv_with_simple_dev[] = {
-#ifdef CONFIG_DRM_EXYNOS_VIDI
-	&vidi_driver,
-#endif
-#ifdef CONFIG_DRM_EXYNOS_IPP
-	&ipp_driver,
-#endif
-	&exynos_drm_platform_driver,
-};
-
-#define PDEV_COUNT ARRAY_SIZE(exynos_drm_drv_with_simple_dev)
-
 static struct platform_device *exynos_drm_pdevs[PDEV_COUNT];
 
 static void exynos_drm_unregister_devices(void)
diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index 190f3b3..21fa58d 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -1686,11 +1686,6 @@ static int exynos_dsi_probe(struct platform_device *pdev)
 	dsi->display.type = EXYNOS_DISPLAY_TYPE_LCD;
 	dsi->display.ops = &exynos_dsi_display_ops;
 
-	ret = exynos_drm_component_add(dev, EXYNOS_DEVICE_TYPE_CONNECTOR,
-				       dsi->display.type);
-	if (ret)
-		return ret;
-
 	/* To be checked as invalid one */
 	dsi->te_gpio = -ENOENT;
 
@@ -1706,7 +1701,7 @@ static int exynos_dsi_probe(struct platform_device *pdev)
 
 	ret = exynos_dsi_parse_dt(dsi);
 	if (ret)
-		goto err_del_component;
+		return ret;
 
 	dsi->supplies[0].supply = "vddcore";
 	dsi->supplies[1].supply = "vddio";
@@ -1735,22 +1730,19 @@ static int exynos_dsi_probe(struct platform_device *pdev)
 	dsi->reg_base = devm_ioremap_resource(dev, res);
 	if (IS_ERR(dsi->reg_base)) {
 		dev_err(dev, "failed to remap io region\n");
-		ret = PTR_ERR(dsi->reg_base);
-		goto err_del_component;
+		return PTR_ERR(dsi->reg_base);
 	}
 
 	dsi->phy = devm_phy_get(dev, "dsim");
 	if (IS_ERR(dsi->phy)) {
 		dev_info(dev, "failed to get dsim phy\n");
-		ret = PTR_ERR(dsi->phy);
-		goto err_del_component;
+		return PTR_ERR(dsi->phy);
 	}
 
 	dsi->irq = platform_get_irq(pdev, 0);
 	if (dsi->irq < 0) {
 		dev_err(dev, "failed to request dsi irq resource\n");
-		ret = dsi->irq;
-		goto err_del_component;
+		return dsi->irq;
 	}
 
 	irq_set_status_flags(dsi->irq, IRQ_NOAUTOEN);
@@ -1759,26 +1751,17 @@ static int exynos_dsi_probe(struct platform_device *pdev)
 					dev_name(dev), dsi);
 	if (ret) {
 		dev_err(dev, "failed to request dsi irq\n");
-		goto err_del_component;
+		return ret;
 	}
 
 	platform_set_drvdata(pdev, &dsi->display);
 
-	ret = component_add(dev, &exynos_dsi_component_ops);
-	if (ret)
-		goto err_del_component;
-
-	return ret;
-
-err_del_component:
-	exynos_drm_component_del(dev, EXYNOS_DEVICE_TYPE_CONNECTOR);
-	return ret;
+	return component_add(dev, &exynos_dsi_component_ops);
 }
 
 static int exynos_dsi_remove(struct platform_device *pdev)
 {
 	component_del(&pdev->dev, &exynos_dsi_component_ops);
-	exynos_drm_component_del(&pdev->dev, EXYNOS_DEVICE_TYPE_CONNECTOR);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
index 9661853..ee98f77 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
@@ -1038,11 +1038,6 @@ static int fimd_probe(struct platform_device *pdev)
 	if (!ctx)
 		return -ENOMEM;
 
-	ret = exynos_drm_component_add(dev, EXYNOS_DEVICE_TYPE_CRTC,
-				       EXYNOS_DISPLAY_TYPE_LCD);
-	if (ret)
-		return ret;
-
 	ctx->dev = dev;
 	ctx->suspended = true;
 	ctx->driver_data = drm_fimd_get_driver_data(pdev);
@@ -1093,38 +1088,33 @@ static int fimd_probe(struct platform_device *pdev)
 	ctx->bus_clk = devm_clk_get(dev, "fimd");
 	if (IS_ERR(ctx->bus_clk)) {
 		dev_err(dev, "failed to get bus clock\n");
-		ret = PTR_ERR(ctx->bus_clk);
-		goto err_del_component;
+		return PTR_ERR(ctx->bus_clk);
 	}
 
 	ctx->lcd_clk = devm_clk_get(dev, "sclk_fimd");
 	if (IS_ERR(ctx->lcd_clk)) {
 		dev_err(dev, "failed to get lcd clock\n");
-		ret = PTR_ERR(ctx->lcd_clk);
-		goto err_del_component;
+		return PTR_ERR(ctx->lcd_clk);
 	}
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 
 	ctx->regs = devm_ioremap_resource(dev, res);
-	if (IS_ERR(ctx->regs)) {
-		ret = PTR_ERR(ctx->regs);
-		goto err_del_component;
-	}
+	if (IS_ERR(ctx->regs))
+		return PTR_ERR(ctx->regs);
 
 	res = platform_get_resource_byname(pdev, IORESOURCE_IRQ,
 					   ctx->i80_if ? "lcd_sys" : "vsync");
 	if (!res) {
 		dev_err(dev, "irq request failed.\n");
-		ret = -ENXIO;
-		goto err_del_component;
+		return -ENXIO;
 	}
 
 	ret = devm_request_irq(dev, res->start, fimd_irq_handler,
 							0, "drm_fimd", ctx);
 	if (ret) {
 		dev_err(dev, "irq request failed.\n");
-		goto err_del_component;
+		return ret;
 	}
 
 	init_waitqueue_head(&ctx->wait_vsync_queue);
@@ -1134,8 +1124,7 @@ static int fimd_probe(struct platform_device *pdev)
 
 	ctx->display = exynos_dpi_probe(dev);
 	if (IS_ERR(ctx->display)) {
-		ret = PTR_ERR(ctx->display);
-		goto err_del_component;
+		return PTR_ERR(ctx->display);
 	}
 
 	pm_runtime_enable(dev);
@@ -1149,8 +1138,6 @@ static int fimd_probe(struct platform_device *pdev)
 err_disable_pm_runtime:
 	pm_runtime_disable(dev);
 
-err_del_component:
-	exynos_drm_component_del(dev, EXYNOS_DEVICE_TYPE_CRTC);
 	return ret;
 }
 
@@ -1159,7 +1146,6 @@ static int fimd_remove(struct platform_device *pdev)
 	pm_runtime_disable(&pdev->dev);
 
 	component_del(&pdev->dev, &fimd_component_ops);
-	exynos_drm_component_del(&pdev->dev, EXYNOS_DEVICE_TYPE_CRTC);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/exynos/exynos_drm_vidi.c b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
index f63ac58..de53f73 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_vidi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
@@ -507,16 +507,6 @@ static int vidi_probe(struct platform_device *pdev)
 	ctx->default_win = 0;
 	ctx->pdev = pdev;
 
-	ret = exynos_drm_component_add(&pdev->dev, EXYNOS_DEVICE_TYPE_CRTC,
-					EXYNOS_DISPLAY_TYPE_VIDI);
-	if (ret)
-		return ret;
-
-	ret = exynos_drm_component_add(&pdev->dev, EXYNOS_DEVICE_TYPE_CONNECTOR,
-					ctx->display.type);
-	if (ret)
-		goto err_del_crtc_component;
-
 	INIT_WORK(&ctx->work, vidi_fake_vblank_handler);
 
 	mutex_init(&ctx->lock);
@@ -526,7 +516,7 @@ static int vidi_probe(struct platform_device *pdev)
 	ret = device_create_file(&pdev->dev, &dev_attr_connection);
 	if (ret < 0) {
 		DRM_ERROR("failed to create connection sysfs.\n");
-		goto err_del_conn_component;
+		return ret;
 	}
 
 	ret = component_add(&pdev->dev, &vidi_component_ops);
@@ -537,10 +527,6 @@ static int vidi_probe(struct platform_device *pdev)
 
 err_remove_file:
 	device_remove_file(&pdev->dev, &dev_attr_connection);
-err_del_conn_component:
-	exynos_drm_component_del(&pdev->dev, EXYNOS_DEVICE_TYPE_CONNECTOR);
-err_del_crtc_component:
-	exynos_drm_component_del(&pdev->dev, EXYNOS_DEVICE_TYPE_CRTC);
 
 	return ret;
 }
@@ -557,8 +543,6 @@ static int vidi_remove(struct platform_device *pdev)
 	}
 
 	component_del(&pdev->dev, &vidi_component_ops);
-	exynos_drm_component_del(&pdev->dev, EXYNOS_DEVICE_TYPE_CONNECTOR);
-	exynos_drm_component_del(&pdev->dev, EXYNOS_DEVICE_TYPE_CRTC);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
index 8c3c27b..99e2864 100644
--- a/drivers/gpu/drm/exynos/exynos_hdmi.c
+++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
@@ -2360,20 +2360,13 @@ static int hdmi_probe(struct platform_device *pdev)
 	hdata->display.type = EXYNOS_DISPLAY_TYPE_HDMI;
 	hdata->display.ops = &hdmi_display_ops;
 
-	ret = exynos_drm_component_add(&pdev->dev, EXYNOS_DEVICE_TYPE_CONNECTOR,
-					hdata->display.type);
-	if (ret)
-		return ret;
-
 	mutex_init(&hdata->hdmi_mutex);
 
 	platform_set_drvdata(pdev, hdata);
 
 	match = of_match_node(hdmi_match_types, dev->of_node);
-	if (!match) {
-		ret = -ENODEV;
-		goto err_del_component;
-	}
+	if (!match)
+		return -ENODEV;
 
 	drv_data = (struct hdmi_driver_data *)match->data;
 	hdata->type = drv_data->type;
@@ -2393,13 +2386,13 @@ static int hdmi_probe(struct platform_device *pdev)
 	hdata->regs = devm_ioremap_resource(dev, res);
 	if (IS_ERR(hdata->regs)) {
 		ret = PTR_ERR(hdata->regs);
-		goto err_del_component;
+		return ret;
 	}
 
 	ret = devm_gpio_request(dev, hdata->hpd_gpio, "HPD");
 	if (ret) {
 		DRM_ERROR("failed to request HPD gpio\n");
-		goto err_del_component;
+		return ret;
 	}
 
 	ddc_node = hdmi_legacy_ddc_dt_binding(dev);
@@ -2410,8 +2403,7 @@ static int hdmi_probe(struct platform_device *pdev)
 	ddc_node = of_parse_phandle(dev->of_node, "ddc", 0);
 	if (!ddc_node) {
 		DRM_ERROR("Failed to find ddc node in device tree\n");
-		ret = -ENODEV;
-		goto err_del_component;
+		return -ENODEV;
 	}
 
 out_get_ddc_adpt:
@@ -2495,9 +2487,6 @@ err_hdmiphy:
 err_ddc:
 	put_device(&hdata->ddc_adpt->dev);
 
-err_del_component:
-	exynos_drm_component_del(&pdev->dev, EXYNOS_DEVICE_TYPE_CONNECTOR);
-
 	return ret;
 }
 
@@ -2517,7 +2506,6 @@ static int hdmi_remove(struct platform_device *pdev)
 	pm_runtime_disable(&pdev->dev);
 	component_del(&pdev->dev, &hdmi_component_ops);
 
-	exynos_drm_component_del(&pdev->dev, EXYNOS_DEVICE_TYPE_CONNECTOR);
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exynos/exynos_mixer.c
index 6bab717..43fa48c 100644
--- a/drivers/gpu/drm/exynos/exynos_mixer.c
+++ b/drivers/gpu/drm/exynos/exynos_mixer.c
@@ -1266,18 +1266,9 @@ static int mixer_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, ctx);
 
-	ret = exynos_drm_component_add(&pdev->dev, EXYNOS_DEVICE_TYPE_CRTC,
-					EXYNOS_DISPLAY_TYPE_HDMI);
-	if (ret)
-		return ret;
-
 	ret = component_add(&pdev->dev, &mixer_component_ops);
-	if (ret) {
-		exynos_drm_component_del(&pdev->dev, EXYNOS_DEVICE_TYPE_CRTC);
-		return ret;
-	}
-
-	pm_runtime_enable(dev);
+	if (!ret)
+		pm_runtime_enable(dev);
 
 	return ret;
 }
@@ -1287,7 +1278,6 @@ static int mixer_remove(struct platform_device *pdev)
 	pm_runtime_disable(&pdev->dev);
 
 	component_del(&pdev->dev, &mixer_component_ops);
-	exynos_drm_component_del(&pdev->dev, EXYNOS_DEVICE_TYPE_CRTC);
 
 	return 0;
 }
-- 
1.9.1
