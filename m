Return-Path: <SRS0=oxPC=CM=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38E89C2BC0E
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  3 Sep 2020 16:57:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1F90A208C7
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  3 Sep 2020 16:57:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728947AbgICQ5j (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 3 Sep 2020 12:57:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728708AbgICQ50 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 3 Sep 2020 12:57:26 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E52DC061247
        for <linux-samsung-soc@vger.kernel.org>; Thu,  3 Sep 2020 09:57:25 -0700 (PDT)
Received: from [2a0a:edc0:0:1101:1d::39] (helo=dude03.red.stw.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1kDsY5-0003Y3-GD; Thu, 03 Sep 2020 18:57:23 +0200
Received: from mtr by dude03.red.stw.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@dude03.red.stw.pengutronix.de>)
        id 1kDsY3-005L37-Hv; Thu, 03 Sep 2020 18:57:19 +0200
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc:     kernel@pengutronix.de, Laurent.pinchart@ideasonboard.com,
        krzk@kernel.org, narmstrong@baylibre.com,
        Michael Tretter <m.tretter@pengutronix.de>
Date:   Thu,  3 Sep 2020 18:57:03 +0200
Message-Id: <20200903165717.1272492-3-m.tretter@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200903165717.1272492-1-m.tretter@pengutronix.de>
References: <20200903165717.1272492-1-m.tretter@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::39
X-SA-Exim-Mail-From: mtr@pengutronix.de
Subject: [PATCH 02/16] drm/exynos: extract helper functions for probe
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on metis.ext.pengutronix.de)
X-PTX-Original-Recipient: linux-samsung-soc@vger.kernel.org
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

As the driver shall be usable with drivers that use the component
framework and drivers that don't, split the common probing code into a
separate function that can be called from different locations.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 54 ++++++++++++++-----------
 1 file changed, 30 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index b38e9b592b8a..32f999dfd8c1 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -1734,7 +1734,7 @@ static const struct component_ops exynos_dsi_component_ops = {
 	.unbind	= exynos_dsi_unbind,
 };
 
-static int exynos_dsi_probe(struct platform_device *pdev)
+static struct exynos_dsi *__exynos_dsi_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct resource *res;
@@ -1743,7 +1743,7 @@ static int exynos_dsi_probe(struct platform_device *pdev)
 
 	dsi = devm_kzalloc(dev, sizeof(*dsi), GFP_KERNEL);
 	if (!dsi)
-		return -ENOMEM;
+		return ERR_PTR(-ENOMEM);
 
 	/* To be checked as invalid one */
 	dsi->te_gpio = -ENOENT;
@@ -1766,14 +1766,14 @@ static int exynos_dsi_probe(struct platform_device *pdev)
 	if (ret) {
 		if (ret != -EPROBE_DEFER)
 			dev_info(dev, "failed to get regulators: %d\n", ret);
-		return ret;
+		return ERR_PTR(ret);
 	}
 
 	dsi->clks = devm_kcalloc(dev,
 			dsi->driver_data->num_clks, sizeof(*dsi->clks),
 			GFP_KERNEL);
 	if (!dsi->clks)
-		return -ENOMEM;
+		return ERR_PTR(-ENOMEM);
 
 	for (i = 0; i < dsi->driver_data->num_clks; i++) {
 		dsi->clks[i] = devm_clk_get(dev, clk_names[i]);
@@ -1787,7 +1787,7 @@ static int exynos_dsi_probe(struct platform_device *pdev)
 
 			dev_info(dev, "failed to get the clock: %s\n",
 					clk_names[i]);
-			return PTR_ERR(dsi->clks[i]);
+			return ERR_PTR(PTR_ERR(dsi->clks[i]));
 		}
 	}
 
@@ -1795,18 +1795,18 @@ static int exynos_dsi_probe(struct platform_device *pdev)
 	dsi->reg_base = devm_ioremap_resource(dev, res);
 	if (IS_ERR(dsi->reg_base)) {
 		dev_err(dev, "failed to remap io region\n");
-		return PTR_ERR(dsi->reg_base);
+		return dsi->reg_base;
 	}
 
 	dsi->phy = devm_phy_get(dev, "dsim");
 	if (IS_ERR(dsi->phy)) {
 		dev_info(dev, "failed to get dsim phy\n");
-		return PTR_ERR(dsi->phy);
+		return ERR_PTR(PTR_ERR(dsi->phy));
 	}
 
 	dsi->irq = platform_get_irq(pdev, 0);
 	if (dsi->irq < 0)
-		return dsi->irq;
+		return ERR_PTR(dsi->irq);
 
 	irq_set_status_flags(dsi->irq, IRQ_NOAUTOEN);
 	ret = devm_request_threaded_irq(dev, dsi->irq, NULL,
@@ -1814,37 +1814,43 @@ static int exynos_dsi_probe(struct platform_device *pdev)
 					dev_name(dev), dsi);
 	if (ret) {
 		dev_err(dev, "failed to request dsi irq\n");
-		return ret;
+		return ERR_PTR(ret);
 	}
 
 	ret = exynos_dsi_parse_dt(dsi);
 	if (ret)
-		return ret;
-
-	platform_set_drvdata(pdev, &dsi->encoder);
+		return ERR_PTR(ret);
 
 	pm_runtime_enable(dev);
 
-	ret = component_add(dev, &exynos_dsi_component_ops);
-	if (ret)
-		goto err_disable_runtime;
-
-	return 0;
+	return dsi;
+}
 
-err_disable_runtime:
-	pm_runtime_disable(dev);
+static void __exynos_dsi_remove(struct exynos_dsi *dsi)
+{
 	of_node_put(dsi->in_bridge_node);
 
-	return ret;
+	pm_runtime_disable(dsi->dev);
 }
 
-static int exynos_dsi_remove(struct platform_device *pdev)
+static int exynos_dsi_probe(struct platform_device *pdev)
 {
-	struct exynos_dsi *dsi = platform_get_drvdata(pdev);
+	struct exynos_dsi *dsi;
 
-	of_node_put(dsi->in_bridge_node);
+	dsi = __exynos_dsi_probe(pdev);
+	if (IS_ERR(dsi))
+		return PTR_ERR(dsi);
+	platform_set_drvdata(pdev, &dsi->encoder);
+
+	return component_add(&pdev->dev, &exynos_dsi_component_ops);
+}
+
+static int exynos_dsi_remove(struct platform_device *pdev)
+{
+	struct drm_encoder *encoder = platform_get_drvdata(pdev);
+	struct exynos_dsi *dsi = encoder_to_dsi(encoder);
 
-	pm_runtime_disable(&pdev->dev);
+	__exynos_dsi_remove(dsi);
 
 	component_del(&pdev->dev, &exynos_dsi_component_ops);
 
-- 
2.20.1

