Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7B2EC05027
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 23 Jan 2023 15:15:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232367AbjAWPPc (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 23 Jan 2023 10:15:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232249AbjAWPPS (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 23 Jan 2023 10:15:18 -0500
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBC4A2917D
        for <linux-samsung-soc@vger.kernel.org>; Mon, 23 Jan 2023 07:14:36 -0800 (PST)
Received: by mail-pj1-x1029.google.com with SMTP id y3-20020a17090a390300b00229add7bb36so11277857pjb.4
        for <linux-samsung-soc@vger.kernel.org>; Mon, 23 Jan 2023 07:14:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/fLL5kLDpQT734JrRIGe8vuytWc63yzhDCsgQc9jqGc=;
        b=nEts0sut1aayk8eUF5xDk+OkCqUauX2EIleYwoofyR42l5mbnWyayEqUUvRRn0ojOh
         fkis4xwSyHgixmBsOMyBtpC3AtoGTS+uxt1WikDLnCCtK125+YSfFRQwnYuPvAPMh5Gf
         6n4bfEN+H/hkYlpCzmP0ZjCRiQh63iy4uKMy8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/fLL5kLDpQT734JrRIGe8vuytWc63yzhDCsgQc9jqGc=;
        b=avGDpJlV2halTwUxmNElevG0MpWMBu7/3rM3uO87pIqQwJC+FTDWxqNgRF/GT2SNP5
         XOXqS7pXJiXc++L8PCi/3xgFqhyogRGgoV4xdJpDiAAUlgs0l49TpWxLl+AfghozgSUr
         JIBYruaswlcRk2mF3Z+HUWqpUGHO/O3+xCM9CLGGo1qdUqcL/ILduyb2pcxeEJ30sTNR
         ZPTe6Lgp7mRwgVWtCLZc/qBW5yesDYJhJhFV+Bg6FGs9idJSxMfUQedQM/NrVR/eQK0D
         wiIusrU9/oLRAjH769SlSVVXQ1u4fFbcHjI8mHHs2GiXH5yR7rv0jiB8u9KLqlVG5MW8
         lGmg==
X-Gm-Message-State: AFqh2kpiIweIJiMyXQZUz4q0UIpwl8JG+SFoPP1UHC8jHFC4fqchLHUE
        xan5yEE1mvqlCXBhV4Q4qah9GQ==
X-Google-Smtp-Source: AMrXdXvkwQJ7bd/A3sFx7eUiJ5Z4tdjh+opYpkRP28thLVrDEnTAnWjpR6+gEridoiQu9CK8dc77Qg==
X-Received: by 2002:a17:902:8a98:b0:194:9c0d:9732 with SMTP id p24-20020a1709028a9800b001949c0d9732mr25089127plo.46.1674486872941;
        Mon, 23 Jan 2023 07:14:32 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a15f:2279:f361:f93b:7971])
        by smtp.gmail.com with ESMTPSA id d5-20020a170903230500b001754fa42065sm19207111plh.143.2023.01.23.07.14.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jan 2023 07:14:32 -0800 (PST)
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
Subject: [RESEND PATCH v11 17/18] dt-bindings: display: exynos: dsim: Add NXP i.MX8M Plus support
Date:   Mon, 23 Jan 2023 20:42:11 +0530
Message-Id: <20230123151212.269082-18-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230123151212.269082-1-jagan@amarulasolutions.com>
References: <20230123151212.269082-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Samsung MIPI DSIM bridge can also be found in i.MX8M Plus SoC.

Add dt-bingings for it.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
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

