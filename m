Return-Path: <SRS0=sx2+=CU=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A058EC43461
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 11 Sep 2020 16:54:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 72062207FB
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 11 Sep 2020 16:54:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726336AbgIKQxv (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 11 Sep 2020 12:53:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726345AbgIKPGQ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 11 Sep 2020 11:06:16 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62321C06138F
        for <linux-samsung-soc@vger.kernel.org>; Fri, 11 Sep 2020 06:54:30 -0700 (PDT)
Received: from [2a0a:edc0:0:1101:1d::39] (helo=dude03.red.stw.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1kGjVN-0007wb-RG; Fri, 11 Sep 2020 15:54:23 +0200
Received: from mtr by dude03.red.stw.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@dude03.red.stw.pengutronix.de>)
        id 1kGjVH-00FKo2-Pu; Fri, 11 Sep 2020 15:54:15 +0200
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc:     kernel@pengutronix.de, Laurent.pinchart@ideasonboard.com,
        krzk@kernel.org, narmstrong@baylibre.com, b.zolnierkie@samsung.com,
        sylvester.nawrocki@gmail.com, a.hajda@samsung.com,
        inki.dae@samsung.com, jy0922.shim@samsung.com,
        sw0312.kim@samsung.com, Michael Tretter <m.tretter@pengutronix.de>
Date:   Fri, 11 Sep 2020 15:54:11 +0200
Message-Id: <20200911135413.3654800-15-m.tretter@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200911135413.3654800-1-m.tretter@pengutronix.de>
References: <20200911135413.3654800-1-m.tretter@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::39
X-SA-Exim-Mail-From: mtr@pengutronix.de
Subject: [PATCH v2 14/16] drm/exynos: add API functions for platform drivers
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on metis.ext.pengutronix.de)
X-PTX-Original-Recipient: linux-samsung-soc@vger.kernel.org
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Add new functions for the probe/remove API, the bind/unbind API and
resume/suspend calls. Move everything exynos drm specific into separate
functions, which can easily be moved to other files.

