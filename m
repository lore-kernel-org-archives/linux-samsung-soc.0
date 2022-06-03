Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E4C7CCA47F
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  3 Jun 2022 09:50:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243233AbiFCJuK (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 3 Jun 2022 05:50:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243195AbiFCJtz (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 3 Jun 2022 05:49:55 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C159248EC
        for <linux-samsung-soc@vger.kernel.org>; Fri,  3 Jun 2022 02:49:54 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id s6so3331223eja.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 03 Jun 2022 02:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WaLJt1WvpAiKJ7sF3CVE05WSOaNxkvjsdRpKOJWQz3Q=;
        b=w74wUAT9vqdRHGsMZNYQK3D7R/1cOktInyuV3fwhPb7HPQK2zLCUKUUKQhTPs62P1n
         FLnH8MilsWpm0RuOcos8h1k4GpOMYjAuJqyZ4a+4kKQxf4F1obBBA2Pfo5RKyGOVlwt2
         G7mtY3lsidPC2qFBmlvkgOgBuimHJML5s4I2R4kFaQAPFw0AN3iOP/wUmNJelAh+/K3M
         YyGY9T8NwhrcpSGt+umTNtoQkf13Rb+7ZH3hj4/4smvuIFwCckVaDECNJ530f64f2Dgc
         G25AP36CmCteILLGiadoBbi6ixGeJOHLt2i8vNERbxN4DhwcPYxGhYaFxAcaRCSRuigH
         77tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WaLJt1WvpAiKJ7sF3CVE05WSOaNxkvjsdRpKOJWQz3Q=;
        b=Kps0aIwFFgmSDVJYKY+m6eKSyR6pwv9Ba7OOZcXLuSBlqlbIOnT+6mKhKgEeapF5gj
         mtYwjSpNyA2TDXW5lZKIY6FG/F/8Umjkuv1JBqqdLr5hnzTAuJYdRmYGgJIt5BdKnPOj
         QIYZKX2/zDgLy2HbrV2i8rVeE3/Cut5xcxUpH2FZN6YIfti4DdAmHvEYH4441hAEMK9a
         VoBUljT9BQcoMLz26jygLlC1wrVs971unjnp75hRjuc0ZIqEnTX24tSSE3+I/UQ+5mOc
         qtVMikegTHqtKpJ4FoWDbioVS2qNtmvL6ceg8+4SpJh+vKNPU5VYKSwpWeSQHW+fMaOw
         rCvA==
X-Gm-Message-State: AOAM531RD2Fu2ecsjGF1NTJgB9m9twG7wBNko/UZDc4w9jw79w2KR785
        Rpz14M6ixnyNomFCHS4qyLsMdg==
X-Google-Smtp-Source: ABdhPJyzQR9OcqECUT1o4sZ9dbMtCmyD8F4HPSgsDufPrHUEHfgWUWoSq+1elGkdLtHzgNdMTz9rmA==
X-Received: by 2002:a17:907:94d2:b0:6ff:2690:eae9 with SMTP id dn18-20020a17090794d200b006ff2690eae9mr7825022ejc.307.1654249792755;
        Fri, 03 Jun 2022 02:49:52 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id y22-20020aa7ca16000000b0042dcbc3f302sm3669561eds.36.2022.06.03.02.49.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jun 2022 02:49:52 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Ulf Hansson <ulf.hansson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Jaehoon Chung <jh80.chung@samsung.com>,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/3] ARM: dts: exynos: align MMC node name with dtschema
Date:   Fri,  3 Jun 2022 11:49:44 +0200
Message-Id: <20220603094946.509919-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220603094946.509919-1-krzysztof.kozlowski@linaro.org>
References: <20220603094946.509919-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The node names should be generic and MMC controller dtschema expects
"mmc".

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/exynos3250.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/exynos3250.dtsi b/arch/arm/boot/dts/exynos3250.dtsi
index 78dad233ff34..326b9e0ed8d3 100644
--- a/arch/arm/boot/dts/exynos3250.dtsi
+++ b/arch/arm/boot/dts/exynos3250.dtsi
@@ -376,7 +376,7 @@ hsotg: hsotg@12480000 {
 			status = "disabled";
 		};
 
-		mshc_0: mshc@12510000 {
+		mshc_0: mmc@12510000 {
 			compatible = "samsung,exynos5420-dw-mshc";
 			reg = <0x12510000 0x1000>;
 			interrupts = <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>;
@@ -388,7 +388,7 @@ mshc_0: mshc@12510000 {
 			status = "disabled";
 		};
 
-		mshc_1: mshc@12520000 {
+		mshc_1: mmc@12520000 {
 			compatible = "samsung,exynos5420-dw-mshc";
 			reg = <0x12520000 0x1000>;
 			interrupts = <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>;
@@ -400,7 +400,7 @@ mshc_1: mshc@12520000 {
 			status = "disabled";
 		};
 
-		mshc_2: mshc@12530000 {
+		mshc_2: mmc@12530000 {
 			compatible = "samsung,exynos5250-dw-mshc";
 			reg = <0x12530000 0x1000>;
 			interrupts = <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.34.1

