Return-Path: <SRS0=sx2+=CU=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D203FC43461
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 11 Sep 2020 16:55:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 99F3C221E7
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 11 Sep 2020 16:55:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726025AbgIKQyi (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 11 Sep 2020 12:54:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726171AbgIKPGM (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 11 Sep 2020 11:06:12 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06DCDC0617BF
        for <linux-samsung-soc@vger.kernel.org>; Fri, 11 Sep 2020 06:54:27 -0700 (PDT)
Received: from [2a0a:edc0:0:1101:1d::39] (helo=dude03.red.stw.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1kGjVK-0007wS-4E; Fri, 11 Sep 2020 15:54:20 +0200
Received: from mtr by dude03.red.stw.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@dude03.red.stw.pengutronix.de>)
        id 1kGjVH-00FKnb-LN; Fri, 11 Sep 2020 15:54:15 +0200
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc:     kernel@pengutronix.de, Laurent.pinchart@ideasonboard.com,
        krzk@kernel.org, narmstrong@baylibre.com, b.zolnierkie@samsung.com,
        sylvester.nawrocki@gmail.com, a.hajda@samsung.com,
        inki.dae@samsung.com, jy0922.shim@samsung.com,
        sw0312.kim@samsung.com, Michael Tretter <m.tretter@pengutronix.de>
Date:   Fri, 11 Sep 2020 15:54:02 +0200
Message-Id: <20200911135413.3654800-6-m.tretter@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200911135413.3654800-1-m.tretter@pengutronix.de>
References: <20200911135413.3654800-1-m.tretter@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::39
X-SA-Exim-Mail-From: mtr@pengutronix.de
Subject: [PATCH v2 05/16] drm/exynos: move dsi host registration to probe
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on metis.ext.pengutronix.de)
X-PTX-Original-Recipient: linux-samsung-soc@vger.kernel.org
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Once the driver implements a drm_bridge, the bridge will be attached
during bind. The driver has to register the mipi dsi host before making
the driver available at the component framework, because the bridge is
only initialized when a mipi dsi device attaches.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
v2: none
---
 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index f8e64b74a6dd..41000214a5fe 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -1712,7 +1712,7 @@ static int exynos_dsi_bind(struct device *dev, struct device *master,
 		of_node_put(in_bridge_node);
 	}
 
-	return mipi_dsi_host_register(&dsi->dsi_host);
+	return 0;
 }
 
 static void exynos_dsi_unbind(struct device *dev, struct device *master,
@@ -1722,8 +1722,6 @@ static void exynos_dsi_unbind(struct device *dev, struct device *master,
 	struct drm_encoder *encoder = &dsi->encoder;
 
 	exynos_dsi_disable(encoder);
-
-	mipi_dsi_host_unregister(&dsi->dsi_host);
 }
 
 static const struct component_ops exynos_dsi_component_ops = {
@@ -1818,11 +1816,16 @@ static struct exynos_dsi *__exynos_dsi_probe(struct platform_device *pdev)
 	if (ret)
 		return ERR_PTR(ret);
 
+	ret = mipi_dsi_host_register(&dsi->dsi_host);
+	if (ret)
+		return ERR_PTR(ret);
+
 	return dsi;
 }
 
 static void __exynos_dsi_remove(struct exynos_dsi *dsi)
 {
+	mipi_dsi_host_unregister(&dsi->dsi_host);
 }
 
 static int exynos_dsi_probe(struct platform_device *pdev)
-- 
2.20.1

