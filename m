Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5609C001B2
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 14 Dec 2022 13:00:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238467AbiLNNAl (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 14 Dec 2022 08:00:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238450AbiLNNAY (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 14 Dec 2022 08:00:24 -0500
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC37D15FE6
        for <linux-samsung-soc@vger.kernel.org>; Wed, 14 Dec 2022 05:00:21 -0800 (PST)
Received: by mail-pl1-x634.google.com with SMTP id d15so3244125pls.6
        for <linux-samsung-soc@vger.kernel.org>; Wed, 14 Dec 2022 05:00:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+fY/W1lN+Ci+ECm9hkCI93VoUxar0STDOgEhzXF/A8s=;
        b=rsn53jOgvaHnSPClkdCilxAYUyKIhL7XoZyhFoS0NIJ3Xz8Nn95/5/oQqNOOQ3xAaL
         4JPYKGXjwwCoLYN39RAJehhl2cco9O8I4GPNhyG0rkwG125KXFJ8y6F0AvqhJOG14hWd
         h+868+KXL4z9AgVu+XbBEY3PXTFg9ObvIXKGI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+fY/W1lN+Ci+ECm9hkCI93VoUxar0STDOgEhzXF/A8s=;
        b=4jFuyh2ypRdyR9Wx8quI8tmtLCd6nt1s1ld5zALN6HsISq1HyKxibU/G5utEWd6wXE
         gMH1N26agj3Hlq6ksyWBriWSjRrqgq67jbwywJRpQxaALqnxXF1s5rEJMS2WMGD4mU1f
         ehqI9hk8tq0s5HBIepCQYoP+OM749P8ZgTNh3Wb83KSPYco/I9YPRG3N5T4YoNKAwnoj
         G7HHI+ZAMLY9C+zDi9R/QeoCQT0Rqh3AQNla4mUD7jcghQjkBBWEBzX9gTMkB1HgS3zC
         RELFGYmDwD5FaSA7jjqIKtZwDloCq9QDEOaGMhqcujNfhEDqF59c+zit88taX0gBZlV+
         oZWQ==
X-Gm-Message-State: ANoB5plJYtiC/mx1Pc1vtbcmmNs5wQ5rYL5WTsGrsM3c0LUomlAKOydp
        uTO3K+8MRY+IzEo+L8FwekGP9A==
X-Google-Smtp-Source: AA0mqf4OotpD+Ld0ym8pUMjcO3S0OErqGGSvzzmhhfhHTxBOcRPjM+3UawwQzSwXKcKVirLVJqbcHQ==
X-Received: by 2002:a17:903:328e:b0:189:dfae:f9c2 with SMTP id jh14-20020a170903328e00b00189dfaef9c2mr24293927plb.23.1671022821194;
        Wed, 14 Dec 2022 05:00:21 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a809:5e03:faf:846e:352d])
        by smtp.gmail.com with ESMTPSA id ix17-20020a170902f81100b001895f7c8a71sm1838651plb.97.2022.12.14.05.00.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Dec 2022 05:00:20 -0800 (PST)
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
Subject: [PATCH v10 07/18] drm: exynos: dsi: Introduce hw_type platform data
Date:   Wed, 14 Dec 2022 18:28:56 +0530
Message-Id: <20221214125907.376148-8-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221214125907.376148-1-jagan@amarulasolutions.com>
References: <20221214125907.376148-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Samsung MIPI DSIM controller is common DSI IP that can be used
in various SoCs like Exynos, i.MX8M Mini/Nano/Plus.

Add hw_type enum via platform_data so that accessing the different
controller data between various platforms becomes easy and meaningful.

