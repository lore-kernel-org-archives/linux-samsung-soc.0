Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DBD1C07E95
	for <linux-samsung-soc@archiver.kernel.org>; Sun,  4 Jul 2021 09:05:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7C546610CC
	for <linux-samsung-soc@archiver.kernel.org>; Sun,  4 Jul 2021 09:05:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229739AbhGDJIF (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 4 Jul 2021 05:08:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229700AbhGDJIF (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 4 Jul 2021 05:08:05 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94494C061762
        for <linux-samsung-soc@vger.kernel.org>; Sun,  4 Jul 2021 02:05:30 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id s13so5331773plg.12
        for <linux-samsung-soc@vger.kernel.org>; Sun, 04 Jul 2021 02:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bHcsvEUVCxZAmQsc7mXrBSFPs2QDRsjgJq87Ua6YvE0=;
        b=YIEo3EAzws95+IRORqWvpcXbV6x+MOJaaacvQr5+CIYnIbotgC1K01lc+0XQVzvVeP
         CDGnx5fLmmE0HtWWKwMK/Sl6wpQf2OdXOTh5NcDiDha/4hHoxnVscR7LM8hmgOg2N1A6
         ClLcDGFTXq3pNOiNo7IpjsbyLUUwzcC1t2Myk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bHcsvEUVCxZAmQsc7mXrBSFPs2QDRsjgJq87Ua6YvE0=;
        b=ZIBtU2zgyWx1kh0IQE4lFe2NjqZwA+ITSUyNTUqHDuDkrK65RB4j4ECjQ+6eU2JmY/
         NstlyngY82ITo5utEKOINiKxxj0SVFZPJETTISPgkEVzLmDWHGzqrCEooUvpIe5ZkYxO
         h0rArbKrPT8QUO9YjXTzg1tXfMRaOMmikdSaGk0f2OhEa0leerefYolDyVHZi6Ppub5h
         b89yuXDM+ERxeh4oVV8ofn+TRakWEr99vn14pLvJo5SvryxklP2msJWhekOhQpiTiSbB
         kss8FHkqncXTtvrHU66y2p/grSquQU0bmcg8j5ZB/W+hQQ+c9irLSlWOe6XmLXiFISc5
         Vbrg==
X-Gm-Message-State: AOAM530QRb8UghLb42dZPky6NHkTfeWpUM7bDv8+pvzV9ZCdGC0eT+NM
        BtnlGUWJgPjqEJPuYUFZQfAlWw==
X-Google-Smtp-Source: ABdhPJwhx0sFvMYc5Td8Aj1SfnBuNMkOOb9TDo52OwhHAPrn9XOZK7rsA7ADAxUeClmDb8m2Ykg4Fw==
X-Received: by 2002:a17:902:f243:b029:129:5706:3c4b with SMTP id j3-20020a170902f243b029012957063c4bmr7357866plc.83.1625389530178;
        Sun, 04 Jul 2021 02:05:30 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c00a:a884:1ae9:772f:6f0f:3e24])
        by smtp.gmail.com with ESMTPSA id m24sm3360793pgd.60.2021.07.04.02.05.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jul 2021 02:05:29 -0700 (PDT)
From:   Jagan Teki <jagan@amarulasolutions.com>
To:     Inki Dae <inki.dae@samsung.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Frieder Schrempf <frieder.schrempf@kontron.de>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Marek Vasut <marex@denx.de>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Fabio Estevam <festevam@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-amarula <linux-amarula@amarulasolutions.com>,
        Jagan Teki <jagan@amarulasolutions.com>
Subject: [RFC PATCH 13/17] drm: bridge: samsung-dsim: Add i.MX8MM support
Date:   Sun,  4 Jul 2021 14:32:26 +0530
Message-Id: <20210704090230.26489-14-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210704090230.26489-1-jagan@amarulasolutions.com>
References: <20210704090230.26489-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Samsung MIPI DSIM bridge can also be found in i.MX8MM SoC.

Add compatible and associated driver_data it.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 31 +++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index 9a2df1212d0f..ea379cb0cc32 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -460,6 +460,24 @@ static const unsigned int exynos5433_reg_values[] = {
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
@@ -521,6 +539,17 @@ static const struct samsung_dsim_driver_data exynos5422_dsi_driver_data = {
 	.exynos_specific = true,
 };
 
+static const struct samsung_dsim_driver_data imx8mm_dsi_driver_data = {
+	.reg_ofs = exynos5433_reg_ofs,
+	.plltmr_reg = 0xa0,
+	.has_clklane_stop = 1,
+	.num_clks = 2,
+	.max_freq = 2100,
+	.wait_for_reset = 0,
+	.num_bits_resol = 12,
+	.reg_values = imx8mm_dsim_reg_values,
+};
+
 static const struct of_device_id samsung_dsim_of_match[] = {
 	{ .compatible = "samsung,exynos3250-mipi-dsi",
 	  .data = &exynos3_dsi_driver_data },
@@ -532,6 +561,8 @@ static const struct of_device_id samsung_dsim_of_match[] = {
 	  .data = &exynos5422_dsi_driver_data },
 	{ .compatible = "samsung,exynos5433-mipi-dsi",
 	  .data = &exynos5433_dsi_driver_data },
+	{ .compatible = "fsl,imx8mm-mipi-dsim",
+	  .data = &imx8mm_dsi_driver_data },
 	{ }
 };
 
-- 
2.25.1

