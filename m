Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9A16C001DE
	for <linux-samsung-soc@archiver.kernel.org>; Sun,  2 Jul 2023 18:50:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230027AbjGBSuV (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 2 Jul 2023 14:50:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229608AbjGBSuU (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 2 Jul 2023 14:50:20 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44168C6
        for <linux-samsung-soc@vger.kernel.org>; Sun,  2 Jul 2023 11:50:19 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-51dd1e5a621so4822863a12.0
        for <linux-samsung-soc@vger.kernel.org>; Sun, 02 Jul 2023 11:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688323817; x=1690915817;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/TlbZCUxLEVw4FifHQ/JNS9kwDMuJoBzQkocIllcfhE=;
        b=vx0L9CdyD3K0C0MAtFyGRioJEpB4eWjLV2HfaOid1hr2yYS7WbVPLrot8pOQKzB58Z
         VaNW6pokt/uBV5IJYIXhXDD/Smi74aE+sXX4PIOsEZhjmEwsSufm7eFITe8ZTbPMChLx
         Hp8pLRoG0lwwjgrKaT3PCzLT9goP7xTrPdMqnBB6V84aKl3oKcAmnlIx4S1PmgFs+ISo
         adjtgpsUFNJzXST8b45qk5FnAu+OGBQ5vmL12n4YEpfIs1dBkxwtgcPPTapl5XazbQs6
         gg5+TdktwMAwGNvH5s5g7iNaGP/39fd/36RQNM/E6YZkQ4yQXl8jYwhpQgXB0JJnmC5y
         eCNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688323817; x=1690915817;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/TlbZCUxLEVw4FifHQ/JNS9kwDMuJoBzQkocIllcfhE=;
        b=iFUd7CayYbuJGbMBN1HEXStfPgJ2TRp7JufP4P5S1dWrWrE7Ue76GMt5jTiEkKNqTp
         f0DQ19QkLFbnqVPkj2R+kiZr9ZBhuxP6Me/3cEHHHtjf4T52tqTdyHnDJLWcX+P9Nec9
         v9vEPVypWybSvC9zTcwesBT+YjPw2spPNS1BGyXv/iO7teMFKYxAOlyYv3ljhO+Hhfed
         yGK1hpsJ9LUG8WJskV5WHXBTxxpKlW0/7jYgDr9lznPWbh8OrPK8ZL51MxaNiMKojXgD
         eKfAu/PyUIUupnSgesR3yhNRgWRZPJ0AKVj88Lphw8GMZfrJg+bBpfvuDAmWm0193hCp
         2nog==
X-Gm-Message-State: ABy/qLZ+thK1TBHCDrzRGCp+wMpFUfYob16tOMYNo6s94ITXXrjw0Hx+
        /PhidSgawrWJdClLXK7Jaa42Lg==
X-Google-Smtp-Source: ACHHUZ683Q1RqnhaKPhFMhO4V8NGltz55aX1mf/jrC6Vs32hwNaTK2R+mERPVKd+1IA6wyyGn4c5LQ==
X-Received: by 2002:a17:907:9859:b0:991:e3c4:c129 with SMTP id jj25-20020a170907985900b00991e3c4c129mr6114067ejc.69.1688323817741;
        Sun, 02 Jul 2023 11:50:17 -0700 (PDT)
Received: from krzk-bin.. ([217.169.179.6])
        by smtp.gmail.com with ESMTPSA id k25-20020a17090666d900b00982842ea98bsm10861789ejp.195.2023.07.02.11.50.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jul 2023 11:50:17 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>, linux-fsd@tesla.com,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 3/4] ARM: dts: exynos: minor whitespace cleanup around '='
Date:   Sun,  2 Jul 2023 20:50:11 +0200
Message-Id: <20230702185012.43699-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230702185012.43699-1-krzysztof.kozlowski@linaro.org>
References: <20230702185012.43699-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The DTS code coding style expects exactly one space before and after '='
sign.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/samsung/exynos4210-trats.dts          | 8 ++++----
 arch/arm/boot/dts/samsung/exynos4210-universal_c210.dts | 4 ++--
 arch/arm/boot/dts/samsung/exynos4412-midas.dtsi         | 2 +-
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm/boot/dts/samsung/exynos4210-trats.dts b/arch/arm/boot/dts/samsung/exynos4210-trats.dts
index bfb04b31e11b..95e0e01b6ff6 100644
--- a/arch/arm/boot/dts/samsung/exynos4210-trats.dts
+++ b/arch/arm/boot/dts/samsung/exynos4210-trats.dts
@@ -20,10 +20,10 @@ / {
 
 	memory@40000000 {
 		device_type = "memory";
-		reg =  <0x40000000 0x10000000
-			0x50000000 0x10000000
-			0x60000000 0x10000000
-			0x70000000 0x10000000>;
+		reg = <0x40000000 0x10000000
+		       0x50000000 0x10000000
+		       0x60000000 0x10000000
+		       0x70000000 0x10000000>;
 	};
 
 	aliases {
diff --git a/arch/arm/boot/dts/samsung/exynos4210-universal_c210.dts b/arch/arm/boot/dts/samsung/exynos4210-universal_c210.dts
index c84af3d27c1c..bdc30f8cf748 100644
--- a/arch/arm/boot/dts/samsung/exynos4210-universal_c210.dts
+++ b/arch/arm/boot/dts/samsung/exynos4210-universal_c210.dts
@@ -20,8 +20,8 @@ / {
 
 	memory@40000000 {
 		device_type = "memory";
-		reg =  <0x40000000 0x10000000
-			0x50000000 0x10000000>;
+		reg = <0x40000000 0x10000000
+		       0x50000000 0x10000000>;
 	};
 
 	aliases {
diff --git a/arch/arm/boot/dts/samsung/exynos4412-midas.dtsi b/arch/arm/boot/dts/samsung/exynos4412-midas.dtsi
index e6b949c1a00f..57836d5554d0 100644
--- a/arch/arm/boot/dts/samsung/exynos4412-midas.dtsi
+++ b/arch/arm/boot/dts/samsung/exynos4412-midas.dtsi
@@ -990,7 +990,7 @@ &mshc_0 {
 
 &pmu_system_controller {
 	assigned-clocks = <&pmu_system_controller 0>;
-	assigned-clock-parents =  <&clock CLK_XUSBXTI>;
+	assigned-clock-parents = <&clock CLK_XUSBXTI>;
 };
 
 &pinctrl_0 {
-- 
2.34.1