Suggested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v10:
- split from previous series patch
"drm: bridge: Generalize Exynos-DSI driver into a Samsung DSIM bridge"
- update enum type names

 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 84 ++++++++++++++++++++-----
 1 file changed, 69 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index 7a845badb1b2..fdaf514b39f2 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -254,6 +254,16 @@ struct exynos_dsi_transfer {
 #define DSIM_STATE_CMD_LPM		BIT(2)
 #define DSIM_STATE_VIDOUT_AVAILABLE	BIT(3)
 
+enum exynos_dsi_type {
+	DSIM_TYPE_EXYNOS3250,
+	DSIM_TYPE_EXYNOS4210,
+	DSIM_TYPE_EXYNOS5410,
+	DSIM_TYPE_EXYNOS5422,
+	DSIM_TYPE_EXYNOS5433,
+
+	DSIM_TYPE_COUNT,
+};
+
 struct exynos_dsi_driver_data {
 	const unsigned int *reg_ofs;
 	unsigned int plltmr_reg;
@@ -267,6 +277,10 @@ struct exynos_dsi_driver_data {
 	const unsigned int *reg_values;
 };
 
+struct exynos_dsi_plat_data {
+	enum exynos_dsi_type hw_type;
+};
+
 struct exynos_dsi {
 	struct drm_encoder encoder;
 	struct mipi_dsi_host dsi_host;
@@ -297,6 +311,7 @@ struct exynos_dsi {
 	struct list_head transfer_list;
 
 	const struct exynos_dsi_driver_data *driver_data;
+	const struct exynos_dsi_plat_data *plat_data;
 };
 
 #define host_to_dsi(host) container_of(host, struct exynos_dsi, dsi_host)
@@ -524,18 +539,13 @@ static const struct exynos_dsi_driver_data exynos5422_dsi_driver_data = {
 	.reg_values = exynos5422_reg_values,
 };
 
-static const struct of_device_id exynos_dsi_of_match[] = {
-	{ .compatible = "samsung,exynos3250-mipi-dsi",
-	  .data = &exynos3_dsi_driver_data },
-	{ .compatible = "samsung,exynos4210-mipi-dsi",
-	  .data = &exynos4_dsi_driver_data },
-	{ .compatible = "samsung,exynos5410-mipi-dsi",
-	  .data = &exynos5_dsi_driver_data },
-	{ .compatible = "samsung,exynos5422-mipi-dsi",
-	  .data = &exynos5422_dsi_driver_data },
-	{ .compatible = "samsung,exynos5433-mipi-dsi",
-	  .data = &exynos5433_dsi_driver_data },
-	{ }
+static const struct exynos_dsi_driver_data *
+exynos_dsi_types[DSIM_TYPE_COUNT] = {
+	[DSIM_TYPE_EXYNOS3250] = &exynos3_dsi_driver_data,
+	[DSIM_TYPE_EXYNOS4210] = &exynos4_dsi_driver_data,
+	[DSIM_TYPE_EXYNOS5410] = &exynos5_dsi_driver_data,
+	[DSIM_TYPE_EXYNOS5422] = &exynos5422_dsi_driver_data,
+	[DSIM_TYPE_EXYNOS5433] = &exynos5433_dsi_driver_data,
 };
 
 static void exynos_dsi_wait_for_reset(struct exynos_dsi *dsi)
@@ -1468,8 +1478,6 @@ static const struct drm_bridge_funcs exynos_dsi_bridge_funcs = {
 	.attach				= exynos_dsi_attach,
 };
 
-MODULE_DEVICE_TABLE(of, exynos_dsi_of_match);
-
 static int exynos_dsi_host_attach(struct mipi_dsi_host *host,
 				  struct mipi_dsi_device *device)
 {
@@ -1659,7 +1667,8 @@ static int exynos_dsi_probe(struct platform_device *pdev)
 	dsi->dsi_host.dev = dev;
 
 	dsi->dev = dev;
-	dsi->driver_data = of_device_get_match_data(dev);
+	dsi->plat_data = of_device_get_match_data(dev);
+	dsi->driver_data = exynos_dsi_types[dsi->plat_data->hw_type];
 
 	dsi->supplies[0].supply = "vddcore";
 	dsi->supplies[1].supply = "vddio";
@@ -1817,6 +1826,51 @@ static const struct dev_pm_ops exynos_dsi_pm_ops = {
 				pm_runtime_force_resume)
 };
 
+static const struct exynos_dsi_plat_data exynos3250_dsi_pdata = {
+	.hw_type = DSIM_TYPE_EXYNOS3250,
+};
+
+static const struct exynos_dsi_plat_data exynos4210_dsi_pdata = {
+	.hw_type = DSIM_TYPE_EXYNOS4210,
+};
+
+static const struct exynos_dsi_plat_data exynos5410_dsi_pdata = {
+	.hw_type = DSIM_TYPE_EXYNOS5410,
+};
+
+static const struct exynos_dsi_plat_data exynos5422_dsi_pdata = {
+	.hw_type = DSIM_TYPE_EXYNOS5422,
+};
+
+static const struct exynos_dsi_plat_data exynos5433_dsi_pdata = {
+	.hw_type = DSIM_TYPE_EXYNOS5433,
+};
+
+static const struct of_device_id exynos_dsi_of_match[] = {
+	{
+		.compatible = "samsung,exynos3250-mipi-dsi",
+		.data = &exynos3250_dsi_pdata,
+	},
+	{
+		.compatible = "samsung,exynos4210-mipi-dsi",
+		.data = &exynos4210_dsi_pdata,
+	},
+	{
+		.compatible = "samsung,exynos5410-mipi-dsi",
+		.data = &exynos5410_dsi_pdata,
+	},
+	{
+		.compatible = "samsung,exynos5422-mipi-dsi",
+		.data = &exynos5422_dsi_pdata,
+	},
+	{
+		.compatible = "samsung,exynos5433-mipi-dsi",
+		.data = &exynos5433_dsi_pdata,
+	},
+	{ /* sentinel. */ }
+};
+MODULE_DEVICE_TABLE(of, exynos_dsi_of_match);
+
 struct platform_driver dsi_driver = {
 	.probe = exynos_dsi_probe,
 	.remove = exynos_dsi_remove,
-- 
2.25.1

