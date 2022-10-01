Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 871BBC433FE
	for <linux-samsung-soc@archiver.kernel.org>; Sat,  1 Oct 2022 08:08:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229517AbiJAIIH (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 1 Oct 2022 04:08:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbiJAIIH (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 1 Oct 2022 04:08:07 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 704C037188
        for <linux-samsung-soc@vger.kernel.org>; Sat,  1 Oct 2022 01:08:06 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id i6so6138109pfb.2
        for <linux-samsung-soc@vger.kernel.org>; Sat, 01 Oct 2022 01:08:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=8w8yLdkBYp8fmjlqiLKDKImnbgR9vL2oirXeCiK2yvo=;
        b=BfXJd+n+S4aNfwtACs6jSgrH6FcHo9roH6nQlbBDI7+IqxVouQrHJXancNUN1b54+r
         YDr8ZqHphVjCkUS5RJmRPzj0hssFDXTgXtTnegN3TpqRaMnvckayZgh0D7MMP3qjdOhu
         OWHwL6aZBV3rcdggYzE9hjTCrETE4S/mG6wUI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=8w8yLdkBYp8fmjlqiLKDKImnbgR9vL2oirXeCiK2yvo=;
        b=zkpUemIzZSVJE7t2MxkwNZO26qs5srS7eK3AT0mN1ww4biavHLyHLbC68IpDgwBaRk
         qlewvOYBOFweuKhCpu4eWTCZkFkIn764eZUMUlWPRZ8Q9SW3FLe86UR3IguDKlRrQnnm
         7S4Qeg9lInNowmzzYzSckq3uAkU+HiwOBXfD4f+SwFFtXB+dV+tB+5atm4vQHea/wfey
         xKkefMrKtks6uJM1dtQLGJWyItyAHXOU4SUi5jA1LZoGaAzFvyAtF7HjJIcH7bNaeXwB
         TXinUkI7Xa/u+MmfvAXV6Dg+IctxvALx2PU2qnaIBXkzXb95imMYAqnVTbAmimyS7naR
         jnAg==
X-Gm-Message-State: ACrzQf0p8HS4c3cg+urIEJGwp2y5+gPa0DeYZ1t8XnhmKPOw8wpoXBZJ
        JgpeiydBIObmD0z++8wlKyyhng==
X-Google-Smtp-Source: AMsMyM5PQLLtGy13dGbF1U4VNyG4/4E8lKF4ne0P7BIV9/byRtOgpVP28HPjl4VFw4GIs5LCh0HNsQ==
X-Received: by 2002:a63:847:0:b0:439:22e4:8e49 with SMTP id 68-20020a630847000000b0043922e48e49mr10565092pgi.165.1664611685994;
        Sat, 01 Oct 2022 01:08:05 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c00a:a073:7254:4392:bc7c:c69])
        by smtp.gmail.com with ESMTPSA id c194-20020a624ecb000000b005409c9d2d41sm3167041pfb.62.2022.10.01.01.07.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Oct 2022 01:08:05 -0700 (PDT)
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
Subject: [PATCH v6 03/10] drm: bridge: samsung-dsim: Mark PHY as optional
Date:   Sat,  1 Oct 2022 13:36:43 +0530
Message-Id: <20221001080650.1007043-4-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221001080650.1007043-1-jagan@amarulasolutions.com>
References: <20221001080650.1007043-1-jagan@amarulasolutions.com>
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

v6, v5, v4, v3, v2:
* none

v1:
* new patch

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index e41b6eeef622..2ba909ec5239 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -1584,7 +1584,7 @@ int samsung_dsim_probe(struct platform_device *pdev)
 	if (IS_ERR(dsi->reg_base))
 		return PTR_ERR(dsi->reg_base);
 
-	dsi->phy = devm_phy_get(dev, "dsim");
+	dsi->phy = devm_phy_optional_get(dev, "dsim");
 	if (IS_ERR(dsi->phy)) {
 		dev_info(dev, "failed to get dsim phy\n");
 		return PTR_ERR(dsi->phy);
-- 
2.25.1

