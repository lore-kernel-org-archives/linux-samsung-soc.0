Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2357C54E94
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 23 Jan 2023 12:24:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230231AbjAWMYv (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 23 Jan 2023 07:24:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231486AbjAWMYu (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 23 Jan 2023 07:24:50 -0500
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 955AB902B
        for <linux-samsung-soc@vger.kernel.org>; Mon, 23 Jan 2023 04:24:49 -0800 (PST)
Received: by mail-pj1-x1033.google.com with SMTP id u1-20020a17090a450100b0022936a63a21so15102730pjg.4
        for <linux-samsung-soc@vger.kernel.org>; Mon, 23 Jan 2023 04:24:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cD1qAiqhfd1q1+yXxcnzmuelB54aAtoGJRwcpOhnRjA=;
        b=nLSc4UWw+qc1isoMm0ddsf/DocNuZCqOiwSZSeo7M6fe0Z2d0dEa9yd9SQd/XAXEB0
         64OifFsLSwXNN/ayv3jHG9LlNRtUIpSKUiHW5+YxKB/g3Hli7doXBgla0tYeZvpk023n
         p4xF3PaRlAhf+Fz1cQAjxwz4WJEHyHrlkHukg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cD1qAiqhfd1q1+yXxcnzmuelB54aAtoGJRwcpOhnRjA=;
        b=fz5LZ4vTxZ6BhJrtadiLNtdlvAWpN5XaGoKK3YpZ1OaggYdFo0uEU0svzvS/61XlTe
         7CBIMwUouzjArzFR6XFRwARnUFIeaslzHyGX+a97cVwonMUOt7Eb6W+6vAra1Q+1CQ/+
         UMqpFy38fH+ArUgQtkhyx6yyaogjNOYaIWMtSWWIsPfIe7A5nmEx/2wJKKHWNH071p6v
         7ZrXh0FFHblF8lziHUyc/XQ02FgkKI56IfR1SQsW3LscpZGjCGsUtOn/GLz+xvDqDGu5
         WP2elvNWvUbVMameHf7VKgb4Ly8kSmW8SB5FaHhD98iwLokH1HHJvCEKeSZtVY1rRsha
         27RA==
X-Gm-Message-State: AFqh2krx4uVCk2OVh0Tn1lIw9lDrAWnDz0exVM703+T/s67f8tLe352r
        PoQcXcPPnWGZ5ioJ+R4ubny4dA==
X-Google-Smtp-Source: AMrXdXtNlBtGm2HMa4XqvSMnPI0UH7tFFtjGyzBge5hxMTcIHFDptTvIQNW0A4bsqByn90MzxpLTWw==
X-Received: by 2002:a17:902:e5d2:b0:191:3808:14b0 with SMTP id u18-20020a170902e5d200b00191380814b0mr33659343plf.4.1674476689065;
        Mon, 23 Jan 2023 04:24:49 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a15f:2279:f361:f93b:7971])
        by smtp.gmail.com with ESMTPSA id w10-20020a170902e88a00b001960806728asm1291811plg.88.2023.01.23.04.24.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jan 2023 04:24:48 -0800 (PST)
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
Subject: [PATCH v11 10/18] drm: exynos: dsi: Add input_bus_flags
Date:   Mon, 23 Jan 2023 17:53:11 +0530
Message-Id: <20230123122319.261341-11-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230123122319.261341-1-jagan@amarulasolutions.com>
References: <20230123122319.261341-1-jagan@amarulasolutions.com>
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

Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>
Suggested-by: Marek Vasut <marex@denx.de>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
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
index d8958838ab7b..5518d92c8455 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -1691,6 +1691,10 @@ static const struct component_ops exynos_dsi_component_ops = {
 	.unbind	= exynos_dsi_unbind,
 };
 
+static const struct drm_bridge_timings dsim_bridge_timings_de_low = {
+	.input_bus_flags = DRM_BUS_FLAG_DE_LOW,
+};
+
 static int exynos_dsi_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -1777,6 +1781,10 @@ static int exynos_dsi_probe(struct platform_device *pdev)
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

