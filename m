Return-Path: <SRS0=oxPC=CM=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3BB9C2D0A5
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  3 Sep 2020 16:57:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CEF75206A5
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  3 Sep 2020 16:57:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728688AbgICQ5h (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 3 Sep 2020 12:57:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728988AbgICQ5a (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 3 Sep 2020 12:57:30 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A749FC06125C
        for <linux-samsung-soc@vger.kernel.org>; Thu,  3 Sep 2020 09:57:29 -0700 (PDT)
Received: from [2a0a:edc0:0:1101:1d::39] (helo=dude03.red.stw.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1kDsY9-0003YG-Or; Thu, 03 Sep 2020 18:57:27 +0200
Received: from mtr by dude03.red.stw.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@dude03.red.stw.pengutronix.de>)
        id 1kDsY3-005L3i-NZ; Thu, 03 Sep 2020 18:57:19 +0200
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc:     kernel@pengutronix.de, Laurent.pinchart@ideasonboard.com,
        krzk@kernel.org, narmstrong@baylibre.com,
        Michael Tretter <m.tretter@pengutronix.de>
Date:   Thu,  3 Sep 2020 18:57:15 +0200
Message-Id: <20200903165717.1272492-15-m.tretter@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200903165717.1272492-1-m.tretter@pengutronix.de>
References: <20200903165717.1272492-1-m.tretter@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::39
X-SA-Exim-Mail-From: mtr@pengutronix.de
Subject: [PATCH 14/16] drm/exynos: add callback for enabling i80 mode
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on metis.ext.pengutronix.de)
X-PTX-Original-Recipient: linux-samsung-soc@vger.kernel.org
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Display controllers need to know if the MIPI DSI bridge is running in
command or video mode. Allow platform drivers to register a callback for
being notified about the used mode.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 24 ++++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index 993402f1f7c7..a9dac66c834f 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -255,6 +255,7 @@ struct exynos_dsi_driver_data {
 	unsigned int num_bits_resol;
 	const unsigned int *reg_values;
 	void (*te_handler)(struct drm_encoder *encoder);
+	void (*set_command_node)(struct drm_encoder *encoder, bool enable);
 };
 
 struct exynos_dsi {
@@ -471,6 +472,19 @@ static void exynos_dsi_te_handler(struct drm_encoder *encoder)
 	exynos_drm_crtc_te_handler(encoder->crtc);
 }
 
+static void exynos_dsi_set_command_mode(struct drm_encoder *encoder,
+					bool enable)
+{
+	struct drm_device *drm = encoder->dev;
+	struct exynos_drm_crtc *crtc;
+
+	crtc = exynos_drm_crtc_get_by_type(drm, EXYNOS_DISPLAY_TYPE_LCD);
+	if (IS_ERR(crtc))
+		return;
+
+	crtc->i80_mode = enable;
+}
+
 static const struct exynos_dsi_driver_data exynos3_dsi_driver_data = {
 	.reg_ofs = EXYNOS_REG_OFS,
 	.plltmr_reg = 0x50,
@@ -482,6 +496,7 @@ static const struct exynos_dsi_driver_data exynos3_dsi_driver_data = {
 	.num_bits_resol = 11,
 	.reg_values = reg_values,
 	.te_handler = exynos_dsi_te_handler,
+	.set_command_node = exynos_dsi_set_command_mode,
 };
 
 static const struct exynos_dsi_driver_data exynos4_dsi_driver_data = {
@@ -495,6 +510,7 @@ static const struct exynos_dsi_driver_data exynos4_dsi_driver_data = {
 	.num_bits_resol = 11,
 	.reg_values = reg_values,
 	.te_handler = exynos_dsi_te_handler,
+	.set_command_node = exynos_dsi_set_command_mode,
 };
 
 static const struct exynos_dsi_driver_data exynos5_dsi_driver_data = {
@@ -506,6 +522,7 @@ static const struct exynos_dsi_driver_data exynos5_dsi_driver_data = {
 	.num_bits_resol = 11,
 	.reg_values = reg_values,
 	.te_handler = exynos_dsi_te_handler,
+	.set_command_node = exynos_dsi_set_command_mode,
 };
 
 static const struct exynos_dsi_driver_data exynos5433_dsi_driver_data = {
@@ -518,6 +535,7 @@ static const struct exynos_dsi_driver_data exynos5433_dsi_driver_data = {
 	.num_bits_resol = 12,
 	.reg_values = exynos5433_reg_values,
 	.te_handler = exynos_dsi_te_handler,
+	.set_command_node = exynos_dsi_set_command_mode,
 };
 
 static const struct exynos_dsi_driver_data exynos5422_dsi_driver_data = {
@@ -530,6 +548,7 @@ static const struct exynos_dsi_driver_data exynos5422_dsi_driver_data = {
 	.num_bits_resol = 12,
 	.reg_values = exynos5422_reg_values,
 	.te_handler = exynos_dsi_te_handler,
+	.set_command_node = exynos_dsi_set_command_mode,
 };
 
 static const struct of_device_id exynos_dsi_of_match[] = {
@@ -1651,8 +1670,9 @@ static int exynos_dsi_host_attach(struct mipi_dsi_host *host,
 	dsi->lanes = device->lanes;
 	dsi->format = device->format;
 	dsi->mode_flags = device->mode_flags;
-	exynos_drm_crtc_get_by_type(drm, EXYNOS_DISPLAY_TYPE_LCD)->i80_mode =
-			!(dsi->mode_flags & MIPI_DSI_MODE_VIDEO);
+	if (dsi->driver_data->set_command_node)
+		dsi->driver_data->set_command_node(encoder,
+				!(dsi->mode_flags & MIPI_DSI_MODE_VIDEO));
 
 	mutex_unlock(&drm->mode_config.mutex);
 
-- 
2.20.1

