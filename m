From: Inki Dae <inki.dae@samsung.com>
Subject: [PATCH v6 1/5] drm/exynos: add super device support
Date: Fri, 18 Apr 2014 15:41:06 +0900
Message-ID: <1397803270-5377-2-git-send-email-inki.dae@samsung.com>
References: <1397803270-5377-1-git-send-email-inki.dae@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:56211 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751136AbaDRGlQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 18 Apr 2014 02:41:16 -0400
In-reply-to: <1397803270-5377-1-git-send-email-inki.dae@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: airlied@linux.ie, dri-devel@lists.freedesktop.org
Cc: devicetree@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux-samsung-soc@vger.kernel.org, kyungmin.park@samsung.com, inki.dae@samsung.com, linux@arm.linux.org.uk, a.hajda@samsung.com, kgene.kim@samsung.com, jy0922.shim@samsung.com, sw0312.kim@samsung.com

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

Changelog v6:
- Add super device support, and remove existing specific codes.
- Re-based on top of below patch series,
	http://www.spinics.net/lists/dri-devel/msg57673.html

Signed-off-by: Inki Dae <inki.dae@samsung.com>
Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_dp_core.c  |    4 +-
 drivers/gpu/drm/exynos/exynos_drm_drv.c  |  119 +++++++++++++++---------------
 drivers/gpu/drm/exynos/exynos_drm_drv.h  |    7 --
 drivers/gpu/drm/exynos/exynos_drm_dsi.c  |    4 +-
 drivers/gpu/drm/exynos/exynos_drm_fimd.c |    4 +-
 drivers/gpu/drm/exynos/exynos_hdmi.c     |    4 +-
 drivers/gpu/drm/exynos/exynos_mixer.c    |    4 +-
 7 files changed, 69 insertions(+), 77 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_dp_core.c b/drivers/gpu/drm/exynos/exynos_dp_core.c
