Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1C74C4332F
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 10 Nov 2022 18:41:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229586AbiKJSl2 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 10 Nov 2022 13:41:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229757AbiKJSl1 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 10 Nov 2022 13:41:27 -0500
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBC7E19C0B
        for <linux-samsung-soc@vger.kernel.org>; Thu, 10 Nov 2022 10:41:26 -0800 (PST)
Received: by mail-pg1-x52a.google.com with SMTP id v3so2523557pgh.4
        for <linux-samsung-soc@vger.kernel.org>; Thu, 10 Nov 2022 10:41:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+uQe3bmrV0zmghe9Tre6aGt5ad4Xsr/J3KkGBkCAzjo=;
        b=kW6ySL9n+9McJX1vufvewvJWt6Ghf7ABWg4WL9I+w6MnWhduVB35BPxbNF1DaBapee
         lfJ2uSLRVSEoWJB5nvBm4mtKhHomnYDQbNe7H8xgpYtr2N7idFdkXbj0B3ovQWpgCClF
         eeI5A8w8WVPOzrU0FPTCuuWwjaduiJ9GSTt5k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+uQe3bmrV0zmghe9Tre6aGt5ad4Xsr/J3KkGBkCAzjo=;
        b=YlSyr3v8AqCQ8oHh+5v/zyVrXRKVGCCPZOnLJvIKeFzbzf48eDu+f/wFY0PrH9pehB
         6cUNR2+cgQwoM1CCH0uEJq+wyfYnR7ijxEgW1hXeG1sQ2z/7FRVDFHoiPgpmHn2xx9At
         O8Bl+nqYo49tt9CSB5alEMB9h+6YI/YYCoGmhh72JEKYtfkHzQr7VqvFhPZYKLPk/iNp
         T1ns0GfHzjLsYi0eteZBXkiGyK0e+5G2b/v4JvuPA7fqJD+5v9sYhkqg4OfX+g5+vvHr
         9CdhuwHAmISr99P3SDono+xcA8Nnv2jBaoTr4CpI8cOQRwgIV+TmzK/0hm0e8u9/qaMG
         aIeg==
X-Gm-Message-State: ACrzQf3ursF01CgeCISqpxkDuxevA/2WDeUQhW+2oFssnwkJkoxqMzxL
        v+TV7/zkh1olsJntLvODfheFjw==
X-Google-Smtp-Source: AMsMyM51ddcMMgzfIkx+DjiizwQGBjkpQqu0oehnqrEhCTJv0lFzNgYTi3y88dbmqpHoCNlaI1zW3w==
X-Received: by 2002:a63:1053:0:b0:439:4c73:821c with SMTP id 19-20020a631053000000b004394c73821cmr2977955pgq.109.1668105686267;
        Thu, 10 Nov 2022 10:41:26 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a809:b5a4:486a:f07:f67e])
        by smtp.gmail.com with ESMTPSA id c2-20020a170903234200b001869efb722csm11635627plh.215.2022.11.10.10.41.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Nov 2022 10:41:25 -0800 (PST)
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
Subject: [PATCH v8 10/14] drm: bridge: samsung-dsim: Add input_bus_flags
Date:   Fri, 11 Nov 2022 00:08:49 +0530
Message-Id: <20221110183853.3678209-11-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221110183853.3678209-1-jagan@amarulasolutions.com>
References: <20221110183853.3678209-1-jagan@amarulasolutions.com>
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
index 33e5ae9c865f..65f7d8522bc1 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -1627,6 +1627,10 @@ static const struct samsung_dsim_host_ops samsung_dsim_generic_host_ops = {
 	.unregister_host = samsung_dsim_unregister_host,
 };
 
+static const struct drm_bridge_timings samsung_dsim_bridge_timings_de_low = {
+	.input_bus_flags = DRM_BUS_FLAG_DE_LOW,
+};
+
 int samsung_dsim_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -1709,6 +1713,10 @@ int samsung_dsim_probe(struct platform_device *pdev)
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

