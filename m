Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91C00C05027
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 26 Jan 2023 14:46:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230040AbjAZOqT (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 26 Jan 2023 09:46:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229468AbjAZOqS (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 26 Jan 2023 09:46:18 -0500
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 134723AB6
        for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Jan 2023 06:46:17 -0800 (PST)
Received: by mail-pj1-x102b.google.com with SMTP id nn18-20020a17090b38d200b0022bfb584987so1915278pjb.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Jan 2023 06:46:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aUy6DNNvAiPX9eeWAOGTVXrnTQlr6Vuyr0HCYZSKb9Q=;
        b=dh6luB/qRaLS7gvu5TpqMAIr02u7Fjrfvnmrw61ngdnlECseug3s5QUtEDdLjizuC0
         FR+VfCiuQG+SHFWpLtMBwHLvHmZLywc/Zc8GS0L6eCzYSU++s9wUmAGReJ1aKkq0YfoP
         CDKO3pyqimC1wU/0d/D2WFtaPGq2g9h8Atm/Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aUy6DNNvAiPX9eeWAOGTVXrnTQlr6Vuyr0HCYZSKb9Q=;
        b=URkcN1uBP4VzKzKtlIZelxVrVGdFk3ZJ1TFGvSDukikrkvqTShD9oaf9J9LglMwcrp
         fWuvkjksq3LWKFNFFtxJwPhwuv93mU2bgWzLBhqlUEddvx0zPwip4fHQ+nP9cEawfAZf
         nlFemSexUdCCchaQQXaqwIya9RIiwHkAnAMuEQLl4xIw9yGnF37XWAKlxrrRxo2K95v2
         kI47Vk/2yLhRRi7Gv9HEiunbmPdn3KuWr9vulzo4gf2Sv2lBPBe5DUhRVkjA18WWhHLM
         KrOm7Xslbe+higeT8uWZ1cv39jw1q3+dv1vvqDhqgZHG+iY37j+SclJG6Rrocroz67jI
         DzHg==
X-Gm-Message-State: AO0yUKV3aMgIWHDa+FpSRWYWXo5Y2DlYd4ynXZ1qCvPo2hPG2jb9rpob
        fjgaCegNQRk9GfUTE6RQR8M0Rw==
X-Google-Smtp-Source: AK7set/oBf1SiZHL0FSQHPOMS+OpOG2xNWQFQDQZQLMBlGqjs1UhUpN0TR0TN+Cn8irMMp6MRI/yGA==
X-Received: by 2002:a05:6a20:a89c:b0:bb:b945:4865 with SMTP id ca28-20020a056a20a89c00b000bbb9454865mr6751320pzb.8.1674744376555;
        Thu, 26 Jan 2023 06:46:16 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a238:3cb1:2156:ef87:8af5])
        by smtp.gmail.com with ESMTPSA id d197-20020a6336ce000000b0042988a04bfdsm823660pga.9.2023.01.26.06.46.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jan 2023 06:46:15 -0800 (PST)
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
Subject: [PATCH v12 08/18] drm: exynos: dsi: Handle proper host initialization
Date:   Thu, 26 Jan 2023 20:14:17 +0530
Message-Id: <20230126144427.607098-9-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230126144427.607098-1-jagan@amarulasolutions.com>
References: <20230126144427.607098-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

From: Marek Szyprowski <m.szyprowski@samsung.com>

Host transfer() in the DSI master will invoke only when the DSI commands
are sent from DSI devices like DSI Panel or DSI bridges and this host
the transfer wouldn't invoke for I2C-based-DSI bridge drivers.

Handling DSI host initialization in transfer calls misses the controller
setup for I2C configured DSI bridges.

This patch updates the DSI host initialization by calling host to init
from bridge pre_enable as the bridge pre_enable API is invoked by core
as it is common across all classes of DSI device drivers.

The host init during pre_enable is conditional and not invoked for Exynos
as existing downstream drm panels and bridges in Exynos are expecting
the host initialization during DSI transfer.

Reviewed-by: Marek Vasut <marex@denx.de>
Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v12:
- collect RB from Marek
Changes for v11:
- collect RB from Frieder
Changes for v10:
- update the to simple logic to handle all platforms
Changs for v9 - v8:
- none
Changes for v2:
- check initialized state in samsung_dsim_init
Changes for v1:
- keep DSI init in host transfer

 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 27 +++++++++++++++++++------
 1 file changed, 21 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index 902bd46964cb..d4a976d86f08 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -254,6 +254,9 @@ struct exynos_dsi_transfer {
 #define DSIM_STATE_CMD_LPM		BIT(2)
 #define DSIM_STATE_VIDOUT_AVAILABLE	BIT(3)
 
+#define exynos_dsi_hw_is_exynos(hw) \
+	((hw) >= DSIM_TYPE_EXYNOS3250 && (hw) <= DSIM_TYPE_EXYNOS5433)
+
 enum exynos_dsi_type {
 	DSIM_TYPE_EXYNOS3250,
 	DSIM_TYPE_EXYNOS4210,
@@ -1343,6 +1346,9 @@ static int exynos_dsi_init(struct exynos_dsi *dsi)
 {
 	const struct exynos_dsi_driver_data *driver_data = dsi->driver_data;
 
+	if (dsi->state & DSIM_STATE_INITIALIZED)
+		return 0;
+
 	exynos_dsi_reset(dsi);
 	exynos_dsi_enable_irq(dsi);
 
@@ -1355,6 +1361,8 @@ static int exynos_dsi_init(struct exynos_dsi *dsi)
 	exynos_dsi_set_phy_ctrl(dsi);
 	exynos_dsi_init_link(dsi);
 
+	dsi->state |= DSIM_STATE_INITIALIZED;
+
 	return 0;
 }
 
@@ -1410,6 +1418,16 @@ static void exynos_dsi_atomic_pre_enable(struct drm_bridge *bridge,
 	}
 
 	dsi->state |= DSIM_STATE_ENABLED;
+
+	/*
+	 * For Exynos-DSIM the downstream bridge, or panel are expecting
+	 * the host initialization during DSI transfer.
+	 */
+	if (!exynos_dsi_hw_is_exynos(dsi->plat_data->hw_type)) {
+		ret = exynos_dsi_init(dsi);
+		if (ret)
+			return;
+	}
 }
 
 static void exynos_dsi_atomic_enable(struct drm_bridge *bridge,
@@ -1556,12 +1574,9 @@ static ssize_t exynos_dsi_host_transfer(struct mipi_dsi_host *host,
 	if (!(dsi->state & DSIM_STATE_ENABLED))
 		return -EINVAL;
 
-	if (!(dsi->state & DSIM_STATE_INITIALIZED)) {
-		ret = exynos_dsi_init(dsi);
-		if (ret)
-			return ret;
-		dsi->state |= DSIM_STATE_INITIALIZED;
-	}
+	ret = exynos_dsi_init(dsi);
+	if (ret)
+		return ret;
 
 	ret = mipi_dsi_create_packet(&xfer.packet, msg);
 	if (ret < 0)
-- 
2.25.1

