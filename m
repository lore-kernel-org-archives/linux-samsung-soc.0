Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25F44C7EE2F
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  3 Mar 2023 14:53:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230481AbjCCOxl (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 3 Mar 2023 09:53:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231127AbjCCOxb (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 3 Mar 2023 09:53:31 -0500
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 329D8166D5
        for <linux-samsung-soc@vger.kernel.org>; Fri,  3 Mar 2023 06:53:30 -0800 (PST)
Received: by mail-pl1-x62f.google.com with SMTP id v11so2888138plz.8
        for <linux-samsung-soc@vger.kernel.org>; Fri, 03 Mar 2023 06:53:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LJit/9jx4Jh9SnqcRqHqL0SMNt+O+dxValiE0RggnWc=;
        b=aGXkDLxUV1bfq/kkxx+OqcxqiLzgJR70cfR8bimUXvIQA9hGW9okDUwKmRzUkiMcBO
         2xMOcOeZbefQUUCJCCpxgjdb3q2YifsEQXjZO/zj27q1cg5J79Hay7c8tgazFJes9PQR
         62+h+7S1WSFp46pkSMatzthRvxU+rvMIlWhL4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LJit/9jx4Jh9SnqcRqHqL0SMNt+O+dxValiE0RggnWc=;
        b=ckj0RVd4uTj0acw1z919Ux1U4ugBd+BMeTRo8py9+PD0NpZ2Etq2G07VEO5kdM677g
         GLAbLu8+pkRELJg8NkeCWJoV4fo4ljy2kmQLGsfAXCBJv1MNyC+Lj+du4GqRWKPBWKd2
         Oelr7XbjR4/7dW86JaSzyNWFHE12SdkJ5ksqo9XY/rmvAjNkmDR/rm3CscJYtpsApuB9
         0e3sblJwZ+c06PiL8wNKWTiJARRjgW27H97Lovh7SxWhOnMTRv84EUSaJ62Ixc+7RL53
         LNF1Yv+erTZiPGdcAUqJiexc3AXUvbOn90xSgUHEFO1r4KdelXdWGya3oorR2eCdd4aC
         m7og==
X-Gm-Message-State: AO0yUKW9rF1za9zMF27i/Pb+cnjOD8BvT+Y8OzuodNBTqXJJFoc9OVC5
        LUvPX9DIh6TLOQciPv9svkvpVQ==
X-Google-Smtp-Source: AK7set/MWHpeUF41MTekXhkSJuTltaxfvPzLFc941EekQhZmoSyBo8g0sYeFCS6tV/QJH8j9fEohAA==
X-Received: by 2002:a05:6a20:29a9:b0:c7:6c26:48b7 with SMTP id f41-20020a056a2029a900b000c76c2648b7mr2027617pzh.15.1677855209626;
        Fri, 03 Mar 2023 06:53:29 -0800 (PST)
Received: from localhost.localdomain ([183.83.137.89])
        by smtp.gmail.com with ESMTPSA id z4-20020a63e544000000b00502fd70b0bdsm1660856pgj.52.2023.03.03.06.53.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Mar 2023 06:53:29 -0800 (PST)
From:   Jagan Teki <jagan@amarulasolutions.com>
To:     Andrzej Hajda <andrzej.hajda@intel.com>,
        Inki Dae <inki.dae@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Marek Vasut <marex@denx.de>, Maxime Ripard <mripard@kernel.org>
Cc:     Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Frieder Schrempf <frieder.schrempf@kontron.de>,
        Tim Harvey <tharvey@gateworks.com>,
        Adam Ford <aford173@gmail.com>,
        Matteo Lisi <matteo.lisi@engicam.com>,
        dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
        linux-amarula <linux-amarula@amarulasolutions.com>,
        Jagan Teki <jagan@amarulasolutions.com>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v15 14/16] drm: bridge: samsung-dsim: Add i.MX8M Mini/Nano support
Date:   Fri,  3 Mar 2023 20:21:36 +0530
Message-Id: <20230303145138.29233-15-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230303145138.29233-1-jagan@amarulasolutions.com>
References: <20230303145138.29233-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Samsung MIPI DSIM master can also be found in i.MX8M Mini/Nano SoC.

Add compatible and associated driver_data for it.

Reviewed-by: Marek Vasut <marex@denx.de>
Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>
Acked-by: Robert Foss <robert.foss@linaro.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v15, v13:
- none
Changes for v12:
- collect RB from Marek
Changes for v11:
- collect RB from Frieder
- collect ACK from Robert
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
index 42e3536cb2fc..3ffdaedaa261 100644
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
@@ -1875,7 +1910,16 @@ const struct dev_pm_ops samsung_dsim_pm_ops = {
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

