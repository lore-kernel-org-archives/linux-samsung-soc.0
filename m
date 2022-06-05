Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54499CCA47F
	for <linux-samsung-soc@archiver.kernel.org>; Sun,  5 Jun 2022 16:37:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346126AbiFEQhW (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 5 Jun 2022 12:37:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351260AbiFEQhU (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 5 Jun 2022 12:37:20 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B75B513F60
        for <linux-samsung-soc@vger.kernel.org>; Sun,  5 Jun 2022 09:37:17 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id fu3so23306563ejc.7
        for <linux-samsung-soc@vger.kernel.org>; Sun, 05 Jun 2022 09:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kLBqK+sVHzWIIm5nOxMG+Dh2jn0qvbbmZtBkyosv5yg=;
        b=QZGzB5GulN3hGDiDLmNiJ6dfpnmU7aXQXZLlHqbWfkV0U0TXe1DJEsfWeJcWj4qfw9
         xv8ikbJ9i+OIuwv16arEwfV5FNu6YewNe13GNTacFqHHJ4Z/ph2DPTKewozv/no2QN/h
         Ojc0Ik/ZtR3Oo9BKbGioelha1MMmih9/Cil0ZAY/M1JfXrxmtRF6c/7L7DKXStW3Gn9Q
         mCCeUiUSwAsKvhGpQ2Y6ISPl/d/aqHcY0NGt1oF1an4HagED8OKRBmOmRhbN0o9kNq52
         qb0LZsM/ZOvSSNs2c85sT/Z+RP73iVvlf4Ui7t3YV47yivEWAzR2odjNztVKQiakl1Wp
         8jJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kLBqK+sVHzWIIm5nOxMG+Dh2jn0qvbbmZtBkyosv5yg=;
        b=GJsu+BEPPdLR3is8IrIYyiy/0AMLHQUTCCiNjdw0+BDH6/nomyJqpJNFG+4ppCvJpN
         adWDf4OSTGgbSauq3ZVVH/bOU3ZpIATsfG/n7JysnSlw1zJC2V8MYyXnwqyDg5XDf89G
         VMePdEqJSy/fgBFW+H8wmtWcGPNc7M0mZ8X3qFcJyelAGXOsAhIsESIfBD7M140k8BaZ
         2ZfgJgzwB//fBGCWcglsOqMYFrNnnE0Cl0JUh9yAFY/7lMT5jkgOHuYZAhtG6vTb2tsX
         7A2UC2eGwTfMnX3T9IBAhSRPLrQeGADO5Jkp2P37VfI4pdzAopBzVcSYsnZ9vnd4tifL
         08FQ==
X-Gm-Message-State: AOAM531en65EM+FQbtMmvmlo9Qs6DyjRA2TomGQZGYAMlaS9oQeHOof6
        eOMz00Jvwiy0az4+LH8zcWURUw==
X-Google-Smtp-Source: ABdhPJw0vMT3Z5as/3FZQ7GtHPAJkrpVc6moQUIzNKf75xDddQKMgwbZ1pmtCRgnI2Xr+q3ImBW3VQ==
X-Received: by 2002:a17:907:2ce3:b0:6ff:153f:5372 with SMTP id hz3-20020a1709072ce300b006ff153f5372mr18355052ejc.197.1654447036327;
        Sun, 05 Jun 2022 09:37:16 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id w3-20020a1709064a0300b006ff0b457cdasm5346770eju.53.2022.06.05.09.37.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jun 2022 09:37:15 -0700 (PDT)
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
Subject: [PATCH v2 1/4] ARM: dts: exynos: align MMC node name with dtschema
Date:   Sun,  5 Jun 2022 18:37:07 +0200
Message-Id: <20220605163710.144210-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220605163710.144210-1-krzysztof.kozlowski@linaro.org>
References: <20220605163710.144210-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The node names should be generic and MMC controller dtschema expects
"mmc".

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>
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

