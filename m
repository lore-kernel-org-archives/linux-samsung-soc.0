Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21E0FC4332F
	for <linux-samsung-soc@archiver.kernel.org>; Sat,  1 Oct 2022 08:10:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229535AbiJAIKc (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 1 Oct 2022 04:10:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229605AbiJAIKb (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 1 Oct 2022 04:10:31 -0400
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1A4ECAF9D
        for <linux-samsung-soc@vger.kernel.org>; Sat,  1 Oct 2022 01:10:30 -0700 (PDT)
Received: by mail-pg1-x534.google.com with SMTP id r62so5918022pgr.12
        for <linux-samsung-soc@vger.kernel.org>; Sat, 01 Oct 2022 01:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=kNa+Zfrt6fq++pnj2gbp7R05J06qVtRoBZLGkH8PcDw=;
        b=rQNF8tS3D8hzncMnTgYSuGc+gLkkyeTDUFY65I2upJJTz0b+WESJ7QdmimtnMWH0rb
         KW66vBsWy1Qq3Bf/PPvbOmOlqWjNvZMamWOOI9GYA8y64cylcg7ritGD9WU88bCHtFpL
         hdghmA0BNMDSthG9kGVOFyhVKmiWyW1/dfxeo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=kNa+Zfrt6fq++pnj2gbp7R05J06qVtRoBZLGkH8PcDw=;
        b=fhTH1BhUXUARDcPads5Ep/letPsL75J/OpV4C2sXqysXsQLuar1uw6l2GsMc5WiiFb
         O18D3GD5s3JDIlXN5tb2bul+cTEgfFAnQyIqjUBDNhK+q3iClhSEnDLX60PabIJC/CTB
         GbSxTwBEoBy21ReRn9wui6ozvg1po7huBFWff+Q664zShfrmQc2hYJknzjTprqm8cHss
         dA7AiaAVjq4+VO8ZWkWUNBHKu1WJWgldtopkD6BVskHh7G5cfOT6JZ6muA3W/CwTYjlH
         pqQ2eorKntxI80qfUwc06JFDX6JUomh0RNsKlm3BcZhB1N3OsQbWft/o30wrKm70GniP
         JqsQ==
X-Gm-Message-State: ACrzQf0OmB2A4kbKYim6lRODrXU/GmvptrXzwXBi1C25E3ZmRWt4DT55
        N5XaKngX4gkalrColYtiMkKTKA==
X-Google-Smtp-Source: AMsMyM6c3fu8pImibJC5IG2/qhDWNilZ4L/Bcb8g67ranqSll74i2Xn5H+8BxaQu6z3I3bCVKDOp0w==
X-Received: by 2002:a05:6a00:cd6:b0:546:d03:3dd7 with SMTP id b22-20020a056a000cd600b005460d033dd7mr12926362pfv.19.1664611830363;
        Sat, 01 Oct 2022 01:10:30 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c00a:a073:7254:4392:bc7c:c69])
        by smtp.gmail.com with ESMTPSA id c194-20020a624ecb000000b005409c9d2d41sm3167041pfb.62.2022.10.01.01.10.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Oct 2022 01:10:29 -0700 (PDT)
From:   Jagan Teki <jagan@amarulasolutions.com>
To:     Andrzej Hajda <andrzej.hajda@intel.com>,
        Inki Dae <inki.dae@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Frieder Schrempf <frieder.schrempf@kontron.de>,
        Fancy Fang <chen.fang@nxp.com>,
        Tim Harvey <tharvey@gateworks.com>,
        Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
        Adam Ford <aford173@gmail.com>,
        Neil Armstrong <narmstrong@linaro.org>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
        Marek Vasut <marex@denx.de>
Cc:     Matteo Lisi <matteo.lisi@engicam.com>,
        dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-amarula <linux-amarula@amarulasolutions.com>,
        Jagan Teki <jagan@amarulasolutions.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v6 10/10] drm: bridge: samsung-dsim: Add i.MX8MM support
Date:   Sat,  1 Oct 2022 13:36:50 +0530
Message-Id: <20221001080650.1007043-11-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221001080650.1007043-1-jagan@amarulasolutions.com>
References: <20221001080650.1007043-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Samsung MIPI DSIM master can also be found in i.MX8MM SoC.

Add compatible and associated driver_data for it.

v6:
* none

v3:
* enable DSIM_QUIRK_FIXUP_SYNC_POL quirk

v5:
* [mszyprow] rebased and adjusted to the new driver initialization
* drop quirk

v4:
* none

v3:
* enable DSIM_QUIRK_FIXUP_SYNC_POL quirk

v2:
* collect Laurent r-b

