Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B400ECAAD8
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 29 Aug 2022 18:42:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229907AbiH2SmR (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 29 Aug 2022 14:42:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229925AbiH2SmN (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 29 Aug 2022 14:42:13 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC4EF832DC
        for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Aug 2022 11:42:11 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id y1so6988414plb.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Aug 2022 11:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=G5us0GccePnAC3wVw9NR5mJwNnkTd3GEPACcJ6N2xfM=;
        b=ixsSx2pg6G3XbINEs9wWUT6eb/1pe4V7HSvotl6YRGTb4X2U9ViVUlHparslx5uvmY
         MWa0L3jzH8XtuoFoFUKkmGQQMASC4zDQmmhnyP5He417ujnC3KHBwPb49oFb7g6L7x2y
         3zwA+YO/IodPFntZZVtuuvyg1TzNDz6uZpwdc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=G5us0GccePnAC3wVw9NR5mJwNnkTd3GEPACcJ6N2xfM=;
        b=pPRQhZZQ0jOz6xvcyEEDplHDBWNK+Jt2z7C5Dlgtj46+qe2lqESPY/Oscl0JlZKhVB
         fW22fScw9Ib1Fp/VEa1eS7WYa3Q3yYs2Ytp/hU+tCGxfFXlmShAJGsrUEsvZF3WFvWM3
         7NeyAaOeGgJ/5bT9RRa/JwJJ2ROMHwmtDDV54OG6GnMNX+4dOx6Bx9Cndnr0J6gmscmB
         MYlF+IP5E55Rn1kIf50+B4SHl33ikjzLsfeJ5tKa44y2LnU444QLlgeIknjSG3Uyb/6C
         UXNi3rfpTBqg7lNDxZXIVHrnTucJTaZ/2s6RHuSRNtyG/AbLxiSjlEf5DP3aNFk/7E7E
         NHPw==
X-Gm-Message-State: ACgBeo23Y6vikzGVl1pJr65VVWqEnFWy400cQCDCcTxzmP6Jsv+/nb5a
        0/eptLlE73+TOD2BqGcTbPGAMg==
X-Google-Smtp-Source: AA6agR7E695eeXsLzO3oj+CBg/g3fkfBjtTPyuYsP2X9XEv8GfAXp86Q9lOoz+sFpU2whGx8uemFtw==
X-Received: by 2002:a17:902:d181:b0:174:11d5:b2e0 with SMTP id m1-20020a170902d18100b0017411d5b2e0mr17334216plb.114.1661798531320;
        Mon, 29 Aug 2022 11:42:11 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c00a:a073:43f7:1644:6259:830d])
        by smtp.gmail.com with ESMTPSA id k13-20020aa7998d000000b005385e2e86eesm1619042pfh.18.2022.08.29.11.42.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Aug 2022 11:42:10 -0700 (PDT)
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
        Jagan Teki <jagan@amarulasolutions.com>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v4 11/12] dt-bindings: display: exynos: dsim: Add NXP i.MX8MM support
Date:   Tue, 30 Aug 2022 00:10:30 +0530
Message-Id: <20220829184031.1863663-12-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220829184031.1863663-1-jagan@amarulasolutions.com>
References: <20220829184031.1863663-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Samsung MIPI DSIM bridge can also be found in i.MX8MM SoC.

Add dt-bingings for it.

v4:
* none

v3:
* collect Rob Acked-by

v2:
* updated comments

v1:
* new patch

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 Documentation/devicetree/bindings/display/exynos/exynos_dsim.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/exynos/exynos_dsim.txt b/Documentation/devicetree/bindings/display/exynos/exynos_dsim.txt
index be377786e8cd..8efcf4728e0b 100644
--- a/Documentation/devicetree/bindings/display/exynos/exynos_dsim.txt
+++ b/Documentation/devicetree/bindings/display/exynos/exynos_dsim.txt
@@ -7,6 +7,7 @@ Required properties:
 		"samsung,exynos5410-mipi-dsi" /* for Exynos5410/5420/5440 SoCs */
 		"samsung,exynos5422-mipi-dsi" /* for Exynos5422/5800 SoCs */
 		"samsung,exynos5433-mipi-dsi" /* for Exynos5433 SoCs */
+		"fsl,imx8mm-mipi-dsim" /* for i.MX8M Mini SoCs */
   - reg: physical base address and length of the registers set for the device
   - interrupts: should contain DSI interrupt
   - clocks: list of clock specifiers, must contain an entry for each required
-- 
2.25.1

