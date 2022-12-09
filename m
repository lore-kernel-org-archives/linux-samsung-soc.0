Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B674FC54EBE
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  9 Dec 2022 15:27:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229675AbiLIP1O (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 9 Dec 2022 10:27:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230456AbiLIP0n (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 9 Dec 2022 10:26:43 -0500
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47B9B8F08B
        for <linux-samsung-soc@vger.kernel.org>; Fri,  9 Dec 2022 07:26:38 -0800 (PST)
Received: by mail-pj1-x1031.google.com with SMTP id u15-20020a17090a3fcf00b002191825cf02so5291600pjm.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 09 Dec 2022 07:26:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XR2mP1JnKgTB9iSs6i/XkB+If2tnTWx4uTgT0kVlzzU=;
        b=nH7zUYD6q2rqs/QwFd5s+oyAxIFpR/90LVBW/zgcFhv/Q98L/S9pQV3FqLiTRPR5+S
         oXaLpFWkhZ9MrPk0GowiWMvdUoDQRJUOjOevXAavcMcX9bBuElp1n3fO6nO2CyaryWSo
         nTWpEbO9JjT7T6YQvGoIgA4GgQ/NYLbQ2uDhU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XR2mP1JnKgTB9iSs6i/XkB+If2tnTWx4uTgT0kVlzzU=;
        b=m2FeyZOJUU/mbeW7KEqwAdPdM2/br9MJ8E+w+/1i/+89zQL48RgOh44UWgthwrYFso
         SeESjlfoHfJI3AfCDl+J7KNkpwTyltswGE7km8LOu9rtiNtdjKlfwleLe5WOh+FxUQwq
         ZeujShV/AjSNpeER5E1FKcbSLgHPlzgd6pdfuzIraZ3vZ4gQCzxjsPFqZn7S7KmEDBeu
         p3RjZRDtZPIAiO8wb+RVZO5h4Y00mkct5sxbbWwtG1tqFK3yw9eyuwY6ihQqeg3VN4of
         EyPEzsOGiupto3iiXK5rSnIgYYhl25ALccHNoY8tArBvmfH9+Ybm3eN++vALH67BqRz1
         AaXQ==
X-Gm-Message-State: ANoB5pnkYvLoqygX0Lz/m7ON5jM2mZ0WYlpCHXR9zP1t42c4E6e/hSGK
        XHaVm1LXgnH8WIv8KvwAJ9wthw==
X-Google-Smtp-Source: AA0mqf5Enm27VsCjbegzhTYWKdUDXU0bR4IfimOQ30n1+c/PruYmuWUPkY7qzhoSTOwBV2ovqLqI0g==
X-Received: by 2002:a17:902:6b8b:b0:188:a4a3:7bb3 with SMTP id p11-20020a1709026b8b00b00188a4a37bb3mr6207536plk.9.1670599597601;
        Fri, 09 Dec 2022 07:26:37 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a809:6ba1:bbda:c542:ba0b])
        by smtp.gmail.com with ESMTPSA id x14-20020a170902ec8e00b00188c5f0f9e9sm1477587plg.199.2022.12.09.07.26.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Dec 2022 07:26:37 -0800 (PST)
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
Subject: [PATCH v9 08/18] drm: bridge: samsung-dsim: Mark PHY as optional
Date:   Fri,  9 Dec 2022 20:53:33 +0530
Message-Id: <20221209152343.180139-9-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221209152343.180139-1-jagan@amarulasolutions.com>
References: <20221209152343.180139-1-jagan@amarulasolutions.com>
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

v9, v8, v7, v6, v5, v4, v3, v2:
* none

v1:
* new patch

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index a4379c2ccb77..9adab5d372cc 100644
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

