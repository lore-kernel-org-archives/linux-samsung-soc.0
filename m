Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D209FC7EE39
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  3 Mar 2023 14:52:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229976AbjCCOwe (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 3 Mar 2023 09:52:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229803AbjCCOwc (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 3 Mar 2023 09:52:32 -0500
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC8FA1ADF8
        for <linux-samsung-soc@vger.kernel.org>; Fri,  3 Mar 2023 06:52:31 -0800 (PST)
Received: by mail-pl1-x633.google.com with SMTP id ky4so2921270plb.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 03 Mar 2023 06:52:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7tZxKcA0ycBEYEtLsRm0mag1bTn00Dn2OB4UXN+PrCA=;
        b=g1hTmqTL8tLvJHgL5DZt6QapKxdO6Bx5iFVohVWNhvtPGlkI69a0BeBDTAQ3s775J0
         B8btGS4Wnj8c7xdNVV4Qd6QSp0BPLM60QVHcHRRrrwOnV6V54YEkjTpzJRfS4KLbS69T
         WDevEACzSJJd1aZEGUzlpuKlUiPjTsoKoYtig=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7tZxKcA0ycBEYEtLsRm0mag1bTn00Dn2OB4UXN+PrCA=;
        b=KfHNrthZ146d5Ml/GkccC3k55nFWbuG/+znGE1Y+DHcBjeHIDbWbB8gfzrXwWH3Lg0
         RyKU7gAocnttR9ghUuwHLBWZvH16H4z6+mjhVC6urKDYYc0gYyUKc19FilDu/PZ3wlyT
         ZszuWnocs0LKrUfxO3PDRV9QTnEecLncrTsdcpNyC2zJOnQ6M9wTYEFKeSnYQeQA6Y/b
         4ggcvC4xL5FJksYpn8O17fGdja7pGxqmeVkA3RUOn6IOdWZjIjwziaCM4ImpcJlk5GxV
         XpO0raVzo5WYyap/WJYVi9ztagl0QO1jjtclXack04Kf9pL5mZsEhTLcxx7nLc5OBpRY
         HVgA==
X-Gm-Message-State: AO0yUKUxpZZxi5rQmmsP5WnHXyjXFhnnAXpLuhHxlOPvUKGCSdYeGsif
        JXQa3a+nYJvGYvBlKepttxkGgg==
X-Google-Smtp-Source: AK7set/7XBegvdyV0hyovIxWarV3Vs1dBvaZdYiJBqSHxBJkXnvlgh9tng8rHqlEgrkMDdGO19XOzQ==
X-Received: by 2002:a05:6a21:6da5:b0:cc:46bd:39b0 with SMTP id wl37-20020a056a216da500b000cc46bd39b0mr2717652pzb.56.1677855151204;
        Fri, 03 Mar 2023 06:52:31 -0800 (PST)
Received: from localhost.localdomain ([183.83.137.89])
        by smtp.gmail.com with ESMTPSA id z4-20020a63e544000000b00502fd70b0bdsm1660856pgj.52.2023.03.03.06.52.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Mar 2023 06:52:30 -0800 (PST)
From:   Jagan Teki <jagan@amarulasolutions.com>
To:     Andrzej Hajda <andrzej.hajda@intel.com>,
        Inki Dae <inki.dae@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Marek Vasut <marex@denx.de>, Maxime Ripard <mripard@kernel.org>
Cc:     Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Frieder Schrempf <frieder.schrempf@kontron.de>,
        Tim Harvey <tharvey@gateworks.com>,
        Adam Ford <aford173@gmail.com>,
        Matteo Lisi <matteo.lisi@engicam.com>,
        dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
        linux-amarula <linux-amarula@amarulasolutions.com>,
        Jagan Teki <jagan@amarulasolutions.com>
Subject: [PATCH v15 03/16] drm: exynos: dsi: Mark PHY as optional
Date:   Fri,  3 Mar 2023 20:21:25 +0530
Message-Id: <20230303145138.29233-4-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230303145138.29233-1-jagan@amarulasolutions.com>
References: <20230303145138.29233-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The same Samsung MIPI DSIM master can also be used in NXP's
i.MX8M Mini/Nano/Plus SoC.

In i.MX8M Mini/Nano/Plus SoC the DSI Phy requires a MIPI DPHY
bit to reset in order to activate the PHY and that can be done
via upstream i.MX8M blk-ctrl driver.

So, mark the phy get as optional.

Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>
Reviewed-by: Marek Vasut <marex@denx.de>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v15, v13, v12:
- none
Changes for v11:
- collect Frieder RB
Changes for v10:
- add Plus in commit message
- collect Marek RB
Changes for v9, v8, v7, v6, v5, v4, v3, v2:
- none
Changes for v1:
- new patch

 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index f44a5a702ad5..af16af404e87 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -1732,7 +1732,7 @@ static int exynos_dsi_probe(struct platform_device *pdev)
 	if (IS_ERR(dsi->reg_base))
 		return PTR_ERR(dsi->reg_base);
 
-	dsi->phy = devm_phy_get(dev, "dsim");
+	dsi->phy = devm_phy_optional_get(dev, "dsim");
 	if (IS_ERR(dsi->phy)) {
 		dev_info(dev, "failed to get dsim phy\n");
 		return PTR_ERR(dsi->phy);
-- 
2.25.1

