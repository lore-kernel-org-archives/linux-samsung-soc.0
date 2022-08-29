Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92050ECAAD8
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 29 Aug 2022 18:41:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229543AbiH2Slp (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 29 Aug 2022 14:41:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229751AbiH2Slo (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 29 Aug 2022 14:41:44 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0C1D81B1E
        for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Aug 2022 11:41:42 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id h13-20020a17090a648d00b001fdb9003787so4144285pjj.4
        for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Aug 2022 11:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=xMi0yFur/nA6QX+prP8Y5QXRtVTqBYGjaNwK4RB7jg8=;
        b=KLyBqgHkI7olBo1slJB6ivJuI0v0vR5rxy+Ndw2IV08ufTafgqjU+hf8M4Y89SS9bh
         FhwFWrQ1DYBK1zLCkUY6pQ7IOxPDKCY8xkLlKdi0nA5y4Pl9dKO3P5djTV7EgJT7iToL
         OFKtzEISGSPMCCmXuStBXaF1EJoK4XuAOP6Ss=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=xMi0yFur/nA6QX+prP8Y5QXRtVTqBYGjaNwK4RB7jg8=;
        b=wMN04xPCsgP2MXbjryGg03ngN/X8wQuFFiU9zOS+B2sfsgilnyPsuDOs81Ap3s373w
         BIpS4wIrg0nm6J3nY9ZaIIzF7npSg/2MDo3WLr/7wQ+R5lYiquUZzqE2gGczhAYSVfK5
         o3wHiPbJaxDjCcCdlc3PHe97u9+uXRtFWXCagjYNz3pSJYCSrJp3a2UKcjePfLnJmDKF
         S/fqniPwn6EXzBMrlwbj75UGrP6E0bymSVcLuNbi5QDB7dpWfvS+aKOsBxgUtQshWnKf
         JkHQOEPyLBVBHKW0KS7AviyNtj/itOGZh9VyCnP3fo5fWsn18XaaLPqDqJbk7A00fxvI
         NtIw==
X-Gm-Message-State: ACgBeo0GZGQV/T3mknd/b6ODUodrkHe9UAMQ84Y0URt2yn1SPatYjC7o
        GsKwxZdpfA4w8Og+a393fxH2dA==
X-Google-Smtp-Source: AA6agR50WyCEtnMzshtbiOgRs+nYGM/4K9LXvfKjn77kyzgG+REX32KR/OiaDOzROGBS63pdkPvZ7Q==
X-Received: by 2002:a17:902:dac8:b0:174:cf17:6e87 with SMTP id q8-20020a170902dac800b00174cf176e87mr5795736plx.129.1661798502540;
        Mon, 29 Aug 2022 11:41:42 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c00a:a073:43f7:1644:6259:830d])
        by smtp.gmail.com with ESMTPSA id k13-20020aa7998d000000b005385e2e86eesm1619042pfh.18.2022.08.29.11.41.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Aug 2022 11:41:42 -0700 (PDT)
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
        Jagan Teki <jagan@amarulasolutions.com>
Subject: [PATCH v4 07/12] drm: bridge: samsung-dsim: Fix PLL_P (PMS_P) offset
Date:   Tue, 30 Aug 2022 00:10:26 +0530
Message-Id: <20220829184031.1863663-8-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220829184031.1863663-1-jagan@amarulasolutions.com>
References: <20220829184031.1863663-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The i.MX 8M Mini Applications Processor Reference Manual, Rev. 3, 11/2020
with 13.7.10.1 Master PLL PMS Value setting Register mentioned PMS_P offset
range from BIT[18-13] and the upstream driver is using the same offset.

However, offset 13 is not working on i.MX8M Mini platforms but downstream
NXP driver is using 14 [1] and it is working with i.MX8M Mini SoC.

Not sure about whether it is reference manual documentation or something
else but this patch trusts the downstream code and fixes the PLL_P offset.

[1] https://source.codeaurora.org/external/imx/linux-imx/tree/drivers/gpu/drm/bridge/sec-dsim.c?h=imx_5.4.47_2.2.0#n211

