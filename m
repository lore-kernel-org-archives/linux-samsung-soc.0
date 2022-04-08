Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC36DC433F5
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  8 Apr 2022 16:22:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230129AbiDHQYj (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 8 Apr 2022 12:24:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230030AbiDHQYi (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 8 Apr 2022 12:24:38 -0400
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90172EE4EE
        for <linux-samsung-soc@vger.kernel.org>; Fri,  8 Apr 2022 09:22:33 -0700 (PDT)
Received: by mail-pg1-x533.google.com with SMTP id z128so8207181pgz.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 08 Apr 2022 09:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gGzzNcZY8RobibNWD65GpD1P4b/cN9VaV+JKjs3w2tM=;
        b=cEAopD5V2S3S9ex0G6yHvQna15BEzdeRDqQPGNwvzhtdW32VdJuPEHuaXwCxfnl93B
         vc3qC9H4s7hVxWGb7MCY0xBskCl0wOyh0MqHzrWShGJmF0wTQ3DCBxX3hI2x75BfLhtQ
         fy3SOSKYH3fg9aP9OvoFMxcLVee2Lh3Zlye7o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gGzzNcZY8RobibNWD65GpD1P4b/cN9VaV+JKjs3w2tM=;
        b=5dYiq7STSb9aPRIr1jTB3XiSqnch6P98VVeBh8gKXuRyE43xLyJxHIYGbtCSkLSCvd
         5q3Zqu23T+w6rQ11/vitt/yRiKj3+j44QEvRah+/Ck7fDG3c6juG8NO7nJCbUYLzD8NT
         BkHuYkddsHlD7Obg0VC0ifVlR427UgnhrgHXYaflAjLVrUVk6BEnGxtKBY1vaeRHHhA3
         N/D/KwwjFGDGS7QefA9XhAIxQQ2AGafb8HOsVYXoUF+ukhWM695nVn/6GrbEGQeyDEmu
         RHFp49a+UKYFPrKCItqRyBztdlvKeXhi4jfQSZ+rAE1XlvHQ/FJqQqFSa86q9yauUX7P
         osEA==
X-Gm-Message-State: AOAM530PNJBTkmCWfxZIUY7A/UsWU35+RSw3D5J1Pw3T5lgaQ64QbmEN
        3ExZDNqIT+pr4AdBLeCVcGcEQg==
X-Google-Smtp-Source: ABdhPJyMQiWVcRguZ6ZZ6h+HCm/rUJKRxdLX++3Psb+xCLNDLaij1ylis+3u/mmBF732gkrXUsyQHA==
X-Received: by 2002:a05:6a00:238f:b0:4f7:78b1:2f6b with SMTP id f15-20020a056a00238f00b004f778b12f6bmr20311000pfc.17.1649434953099;
        Fri, 08 Apr 2022 09:22:33 -0700 (PDT)
Received: from j-ThinkPad-E14-Gen-2.domain.name ([45.249.78.214])
        by smtp.gmail.com with ESMTPSA id n18-20020a056a0007d200b004fdac35672fsm24929863pfu.68.2022.04.08.09.22.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Apr 2022 09:22:32 -0700 (PDT)
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
        Rob Herring <robh+dt@kernel.org>
Cc:     dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-amarula <linux-amarula@amarulasolutions.com>,
        Jagan Teki <jagan@amarulasolutions.com>
Subject: [PATCH 03/11] drm: bridge: samsung-dsim: Mark PHY as optional
Date:   Fri,  8 Apr 2022 21:51:00 +0530
Message-Id: <20220408162108.184583-4-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220408162108.184583-1-jagan@amarulasolutions.com>
References: <20220408162108.184583-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

In i.MX8M Mini/Nano SoC the DSI Phy requires a MIPI DPHY bit
to reset in order to activate the PHY and that can be done via
upstream i.MX8M blk-ctrl driver.

So, mark the phy get as optional.

v1:
* new patch

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index 0e6a5d1c7e4e..ff05c8e01cff 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -1539,7 +1539,7 @@ static int samsung_dsim_probe(struct platform_device *pdev)
 	if (IS_ERR(dsi->reg_base))
 		return PTR_ERR(dsi->reg_base);
 
-	dsi->phy = devm_phy_get(dev, "dsim");
+	dsi->phy = devm_phy_optional_get(dev, "dsim");
 	if (IS_ERR(dsi->phy)) {
 		dev_info(dev, "failed to get dsim phy\n");
 		return PTR_ERR(dsi->phy);
-- 
2.25.1