v1:
* none

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 45 +++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index 49406a07d655..5f2c51428cdd 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -360,6 +360,24 @@ static const unsigned int exynos5433_reg_values[] = {
 	[PHYTIMING_HS_TRAIL] = DSIM_PHYTIMING2_HS_TRAIL(0x0c),
 };
 
+static const unsigned int imx8mm_dsim_reg_values[] = {
+	[RESET_TYPE] = DSIM_SWRST,
+	[PLL_TIMER] = 500,
+	[STOP_STATE_CNT] = 0xf,
+	[PHYCTRL_ULPS_EXIT] = 0,
+	[PHYCTRL_VREG_LP] = 0,
+	[PHYCTRL_SLEW_UP] = 0,
+	[PHYTIMING_LPX] = DSIM_PHYTIMING_LPX(0x06),
+	[PHYTIMING_HS_EXIT] = DSIM_PHYTIMING_HS_EXIT(0x0b),
+	[PHYTIMING_CLK_PREPARE] = DSIM_PHYTIMING1_CLK_PREPARE(0x07),
+	[PHYTIMING_CLK_ZERO] = DSIM_PHYTIMING1_CLK_ZERO(0x26),
+	[PHYTIMING_CLK_POST] = DSIM_PHYTIMING1_CLK_POST(0x0d),
+	[PHYTIMING_CLK_TRAIL] = DSIM_PHYTIMING1_CLK_TRAIL(0x08),
+	[PHYTIMING_HS_PREPARE] = DSIM_PHYTIMING2_HS_PREPARE(0x08),
+	[PHYTIMING_HS_ZERO] = DSIM_PHYTIMING2_HS_ZERO(0x0d),
+	[PHYTIMING_HS_TRAIL] = DSIM_PHYTIMING2_HS_TRAIL(0x0b),
+};
+
 static const struct samsung_dsim_driver_data exynos3_dsi_driver_data = {
 	.reg_ofs = exynos_reg_ofs,
 	.plltmr_reg = 0x50,
@@ -421,6 +439,23 @@ static const struct samsung_dsim_driver_data exynos5422_dsi_driver_data = {
 	.reg_values = exynos5422_reg_values,
 };
 
+static const struct samsung_dsim_driver_data imx8mm_dsi_driver_data = {
+	.reg_ofs = exynos5433_reg_ofs,
+	.plltmr_reg = 0xa0,
+	.has_clklane_stop = 1,
+	.num_clks = 2,
+	.max_freq = 2100,
+	.wait_for_reset = 0,
+	.num_bits_resol = 12,
+	/**
+	 * FIXME:
+	 * Offset value used from downstream drivers/gpu/drm/bridge/sec-dsim.c
+	 * remove this comment if it is true else update the logic.
+	 */
+	.pll_p_offset = 14,
+	.reg_values = imx8mm_dsim_reg_values,
+};
+
 static const struct samsung_dsim_driver_data *
 samsung_dsim_types[SAMSUNG_DSIM_TYPE_COUNT] = {
 	[SAMSUNG_DSIM_TYPE_EXYNOS3250] = &exynos3_dsi_driver_data,
@@ -428,6 +463,7 @@ samsung_dsim_types[SAMSUNG_DSIM_TYPE_COUNT] = {
 	[SAMSUNG_DSIM_TYPE_EXYNOS5410] = &exynos5_dsi_driver_data,
 	[SAMSUNG_DSIM_TYPE_EXYNOS5422] = &exynos5422_dsi_driver_data,
 	[SAMSUNG_DSIM_TYPE_EXYNOS5433] = &exynos5433_dsi_driver_data,
+	[SAMSUNG_DSIM_TYPE_IMX8MM] = &imx8mm_dsi_driver_data,
 };
 
 static inline struct samsung_dsim *host_to_dsi(struct mipi_dsi_host *h)
@@ -1788,7 +1824,16 @@ const struct dev_pm_ops samsung_dsim_pm_ops = {
 };
 EXPORT_SYMBOL_GPL(samsung_dsim_pm_ops);
 
+static const struct samsung_dsim_plat_data samsung_dsim_imx8mm_pdata = {
+	.hw_type = SAMSUNG_DSIM_TYPE_IMX8MM,
+	.host_ops = &samsung_dsim_generic_host_ops,
+};
+
 static const struct of_device_id samsung_dsim_of_match[] = {
+	{
+		.compatible = "fsl,imx8mm-mipi-dsim",
+		.data = &samsung_dsim_imx8mm_pdata,
+	},
 	{ /* sentinel. */ }
 };
 MODULE_DEVICE_TABLE(of, samsung_dsim_of_match);
-- 
2.25.1

