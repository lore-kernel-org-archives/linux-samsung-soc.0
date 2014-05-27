From: Inki Dae <inki.dae@samsung.com>
Subject: [PATCH 1/2] drm/exynos: consider deferred probe case
Date: Tue, 27 May 2014 21:42:42 +0900
Message-ID: <1401194563-803-2-git-send-email-inki.dae@samsung.com>
References: <1401194563-803-1-git-send-email-inki.dae@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:23923 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751747AbaE0Mmr (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 27 May 2014 08:42:47 -0400
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N6800HG7GN95YA0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 27 May 2014 21:42:45 +0900 (KST)
In-reply-to: <1401194563-803-1-git-send-email-inki.dae@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: airlied@linux.ie, dri-devel@lists.freedesktop.org
Cc: linux-samsung-soc@vger.kernel.org, a.hajda@samsung.com, rmk+kernel@arm.linux.org.uk, Inki Dae <inki.dae@samsung.com>

This patch makes sure that exynos drm framework handles deferred
probe case correctly.

Sub drivers could be probed before resources, clock, regulator,
phy or panel, are ready for them so we should make sure that exynos
drm core waits until all resources are ready and sub drivers are
probed correctly.

Signed-off-by: Inki Dae <inki.dae@samsung.com>
Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_dp_core.c  |   16 +++++++-
 drivers/gpu/drm/exynos/exynos_drm_drv.c  |   28 +++++++-------
 drivers/gpu/drm/exynos/exynos_drm_drv.h  |    7 +---
 drivers/gpu/drm/exynos/exynos_drm_dsi.c  |   31 +++++++++++----
 drivers/gpu/drm/exynos/exynos_drm_fimd.c |   49 +++++++++++++++++------
 drivers/gpu/drm/exynos/exynos_hdmi.c     |   62 ++++++++++++++++++++++--------
 drivers/gpu/drm/exynos/exynos_mixer.c    |   16 +++++++-
 7 files changed, 151 insertions(+), 58 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_dp_core.c b/drivers/gpu/drm/exynos/exynos_dp_core.c
index ff63901..7526f36 100644
--- a/drivers/gpu/drm/exynos/exynos_dp_core.c
+++ b/drivers/gpu/drm/exynos/exynos_dp_core.c
@@ -1328,12 +1328,24 @@ static const struct component_ops exynos_dp_ops = {
 
 static int exynos_dp_probe(struct platform_device *pdev)
 {
-	return exynos_drm_component_add(&pdev->dev, &exynos_dp_ops);
+	int ret;
+
+	ret = exynos_drm_component_add(&pdev->dev);
+	if (ret)
+		return ret;
+
+	ret = component_add(&pdev->dev, &exynos_dp_ops);
+	if (ret)
+		exynos_drm_component_del(&pdev->dev);
+
+	return ret;
 }
 
 static int exynos_dp_remove(struct platform_device *pdev)
 {
-	exynos_drm_component_del(&pdev->dev, &exynos_dp_ops);
+	component_del(&pdev->dev, &exynos_dp_ops);
+	exynos_drm_component_del(&pdev->dev);
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/gpu/drm/exynos/exynos_drm_drv.c
index c5a401ae..f611f5a 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
@@ -381,22 +381,25 @@ static const struct dev_pm_ops exynos_drm_pm_ops = {
 	SET_SYSTEM_SLEEP_PM_OPS(exynos_drm_sys_suspend, exynos_drm_sys_resume)
 };
 
-int exynos_drm_component_add(struct device *dev,
-				const struct component_ops *ops)
+int exynos_drm_component_add(struct device *dev)
 {
 	struct component_dev *cdev;
-	int ret;
+
+	mutex_lock(&drm_component_lock);
+
+	list_for_each_entry(cdev, &drm_component_list, list) {
+		if (cdev->dev == dev) {
+			mutex_unlock(&drm_component_lock);
+			return 0;
+		}
+	}
+
+	mutex_unlock(&drm_component_lock);
 
 	cdev = kzalloc(sizeof(*cdev), GFP_KERNEL);
 	if (!cdev)
 		return -ENOMEM;
 
-	ret = component_add(dev, ops);
-	if (ret) {
-		kfree(cdev);
-		return ret;
-	}
-
 	cdev->dev = dev;
 
 	mutex_lock(&drm_component_lock);
@@ -406,8 +409,7 @@ int exynos_drm_component_add(struct device *dev,
 	return 0;
 }
 
-void exynos_drm_component_del(struct device *dev,
-				const struct component_ops *ops)
+void exynos_drm_component_del(struct device *dev)
 {
 	struct component_dev *cdev, *next;
 
@@ -422,8 +424,6 @@ void exynos_drm_component_del(struct device *dev,
 	}
 
 	mutex_unlock(&drm_component_lock);
-
-	component_del(dev, ops);
 }
 
 static int compare_of(struct device *dev, void *data)
@@ -446,6 +446,8 @@ static int exynos_drm_add_components(struct device *dev, struct master *m)
 		ret = component_master_add_child(m, compare_of, cdev->dev);
 		if (!ret)
 			attached_cnt++;
+		else
+			return ret;
 
 		mutex_lock(&drm_component_lock);
 	}
diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.h b/drivers/gpu/drm/exynos/exynos_drm_drv.h
index e82e620..13480b2 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.h
@@ -354,12 +354,9 @@ void exynos_drm_remove_vidi(void);
 int exynos_drm_create_enc_conn(struct drm_device *dev,
 				struct exynos_drm_display *display);
 
-struct component_ops;
-int exynos_drm_component_add(struct device *dev,
-				const struct component_ops *ops);
+int exynos_drm_component_add(struct device *dev);
 
-void exynos_drm_component_del(struct device *dev,
-				const struct component_ops *ops);
+void exynos_drm_component_del(struct device *dev);
 
 extern struct platform_driver fimd_driver;
 extern struct platform_driver dp_driver;
diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index 84661fe..1421d9b 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -1423,10 +1423,15 @@ static int exynos_dsi_probe(struct platform_device *pdev)
 	struct exynos_dsi *dsi;
 	int ret;
 
+	ret = exynos_drm_component_add(&pdev->dev);
+	if (ret)
+		return ret;
+
 	dsi = devm_kzalloc(&pdev->dev, sizeof(*dsi), GFP_KERNEL);
 	if (!dsi) {
 		dev_err(&pdev->dev, "failed to allocate dsi object.\n");
-		return -ENOMEM;
+		ret = -ENOMEM;
+		goto err_del_component;
 	}
 
 	init_completion(&dsi->completed);
@@ -1440,7 +1445,7 @@ static int exynos_dsi_probe(struct platform_device *pdev)
 
 	ret = exynos_dsi_parse_dt(dsi);
 	if (ret)
-		return ret;
+		goto err_del_component;
 
 	dsi->supplies[0].supply = "vddcore";
 	dsi->supplies[1].supply = "vddio";
@@ -1467,7 +1472,8 @@ static int exynos_dsi_probe(struct platform_device *pdev)
 	dsi->reg_base = devm_ioremap_resource(&pdev->dev, res);
 	if (IS_ERR(dsi->reg_base)) {
 		dev_err(&pdev->dev, "failed to remap io region\n");
-		return PTR_ERR(dsi->reg_base);
+		ret = PTR_ERR(dsi->reg_base);
+		goto err_del_component;
 	}
 
 	dsi->phy = devm_phy_get(&pdev->dev, "dsim");
@@ -1479,7 +1485,8 @@ static int exynos_dsi_probe(struct platform_device *pdev)
 	dsi->irq = platform_get_irq(pdev, 0);
 	if (dsi->irq < 0) {
 		dev_err(&pdev->dev, "failed to request dsi irq resource\n");
-		return dsi->irq;
+		ret = dsi->irq;
+		goto err_del_component;
 	}
 
 	irq_set_status_flags(dsi->irq, IRQ_NOAUTOEN);
@@ -1488,19 +1495,29 @@ static int exynos_dsi_probe(struct platform_device *pdev)
 					dev_name(&pdev->dev), dsi);
 	if (ret) {
 		dev_err(&pdev->dev, "failed to request dsi irq\n");
-		return ret;
+		goto err_del_component;
 	}
 
 	exynos_dsi_display.ctx = dsi;
 
 	platform_set_drvdata(pdev, &exynos_dsi_display);
 
-	return exynos_drm_component_add(&pdev->dev, &exynos_dsi_component_ops);
+	ret = component_add(&pdev->dev, &exynos_dsi_component_ops);
+	if (ret)
+		goto err_del_component;
+
+	return ret;
+
+err_del_component:
+	exynos_drm_component_del(&pdev->dev);
+	return ret;
 }
 
 static int exynos_dsi_remove(struct platform_device *pdev)
 {
-	exynos_drm_component_del(&pdev->dev, &exynos_dsi_component_ops);
+	component_del(&pdev->dev, &exynos_dsi_component_ops);
+	exynos_drm_component_del(&pdev->dev);
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
index bd30d0c..5b85253 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
@@ -941,12 +941,21 @@ static int fimd_probe(struct platform_device *pdev)
 	struct resource *res;
 	int ret = -EINVAL;
 
-	if (!dev->of_node)
-		return -ENODEV;
+
+	ret = exynos_drm_component_add(&pdev->dev);
+	if (ret)
+		return ret;
+
+	if (!dev->of_node) {
+		ret = -ENODEV;
+		goto err_del_component;
+	}
 
 	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
-	if (!ctx)
-		return -ENOMEM;
+	if (!ctx) {
+		ret = -ENOMEM;
+		goto err_del_component;
+	}
 
 	ctx->dev = dev;
 	ctx->suspended = true;
@@ -959,32 +968,35 @@ static int fimd_probe(struct platform_device *pdev)
 	ctx->bus_clk = devm_clk_get(dev, "fimd");
 	if (IS_ERR(ctx->bus_clk)) {
 		dev_err(dev, "failed to get bus clock\n");
-		return PTR_ERR(ctx->bus_clk);
+		return -EPROBE_DEFER;
 	}
 
 	ctx->lcd_clk = devm_clk_get(dev, "sclk_fimd");
 	if (IS_ERR(ctx->lcd_clk)) {
 		dev_err(dev, "failed to get lcd clock\n");
-		return PTR_ERR(ctx->lcd_clk);
+		return -EPROBE_DEFER;
 	}
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 
 	ctx->regs = devm_ioremap_resource(dev, res);
-	if (IS_ERR(ctx->regs))
-		return PTR_ERR(ctx->regs);
+	if (IS_ERR(ctx->regs)) {
+		ret = PTR_ERR(ctx->regs);
+		goto err_del_component;
+	}
 
 	res = platform_get_resource_byname(pdev, IORESOURCE_IRQ, "vsync");
 	if (!res) {
 		dev_err(dev, "irq request failed.\n");
-		return -ENXIO;
+		ret = -ENXIO;
+		goto err_del_component;
 	}
 
 	ret = devm_request_irq(dev, res->start, fimd_irq_handler,
 							0, "drm_fimd", ctx);
 	if (ret) {
 		dev_err(dev, "irq request failed.\n");
-		return ret;
+		goto err_del_component;
 	}
 
 	ctx->driver_data = drm_fimd_get_driver_data(pdev);
@@ -1001,14 +1013,27 @@ static int fimd_probe(struct platform_device *pdev)
 
 	pm_runtime_enable(&pdev->dev);
 
-	return exynos_drm_component_add(&pdev->dev, &fimd_component_ops);
+	ret = component_add(&pdev->dev, &fimd_component_ops);
+	if (ret)
+		goto err_disable_pm_runtime;
+
+	return ret;
+
+err_disable_pm_runtime:
+	pm_runtime_disable(&pdev->dev);
+
+err_del_component:
+	exynos_drm_component_del(&pdev->dev);
+	return ret;
 }
 
 static int fimd_remove(struct platform_device *pdev)
 {
 	pm_runtime_disable(&pdev->dev);
 
-	exynos_drm_component_del(&pdev->dev, &fimd_component_ops);
+	component_del(&pdev->dev, &fimd_component_ops);
+	exynos_drm_component_del(&pdev->dev);
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
index e05c86a..5919800 100644
--- a/drivers/gpu/drm/exynos/exynos_hdmi.c
+++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
@@ -2275,24 +2275,36 @@ static int hdmi_probe(struct platform_device *pdev)
 	struct resource *res;
 	int ret;
 
-	if (!dev->of_node)
-		return -ENODEV;
+	ret = exynos_drm_component_add(&pdev->dev);
+	if (ret)
+		return ret;
+
+	if (!dev->of_node) {
+		ret = -ENODEV;
+		goto err_del_component;
+	}
 
 	pdata = drm_hdmi_dt_parse_pdata(dev);
-	if (!pdata)
-		return -EINVAL;
+	if (!pdata) {
+		ret = -EINVAL;
+		goto err_del_component;
+	}
 
 	hdata = devm_kzalloc(dev, sizeof(struct hdmi_context), GFP_KERNEL);
-	if (!hdata)
-		return -ENOMEM;
+	if (!hdata) {
+		ret = -ENOMEM;
+		goto err_del_component;
+	}
 
 	mutex_init(&hdata->hdmi_mutex);
 
 	platform_set_drvdata(pdev, &hdmi_display);
 
 	match = of_match_node(hdmi_match_types, dev->of_node);
-	if (!match)
-		return -ENODEV;
+	if (!match) {
+		ret = -ENODEV;
+		goto err_del_component;
+	}
 
 	drv_data = (struct hdmi_driver_data *)match->data;
 	hdata->type = drv_data->type;
@@ -2305,18 +2317,20 @@ static int hdmi_probe(struct platform_device *pdev)
 	ret = hdmi_resources_init(hdata);
 	if (ret) {
 		DRM_ERROR("hdmi_resources_init failed\n");
-		return -EINVAL;
+		return -EPROBE_DEFER;
 	}
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	hdata->regs = devm_ioremap_resource(dev, res);
-	if (IS_ERR(hdata->regs))
-		return PTR_ERR(hdata->regs);
+	if (IS_ERR(hdata->regs)) {
+		ret = PTR_ERR(hdata->regs);
+		goto err_del_component;
+	}
 
 	ret = devm_gpio_request(dev, hdata->hpd_gpio, "HPD");
 	if (ret) {
 		DRM_ERROR("failed to request HPD gpio\n");
-		return ret;
+		goto err_del_component;
 	}
 
 	ddc_node = hdmi_legacy_ddc_dt_binding(dev);
@@ -2327,14 +2341,15 @@ static int hdmi_probe(struct platform_device *pdev)
 	ddc_node = of_parse_phandle(dev->of_node, "ddc", 0);
 	if (!ddc_node) {
 		DRM_ERROR("Failed to find ddc node in device tree\n");
-		return -ENODEV;
+		ret = -ENODEV;
+		goto err_del_component;
 	}
 
 out_get_ddc_adpt:
 	hdata->ddc_adpt = of_find_i2c_adapter_by_node(ddc_node);
 	if (!hdata->ddc_adpt) {
 		DRM_ERROR("Failed to get ddc i2c adapter by node\n");
-		return -ENODEV;
+		return -EPROBE_DEFER;
 	}
 
 	phy_node = hdmi_legacy_phy_dt_binding(dev);
@@ -2361,7 +2376,7 @@ out_get_phy_port:
 		hdata->hdmiphy_port = of_find_i2c_device_by_node(phy_node);
 		if (!hdata->hdmiphy_port) {
 			DRM_ERROR("Failed to get hdmi phy i2c client\n");
-			ret = -ENODEV;
+			ret = -EPROBE_DEFER;
 			goto err_ddc;
 		}
 	}
@@ -2390,19 +2405,31 @@ out_get_phy_port:
 			"samsung,syscon-phandle");
 	if (IS_ERR(hdata->pmureg)) {
 		DRM_ERROR("syscon regmap lookup failed.\n");
+		ret = -EPROBE_DEFER;
 		goto err_hdmiphy;
 	}
 
 	pm_runtime_enable(dev);
 	hdmi_display.ctx = hdata;
 
