Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8213EC54EB4
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 23 Jan 2023 15:13:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232249AbjAWPNP (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 23 Jan 2023 10:13:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232254AbjAWPNO (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 23 Jan 2023 10:13:14 -0500
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7B2926847
        for <linux-samsung-soc@vger.kernel.org>; Mon, 23 Jan 2023 07:13:13 -0800 (PST)
Received: by mail-pl1-x62d.google.com with SMTP id k13so11739683plg.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 23 Jan 2023 07:13:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U9Y+6AYElVzmPLEEE0cyqelpoYne/+Yj3ASyLzLLBEM=;
        b=RzKYLDoYal3Qu89Rw+yHgel5moNDNhcE1yaTrI/W/U6GCKL0ioMOZ78MV1XOhEB2NY
         RJvn7ySX0xF3G1qNr5JUKXQ3vEGZvArvybep87Wev+ops0emPFri4F3OWp/MJQZfo3Ka
         e6ax3qf0HsEgMnUm5k5MorYhR3Z2QRN06gSyY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U9Y+6AYElVzmPLEEE0cyqelpoYne/+Yj3ASyLzLLBEM=;
        b=JffZJqaFq3Jf2ZHI+OiuhdqZrbwZfpIk8FLttmPVppIscuYKaj2KmTw0yY4PP7Okhm
         0Oqzj/SBR9lcPfBIZX5785e2ciIhbT/jizBXIexJZjT8gX9qtP2AI2RvY2NK9wnpvZ19
         qLxtpAjF5gRxwhWd8BSgyXw4LhwdUGQ7rXP/V5eQv9ASRd6uy/9NcXkhf28y9pYKLtN2
         v2tnoE9EsuDn7+Vb8J6bJpsAvLmUHv0qvhqn3ycs5panyD6rhtz0WpnysCFVslnfmpXQ
         oyHU+0uLFoQjLLM8dcSXcR8z2PS4dfV20oflF/+rygtmmRZkFX98wWxnJaZjpb2Zykma
         Q5Sg==
X-Gm-Message-State: AFqh2krEszcu128SYvnwAA24Uir8mnr//RlJazmyl+mBz4WUeM7FJnOn
        WfV3h0KfdbGsaouZw32W51F+Rw==
X-Google-Smtp-Source: AMrXdXv80Cw2tZdoDSwrkhwELG22L3Lxw/1VE5brj+DSK1u7GmUe6suJXwimuIMaEtwGY33boJRUug==
X-Received: by 2002:a17:902:9688:b0:192:55ab:88fe with SMTP id n8-20020a170902968800b0019255ab88femr24360923plp.56.1674486793408;
        Mon, 23 Jan 2023 07:13:13 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a15f:2279:f361:f93b:7971])
        by smtp.gmail.com with ESMTPSA id d5-20020a170903230500b001754fa42065sm19207111plh.143.2023.01.23.07.13.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jan 2023 07:13:12 -0800 (PST)
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
        Jagan Teki <jagan@amarulasolutions.com>
Subject: [RESEND PATCH v11 06/18] drm: exynos: dsi: Add platform PLL_P (PMS_P) offset
Date:   Mon, 23 Jan 2023 20:42:00 +0530
Message-Id: <20230123151212.269082-7-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230123151212.269082-1-jagan@amarulasolutions.com>
References: <20230123151212.269082-1-jagan@amarulasolutions.com>
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

Reviewed-by: Marek Vasut <marex@denx.de>
Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v11, v10, v9:
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
index 5918d31127aa..7a845badb1b2 100644
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

