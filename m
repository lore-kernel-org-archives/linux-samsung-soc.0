Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45F60C43334
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 20 Jul 2022 15:53:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231622AbiGTPxB (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 20 Jul 2022 11:53:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229456AbiGTPxA (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 20 Jul 2022 11:53:00 -0400
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A049C4BD19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 20 Jul 2022 08:52:59 -0700 (PDT)
Received: by mail-pg1-x534.google.com with SMTP id 72so16782894pge.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 20 Jul 2022 08:52:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SvFqcqX31Dpa8PvnhTvPWiOoGd8kdnJv5vFHkC7+/vs=;
        b=QE+SPnmp4wbiuLSFkmZsG5U+MAI3e/QdhycDXv08PMkqVNGs8Fr+e+Q2V5P0lrrqLI
         pBVw/V7B3qPgLboGzoKxKKFUp4MW+SkFY/XW6aHb5qIpbwu5DUmuDTxP9FWZr1MZt9+d
         BqQTZTZn7wikI19yqYTZEyQFe9cU5kS/IpCxE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SvFqcqX31Dpa8PvnhTvPWiOoGd8kdnJv5vFHkC7+/vs=;
        b=oNNgfnOkwTk0kO09AGLMbGebkC9fSABA1O6WOeOSE6wsFOsbUzqSnMhZy8LcoojqzT
         hrAWo9pXqwuPtgRKjVuDDK3hoU0rb3D1nArJSICKx22RqC33fiWW4VM7CM3cd+suR2oZ
         vICJNXqZGyzVFvGp0nE8E0brXyl2wRU0+HJ8DfKuN5zwk3202hFVC2ZcpeOue7zBwoJD
         tzUfkxIrvvkdu/icbhGUCqWv00cFNR5RSAy1qpoyrPjz2UTAb/0ih2MK1CXQC4yPLRPf
         36mV6QHIPQkHYwtShBvF4n/xlD40x6Xm00rG6QDsf7fnBsxvPesTr+TLMpAGSh76VMf7
         mpRA==
X-Gm-Message-State: AJIora9ZTzDKsHl1l3qWoVSQoxDRB0zaHUITrIb2q0HgCJze1mhtoybQ
        9fMdhagUyzwZ+Fxp9aeVQ9Pf4g==
X-Google-Smtp-Source: AGRyM1vicfWCxIXbcN0f/ncIRNCwbSCZvrYENdtXR/lRQ+tls5Pg6hbXs6p36dHMLcFDobbVVNNzVA==
X-Received: by 2002:a63:5cc:0:b0:412:b2ea:c6fe with SMTP id 195-20020a6305cc000000b00412b2eac6femr34992899pgf.596.1658332379069;
        Wed, 20 Jul 2022 08:52:59 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c00a:a073:d177:d5:aee:4f03])
        by smtp.gmail.com with ESMTPSA id a8-20020a170902710800b0015e8d4eb1d7sm13919198pll.33.2022.07.20.08.52.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jul 2022 08:52:58 -0700 (PDT)
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
Subject: [PATCH v3 04/13] drm: bridge: samsung-dsim: Handle platform init via driver_data
Date:   Wed, 20 Jul 2022 21:22:01 +0530
Message-Id: <20220720155210.365977-5-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220720155210.365977-1-jagan@amarulasolutions.com>
References: <20220720155210.365977-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

In order to make a common Samsung DSIM bridge driver some platform
specific glue code needs to maintain separately as it is hard to
maintain platform specific glue and conventional component_ops on
the drm bridge drivers side.

This patch is trying to support that glue code initialization based
on the DSIM_QUIRK_PLAT_DATA set from respective driver_data.

So, the platforms which enable DSIM_QUIRK_PLAT_DATA flags will handle
all platform specific initialization via samsung_dsim_plat_probe.

The platform probe is responsible to
- initialize samsung_dsim_plat_data and install hooks
- initialize component_ops
- preserve samsung_dsim structure pointer

v3:
* update samsung_dsim_plat_probe return value
* add plat_data quirk to handle platform init

v2:
* fix samsung_dsim_plat_probe return pointer

