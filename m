Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 765E4C54E94
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 26 Jan 2023 14:48:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229446AbjAZOsR (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 26 Jan 2023 09:48:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231835AbjAZOsP (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 26 Jan 2023 09:48:15 -0500
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFCDA16301
        for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Jan 2023 06:48:11 -0800 (PST)
Received: by mail-pl1-x629.google.com with SMTP id a18so2031101plm.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Jan 2023 06:48:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WWJre9MokG3OwazBJKO8AFvo6cc1OP5hw5VIrxt3xjQ=;
        b=LuI6OpP67H5DxxzNzy/f9orpV3i2pMvWTDYGBNdDw02li0Frn2nfgEd6Lpzg1sgz3S
         xBjMKQd3RVxgZZjN90ipW/IPhuoZr+vjEGC6hkRw7Yc+35Hf0cLCYVErGtg36+rvhKSc
         3NT4WSxCGc2rSznvQ4Lw0hg6BtjSIUfjSrrAs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WWJre9MokG3OwazBJKO8AFvo6cc1OP5hw5VIrxt3xjQ=;
        b=dONtEwHGPJUQbZcp7GbobPNXRLTK8mo9Cj0BUFGQsFSPU5KpBpIpfPEqpbK46F7nEe
         E38fxWJ8oSGNO6s70FUj2hR49Rq3aHzBHDB+7ztPnZ+xf+BndB6WVDpR2fZXVFJLPAd6
         ghOWwcJ2nTm9zPsT9pri8UVlzSybtgRo+tbj6YkxKJxwEhhN2EDBzXoZw3lrjFB33gsG
         kNgA08BFtL9NkUbNc9DtDeH2iNHUB6qjYNuHokifVEvaNjWF9mkWiYHYWvoFtLCnmCd/
         Lwclkq7sFQxwhxzoRSr5ji9dY2ybjQfQnmfyzFfNFXYXgL0MZdlMfjQspAyujDATtdEO
         c8Lw==
X-Gm-Message-State: AO0yUKXRH07DOYN9BDlj/VEKRdvnGuSLSoVY48UaVW/kta4qHkOwuYIZ
        ZjgxAj7A0E3ou/g7lMm540w8cw==
X-Google-Smtp-Source: AK7set/GdOWdGOkGUzErY4GPI2EXHPei2U02oxcKkoPna8tnYMtQ0aF3vC8ST2FEWFeJMqW6jz/zug==
X-Received: by 2002:a05:6a20:3943:b0:a5:7700:2a4a with SMTP id r3-20020a056a20394300b000a577002a4amr2862336pzg.51.1674744491317;
        Thu, 26 Jan 2023 06:48:11 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a238:3cb1:2156:ef87:8af5])
        by smtp.gmail.com with ESMTPSA id d197-20020a6336ce000000b0042988a04bfdsm823660pga.9.2023.01.26.06.48.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jan 2023 06:48:10 -0800 (PST)
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
Subject: [PATCH v12 17/18] dt-bindings: display: exynos: dsim: Add NXP i.MX8M Plus support
Date:   Thu, 26 Jan 2023 20:14:26 +0530
Message-Id: <20230126144427.607098-18-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230126144427.607098-1-jagan@amarulasolutions.com>
References: <20230126144427.607098-1-jagan@amarulasolutions.com>
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

