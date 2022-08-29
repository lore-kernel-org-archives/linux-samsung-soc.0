Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B14AECAAD2
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 29 Aug 2022 18:42:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229844AbiH2SmG (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 29 Aug 2022 14:42:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229786AbiH2SmF (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 29 Aug 2022 14:42:05 -0400
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0D0C82D2F
        for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Aug 2022 11:42:04 -0700 (PDT)
Received: by mail-pf1-x42b.google.com with SMTP id 142so9045149pfu.10
        for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Aug 2022 11:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=gg+A4/98sts77T30oMd2QqQaJoBU8yXhs87UapIfZsk=;
        b=aBmth8jStXvVwvHfKY8BHZUhkLqaYnA89PKvSTsQ5vQUqmU8p7UuEb+dB4pvY5Ucvg
         mcC4Z/IvqltQVv5S4Td1q7p61KSYfEIIKFT6SubsfQpghSk1bUw7P3/FJZH1VvqnsSp0
         HlslYcl7fqqa4sx6gIu35LNHnK8wI+DIx1Kr4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=gg+A4/98sts77T30oMd2QqQaJoBU8yXhs87UapIfZsk=;
        b=1d+0wB+qLlcGOBdINUii88VKBL/u31C/oaTvznVz225AwOARY2tN/bzLho5DZRKwro
         VbS7giLXiyHmL2HVb63eAunHLXaRC2HtNyqJyJrHa/yXNAZ+FHjck8XuHH3NqXXfRR1n
         ZsDp56XEeRQM1XxgZFfSBH16Q+/PVX6F4rwuRjB2nC4n9TfzXNwuttecBbKJTWCDGbuB
         H0nSub1yJYoN8uxBF6IL5tiKCCwb3vSXQ9oU8LfC4WstqC2XFUp40DTAveioibFg6QfU
         Z+w+DPKIQ5oVjwFEX1Oict4Hl9PLTkaHOTPd8Rgk/TAUovp2hyrbMO4WuWNJc9DDJy1+
         n/CA==
X-Gm-Message-State: ACgBeo1JciJv0gg145lkAzDj1p1O02FnLd4OPA7VVL4oXZqBAUSriXKM
        SJuMov1Oy5RDeLA4Rqb16Cvb5A==
X-Google-Smtp-Source: AA6agR5I1L27Rd+FZsw1WB+4G0p1imMCRH56Suy/n5wfU/sw+O/azOzB5h8k60Qbi25m+E1df1GA9A==
X-Received: by 2002:a05:6a00:1826:b0:537:b261:3e4d with SMTP id y38-20020a056a00182600b00537b2613e4dmr18086398pfa.65.1661798524198;
        Mon, 29 Aug 2022 11:42:04 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c00a:a073:43f7:1644:6259:830d])
        by smtp.gmail.com with ESMTPSA id k13-20020aa7998d000000b005385e2e86eesm1619042pfh.18.2022.08.29.11.41.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Aug 2022 11:42:03 -0700 (PDT)
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
Subject: [PATCH v4 10/12] drm: bridge: samsung-dsim: Add input_bus_flags
Date:   Tue, 30 Aug 2022 00:10:29 +0530
Message-Id: <20220829184031.1863663-11-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220829184031.1863663-1-jagan@amarulasolutions.com>
References: <20220829184031.1863663-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

eLCDIF is expecting to have input_bus_flags as DE_LOW in order to
set active low during valid data transfer on each horizontal line.

Add DE_LOW flag via drm bridge timings.

v4, v3, v2:
* none

v1:
* none

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index 871cc8cc5352..f3b5e265b027 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -1593,6 +1593,10 @@ __weak void samsung_dsim_plat_remove(struct samsung_dsim *priv)
 {
 }
 
+static const struct drm_bridge_timings samsung_dsim_bridge_timings = {
+	.input_bus_flags = DRM_BUS_FLAG_DE_LOW,
+};
+
 static int samsung_dsim_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -1672,6 +1676,7 @@ static int samsung_dsim_probe(struct platform_device *pdev)
 
 	dsi->bridge.funcs = &samsung_dsim_bridge_funcs;
 	dsi->bridge.of_node = dev->of_node;
+	dsi->bridge.timings = &samsung_dsim_bridge_timings;
 	dsi->bridge.type = DRM_MODE_CONNECTOR_DSI;
 
 	if (dsi->driver_data->quirks & DSIM_QUIRK_PLAT_DATA)
-- 
2.25.1