v1:
* use platform_init instead of exynos_specific
* handle component_ops in glue code

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 16 ++++++++++++++--
 include/drm/bridge/samsung-dsim.h     |  5 +++++
 2 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index 20db345abf8b..4d5f72de2240 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -369,6 +369,7 @@ static const struct samsung_dsim_driver_data exynos3_dsi_driver_data = {
 	.wait_for_reset = 1,
 	.num_bits_resol = 11,
 	.reg_values = reg_values,
+	.quirks = DSIM_QUIRK_PLAT_DATA,
 };
 
 static const struct samsung_dsim_driver_data exynos4_dsi_driver_data = {
@@ -381,6 +382,7 @@ static const struct samsung_dsim_driver_data exynos4_dsi_driver_data = {
 	.wait_for_reset = 1,
 	.num_bits_resol = 11,
 	.reg_values = reg_values,
+	.quirks = DSIM_QUIRK_PLAT_DATA,
 };
 
 static const struct samsung_dsim_driver_data exynos5_dsi_driver_data = {
@@ -391,6 +393,7 @@ static const struct samsung_dsim_driver_data exynos5_dsi_driver_data = {
 	.wait_for_reset = 1,
 	.num_bits_resol = 11,
 	.reg_values = reg_values,
+	.quirks = DSIM_QUIRK_PLAT_DATA,
 };
 
 static const struct samsung_dsim_driver_data exynos5433_dsi_driver_data = {
@@ -402,6 +405,7 @@ static const struct samsung_dsim_driver_data exynos5433_dsi_driver_data = {
 	.wait_for_reset = 0,
 	.num_bits_resol = 12,
 	.reg_values = exynos5433_reg_values,
+	.quirks = DSIM_QUIRK_PLAT_DATA,
 };
 
 static const struct samsung_dsim_driver_data exynos5422_dsi_driver_data = {
@@ -413,6 +417,7 @@ static const struct samsung_dsim_driver_data exynos5422_dsi_driver_data = {
 	.wait_for_reset = 1,
 	.num_bits_resol = 12,
 	.reg_values = exynos5422_reg_values,
+	.quirks = DSIM_QUIRK_PLAT_DATA,
 };
 
 static const struct of_device_id samsung_dsim_of_match[] = {
@@ -1609,7 +1614,11 @@ static int samsung_dsim_probe(struct platform_device *pdev)
 	dsi->bridge.of_node = dev->of_node;
 	dsi->bridge.type = DRM_MODE_CONNECTOR_DSI;
 
-	ret = samsung_dsim_plat_probe(dsi);
+	if (dsi->driver_data->quirks & DSIM_QUIRK_PLAT_DATA)
+		ret = samsung_dsim_plat_probe(dsi);
+	else
+		ret = mipi_dsi_host_register(&dsi->dsi_host);
+
 	if (ret)
 		goto err_disable_runtime;
 
@@ -1627,7 +1636,10 @@ static int samsung_dsim_remove(struct platform_device *pdev)
 
 	pm_runtime_disable(&pdev->dev);
 
-	samsung_dsim_plat_remove(dsi);
+	if (dsi->driver_data->quirks & DSIM_QUIRK_PLAT_DATA)
+		samsung_dsim_plat_remove(dsi);
+	else
+		mipi_dsi_host_unregister(&dsi->dsi_host);
 
 	return 0;
 }
diff --git a/include/drm/bridge/samsung-dsim.h b/include/drm/bridge/samsung-dsim.h
index 2e245bffd1b6..97fdee5ef5df 100644
--- a/include/drm/bridge/samsung-dsim.h
+++ b/include/drm/bridge/samsung-dsim.h
@@ -33,6 +33,10 @@ struct samsung_dsim_transfer {
 	u16 rx_done;
 };
 
+enum samsung_dsim_quirks {
+	DSIM_QUIRK_PLAT_DATA		= BIT(0),
+};
+
 struct samsung_dsim_driver_data {
 	const unsigned int *reg_ofs;
 	unsigned int plltmr_reg;
@@ -43,6 +47,7 @@ struct samsung_dsim_driver_data {
 	unsigned int wait_for_reset;
 	unsigned int num_bits_resol;
 	const unsigned int *reg_values;
+	enum samsung_dsim_quirks quirks;
 };
 
 struct samsung_dsim_host_ops {
-- 
2.25.1

