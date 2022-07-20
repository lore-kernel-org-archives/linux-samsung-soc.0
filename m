Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1BB6C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 20 Jul 2022 15:53:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232073AbiGTPxv (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 20 Jul 2022 11:53:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229456AbiGTPxu (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 20 Jul 2022 11:53:50 -0400
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2943C4BD18
        for <linux-samsung-soc@vger.kernel.org>; Wed, 20 Jul 2022 08:53:49 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id q5so15336473plr.11
        for <linux-samsung-soc@vger.kernel.org>; Wed, 20 Jul 2022 08:53:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iKqKSpIoemqVJvmONKd6Y8SQyJA7cnV4uKHmCv+ADCk=;
        b=GNSCNaKrUm3d1bXMtufqIxjwG9UhsmbJebE7kan/OLYK+D+KUuhqNVXOPPWdVpeBvm
         u5nzalIBEHN3pVVamLt9am2vDsJYqjAY1COv7McbFc0cO+wVmwG1r8UVXhCrxcEaaLKk
         Dt9uzTm08dHiXIJdY021DoMsL0F+WBbqNMnPc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iKqKSpIoemqVJvmONKd6Y8SQyJA7cnV4uKHmCv+ADCk=;
        b=HnRsDgUkPkA33VoVfBLlnsDe1CIGyTETNw9dgSxot/QNLtJXJFI0zrS/FN+PaHpUvT
         +UdpMjMo75L32yrSWROJbPRR6zEmNA5ukAHQM8NV6CWmK676vsGf7URWwUypGaTjIqM0
         96ZPdojVmeJtIly3pf4lSG24dbS8DewCdBsGfcLnRy71T9DPRfZmvBghl3bFmX3Tq6lW
         f2Q91vK/unqTf0fka2cnuNjYqNPhQWWOIZko2+BYRuZFdenZt+gKsnIqniPUuk77eFxV
         vN1X8kMbFBPeL21zh5/wT/i0bnHn3oTN/oCsb5W2ByAX6vt6al30z1PHqwRHyIY6NnxE
         NCWQ==
X-Gm-Message-State: AJIora8gmFdngpP5Ne2I2B5wKTl7wLw5oxBwvDbEL7mZy0/ma6L5Q4B5
        V8ViyUSlKqx5OKiyOX1GbfKLRsii2kY35zwf
X-Google-Smtp-Source: AGRyM1vY/tznd8lVbexlB1d1i7cBqZktheP7oQh5b3RuBKJuBql8fuwFbjXLEnhH4o+uHauW25wcnA==
X-Received: by 2002:a17:90b:3890:b0:1f0:2abb:e7d1 with SMTP id mu16-20020a17090b389000b001f02abbe7d1mr6276345pjb.158.1658332428629;
        Wed, 20 Jul 2022 08:53:48 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c00a:a073:d177:d5:aee:4f03])
        by smtp.gmail.com with ESMTPSA id a8-20020a170902710800b0015e8d4eb1d7sm13919198pll.33.2022.07.20.08.53.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jul 2022 08:53:48 -0700 (PDT)
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
Subject: [PATCH v3 11/13] drm: bridge: samsung-dsim: Add input_bus_flags
Date:   Wed, 20 Jul 2022 21:22:08 +0530
Message-Id: <20220720155210.365977-12-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220720155210.365977-1-jagan@amarulasolutions.com>
References: <20220720155210.365977-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

eLCDIF is expecting to have input_bus_flags as DE_LOW in order to
set active low during valid data transfer on each horizontal line.

Add DE_LOW flag via drm bridge timings.

v3, v2:
* none

v1:
* none

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index 2584343b767a..ef439b49f2b8 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -1591,6 +1591,10 @@ __weak void samsung_dsim_plat_remove(struct samsung_dsim *priv)
 {
 }
 
+static const struct drm_bridge_timings samsung_dsim_bridge_timings = {
+	.input_bus_flags = DRM_BUS_FLAG_DE_LOW,
+};
+
 static int samsung_dsim_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -1670,6 +1674,7 @@ static int samsung_dsim_probe(struct platform_device *pdev)
 
 	dsi->bridge.funcs = &samsung_dsim_bridge_funcs;
 	dsi->bridge.of_node = dev->of_node;
+	dsi->bridge.timings = &samsung_dsim_bridge_timings;
 	dsi->bridge.type = DRM_MODE_CONNECTOR_DSI;
 
 	if (dsi->driver_data->quirks & DSIM_QUIRK_PLAT_DATA)
-- 
2.25.1

