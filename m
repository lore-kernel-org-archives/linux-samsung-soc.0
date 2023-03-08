Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54A24C64EC4
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  8 Mar 2023 16:40:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229482AbjCHQkp (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 8 Mar 2023 11:40:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229480AbjCHQko (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 8 Mar 2023 11:40:44 -0500
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 001298F706
        for <linux-samsung-soc@vger.kernel.org>; Wed,  8 Mar 2023 08:40:42 -0800 (PST)
Received: by mail-pj1-x1030.google.com with SMTP id bo22so17030807pjb.4
        for <linux-samsung-soc@vger.kernel.org>; Wed, 08 Mar 2023 08:40:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1678293642;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4/ZpRoWlscQf7x650G5ocJj9fBh6agMK8aXNyTthMvo=;
        b=SV94dmfQjWH52IZziUxn/mTc9bMTNBDi68+NqDy77RP1erUU/FI6FmJkxZts3bgfdJ
         p6V96yOkXcYOV0DKRrji41ifWXH/i11utAJpu5uykexM1XI2F+GkNxb3xRE7e/ngah39
         0e9COr4CH3ubCwqpcsE7xXGOWAF/SET5BnOh8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678293642;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4/ZpRoWlscQf7x650G5ocJj9fBh6agMK8aXNyTthMvo=;
        b=um2m+U/iXNwBE2HcHGSwMCCBV+jOvbvNOJtRJ1y3PyQcFflG2TkJC5yHt974pqDwHW
         q4Ny0C5zcZnXCWoI2BzBvUetDWDuuOf2feTh2cwy6q0pTBfYYVw5J4azfr+LZxHdIRZ/
         RH447kz0q+i7qI7Bk1qlqdLtn1ULgH0nJwyC5JpUbeXr4ONUlXjGb55/YYcG8aittaaH
         /GOZaeQUATJQ5BzZR7XFLECIfHHaeErkvAwPoG5GmfTnKMoDbb5QVS6UyPVceHp1Zdty
         vRd65H2o30g7D45gFsM21WKjF1A1nx79KGUzwFbhTBomWYJpu6o3UyDxkojSsk83yZK/
         F9Yw==
X-Gm-Message-State: AO0yUKWlFY9PIW1ZbUTjrQchVH05fSoxYEw7pD9JhVot+ITV9bNJQYYf
        iCojAt19mwS7o5ojR02Eumti9g==
X-Google-Smtp-Source: AK7set/3dBjOkA7LIY1H1yR1LWqAtl9C8uTE/uoiIuYu/hm8Ezh9Wa5VGu3DuhUMDjx70eB0qY8zBA==
X-Received: by 2002:a17:902:d353:b0:19e:2e6b:142e with SMTP id l19-20020a170902d35300b0019e2e6b142emr18567080plk.63.1678293642497;
        Wed, 08 Mar 2023 08:40:42 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a8a1:b545:91cc:80b2:f9fe])
        by smtp.gmail.com with ESMTPSA id kq3-20020a170903284300b0019b9a075f1fsm10046540plb.80.2023.03.08.08.40.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Mar 2023 08:40:41 -0800 (PST)
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
        Jagan Teki <jagan@amarulasolutions.com>
Subject: [PATCH v16 04/16] drm: exynos: dsi: Add platform PLL_P (PMS_P) offset
Date:   Wed,  8 Mar 2023 22:09:41 +0530
Message-Id: <20230308163953.28506-5-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230308163953.28506-1-jagan@amarulasolutions.com>
References: <20230308163953.28506-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Look like PLL PMS_P offset value varies between platforms that have
Samsung DSIM IP.

However, there is no clear evidence for it as both Exynos and i.MX
8M Mini Application Processor Reference Manual is still referring
the PMS_P offset as 13.

The offset 13 is not working for i.MX8M Mini SoCs but the downstream
NXP sec-dsim.c driver is using offset 14 for i.MX8M Mini SoC platforms
[1] [2].

PMS_P value set in sec_mipi_dsim_check_pll_out using PLLCTRL_SET_P()
with offset 13 and then an additional offset of one bit added in
sec_mipi_dsim_config_pll via PLLCTRL_SET_PMS().

