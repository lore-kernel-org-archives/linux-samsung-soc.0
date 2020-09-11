Return-Path: <SRS0=sx2+=CU=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2632C433E2
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 11 Sep 2020 16:12:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9A150221EF
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 11 Sep 2020 16:12:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726620AbgIKQMl (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 11 Sep 2020 12:12:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726557AbgIKQMk (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 11 Sep 2020 12:12:40 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E85C1C0617BD
        for <linux-samsung-soc@vger.kernel.org>; Fri, 11 Sep 2020 06:54:27 -0700 (PDT)
Received: from [2a0a:edc0:0:1101:1d::39] (helo=dude03.red.stw.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1kGjVK-0007wW-47; Fri, 11 Sep 2020 15:54:18 +0200
Received: from mtr by dude03.red.stw.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@dude03.red.stw.pengutronix.de>)
        id 1kGjVH-00FKnn-NO; Fri, 11 Sep 2020 15:54:15 +0200
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc:     kernel@pengutronix.de, Laurent.pinchart@ideasonboard.com,
        krzk@kernel.org, narmstrong@baylibre.com, b.zolnierkie@samsung.com,
        sylvester.nawrocki@gmail.com, a.hajda@samsung.com,
        inki.dae@samsung.com, jy0922.shim@samsung.com,
        sw0312.kim@samsung.com, Michael Tretter <m.tretter@pengutronix.de>
Date:   Fri, 11 Sep 2020 15:54:06 +0200
Message-Id: <20200911135413.3654800-10-m.tretter@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200911135413.3654800-1-m.tretter@pengutronix.de>
References: <20200911135413.3654800-1-m.tretter@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::39
X-SA-Exim-Mail-From: mtr@pengutronix.de
Subject: [PATCH v2 09/16] drm/exynos: add callback for tearing effect handler
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on metis.ext.pengutronix.de)
X-PTX-Original-Recipient: linux-samsung-soc@vger.kernel.org
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The tearing effect interrupts are not handled by the MIPI DSI bridge
driver, but the display controller driver.

Allow platforms to register a callback for the tearing effect interrupt.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
v2:
- add handler as callback in host_ops
---
 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index 684a2fbef08a..2d75f9877dc0 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -243,6 +243,7 @@ struct exynos_dsi;
 struct exynos_dsi_host_ops {
 	int (*attach)(struct device *dev, struct mipi_dsi_device *device);
 	int (*detach)(struct device *dev, struct mipi_dsi_device *device);
+	void (*te_handler)(struct device *dev);
 };
 
 enum exynos_reg_offset {
@@ -504,9 +505,17 @@ static int __exynos_dsi_host_detach(struct device *dev,
 	return 0;
 }
 
+static void __exynos_dsi_te_handler(struct device *dev)
+{
+	struct exynos_dsi *dsi = dev_get_drvdata(dev);
+
+	exynos_drm_crtc_te_handler(dsi->encoder.crtc);
+}
+
 static const struct exynos_dsi_host_ops exynos_dsi_host_ops = {
 	.attach = __exynos_dsi_host_attach,
 	.detach = __exynos_dsi_host_detach,
+	.te_handler = __exynos_dsi_te_handler,
 };
 
 static const struct exynos_dsi_driver_data exynos3_dsi_driver_data = {
@@ -1354,11 +1363,12 @@ static irqreturn_t exynos_dsi_irq(int irq, void *dev_id)
 
 static irqreturn_t exynos_dsi_te_irq_handler(int irq, void *dev_id)
 {
-	struct exynos_dsi *dsi = (struct exynos_dsi *)dev_id;
-	struct drm_encoder *encoder = &dsi->encoder;
+	struct exynos_dsi *dsi = dev_id;
+	const struct exynos_dsi_host_ops *ops = dsi->driver_data->host_ops;
 
-	if (dsi->state & DSIM_STATE_VIDOUT_AVAILABLE)
-		exynos_drm_crtc_te_handler(encoder->crtc);
+	if (ops && ops->te_handler &&
+	    (dsi->state & DSIM_STATE_VIDOUT_AVAILABLE))
+		ops->te_handler(dsi->dsi_host.dev);
 
 	return IRQ_HANDLED;
 }
-- 
2.20.1

