Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3EC0ECAAD8
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 29 Aug 2022 18:42:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229904AbiH2SmX (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 29 Aug 2022 14:42:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229946AbiH2SmU (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 29 Aug 2022 14:42:20 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 485E982FA9
        for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Aug 2022 11:42:19 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id jm11so8827251plb.13
        for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Aug 2022 11:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=8WDhZieMsByGwgQC3v545Iffr6do/AWQnpqTM/oRp20=;
        b=kyEZ9/UC5f9LaL8dDz+LJhHWBRidAfWPO7AHXkqBehnO4oRIyCwRyAh6/iD7D2UagA
         bimOmQ/3dlMoSJ1NtqgJ3SbKrbxIhpEdXJW6qOqUujfv46+BJcNMPOc+aDNr6O1R5BoH
         IcK9873lc4ZUFHoKaI3dEIyZ9a1BBf9Qtu6hg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=8WDhZieMsByGwgQC3v545Iffr6do/AWQnpqTM/oRp20=;
        b=67Ex/cfotcA/BGigbzCsJAFsCBP14Du2wbVyOw3rCpUPeNnKak8cvnbFf2nv6nUUj3
         wylp3ZhZ1Q0tMcdtbA3Ls6DnzGkCzGMI/Aie2GHyXs6hO29eqBQbZj/VaiJqZ3EODi3h
         vDPSN3x+VcndtoxbuWXD3QcsubQw2hlKCYZDSJBkuH4vAHOb7N9zz1GLRfrSb5tdajcp
         BjKyBLFyJRnMP12EQqt5pT+rGwNE9acE3n4+k15BBQuTusZQ90FcSR82LG45Jsnaal/6
         RvzxUm9y5lvtYfeCwu+hvMJUwR1AOi/CkmSnHKX9oyol4lc3BOiPzELc9FgAsOEcY0YX
         4F6w==
X-Gm-Message-State: ACgBeo0pjnSUK/lcYFUG7Mj1c5pHW4I/t0FfTym2eJTqhU0d3DvQcUC9
        0jPD3pxZKxH1tWWu2eP/9CMrqQ==
X-Google-Smtp-Source: AA6agR4B8Be6uJsgVb5OokVMdDE0b2F83LHWuYgrGmP/SmTgI7dkrtZXxQo9mjh5QoplaNLgKuD/gg==
X-Received: by 2002:a17:902:d2ca:b0:174:cbbc:3630 with SMTP id n10-20020a170902d2ca00b00174cbbc3630mr5789765plc.76.1661798538790;
        Mon, 29 Aug 2022 11:42:18 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c00a:a073:43f7:1644:6259:830d])
        by smtp.gmail.com with ESMTPSA id k13-20020aa7998d000000b005385e2e86eesm1619042pfh.18.2022.08.29.11.42.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Aug 2022 11:42:18 -0700 (PDT)
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
        Neil Armstrong <narmstrong@baylibre.com>,
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
Subject: [PATCH v4 12/12] drm: bridge: samsung-dsim: Add i.MX8MM support
Date:   Tue, 30 Aug 2022 00:10:31 +0530
Message-Id: <20220829184031.1863663-13-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220829184031.1863663-1-jagan@amarulasolutions.com>
References: <20220829184031.1863663-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Samsung MIPI DSIM master can also be found in i.MX8MM SoC.

Add compatible and associated driver_data for it.

v4:
* none

v3:
* enable DSIM_QUIRK_FIXUP_SYNC_POL quirk

v2:
* collect Laurent r-b

v1:
* none

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 35 +++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index f3b5e265b027..749b11e19217 100644
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
@@ -426,6 +444,19 @@ static const struct samsung_dsim_driver_data exynos5422_dsi_driver_data = {
 	.quirks = DSIM_QUIRK_PLAT_DATA,
 };
 
+static const struct samsung_dsim_driver_data imx8mm_dsi_driver_data = {
+	.reg_ofs = exynos5433_reg_ofs,
+	.plltmr_reg = 0xa0,
+	.has_clklane_stop = 1,
+	.num_clks = 2,
+	.max_freq = 2100,
+	.wait_for_reset = 0,
+	.num_bits_resol = 12,
+	.pll_p_offset = 14,
+	.reg_values = imx8mm_dsim_reg_values,
+	.quirks = DSIM_QUIRK_FIXUP_SYNC_POL,
+};
+
 static const struct of_device_id samsung_dsim_of_match[] = {
 	{
 		.compatible = "samsung,exynos3250-mipi-dsi",
@@ -447,6 +478,10 @@ static const struct of_device_id samsung_dsim_of_match[] = {
 		.compatible = "samsung,exynos5433-mipi-dsi",
 		.data = &exynos5433_dsi_driver_data
 	},
+	{
+		.compatible = "fsl,imx8mm-mipi-dsim",
+		.data = &imx8mm_dsi_driver_data
+	},
 	{ /* sentinel. */ }
 };
 
-- 
2.25.1

