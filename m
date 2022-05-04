Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFF26C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  4 May 2022 11:41:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348916AbiEDLok (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 4 May 2022 07:44:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348917AbiEDLoj (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 4 May 2022 07:44:39 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEA7BE0D2
        for <linux-samsung-soc@vger.kernel.org>; Wed,  4 May 2022 04:41:03 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id iq2-20020a17090afb4200b001d93cf33ae9so4925533pjb.5
        for <linux-samsung-soc@vger.kernel.org>; Wed, 04 May 2022 04:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VdD/wGuLMDzQpZtAEHDiK9YZwN0IPCd8Y4aW5A9u8PY=;
        b=hf7zZJvFwJauSkyXVeWkDRtHNkmvKRNwJja0aCJjitVuqn0rZ/G1qRLFVAkk6AQlwq
         FFbI8JUUJBNr8y/mJ5RvChuZDt/kOBF5Emqi3R/FXybLYjt6DssBfMb7+DkozBN1tua5
         d2DgAn3WCVtMAdBLnIlEHwaN5ySulFkbGDWG4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VdD/wGuLMDzQpZtAEHDiK9YZwN0IPCd8Y4aW5A9u8PY=;
        b=nde54Y9Zw0C9y5QkhMmEzY/BBfAO/Z/XN/PWkJj4WX9vUn45hBbEf43Srzo0Afj1O8
         0R0LUgXpmR3tH92N4xfatmU9BBC55EZSizvszkZBZ2zk0PfW7z/yRxtqA4tTIt2MWFJH
         TVqC4+Ya6bsUxF/43ng1Tj+ubq8g1Pgh2pZkD3Ot8LyRaGN2tWRPPnglunPbQMkTEPf8
         8na/RlZqJNVp2AtIcjX5yAFBr5zxmYS8H6trgzPTODDmuoT2cHLHbgqJeifSm/JQhWMp
         CeH7MbIroMQT8YiINGwtsk2f02uXPBkKq0nIHlHkdqtUog4R8uTlV9tUE0QudQGDjQxv
         2v7w==
X-Gm-Message-State: AOAM532QAKs7OCWJnNr5aJM6SCEMDGig0qH4qT7lQRVoAU5A658rG50c
        PSShDgEnklpBhAbWaN9YJ5Zm+Q==
X-Google-Smtp-Source: ABdhPJxQ/Ey7Ts8xFHKdtBw1BihEPT5ET563AMQiQIldEEXMR01uBieFLEoZXcQajLHNZxRIHNjIMQ==
X-Received: by 2002:a17:90a:170c:b0:1dc:20c4:6354 with SMTP id z12-20020a17090a170c00b001dc20c46354mr9874828pjd.113.1651664463136;
        Wed, 04 May 2022 04:41:03 -0700 (PDT)
Received: from localhost.localdomain ([183.83.137.38])
        by smtp.gmail.com with ESMTPSA id k15-20020aa790cf000000b0050dc7628174sm8027498pfk.78.2022.05.04.04.40.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 04:41:02 -0700 (PDT)
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
        Tommaso Merciai <tommaso.merciai@amarulasolutions.com>
Cc:     Matteo Lisi <matteo.lisi@engicam.com>,
        dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-amarula <linux-amarula@amarulasolutions.com>,
        Jagan Teki <jagan@amarulasolutions.com>
Subject: [PATCH v2 03/12] drm: bridge: samsung-dsim: Handle platform init via driver_data
Date:   Wed,  4 May 2022 17:10:12 +0530
Message-Id: <20220504114021.33265-4-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220504114021.33265-1-jagan@amarulasolutions.com>
References: <20220504114021.33265-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

In order to make a common Samsung DSIM bridge driver some platform
specific glue code needs to maintain separately as it is hard to
maintain platform specific glue and conventional component_ops on
the drm bridge drivers side.

This patch is trying to support that glue code initialization in
the form of platform_init flag in driver_data.

So, the platforms which enable platform_init flags will handle all
platform specific initialization via samsung_dsim_plat_probe.

The Platform probe is responsible to
- initialize samsung_dsim_plat_data and install hooks
- initialize component_ops
- preserve samsung_dsim structure pointer

v2:
* fix samsung_dsim_plat_probe return pointer

v1:
* use platform_init instead of exynos_specific
* handle component_ops in glue code

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 22 +++++++++++++++++-----
 include/drm/bridge/samsung-dsim.h     |  1 +
 2 files changed, 18 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index f23f06d55158..99f80e9c1600 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -370,6 +370,7 @@ static const struct samsung_dsim_driver_data exynos3_dsi_driver_data = {
 	.wait_for_reset = 1,
 	.num_bits_resol = 11,
 	.reg_values = reg_values,
+	.platform_init = true,
 };
 
 static const struct samsung_dsim_driver_data exynos4_dsi_driver_data = {
@@ -382,6 +383,7 @@ static const struct samsung_dsim_driver_data exynos4_dsi_driver_data = {
 	.wait_for_reset = 1,
 	.num_bits_resol = 11,
 	.reg_values = reg_values,
+	.platform_init = true,
 };
 
 static const struct samsung_dsim_driver_data exynos5_dsi_driver_data = {
@@ -392,6 +394,7 @@ static const struct samsung_dsim_driver_data exynos5_dsi_driver_data = {
 	.wait_for_reset = 1,
 	.num_bits_resol = 11,
 	.reg_values = reg_values,
+	.platform_init = true,
 };
 
 static const struct samsung_dsim_driver_data exynos5433_dsi_driver_data = {
@@ -403,6 +406,7 @@ static const struct samsung_dsim_driver_data exynos5433_dsi_driver_data = {
 	.wait_for_reset = 0,
 	.num_bits_resol = 12,
 	.reg_values = exynos5433_reg_values,
+	.platform_init = true,
 };
 
 static const struct samsung_dsim_driver_data exynos5422_dsi_driver_data = {
@@ -414,6 +418,7 @@ static const struct samsung_dsim_driver_data exynos5422_dsi_driver_data = {
 	.wait_for_reset = 1,
 	.num_bits_resol = 12,
 	.reg_values = exynos5422_reg_values,
+	.platform_init = true,
 };
 
 static const struct of_device_id samsung_dsim_of_match[] = {
@@ -1610,12 +1615,16 @@ static int samsung_dsim_probe(struct platform_device *pdev)
 	dsi->bridge.of_node = dev->of_node;
 	dsi->bridge.type = DRM_MODE_CONNECTOR_DSI;
 
-	dsi->plat_data = samsung_dsim_plat_probe(dsi);
-	if (IS_ERR(dsi->plat_data)) {
-		ret = PTR_ERR(dsi->plat_data);
-		goto err_disable_runtime;
+	if (dsi->driver_data->platform_init) {
+		dsi->plat_data = samsung_dsim_plat_probe(dsi);
+		ret = IS_ERR(dsi->plat_data) ? PTR_ERR(dsi->plat_data) : 0;
+	} else {
+		ret = mipi_dsi_host_register(&dsi->dsi_host);
 	}
 
+	if (ret)
+		goto err_disable_runtime;
+
 	return 0;
 
 err_disable_runtime:
@@ -1630,7 +1639,10 @@ static int samsung_dsim_remove(struct platform_device *pdev)
 
 	pm_runtime_disable(&pdev->dev);
 
-	samsung_dsim_plat_remove(dsi);
+	if (dsi->driver_data->platform_init)
+		samsung_dsim_plat_remove(dsi);
+	else
+		mipi_dsi_host_unregister(&dsi->dsi_host);
 
 	return 0;
 }
diff --git a/include/drm/bridge/samsung-dsim.h b/include/drm/bridge/samsung-dsim.h
index 5cf8570ac978..70224d20414b 100644
--- a/include/drm/bridge/samsung-dsim.h
+++ b/include/drm/bridge/samsung-dsim.h
@@ -41,6 +41,7 @@ struct samsung_dsim_driver_data {
 	unsigned int wait_for_reset;
 	unsigned int num_bits_resol;
 	const unsigned int *reg_values;
+	bool platform_init;
 };
 
 struct samsung_dsim_host_ops {
-- 
2.25.1

