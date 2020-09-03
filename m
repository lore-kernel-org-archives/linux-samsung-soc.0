Return-Path: <SRS0=oxPC=CM=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UPPERCASE_50_75,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE475C433E2
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  3 Sep 2020 16:57:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D8700206A5
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  3 Sep 2020 16:57:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728465AbgICQ5g (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 3 Sep 2020 12:57:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728633AbgICQ50 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 3 Sep 2020 12:57:26 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 871DDC061246
        for <linux-samsung-soc@vger.kernel.org>; Thu,  3 Sep 2020 09:57:25 -0700 (PDT)
Received: from [2a0a:edc0:0:1101:1d::39] (helo=dude03.red.stw.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1kDsY5-0003YD-GJ; Thu, 03 Sep 2020 18:57:23 +0200
Received: from mtr by dude03.red.stw.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@dude03.red.stw.pengutronix.de>)
        id 1kDsY3-005L3Z-MC; Thu, 03 Sep 2020 18:57:19 +0200
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc:     kernel@pengutronix.de, Laurent.pinchart@ideasonboard.com,
        krzk@kernel.org, narmstrong@baylibre.com,
        Michael Tretter <m.tretter@pengutronix.de>
Date:   Thu,  3 Sep 2020 18:57:12 +0200
Message-Id: <20200903165717.1272492-12-m.tretter@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200903165717.1272492-1-m.tretter@pengutronix.de>
References: <20200903165717.1272492-1-m.tretter@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::39
X-SA-Exim-Mail-From: mtr@pengutronix.de
Subject: [PATCH 11/16] drm/exynos: shift register values to fields on write
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on metis.ext.pengutronix.de)
X-PTX-Original-Recipient: linux-samsung-soc@vger.kernel.org
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The phy timings are already shifted to the field position. If the driver
is reused on multiple platforms, this exposes the field positions to the
platform code.

