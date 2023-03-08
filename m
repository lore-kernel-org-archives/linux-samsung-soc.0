Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8421BC6FD1E
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  8 Mar 2023 16:41:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229705AbjCHQlw (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 8 Mar 2023 11:41:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229767AbjCHQlo (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 8 Mar 2023 11:41:44 -0500
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC4E9C5637
        for <linux-samsung-soc@vger.kernel.org>; Wed,  8 Mar 2023 08:41:32 -0800 (PST)
Received: by mail-pl1-x634.google.com with SMTP id a2so18225320plm.4
        for <linux-samsung-soc@vger.kernel.org>; Wed, 08 Mar 2023 08:41:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1678293692;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yA/0m9HX9foD5OsXPqpJ1qNeqWR5nTK0/7XKzFPjjFc=;
        b=h2Rwk/NSxHaub1515G7VtNh6GovUpIyxwV1voyNKLeJNB/0IJsyjbuT+Axadurqz40
         6EyPtV7991OBZ/Mm9HjYy5C/4S3v3OlwKGsmRVW71oR1Wom4VIF1L/bx7aRujAcgiVbA
         S4JPgr7+TDpKDpuJWvgLMsvBqeZ4I0JnWLcq4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678293692;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yA/0m9HX9foD5OsXPqpJ1qNeqWR5nTK0/7XKzFPjjFc=;
        b=kc4h7UZslKe9A2DgrKz/Z+oqMwx+btQA4L4OpIprL0CVHu9FHqTkQiv365dlVUUhsm
         WNbe5yGwd4IUIJYxXMx+wdLLHMg0piRnVUiIzagj8r4i6xp9xEpOpGSs4cH+M+eeD90c
         6tK7gKAnZk4Q9Z8yPHSqBfrMk1/K4iG4rpzRdYakql4YqATIpj1rvuKcrGrLMii5jucF
         Gva4Loz2ASnhxVaYL9rm8ePDHMmlir8X3HM/W/I+FRmOnwujdzfxTvQYJYb5BCakwNdN
         jr6NtYoFlVk2U0DUnzL9/XUJkDbWeJDY/eJvi0oar+ipSEmgQJsfUXBkPxeVmjR5IeBI
         N/EQ==
X-Gm-Message-State: AO0yUKUsvEkxYpvcnKCGOLxLFR1Wqru7oXMW8rh/XstMYyuP7cD0WfHH
        cuCcHWLp+oj0/fkNBUgogQkRCQ==
X-Google-Smtp-Source: AK7set+oq82F39PH9WODFywTipgBEiRtljpJHN+rdEWK3QPCCCKF13vl6CXZK5IqjpP5gjDBCdE1lw==
X-Received: by 2002:a17:902:e5c2:b0:19e:7d67:84e6 with SMTP id u2-20020a170902e5c200b0019e7d6784e6mr24056057plf.0.1678293692211;
        Wed, 08 Mar 2023 08:41:32 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a8a1:b545:91cc:80b2:f9fe])
        by smtp.gmail.com with ESMTPSA id kq3-20020a170903284300b0019b9a075f1fsm10046540plb.80.2023.03.08.08.41.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Mar 2023 08:41:31 -0800 (PST)
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
        Jagan Teki <jagan@amarulasolutions.com>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v16 13/16] dt-bindings: display: exynos: dsim: Add NXP i.MX8M Mini/Nano support
Date:   Wed,  8 Mar 2023 22:09:50 +0530
Message-Id: <20230308163953.28506-14-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230308163953.28506-1-jagan@amarulasolutions.com>
References: <20230308163953.28506-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Samsung MIPI DSIM bridge can also be found in i.MX8M Mini/Nano SoC.

Add dt-bingings for it.

Reviewed-by: Marek Vasut <marex@denx.de>
Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v16, v15, v13:
- none
Changes for v12:
- collect RB from Marek
Changes for v11, v10, v9:
- none
Changes for v8:
- add comment to include i.MX8M Nano.
Changes for v7, v6, v5, v4:
- none
Changes for v3:
- collect Rob Acked-by
Changes for v2:
- updated comments
Changes for v1:
- new patch

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

