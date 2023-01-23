Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62C05C54EB4
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 23 Jan 2023 12:25:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231529AbjAWMZo (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 23 Jan 2023 07:25:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230399AbjAWMZn (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 23 Jan 2023 07:25:43 -0500
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13D4A9031
        for <linux-samsung-soc@vger.kernel.org>; Mon, 23 Jan 2023 04:25:43 -0800 (PST)
Received: by mail-pl1-x631.google.com with SMTP id v23so11231134plo.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 23 Jan 2023 04:25:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JuAkIl3E2ey/s75s7oYOplfV/lJ9MjzovrFiMl1t5rU=;
        b=ehpWXV4BsKzkZHbvPlvG18NbwFRfked5hvKRXfLq2zfWYO2Mk73/Emka1k3FrSG0qr
         yvfBHp3spEV/mZnlKrrSZC/+PYI7ooVFN5Pccb8pC1xq+lyREMmGSeajrbiKfTnRdsey
         g4qNitXxsfMuPukXvgO+6C1cPtmiQCouoiRTo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JuAkIl3E2ey/s75s7oYOplfV/lJ9MjzovrFiMl1t5rU=;
        b=XNz4LGs144EeaqWa5SqcyVYtmTl1GA62vbBgK0C6xGxlAfk191oWD27DFTOKSzrnIx
         K09yXl9+bHe85PTAVxU27HOVC4xR63kpacaEYNh9sonyMhZIbabrq1KERp9lVzIXgZ8d
         nWYZsyFJJZTicjLqwYGaCpasbQxPVopfz8Nic7YdwMINBjopH7RGxnDGUKF9Pk+TCEhF
         C51RO0FLF0ZOyXZAdppSWOB31HZ/oVjnmDcZPWdthanWlV11NlJNPMdrGhZhsqkajHJ2
         GQTsXwslihsxDJETynxiOiGnm7iuP0oTyad47vYyvXmXRso9w0HA8nt4U7SQ6V/bSxQj
         aqhw==
X-Gm-Message-State: AFqh2kpisVLA3/ibc8Uxr8v77qx1v/J6pI8si0adfDSNtaM7qVC0XZXm
        HvMVq3aux1KENjtcPWh7r13vVQ==
X-Google-Smtp-Source: AMrXdXviHKE82QjvafBUDNqEb+nWAmQXATyfeOenrC+Op3TFBjQyGKY4cJcp3qfgKePPjMT6scMkQA==
X-Received: by 2002:a17:902:e548:b0:194:751f:3e89 with SMTP id n8-20020a170902e54800b00194751f3e89mr35040470plf.63.1674476742444;
        Mon, 23 Jan 2023 04:25:42 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a15f:2279:f361:f93b:7971])
        by smtp.gmail.com with ESMTPSA id w10-20020a170902e88a00b001960806728asm1291811plg.88.2023.01.23.04.25.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jan 2023 04:25:41 -0800 (PST)
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
Subject: [PATCH v11 17/18] dt-bindings: display: exynos: dsim: Add NXP i.MX8M Plus support
Date:   Mon, 23 Jan 2023 17:53:18 +0530
Message-Id: <20230123122319.261341-18-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230123122319.261341-1-jagan@amarulasolutions.com>
References: <20230123122319.261341-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Samsung MIPI DSIM bridge can also be found in i.MX8M Plus SoC.

Add dt-bingings for it.

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

