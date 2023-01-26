Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEF3BC54E94
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 26 Jan 2023 14:47:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231774AbjAZOrv (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 26 Jan 2023 09:47:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229512AbjAZOrt (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 26 Jan 2023 09:47:49 -0500
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B4FC5B9E
        for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Jan 2023 06:47:47 -0800 (PST)
Received: by mail-pj1-x102f.google.com with SMTP id nn18-20020a17090b38d200b0022bfb584987so1920611pjb.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Jan 2023 06:47:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FKvIfsgTCLn2iGe+HpUVx9o6FL0YoXL442NeJHKNz98=;
        b=X29/6osZcjOtOFC3eOXcmKegkdt5nLJA5TpQngO3n6xH1dUg+tytfzZThy11s/MN/b
         wrQktVIfqeU4cCD2UmtJVqbF3BnleC94tu8sjdQlAsGzGCT+SVCE4p83q1LLPLnefMdt
         Ypy7D3kWWtRZaM0bCjJGH/TGC1AGlYce+ArC0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FKvIfsgTCLn2iGe+HpUVx9o6FL0YoXL442NeJHKNz98=;
        b=Xph/Kudx2Ht8SLGsS2tv/zPi43O6V9pwyRPLMsGeJM5zhUIntCvV7v1AdUWkCrjPfg
         JJ9XmjczKT8bCfETA/mWd/vG6BBijlec7KNeMcblzcmk48T6DC9wP6GuC6xuYiwhv/c8
         fNLkHUXdu4mj9AI2n1jG6BkdQk/JYJ2rQ9zaaWPJ52NUAV6cllg9RQPoZndQgi19ue/a
         6LvOXud9COI0CtWtAfAw7P9I7PaTSrDXFgHbNwIkv0t52Y5fpM1DLv+POr6f9w5KblDw
         8lzl+b5Mm25C5Kxj5EEGBfrfWoytOsbxtesDSYomKtve6CsyJt2+yDE8puYF5T3zGhbL
         Zl2w==
X-Gm-Message-State: AO0yUKW01YM+PewSoA+AHwUGHJPPNU9UYMG1OQOetvtNwz/ojTtkItD3
        8AxpVmM0E22SgicgIHikhh+Rkw==
X-Google-Smtp-Source: AK7set8wiMGoS8PVtAcDz5VuT7TAfu74EE9tHJ2M1XbqS6aOtXVUMjlQ7DaXK2j9N9sy4hFYZBu3SA==
X-Received: by 2002:a05:6a20:7d83:b0:bb:cf2f:3b09 with SMTP id v3-20020a056a207d8300b000bbcf2f3b09mr8154537pzj.51.1674744466787;
        Thu, 26 Jan 2023 06:47:46 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a238:3cb1:2156:ef87:8af5])
        by smtp.gmail.com with ESMTPSA id d197-20020a6336ce000000b0042988a04bfdsm823660pga.9.2023.01.26.06.47.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jan 2023 06:47:45 -0800 (PST)
From:   Jagan Teki <jagan@amarulasolutions.com>
To:     Andrzej Hajda <andrzej.hajda@intel.com>,
        Inki Dae <inki.dae@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Frieder Schrempf <frieder.schrempf@kontron.de>,
        Tim Harvey <tharvey@gateworks.com>,
        Adam Ford <aford173@gmail.com>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Marek Vasut <marex@denx.de>
Cc:     Matteo Lisi <matteo.lisi@engicam.com>,
        dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-amarula <linux-amarula@amarulasolutions.com>,
        Jagan Teki <jagan@amarulasolutions.com>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v12 15/18] dt-bindings: display: exynos: dsim: Add NXP i.MX8M Mini/Nano support
Date:   Thu, 26 Jan 2023 20:14:24 +0530
Message-Id: <20230126144427.607098-16-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230126144427.607098-1-jagan@amarulasolutions.com>
References: <20230126144427.607098-1-jagan@amarulasolutions.com>
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

