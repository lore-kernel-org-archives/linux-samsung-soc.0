Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2BFAECAAD8
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 16 Sep 2022 18:18:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229809AbiIPSSw (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 16 Sep 2022 14:18:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229774AbiIPSSv (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 16 Sep 2022 14:18:51 -0400
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02471B6D27
        for <linux-samsung-soc@vger.kernel.org>; Fri, 16 Sep 2022 11:18:50 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id jm11so22146585plb.13
        for <linux-samsung-soc@vger.kernel.org>; Fri, 16 Sep 2022 11:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=aoALU8tXwdf0pdOg1lEf+wK1oaye8Av68gUGwS5JTQY=;
        b=gfewwGUiXZevRHwv6K1hSgSIfqy/8Gc2p/ga6LvThuxW21U6vR8FEn98k+OWQuBMNz
         vN/IXa0/V3T+dAR/DxmX66FBSbQClVpe7ZyrLm9MF859Ggl+ewkqNrK1oHfJuHr5VMFc
         pfzrCWdR1rTH57CDDuJtCOTthZzvjF/G3ZI0g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=aoALU8tXwdf0pdOg1lEf+wK1oaye8Av68gUGwS5JTQY=;
        b=hcT4c/4O5n/QDlTLRf3SfzaZA0vMi3PqsMlSMiA3lYz0P570BjwHMIyexQV2Zcjv1W
         wWZd5f8WIPCJP1EbNvIm3dY5htTE3tjXAd6BWg+0XyBlRXbg10ldkRq1R1saAjhxCXJB
         +LpZ/CMPvJqQhD5AW5d0cGdcqIGoQmhEC1YU2boAA9AHp4V8R//SJJNZADwzioGwX9aW
         hlzxrb3ZAKDZsFWxEseQ85GWO8uLQUAqT5S5NMjdKPn2vOuW8rWaSEHLTGU00zCdCZGy
         JH6Y9K84I7kRdM4Ww0FWlx3XhPBr0bifQDOEEqenl6mEEuKUSQz2t8ot1OvFQPrpsEHc
         O4Nw==
X-Gm-Message-State: ACrzQf3QCjxUrhFfJ1ZSrwVf3bNIg3hp+LveBMplfQ3YSh6RJy2je0pP
        5oEakkPDQqXmNlFhZtLEe2nnuQ==
X-Google-Smtp-Source: AMsMyM6L5QwK0HbTFT7V2woguX3+SQNsN1tTXOU9mmgVXpHSj0RnjRqZrD9Oo0XFOpUOQVKqcth/Zw==
X-Received: by 2002:a17:90a:fc96:b0:203:86f:5a86 with SMTP id ci22-20020a17090afc9600b00203086f5a86mr6911471pjb.108.1663352329511;
        Fri, 16 Sep 2022 11:18:49 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c00a:a073:ae5d:6ee4:5c2f:6733])
        by smtp.gmail.com with ESMTPSA id d14-20020a17090a6a4e00b002007b60e288sm1770000pjm.23.2022.09.16.11.18.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Sep 2022 11:18:48 -0700 (PDT)
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
Subject: [PATCH v5 04/11] drm: bridge: samsung-dsim: Mark PHY as optional
Date:   Fri, 16 Sep 2022 23:47:24 +0530
Message-Id: <20220916181731.89764-5-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220916181731.89764-1-jagan@amarulasolutions.com>
References: <20220916181731.89764-1-jagan@amarulasolutions.com>
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

v5, v4, v3, v2:
* none

v1:
* new patch

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index 2e79fbfe2a7d..eac2dc2f24ba 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -1568,7 +1568,7 @@ int samsung_dsim_probe(struct platform_device *pdev)
 	if (IS_ERR(dsi->reg_base))
 		return PTR_ERR(dsi->reg_base);
 
-	dsi->phy = devm_phy_get(dev, "dsim");
+	dsi->phy = devm_phy_optional_get(dev, "dsim");
 	if (IS_ERR(dsi->phy)) {
 		dev_info(dev, "failed to get dsim phy\n");
 		return PTR_ERR(dsi->phy);
-- 
2.25.1

