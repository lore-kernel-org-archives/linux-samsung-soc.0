Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6352C4332F
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 10 Nov 2022 18:41:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229973AbiKJSlf (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 10 Nov 2022 13:41:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229757AbiKJSle (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 10 Nov 2022 13:41:34 -0500
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF28E19C0B
        for <linux-samsung-soc@vger.kernel.org>; Thu, 10 Nov 2022 10:41:33 -0800 (PST)
Received: by mail-pj1-x1031.google.com with SMTP id b1-20020a17090a7ac100b00213fde52d49so2450316pjl.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 10 Nov 2022 10:41:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W5IVp1MDfQ3jiErdrhdd9wfvmibtzkcHb8CP2mX46Mg=;
        b=TqyJO/2TPjhePxJuIr6UGBjZEF1cVqa5tRYJYiK30IM7Qex4fe0FkZB1kEFzRk00jO
         aq1HDVncgzW10eRjda6HWSdz6/jRayzyKkjYn9iT0ClvML8DRfVq83o+u8aXNAVKtcjo
         db/y31E1FVSN9Mho+xxnnuhAkjLHS/nku5U6M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W5IVp1MDfQ3jiErdrhdd9wfvmibtzkcHb8CP2mX46Mg=;
        b=g5vFq/ffvaIYomy/1ZMTBKKOtolIvVps3Bzt0+PMGzdG/cBKZvFSp41qsd15Xe1toB
         RvMW2DFnxzaHdLPU7Rk7eFzfzYMkKk+eyNPU+96JQEnRzChkyfZWPLxrZHa2IZlUKKpa
         8wmAw8eHTxRlr5cXvEo+2AnettJG9CDpw4ZcET5j839QoOMq/nHFydVsowUV4KuiUC+4
         pCvnTjsVCVJ7vwq42c0ef0PNjd6aLZ2gLIfZZF1S1NycihbZ8/c7A0J14EIIhkHG+2Nw
         +jWS8lKdweeuiQKG5gFik7W/vrr36HVf8is155HJKIBg5kDfbmdJ/FrU0Z2M/AQUxzuy
         FLaw==
X-Gm-Message-State: ANoB5pkitW1ERkzcdhIzGfxnjEQ/I5xmJ186RTAOlFh6OIXXa12UOdt1
        MjpjJjGZJMCTC7Kdpa3FEZ4qeedrpoW1sBk4
X-Google-Smtp-Source: AA0mqf7jMH4MZRPkHb9D3lL/p2OidQ8oQzollWBrRPl5eWSOwD+NE4vfq8zYFR6EzXbHbAhMRgME/w==
X-Received: by 2002:a17:902:c211:b0:188:9806:2dfa with SMTP id 17-20020a170902c21100b0018898062dfamr4353858pll.10.1668105693275;
        Thu, 10 Nov 2022 10:41:33 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a809:b5a4:486a:f07:f67e])
        by smtp.gmail.com with ESMTPSA id c2-20020a170903234200b001869efb722csm11635627plh.215.2022.11.10.10.41.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Nov 2022 10:41:32 -0800 (PST)
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
Subject: [PATCH v8 11/14] dt-bindings: display: exynos: dsim: Add NXP i.MX8M Mini/Nano support
Date:   Fri, 11 Nov 2022 00:08:50 +0530
Message-Id: <20221110183853.3678209-12-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221110183853.3678209-1-jagan@amarulasolutions.com>
References: <20221110183853.3678209-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Samsung MIPI DSIM bridge can also be found in i.MX8M Mini/Nano SoC.

Add dt-bingings for it.

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

