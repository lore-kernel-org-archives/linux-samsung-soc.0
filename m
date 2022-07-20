Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC675C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 20 Jul 2022 15:53:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229700AbiGTPxH (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 20 Jul 2022 11:53:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229456AbiGTPxH (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 20 Jul 2022 11:53:07 -0400
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FD8B4BD18
        for <linux-samsung-soc@vger.kernel.org>; Wed, 20 Jul 2022 08:53:06 -0700 (PDT)
Received: by mail-pg1-x52a.google.com with SMTP id h132so16737304pgc.10
        for <linux-samsung-soc@vger.kernel.org>; Wed, 20 Jul 2022 08:53:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FpNHItAiwu0m52sC3pwbotY9M6xqSP85k2SUYkR4F+A=;
        b=lPurvLEtAzdCctBqQCCtusfet5pL5hgD2AbZEjqT/e61F3wOg3UEydk2YMkjqe2sKq
         9CW+AKWaLb5ATXkfm5dRrvyxto2zuDnk6ALJMGuVWStEAt1A37zzie+P4afSlyB96MKC
         ZWUomieQpZSDGPNCGQZSj5ZwWGIunGo0KPwI8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FpNHItAiwu0m52sC3pwbotY9M6xqSP85k2SUYkR4F+A=;
        b=0EMA02m9Uu4F57DFwtnG4VpWmcynaUDsM3V+xhtHTArmWL3VVy9byBDBn13zJzgLgv
         50/V1rEVPD32HyX8KYeCOcKHRD0cIQlEBSCSICom1bpeNPbaZGbwEkjMKewFb43SfbTO
         pvmoVB4H9BsZiLoUWWey25pqukYIrogalFDB5UJM9RzRaP1yiP7s+OyodjMdIe8HQ3zR
         4T1wyDR9k7BcTAmuVdJaswvW7WxeVlfh47gBzs897y/JhMBpVyguDkZXj6Gy5NH94i+z
         AEKvxVbIitPHme38Df7DvZ/WRichMELvzfqIlWYEFt4pO7JYhNRWCwJG6fV0bqKxMnY1
         q3mg==
X-Gm-Message-State: AJIora9DAfFShHELxd+sx4BPNADUQhYnaV/Ml2rHRgJS83Y5jVd2ltjw
        P4t/oDUZswwiILVc1ZWSEZKHWA==
X-Google-Smtp-Source: AGRyM1tvNubQhLd0y80/Nb0oQe9wwe7GN/cevALO7+n5VX6hSZl09GrQH8Is9zCkMDqymqYtiIzAkA==
X-Received: by 2002:a63:904a:0:b0:415:18b4:ea92 with SMTP id a71-20020a63904a000000b0041518b4ea92mr34007714pge.551.1658332385950;
        Wed, 20 Jul 2022 08:53:05 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c00a:a073:d177:d5:aee:4f03])
        by smtp.gmail.com with ESMTPSA id a8-20020a170902710800b0015e8d4eb1d7sm13919198pll.33.2022.07.20.08.52.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jul 2022 08:53:05 -0700 (PDT)
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
Subject: [PATCH v3 05/13] drm: bridge: samsung-dsim: Mark PHY as optional
Date:   Wed, 20 Jul 2022 21:22:02 +0530
Message-Id: <20220720155210.365977-6-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220720155210.365977-1-jagan@amarulasolutions.com>
References: <20220720155210.365977-1-jagan@amarulasolutions.com>
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

v3, v2:
* none

v1:
* new patch

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index 4d5f72de2240..9b74a3f98a17 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -1583,7 +1583,7 @@ static int samsung_dsim_probe(struct platform_device *pdev)
 	if (IS_ERR(dsi->reg_base))
 		return PTR_ERR(dsi->reg_base);
 
-	dsi->phy = devm_phy_get(dev, "dsim");
+	dsi->phy = devm_phy_optional_get(dev, "dsim");
 	if (IS_ERR(dsi->phy)) {
 		dev_info(dev, "failed to get dsim phy\n");
 		return PTR_ERR(dsi->phy);
-- 
2.25.1

