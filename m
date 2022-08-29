Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C529ECAAD5
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 29 Aug 2022 18:41:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229717AbiH2Slc (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 29 Aug 2022 14:41:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229671AbiH2Slb (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 29 Aug 2022 14:41:31 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A2987FE70
        for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Aug 2022 11:41:30 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id u9-20020a17090a1f0900b001fde6477464so2440190pja.4
        for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Aug 2022 11:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=ekS3WKj8dCgDC2uR7us15QLNPxhzQvukxO9+hGPd1Fc=;
        b=HnbXs1ML66kxEnNABMLGgQzYP9+Mx/9aOdoFNZOeNZP13+7t3gxkTo9aHFnit/8p39
         +qJrpHfU9ORiAamjeK1hjEi1aOXZGWXm7A/PL0QgDh4+rKFXEO8F3+duantPVOt6Vhrm
         CaEwNKBHjHmNuOKWMMxL9DPkxrePRVG8yX7ac=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=ekS3WKj8dCgDC2uR7us15QLNPxhzQvukxO9+hGPd1Fc=;
        b=j4PzlVzy16oUI+oI20qQnA3RTLtTnQv9BnnpDmgRA7+iM5sNNeTG8SdeRwSsGhi6ep
         LcfdoUmJoRKV7rQ1ghhE/Y1+X545ujN8fHuUKmi5NAJed2L1b8Phcs7iU20Si9S0Y3xe
         Q2WY8AT4qZaHHHu5muUOJAMsahfLChys/gPYr4yPAwTYqxN9YLR6TE+Y3uUpJfqf9f9f
         pPIAkEP+BMDc10wNbEz4wmgx+zCiGqbpGg+W1itywbhuqaTMMWdGBMeaiEHFsVAYJv2X
         3fAZ66KhE58ZuA/Tr8poy9upSvJv3hGqVEqRJTFUjKZfOIwh1ErAWd00few5XayfEVly
         KBpg==
X-Gm-Message-State: ACgBeo1Vnq6U7x6RUqjb+P7CL1Mt1PBqekB5vco12XpDSdLiZd2/KbL0
        C3amFRZ63BrAiGcrkpZLvuJJjw==
X-Google-Smtp-Source: AA6agR6igcVBbT/LUR6Sd+1DiAgFRJV3DTmCSHTSH2MW//x0unKs5bFAKtczc3KvcelUDCNwOwqItQ==
X-Received: by 2002:a17:903:4043:b0:174:dd99:a589 with SMTP id n3-20020a170903404300b00174dd99a589mr4510335pla.56.1661798489606;
        Mon, 29 Aug 2022 11:41:29 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c00a:a073:43f7:1644:6259:830d])
        by smtp.gmail.com with ESMTPSA id k13-20020aa7998d000000b005385e2e86eesm1619042pfh.18.2022.08.29.11.41.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Aug 2022 11:41:28 -0700 (PDT)
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
Subject: [PATCH v4 05/12] drm: bridge: samsung-dsim: Mark PHY as optional
Date:   Tue, 30 Aug 2022 00:10:24 +0530
Message-Id: <20220829184031.1863663-6-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220829184031.1863663-1-jagan@amarulasolutions.com>
References: <20220829184031.1863663-1-jagan@amarulasolutions.com>
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

v4, v3, v2:
* none

v1:
* new patch

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index 76dc7687857a..c3ed317996ad 100644
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

