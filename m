Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E2F9C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  8 Apr 2022 16:22:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230221AbiDHQY4 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 8 Apr 2022 12:24:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230199AbiDHQYz (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 8 Apr 2022 12:24:55 -0400
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B0A010BBF0
        for <linux-samsung-soc@vger.kernel.org>; Fri,  8 Apr 2022 09:22:49 -0700 (PDT)
Received: by mail-pg1-x529.google.com with SMTP id 125so8161172pgc.11
        for <linux-samsung-soc@vger.kernel.org>; Fri, 08 Apr 2022 09:22:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=h67+xEaF679u3X7yXL9S0kYbWc8Rb5WkxAfTc72OsWE=;
        b=VjoSi9WU5V454XbD6q0vk8Y4PR6A9RpDl6B9dhzKJi6gNTDFn3lyl0CADVzDB7BSeo
         BTq8UNFYmAqm5Z4zWbZvYDcwhUpK0/EVeqIssiJCFL8BVGe5PkVBwzj8Br515L6grBLR
         UgD/GdKl6S3/PWvMd9HkgkRqSmYmCBE95ssp8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=h67+xEaF679u3X7yXL9S0kYbWc8Rb5WkxAfTc72OsWE=;
        b=OX1gvV4WDoTD8b8vtsmYbnzlK+rnUofiFGfDG9jO06sPdOrpJH7SpNnt4MPcpbDjNZ
         u+Z3Q7pvcs7cE2sjC8Jvsra45vZb54ofpwMZesAitcM7T+ApM2kw/5GtHNDQnLWMMHsv
         jgfImbWqGQNojaX3bklHHAR2FXKrhx9+wrbSNL/v7RIxYBl6l/JPFHUJ8CPBWTkWIi/d
         TpttEMy08STyh9L4LoIjrGuNs5JWCeSEb3xIY+1Sj5dNpjA0GL2YJq4hl20N2t4mSREE
         a4fXoid3iXWaM9AwqYGpaiTox0i/+a/5opvMR8jWhSfW2Eg/CXLJ0/CNjhIvMSohz5+l
         McOA==
X-Gm-Message-State: AOAM531cpuXSSIumwEOBQ/N3Pc7NIeYW7ODmg8NVam5H7Xg0rx1vn3fz
        2PcxdTB+DiCa+taO33fTUyMvhg==
X-Google-Smtp-Source: ABdhPJz3OPdHHuEVTCzuIQR+OnVd+H9EwJqCLGXpxHAoSLoARiy/JNu3Mkt6PeZzcb0UTqJHopaSwA==
X-Received: by 2002:a63:ec46:0:b0:381:81c4:ebbd with SMTP id r6-20020a63ec46000000b0038181c4ebbdmr16197865pgj.534.1649434968925;
        Fri, 08 Apr 2022 09:22:48 -0700 (PDT)
Received: from j-ThinkPad-E14-Gen-2.domain.name ([45.249.78.214])
        by smtp.gmail.com with ESMTPSA id n18-20020a056a0007d200b004fdac35672fsm24929863pfu.68.2022.04.08.09.22.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Apr 2022 09:22:48 -0700 (PDT)
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
        Rob Herring <robh+dt@kernel.org>
Cc:     dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-amarula <linux-amarula@amarulasolutions.com>,
        Jagan Teki <jagan@amarulasolutions.com>
Subject: [PATCH 05/11] drm: bridge: samsung-dsim: Fix PLL_P (PMS_P) offset
Date:   Fri,  8 Apr 2022 21:51:02 +0530
Message-Id: <20220408162108.184583-6-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220408162108.184583-1-jagan@amarulasolutions.com>
References: <20220408162108.184583-1-jagan@amarulasolutions.com>
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
index 3e12b469dfa8..423d654e8ffd 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -169,7 +169,7 @@
 /* DSIM_PLLCTRL */
 #define DSIM_FREQ_BAND(x)		((x) << 24)
 #define DSIM_PLL_EN			(1 << 23)
-#define DSIM_PLL_P(x)			((x) << 13)
+#define DSIM_PLL_P(x, offset)		((x) << (offset))
 #define DSIM_PLL_M(x)			((x) << 4)
 #define DSIM_PLL_S(x)			((x) << 1)
 
@@ -369,6 +369,7 @@ static const struct samsung_dsim_driver_data exynos3_dsi_driver_data = {
 	.max_freq = 1000,
 	.wait_for_reset = 1,
 	.num_bits_resol = 11,
+	.pll_p_offset = 13,
 	.reg_values = reg_values,
 	.platform_init = true,
 };
@@ -382,6 +383,7 @@ static const struct samsung_dsim_driver_data exynos4_dsi_driver_data = {
 	.max_freq = 1000,
 	.wait_for_reset = 1,
 	.num_bits_resol = 11,
+	.pll_p_offset = 13,
 	.reg_values = reg_values,
 	.platform_init = true,
 };
@@ -393,6 +395,7 @@ static const struct samsung_dsim_driver_data exynos5_dsi_driver_data = {
 	.max_freq = 1000,
 	.wait_for_reset = 1,
 	.num_bits_resol = 11,
+	.pll_p_offset = 13,
 	.reg_values = reg_values,
 	.platform_init = true,
 };
@@ -405,6 +408,7 @@ static const struct samsung_dsim_driver_data exynos5433_dsi_driver_data = {
 	.max_freq = 1500,
 	.wait_for_reset = 0,
 	.num_bits_resol = 12,
+	.pll_p_offset = 13,
 	.reg_values = exynos5433_reg_values,
 	.platform_init = true,
 };
@@ -417,6 +421,7 @@ static const struct samsung_dsim_driver_data exynos5422_dsi_driver_data = {
 	.max_freq = 1500,
 	.wait_for_reset = 1,
 	.num_bits_resol = 12,
+	.pll_p_offset = 13,
 	.reg_values = exynos5422_reg_values,
 	.platform_init = true,
 };
@@ -564,7 +569,8 @@ static unsigned long samsung_dsim_set_pll(struct samsung_dsim *dsi,
 	writel(driver_data->reg_values[PLL_TIMER],
 			dsi->reg_base + driver_data->plltmr_reg);
 
-	reg = DSIM_PLL_EN | DSIM_PLL_P(p) | DSIM_PLL_M(m) | DSIM_PLL_S(s);
+	reg = DSIM_PLL_EN | DSIM_PLL_P(p, driver_data->pll_p_offset) |
+	      DSIM_PLL_M(m) | DSIM_PLL_S(s);
 
 	if (driver_data->has_freqband) {
 		static const unsigned long freq_bands[] = {
diff --git a/include/drm/bridge/samsung-dsim.h b/include/drm/bridge/samsung-dsim.h
index eca7eacb5910..4eb48ec6543f 100644
--- a/include/drm/bridge/samsung-dsim.h
+++ b/include/drm/bridge/samsung-dsim.h
@@ -38,6 +38,7 @@ struct samsung_dsim_driver_data {
 	unsigned int max_freq;
 	unsigned int wait_for_reset;
 	unsigned int num_bits_resol;
+	unsigned int pll_p_offset;
 	const unsigned int *reg_values;
 	bool platform_init;
 };
-- 
2.25.1

