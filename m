Return-Path: <SRS0=sx2+=CU=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60C12C43461
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 11 Sep 2020 16:53:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 244AB221E7
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 11 Sep 2020 16:53:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726258AbgIKQt4 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 11 Sep 2020 12:49:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726348AbgIKPGX (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 11 Sep 2020 11:06:23 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 621E2C06138E
        for <linux-samsung-soc@vger.kernel.org>; Fri, 11 Sep 2020 06:54:30 -0700 (PDT)
Received: from [2a0a:edc0:0:1101:1d::39] (helo=dude03.red.stw.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1kGjVN-0007wa-RF; Fri, 11 Sep 2020 15:54:22 +0200
Received: from mtr by dude03.red.stw.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@dude03.red.stw.pengutronix.de>)
        id 1kGjVH-00FKnz-PN; Fri, 11 Sep 2020 15:54:15 +0200
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc:     kernel@pengutronix.de, Laurent.pinchart@ideasonboard.com,
        krzk@kernel.org, narmstrong@baylibre.com, b.zolnierkie@samsung.com,
        sylvester.nawrocki@gmail.com, a.hajda@samsung.com,
        inki.dae@samsung.com, jy0922.shim@samsung.com,
        sw0312.kim@samsung.com, Michael Tretter <m.tretter@pengutronix.de>
Date:   Fri, 11 Sep 2020 15:54:10 +0200
Message-Id: <20200911135413.3654800-14-m.tretter@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200911135413.3654800-1-m.tretter@pengutronix.de>
References: <20200911135413.3654800-1-m.tretter@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::39
X-SA-Exim-Mail-From: mtr@pengutronix.de
Subject: [PATCH v2 13/16] drm/exynos: get encoder from bridge whenever possible
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on metis.ext.pengutronix.de)
X-PTX-Original-Recipient: linux-samsung-soc@vger.kernel.org
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The bridge will not necessarily use the encoder of struct exynos_dsi,
but might use another encoder from another drm driver. Therefore, the
driver has to use the encoder from the bridge instead of the one from
exynos_dsi.

In the future, the struct exynos_dsi will not have an encoder at all.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
v2:
- add removal of encoder_to_dsi
---
 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index 988447812333..b9216785b2d7 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -303,11 +303,6 @@ struct exynos_dsi {
 #define host_to_dsi(host) container_of(host, struct exynos_dsi, dsi_host)
 #define connector_to_dsi(c) container_of(c, struct exynos_dsi, connector)
 
-static inline struct exynos_dsi *encoder_to_dsi(struct drm_encoder *e)
-{
-	return container_of(e, struct exynos_dsi, encoder);
-}
-
 enum reg_idx {
 	DSIM_STATUS_REG,	/* Status register */
 	DSIM_SWRST_REG,		/* Software reset register */
@@ -1570,11 +1565,10 @@ static const struct drm_connector_helper_funcs exynos_dsi_connector_helper_funcs
 	.get_modes = exynos_dsi_get_modes,
 };
 
-static int exynos_dsi_create_connector(struct drm_encoder *encoder)
+static int exynos_dsi_create_connector(struct exynos_dsi *dsi)
 {
-	struct exynos_dsi *dsi = encoder_to_dsi(encoder);
 	struct drm_connector *connector = &dsi->connector;
-	struct drm_device *drm = encoder->dev;
+	struct drm_device *drm = dsi->bridge.dev;
 	int ret;
 
 	connector->polled = DRM_CONNECTOR_POLL_HPD;
@@ -1589,7 +1583,7 @@ static int exynos_dsi_create_connector(struct drm_encoder *encoder)
 
 	connector->status = connector_status_disconnected;
 	drm_connector_helper_add(connector, &exynos_dsi_connector_helper_funcs);
-	drm_connector_attach_encoder(connector, encoder);
+	drm_connector_attach_encoder(connector, dsi->bridge.encoder);
 	if (!drm->registered)
 		return 0;
 
@@ -1615,7 +1609,7 @@ static int exynos_dsi_bridge_attach(struct drm_bridge *bridge,
 			return ret;
 		list_splice_init(&encoder->bridge_chain, &dsi->bridge_chain);
 	} else {
-		ret = exynos_dsi_create_connector(encoder);
+		ret = exynos_dsi_create_connector(dsi);
 		if (ret)
 			return ret;
 
-- 
2.20.1

