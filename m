Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD578C04FDE
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  9 Dec 2022 15:29:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229814AbiLIP3y (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 9 Dec 2022 10:29:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230473AbiLIP3f (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 9 Dec 2022 10:29:35 -0500
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D78D1D0DB
        for <linux-samsung-soc@vger.kernel.org>; Fri,  9 Dec 2022 07:29:32 -0800 (PST)
Received: by mail-pl1-x62e.google.com with SMTP id g10so5209884plo.11
        for <linux-samsung-soc@vger.kernel.org>; Fri, 09 Dec 2022 07:29:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vr1sFCYK6xOgp3HQgvixcoPvVesJ0tGc4yiJdF9vU7Q=;
        b=WJm32FtNO32Uq6dyQjp+U7K3bEFMiAf/BDAHSMli3f/GCcTuV2vrlFDTUTFLxJp4Hm
         X9pXpcqpCOhLclUpKSB1MK8xyDFh+JcbBPrYukM37whKWOOtOQKxw1NslI7FGueYRrxY
         Wc5vKftoUrY93bRfFcwW0MRXBYbsVy4qGhryQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vr1sFCYK6xOgp3HQgvixcoPvVesJ0tGc4yiJdF9vU7Q=;
        b=59vZSiH1KqcTyuRZ5kEtzipX3k21VXtSsijPpzXT/ki2KVTKVO4Mq+cjQ0IS1ZM1AT
         OSfvYevSoupkDuWQYWiNDH/lVXtZYyMbrg9oEAnGgO/dthSQRfr/6FG3P5FQbz8egxEz
         LFBSaFNGgPA5KwHPm4a6FxJ3Kp2zfRharpAIeSxs4yoHhYBUAnxch+YGCYrTmfIBndk1
         CWYdRZ3xWqRdw3ayQqEMEgsY9/TjoStYGzxxNl7Kqhwd8ka/l+ZsmKJVmEprbIblCAl7
         c8TV9qhJTLs1LupNYxDG4OTczOMLHnbcQCr8Faxz8ZJgJYMm5qZOfFuGCYUPwq0vI5VT
         JZgA==
X-Gm-Message-State: ANoB5plHZLJsO/KQGpm/73fM5UwCRawU779XKLaUfeuQfwaif7vqe0P1
        YSMwf21LWAwDAkWSzvHzjZ2ABw==
X-Google-Smtp-Source: AA0mqf4shV/8b45XYewsg+kisEutSfSMO8MruxZiTRFGYFHREZsuwHm/fHCbQf+yjOaxny7ov6nEKg==
X-Received: by 2002:a17:903:328b:b0:189:f7c2:7245 with SMTP id jh11-20020a170903328b00b00189f7c27245mr6350308plb.45.1670599771703;
        Fri, 09 Dec 2022 07:29:31 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a809:6ba1:bbda:c542:ba0b])
        by smtp.gmail.com with ESMTPSA id x14-20020a170902ec8e00b00188c5f0f9e9sm1477587plg.199.2022.12.09.07.29.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Dec 2022 07:29:31 -0800 (PST)
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
Subject: [PATCH v9 17/18] dt-bindings: display: exynos: dsim: Add NXP i.MX8M Plus support
Date:   Fri,  9 Dec 2022 20:53:42 +0530
Message-Id: <20221209152343.180139-18-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221209152343.180139-1-jagan@amarulasolutions.com>
References: <20221209152343.180139-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Samsung MIPI DSIM bridge can also be found in i.MX8M Plus SoC.

Add dt-bingings for it.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v9:
- none

 Documentation/devicetree/bindings/display/exynos/exynos_dsim.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/exynos/exynos_dsim.txt b/Documentation/devicetree/bindings/display/exynos/exynos_dsim.txt
index 5133d4d39190..2a5f0889ec32 100644
--- a/Documentation/devicetree/bindings/display/exynos/exynos_dsim.txt
+++ b/Documentation/devicetree/bindings/display/exynos/exynos_dsim.txt
@@ -8,6 +8,7 @@ Required properties:
 		"samsung,exynos5422-mipi-dsi" /* for Exynos5422/5800 SoCs */
 		"samsung,exynos5433-mipi-dsi" /* for Exynos5433 SoCs */
 		"fsl,imx8mm-mipi-dsim" /* for i.MX8M Mini/Nano SoCs */
+		"fsl,imx8mp-mipi-dsim" /* for i.MX8M Plus SoCs */
   - reg: physical base address and length of the registers set for the device
   - interrupts: should contain DSI interrupt
   - clocks: list of clock specifiers, must contain an entry for each required
-- 
2.25.1

