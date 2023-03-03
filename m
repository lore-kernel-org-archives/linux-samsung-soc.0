Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 755A9C7EE32
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  3 Mar 2023 14:53:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230349AbjCCOxk (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 3 Mar 2023 09:53:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230499AbjCCOxZ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 3 Mar 2023 09:53:25 -0500
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45977166D5
        for <linux-samsung-soc@vger.kernel.org>; Fri,  3 Mar 2023 06:53:24 -0800 (PST)
Received: by mail-pj1-x1034.google.com with SMTP id h17-20020a17090aea9100b0023739b10792so2502644pjz.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 03 Mar 2023 06:53:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lSVWR2ldWXx4P8cCL/XZK7AfqlWbO+endEWxs3RHKQk=;
        b=HOIo+MdVrJ4SOatlLuBNmjwPVEuNr4Za4GxmeEsBZ8rgGdKhkPIU7wtSSt40FhUKoK
         Wft1Ou919u9KwRWLS/04tOvXZ1Rk53cLwaav0j0Ler5iXZXMNiKlcnlHQegmX6CvhtoX
         ybLlgUp/7KkeWUxDX4dVs5W9wmnlIJ9PW1imM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lSVWR2ldWXx4P8cCL/XZK7AfqlWbO+endEWxs3RHKQk=;
        b=RukSwJ8GuuQufphqLRMojEJOQ18g/AAM3LR4UwoXcBIucnFSUyUj8CyTfLq/yrkNyw
         KFhqGdGhmb2CgawFOwvrQ+iE+Aq3VwdXfyc8ix69RlC0B/hDxgj0hUF1Od4q+42Be1S/
         jCgl8nARSqznMR9ctGarJ5WO4gIqV5UfX8fDzgUvrU7TVKuupJGMs3h+ygDhTa5gCYY4
         25/4rx4wGvB2ebeJ2DuII4KwcetYzxI8yrvIH2t/9xOaHhfKJnJtbVAvd95hV9eSXDzu
         alvUwY2Eoj9aWVrCTnpj/9tn0EnCbXT+zKn1u1t2I+LT9NkRhRGUUyrZgXMQU8FfCkcM
         an7Q==
X-Gm-Message-State: AO0yUKWQ+k5ZpG0CBHkMzK7neDmMDR6eO5rTlC/wNnn8gWxjArb8/0vX
        aeNnOZ/DQW3+EfR+f9f68hjCcg==
X-Google-Smtp-Source: AK7set9Hc+DuqKvnoWeZ2wrV7xHKyh41mJrL6Z7VjglZXsp0yyKIB1B+dBYdB2NYCwbwQuBs9DdEvw==
X-Received: by 2002:a05:6a21:8693:b0:cc:f9f2:3047 with SMTP id ox19-20020a056a21869300b000ccf9f23047mr2042322pzb.52.1677855203801;
        Fri, 03 Mar 2023 06:53:23 -0800 (PST)
Received: from localhost.localdomain ([183.83.137.89])
        by smtp.gmail.com with ESMTPSA id z4-20020a63e544000000b00502fd70b0bdsm1660856pgj.52.2023.03.03.06.53.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Mar 2023 06:53:23 -0800 (PST)
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
Subject: [PATCH v15 13/16] dt-bindings: display: exynos: dsim: Add NXP i.MX8M Mini/Nano support
Date:   Fri,  3 Mar 2023 20:21:35 +0530
Message-Id: <20230303145138.29233-14-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230303145138.29233-1-jagan@amarulasolutions.com>
References: <20230303145138.29233-1-jagan@amarulasolutions.com>
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
Changes for v15, v13:
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

