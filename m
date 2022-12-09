Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AC7BC4167B
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  9 Dec 2022 15:29:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229710AbiLIP35 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 9 Dec 2022 10:29:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229512AbiLIP3q (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 9 Dec 2022 10:29:46 -0500
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89836FCFF
        for <linux-samsung-soc@vger.kernel.org>; Fri,  9 Dec 2022 07:29:45 -0800 (PST)
Received: by mail-pl1-x62d.google.com with SMTP id jn7so5201763plb.13
        for <linux-samsung-soc@vger.kernel.org>; Fri, 09 Dec 2022 07:29:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xNNQvL6gmHJgo6OwoezUZSB4ceELF3kYUZfEbLlRThk=;
        b=UMsZ3eNi6sRQPXBTi2kiU/rR25gBozLv89OKl8jLxQ7mPZiMhiLehdkjROAqNMPYFK
         2SGAbFjUmvkHClPfJOp7pbc4UBx0m3HDotebjKF4f4V8IRPqLCoqBJu1bch9iitAw/4U
         Pp1ivi3v2b83VeO747qREcLi6vCZYDPIfOvLE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xNNQvL6gmHJgo6OwoezUZSB4ceELF3kYUZfEbLlRThk=;
        b=Eab4s66cGcy1MJB1G2m8PfEjIcy4sX6Puma5LVay6MhexxHzCG78tjhWC09lhCAvSf
         nwiuh1p1740cmurTJkPLlF9VgtNUHC/ChZjCx51arlmHQpBBo6+ykisO2Z1lVwXS8gCt
         4C1UOFwmwBXo27RUbjJrU3payKUiooLPpVq0V+UTE5BSGadd766CFsFhnWQS0q5rcNbH
         CJ5zH5ekeNfJmTPICvQ+z+XFCTxaSJ3jO0JP+F3H8Ni8/wqNqQFFZsZHvbktGAkqcKb5
         TlhJ6OvVKJGMw1XjI8fnZlFCZkK8zs9jrQ5Tn17zmPTf4zmr3b/sFzM4JzTAVaV1CXzu
         FllA==
X-Gm-Message-State: ANoB5pnqbi8u2NUYhJuCOBUK1YHY0/7tBx4yH/JE/Mp1v/6AQfwm2OqB
        795dKco8BNnqM34CLXMr4+9Jgg==
X-Google-Smtp-Source: AA0mqf51MIJwtIR7uEW8WMm8FAaHgBA1nquudNxkRWq2jrYhralxkuwSBPCCGGTIDNPiZWq5m6nTXg==
X-Received: by 2002:a17:902:a60c:b0:189:f990:24af with SMTP id u12-20020a170902a60c00b00189f99024afmr5692194plq.20.1670599784952;
        Fri, 09 Dec 2022 07:29:44 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a809:6ba1:bbda:c542:ba0b])
        by smtp.gmail.com with ESMTPSA id x14-20020a170902ec8e00b00188c5f0f9e9sm1477587plg.199.2022.12.09.07.29.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Dec 2022 07:29:44 -0800 (PST)
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
Subject: [PATCH v9 18/18] drm: bridge: samsung-dsim: Add i.MX8M Plus support
Date:   Fri,  9 Dec 2022 20:53:43 +0530
Message-Id: <20221209152343.180139-19-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221209152343.180139-1-jagan@amarulasolutions.com>
References: <20221209152343.180139-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Add extras to support i.MX8M Plus. The main change is the removal of
HS/VS/DE signal inversion in the LCDIFv3-DSIM glue logic, otherwise
the implementation of this IP in i.MX8M Plus is very much compatible
with the i.MX8M Mini/Nano one.

Signed-off-by: Marek Vasut <marex@denx.de>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v9:
- added im8mp in DSIM_STATE_REINITIALIZED check

 drivers/gpu/drm/bridge/samsung-dsim.c | 26 +++++++++++++++++++++++++-
 include/drm/bridge/samsung-dsim.h     |  1 +
 2 files changed, 26 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index 7ff10308a7ad..6e9ad955ebd3 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -479,6 +479,7 @@ samsung_dsim_types[SAMSUNG_DSIM_TYPE_COUNT] = {
 	[SAMSUNG_DSIM_TYPE_EXYNOS5422] = &exynos5422_dsi_driver_data,
 	[SAMSUNG_DSIM_TYPE_EXYNOS5433] = &exynos5433_dsi_driver_data,
 	[SAMSUNG_DSIM_TYPE_IMX8MM] = &imx8mm_dsi_driver_data,
+	[SAMSUNG_DSIM_TYPE_IMX8MP] = &imx8mm_dsi_driver_data,
 };
 
 static inline struct samsung_dsim *host_to_dsi(struct mipi_dsi_host *h)
