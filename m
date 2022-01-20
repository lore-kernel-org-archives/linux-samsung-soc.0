Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3E21C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 20 Jan 2022 17:58:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233252AbiATR6E (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 20 Jan 2022 12:58:04 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:40670
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233243AbiATR6A (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 20 Jan 2022 12:58:00 -0500
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id A1B0F40045
        for <linux-samsung-soc@vger.kernel.org>; Thu, 20 Jan 2022 17:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1642701477;
        bh=OI1v3v2do2JpaG4iEWGXiW3KIkLzyCyv5Mi1khRNczo=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=F0Af22Kr9s4m1CjA5dsY7uYb0qRX20SgOqXuPYyDSNRWmF/MIxPvAKjWVpsn8IZH4
         9fMzCDxNfGMDVDkh7pbhiSKx+kewANR/tNe3K5i4FgZlWZ7CDIHlWKCeWZPLjA94Pg
         G9gOIHSqSfGcL8tadZte0TN46c+HWBMQLvMWcQBfIOJZ8dJz1TWbIdxyIC3wjVlEUp
         IVXO2p1CsRHwC9NU5H8bYsm00CBQv3K6iu/VqhPouUiuuxgOUD2wlhSEnBUdhgHggT
         iyYcGJ90+mMysv9VcFLcPGgI9PQSYP7otSytFRh+CE3YpuzOvCJJBOF7hcIL7rasPR
         JZtVWA0jup2tw==
Received: by mail-wm1-f71.google.com with SMTP id v190-20020a1cacc7000000b0034657bb6a66so3256792wme.6
        for <linux-samsung-soc@vger.kernel.org>; Thu, 20 Jan 2022 09:57:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OI1v3v2do2JpaG4iEWGXiW3KIkLzyCyv5Mi1khRNczo=;
        b=U5tywkRTzzZndADfm1J5PaxxW7NAgfPf11gWN7RDEGJFNT7VnycHM9911rO4bNDYzB
         nR8HDlxYvMK1yADdHAru8acbFteO2Gy9gIxOdyE8zIcHbIORejHn/NSzycu1Q/q0STHO
         XBgtB+EA4DZqIosnXJUkjrbisNLea3g6rn7U73dIjGw4iVtW2ijWSOuweh9K1PL45ZBN
         48xQyxsmUWrnT8i5bg05BtdywHa1uiGIE/YtRo2YNK3ypYFAWZrUbpp1Y8o3WcORg+8J
         G6UQppQeKCm58L2C2GpGcZ9U4vMl0uFNg6rXyREJDzewCIVghurcpfo3HGrSgvUAsF3P
         pDRw==
X-Gm-Message-State: AOAM53157KcaM19dCsf1AOOO/g0B0y/pmsw1ES+8QzP268hpP/HbjXXe
        NnVat1JVZ/Q+Bnc47tTXl/J3CSX3jk+4QQ+znZ3/WwZa1WhN/O7ET4eoXXUNNv35kATCuv97pjB
        zmMb2WlBopDdO/aEfpdkrroVb4DtNYokow37YgS6/OI9mQgZW
X-Received: by 2002:a1c:4d0e:: with SMTP id o14mr6741wmh.1.1642701473511;
        Thu, 20 Jan 2022 09:57:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzmTsqY8bb8HLxL6NNBjcVpHEecqLr4GeD0bg1kTvShl9on4V8QSt4DHHPqVOEBS9tMoc/Fcw==
X-Received: by 2002:a1c:4d0e:: with SMTP id o14mr6723wmh.1.1642701473346;
        Thu, 20 Jan 2022 09:57:53 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id a15sm3345248wrp.41.2022.01.20.09.57.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jan 2022 09:57:52 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        Benson Leung <bleung@chromium.org>,
        Guenter Roeck <groeck@chromium.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Andi Shyti <andi@etezian.org>, Mark Brown <broonie@kernel.org>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Pratyush Yadav <p.yadav@ti.com>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-spi@vger.kernel.org
Cc:     Alim Akhtar <alim.akhtar@samsung.com>
Subject: [PATCH v5 1/4] ARM: dts: exynos: split dmas into array of phandles in Exynos5250
Date:   Thu, 20 Jan 2022 18:57:44 +0100
Message-Id: <20220120175747.43403-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220120175747.43403-1-krzysztof.kozlowski@canonical.com>
References: <20220120175747.43403-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

"dmas" property should be rather an array of phandles, as dtschema
points.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Reviewed-by: Andi Shyti <andi@etezian.org>
Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>
---
 arch/arm/boot/dts/exynos5250.dtsi | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index 139778928b93..102bb57bf704 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -496,8 +496,7 @@ spi_0: spi@12d20000 {
 			status = "disabled";
 			reg = <0x12d20000 0x100>;
 			interrupts = <GIC_SPI 66 IRQ_TYPE_LEVEL_HIGH>;
-			dmas = <&pdma0 5
-				&pdma0 4>;
+			dmas = <&pdma0 5>, <&pdma0 4>;
 			dma-names = "tx", "rx";
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -512,8 +511,7 @@ spi_1: spi@12d30000 {
 			status = "disabled";
 			reg = <0x12d30000 0x100>;
 			interrupts = <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>;
-			dmas = <&pdma1 5
-				&pdma1 4>;
+			dmas = <&pdma1 5>, <&pdma1 4>;
 			dma-names = "tx", "rx";
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -528,8 +526,7 @@ spi_2: spi@12d40000 {
 			status = "disabled";
 			reg = <0x12d40000 0x100>;
 			interrupts = <GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH>;
-			dmas = <&pdma0 7
-				&pdma0 6>;
+			dmas = <&pdma0 7>, <&pdma0 6>;
 			dma-names = "tx", "rx";
 			#address-cells = <1>;
 			#size-cells = <0>;
-- 
2.32.0

