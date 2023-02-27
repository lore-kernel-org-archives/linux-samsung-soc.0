Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9128C64ED6
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 27 Feb 2023 11:40:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229608AbjB0Lkt (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 27 Feb 2023 06:40:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229590AbjB0Lkr (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 27 Feb 2023 06:40:47 -0500
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF73214237
        for <linux-samsung-soc@vger.kernel.org>; Mon, 27 Feb 2023 03:40:46 -0800 (PST)
Received: by mail-pj1-x102c.google.com with SMTP id m3-20020a17090ade0300b00229eec90a7fso11558763pjv.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 27 Feb 2023 03:40:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yZkoAXyn2QKQ3FviAmwtWqDuAvR1Fa+T3DM+tfAbFeA=;
        b=NHF1TraYyBxy/alpnxjtXS+vZVInV9SHVNsxwnn7ozrZEprXn9vwvJbOiVCcvea2UH
         XslLzJmCpFNlkbjtv0eVoBwchGMbYRqJwEQO9N5mKBon9xGKaoJVNWY53AwzdumGsGNP
         UBjxsHoktp5I8QBDjnUNBlZEhPz/64A4NNHro=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yZkoAXyn2QKQ3FviAmwtWqDuAvR1Fa+T3DM+tfAbFeA=;
        b=FgNhIDF5M4OZ+ET07hLCOhGp/+zym/yAWg9NN6iXPOu74WDiu5tM5Sn6nO7TlKRVVr
         zCi5k1LzgZYiMddr0J1MLV5iklxzLUmc7Ndqrnzt7D2S4DLfKJkXF9pW9qhQUMKK6rX3
         GpVIXsgmMRvtHwzyiK9vE+Sdo5944pOgqfOMvfF0o6YfOkUyoeRbTJc9NX8IU3em/Z5m
         loM2tqtE/zOXVTWSYAmcmnrE1O8Qel7irQFaUEPdpgYYapIVVc8Ux4DBQwgInQvqebfx
         2muWCq3oAbEfjq3iWY5rCpXNDFNElYZAlsJ5doMfi7HGW1S0aZjlR83cDZyalrV+xq2l
         4ibw==
X-Gm-Message-State: AO0yUKXrLFufRa/KQKsEqMKeW9C5c9F5gcX9ZbgVdTUaa7JuqSPPWKKy
        0LOEb1TJ9xnse6lT0c0FNrWafg==
X-Google-Smtp-Source: AK7set/eID5bK2eeVoNu7SAH1ye8PA3BcusLi0OrbpN3PaTNtrrbdFQQOvGhXVwYMNRl9c2ymBglUQ==
X-Received: by 2002:a17:902:ec92:b0:19a:9864:2887 with SMTP id x18-20020a170902ec9200b0019a98642887mr8853408plg.7.1677498046366;
        Mon, 27 Feb 2023 03:40:46 -0800 (PST)
Received: from localhost.localdomain ([94.140.8.120])
        by smtp.gmail.com with ESMTPSA id k10-20020a170902ba8a00b0019c919bccf8sm4395277pls.86.2023.02.27.03.40.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Feb 2023 03:40:45 -0800 (PST)
From:   Jagan Teki <jagan@amarulasolutions.com>
To:     Andrzej Hajda <andrzej.hajda@intel.com>,
        Inki Dae <inki.dae@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Frieder Schrempf <frieder.schrempf@kontron.de>,
        Tim Harvey <tharvey@gateworks.com>,
        Adam Ford <aford173@gmail.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Marek Vasut <marex@denx.de>
Cc:     Matteo Lisi <matteo.lisi@engicam.com>,
        dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-amarula <linux-amarula@amarulasolutions.com>,
        Jagan Teki <jagan@amarulasolutions.com>
Subject: [PATCH v13 10/18] drm: exynos: dsi: Add input_bus_flags
Date:   Mon, 27 Feb 2023 17:09:17 +0530
Message-Id: <20230227113925.875425-11-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230227113925.875425-1-jagan@amarulasolutions.com>
References: <20230227113925.875425-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

LCDIF-DSIM glue logic inverts the HS/VS/DE signals and expecting
the i.MX8M Mini/Nano DSI host to add additional Data Enable signal
active low (DE_LOW). This makes the valid data transfer on each
horizontal line.

So, add additional bus flags DE_LOW setting via input_bus_flags
for i.MX8M Mini/Nano platforms.

Reviewed-by: Marek Vasut <marex@denx.de>
Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>
Suggested-by: Marek Vasut <marex@denx.de>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v13:
- none
Changes for v12:
- collect RB from Marek
Changes for v11:
- collect RB from Frieder
Changes for v10, v9:
- none
Changes for v8:
- add DE_LOW for i.MX8M Mini/Nano platforms.
Changes for v7, v6:
- none
Changes for v5:
- rebased based on updated bridge changes
Changes for v4 - v1:
- none

 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index 22e3bdcf5494..7f0703582506 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -1703,6 +1703,10 @@ static const struct component_ops exynos_dsi_component_ops = {
 	.unbind	= exynos_dsi_unbind,
 };
 
+static const struct drm_bridge_timings dsim_bridge_timings_de_low = {
+	.input_bus_flags = DRM_BUS_FLAG_DE_LOW,
+};
+
 static int exynos_dsi_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -1789,6 +1793,10 @@ static int exynos_dsi_probe(struct platform_device *pdev)
 	dsi->bridge.type = DRM_MODE_CONNECTOR_DSI;
 	dsi->bridge.pre_enable_prev_first = true;
 
+	/* DE_LOW: i.MX8M Mini/Nano LCDIF-DSIM glue logic inverts HS/VS/DE */
+	if (dsi->plat_data->hw_type == DSIM_TYPE_IMX8MM)
+		dsi->bridge.timings = &dsim_bridge_timings_de_low;
+
 	ret = component_add(dev, &exynos_dsi_component_ops);
 	if (ret)
 		goto err_disable_runtime;
-- 
2.25.1

