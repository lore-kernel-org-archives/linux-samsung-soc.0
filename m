Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39D3CC4708D
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 14 Dec 2022 13:02:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238445AbiLNNCr (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 14 Dec 2022 08:02:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238437AbiLNNCM (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 14 Dec 2022 08:02:12 -0500
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B66EC62
        for <linux-samsung-soc@vger.kernel.org>; Wed, 14 Dec 2022 05:01:31 -0800 (PST)
Received: by mail-pj1-x102b.google.com with SMTP id o1-20020a17090a678100b00219cf69e5f0so7080473pjj.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 14 Dec 2022 05:01:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p8xP8kij82wDybS5wtGDKLPcaFcgrKocGAGJAKH6qlA=;
        b=WosNmGC0/+cdHIPw0JMS5m8bNhqlEvX7UXaTybBXkGUmcLDo15akXMxBVO25Ue3a/i
         WMiwmsl4qu/priGCmo5qh5OeMB0/iVPLoZ/MBAiqb1MezV02WBSSvhgrD0LnT8+SeLdc
         FDy3djXeYV5R4IrC/obeQUvrjTbG2BcL67k8k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p8xP8kij82wDybS5wtGDKLPcaFcgrKocGAGJAKH6qlA=;
        b=GFyWpu42+f+k9H2Fl6/FWMEpUJZRCxspUYijD7mV080gm0xsKiyXp55tvRgk/kqInd
         CpSw0hWrAHjBLW/lWp6lFGMC4nt1qmjCKCt+/S0jbXOYz4YxtsgsWjvkVQNT1C2jY8yK
         1EA141Ue3psE0Rcu7yur+yQ+VnrymD59c22lQw4UP8+M2cdTgQWCrevWt/37lnUM+lZc
         3mgKX+w6geaALFcPYIZS1E/O+9AYjYbK1oGU5ouGFxH3xWosRQjd0NZcq6f2jhlbL5Rw
         Ptqq7T/5iCqD+I/ogq/U/XZVmhihAvOk50sX4TIQv2gXRfrwEruXRGNxbloUUgsKYbU8
         1H8A==
X-Gm-Message-State: ANoB5pnPL5IO+5ot6vPj5STD9Y357YF6joyUyb2U0ZLYcW+HsQ5UvO4o
        DzZKl/3DNodDiumy0yTFj29ZPw==
X-Google-Smtp-Source: AA0mqf7p28t/RXncPMbBQNKEQYozSJnefnzWyK7Jm/FM/YM+srTxOzHEDk2XAv2gAaw1f+ihFYLpVw==
X-Received: by 2002:a17:902:8347:b0:189:4bf4:2cfc with SMTP id z7-20020a170902834700b001894bf42cfcmr24468372pln.31.1671022890553;
        Wed, 14 Dec 2022 05:01:30 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a809:5e03:faf:846e:352d])
        by smtp.gmail.com with ESMTPSA id ix17-20020a170902f81100b001895f7c8a71sm1838651plb.97.2022.12.14.05.01.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Dec 2022 05:01:29 -0800 (PST)
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
Subject: [PATCH v10 16/18] drm: bridge: samsung-dsim: Add i.MX8M Mini/Nano support
Date:   Wed, 14 Dec 2022 18:29:05 +0530
Message-Id: <20221214125907.376148-17-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221214125907.376148-1-jagan@amarulasolutions.com>
References: <20221214125907.376148-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Samsung MIPI DSIM master can also be found in i.MX8M Mini/Nano SoC.

Add compatible and associated driver_data for it.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v10, v9:
- none
Changed for v8:
- fix and update the comment
Changes for v7, v6:
- none
Changes for v3:
- enable DSIM_QUIRK_FIXUP_SYNC_POL quirk
Changes for v5:
- [mszyprow] rebased and adjusted to the new driver initialization
- drop quirk
Changes for v4:
- none
Changes for v3:
- enable DSIM_QUIRK_FIXUP_SYNC_POL quirk
Changes for v2:
- collect Laurent r-b
Changes for v1:
- none

 drivers/gpu/drm/bridge/samsung-dsim.c | 44 +++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index dd27935081a3..b14efb6fca91 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -376,6 +376,24 @@ static const unsigned int exynos5433_reg_values[] = {
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
@@ -437,6 +455,22 @@ static const struct samsung_dsim_driver_data exynos5422_dsi_driver_data = {
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
+	/*
+	 * Unlike Exynos, PLL_P(PMS_P) offset 14 is used in i.MX8M Mini/Nano/Plus
+	 * downstream driver - drivers/gpu/drm/bridge/sec-dsim.c
+	 */
+	.pll_p_offset = 14,
+	.reg_values = imx8mm_dsim_reg_values,
+};
+
 static const struct samsung_dsim_driver_data *
 samsung_dsim_types[DSIM_TYPE_COUNT] = {
 	[DSIM_TYPE_EXYNOS3250] = &exynos3_dsi_driver_data,
@@ -444,6 +478,7 @@ samsung_dsim_types[DSIM_TYPE_COUNT] = {
 	[DSIM_TYPE_EXYNOS5410] = &exynos5_dsi_driver_data,
 	[DSIM_TYPE_EXYNOS5422] = &exynos5422_dsi_driver_data,
 	[DSIM_TYPE_EXYNOS5433] = &exynos5433_dsi_driver_data,
+	[DSIM_TYPE_IMX8MM] = &imx8mm_dsi_driver_data,
 };
 
 static inline struct samsung_dsim *host_to_dsi(struct mipi_dsi_host *h)
@@ -1793,7 +1828,16 @@ const struct dev_pm_ops samsung_dsim_pm_ops = {
 };
 EXPORT_SYMBOL_GPL(samsung_dsim_pm_ops);
 
+static const struct samsung_dsim_plat_data samsung_dsim_imx8mm_pdata = {
+	.hw_type = DSIM_TYPE_IMX8MM,
+	.host_ops = &generic_dsim_host_ops,
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