@@ -1305,7 +1306,8 @@ static int samsung_dsim_init(struct samsung_dsim *dsi, unsigned int flag)
 	 * This host reinitialization is handled via DSIM_STATE_REINITIALIZED
 	 * flag and triggers from host transfer. Do this exclusively for Exynos.
 	 */
-	if ((dsi->plat_data->hw_type == SAMSUNG_DSIM_TYPE_IMX8MM) &&
+	if ((dsi->plat_data->hw_type == SAMSUNG_DSIM_TYPE_IMX8MM ||
+	    dsi->plat_data->hw_type == SAMSUNG_DSIM_TYPE_IMX8MP) &&
 	    dsi->state & DSIM_STATE_REINITIALIZED)
 		return 0;
 
@@ -1468,10 +1470,17 @@ static int samsung_dsim_atomic_check(struct drm_bridge *bridge,
 	 * 13.6.2.7.2 RGB interface
 	 * both claim "Vsync, Hsync, and VDEN are active high signals.", the
 	 * LCDIF must generate inverted HS/VS/DE signals, i.e. active LOW.
+	 *
+	 * The i.MX8M Plus glue logic between LCDIFv3 and DSIM does not
+	 * implement the same behavior, therefore LCDIFv3 must generate
+	 * HS/VS/DE signals active HIGH.
 	 */
 	if (dsi->plat_data->hw_type == SAMSUNG_DSIM_TYPE_IMX8MM) {
 		adjusted_mode->flags |= (DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC);
 		adjusted_mode->flags &= ~(DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC);
+	} else if (dsi->plat_data->hw_type == SAMSUNG_DSIM_TYPE_IMX8MP) {
+		adjusted_mode->flags &= ~(DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC);
+		adjusted_mode->flags |= (DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC);
 	}
 
 	return 0;
@@ -1689,6 +1698,10 @@ static const struct samsung_dsim_host_ops samsung_dsim_generic_host_ops = {
 	.unregister_host = samsung_dsim_unregister_host,
 };
 
+static const struct drm_bridge_timings samsung_dsim_bridge_timings_de_high = {
+	.input_bus_flags = DRM_BUS_FLAG_DE_HIGH,
+};
+
 static const struct drm_bridge_timings samsung_dsim_bridge_timings_de_low = {
 	.input_bus_flags = DRM_BUS_FLAG_DE_LOW,
 };
@@ -1778,6 +1791,8 @@ int samsung_dsim_probe(struct platform_device *pdev)
 	/* DE_LOW: i.MX8M Mini/Nano LCDIF-DSIM glue logic inverts HS/VS/DE */
 	if (dsi->plat_data->hw_type == SAMSUNG_DSIM_TYPE_IMX8MM)
 		dsi->bridge.timings = &samsung_dsim_bridge_timings_de_low;
+	else
+		dsi->bridge.timings = &samsung_dsim_bridge_timings_de_high;
 
 	if (dsi->plat_data->host_ops && dsi->plat_data->host_ops->register_host)
 		ret = dsi->plat_data->host_ops->register_host(dsi);
@@ -1883,11 +1898,20 @@ static const struct samsung_dsim_plat_data samsung_dsim_imx8mm_pdata = {
 	.host_ops = &samsung_dsim_generic_host_ops,
 };
 
+static const struct samsung_dsim_plat_data samsung_dsim_imx8mp_pdata = {
+	.hw_type = SAMSUNG_DSIM_TYPE_IMX8MP,
+	.host_ops = &samsung_dsim_generic_host_ops,
+};
+
 static const struct of_device_id samsung_dsim_of_match[] = {
 	{
 		.compatible = "fsl,imx8mm-mipi-dsim",
 		.data = &samsung_dsim_imx8mm_pdata,
 	},
+	{
+		.compatible = "fsl,imx8mp-mipi-dsim",
+		.data = &samsung_dsim_imx8mp_pdata,
+	},
 	{ /* sentinel. */ }
 };
 MODULE_DEVICE_TABLE(of, samsung_dsim_of_match);
diff --git a/include/drm/bridge/samsung-dsim.h b/include/drm/bridge/samsung-dsim.h
index df3d030daec6..3789f9dbb238 100644
--- a/include/drm/bridge/samsung-dsim.h
+++ b/include/drm/bridge/samsung-dsim.h
@@ -28,6 +28,7 @@ enum samsung_dsim_type {
 	SAMSUNG_DSIM_TYPE_EXYNOS5422,
 	SAMSUNG_DSIM_TYPE_EXYNOS5433,
 	SAMSUNG_DSIM_TYPE_IMX8MM,
+	SAMSUNG_DSIM_TYPE_IMX8MP,
 	SAMSUNG_DSIM_TYPE_COUNT,
 };
 
-- 
2.25.1

