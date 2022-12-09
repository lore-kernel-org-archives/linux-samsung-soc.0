Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42EE7C04FDE
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  9 Dec 2022 15:29:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230098AbiLIP3G (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 9 Dec 2022 10:29:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230222AbiLIP2z (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 9 Dec 2022 10:28:55 -0500
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC7D612775
        for <linux-samsung-soc@vger.kernel.org>; Fri,  9 Dec 2022 07:28:54 -0800 (PST)
Received: by mail-pl1-x633.google.com with SMTP id d3so5209459plr.10
        for <linux-samsung-soc@vger.kernel.org>; Fri, 09 Dec 2022 07:28:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8p9dxhpDEUaFEM6i9u4TLkBBVBUWb0qAkL73zpJR35M=;
        b=WqAhRmTfaE1uP5V7v5oPhs2j9JbsB9dzNO8h4T/RMEk8iF/m2H8QUpZHH7rc1ZKWjo
         SfV6DYb8cWbrApPZp6YnEkBtbtJehtmX5xaqT9JI/Y4+NDMBmmZ6yYh7xqiLn15XlVvY
         i9V1dFR4zy7R4rVJqWVI2sxW+h6MsZhopwgag=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8p9dxhpDEUaFEM6i9u4TLkBBVBUWb0qAkL73zpJR35M=;
        b=oj5ZSix9ZEtoLLJX8+uvi91iWcHCnHqxdhzh+TzI7L0EQhMqqsFBQKmzzhH1v86ty7
         UgEKqg9WPaVa8aNUT6htOQPwofvoQ7CTy3n5BFUxEJeuHJnLRNpQw9yREGDiK9DfPUBM
         +PPRVJmgk9tKRBFoRc2uP05sLh3kX8jSqho4IAV8/DtnTYoSmCNq+B/Tuwu44dJM0jis
         9MEboxeSSjGQ0YF2gThEIdk+P+AcanwP5YABUtGjgkrsFY8T4nTqHOYbXcHxlPcQ4MZX
         6wLMXv51r+Z3/4w3+TOXOuiDdpVJFeZtj0t3HhXIVI/dTlAYRo/hI/PmOB5inFV5SoUZ
         w2wg==
X-Gm-Message-State: ANoB5pk20oHmRcaGTjDBdYojZmn0WymH6p1Rrjx8RFNJZAlDLYeeFFEI
        fqzifxkurEt0E5eYblQb8KGNwA==
X-Google-Smtp-Source: AA0mqf7/OotqOappfZc8v6yh5v3mGpz5PlKhFLaT389Uh2ISaD6ESdcdD7ej1WqilpE5rytaXYbZbw==
X-Received: by 2002:a05:6a20:a599:b0:a4:3203:40c9 with SMTP id bc25-20020a056a20a59900b000a4320340c9mr7741002pzb.59.1670599734187;
        Fri, 09 Dec 2022 07:28:54 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a809:6ba1:bbda:c542:ba0b])
        by smtp.gmail.com with ESMTPSA id x14-20020a170902ec8e00b00188c5f0f9e9sm1477587plg.199.2022.12.09.07.28.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Dec 2022 07:28:53 -0800 (PST)
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
        Jagan Teki <jagan@amarulasolutions.com>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v9 15/18] dt-bindings: display: exynos: dsim: Add NXP i.MX8M Mini/Nano support
Date:   Fri,  9 Dec 2022 20:53:40 +0530
Message-Id: <20221209152343.180139-16-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221209152343.180139-1-jagan@amarulasolutions.com>
References: <20221209152343.180139-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Samsung MIPI DSIM bridge can also be found in i.MX8M Mini/Nano SoC.

Add dt-bingings for it.

v9:
* none

v8:
* add comment to include i.MX8M Nano.

v7, v6, v5, v4:
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
index be377786e8cd..5133d4d39190 100644
--- a/Documentation/devicetree/bindings/display/exynos/exynos_dsim.txt
+++ b/Documentation/devicetree/bindings/display/exynos/exynos_dsim.txt
@@ -7,6 +7,7 @@ Required properties:
 		"samsung,exynos5410-mipi-dsi" /* for Exynos5410/5420/5440 SoCs */
 		"samsung,exynos5422-mipi-dsi" /* for Exynos5422/5800 SoCs */
 		"samsung,exynos5433-mipi-dsi" /* for Exynos5433 SoCs */
+		"fsl,imx8mm-mipi-dsim" /* for i.MX8M Mini/Nano SoCs */
   - reg: physical base address and length of the registers set for the device
   - interrupts: should contain DSI interrupt
   - clocks: list of clock specifiers, must contain an entry for each required
-- 
2.25.1