-	return exynos_drm_component_add(&pdev->dev, &hdmi_component_ops);
+	ret = component_add(&pdev->dev, &hdmi_component_ops);
+	if (ret)
+		goto err_disable_pm_runtime;
+
+	return ret;
+
+err_disable_pm_runtime:
+	pm_runtime_disable(dev);
 
 err_hdmiphy:
 	if (hdata->hdmiphy_port)
 		put_device(&hdata->hdmiphy_port->dev);
 err_ddc:
 	put_device(&hdata->ddc_adpt->dev);
+
+err_del_component:
+	exynos_drm_component_del(&pdev->dev);
+
 	return ret;
 }
 
@@ -2416,8 +2443,9 @@ static int hdmi_remove(struct platform_device *pdev)
 	put_device(&hdata->ddc_adpt->dev);
 
 	pm_runtime_disable(&pdev->dev);
+	component_del(&pdev->dev, &hdmi_component_ops);
 
-	exynos_drm_component_del(&pdev->dev, &hdmi_component_ops);
+	exynos_drm_component_del(&pdev->dev);
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exynos/exynos_mixer.c
index 483d7c0..eaae17b 100644
--- a/drivers/gpu/drm/exynos/exynos_mixer.c
+++ b/drivers/gpu/drm/exynos/exynos_mixer.c
@@ -1273,12 +1273,24 @@ static const struct component_ops mixer_component_ops = {
 
 static int mixer_probe(struct platform_device *pdev)
 {
-	return exynos_drm_component_add(&pdev->dev, &mixer_component_ops);
+	int ret;
+
+	ret = exynos_drm_component_add(&pdev->dev);
+	if (ret)
+		return ret;
+
+	ret = component_add(&pdev->dev, &mixer_component_ops);
+	if (ret)
+		exynos_drm_component_del(&pdev->dev);
+
+	return ret;
 }
 
 static int mixer_remove(struct platform_device *pdev)
 {
-	exynos_drm_component_del(&pdev->dev, &mixer_component_ops);
+	component_del(&pdev->dev, &mixer_component_ops);
+	exynos_drm_component_del(&pdev->dev);
+
 	return 0;
 }
 
-- 
1.7.9.5
