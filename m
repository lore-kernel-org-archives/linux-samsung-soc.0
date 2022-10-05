Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC1D3C433FE
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  5 Oct 2022 15:13:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230361AbiJEPNj (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 5 Oct 2022 11:13:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230357AbiJEPNh (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 5 Oct 2022 11:13:37 -0400
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com [IPv6:2607:f8b0:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E06A46DFB1
        for <linux-samsung-soc@vger.kernel.org>; Wed,  5 Oct 2022 08:13:36 -0700 (PDT)
Received: by mail-il1-x133.google.com with SMTP id m14so4852471ilf.12
        for <linux-samsung-soc@vger.kernel.org>; Wed, 05 Oct 2022 08:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1VdDEs1pi0qW/yb3TfGC/umjEjhhqUp9mNuoYTgXucw=;
        b=kiKQaGYN3sa14/VpVKcELjjC8h3OY40YcBrnv+4pPnYwBcVHuwm1bnXT6lpOH/OgyQ
         tQrJeBiIz5jk/tA4/pgHKLnHvl6WXfyXyLZRuLD1Em9huvEK5RIZnOG6V2GBoSe+d/Tj
         /BpjtyIQb7E7y0uKpz0eREWEYLmEjaDDZNuL8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1VdDEs1pi0qW/yb3TfGC/umjEjhhqUp9mNuoYTgXucw=;
        b=II1p+aw0wkqy3TeO62NPxI5r8Iu3apwpnOm9xUZ+glx552eNEcMcqQ0LeOQLrAKpG5
         JfOV0yFXAicPyoO6Gsh+MplcQMds9nJDntPsXEnrgqhv6Gf40uyJvlvfF44aanvNtnnC
         SmKOBS8kiajtIzuBY2EScaFq4GudRSfq/k4ND9Yw8O9vEyJq66im0dvuE/YZRSDBXkYX
         4LU/I2iL9hahOoo1QlQ+EholuTAGNXRKQbAzfrUKDOfMO/NvnLvOJj3dRFPoJ7cbtTes
         UwIfgG6o1PyqaEkO44nrkpbuMH27cB16bZhNrpu04pvLHbD6wddTt6epoiHTMz0Kyjwo
         h70Q==
X-Gm-Message-State: ACrzQf1SYMDlMErZyPNJsiNGLDIOBvHW9npniJhFHMUq+lDHsohAL9wZ
        WFKawGyLDNtexvEEou11OSIviw==
X-Google-Smtp-Source: AMsMyM4PrDXBe+q8y0XRtJ0ZpqAVT+zqc8fvM6mbuz//B9QSOyBbdWRK12W8OMmQpy1/KL/mUp61fA==
X-Received: by 2002:a05:6e02:1789:b0:2f6:b741:3e6f with SMTP id y9-20020a056e02178900b002f6b7413e6fmr49909ilu.157.1664982816172;
        Wed, 05 Oct 2022 08:13:36 -0700 (PDT)
Received: from j-ThinkPad-E14-Gen-2.stthomas.edu ([140.209.96.21])
        by smtp.gmail.com with ESMTPSA id w15-20020a056602034f00b0068a235db030sm7089276iou.27.2022.10.05.08.13.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Oct 2022 08:13:35 -0700 (PDT)
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
Subject: [PATCH v7 09/10] dt-bindings: display: exynos: dsim: Add NXP i.MX8MM support
Date:   Wed,  5 Oct 2022 20:43:08 +0530
Message-Id: <20221005151309.7278-10-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221005151309.7278-1-jagan@amarulasolutions.com>
References: <20221005151309.7278-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Samsung MIPI DSIM bridge can also be found in i.MX8MM SoC.

Add dt-bingings for it.

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

