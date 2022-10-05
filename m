Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0012C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  5 Oct 2022 15:13:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230360AbiJEPNh (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 5 Oct 2022 11:13:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230391AbiJEPNf (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 5 Oct 2022 11:13:35 -0400
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com [IPv6:2607:f8b0:4864:20::d2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E54616E2C3
        for <linux-samsung-soc@vger.kernel.org>; Wed,  5 Oct 2022 08:13:34 -0700 (PDT)
Received: by mail-io1-xd2e.google.com with SMTP id e205so13055326iof.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 05 Oct 2022 08:13:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wWIP+yGy/n2GKp0GScrqMzuD9vwA6F45Gf3P4LmqEGY=;
        b=PdruZyNn3pDfvsjOn2r6/JOhK9DB97SSe5VBaJCJnuFDSE/9pM3paV7HaNBDmtfJZw
         j/79XuZttn5HAdQoQSTQn0qOhER4ok/6yDO0ZnBjcJGYD3ewcDRqwZWEHv2XWfeocHMK
         paAFXtq+lS3SNtIG0lu82xNXlf7MEPh6ixGDk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wWIP+yGy/n2GKp0GScrqMzuD9vwA6F45Gf3P4LmqEGY=;
        b=hy2QU0C01iUfEnZNH6DwwA/IcHJUexXbs9ge/AceuifnnCHaWinUC3vSAt4uCKr9sN
         D6xRRUasPOCyrJM8nTh0nTIYgZYqgaqejL0vO7GJMvEGowVuU812o5vfnEVB7n+wzrLZ
         pkLcXSWd6vForB9Tp1qw+KlHcALCo1dq/QcqiWxF83NYN0gupdch8nWHZy0Zz4jk61f6
         03tceDY61FdXgyARdomP0xUPEbyltpoxkIonuUrdaVS3k+hEk7ChRcyecpZH0hHzUPYl
         yfnnCxVgxhu8vI8+05vKwXax5i6zWuF3/8QHH0ZPXgNto8Rz7Mp5gCpFy8mVACl4QW60
         oEFw==
X-Gm-Message-State: ACrzQf1HxRdP89Y7G5DvASNWSxpqHkli+6xjsdXK22HBb/UcCNdxwe+5
        s+TkUK6H09L6XKHGEJM7e0Hu9A==
X-Google-Smtp-Source: AMsMyM7plXxDojB4aFrHxdxQ6nlSBFxsxPVUZHWp+3Ju2o16fvFfQ0r75G4f4MR6aUdANqxShuc+LA==
X-Received: by 2002:a05:6638:134f:b0:35a:5b6a:9591 with SMTP id u15-20020a056638134f00b0035a5b6a9591mr64725jad.184.1664982814334;
        Wed, 05 Oct 2022 08:13:34 -0700 (PDT)
Received: from j-ThinkPad-E14-Gen-2.stthomas.edu ([140.209.96.21])
        by smtp.gmail.com with ESMTPSA id w15-20020a056602034f00b0068a235db030sm7089276iou.27.2022.10.05.08.13.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Oct 2022 08:13:33 -0700 (PDT)
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
Subject: [PATCH v7 08/10] drm: bridge: samsung-dsim: Add input_bus_flags
Date:   Wed,  5 Oct 2022 20:43:07 +0530
Message-Id: <20221005151309.7278-9-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221005151309.7278-1-jagan@amarulasolutions.com>
References: <20221005151309.7278-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

eLCDIF is expecting to have input_bus_flags as DE_LOW in order to
set active low during valid data transfer on each horizontal line.

Add DE_LOW flag via drm bridge timings.

v7, v6:
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
index f714e49c1eab..f5cd80641cea 100644
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

