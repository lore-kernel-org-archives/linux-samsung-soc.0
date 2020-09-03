Return-Path: <SRS0=oxPC=CM=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D255C2D0A7
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  3 Sep 2020 16:57:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4DD35208B3
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  3 Sep 2020 16:57:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728708AbgICQ5j (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 3 Sep 2020 12:57:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728780AbgICQ50 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 3 Sep 2020 12:57:26 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C51EC06124F
        for <linux-samsung-soc@vger.kernel.org>; Thu,  3 Sep 2020 09:57:25 -0700 (PDT)
Received: from [2a0a:edc0:0:1101:1d::39] (helo=dude03.red.stw.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1kDsY5-0003Y4-GN; Thu, 03 Sep 2020 18:57:23 +0200
Received: from mtr by dude03.red.stw.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@dude03.red.stw.pengutronix.de>)
        id 1kDsY3-005L3D-JY; Thu, 03 Sep 2020 18:57:19 +0200
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc:     kernel@pengutronix.de, Laurent.pinchart@ideasonboard.com,
        krzk@kernel.org, narmstrong@baylibre.com,
        Michael Tretter <m.tretter@pengutronix.de>
Date:   Thu,  3 Sep 2020 18:57:06 +0200
Message-Id: <20200903165717.1272492-6-m.tretter@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200903165717.1272492-1-m.tretter@pengutronix.de>
References: <20200903165717.1272492-1-m.tretter@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::39
X-SA-Exim-Mail-From: mtr@pengutronix.de
Subject: [PATCH 05/16] drm/exynos: convert encoder functions to bridge function
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on metis.ext.pengutronix.de)
X-PTX-Original-Recipient: linux-samsung-soc@vger.kernel.org
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

If other drivers use the exynos_dsi driver as a bridge, they might bring
their own encoder. Enable and disable the MIPI-DSI bridge using the
bridge functions instead of the encoder functions.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 33 +++++++++++++++----------
 1 file changed, 20 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index 4d19630f33e7..31d62c10614a 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -1376,9 +1376,8 @@ static void exynos_dsi_unregister_te_irq(struct exynos_dsi *dsi)
 	}
 }
 
-static void exynos_dsi_enable(struct drm_encoder *encoder)
+static void exynos_dsi_enable(struct exynos_dsi *dsi)
 {
-	struct exynos_dsi *dsi = encoder_to_dsi(encoder);
 	struct drm_bridge *iter;
 	int ret;
 
@@ -1426,9 +1425,8 @@ static void exynos_dsi_enable(struct drm_encoder *encoder)
 	pm_runtime_put(dsi->dev);
 }
 
-static void exynos_dsi_disable(struct drm_encoder *encoder)
+static void exynos_dsi_disable(struct exynos_dsi *dsi)
 {
-	struct exynos_dsi *dsi = encoder_to_dsi(encoder);
 	struct drm_bridge *iter;
 
 	if (!(dsi->state & DSIM_STATE_ENABLED))
@@ -1519,11 +1517,6 @@ static int exynos_dsi_create_connector(struct drm_encoder *encoder)
 	return 0;
 }
 
-static const struct drm_encoder_helper_funcs exynos_dsi_encoder_helper_funcs = {
-	.enable = exynos_dsi_enable,
-	.disable = exynos_dsi_disable,
-};
-
 static int exynos_dsi_bridge_attach(struct drm_bridge *bridge,
 				    enum drm_bridge_attach_flags flags)
 {
@@ -1537,8 +1530,24 @@ static int exynos_dsi_bridge_attach(struct drm_bridge *bridge,
 	return 0;
 }
 
+static void exynos_dsi_bridge_enable(struct drm_bridge *bridge)
+{
+	struct exynos_dsi *dsi = bridge->driver_private;
+
+	exynos_dsi_enable(dsi);
+}
+
+static void exynos_dsi_bridge_disable(struct drm_bridge *bridge)
+{
+	struct exynos_dsi *dsi = bridge->driver_private;
+
+	exynos_dsi_disable(dsi);
+}
+
 static const struct drm_bridge_funcs exynos_dsi_bridge_funcs = {
 	.attach = exynos_dsi_bridge_attach,
+	.enable = exynos_dsi_bridge_enable,
+	.disable = exynos_dsi_bridge_disable,
 };
 
 MODULE_DEVICE_TABLE(of, exynos_dsi_of_match);
@@ -1619,7 +1628,7 @@ static int exynos_dsi_host_detach(struct mipi_dsi_host *host,
 
 	if (dsi->panel) {
 		mutex_lock(&drm->mode_config.mutex);
-		exynos_dsi_disable(&dsi->encoder);
+		exynos_dsi_disable(dsi);
 		drm_panel_detach(dsi->panel);
 		dsi->panel = NULL;
 		dsi->connector.status = connector_status_disconnected;
@@ -1726,8 +1735,6 @@ static int exynos_dsi_bind(struct device *dev, struct device *master,
 
 	drm_simple_encoder_init(drm_dev, encoder, DRM_MODE_ENCODER_TMDS);
 
-	drm_encoder_helper_add(encoder, &exynos_dsi_encoder_helper_funcs);
-
 	ret = exynos_drm_set_possible_crtcs(encoder, EXYNOS_DISPLAY_TYPE_LCD);
 	if (ret < 0)
 		return ret;
@@ -1753,7 +1760,7 @@ static void exynos_dsi_unbind(struct device *dev, struct device *master,
 	struct drm_encoder *encoder = dev_get_drvdata(dev);
 	struct exynos_dsi *dsi = encoder_to_dsi(encoder);
 
-	exynos_dsi_disable(encoder);
+	exynos_dsi_disable(dsi);
 
 	mipi_dsi_host_unregister(&dsi->dsi_host);
 }
-- 
2.20.1