Store only the timing values in the platform data and shift the value to
the field when writing the fields to the registers.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 88 +++++++++++++------------
 1 file changed, 46 insertions(+), 42 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index 3bf4ae0fe6cc..21db18ae0772 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -397,54 +397,54 @@ static const unsigned int reg_values[] = {
 	[RESET_TYPE] = DSIM_SWRST,
 	[PLL_TIMER] = 500,
 	[STOP_STATE_CNT] = 0xf,
-	[PHYCTRL_ULPS_EXIT] = DSIM_PHYCTRL_ULPS_EXIT(0x0af),
+	[PHYCTRL_ULPS_EXIT] = 0x0af,
 	[PHYCTRL_VREG_LP] = 0,
 	[PHYCTRL_SLEW_UP] = 0,
-	[PHYTIMING_LPX] = DSIM_PHYTIMING_LPX(0x06),
-	[PHYTIMING_HS_EXIT] = DSIM_PHYTIMING_HS_EXIT(0x0b),
-	[PHYTIMING_CLK_PREPARE] = DSIM_PHYTIMING1_CLK_PREPARE(0x07),
-	[PHYTIMING_CLK_ZERO] = DSIM_PHYTIMING1_CLK_ZERO(0x27),
-	[PHYTIMING_CLK_POST] = DSIM_PHYTIMING1_CLK_POST(0x0d),
-	[PHYTIMING_CLK_TRAIL] = DSIM_PHYTIMING1_CLK_TRAIL(0x08),
-	[PHYTIMING_HS_PREPARE] = DSIM_PHYTIMING2_HS_PREPARE(0x09),
-	[PHYTIMING_HS_ZERO] = DSIM_PHYTIMING2_HS_ZERO(0x0d),
-	[PHYTIMING_HS_TRAIL] = DSIM_PHYTIMING2_HS_TRAIL(0x0b),
+	[PHYTIMING_LPX] = 0x06,
+	[PHYTIMING_HS_EXIT] = 0x0b,
+	[PHYTIMING_CLK_PREPARE] = 0x07,
+	[PHYTIMING_CLK_ZERO] = 0x27,
+	[PHYTIMING_CLK_POST] = 0x0d,
+	[PHYTIMING_CLK_TRAIL] = 0x08,
+	[PHYTIMING_HS_PREPARE] = 0x09,
+	[PHYTIMING_HS_ZERO] = 0x0d,
+	[PHYTIMING_HS_TRAIL] = 0x0b,
 };
 
 static const unsigned int exynos5422_reg_values[] = {
 	[RESET_TYPE] = DSIM_SWRST,
 	[PLL_TIMER] = 500,
 	[STOP_STATE_CNT] = 0xf,
-	[PHYCTRL_ULPS_EXIT] = DSIM_PHYCTRL_ULPS_EXIT(0xaf),
+	[PHYCTRL_ULPS_EXIT] = 0xaf,
 	[PHYCTRL_VREG_LP] = 0,
 	[PHYCTRL_SLEW_UP] = 0,
-	[PHYTIMING_LPX] = DSIM_PHYTIMING_LPX(0x08),
-	[PHYTIMING_HS_EXIT] = DSIM_PHYTIMING_HS_EXIT(0x0d),
-	[PHYTIMING_CLK_PREPARE] = DSIM_PHYTIMING1_CLK_PREPARE(0x09),
-	[PHYTIMING_CLK_ZERO] = DSIM_PHYTIMING1_CLK_ZERO(0x30),
-	[PHYTIMING_CLK_POST] = DSIM_PHYTIMING1_CLK_POST(0x0e),
-	[PHYTIMING_CLK_TRAIL] = DSIM_PHYTIMING1_CLK_TRAIL(0x0a),
-	[PHYTIMING_HS_PREPARE] = DSIM_PHYTIMING2_HS_PREPARE(0x0c),
-	[PHYTIMING_HS_ZERO] = DSIM_PHYTIMING2_HS_ZERO(0x11),
-	[PHYTIMING_HS_TRAIL] = DSIM_PHYTIMING2_HS_TRAIL(0x0d),
+	[PHYTIMING_LPX] = 0x08,
+	[PHYTIMING_HS_EXIT] = 0x0d,
+	[PHYTIMING_CLK_PREPARE] = 0x09,
+	[PHYTIMING_CLK_ZERO] = 0x30,
+	[PHYTIMING_CLK_POST] = 0x0e,
+	[PHYTIMING_CLK_TRAIL] = 0x0a,
+	[PHYTIMING_HS_PREPARE] = 0x0c,
+	[PHYTIMING_HS_ZERO] = 0x11,
+	[PHYTIMING_HS_TRAIL] = 0x0d,
 };
 
 static const unsigned int exynos5433_reg_values[] = {
 	[RESET_TYPE] = DSIM_FUNCRST,
 	[PLL_TIMER] = 22200,
 	[STOP_STATE_CNT] = 0xa,
-	[PHYCTRL_ULPS_EXIT] = DSIM_PHYCTRL_ULPS_EXIT(0x190),
-	[PHYCTRL_VREG_LP] = DSIM_PHYCTRL_B_DPHYCTL_VREG_LP,
-	[PHYCTRL_SLEW_UP] = DSIM_PHYCTRL_B_DPHYCTL_SLEW_UP,
-	[PHYTIMING_LPX] = DSIM_PHYTIMING_LPX(0x07),
-	[PHYTIMING_HS_EXIT] = DSIM_PHYTIMING_HS_EXIT(0x0c),
-	[PHYTIMING_CLK_PREPARE] = DSIM_PHYTIMING1_CLK_PREPARE(0x09),
-	[PHYTIMING_CLK_ZERO] = DSIM_PHYTIMING1_CLK_ZERO(0x2d),
-	[PHYTIMING_CLK_POST] = DSIM_PHYTIMING1_CLK_POST(0x0e),
-	[PHYTIMING_CLK_TRAIL] = DSIM_PHYTIMING1_CLK_TRAIL(0x09),
-	[PHYTIMING_HS_PREPARE] = DSIM_PHYTIMING2_HS_PREPARE(0x0b),
-	[PHYTIMING_HS_ZERO] = DSIM_PHYTIMING2_HS_ZERO(0x10),
-	[PHYTIMING_HS_TRAIL] = DSIM_PHYTIMING2_HS_TRAIL(0x0c),
+	[PHYCTRL_ULPS_EXIT] = 0x190,
+	[PHYCTRL_VREG_LP] = 1,
+	[PHYCTRL_SLEW_UP] = 1,
+	[PHYTIMING_LPX] = 0x07,
+	[PHYTIMING_HS_EXIT] = 0x0c,
+	[PHYTIMING_CLK_PREPARE] = 0x09,
+	[PHYTIMING_CLK_ZERO] = 0x2d,
+	[PHYTIMING_CLK_POST] = 0x0e,
+	[PHYTIMING_CLK_TRAIL] = 0x09,
+	[PHYTIMING_HS_PREPARE] = 0x0b,
+	[PHYTIMING_HS_ZERO] = 0x10,
+	[PHYTIMING_HS_TRAIL] = 0x0c,
 };
 
 static const struct exynos_dsi_driver_data exynos3_dsi_driver_data = {
@@ -696,8 +696,11 @@ static void exynos_dsi_set_phy_ctrl(struct exynos_dsi *dsi)
 		return;
 
 	/* B D-PHY: D-PHY Master & Slave Analog Block control */
-	reg = reg_values[PHYCTRL_ULPS_EXIT] | reg_values[PHYCTRL_VREG_LP] |
-		reg_values[PHYCTRL_SLEW_UP];
+	reg = DSIM_PHYCTRL_ULPS_EXIT(reg_values[PHYCTRL_ULPS_EXIT]);
+	if (reg_values[PHYCTRL_VREG_LP])
+		reg |= DSIM_PHYCTRL_B_DPHYCTL_VREG_LP;
+	if (reg_values[PHYCTRL_SLEW_UP])
+		reg |= DSIM_PHYCTRL_B_DPHYCTL_SLEW_UP;
 	exynos_dsi_write(dsi, DSIM_PHYCTRL_REG, reg);
 
 	/*
@@ -705,7 +708,8 @@ static void exynos_dsi_set_phy_ctrl(struct exynos_dsi *dsi)
 	 * T HS-EXIT: Time that the transmitter drives LP-11 following a HS
 	 *	burst
 	 */
-	reg = reg_values[PHYTIMING_LPX] | reg_values[PHYTIMING_HS_EXIT];
+	reg = DSIM_PHYTIMING_LPX(reg_values[PHYTIMING_LPX]) |
+		DSIM_PHYTIMING_HS_EXIT(reg_values[PHYTIMING_HS_EXIT]);
 	exynos_dsi_write(dsi, DSIM_PHYTIMING_REG, reg);
 
 	/*
@@ -721,11 +725,10 @@ static void exynos_dsi_set_phy_ctrl(struct exynos_dsi *dsi)
 	 * T CLK-TRAIL: Time that the transmitter drives the HS-0 state after
 	 *	the last payload clock bit of a HS transmission burst
 	 */
-	reg = reg_values[PHYTIMING_CLK_PREPARE] |
-		reg_values[PHYTIMING_CLK_ZERO] |
-		reg_values[PHYTIMING_CLK_POST] |
-		reg_values[PHYTIMING_CLK_TRAIL];
-
+	reg = DSIM_PHYTIMING1_CLK_PREPARE(reg_values[PHYTIMING_CLK_PREPARE]) |
+		DSIM_PHYTIMING1_CLK_ZERO(reg_values[PHYTIMING_CLK_ZERO]) |
+		DSIM_PHYTIMING1_CLK_POST(reg_values[PHYTIMING_CLK_POST]) |
+		DSIM_PHYTIMING1_CLK_TRAIL(reg_values[PHYTIMING_CLK_TRAIL]);
 	exynos_dsi_write(dsi, DSIM_PHYTIMING1_REG, reg);
 
 	/*
@@ -737,8 +740,9 @@ static void exynos_dsi_set_phy_ctrl(struct exynos_dsi *dsi)
 	 * T HS-TRAIL: Time that the transmitter drives the flipped differential
 	 *	state after last payload data bit of a HS transmission burst
 	 */
-	reg = reg_values[PHYTIMING_HS_PREPARE] | reg_values[PHYTIMING_HS_ZERO] |
-		reg_values[PHYTIMING_HS_TRAIL];
+	reg = DSIM_PHYTIMING2_HS_PREPARE(reg_values[PHYTIMING_HS_PREPARE]) |
+		DSIM_PHYTIMING2_HS_ZERO(reg_values[PHYTIMING_HS_ZERO]) |
+		DSIM_PHYTIMING2_HS_TRAIL(reg_values[PHYTIMING_HS_TRAIL]);
 	exynos_dsi_write(dsi, DSIM_PHYTIMING2_REG, reg);
 }
 
-- 
2.20.1