index a97840c..1cc3981 100644
--- a/drivers/gpu/drm/exynos/exynos_dp_core.c
+++ b/drivers/gpu/drm/exynos/exynos_dp_core.c
@@ -1313,12 +1313,12 @@ static const struct component_ops exynos_dp_ops = {
 
 static int exynos_dp_probe(struct platform_device *pdev)
 {
-	return exynos_drm_component_add(&pdev->dev, &exynos_dp_ops);
+	return component_add(&pdev->dev, &exynos_dp_ops);
 }
 
 static int exynos_dp_remove(struct platform_device *pdev)
 {
-	exynos_drm_component_del(&pdev->dev, &exynos_dp_ops);
+	component_del(&pdev->dev, &exynos_dp_ops);
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/gpu/drm/exynos/exynos_drm_drv.c
index ab8ffbb..1d653f8 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
@@ -43,14 +43,6 @@
 
 static struct platform_device *exynos_drm_pdev;
 
-static DEFINE_MUTEX(drm_component_lock);
-static LIST_HEAD(drm_component_list);
-
-struct component_dev {
-	struct list_head list;
-	struct device *dev;
-};
-
 static int exynos_drm_load(struct drm_device *dev, unsigned long flags)
 {
 	struct exynos_drm_private *private;
@@ -382,78 +374,72 @@ static const struct dev_pm_ops exynos_drm_pm_ops = {
 	SET_SYSTEM_SLEEP_PM_OPS(exynos_drm_sys_suspend, exynos_drm_sys_resume)
 };
 
-int exynos_drm_component_add(struct device *dev,
-				const struct component_ops *ops)
+static int compare_of(struct device *dev, void *data)
 {
-	struct component_dev *cdev;
-	int ret;
-
-	cdev = kzalloc(sizeof(*cdev), GFP_KERNEL);
-	if (!cdev)
-		return -ENOMEM;
-
-	ret = component_add(dev, ops);
-	if (ret) {
-		kfree(cdev);
-		return ret;
-	}
+	return dev->of_node == data;
+}
 
-	cdev->dev = dev;
+static int exynos_drm_bind_lagacy_dt(struct device *dev, struct master *m)
+{
+	const char *compatible_tbls[] = {
+			"samsung,exynos4210-fimd",
+			"samsung,exynos5250-fimd",
+			"samsung,exynos4210-mipi-dsi",
+			"samsung,exynos5-dp",
+			"samsung,exynos4212-hdmi",
+			"samsung,exynos5250-mixer",
+			"samsung,exynos5420-mixer", };
+	unsigned int attached_cnt = 0;
+	unsigned int i;
 
-	mutex_lock(&drm_component_lock);
-	list_add_tail(&cdev->list, &drm_component_list);
-	mutex_unlock(&drm_component_lock);
+	for (i = 0; i < ARRAY_SIZE(compatible_tbls); i++) {
+		struct device_node *node;
+		int ret;
 
-	return 0;
-}
+		node = of_find_compatible_node(NULL, NULL,
+				compatible_tbls[i]);
 
-void exynos_drm_component_del(struct device *dev,
-				const struct component_ops *ops)
-{
-	struct component_dev *cdev, *next;
+		ret = of_device_is_available(node);
+		if (!ret)
+			continue;
 
-	mutex_lock(&drm_component_lock);
+		ret = component_master_add_child(m, compare_of, node);
+		of_node_put(node);
 
-	list_for_each_entry_safe(cdev, next, &drm_component_list, list) {
-		if (dev == cdev->dev) {
-			list_del(&cdev->list);
-			kfree(cdev);
-			mutex_unlock(&drm_component_lock);
-			break;
-		}
+		if (!ret)
+			attached_cnt++;
 	}
 
-	mutex_unlock(&drm_component_lock);
-
-	component_del(dev, ops);
-}
+	if (!attached_cnt)
+		return -ENXIO;
 
-static int compare_of(struct device *dev, void *data)
-{
-	return dev == (struct device *)data;
+	return 0;
 }
 
 static int exynos_drm_add_components(struct device *dev, struct master *m)
 {
+	struct device_node *np = dev->of_node;
 	unsigned int attached_cnt = 0;
-	struct component_dev *cdev;
+	unsigned int i;
 
-	mutex_lock(&drm_component_lock);
+	if (!dev->of_node)
+		return exynos_drm_bind_lagacy_dt(dev, m);
 
-	list_for_each_entry(cdev, &drm_component_list, list) {
+	for (i = 0;; i++) {
+		struct device_node *node;
 		int ret;
 
-		mutex_unlock(&drm_component_lock);
+		node = of_parse_phandle(np, "ports", i);
+		if (!node)
+			break;
+
+		ret = component_master_add_child(m, compare_of, node);
+		of_node_put(node);
 
-		ret = component_master_add_child(m, compare_of, cdev->dev);
 		if (!ret)
 			attached_cnt++;
-
-		mutex_lock(&drm_component_lock);
 	}
 
-	mutex_unlock(&drm_component_lock);
-
 	if (!attached_cnt)
 		return -ENXIO;
 
@@ -642,6 +628,13 @@ static int exynos_drm_platform_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct of_device_id exynos_drm_dt_match[] = {
+	{ .compatible = "samsung,exynos-display-subsystem", },
+	{},
+};
+
+MODULE_DEVICE_TABLE(of, exynos_drm_dt_match);
+
 static struct platform_driver exynos_drm_platform_driver = {
 	.probe	= exynos_drm_platform_probe,
 	.remove	= exynos_drm_platform_remove,
@@ -649,17 +642,23 @@ static struct platform_driver exynos_drm_platform_driver = {
 		.owner	= THIS_MODULE,
 		.name	= "exynos-drm",
 		.pm	= &exynos_drm_pm_ops,
+		.of_match_table	= exynos_drm_dt_match,
 	},
 };
 
 static int exynos_drm_init(void)
 {
+	const char *name = "samsung,exynos-display-subsystem";
+	struct device_node *node;
 	int ret;
 
-	exynos_drm_pdev = platform_device_register_simple("exynos-drm", -1,
-								NULL, 0);
-	if (IS_ERR(exynos_drm_pdev))
-		return PTR_ERR(exynos_drm_pdev);
+	node = of_find_compatible_node(NULL, NULL, name);
+	if (!node) {
+		exynos_drm_pdev = platform_device_register_simple("exynos-drm",
+				-1, NULL, 0);
+		if (IS_ERR(exynos_drm_pdev))
+			return PTR_ERR(exynos_drm_pdev);
+	}
 
 #ifdef CONFIG_DRM_EXYNOS_VIDI
 	ret = exynos_drm_probe_vidi();
diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.h b/drivers/gpu/drm/exynos/exynos_drm_drv.h
index d955f60..fc15fe6 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.h
@@ -356,13 +356,6 @@ void exynos_drm_remove_vidi(void);
 int exynos_drm_create_enc_conn(struct drm_device *dev,
 				struct exynos_drm_display *display);
 
-struct component_ops;
-int exynos_drm_component_add(struct device *dev,
-				const struct component_ops *ops);
-
-void exynos_drm_component_del(struct device *dev,
-				const struct component_ops *ops);
-
 extern struct platform_driver fimd_driver;
 extern struct platform_driver dp_driver;
 extern struct platform_driver dsi_driver;
diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index ae81124..6a90855 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -1495,12 +1495,12 @@ static int exynos_dsi_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, &exynos_dsi_display);
 
-	return exynos_drm_component_add(&pdev->dev, &exynos_dsi_component_ops);
+	return component_add(&pdev->dev, &exynos_dsi_component_ops);
 }
 
 static int exynos_dsi_remove(struct platform_device *pdev)
 {
-	exynos_drm_component_del(&pdev->dev, &exynos_dsi_component_ops);
+	component_del(&pdev->dev, &exynos_dsi_component_ops);
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
index a6d6386..dd8637b 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
@@ -958,14 +958,14 @@ static int fimd_probe(struct platform_device *pdev)
 
 	pm_runtime_enable(&pdev->dev);
 
-	return exynos_drm_component_add(&pdev->dev, &fimd_component_ops);
+	return component_add(&pdev->dev, &fimd_component_ops);
 }
 
 static int fimd_remove(struct platform_device *pdev)
 {
 	pm_runtime_disable(&pdev->dev);
 
-	exynos_drm_component_del(&pdev->dev, &fimd_component_ops);
+	component_del(&pdev->dev, &fimd_component_ops);
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
index 675996a..de23090 100644
--- a/drivers/gpu/drm/exynos/exynos_hdmi.c
+++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
@@ -2168,7 +2168,7 @@ static int hdmi_probe(struct platform_device *pdev)
 	pm_runtime_enable(dev);
 	hdmi_display.ctx = hdata;
 
-	return exynos_drm_component_add(&pdev->dev, &hdmi_component_ops);
+	return component_add(&pdev->dev, &hdmi_component_ops);
 
 err_hdmiphy:
 	put_device(&hdata->hdmiphy_port->dev);
@@ -2186,7 +2186,7 @@ static int hdmi_remove(struct platform_device *pdev)
 
 	pm_runtime_disable(&pdev->dev);
 
-	exynos_drm_component_del(&pdev->dev, &hdmi_component_ops);
+	component_del(&pdev->dev, &hdmi_component_ops);
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exynos/exynos_mixer.c
index 483d7c0..d46a262 100644
--- a/drivers/gpu/drm/exynos/exynos_mixer.c
+++ b/drivers/gpu/drm/exynos/exynos_mixer.c
@@ -1273,12 +1273,12 @@ static const struct component_ops mixer_component_ops = {
 
 static int mixer_probe(struct platform_device *pdev)
 {
-	return exynos_drm_component_add(&pdev->dev, &mixer_component_ops);
+	return component_add(&pdev->dev, &mixer_component_ops);
 }
 
 static int mixer_remove(struct platform_device *pdev)
 {
-	exynos_drm_component_del(&pdev->dev, &mixer_component_ops);
+	component_del(&pdev->dev, &mixer_component_ops);
 	return 0;
 }
 
-- 
1.7.9.5
