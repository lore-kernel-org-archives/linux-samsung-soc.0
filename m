Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C686C05027
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 23 Jan 2023 12:25:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231552AbjAWMZc (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 23 Jan 2023 07:25:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231550AbjAWMZc (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 23 Jan 2023 07:25:32 -0500
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1A9F903E
        for <linux-samsung-soc@vger.kernel.org>; Mon, 23 Jan 2023 04:25:27 -0800 (PST)
Received: by mail-pj1-x1035.google.com with SMTP id z1-20020a17090a66c100b00226f05b9595so10855568pjl.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 23 Jan 2023 04:25:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qnaYYuZIFXsUXmdUbRbKvrLeFHz42sEEtjfLamyApLo=;
        b=D0y+LyVrWB+GF8Ep6fj6u8kNZZza8H1ohwFvKZ1/rcFqw4wPJkHBzqb3dtqxXTSftO
         JzoK0AKNOfxGg2obYNZ87WUblFA0Ou1wJlPLOTKO47HVw17PozlZTPjAYgiDTUnUgEzn
         dVAWVdIhleA9kI88I/SligcK5Rjre5ElRAQvs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qnaYYuZIFXsUXmdUbRbKvrLeFHz42sEEtjfLamyApLo=;
        b=pOCH0kp05SKxUct7r3Jv8v5C1fHtA9iE1Sk56A0kRMM0kWV+6DLBfMjEUM1ouDDG9G
         PpRcLl7AM94pAaYTl/Vsb5/47ugYWGSfzSLn33qwg/z09x6u6GgQXbbWKCsSavye/A9t
         PDMJ4I19vSk/1vucMgkgxBZzWtunLcysDG6Mv+vIvrGk39usrikezArNt9Gr0uxdxOrz
         Z3NM42wFFCb/0ekWQI9Vt0GnK41A9BD6oH+zjJm0oweLnhVWFqyj/9stlw9e7stDVOWC
         S7S4KedxVtegLF3NTkQXeCZNz+Xnwim8DVcAoLfqithv9O3CGzjCgbQc6rAA+zmIawq/
         1jIA==
X-Gm-Message-State: AFqh2kqVl6jGLwQOIWaYsNXVGNz5MeYn9Z0cSqbLFi9NHkc9Y9DavaO9
        9z4sCUaT05WdypcUROI+qj4SqA==
X-Google-Smtp-Source: AMrXdXtMqOYVwEGpg2hdE0yKaXOX3+EYF/m0wr2OpR6ElLqXf7bKsw6nnmBFO+atAXWZ0Uc19wEoUw==
X-Received: by 2002:a17:902:8d83:b0:193:39bd:df97 with SMTP id v3-20020a1709028d8300b0019339bddf97mr25365747plo.14.1674476726567;
        Mon, 23 Jan 2023 04:25:26 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a15f:2279:f361:f93b:7971])
        by smtp.gmail.com with ESMTPSA id w10-20020a170902e88a00b001960806728asm1291811plg.88.2023.01.23.04.25.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jan 2023 04:25:25 -0800 (PST)
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
Subject: [PATCH v11 15/18] dt-bindings: display: exynos: dsim: Add NXP i.MX8M Mini/Nano support
Date:   Mon, 23 Jan 2023 17:53:16 +0530
Message-Id: <20230123122319.261341-16-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230123122319.261341-1-jagan@amarulasolutions.com>
References: <20230123122319.261341-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Samsung MIPI DSIM bridge can also be found in i.MX8M Mini/Nano SoC.

Add dt-bingings for it.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
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