Not sure whether it is reference manual documentation or something
else but this patch trusts the downstream code and handle PLL_P offset
via platform driver data so-that imx8mm driver data shall use
pll_p_offset to 14.

Similar to Mini the i.MX8M Nano/Plus also has P=14, unlike Exynos.

[1] https://source.codeaurora.org/external/imx/linux-imx/tree/drivers/gpu/drm/bridge/sec-dsim.c?h=imx_5.4.47_2.2.0#n210
[2] https://source.codeaurora.org/external/imx/linux-imx/tree/drivers/gpu/drm/bridge/sec-dsim.c?h=imx_5.4.47_2.2.0#n211

Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Reviewed-by: Marek Vasut <marex@denx.de>
Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v16:
- collect TB from Marek S
Changes for v15, v13, v12, v11, v10, v9:
- none
Changes for v8:
- updated commit message for 8M Nano/Plus
Changes for v7, v6:
- none
Changes for v5:
- updated clear commit message
Changes for v4, v3, v2:
- none
Changes for v1:
- updated commit message
- add downstream driver link

 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index 1615640e25d6..90ff40af005c 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -194,7 +194,7 @@
 /* DSIM_PLLCTRL */
 #define DSIM_FREQ_BAND(x)		((x) << 24)
 #define DSIM_PLL_EN			(1 << 23)
-#define DSIM_PLL_P(x)			((x) << 13)
+#define DSIM_PLL_P(x, offset)		((x) << (offset))
 #define DSIM_PLL_M(x)			((x) << 4)
 #define DSIM_PLL_S(x)			((x) << 1)
 
@@ -263,6 +263,7 @@ struct exynos_dsi_driver_data {
 	unsigned int max_freq;
 	unsigned int wait_for_reset;
 	unsigned int num_bits_resol;
+	unsigned int pll_p_offset;
 	const unsigned int *reg_values;
 };
 
@@ -471,6 +472,7 @@ static const struct exynos_dsi_driver_data exynos3_dsi_driver_data = {
 	.max_freq = 1000,
 	.wait_for_reset = 1,
 	.num_bits_resol = 11,
+	.pll_p_offset = 13,
 	.reg_values = reg_values,
 };
 
@@ -483,6 +485,7 @@ static const struct exynos_dsi_driver_data exynos4_dsi_driver_data = {
 	.max_freq = 1000,
 	.wait_for_reset = 1,
 	.num_bits_resol = 11,
+	.pll_p_offset = 13,
 	.reg_values = reg_values,
 };
 
@@ -493,6 +496,7 @@ static const struct exynos_dsi_driver_data exynos5_dsi_driver_data = {
 	.max_freq = 1000,
 	.wait_for_reset = 1,
 	.num_bits_resol = 11,
+	.pll_p_offset = 13,
 	.reg_values = reg_values,
 };
 
@@ -504,6 +508,7 @@ static const struct exynos_dsi_driver_data exynos5433_dsi_driver_data = {
 	.max_freq = 1500,
 	.wait_for_reset = 0,
 	.num_bits_resol = 12,
+	.pll_p_offset = 13,
 	.reg_values = exynos5433_reg_values,
 };
 
@@ -515,6 +520,7 @@ static const struct exynos_dsi_driver_data exynos5422_dsi_driver_data = {
 	.max_freq = 1500,
 	.wait_for_reset = 1,
 	.num_bits_resol = 12,
+	.pll_p_offset = 13,
 	.reg_values = exynos5422_reg_values,
 };
 
@@ -628,7 +634,8 @@ static unsigned long exynos_dsi_set_pll(struct exynos_dsi *dsi,
 	writel(driver_data->reg_values[PLL_TIMER],
 			dsi->reg_base + driver_data->plltmr_reg);
 
-	reg = DSIM_PLL_EN | DSIM_PLL_P(p) | DSIM_PLL_M(m) | DSIM_PLL_S(s);
+	reg = DSIM_PLL_EN | DSIM_PLL_P(p, driver_data->pll_p_offset) |
+	      DSIM_PLL_M(m) | DSIM_PLL_S(s);
 
 	if (driver_data->has_freqband) {
 		static const unsigned long freq_bands[] = {
-- 
2.25.1

