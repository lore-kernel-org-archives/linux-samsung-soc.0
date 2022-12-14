Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F541C4332F
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 14 Dec 2022 13:00:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238429AbiLNNAL (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 14 Dec 2022 08:00:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238425AbiLNNAH (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 14 Dec 2022 08:00:07 -0500
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC3E6D2C8
        for <linux-samsung-soc@vger.kernel.org>; Wed, 14 Dec 2022 05:00:06 -0800 (PST)
Received: by mail-pj1-x102a.google.com with SMTP id q17-20020a17090aa01100b002194cba32e9so7080483pjp.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 14 Dec 2022 05:00:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UIrJ0sMj4TBazRS1wROrogpqFN4PzyDsm2y3+TsztNI=;
        b=DfVAry6sVS7b6KoufU0/aS8JBBcf4zBdG9IUX1IEpCtwD9uPoh9Ukvx7gWt8Q+9VI9
         XnELciUawS89l5X5OwPP6chAeC6rFYWNw8/5psr0uGzzw3eqyfMd7ZgqImeQV0UBs7mG
         k/6q/vNjeRUQ8IepNnjoK67aE1h9qQh0IC8Ss=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UIrJ0sMj4TBazRS1wROrogpqFN4PzyDsm2y3+TsztNI=;
        b=vixymDK66Q5Br9ztV1YkJcPJgw+N+kyUr62MHzMK5sKmXYapHEy4cUkqB5z8SUm11X
         sYYhS5fkFxMouzf/hKHYn1sdhPHJU4UMdJ5vwT9Pri/QqM1s9OYOT1TECqTXT2Z16lK2
         frSz6zWn0IDlY8q18IWDYg6nWhrmKe+sYq+vUOjWEwOovmpo6v9+VjnxWIC8igsy32Yd
         AqnKr79wldfzmjH0NwRRZAYQepo61nb6N/ppvTDw2AFnGhyXe4z8GbrthBpLsNX/QxWo
         MdFRQL6ZbSXqcCDLYrIVxRlsPfNb8jZ/X/Hgp7FAbSpTzEH2qAdVEX60zQ75vI3ADp9P
         wZrQ==
X-Gm-Message-State: ANoB5pmwbRrKZvtIZmZ8EFMxsJ0rnpCrBFJFe5cmbHzOauPutXD3Nl6J
        Pm3PY912MgdHwsC00B9JyU1fCQ==
X-Google-Smtp-Source: AA0mqf7B5S2Wce1GSRBZNr7ZG9u/A0cq5Cj0vNwmkLkrf2A5ySS6h2Bjel+ZftQ9XASNwufmKRHKaA==
X-Received: by 2002:a05:6a20:6918:b0:9d:efc0:62 with SMTP id q24-20020a056a20691800b0009defc00062mr41746149pzj.10.1671022806323;
        Wed, 14 Dec 2022 05:00:06 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a809:5e03:faf:846e:352d])
        by smtp.gmail.com with ESMTPSA id ix17-20020a170902f81100b001895f7c8a71sm1838651plb.97.2022.12.14.04.59.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Dec 2022 05:00:05 -0800 (PST)
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
Subject: [PATCH v10 05/18] drm: exynos: dsi: Mark PHY as optional
Date:   Wed, 14 Dec 2022 18:28:54 +0530
Message-Id: <20221214125907.376148-6-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221214125907.376148-1-jagan@amarulasolutions.com>
References: <20221214125907.376148-1-jagan@amarulasolutions.com>
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

Reviewed-by: Marek Vasut <marex@denx.de>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
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
index 4a165764121d..5918d31127aa 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -1687,7 +1687,7 @@ static int exynos_dsi_probe(struct platform_device *pdev)
 	if (IS_ERR(dsi->reg_base))
 		return PTR_ERR(dsi->reg_base);
 
-	dsi->phy = devm_phy_get(dev, "dsim");
+	dsi->phy = devm_phy_optional_get(dev, "dsim");
 	if (IS_ERR(dsi->phy)) {
 		dev_info(dev, "failed to get dsim phy\n");
 		return PTR_ERR(dsi->phy);
-- 
2.25.1

