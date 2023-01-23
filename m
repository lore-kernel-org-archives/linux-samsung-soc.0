Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 829B0C05027
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 23 Jan 2023 12:24:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230354AbjAWMYf (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 23 Jan 2023 07:24:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230371AbjAWMYf (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 23 Jan 2023 07:24:35 -0500
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1249902A
        for <linux-samsung-soc@vger.kernel.org>; Mon, 23 Jan 2023 04:24:34 -0800 (PST)
Received: by mail-pl1-x632.google.com with SMTP id b17so11199494pld.7
        for <linux-samsung-soc@vger.kernel.org>; Mon, 23 Jan 2023 04:24:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ye7rK8XP7CKFg3FA4ZUZc/27br4/mG8uE4vofYp7eK4=;
        b=QQR+NJ/p2iqTOhHbBgSL9l1R8ueOE0sWFw+zKSAEo5udjwgKu4Im5MuV8Nsc/wpX/B
         Urgt1xdpDK9m+1ovlkpnESuuy8SuZ7cDbJWlDfEXqC1nUZ8pmujrI2sGk39KNCZsfzvQ
         cfrFnfrPDlhOBfV7qjyp1D6K6vZ/6KaJXWPwE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ye7rK8XP7CKFg3FA4ZUZc/27br4/mG8uE4vofYp7eK4=;
        b=YPhLPxZEuq1bzbQNERm+yNEkiGP6NieNIuD7X1zkiEQtqAYbIfiz86fz/2knTG4YHR
         vOevRkVmFjjISyHkiQ/BUMoClEFeOZp8BLae0iI9JUHDFYiIOv/lSfd8eqLVmnv4sxPP
         hwsd7IfL+l505WwFYJgcF1k3GT5+ZJhdLp6uBnwbLQpyvdUywuiZY5udXKwjs3MPsyeV
         TH9jryMCxKA+cI8o1p1CUe5cWmojVyn6Cp74ajJgQGpIqDNj2WRqkC0y2rsxh1Qyd2Vx
         5DBa3mWCmHwOJqERr0j4FsdTwObb6FZAySyp9omKziT3p2J+/nI3Z3bB1wat7F6am6ln
         +jMA==
X-Gm-Message-State: AFqh2kpgifej/PGTAnpRCBDj4i7ESCgWgdWUmQugaAHiKNm5PmR95YtL
        x+RrmmKDt18ikEch25dFHAKLdg==
X-Google-Smtp-Source: AMrXdXteRPMI5A5+YTI8BtZ/pMjITfrjJfrx0MkoIuk/zdTrx6W/u6wg3sVcgK01g53SUrtWwFPDsA==
X-Received: by 2002:a17:902:8602:b0:189:e55d:ec72 with SMTP id f2-20020a170902860200b00189e55dec72mr22405412plo.20.1674476674144;
        Mon, 23 Jan 2023 04:24:34 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a15f:2279:f361:f93b:7971])
        by smtp.gmail.com with ESMTPSA id w10-20020a170902e88a00b001960806728asm1291811plg.88.2023.01.23.04.24.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jan 2023 04:24:33 -0800 (PST)
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
Subject: [PATCH v11 08/18] drm: exynos: dsi: Handle proper host initialization
Date:   Mon, 23 Jan 2023 17:53:09 +0530
Message-Id: <20230123122319.261341-9-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230123122319.261341-1-jagan@amarulasolutions.com>
References: <20230123122319.261341-1-jagan@amarulasolutions.com>
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

Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
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

