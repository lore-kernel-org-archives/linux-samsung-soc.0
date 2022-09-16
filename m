Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3918AECAAD8
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 16 Sep 2022 18:19:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229964AbiIPSTh (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 16 Sep 2022 14:19:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229932AbiIPSTe (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 16 Sep 2022 14:19:34 -0400
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16DBB245
        for <linux-samsung-soc@vger.kernel.org>; Fri, 16 Sep 2022 11:19:27 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id jm11so22148110plb.13
        for <linux-samsung-soc@vger.kernel.org>; Fri, 16 Sep 2022 11:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=+fFzpIi3PzPgMcGro61CvH6vcLPJxCss6KFI8NyEpQE=;
        b=ngIiJzuCuLYLdItpwqV2305DppqZ6E6z9DuFmuoBn/RSIdhQOi3oq+9r0lecEFatGq
         b6gDqEhlU4aEEcpVvkS79JQcYwXbhKF6XApC2LYn/zmeLXOH9eCJIX5LLjpiqPv3WOu+
         fM7eTEjmOIxk94LhcpC07DguyLrT1QgKWmrbA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=+fFzpIi3PzPgMcGro61CvH6vcLPJxCss6KFI8NyEpQE=;
        b=cZ3vUb/mji5RZ/8SM46H239DIJuvJfKrayqFK7ZdooQT5NxFIMJ2IaYaVbug6JD9i3
         0RW+hu2Swv4aQMrMOLQg30je6yI0kZS91fHwW0HqoONnS1gM9/ls5fF2YJUdJjmC9K+k
         7T1XNGKRqNEsLBGWfuimKslH2HhlY4IPziToZwNwpRSTeviO2NpYjjD3bh4olEQdbDrX
         c17bsIMAO+FydbnwAr9gjGgCxMpiDcv+2EMGx1xgaRVgk/Ziq5MU6jI5Kglp/bgDNXeg
         b7WMwkt+7jW1EqUqaq67aRkZLyBqLCSVNgb+W8S+emG77MA1gLv89K9JsAETdNJtobT7
         c0EQ==
X-Gm-Message-State: ACrzQf3qG+P4q0A6r+tHb3+ln+fST9ANoSy6S7frvCXoMy2LRb5ulMRg
        BP2Obm3gHDoW+ITfss44LlOlBA==
X-Google-Smtp-Source: AMsMyM7KxRQAJzRdRzZLXmFeDc1z8XC7h+VUNBDrhnPxAoqNUvwMRkHcL8Dq1Z2JIeNNQATZWNhb+w==
X-Received: by 2002:a17:902:e549:b0:178:6d7c:abf6 with SMTP id n9-20020a170902e54900b001786d7cabf6mr1092457plf.131.1663352366475;
        Fri, 16 Sep 2022 11:19:26 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c00a:a073:ae5d:6ee4:5c2f:6733])
        by smtp.gmail.com with ESMTPSA id d14-20020a17090a6a4e00b002007b60e288sm1770000pjm.23.2022.09.16.11.19.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Sep 2022 11:19:25 -0700 (PDT)
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
Subject: [PATCH v5 09/11] drm: bridge: samsung-dsim: Add input_bus_flags
Date:   Fri, 16 Sep 2022 23:47:29 +0530
Message-Id: <20220916181731.89764-10-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220916181731.89764-1-jagan@amarulasolutions.com>
References: <20220916181731.89764-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

eLCDIF is expecting to have input_bus_flags as DE_LOW in order to
set active low during valid data transfer on each horizontal line.

Add DE_LOW flag via drm bridge timings.

v5:
* rebased based on updated bridge changes

v4, v3, v2, v1:
* none

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index 527fef6f1ff6..a0f5438b7921 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -1585,6 +1585,10 @@ static const struct samsung_dsim_host_ops samsung_dsim_generic_host_ops = {
 	.unregister_host = samsung_dsim_unregister_host,
 };
 
+static const struct drm_bridge_timings samsung_dsim_bridge_timings = {
+	.input_bus_flags = DRM_BUS_FLAG_DE_LOW,
+};
+
 int samsung_dsim_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -1665,6 +1669,7 @@ int samsung_dsim_probe(struct platform_device *pdev)
 
 	dsi->bridge.funcs = &samsung_dsim_bridge_funcs;
 	dsi->bridge.of_node = dev->of_node;
+	dsi->bridge.timings = &samsung_dsim_bridge_timings;
 	dsi->bridge.type = DRM_MODE_CONNECTOR_DSI;
 
 	if (dsi->plat_data->host_ops && dsi->plat_data->host_ops->register_host)
-- 
2.25.1

