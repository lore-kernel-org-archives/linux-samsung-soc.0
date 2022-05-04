Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFF95C433FE
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  4 May 2022 11:42:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348930AbiEDLpp (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 4 May 2022 07:45:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348917AbiEDLpn (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 4 May 2022 07:45:43 -0400
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC1F2E0D2
        for <linux-samsung-soc@vger.kernel.org>; Wed,  4 May 2022 04:42:02 -0700 (PDT)
Received: by mail-pl1-x630.google.com with SMTP id j8so1158152pll.11
        for <linux-samsung-soc@vger.kernel.org>; Wed, 04 May 2022 04:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+NRE5c3umnhAMfzXZGdT8IR9mvtmW1bU49iqwSFs3sc=;
        b=Y0Tcd1boFN93JgX95QeJpwHuwDbrVQaFe2hXsFwqpiFyFx7voQp9CBUZDRWoWtRwNN
         SAS0xiCCBTgPYrbn9bbV0sD8Gy6qV5lYyiGbh6Q5UrLXV/1DWetarmxh5aGUxbjTKIdv
         BluggB50nxMCEBs1Vj84c/ApSgtwCtS2yF9NI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+NRE5c3umnhAMfzXZGdT8IR9mvtmW1bU49iqwSFs3sc=;
        b=XoInpKr1l43XTyp25/BXDX1oqBZukS8yqcQ7hdJupJiY7cQxgwDy5tSgKaurWC0j36
         j/pX5KOokjZkDw5dYuaLeSWdeRJYq6ngJoYiRR4aMtDMOGtuA1O4wxZEfKVy6GkhC6x3
         fkpboHQtwznx6M8fZ7gT0sVPhICt4NbncaNuQXZhks4M0Nw4COJOpeXiEa37QX+lviep
         BC2vB6uEdsCe92/3TeicEk72UcuyJgihsmQl4G7QxOD3IVYlPdFrS7culIFt1umz1s2e
         qDr7wmcLRYSk0nHwTa6GmGBKDL6G2pAslN8LgKb/Tf2OPzGVJYJEv40w1CEjC/OP1B13
         DtbQ==
X-Gm-Message-State: AOAM532kV/P0XcNmsWCURkMXSxHtrh5oWZn/o2AEQDQI6XpcYJ85+PZ5
        SbntGBWBPq+PQegKPAvpBrMkHg==
X-Google-Smtp-Source: ABdhPJwHlsfAEyiW39pMgCeykegHaxXvobTcJ3Fcz9VqKeNbffHAr6A2rVRaeChTmj+FhHjk8S78OA==
X-Received: by 2002:a17:90b:4d89:b0:1d2:a75e:38b9 with SMTP id oj9-20020a17090b4d8900b001d2a75e38b9mr9885676pjb.73.1651664522377;
        Wed, 04 May 2022 04:42:02 -0700 (PDT)
Received: from localhost.localdomain ([183.83.137.38])
        by smtp.gmail.com with ESMTPSA id k15-20020aa790cf000000b0050dc7628174sm8027498pfk.78.2022.05.04.04.41.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 04:42:01 -0700 (PDT)
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
        Tommaso Merciai <tommaso.merciai@amarulasolutions.com>
Cc:     Matteo Lisi <matteo.lisi@engicam.com>,
        dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-amarula <linux-amarula@amarulasolutions.com>,
        Jagan Teki <jagan@amarulasolutions.com>,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2 11/12] dt-bindings: display: exynos: dsim: Add NXP i.MX8MM support
Date:   Wed,  4 May 2022 17:10:20 +0530
Message-Id: <20220504114021.33265-12-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220504114021.33265-1-jagan@amarulasolutions.com>
References: <20220504114021.33265-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Samsung MIPI DSIM bridge can also be found in i.MX8MM SoC.

Add dt-bingings for it.

v2:
* updated comments

v1:
* new patch

Cc: devicetree@vger.kernel.org,
Cc: Rob Herring <robh+dt@kernel.org>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Note:
I will send separate series for updating to yaml as the existing binding
is old that it has some properties need to fix.

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

