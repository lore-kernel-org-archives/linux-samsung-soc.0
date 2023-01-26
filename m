Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9010BC05027
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 26 Jan 2023 14:48:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230371AbjAZOs3 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 26 Jan 2023 09:48:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229639AbjAZOs2 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 26 Jan 2023 09:48:28 -0500
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 430083D098
        for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Jan 2023 06:48:26 -0800 (PST)
Received: by mail-pl1-x62a.google.com with SMTP id v23so2034912plo.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Jan 2023 06:48:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mMIeNlQX1kpLCSK2213Nh/t20sw/zDBNyvoSqBTr940=;
        b=F7NyYLMycjIoMjaP3DOlXk6uH4cBhJSK095XAZrEqeiEhtY0234kpDJ/jCKP5Ar58q
         nWPzD0tNrOIdogcYU4PeAARxyDFgIjaIESTbr4eRvYsJPKKfF2Dl7aVIiYivl6+xeDXZ
         c1AQfTvFB19+pXXKriuFj/n9hZE4e5muXIMLE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mMIeNlQX1kpLCSK2213Nh/t20sw/zDBNyvoSqBTr940=;
        b=P5C2161eNPixiE8QmuhBtu8xj/r9IQXk7xCkoRteFtneMxiKKdgIO7G48tupOCvOi9
         CzyRa7jMVkazTjxtCnqlLl4UM4qTPjk9mOlXuArQgNWO1f5bU0j0Krt0epM63AkxM+eU
         PTJn2JqeyOp0Y3Mrx9E2H0dxHImXQzz/anHMDHl/oH1LikCp/q3SIF5QuJGVou9VOOOd
         pRfz3ROeslpG7p5/Ge9Uo7OR0s1WP9hsfjbHoFllTUxsRy+k67s1z7x4mWB0Cf7MO4J6
         KsEoWYNzL0olRXGCQt7wiewHVwPnvHI+D21302Ni0pSNBp8StuO/gotywX2dGcTR4w0o
         Yzbg==
X-Gm-Message-State: AO0yUKXlO1F2+nmloPu+3G8abwOzQRjsjPvAMKw5cHRTkgl9bv3LgwPX
        sZfKomiJPTYTUXsWoVN11vylsg==
X-Google-Smtp-Source: AK7set8m7x1NPxEBd47AGk3fztqr+4pr/7FTzJtG4adsdxO8pdkbQBiGBxb1NTJBcAvA8X+J/mhTyA==
X-Received: by 2002:a05:6a20:ba14:b0:b8:723f:e21b with SMTP id fa20-20020a056a20ba1400b000b8723fe21bmr2005411pzb.3.1674744505688;
        Thu, 26 Jan 2023 06:48:25 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a238:3cb1:2156:ef87:8af5])
        by smtp.gmail.com with ESMTPSA id d197-20020a6336ce000000b0042988a04bfdsm823660pga.9.2023.01.26.06.48.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jan 2023 06:48:25 -0800 (PST)
From:   Jagan Teki <jagan@amarulasolutions.com>
To:     Andrzej Hajda <andrzej.hajda@intel.com>,
        Inki Dae <inki.dae@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Frieder Schrempf <frieder.schrempf@kontron.de>,
        Tim Harvey <tharvey@gateworks.com>,
        Adam Ford <aford173@gmail.com>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Marek Vasut <marex@denx.de>
Cc:     Matteo Lisi <matteo.lisi@engicam.com>,
        dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-amarula <linux-amarula@amarulasolutions.com>,
        Jagan Teki <jagan@amarulasolutions.com>
Subject: [PATCH v12 18/18] drm: bridge: samsung-dsim: Add i.MX8M Plus support
Date:   Thu, 26 Jan 2023 20:14:27 +0530
Message-Id: <20230126144427.607098-19-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230126144427.607098-1-jagan@amarulasolutions.com>
References: <20230126144427.607098-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

From: Marek Vasut <marex@denx.de>

Add extras to support i.MX8M Plus. The main change is the removal of
HS/VS/DE signal inversion in the LCDIFv3-DSIM glue logic, otherwise
the implementation of this IP in i.MX8M Plus is very much compatible
with the i.MX8M Mini/Nano one.

