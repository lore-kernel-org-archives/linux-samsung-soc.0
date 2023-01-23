Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81777C05027
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 23 Jan 2023 15:15:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232385AbjAWPPZ (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 23 Jan 2023 10:15:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232420AbjAWPPI (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 23 Jan 2023 10:15:08 -0500
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9ECF29435
        for <linux-samsung-soc@vger.kernel.org>; Mon, 23 Jan 2023 07:14:19 -0800 (PST)
Received: by mail-pj1-x102b.google.com with SMTP id o13so11964771pjg.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 23 Jan 2023 07:14:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qnaYYuZIFXsUXmdUbRbKvrLeFHz42sEEtjfLamyApLo=;
        b=GURlAgANBySQsWTDa3ZEndLod0am2tncVXCMXw7HbCWiLq524Tx8wNrnGjp5csKFTw
         Cu/zeP65ctptGGh4rA70a1VBhy+7b5Wm3u8ui6kXR7n9YVh42O3civyrCRevr5fYTwqM
         9099C8vzcM5s2D8HWfZ6IvqijuiaYPgCq/w/c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qnaYYuZIFXsUXmdUbRbKvrLeFHz42sEEtjfLamyApLo=;
        b=TI+lIhBG4MNgtU7jUi52xGh5ab/wLC/spj11yAtM5uTfN8ik8emx0NYMfDo7/6YKMo
         a37lTrb2Y2zLxOfwZKXGyuS3Z+x8e9xTSgbCFJpBrfr6ZD0hV4O4myAiPP28ZQPMahIz
         UCeq+9d83AbhRWfOIv2FjXyhaAeRE6YLrqVJ0bePxLcVGbYlmYMidNJVdlv/ubME10wm
         bQuakOhcAtUtohKKDI/7YuR4gNSDzfCX+gc96Hui6/qZSH0zXfJdGuIQrcweNU+Cw47I
         Z70H26DwizS3Bdlrv3W1dE+W4o3r/MOAYZGPE8Knx9BASFcOOaaZzqPsVx5h+mkXelmY
         ow8g==
X-Gm-Message-State: AFqh2kreXfU0OF/qt2wWDjvVwftWXoEiMzAxTZ8pBQ9VOPFmqfNgmryU
        lWGAq7k/8fbzvNNe4t0Nf1ytUg==
X-Google-Smtp-Source: AMrXdXuGNjci1R0MZEqOx2/BRSxuIHEtG1jvwqN/VE5h1x0FRBIwTS+XvG7wMKrtjPxrTAp6gqd6JA==
X-Received: by 2002:a17:902:c10d:b0:194:4986:a3db with SMTP id 13-20020a170902c10d00b001944986a3dbmr26552672pli.36.1674486858564;
        Mon, 23 Jan 2023 07:14:18 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a15f:2279:f361:f93b:7971])
        by smtp.gmail.com with ESMTPSA id d5-20020a170903230500b001754fa42065sm19207111plh.143.2023.01.23.07.14.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jan 2023 07:14:18 -0800 (PST)
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
Subject: [RESEND PATCH v11 15/18] dt-bindings: display: exynos: dsim: Add NXP i.MX8M Mini/Nano support
Date:   Mon, 23 Jan 2023 20:42:09 +0530
Message-Id: <20230123151212.269082-16-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230123151212.269082-1-jagan@amarulasolutions.com>
References: <20230123151212.269082-1-jagan@amarulasolutions.com>
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

