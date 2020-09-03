Return-Path: <SRS0=oxPC=CM=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58B0CC43461
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  3 Sep 2020 16:57:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4319B206A5
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  3 Sep 2020 16:57:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728975AbgICQ5a (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 3 Sep 2020 12:57:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728514AbgICQ5Z (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 3 Sep 2020 12:57:25 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55185C061244
        for <linux-samsung-soc@vger.kernel.org>; Thu,  3 Sep 2020 09:57:25 -0700 (PDT)
Received: from [2a0a:edc0:0:1101:1d::39] (helo=dude03.red.stw.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1kDsY5-0003Y6-GD; Thu, 03 Sep 2020 18:57:23 +0200
Received: from mtr by dude03.red.stw.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@dude03.red.stw.pengutronix.de>)
        id 1kDsY3-005L3B-J4; Thu, 03 Sep 2020 18:57:19 +0200
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc:     kernel@pengutronix.de, Laurent.pinchart@ideasonboard.com,
        krzk@kernel.org, narmstrong@baylibre.com,
        Michael Tretter <m.tretter@pengutronix.de>
Date:   Thu,  3 Sep 2020 18:57:05 +0200
Message-Id: <20200903165717.1272492-5-m.tretter@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200903165717.1272492-1-m.tretter@pengutronix.de>
References: <20200903165717.1272492-1-m.tretter@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::39
X-SA-Exim-Mail-From: mtr@pengutronix.de
Subject: [PATCH 04/16] drm/exynos: implement a drm bridge
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on metis.ext.pengutronix.de)
X-PTX-Original-Recipient: linux-samsung-soc@vger.kernel.org
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Make the exynos_dsi driver a full drm bridge that can be found and used
from other drivers.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 45 +++++++++++++++++++++++--
 1 file changed, 42 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index ddbda33dea91..4d19630f33e7 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -253,6 +253,7 @@ struct exynos_dsi_driver_data {
 
 struct exynos_dsi {
 	struct drm_encoder encoder;
+	struct drm_bridge bridge;
 	struct mipi_dsi_host dsi_host;
 	struct drm_connector connector;
 	struct drm_panel *panel;
@@ -1523,19 +1524,43 @@ static const struct drm_encoder_helper_funcs exynos_dsi_encoder_helper_funcs = {
 	.disable = exynos_dsi_disable,
 };
 
+static int exynos_dsi_bridge_attach(struct drm_bridge *bridge,
+				    enum drm_bridge_attach_flags flags)
+{
+	struct exynos_dsi *dsi = bridge->driver_private;
+
+	if (!bridge->encoder) {
+		dev_err(dsi->dev, "missing encoder\n");
+		return -ENODEV;
+	}
+
+	return 0;
+}
+
+static const struct drm_bridge_funcs exynos_dsi_bridge_funcs = {
+	.attach = exynos_dsi_bridge_attach,
+};
+
 MODULE_DEVICE_TABLE(of, exynos_dsi_of_match);
 
 static int exynos_dsi_host_attach(struct mipi_dsi_host *host,
 				  struct mipi_dsi_device *device)
 {
 	struct exynos_dsi *dsi = host_to_dsi(host);
-	struct drm_encoder *encoder = &dsi->encoder;
-	struct drm_device *drm = encoder->dev;
+	struct drm_bridge *bridge = &dsi->bridge;
+	struct drm_encoder *encoder;
+	struct drm_device *drm;
 	struct drm_bridge *out_bridge;
 
+	if (!bridge->encoder)
+		return -EPROBE_DEFER;
+
+	encoder = bridge->encoder;
+	drm = encoder->dev;
+
 	out_bridge  = of_drm_find_bridge(device->dev.of_node);
 	if (out_bridge) {
-		drm_bridge_attach(encoder, out_bridge, NULL, 0);
+		drm_bridge_attach(encoder, out_bridge, bridge, 0);
 		dsi->out_bridge = out_bridge;
 		list_splice_init(&encoder->bridge_chain, &dsi->bridge_chain);
 	} else {
@@ -1715,6 +1740,10 @@ static int exynos_dsi_bind(struct device *dev, struct device *master,
 		of_node_put(in_bridge_node);
 	}
 
+	ret = drm_bridge_attach(encoder, &dsi->bridge, in_bridge, 0);
+	if (ret)
+		return ret;
+
 	return mipi_dsi_host_register(&dsi->dsi_host);
 }
 
@@ -1740,6 +1769,7 @@ static struct exynos_dsi *__exynos_dsi_probe(struct platform_device *pdev)
 	struct resource *res;
 	struct exynos_dsi *dsi;
 	int ret, i;
+	struct drm_bridge *bridge;
 
 	dsi = devm_kzalloc(dev, sizeof(*dsi), GFP_KERNEL);
 	if (!dsi)
@@ -1823,11 +1853,20 @@ static struct exynos_dsi *__exynos_dsi_probe(struct platform_device *pdev)
 
 	pm_runtime_enable(dev);
 
+	bridge = &dsi->bridge;
+	bridge->driver_private = dsi;
+	bridge->funcs = &exynos_dsi_bridge_funcs;
+	bridge->of_node = dev->of_node;
+
+	drm_bridge_add(bridge);
+
 	return dsi;
 }
 
 static void __exynos_dsi_remove(struct exynos_dsi *dsi)
 {
+	drm_bridge_remove(&dsi->bridge);
+
 	pm_runtime_disable(dsi->dev);
 }
 
-- 
2.20.1

