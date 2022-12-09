Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1F0FC4167B
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  9 Dec 2022 15:29:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229759AbiLIP3D (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 9 Dec 2022 10:29:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229710AbiLIP2m (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 9 Dec 2022 10:28:42 -0500
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78FAD2935E
        for <linux-samsung-soc@vger.kernel.org>; Fri,  9 Dec 2022 07:28:29 -0800 (PST)
Received: by mail-pl1-x634.google.com with SMTP id m4so5229741pls.4
        for <linux-samsung-soc@vger.kernel.org>; Fri, 09 Dec 2022 07:28:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m44vPnqg/tFp5+4q15ZzrAAsZWANQlxSVTxmtXu3/9A=;
        b=EUVyUp9GaIYxpqTpKsJZA/dslfBr1LQitUAbqIQCAmaGpjJ+uCb3d+CQOig4xPRcPc
         aFC+TX0zNZGmuptvTlgK64AboxxKY5AGoJiETrXiBwSjqibNuz4epAy6S9ePy8OL6lS8
         Ojj5+y2GeN5ihsePK5GcNwaRNUE+BrBo9UPmA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m44vPnqg/tFp5+4q15ZzrAAsZWANQlxSVTxmtXu3/9A=;
        b=F6A3Qk3RnD3Oxohf/bPiD6ty4fMGeOfzYZJXWrQHyFBL6c6rFqk9S3jN7676255ile
         sbvP1dikTGUBtvVs71xK3NxMMX5ZbePvLQNobv1162y2H9+riXaDZ+qiMg0nD0B52yAO
         PSWDkpSyCntbiccEuJbCyBuc0W8svVE8OZpXrlysbQmA2K3mbujdpq0h1X8lofblTIWD
         BLk5mrvZIGFrZIcdKnLP/7yl87TqbssOU+Et04SwIb1UJXP7JH2YWMoKzDe4BU2BzCsx
         syvhTamAM2JHntw8pqGvAZNSsmMUWewea8fqscJ/RKVKIAF33ewL2tsNPMK5O+39ZR93
         omlg==
X-Gm-Message-State: ANoB5pmFPfrRhvLUor9RGI99pp5MVsuGvXiZ0vl6fRtHtBoKDYImyCor
        dL6888e6nClFtYnln/PHYYxtaw==
X-Google-Smtp-Source: AA0mqf6dQt+VkYj1h/ciPSlfHKO+5DZj9mgOoawK+JvVkI95FUXfGcdlpDfODYugKo8sr8nE2IExCw==
X-Received: by 2002:a17:902:e892:b0:188:f0da:c25c with SMTP id w18-20020a170902e89200b00188f0dac25cmr9238571plg.14.1670599708957;
        Fri, 09 Dec 2022 07:28:28 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a809:6ba1:bbda:c542:ba0b])
        by smtp.gmail.com with ESMTPSA id x14-20020a170902ec8e00b00188c5f0f9e9sm1477587plg.199.2022.12.09.07.28.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Dec 2022 07:28:28 -0800 (PST)
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
Subject: [PATCH v9 14/18] drm: bridge: samsung-dsim: Add input_bus_flags
Date:   Fri,  9 Dec 2022 20:53:39 +0530
Message-Id: <20221209152343.180139-15-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221209152343.180139-1-jagan@amarulasolutions.com>
References: <20221209152343.180139-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

LCDIF-DSIM glue logic inverts the HS/VS/DE signals and expecting
the i.MX8M Mini/Nano DSI host to add additional Data Enable signal
active low (DE_LOW). This makes the valid data transfer on each
horizontal line.

So, add additional bus flags DE_LOW setting via input_bus_flags for
i.MX8M Mini/Nano platforms.

v9:
* none

v8:
* add DE_LOW for i.MX8M Mini/Nano platforms.

v7, v6:
* none

v5:
* rebased based on updated bridge changes

v4, v3, v2, v1:
* none

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index ef0d802d25bf..4de1294f29b3 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -1654,6 +1654,10 @@ static const struct samsung_dsim_host_ops samsung_dsim_generic_host_ops = {
 	.unregister_host = samsung_dsim_unregister_host,
 };
 
+static const struct drm_bridge_timings samsung_dsim_bridge_timings_de_low = {
+	.input_bus_flags = DRM_BUS_FLAG_DE_LOW,
+};
+
 int samsung_dsim_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -1736,6 +1740,10 @@ int samsung_dsim_probe(struct platform_device *pdev)
 	dsi->bridge.of_node = dev->of_node;
 	dsi->bridge.type = DRM_MODE_CONNECTOR_DSI;
 
+	/* DE_LOW: i.MX8M Mini/Nano LCDIF-DSIM glue logic inverts HS/VS/DE */
+	if (dsi->plat_data->hw_type == SAMSUNG_DSIM_TYPE_IMX8MM)
+		dsi->bridge.timings = &samsung_dsim_bridge_timings_de_low;
+
 	if (dsi->plat_data->host_ops && dsi->plat_data->host_ops->register_host)
 		ret = dsi->plat_data->host_ops->register_host(dsi);
 
-- 
2.25.1

