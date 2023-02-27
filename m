Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A17A5C7EE2D
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 27 Feb 2023 11:41:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229379AbjB0Lli (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 27 Feb 2023 06:41:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229554AbjB0Lli (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 27 Feb 2023 06:41:38 -0500
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A87A16337
        for <linux-samsung-soc@vger.kernel.org>; Mon, 27 Feb 2023 03:41:37 -0800 (PST)
Received: by mail-pj1-x1030.google.com with SMTP id oj5so1828418pjb.5
        for <linux-samsung-soc@vger.kernel.org>; Mon, 27 Feb 2023 03:41:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YcGwdgBk9vWJlF1jRwo2xbD/AgV2OQNG9PS9RocpiKM=;
        b=eq0MbB6PY1NWYnlm9qu/gHlADhn5+6k5/BMuTfRJhMY0iluedtfLRkeBkeRPo23lzZ
         K80IPqUteBrKBtq987B4fQy1zmWirxVU3szpgZPq5duR/vhnT6oFxeDB6jwMjhvudCcP
         IzdD95n3MEGwkEzi+Ip1SjrER4K3ElRABjyi8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YcGwdgBk9vWJlF1jRwo2xbD/AgV2OQNG9PS9RocpiKM=;
        b=eHGf9te7hCvlgPqxxJpLyDS394EcoPpMHRl+3FJdgULonxFwYO2Kohg9Wj/VNp/pVA
         1P8sccb8zwmKYEQMTh/dB5wr9ttJfxOjU7jNNbBszqwF7Cx5Ux4j28x4tMDsBj03f0+9
         QdppVbvZRrNKnAxm8eAh1V0DEH1wm2fjQQ03IrJbXlWNqtqR06wfaFMk6YrpC5a1UK1e
         Yad4Gd6pCSuxFTnXrcxlqgV0qE2O9vBSMR1cnDVOgLZlyEwqtSFMKUBLNh0blhW0OYo1
         pUwOe82JcMB9NOdtiChNRVbU5mfG18nO4W8Z5rR4OZTKRRo1pPFc+/XL5kcE/ccMKNuY
         8Saw==
X-Gm-Message-State: AO0yUKUw0Thasdi9HE0er/n+b7QjESetajE/HysoQH/dlmDTBBooLxQb
        0xYOvlRohbOY+pFRdnKOBRTyfQ==
X-Google-Smtp-Source: AK7set8cPbWkGmpzNAyJDD39zrEKxNMtzV5rzVTu+ylJwiL1oOcrGi5uuyGwDiC5VAvGHz/SWjCuJA==
X-Received: by 2002:a17:902:ec81:b0:19a:a80e:a6d5 with SMTP id x1-20020a170902ec8100b0019aa80ea6d5mr29295112plg.23.1677498096668;
        Mon, 27 Feb 2023 03:41:36 -0800 (PST)
Received: from localhost.localdomain ([94.140.8.120])
        by smtp.gmail.com with ESMTPSA id k10-20020a170902ba8a00b0019c919bccf8sm4395277pls.86.2023.02.27.03.41.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Feb 2023 03:41:36 -0800 (PST)
From:   Jagan Teki <jagan@amarulasolutions.com>
To:     Andrzej Hajda <andrzej.hajda@intel.com>,
        Inki Dae <inki.dae@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Frieder Schrempf <frieder.schrempf@kontron.de>,
        Tim Harvey <tharvey@gateworks.com>,
        Adam Ford <aford173@gmail.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Marek Vasut <marex@denx.de>
Cc:     Matteo Lisi <matteo.lisi@engicam.com>,
        dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-amarula <linux-amarula@amarulasolutions.com>,
        Jagan Teki <jagan@amarulasolutions.com>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v13 17/18] dt-bindings: display: exynos: dsim: Add NXP i.MX8M Plus support
Date:   Mon, 27 Feb 2023 17:09:24 +0530
Message-Id: <20230227113925.875425-18-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230227113925.875425-1-jagan@amarulasolutions.com>
References: <20230227113925.875425-1-jagan@amarulasolutions.com>
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
Changes for v13:
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

