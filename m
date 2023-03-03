Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FAB2C7EE37
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  3 Mar 2023 14:53:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230326AbjCCOxn (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 3 Mar 2023 09:53:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229959AbjCCOxm (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 3 Mar 2023 09:53:42 -0500
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAC0A18156
        for <linux-samsung-soc@vger.kernel.org>; Fri,  3 Mar 2023 06:53:40 -0800 (PST)
Received: by mail-pl1-x62c.google.com with SMTP id a2so2917946plm.4
        for <linux-samsung-soc@vger.kernel.org>; Fri, 03 Mar 2023 06:53:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aujyWPMFHiJShpD2rYyPMOf2wRQo87mEd8rP+CNjbJo=;
        b=erNIyvHi5SVgcpvgvhgkRAw/PQH5VhOu+Z14lyz7vZUAaWJ1HBzOryjsmIkohs57Qz
         Rav/xys05y9WX++UjFcOoEp+ECexwacCVKFAK7PF8wocTVpXrTTu144ZGSSR8I9FRx0j
         ThdzfthxwFqyf+DdXdEMW0kXZzz3H5TROoPlQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aujyWPMFHiJShpD2rYyPMOf2wRQo87mEd8rP+CNjbJo=;
        b=UWT0yodbmY1gPb+OniBySqhRcRW9jqIL/KdFZRslIcwcXGh6AKzhlUK6apQiFcyjnh
         XQOWVoQx16wv2FxM2Mh2WeArAZr96LmCVxFUQZXj/plC+vjQ5blo/+bKCV/B5KE3n2ZW
         /mPdlNtdlW90bpKAPcGu7eiYaaKK7grN90jR2MffD209tqSCB3a3FYhSUqxrVDsM0H3z
         gOohcDETMkCOnJgGxNm0x1H2nujzz4OWzDZwJgx/yRYzvlL074MpCLVMly7Srlg/F8VD
         s1guwhyKBnZoIFXwQvByw/3ixz8ari3lpc/g8vaBJfRxhshNxx8RezF0lW1rv0hbw2wP
         BC9g==
X-Gm-Message-State: AO0yUKUmHJhLEOguhbiDyTUlOhF3Ln4kNkx/1wJkcZZR7M+qLtdanVlO
        cnllut7sVAMCO3dg2VVQ9R0xzQ==
X-Google-Smtp-Source: AK7set//wi6XK3GdnYb/FMtSE9HHuo5wIh991VjF8hWOjdDl95RsK0pfHsfmt1DcTFHGFnPMtEBbsg==
X-Received: by 2002:a05:6a21:9998:b0:cc:d514:62ce with SMTP id ve24-20020a056a21999800b000ccd51462cemr2896607pzb.44.1677855220331;
        Fri, 03 Mar 2023 06:53:40 -0800 (PST)
Received: from localhost.localdomain ([183.83.137.89])
        by smtp.gmail.com with ESMTPSA id z4-20020a63e544000000b00502fd70b0bdsm1660856pgj.52.2023.03.03.06.53.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Mar 2023 06:53:39 -0800 (PST)
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
        Robert Foss <robert.foss@linaro.org>,
        Jagan Teki <jagan@amarulasolutions.com>
Subject: [PATCH v15 16/16] drm: bridge: samsung-dsim: Add i.MX8M Plus support
Date:   Fri,  3 Mar 2023 20:21:38 +0530
Message-Id: <20230303145138.29233-17-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230303145138.29233-1-jagan@amarulasolutions.com>
References: <20230303145138.29233-1-jagan@amarulasolutions.com>
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
Changes for v15, v13:
- none
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
index 3ffdaedaa261..b4a5348b763c 100644
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
@@ -1721,6 +1729,10 @@ static const struct samsung_dsim_host_ops generic_dsim_host_ops = {
 	.unregister_host = generic_dsim_unregister_host,
 };
 
+static const struct drm_bridge_timings samsung_dsim_bridge_timings_de_high = {
+	.input_bus_flags = DRM_BUS_FLAG_DE_HIGH,
+};
+
 static const struct drm_bridge_timings samsung_dsim_bridge_timings_de_low = {
 	.input_bus_flags = DRM_BUS_FLAG_DE_LOW,
 };
@@ -1810,6 +1822,8 @@ int samsung_dsim_probe(struct platform_device *pdev)
 	/* DE_LOW: i.MX8M Mini/Nano LCDIF-DSIM glue logic inverts HS/VS/DE */
 	if (dsi->plat_data->hw_type == DSIM_TYPE_IMX8MM)
 		dsi->bridge.timings = &samsung_dsim_bridge_timings_de_low;
+	else
+		dsi->bridge.timings = &samsung_dsim_bridge_timings_de_high;
 
 	if (dsi->plat_data->host_ops && dsi->plat_data->host_ops->register_host)
 		ret = dsi->plat_data->host_ops->register_host(dsi);
@@ -1915,11 +1929,20 @@ static const struct samsung_dsim_plat_data samsung_dsim_imx8mm_pdata = {
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

