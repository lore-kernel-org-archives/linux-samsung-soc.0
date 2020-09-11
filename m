Return-Path: <SRS0=sx2+=CU=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B3C9C43461
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 11 Sep 2020 16:54:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3057C221E7
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 11 Sep 2020 16:54:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726239AbgIKQym (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 11 Sep 2020 12:54:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726329AbgIKPFu (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 11 Sep 2020 11:05:50 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B1C0C061388
        for <linux-samsung-soc@vger.kernel.org>; Fri, 11 Sep 2020 06:54:27 -0700 (PDT)
Received: from [2a0a:edc0:0:1101:1d::39] (helo=dude03.red.stw.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1kGjVK-0007wQ-4F; Fri, 11 Sep 2020 15:54:18 +0200
Received: from mtr by dude03.red.stw.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@dude03.red.stw.pengutronix.de>)
        id 1kGjVH-00FKnV-KR; Fri, 11 Sep 2020 15:54:15 +0200
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc:     kernel@pengutronix.de, Laurent.pinchart@ideasonboard.com,
        krzk@kernel.org, narmstrong@baylibre.com, b.zolnierkie@samsung.com,
        sylvester.nawrocki@gmail.com, a.hajda@samsung.com,
        inki.dae@samsung.com, jy0922.shim@samsung.com,
        sw0312.kim@samsung.com, Michael Tretter <m.tretter@pengutronix.de>
Date:   Fri, 11 Sep 2020 15:54:00 +0200
Message-Id: <20200911135413.3654800-4-m.tretter@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200911135413.3654800-1-m.tretter@pengutronix.de>
References: <20200911135413.3654800-1-m.tretter@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::39
X-SA-Exim-Mail-From: mtr@pengutronix.de
Subject: [PATCH v2 03/16] drm/exynos: use exynos_dsi as drvdata
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on metis.ext.pengutronix.de)
X-PTX-Original-Recipient: linux-samsung-soc@vger.kernel.org
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Use the exynos_dsi as drvdata instead of the encoder to further decouple
the driver from the encoder.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
v2: drop removal of encoder_to_dsi
---
 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index 29f941b02210..ed04064afbb2 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -1689,8 +1689,8 @@ static int exynos_dsi_parse_dt(struct exynos_dsi *dsi)
 static int exynos_dsi_bind(struct device *dev, struct device *master,
 				void *data)
 {
-	struct drm_encoder *encoder = dev_get_drvdata(dev);
-	struct exynos_dsi *dsi = encoder_to_dsi(encoder);
+	struct exynos_dsi *dsi = dev_get_drvdata(dev);
+	struct drm_encoder *encoder = &dsi->encoder;
 	struct drm_device *drm_dev = data;
 	struct device_node *in_bridge_node;
 	struct drm_bridge *in_bridge;
@@ -1718,8 +1718,8 @@ static int exynos_dsi_bind(struct device *dev, struct device *master,
 static void exynos_dsi_unbind(struct device *dev, struct device *master,
 				void *data)
 {
-	struct drm_encoder *encoder = dev_get_drvdata(dev);
-	struct exynos_dsi *dsi = encoder_to_dsi(encoder);
+	struct exynos_dsi *dsi = dev_get_drvdata(dev);
+	struct drm_encoder *encoder = &dsi->encoder;
 
 	exynos_dsi_disable(encoder);
 
@@ -1818,7 +1818,7 @@ static int exynos_dsi_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	platform_set_drvdata(pdev, &dsi->encoder);
+	platform_set_drvdata(pdev, dsi);
 
 	pm_runtime_enable(dev);
 
@@ -1845,8 +1845,7 @@ static int exynos_dsi_remove(struct platform_device *pdev)
 
 static int __maybe_unused exynos_dsi_suspend(struct device *dev)
 {
-	struct drm_encoder *encoder = dev_get_drvdata(dev);
-	struct exynos_dsi *dsi = encoder_to_dsi(encoder);
+	struct exynos_dsi *dsi = dev_get_drvdata(dev);
 	const struct exynos_dsi_driver_data *driver_data = dsi->driver_data;
 	int ret, i;
 
@@ -1876,8 +1875,7 @@ static int __maybe_unused exynos_dsi_suspend(struct device *dev)
 
 static int __maybe_unused exynos_dsi_resume(struct device *dev)
 {
-	struct drm_encoder *encoder = dev_get_drvdata(dev);
-	struct exynos_dsi *dsi = encoder_to_dsi(encoder);
+	struct exynos_dsi *dsi = dev_get_drvdata(dev);
 	const struct exynos_dsi_driver_data *driver_data = dsi->driver_data;
 	int ret, i;
 
-- 
2.20.1

