Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58025C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Sat, 30 Apr 2022 12:19:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355168AbiD3MWm (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 30 Apr 2022 08:22:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355086AbiD3MWl (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 30 Apr 2022 08:22:41 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C73BFAAE31
        for <linux-samsung-soc@vger.kernel.org>; Sat, 30 Apr 2022 05:19:18 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id bv19so19967908ejb.6
        for <linux-samsung-soc@vger.kernel.org>; Sat, 30 Apr 2022 05:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9TmOZP85iLTu54G516uLEfLOVCGZ6t1Dbfj7i4HuW1E=;
        b=dSt00Rl7jBClo5es5EjLGcxwwNQ1tGiubhI9M0Dj6UG0i07YfZlvYR2BqrDLX6Sr4d
         RG4FUjBTWzZkqTgHBFVeXM9ke6qdAo5B1yFQi19H7qAWwNkAvsZKhorsQtu+ks71Dt0g
         xWVq0U7w1EZ4h91PUAvvE+cpme/ivycL6eVYoN6DLIGpWiPHMaJJL+Cqxlbp0OSp9msW
         F/EkQCmeSPBtHw0yePqAaPkBUXDuCguzEhW8XZsI8IqX85Ck0TF05GW+NM2kaiCRG/KD
         121TIF1KLL3puQMGkQjHhXKflABoRLfkjm9DOLhMASCku4s/mZzdOou60KF34ihI3l5X
         3TSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9TmOZP85iLTu54G516uLEfLOVCGZ6t1Dbfj7i4HuW1E=;
        b=yMmIJPUj6FivepCWiFDALs1mWIA3RUFltXq/ypTQEyKLekSroBu3622aJvJ5aUBd0t
         n1ve1t42aMCLwj4yxnpn8wf+Z4cYn2wzOtBOcbZi1MSOh8XVONPvfnyMs/sYDaPZUyVV
         TqKDfKcX+GaQbsPMaGWx6M7RtyI5hp1Yj0E2PqXzz2ut7MxTBZWd/lLv9+ilKxXkitP2
         rG/xU2BGVYFeSZbql62BBIx/WInK9VEMiap6qOEUmZOeSsDyzlZy2pv4O6758UbyEZd7
         dTw5QUTPyTB8an/jzrmszRjh3zqBcjudqK2ldT7Gfv2Apd0Rprid4jN9iu3BEiCE+4uD
         DCGQ==
X-Gm-Message-State: AOAM530WPPnjCiheJvykKbQ3rv+Am0HmNiK31LVZyhE46fNkOvolD+5y
        3NGQqo/+te1if4admgboymUx0Q==
X-Google-Smtp-Source: ABdhPJx3nNK1Ex/Ghj6FecYpj8HHeEm+A206wbjAsc/JZM9gO/J98ja4t24qPF9U50SY6ThbcsWi0w==
X-Received: by 2002:a17:906:581:b0:6ef:aecf:1bd8 with SMTP id 1-20020a170906058100b006efaecf1bd8mr3756393ejn.591.1651321157275;
        Sat, 30 Apr 2022 05:19:17 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id c26-20020a056402159a00b0042617ba63d1sm4059091edv.91.2022.04.30.05.19.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Apr 2022 05:19:16 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Dinh Nguyen <dinguyen@kernel.org>,
        Michal Simek <michal.simek@xilinx.com>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Broadcom Kernel Team <bcm-kernel-feedback-list@broadcom.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v2 7/9] ARM: dts: exynos: drop useless 'dma-channels/requests' properties
Date:   Sat, 30 Apr 2022 14:19:00 +0200
Message-Id: <20220430121902.59895-8-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220430121902.59895-1-krzysztof.kozlowski@linaro.org>
References: <20220430121902.59895-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The pl330 DMA controller provides number of DMA channels and requests
through its registers, so duplicating this information (with a chance of
mistakes) in DTS is pointless.  Additionally the DTS used always wrong
property names which causes DT schema check failures - the bindings
documented 'dma-channels' and 'dma-requests' properties without leading
hash sign.

Reported-by: Rob Herring <robh@kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/exynos3250.dtsi               |  4 ----
 arch/arm/boot/dts/exynos4.dtsi                  |  6 ------
 arch/arm/boot/dts/exynos4210-universal_c210.dts |  2 --
 arch/arm/boot/dts/exynos5250.dtsi               |  8 --------
 arch/arm/boot/dts/exynos5410.dtsi               |  4 ----
 arch/arm/boot/dts/exynos5420.dtsi               | 10 ----------
 6 files changed, 34 deletions(-)

diff --git a/arch/arm/boot/dts/exynos3250.dtsi b/arch/arm/boot/dts/exynos3250.dtsi
index 41bb421e67c2..78dad233ff34 100644
--- a/arch/arm/boot/dts/exynos3250.dtsi
+++ b/arch/arm/boot/dts/exynos3250.dtsi
@@ -429,8 +429,6 @@ pdma0: dma-controller@12680000 {
 			clocks = <&cmu CLK_PDMA0>;
 			clock-names = "apb_pclk";
 			#dma-cells = <1>;
-			#dma-channels = <8>;
-			#dma-requests = <32>;
 		};
 
 		pdma1: dma-controller@12690000 {
@@ -440,8 +438,6 @@ pdma1: dma-controller@12690000 {
 			clocks = <&cmu CLK_PDMA1>;
 			clock-names = "apb_pclk";
 			#dma-cells = <1>;
-			#dma-channels = <8>;
-			#dma-requests = <32>;
 		};
 
 		adc: adc@126c0000 {
diff --git a/arch/arm/boot/dts/exynos4.dtsi b/arch/arm/boot/dts/exynos4.dtsi
index 5fd17bc52321..6f0ca3354e39 100644
--- a/arch/arm/boot/dts/exynos4.dtsi
+++ b/arch/arm/boot/dts/exynos4.dtsi
@@ -676,8 +676,6 @@ pdma0: dma-controller@12680000 {
 			clocks = <&clock CLK_PDMA0>;
 			clock-names = "apb_pclk";
 			#dma-cells = <1>;
-			#dma-channels = <8>;
-			#dma-requests = <32>;
 		};
 
 		pdma1: dma-controller@12690000 {
@@ -687,8 +685,6 @@ pdma1: dma-controller@12690000 {
 			clocks = <&clock CLK_PDMA1>;
 			clock-names = "apb_pclk";
 			#dma-cells = <1>;
-			#dma-channels = <8>;
-			#dma-requests = <32>;
 		};
 
 		mdma1: dma-controller@12850000 {
@@ -698,8 +694,6 @@ mdma1: dma-controller@12850000 {
 			clocks = <&clock CLK_MDMA>;
 			clock-names = "apb_pclk";
 			#dma-cells = <1>;
-			#dma-channels = <8>;
-			#dma-requests = <1>;
 		};
 
 		fimd: fimd@11c00000 {
diff --git a/arch/arm/boot/dts/exynos4210-universal_c210.dts b/arch/arm/boot/dts/exynos4210-universal_c210.dts
index 138d606d58a5..62bf335d5bed 100644
--- a/arch/arm/boot/dts/exynos4210-universal_c210.dts
+++ b/arch/arm/boot/dts/exynos4210-universal_c210.dts
@@ -666,8 +666,6 @@ mdma0: dma-controller@12840000 {
 		clocks = <&clock CLK_MDMA>;
 		clock-names = "apb_pclk";
 		#dma-cells = <1>;
-		#dma-channels = <8>;
-		#dma-requests = <1>;
 		power-domains = <&pd_lcd0>;
 	};
 };
diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index df80ddfada2d..4708dcd575a7 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -700,8 +700,6 @@ pdma0: dma-controller@121a0000 {
 			clocks = <&clock CLK_PDMA0>;
 			clock-names = "apb_pclk";
 			#dma-cells = <1>;
-			#dma-channels = <8>;
-			#dma-requests = <32>;
 		};
 
 		pdma1: dma-controller@121b0000 {
@@ -711,8 +709,6 @@ pdma1: dma-controller@121b0000 {
 			clocks = <&clock CLK_PDMA1>;
 			clock-names = "apb_pclk";
 			#dma-cells = <1>;
-			#dma-channels = <8>;
-			#dma-requests = <32>;
 		};
 
 		mdma0: dma-controller@10800000 {
@@ -722,8 +718,6 @@ mdma0: dma-controller@10800000 {
 			clocks = <&clock CLK_MDMA0>;
 			clock-names = "apb_pclk";
 			#dma-cells = <1>;
-			#dma-channels = <8>;
-			#dma-requests = <1>;
 		};
 
 		mdma1: dma-controller@11c10000 {
@@ -733,8 +727,6 @@ mdma1: dma-controller@11c10000 {
 			clocks = <&clock CLK_MDMA1>;
 			clock-names = "apb_pclk";
 			#dma-cells = <1>;
-			#dma-channels = <8>;
-			#dma-requests = <1>;
 		};
 
 		gsc_0: gsc@13e00000 {
diff --git a/arch/arm/boot/dts/exynos5410.dtsi b/arch/arm/boot/dts/exynos5410.dtsi
index 4d797a9abba4..8a6b890fb8f7 100644
--- a/arch/arm/boot/dts/exynos5410.dtsi
+++ b/arch/arm/boot/dts/exynos5410.dtsi
@@ -196,8 +196,6 @@ pdma0: dma-controller@121a0000 {
 			clocks = <&clock CLK_PDMA0>;
 			clock-names = "apb_pclk";
 			#dma-cells = <1>;
-			#dma-channels = <8>;
-			#dma-requests = <32>;
 		};
 
 		pdma1: dma-controller@121b0000 {
@@ -207,8 +205,6 @@ pdma1: dma-controller@121b0000 {
 			clocks = <&clock CLK_PDMA1>;
 			clock-names = "apb_pclk";
 			#dma-cells = <1>;
-			#dma-channels = <8>;
-			#dma-requests = <32>;
 		};
 
 		audi2s0: i2s@3830000 {
diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
index 21b608705049..9f2523a873d9 100644
--- a/arch/arm/boot/dts/exynos5420.dtsi
+++ b/arch/arm/boot/dts/exynos5420.dtsi
@@ -437,8 +437,6 @@ adma: dma-controller@3880000 {
 			clocks = <&clock_audss EXYNOS_ADMA>;
 			clock-names = "apb_pclk";
 			#dma-cells = <1>;
-			#dma-channels = <6>;
-			#dma-requests = <16>;
 			power-domains = <&mau_pd>;
 		};
 
@@ -449,8 +447,6 @@ pdma0: dma-controller@121a0000 {
 			clocks = <&clock CLK_PDMA0>;
 			clock-names = "apb_pclk";
 			#dma-cells = <1>;
-			#dma-channels = <8>;
-			#dma-requests = <32>;
 		};
 
 		pdma1: dma-controller@121b0000 {
@@ -460,8 +456,6 @@ pdma1: dma-controller@121b0000 {
 			clocks = <&clock CLK_PDMA1>;
 			clock-names = "apb_pclk";
 			#dma-cells = <1>;
-			#dma-channels = <8>;
-			#dma-requests = <32>;
 		};
 
 		mdma0: dma-controller@10800000 {
@@ -471,8 +465,6 @@ mdma0: dma-controller@10800000 {
 			clocks = <&clock CLK_MDMA0>;
 			clock-names = "apb_pclk";
 			#dma-cells = <1>;
-			#dma-channels = <8>;
-			#dma-requests = <1>;
 		};
 
 		mdma1: dma-controller@11c10000 {
@@ -482,8 +474,6 @@ mdma1: dma-controller@11c10000 {
 			clocks = <&clock CLK_MDMA1>;
 			clock-names = "apb_pclk";
 			#dma-cells = <1>;
-			#dma-channels = <8>;
-			#dma-requests = <1>;
 			/*
 			 * MDMA1 can support both secure and non-secure
 			 * AXI transactions. When this is enabled in
-- 
2.32.0

