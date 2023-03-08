Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C8A6C6FD1E
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  8 Mar 2023 16:42:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229706AbjCHQmH (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 8 Mar 2023 11:42:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229737AbjCHQmD (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 8 Mar 2023 11:42:03 -0500
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FF02CB661
        for <linux-samsung-soc@vger.kernel.org>; Wed,  8 Mar 2023 08:41:44 -0800 (PST)
Received: by mail-pl1-x62b.google.com with SMTP id n6so18213790plf.5
        for <linux-samsung-soc@vger.kernel.org>; Wed, 08 Mar 2023 08:41:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1678293704;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J9+K68vVGYL1y84MUHSGLcc6/sOkj/n+u3A2GeF9GDk=;
        b=LyD5OkG+oDGFHYnjo7L/MU2f4woTjPrWPG5HCnfMvPKHNn1kJwDots4/Q78eS8nGiK
         irICwGdQyLCTRIQ7LHhCFZ60ZOa/RH8MC5yCxuBt4E0F8CDlr0WKc23yPUmJTy/WC/eM
         yml80n0/Hs+It5b49kgpVwpNt4ktxqKAl04zM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678293704;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J9+K68vVGYL1y84MUHSGLcc6/sOkj/n+u3A2GeF9GDk=;
        b=QJZPcVEaUbOuHjsmibUFODGO7tIMqH5V0/NszQRDdcAWmdJN6R3JGzdcSx4bb29ta9
         Iv5euOFwt6SvSsHydAoazS4rNCbCKWH3jue5VH3ohfsorhRqCQi9AMLfNXQVF6mvNlLK
         6xsrKToPJFiMqXWb7xOpkfbdThPjvOEgkb0csw3qeawSviBR0saeaNChtfIG9qATFtd+
         aS0xOYNKQROvY21cOFy1elS5HK4/9jtGfcohOvn5YKKqrf7iFEWvLEg5GQMkEnBXE8I3
         jh3DkpqFQu/9WT6/AJbOiFlLl6AXA/EnRvW3Cjy31vdfij0CLFxSk14wQoNTHHYwIno7
         522A==
X-Gm-Message-State: AO0yUKWArylqXZWiHm36t4/1+x8+BdmrdGxPn6xOqEuHJGQCOTN32Imz
        OSCIdKeZJ9aojOmvrzdlpBBGkw==
X-Google-Smtp-Source: AK7set/XTT9PAjpGeHLRBQHmwct361q7u2vrIGqZZUt2Qxs5J5im1FIxTWtXvU2kCtDrW1PWg3FKZw==
X-Received: by 2002:a17:902:e546:b0:19a:7a02:7954 with SMTP id n6-20020a170902e54600b0019a7a027954mr22606648plf.24.1678293704092;
        Wed, 08 Mar 2023 08:41:44 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a8a1:b545:91cc:80b2:f9fe])
        by smtp.gmail.com with ESMTPSA id kq3-20020a170903284300b0019b9a075f1fsm10046540plb.80.2023.03.08.08.41.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Mar 2023 08:41:43 -0800 (PST)
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
Subject: [PATCH v16 15/16] dt-bindings: display: exynos: dsim: Add NXP i.MX8M Plus support
Date:   Wed,  8 Mar 2023 22:09:52 +0530
Message-Id: <20230308163953.28506-16-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230308163953.28506-1-jagan@amarulasolutions.com>
References: <20230308163953.28506-1-jagan@amarulasolutions.com>
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
Changes for v16, v15, v13:
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