Reviewed-by: Marek Vasut <marex@denx.de>
Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>
Acked-by: Robert Foss <robert.foss@linaro.org>
Signed-off-by: Marek Vasut <marex@denx.de>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v12:
- collect RB from Marek
Changes for v11:
- collect RB from Frieder
- collect ACK from Robert
Changes for v10:
- none
Changes for v9:
- added im8mp in DSIM_STATE_REINITIALIZED check
- drop previous = NULL check

 drivers/gpu/drm/bridge/samsung-dsim.c | 23 +++++++++++++++++++++++
 include/drm/bridge/samsung-dsim.h     |  1 +
 2 files changed, 24 insertions(+)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index fd042dbcd8d6..ec4a2106d34f 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -479,6 +479,7 @@ samsung_dsim_types[DSIM_TYPE_COUNT] = {
 	[DSIM_TYPE_EXYNOS5422] = &exynos5422_dsi_driver_data,
 	[DSIM_TYPE_EXYNOS5433] = &exynos5433_dsi_driver_data,
 	[DSIM_TYPE_IMX8MM] = &imx8mm_dsi_driver_data,
+	[DSIM_TYPE_IMX8MP] = &imx8mm_dsi_driver_data,
 };
 
 static inline struct samsung_dsim *host_to_dsi(struct mipi_dsi_host *h)
@@ -1452,10 +1453,17 @@ static int samsung_dsim_atomic_check(struct drm_bridge *bridge,
 	 * 13.6.2.7.2 RGB interface
 	 * both claim "Vsync, Hsync, and VDEN are active high signals.", the
 	 * LCDIF must generate inverted HS/VS/DE signals, i.e. active LOW.
+	 *
+	 * The i.MX8M Plus glue logic between LCDIFv3 and DSIM does not
+	 * implement the same behavior, therefore LCDIFv3 must generate
+	 * HS/VS/DE signals active HIGH.
 	 */
 	if (dsi->plat_data->hw_type == DSIM_TYPE_IMX8MM) {
 		adjusted_mode->flags |= (DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC);
 		adjusted_mode->flags &= ~(DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC);
+	} else if (dsi->plat_data->hw_type == DSIM_TYPE_IMX8MP) {
+		adjusted_mode->flags &= ~(DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC);
+		adjusted_mode->flags |= (DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC);
 	}
 
 	return 0;
@@ -1678,6 +1686,10 @@ static const struct samsung_dsim_host_ops generic_dsim_host_ops = {
 	.unregister_host = generic_dsim_unregister_host,
 };
 
+static const struct drm_bridge_timings samsung_dsim_bridge_timings_de_high = {
+	.input_bus_flags = DRM_BUS_FLAG_DE_HIGH,
+};
+
 static const struct drm_bridge_timings samsung_dsim_bridge_timings_de_low = {
 	.input_bus_flags = DRM_BUS_FLAG_DE_LOW,
 };
@@ -1767,6 +1779,8 @@ int samsung_dsim_probe(struct platform_device *pdev)
 	/* DE_LOW: i.MX8M Mini/Nano LCDIF-DSIM glue logic inverts HS/VS/DE */
 	if (dsi->plat_data->hw_type == DSIM_TYPE_IMX8MM)
 		dsi->bridge.timings = &samsung_dsim_bridge_timings_de_low;
+	else
+		dsi->bridge.timings = &samsung_dsim_bridge_timings_de_high;
 
 	if (dsi->plat_data->host_ops && dsi->plat_data->host_ops->register_host)
 		ret = dsi->plat_data->host_ops->register_host(dsi);
@@ -1872,11 +1886,20 @@ static const struct samsung_dsim_plat_data samsung_dsim_imx8mm_pdata = {
 	.host_ops = &generic_dsim_host_ops,
 };
 
+static const struct samsung_dsim_plat_data samsung_dsim_imx8mp_pdata = {
+	.hw_type = DSIM_TYPE_IMX8MP,
+	.host_ops = &generic_dsim_host_ops,
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
index 4ba387c958ae..fb923caf09e1 100644
--- a/include/drm/bridge/samsung-dsim.h
+++ b/include/drm/bridge/samsung-dsim.h
@@ -28,6 +28,7 @@ enum samsung_dsim_type {
 	DSIM_TYPE_EXYNOS5422,
 	DSIM_TYPE_EXYNOS5433,
 	DSIM_TYPE_IMX8MM,
+	DSIM_TYPE_IMX8MP,
 	DSIM_TYPE_COUNT,
 };
 
-- 
2.25.1

