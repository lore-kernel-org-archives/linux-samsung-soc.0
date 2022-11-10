Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72AE4C4332F
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 10 Nov 2022 18:40:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229812AbiKJSky (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 10 Nov 2022 13:40:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229586AbiKJSkx (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 10 Nov 2022 13:40:53 -0500
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2407919C0B
        for <linux-samsung-soc@vger.kernel.org>; Thu, 10 Nov 2022 10:40:52 -0800 (PST)
Received: by mail-pl1-x629.google.com with SMTP id p12so2206212plq.4
        for <linux-samsung-soc@vger.kernel.org>; Thu, 10 Nov 2022 10:40:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X5JIaDuFSCbEdTKjuhBG+/b5UleN8wJEpIhsi/EFtH8=;
        b=nnGEqEt15LumDp297u7w4f7TN/yO9p8F+tPPoh+iATM4fTBzTgOUb01UUoyR055hqe
         g8l+/JQ9bwwU9TUOc7P7yC2llTJf1/KODd39rbnRRJacHP1g9ENmgnCk5gWMDl4T5c2h
         vzk/EPlv4TRhCBlAUsLC+mbBGA15gzUhpl/tg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X5JIaDuFSCbEdTKjuhBG+/b5UleN8wJEpIhsi/EFtH8=;
        b=REl12pTpw4bi86lOvxglpKUM+Svab/c2HqsgODkQy4X6XgpDTnm5BFwQZP82w6DWmR
         jUgTbpEQ4YBLkyQZ7kHv7G/r+Srn4OoKPCdcNRkb5ieppiRPlKdBpzRVoRvDQl1j0/bw
         Ze0Qze3Mp8un7rX5zIYR4qD9rW9C0XUxwtJJ6F3IHZaJv8fbpsRZcktWQZLop7Zs57fE
         C2c3ZFhsmvqZRd8OYXelJfQlllAvo3ILgYWVB1GBLCulJTu1R8FmMpurDIXluysurzWU
         GjwtUz6QMP5V80j3PNhhc4JvznqzxKLA0kFuFjwGe2VCUgzcSQa6/tX1mCF6OnIHCvw4
         2xyA==
X-Gm-Message-State: ACrzQf0gBbUy4ij0LZJlKsmGg4Wy8ypzIDJ+3G10088S1om06NfZlaMy
        4poscsVCz2/atP00jE+Yb6hAgg==
X-Google-Smtp-Source: AMsMyM7CVIjHAsTgNgZfQCQybvuO8nlDgkYOxslygcWZqcMPYuVYbnw6U7pFo483qM+hXQzddxpOCA==
X-Received: by 2002:a17:902:e9ca:b0:186:8624:9675 with SMTP id 10-20020a170902e9ca00b0018686249675mr65016542plk.76.1668105651614;
        Thu, 10 Nov 2022 10:40:51 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a809:b5a4:486a:f07:f67e])
        by smtp.gmail.com with ESMTPSA id c2-20020a170903234200b001869efb722csm11635627plh.215.2022.11.10.10.40.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Nov 2022 10:40:50 -0800 (PST)
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
Subject: [PATCH v8 05/14] drm: bridge: samsung-dsim: Mark PHY as optional
Date:   Fri, 11 Nov 2022 00:08:44 +0530
Message-Id: <20221110183853.3678209-6-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221110183853.3678209-1-jagan@amarulasolutions.com>
References: <20221110183853.3678209-1-jagan@amarulasolutions.com>
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

v8:
* collect Marek Ack

v7, v6, v5, v4, v3, v2:
* none

v1:
* new patch

Reviewed-by: Marek Vasut <marex@denx.de>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index 1c1a824b4ea7..bb1f45fd5a88 100644
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