v4, v3, v2:
* none

v1:
* updated commit message
* add downstream driver link

Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 10 ++++++++--
 include/drm/bridge/samsung-dsim.h     |  1 +
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index b6883a6d4681..b6d17c0c9e58 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -168,7 +168,7 @@
 /* DSIM_PLLCTRL */
 #define DSIM_FREQ_BAND(x)		((x) << 24)
 #define DSIM_PLL_EN			(1 << 23)
-#define DSIM_PLL_P(x)			((x) << 13)
+#define DSIM_PLL_P(x, offset)		((x) << (offset))
 #define DSIM_PLL_M(x)			((x) << 4)
 #define DSIM_PLL_S(x)			((x) << 1)
 
@@ -368,6 +368,7 @@ static const struct samsung_dsim_driver_data exynos3_dsi_driver_data = {
 	.max_freq = 1000,
 	.wait_for_reset = 1,
 	.num_bits_resol = 11,
+	.pll_p_offset = 13,
 	.reg_values = reg_values,
 	.quirks = DSIM_QUIRK_PLAT_DATA,
 };
@@ -381,6 +382,7 @@ static const struct samsung_dsim_driver_data exynos4_dsi_driver_data = {
 	.max_freq = 1000,
 	.wait_for_reset = 1,
 	.num_bits_resol = 11,
+	.pll_p_offset = 13,
 	.reg_values = reg_values,
 	.quirks = DSIM_QUIRK_PLAT_DATA,
 };
@@ -392,6 +394,7 @@ static const struct samsung_dsim_driver_data exynos5_dsi_driver_data = {
 	.max_freq = 1000,
 	.wait_for_reset = 1,
 	.num_bits_resol = 11,
+	.pll_p_offset = 13,
 	.reg_values = reg_values,
 	.quirks = DSIM_QUIRK_PLAT_DATA,
 };
@@ -404,6 +407,7 @@ static const struct samsung_dsim_driver_data exynos5433_dsi_driver_data = {
 	.max_freq = 1500,
 	.wait_for_reset = 0,
 	.num_bits_resol = 12,
+	.pll_p_offset = 13,
 	.reg_values = exynos5433_reg_values,
 	.quirks = DSIM_QUIRK_PLAT_DATA,
 };
@@ -416,6 +420,7 @@ static const struct samsung_dsim_driver_data exynos5422_dsi_driver_data = {
 	.max_freq = 1500,
 	.wait_for_reset = 1,
 	.num_bits_resol = 12,
+	.pll_p_offset = 13,
 	.reg_values = exynos5422_reg_values,
 	.quirks = DSIM_QUIRK_PLAT_DATA,
 };
@@ -563,7 +568,8 @@ static unsigned long samsung_dsim_set_pll(struct samsung_dsim *dsi,
 	writel(driver_data->reg_values[PLL_TIMER],
 			dsi->reg_base + driver_data->plltmr_reg);
 
-	reg = DSIM_PLL_EN | DSIM_PLL_P(p) | DSIM_PLL_M(m) | DSIM_PLL_S(s);
+	reg = DSIM_PLL_EN | DSIM_PLL_P(p, driver_data->pll_p_offset) |
+	      DSIM_PLL_M(m) | DSIM_PLL_S(s);
 
 	if (driver_data->has_freqband) {
 		static const unsigned long freq_bands[] = {
diff --git a/include/drm/bridge/samsung-dsim.h b/include/drm/bridge/samsung-dsim.h
index e15fbfd49efe..95d3f89aec4f 100644
--- a/include/drm/bridge/samsung-dsim.h
+++ b/include/drm/bridge/samsung-dsim.h
@@ -47,6 +47,7 @@ struct samsung_dsim_driver_data {
 	unsigned int max_freq;
 	unsigned int wait_for_reset;
 	unsigned int num_bits_resol;
+	unsigned int pll_p_offset;
 	const unsigned int *reg_values;
 	enum samsung_dsim_quirks quirks;
 };
-- 
2.25.1

