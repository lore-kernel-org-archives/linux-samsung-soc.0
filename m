Return-Path: <SRS0=oxPC=CM=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A97D2C433E9
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  3 Sep 2020 16:57:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 93CAB20775
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  3 Sep 2020 16:57:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728085AbgICQ5Z (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 3 Sep 2020 12:57:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726678AbgICQ5Y (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 3 Sep 2020 12:57:24 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 099F2C061244
        for <linux-samsung-soc@vger.kernel.org>; Thu,  3 Sep 2020 09:57:24 -0700 (PDT)
Received: from [2a0a:edc0:0:1101:1d::39] (helo=dude03.red.stw.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1kDsY5-0003YC-GI; Thu, 03 Sep 2020 18:57:22 +0200
Received: from mtr by dude03.red.stw.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@dude03.red.stw.pengutronix.de>)
        id 1kDsY3-005L3W-Li; Thu, 03 Sep 2020 18:57:19 +0200
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc:     kernel@pengutronix.de, Laurent.pinchart@ideasonboard.com,
        krzk@kernel.org, narmstrong@baylibre.com,
        Michael Tretter <m.tretter@pengutronix.de>
Date:   Thu,  3 Sep 2020 18:57:11 +0200
Message-Id: <20200903165717.1272492-11-m.tretter@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200903165717.1272492-1-m.tretter@pengutronix.de>
References: <20200903165717.1272492-1-m.tretter@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::39
X-SA-Exim-Mail-From: mtr@pengutronix.de
Subject: [PATCH 10/16] drm/exynos: move dsi host registration to probe helper
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on metis.ext.pengutronix.de)
X-PTX-Original-Recipient: linux-samsung-soc@vger.kernel.org
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The bind/unbind API will be only used with the component framework, but
the mipi dsi host is always required. Therefore, move it to the shared
probe helper function.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index 7485097472dc..3bf4ae0fe6cc 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -1768,7 +1768,7 @@ static int exynos_dsi_bind(struct device *dev, struct device *master,
 	if (ret)
 		return ret;
 
-	return mipi_dsi_host_register(&dsi->dsi_host);
+	return 0;
 }
 
 static void exynos_dsi_unbind(struct device *dev, struct device *master,
@@ -1779,8 +1779,6 @@ static void exynos_dsi_unbind(struct device *dev, struct device *master,
 	exynos_dsi_disable(dsi);
 
 	__exynos_dsi_remove(dsi);
-
-	mipi_dsi_host_unregister(&dsi->dsi_host);
 }
 
 static const struct component_ops exynos_dsi_component_ops = {
@@ -1878,6 +1876,10 @@ static struct exynos_dsi *__exynos_dsi_probe(struct platform_device *pdev)
 
 	pm_runtime_enable(dev);
 
+	ret = mipi_dsi_host_register(&dsi->dsi_host);
+	if (ret)
+		return ERR_PTR(ret);
+
 	bridge = &dsi->bridge;
 	bridge->driver_private = dsi;
 	bridge->funcs = &exynos_dsi_bridge_funcs;
@@ -1892,6 +1894,8 @@ static void __exynos_dsi_remove(struct exynos_dsi *dsi)
 {
 	drm_bridge_remove(&dsi->bridge);
 
+	mipi_dsi_host_unregister(&dsi->dsi_host);
+
 	pm_runtime_disable(dsi->dev);
 }
 
-- 
2.20.1