Also split struct exynos_dsi into a generic and a platform specific
struct.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
v2:
- new patch
---
 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 114 +++++++++++++++++-------
 1 file changed, 82 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index b9216785b2d7..ad70f5ce81ad 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -265,7 +265,6 @@ struct exynos_dsi_driver_data {
 };
 
 struct exynos_dsi {
-	struct drm_encoder encoder;
 	struct drm_bridge bridge;
 	struct mipi_dsi_host dsi_host;
 	struct drm_connector connector;
@@ -419,6 +418,11 @@ enum reg_value_idx {
 	PHYTIMING_HS_TRAIL
 };
 
+struct exynos_dsi_pltfm {
+	struct exynos_dsi *dsi;
+	struct drm_encoder encoder;
+};
+
 static const unsigned int reg_values[] = {
 	[RESET_TYPE] = DSIM_SWRST,
 	[PLL_TIMER] = 500,
@@ -476,7 +480,7 @@ static const unsigned int exynos5433_reg_values[] = {
 static int __exynos_dsi_host_attach(struct device *dev,
 				    struct mipi_dsi_device *device)
 {
-	struct exynos_dsi *dsi = dev_get_drvdata(dev);
+	struct exynos_dsi_pltfm *dsi = dev_get_drvdata(dev);
 	struct drm_device *drm = dsi->encoder.dev;
 	struct exynos_drm_crtc *crtc;
 
@@ -494,7 +498,7 @@ static int __exynos_dsi_host_attach(struct device *dev,
 static int __exynos_dsi_host_detach(struct device *dev,
 				     struct mipi_dsi_device *device)
 {
-	struct exynos_dsi *dsi = dev_get_drvdata(dev);
+	struct exynos_dsi_pltfm *dsi = dev_get_drvdata(dev);
 	struct drm_device *drm = dsi->encoder.dev;
 
 	if (drm->mode_config.poll_enabled)
@@ -505,7 +509,7 @@ static int __exynos_dsi_host_detach(struct device *dev,
 
 static void __exynos_dsi_te_handler(struct device *dev)
 {
-	struct exynos_dsi *dsi = dev_get_drvdata(dev);
+	struct exynos_dsi_pltfm *dsi = dev_get_drvdata(dev);
 
 	exynos_drm_crtc_te_handler(dsi->encoder.crtc);
 }
@@ -1804,10 +1808,12 @@ static int exynos_dsi_parse_dt(struct exynos_dsi *dsi)
 	return 0;
 }
 
-static int exynos_dsi_bind(struct device *dev, struct device *master,
-				void *data)
+static int exynos_dsi_bind(struct exynos_dsi *dsi, struct drm_encoder *encoder);
+static void exynos_dsi_unbind(struct exynos_dsi *dsi);
+
+static int exynos_dsi_pltfm_bind(struct device *dev, struct device *master, void *data)
 {
-	struct exynos_dsi *dsi = dev_get_drvdata(dev);
+	struct exynos_dsi_pltfm *dsi = dev_get_drvdata(dev);
 	struct drm_encoder *encoder = &dsi->encoder;
 	struct drm_device *drm_dev = data;
 	struct device_node *in_bridge_node;
@@ -1828,7 +1834,7 @@ static int exynos_dsi_bind(struct device *dev, struct device *master,
 		of_node_put(in_bridge_node);
 	}
 
-	ret = drm_bridge_attach(encoder, &dsi->bridge, in_bridge, 0);
+	ret = exynos_dsi_bind(dsi->dsi, encoder);
 	if (ret)
 		goto err;
 
@@ -1839,20 +1845,20 @@ static int exynos_dsi_bind(struct device *dev, struct device *master,
 	return ret;
 }
 
-static void exynos_dsi_unbind(struct device *dev, struct device *master,
-				void *data)
+static void exynos_dsi_pltfm_unbind(struct device *dev, struct device *master,
+				    void *data)
 {
-	struct exynos_dsi *dsi = dev_get_drvdata(dev);
+	struct exynos_dsi_pltfm *dsi = dev_get_drvdata(dev);
 	struct drm_encoder *encoder = &dsi->encoder;
 
-	exynos_dsi_disable(dsi);
+	exynos_dsi_unbind(dsi->dsi);
 
 	drm_encoder_cleanup(encoder);
 }
 
-static const struct component_ops exynos_dsi_component_ops = {
-	.bind	= exynos_dsi_bind,
-	.unbind	= exynos_dsi_unbind,
+static const struct component_ops exynos_dsi_pltfm_component_ops = {
+	.bind	= exynos_dsi_pltfm_bind,
+	.unbind	= exynos_dsi_pltfm_unbind,
 };
 
 static struct exynos_dsi *__exynos_dsi_probe(struct platform_device *pdev)
@@ -1963,20 +1969,52 @@ static void __exynos_dsi_remove(struct exynos_dsi *dsi)
 	mipi_dsi_host_unregister(&dsi->dsi_host);
 }
 
-static int exynos_dsi_probe(struct platform_device *pdev)
+/*
+ * Probe/remove API, used from platforms based on the DRM bridge API.
+ */
+static struct exynos_dsi *exynos_dsi_probe(struct platform_device *pdev)
 {
-	struct exynos_dsi *dsi;
+	return __exynos_dsi_probe(pdev);
+}
+
+static void exynos_dsi_remove(struct exynos_dsi *dsi)
+{
+	return __exynos_dsi_remove(dsi);
+}
+
+/*
+ * Bind/unbind API, used from platforms based on the component framework.
+ */
+static int exynos_dsi_bind(struct exynos_dsi *dsi, struct drm_encoder *encoder)
+{
+	struct drm_bridge *previous = drm_bridge_chain_get_first_bridge(encoder);
+
+	return drm_bridge_attach(encoder, &dsi->bridge, previous, 0);
+}
+
+static void exynos_dsi_unbind(struct exynos_dsi *dsi)
+{
+	exynos_dsi_disable(dsi);
+}
+
+static int exynos_dsi_pltfm_probe(struct platform_device *pdev)
+{
+	struct exynos_dsi_pltfm *dsi;
 	struct device *dev = &pdev->dev;
 	int ret;
 
-	dsi = __exynos_dsi_probe(pdev);
-	if (IS_ERR(dsi))
-		return PTR_ERR(dsi);
+	dsi = devm_kzalloc(dev, sizeof(*dsi), GFP_KERNEL);
+	if (!dsi)
+		return -ENOMEM;
 	platform_set_drvdata(pdev, dsi);
 
+	dsi->dsi = exynos_dsi_probe(pdev);
+	if (IS_ERR(dsi->dsi))
+		return PTR_ERR(dsi->dsi);
+
 	pm_runtime_enable(dev);
 
-	ret = component_add(dev, &exynos_dsi_component_ops);
+	ret = component_add(dev, &exynos_dsi_pltfm_component_ops);
 	if (ret)
 		goto err_disable_runtime;
 
@@ -1988,22 +2026,21 @@ static int exynos_dsi_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int exynos_dsi_remove(struct platform_device *pdev)
+static int exynos_dsi_pltfm_remove(struct platform_device *pdev)
 {
-	struct exynos_dsi *dsi = platform_get_drvdata(pdev);
+	struct exynos_dsi_pltfm *dsi = platform_get_drvdata(pdev);
 
 	pm_runtime_disable(&pdev->dev);
 
-	__exynos_dsi_remove(dsi);
+	exynos_dsi_remove(dsi->dsi);
 
-	component_del(&pdev->dev, &exynos_dsi_component_ops);
+	component_del(&pdev->dev, &exynos_dsi_pltfm_component_ops);
 
 	return 0;
 }
 
-static int __maybe_unused exynos_dsi_suspend(struct device *dev)
+static int exynos_dsi_suspend(struct exynos_dsi *dsi)
 {
-	struct exynos_dsi *dsi = dev_get_drvdata(dev);
 	const struct exynos_dsi_driver_data *driver_data = dsi->driver_data;
 	int ret, i;
 
@@ -2031,9 +2068,8 @@ static int __maybe_unused exynos_dsi_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused exynos_dsi_resume(struct device *dev)
+static int exynos_dsi_resume(struct exynos_dsi *dsi)
 {
-	struct exynos_dsi *dsi = dev_get_drvdata(dev);
 	const struct exynos_dsi_driver_data *driver_data = dsi->driver_data;
 	int ret, i;
 
@@ -2065,15 +2101,29 @@ static int __maybe_unused exynos_dsi_resume(struct device *dev)
 	return ret;
 }
 
+static int __maybe_unused exynos_dsi_pltfm_suspend(struct device *dev)
+{
+	struct exynos_dsi_pltfm *dsi = dev_get_drvdata(dev);
+
+	return exynos_dsi_suspend(dsi->dsi);
+}
+
+static int __maybe_unused exynos_dsi_pltfm_resume(struct device *dev)
+{
+	struct exynos_dsi_pltfm *dsi = dev_get_drvdata(dev);
+
+	return exynos_dsi_resume(dsi->dsi);
+}
+
 static const struct dev_pm_ops exynos_dsi_pm_ops = {
-	SET_RUNTIME_PM_OPS(exynos_dsi_suspend, exynos_dsi_resume, NULL)
+	SET_RUNTIME_PM_OPS(exynos_dsi_pltfm_suspend, exynos_dsi_pltfm_resume, NULL)
 	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
 				pm_runtime_force_resume)
 };
 
 struct platform_driver dsi_driver = {
-	.probe = exynos_dsi_probe,
-	.remove = exynos_dsi_remove,
+	.probe = exynos_dsi_pltfm_probe,
+	.remove = exynos_dsi_pltfm_remove,
 	.driver = {
 		   .name = "exynos-dsi",
 		   .owner = THIS_MODULE,
-- 
2.20.1

