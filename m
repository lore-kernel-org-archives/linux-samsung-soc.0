Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC2D8C7EE2F
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  3 Mar 2023 14:53:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229997AbjCCOxH (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 3 Mar 2023 09:53:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230481AbjCCOws (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 3 Mar 2023 09:52:48 -0500
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 291901ADF8
        for <linux-samsung-soc@vger.kernel.org>; Fri,  3 Mar 2023 06:52:47 -0800 (PST)
Received: by mail-pj1-x1035.google.com with SMTP id bo22so2745099pjb.4
        for <linux-samsung-soc@vger.kernel.org>; Fri, 03 Mar 2023 06:52:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6M6pIqw7k0M+vm8dE+QD7gZWyxxkXhmbFOQyY/9HzRQ=;
        b=rUZCHWJHVAq4bZdXTcldYI3XaL7mX+SDgOjpyMi3hK7kMdS9Ordp7lsiXluqt4x8pc
         Q9GHOlYAXFR8c666xQk/5AEfquuGW5FIbEPXFw0Pn/6HZFD+q89wJ9mHwwcKEQYzh02T
         5slrk6ezAAACzR2NSqKqMbUjKb020NMNRm468=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6M6pIqw7k0M+vm8dE+QD7gZWyxxkXhmbFOQyY/9HzRQ=;
        b=JsYQpEcPLJqlD690t26iWsxnOYVbP3LSW6gO4NS84hXxSrmRKslDZDxwwFjpcE66kT
         BE8BuPRZhGBrDmCMJiGJv4aIJDb4aPBewam9ZIKQO0MctA9zc25g684zTxAukA/5BqxG
         k2XRHcBDm3JKvCmlohtvI8sJ+lgM9+Iyhl3g8uwQRrIVTEkkWgj4/8wvPvtqS22y3UZF
         tYkqbTMm65L5IZjS2OJWOcwB22P872sWI9tuGhOX+3ucWYde+UvyziieNCG+jA1/O95u
         mSRgV5GoUOBgFasiwCI7A77BoZV9wjXqt9/CISS2vUZfJhEiR6YdUODuvKHH9XvAHHKx
         xkJg==
X-Gm-Message-State: AO0yUKWqFmtSSYJB4UmQoXDbLB2YwXXq8fuV6vR3KzgGylzOmzyNlPlH
        UjusWNAGmrtPg9rjfCsx8zKsqw==
X-Google-Smtp-Source: AK7set9Buy8enrCiWNIXyZ4+jZBsjVPvX6xNrMLJwhHZPfoHziMJ1/osPZHJyHbDOXcoPYSilkrsMA==
X-Received: by 2002:a05:6a20:12cd:b0:cd:40b4:bc75 with SMTP id v13-20020a056a2012cd00b000cd40b4bc75mr2845320pzg.48.1677855166602;
        Fri, 03 Mar 2023 06:52:46 -0800 (PST)
Received: from localhost.localdomain ([183.83.137.89])
        by smtp.gmail.com with ESMTPSA id z4-20020a63e544000000b00502fd70b0bdsm1660856pgj.52.2023.03.03.06.52.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Mar 2023 06:52:45 -0800 (PST)
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
Subject: [PATCH v15 06/16] drm: exynos: dsi: Handle proper host initialization
Date:   Fri,  3 Mar 2023 20:21:28 +0530
Message-Id: <20230303145138.29233-7-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230303145138.29233-1-jagan@amarulasolutions.com>
References: <20230303145138.29233-1-jagan@amarulasolutions.com>
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
Changes for v15, v13:
- none 
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
index 64cf69995750..fe195d76ce76 100644
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
@@ -1601,12 +1619,9 @@ static ssize_t exynos_dsi_host_transfer(struct mipi_dsi_host *host,
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

