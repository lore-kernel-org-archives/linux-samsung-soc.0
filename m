Return-Path: <SRS0=sx2+=CU=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15CA6C43461
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 11 Sep 2020 16:11:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E361122205
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 11 Sep 2020 16:11:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726636AbgIKQL0 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 11 Sep 2020 12:11:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726457AbgIKPhk (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 11 Sep 2020 11:37:40 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98108C06138B
        for <linux-samsung-soc@vger.kernel.org>; Fri, 11 Sep 2020 06:54:29 -0700 (PDT)
Received: from [2a0a:edc0:0:1101:1d::39] (helo=dude03.red.stw.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1kGjVN-0007wZ-R3; Fri, 11 Sep 2020 15:54:22 +0200
Received: from mtr by dude03.red.stw.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@dude03.red.stw.pengutronix.de>)
        id 1kGjVH-00FKnw-Ot; Fri, 11 Sep 2020 15:54:15 +0200
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc:     kernel@pengutronix.de, Laurent.pinchart@ideasonboard.com,
        krzk@kernel.org, narmstrong@baylibre.com, b.zolnierkie@samsung.com,
        sylvester.nawrocki@gmail.com, a.hajda@samsung.com,
        inki.dae@samsung.com, jy0922.shim@samsung.com,
        sw0312.kim@samsung.com, Michael Tretter <m.tretter@pengutronix.de>
Date:   Fri, 11 Sep 2020 15:54:09 +0200
Message-Id: <20200911135413.3654800-13-m.tretter@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200911135413.3654800-1-m.tretter@pengutronix.de>
References: <20200911135413.3654800-1-m.tretter@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::39
X-SA-Exim-Mail-From: mtr@pengutronix.de
Subject: [PATCH v2 12/16] drm/exynos: configure mode on drm bridge
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on metis.ext.pengutronix.de)
X-PTX-Original-Recipient: linux-samsung-soc@vger.kernel.org
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The driver uses the encoder to get the mode that shall be configured.
This is not possible, if the driver is used as a bridge, because the
encoder might not be used.

Use the mode_set function to set the display mode.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
v2: none
---
 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index a4f17d50d1d8..988447812333 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -288,6 +288,8 @@ struct exynos_dsi {
 	u32 mode_flags;
 	u32 format;
 
+	struct drm_display_mode mode;
+
 	int state;
 	struct drm_property *brightness;
 	struct completion completed;
@@ -961,7 +963,7 @@ static int exynos_dsi_init_link(struct exynos_dsi *dsi)
 
 static void exynos_dsi_set_display_mode(struct exynos_dsi *dsi)
 {
-	struct drm_display_mode *m = &dsi->encoder.crtc->state->adjusted_mode;
+	struct drm_display_mode *m = &dsi->mode;
 	unsigned int num_bits_resol = dsi->driver_data->num_bits_resol;
 	u32 reg;
 
@@ -1659,11 +1661,22 @@ static void exynos_dsi_bridge_disable(struct drm_bridge *bridge)
 	exynos_dsi_disable(dsi);
 }
 
+static void exynos_dsi_bridge_mode_set(struct drm_bridge *bridge,
+				       const struct drm_display_mode *mode,
+				       const struct drm_display_mode *adjusted_mode)
+{
+	struct exynos_dsi *dsi = bridge->driver_private;
+
+	/* The mode is set when actually enabling the device. */
+	drm_mode_copy(&dsi->mode, adjusted_mode);
+}
+
 static const struct drm_bridge_funcs exynos_dsi_bridge_funcs = {
 	.attach = exynos_dsi_bridge_attach,
 	.detach = exynos_dsi_bridge_detach,
 	.enable = exynos_dsi_bridge_enable,
 	.disable = exynos_dsi_bridge_disable,
+	.mode_set = exynos_dsi_bridge_mode_set,
 };
 
 MODULE_DEVICE_TABLE(of, exynos_dsi_of_match);
-- 
2.20.1

