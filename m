Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17AA6C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  5 Oct 2022 15:13:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230354AbiJEPN2 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 5 Oct 2022 11:13:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230352AbiJEPN0 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 5 Oct 2022 11:13:26 -0400
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com [IPv6:2607:f8b0:4864:20::d2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB9F26E2C3
        for <linux-samsung-soc@vger.kernel.org>; Wed,  5 Oct 2022 08:13:25 -0700 (PDT)
Received: by mail-io1-xd2d.google.com with SMTP id p70so1103844iod.13
        for <linux-samsung-soc@vger.kernel.org>; Wed, 05 Oct 2022 08:13:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+gTdmBPImvmtEVJ8K/TFFMRIl9dCboj/pEZUj0+angg=;
        b=hRGiJg6r86Qx2vzcgKNRqffsScJo8TRPdUfC2V5sazPpG16nRUdDbe/LNhd+x6tdw/
         3kmzy8kPdvpwvaGJcmL8NHs3ph8WEPww4T+zX2vbyxg07MWdFH6Xg4kUhjcYm8ZmV/pX
         Wdyyc1BttPpcC9bKRU/RGVMZBCT0wpNjeuLtg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+gTdmBPImvmtEVJ8K/TFFMRIl9dCboj/pEZUj0+angg=;
        b=siQNgelXuxVikAraJBonulM7zYbMLY4+xyuCCsPMqQcxvsuMaPdYt2gNB7ripSSEmb
         hwT3uABG+k3ZtEZ47mizJTapYUcMr/5vqX775hiKwT0yGgr5wVQRTEobH6s3Z6dMkyw4
         Ilehe1e6NElboWW+Eew2uF3aSGPckcbgVfCbQkXJDJhQKMipEsYGBFCo3sGIHGQw0+WZ
         cdigVGwZhjhVW2Deqkr7GXYYo8g0qr1HKdRleV3zI1kFgJXzfGvazoyn1IJKcbSCM1py
         /gH0vnEjNNU4LCs/mkE5URrkGnlB1a4HXk0fO+ko6veM3GHqzrjwPjQHAEb2W/MTYdw+
         zRYg==
X-Gm-Message-State: ACrzQf0iv6Xq7cvgltyqUIqlTdhQDnCqlyNSU6mXsN8cWHoT6rUIs4Gy
        1HwP9e2fRf3iPqlC49r26E37UAf76C1h+oiy
X-Google-Smtp-Source: AMsMyM669NtZBL1QivoK8jgGFSq7WGsixMsDmqYfcu/B429dwt1+UYojmwbDgFtiJAkyBn4M5fDE2w==
X-Received: by 2002:a05:6602:1609:b0:6a1:899e:bf36 with SMTP id x9-20020a056602160900b006a1899ebf36mr146502iow.121.1664982805048;
        Wed, 05 Oct 2022 08:13:25 -0700 (PDT)
Received: from j-ThinkPad-E14-Gen-2.stthomas.edu ([140.209.96.21])
        by smtp.gmail.com with ESMTPSA id w15-20020a056602034f00b0068a235db030sm7089276iou.27.2022.10.05.08.13.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Oct 2022 08:13:24 -0700 (PDT)
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
Subject: [PATCH v7 03/10] drm: bridge: samsung-dsim: Mark PHY as optional
Date:   Wed,  5 Oct 2022 20:43:02 +0530
Message-Id: <20221005151309.7278-4-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221005151309.7278-1-jagan@amarulasolutions.com>
References: <20221005151309.7278-1-jagan@amarulasolutions.com>
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

v7, v6, v5, v4, v3, v2:
* none

v1:
* new patch

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index c34c6abac815..1bae3673151b 100644
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

