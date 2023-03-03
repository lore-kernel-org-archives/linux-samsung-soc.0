Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33A60C678D4
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  3 Mar 2023 14:53:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229541AbjCCOxm (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 3 Mar 2023 09:53:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231140AbjCCOxg (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 3 Mar 2023 09:53:36 -0500
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BAF4166D5
        for <linux-samsung-soc@vger.kernel.org>; Fri,  3 Mar 2023 06:53:35 -0800 (PST)
Received: by mail-pg1-x52d.google.com with SMTP id h31so1630213pgl.6
        for <linux-samsung-soc@vger.kernel.org>; Fri, 03 Mar 2023 06:53:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aFgIQAMuyZazPwh+w9FQPp3RlQJAADjiFirtQ1jHy78=;
        b=ZvC7/Z71AUeXkRzmQEA8vCHIra0nIDp45hi5AdET2I3KkXt5q3HfVG5STTeKg3nfOK
         2pDXwIm4xe7bSLO6XqztSISHUfHS7Mm9M/NjTbh7NXsgGJYfMYoWws6NxBn5dn8TsAje
         bss7TKllIV/FyUSBMZ963YQIcoRxSihjqPLsU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aFgIQAMuyZazPwh+w9FQPp3RlQJAADjiFirtQ1jHy78=;
        b=KC0i8P/ovc+F58E//R+SkAWpj/IojPfQY/hWkfYZXSBT5Dd7+QDVtWttxzGBAC50dL
         /PQskF6ipeVww/XmmtcJ6oEXOCpURCl2oYGmqWwTiNI1GGJDAd8nYoClqOmMhXNU2rYm
         pTqrO7bNYgLdZLNUiPuUwFILdYiJTZgzqJuPWSA/kcuVkGiku+92yFJdsAU3OlXLcbmu
         2ap3YWrgONon8smhn3vo7Ym1HcePg9PWerYy1LCTSA7RnI4gtsS203pQ1HLzhqfoKlHP
         0Aw4JElkM673U+ktyux9zoGR7QkhVBsFSRXnz0IavVDe//7qxT0ERNghTN33Sg2dcEKx
         Y6Og==
X-Gm-Message-State: AO0yUKVHC1nD72LSwJbbmeSDiaJHXfh3wtUAJ+RoFLHrbTIvr0rOTjOL
        9/ZplAUHgE+V0HCfwfmViq/ibw==
X-Google-Smtp-Source: AK7set9SS0WXM0RzkfwW0xKNrL3gnO9oeSxvaJV2Hvs9p7ObZzqw3Gez1Ny9ECQXsOAUECAPhc7Z1Q==
X-Received: by 2002:a62:844d:0:b0:5ab:c004:5fc9 with SMTP id k74-20020a62844d000000b005abc0045fc9mr2667942pfd.17.1677855214809;
        Fri, 03 Mar 2023 06:53:34 -0800 (PST)
Received: from localhost.localdomain ([183.83.137.89])
        by smtp.gmail.com with ESMTPSA id z4-20020a63e544000000b00502fd70b0bdsm1660856pgj.52.2023.03.03.06.53.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Mar 2023 06:53:34 -0800 (PST)
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
Subject: [PATCH v15 15/16] dt-bindings: display: exynos: dsim: Add NXP i.MX8M Plus support
Date:   Fri,  3 Mar 2023 20:21:37 +0530
Message-Id: <20230303145138.29233-16-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230303145138.29233-1-jagan@amarulasolutions.com>
References: <20230303145138.29233-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Samsung MIPI DSIM bridge can also be found in i.MX8M Plus SoC.

Add dt-bingings for it.

Reviewed-by: Marek Vasut <marex@denx.de>
Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v15, v13:
- none
Changes for v12:
- collect RB from Marek
Changes for v11:
- collect ACK from Rob
Changes for v10, v9:
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

