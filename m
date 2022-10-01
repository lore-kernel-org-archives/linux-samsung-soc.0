Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB900C433FE
	for <linux-samsung-soc@archiver.kernel.org>; Sat,  1 Oct 2022 08:09:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229550AbiJAIJs (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 1 Oct 2022 04:09:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbiJAIJq (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 1 Oct 2022 04:09:46 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB20E1571E
        for <linux-samsung-soc@vger.kernel.org>; Sat,  1 Oct 2022 01:09:43 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id d24so5788124pls.4
        for <linux-samsung-soc@vger.kernel.org>; Sat, 01 Oct 2022 01:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=bIsBpWYKGaRb2gfWU/8omTUwq6r8O+ulvfUN+TCAIdY=;
        b=lfTdedK41vWtMebW3Wcp94YL7ucmrlEryRuuPWEj+o7FAAPRkjDA+9D5Pac+YlQm3+
         pBpTLZbP/U95I+bN063h+cFVsvEu91POyJnliuPN/4No7TVkOfPBVS12IJtx/3QVP//U
         RcI9Ck1SO4KholGKAGSZoHwFS9y8khcFmTCA8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=bIsBpWYKGaRb2gfWU/8omTUwq6r8O+ulvfUN+TCAIdY=;
        b=dxb9KlN0WOb9frXzt6pLEt1ufouNizQhs3pggieKMrQjY+HG7WSN7O8jy27nQ/xBY9
         mAJcPBiSn+v320ViuZkXhQ5yppzTXCcqyzJmWiWtbjqZ/u9vji4MF1zfqoJu77aP3UJB
         eECDEVqPI38ZV3OMj74+QafIctrdNHzJiwpX70GJsaBfIOSY4CNL8K1RDtQdWpeB1bE9
         GwQDdd9FQn7er2vv4HVesJpOVe+kLWBvJnFR9tcdx5OmSpxOYUQmXBSk1k5RcIbT157/
         6MMAdJg60fgoXvK2MFfI56U7bY030iIqIFuizRQjCczVA6bH0gxcV3Tnel5dL1oIRQKc
         aWVw==
X-Gm-Message-State: ACrzQf1IrvxbUqTbpQn2R30ro7s6ynGaQ3r0DbzNUookgjoyF3YiK5DS
        4IWleGHBq9/tVxBSLs7udCUaJA==
X-Google-Smtp-Source: AMsMyM7A6yv4u9IjhcSR+PGTiZiBShQT4hp8vwLtDbTRUwpJ55h1OAzyFhyKY2oLDVzQW/Ntc0WcjQ==
X-Received: by 2002:a17:902:f650:b0:172:8ee1:7f40 with SMTP id m16-20020a170902f65000b001728ee17f40mr12989210plg.101.1664611783492;
        Sat, 01 Oct 2022 01:09:43 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c00a:a073:7254:4392:bc7c:c69])
        by smtp.gmail.com with ESMTPSA id c194-20020a624ecb000000b005409c9d2d41sm3167041pfb.62.2022.10.01.01.09.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Oct 2022 01:09:43 -0700 (PDT)
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
Subject: [PATCH v6 08/10] drm: bridge: samsung-dsim: Add input_bus_flags
Date:   Sat,  1 Oct 2022 13:36:48 +0530
Message-Id: <20221001080650.1007043-9-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221001080650.1007043-1-jagan@amarulasolutions.com>
References: <20221001080650.1007043-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

eLCDIF is expecting to have input_bus_flags as DE_LOW in order to
set active low during valid data transfer on each horizontal line.

Add DE_LOW flag via drm bridge timings.

v6:
* none

v5:
* rebased based on updated bridge changes

v4, v3, v2, v1:
* none

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index 4fd77172bb4b..49406a07d655 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -1601,6 +1601,10 @@ static const struct samsung_dsim_host_ops samsung_dsim_generic_host_ops = {
 	.unregister_host = samsung_dsim_unregister_host,
 };
 
+static const struct drm_bridge_timings samsung_dsim_bridge_timings = {
+	.input_bus_flags = DRM_BUS_FLAG_DE_LOW,
+};
+
 int samsung_dsim_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -1681,6 +1685,7 @@ int samsung_dsim_probe(struct platform_device *pdev)
 
 	dsi->bridge.funcs = &samsung_dsim_bridge_funcs;
 	dsi->bridge.of_node = dev->of_node;
+	dsi->bridge.timings = &samsung_dsim_bridge_timings;
 	dsi->bridge.type = DRM_MODE_CONNECTOR_DSI;
 
 	if (dsi->plat_data->host_ops && dsi->plat_data->host_ops->register_host)
-- 
2.25.1

