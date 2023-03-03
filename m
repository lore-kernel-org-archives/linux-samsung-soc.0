Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D994AC678D4
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  3 Mar 2023 14:53:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230057AbjCCOxI (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 3 Mar 2023 09:53:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231140AbjCCOw7 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 3 Mar 2023 09:52:59 -0500
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDCE6D31B
        for <linux-samsung-soc@vger.kernel.org>; Fri,  3 Mar 2023 06:52:57 -0800 (PST)
Received: by mail-pj1-x1033.google.com with SMTP id p3-20020a17090ad30300b0023a1cd5065fso2528742pju.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 03 Mar 2023 06:52:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GpBHKg2Gosb5BLI0oOYz0OdhN4+kHsJSwAsQE5BDZyI=;
        b=cbJxdKLy2Asvp1ZHaU9YEae0ccePauhomRdvxY4Mt/Oevewsx7H/50anMfu5AqmV9t
         id6B/gv+xxOW7RIIbTs/QTYwf55IB+kQssLmJUKV4F3C4XF2zCM6ONIb602ileIwnRZe
         gHF7f7SIgg1oxoyv4rP6ok/gHnKQDV+u6H1fY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GpBHKg2Gosb5BLI0oOYz0OdhN4+kHsJSwAsQE5BDZyI=;
        b=33wTtLaQ1cozq56tc+Zu8q4BilVXVInaW7SJvO0rup/TlTQC4NwbIW2WSYm66sLC2A
         UMANWNQI/hSOtavgfRVCx/MesnS+53USTCYjAzgX6RaTqudjcUK6joxdI533bUP1SSeY
         IR7T0AGBEcCB8zQ8beVRt7VxDzc8LDxMK07i3kBcmZqChJINCiSuX/wRCRTGqz7sXNJO
         L8KK3pPgX13p3idA9pqMnz6sfptPwMwJ+vUw5BdcAkXZUBWT22P6gprjkip5S12C2eHQ
         Ll4V0Iua+V6SU7D7k53eSCZHbzV621Z71OehyL5ihAFnFrEeibFPAf5oF+DE4S/G5ICI
         kigg==
X-Gm-Message-State: AO0yUKXS/h0lHdk1XotM+68lxlyV13LVJJDaFU+0d7ilzb5XHUql8rdr
        8QFVs0USWWyqvPUIx8+xryb+VQ==
X-Google-Smtp-Source: AK7set8qLWqOAh0d59+jT9qkG2ZL6glMQgv/dAlbg7elmYnxYo15vbILe2zpJkOhVAlnxhOSUqH0Kg==
X-Received: by 2002:a05:6a20:c510:b0:cc:5917:c4ec with SMTP id gm16-20020a056a20c51000b000cc5917c4ecmr1900370pzb.23.1677855177350;
        Fri, 03 Mar 2023 06:52:57 -0800 (PST)
Received: from localhost.localdomain ([183.83.137.89])
        by smtp.gmail.com with ESMTPSA id z4-20020a63e544000000b00502fd70b0bdsm1660856pgj.52.2023.03.03.06.52.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Mar 2023 06:52:56 -0800 (PST)
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
Subject: [PATCH v15 08/16] drm: exynos: dsi: Add input_bus_flags
Date:   Fri,  3 Mar 2023 20:21:30 +0530
Message-Id: <20230303145138.29233-9-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230303145138.29233-1-jagan@amarulasolutions.com>
References: <20230303145138.29233-1-jagan@amarulasolutions.com>
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
Changes for v15, v13:
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
index 796480e4a18b..5d971b607e1a 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -1736,6 +1736,10 @@ static const struct component_ops exynos_dsi_component_ops = {
 	.unbind	= exynos_dsi_unbind,
 };
 
+static const struct drm_bridge_timings dsim_bridge_timings_de_low = {
+	.input_bus_flags = DRM_BUS_FLAG_DE_LOW,
+};
+
 static int exynos_dsi_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -1822,6 +1826,10 @@ static int exynos_dsi_probe(struct platform_device *pdev)
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

