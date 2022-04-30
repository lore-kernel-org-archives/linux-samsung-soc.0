Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FA9FC433FE
	for <linux-samsung-soc@archiver.kernel.org>; Sat, 30 Apr 2022 12:19:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353389AbiD3MXG (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 30 Apr 2022 08:23:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1359836AbiD3MWu (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 30 Apr 2022 08:22:50 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E282EABF4B
        for <linux-samsung-soc@vger.kernel.org>; Sat, 30 Apr 2022 05:19:19 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id i19so19915566eja.11
        for <linux-samsung-soc@vger.kernel.org>; Sat, 30 Apr 2022 05:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FEUaNNHzE9ZBEpoPb2H49jbs7ls4zLcKTGKpF7Ef5aY=;
        b=IG7VNJKG2LAtdHPPgRFQSQBY+AsOe4DgJMH3eoxpjSs9SKgWg1Prw8WF1Av50a/+DA
         BgJdBBonToETYCWyeDrtNhB5v5poDYSojZQawZ979AtF6VrVbRZF/otK4EJWce997VNI
         v1Tm3rA+kjMw+paviRQ730WnWHxoo9JMUPg95uCNITGm0QsHjK5881OZ5Dxja+XQivgZ
         z/SEJ1oNOgVPxY8h7X/eqVsvHVf1sdwP9LxO553jH2E7GMc8AtXoVgYKtkteAwbpJu3t
         KOSy/bFziYuRKx5DYHNHz11k3RcnGxL9+Aa93eUnn9zODVPjzO+cgQg0aA1F1R8GDbVe
         Xznw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FEUaNNHzE9ZBEpoPb2H49jbs7ls4zLcKTGKpF7Ef5aY=;
        b=i2FQJy3jyHbmtuwVxPdrTyMGxb9hZqHrsx/BF6s4TUuJn8HKSGqZAHlh4REZUEGDoK
         r3DXbBfBKlX3gRhM2EJ/IXgpsewbupm0aP0Nf1r1Qn1M9kkJo1QBmPkpMW22hKUmnuYD
         T/qES2VcVfAGGdpUKz4YxgC2M5+1soTpP5joS8SBdrd0Deq8KryTC6MNtI5pTdaBTuoN
         xgPexNVe2CndAxxeZ/7zzRawFdscIiTV0fOxG+4Wv1JoVRpNSsSQWFOD3ncdjvmxpHg1
         yHxzVcjjXead5MLJTxSN/DHIulVrEtW0r9dh7Fvayo1dSSA4OJQDLg2erXc7JVS6MFB2
         122A==
X-Gm-Message-State: AOAM530CMzfyJ//aENYhD0+8RIUZpn4G7bEzzUnv+UB9EYrQgQtCKzmk
        AdlNesgtEs8w4zXh7WcsS9ME4A==
X-Google-Smtp-Source: ABdhPJxItSAcw2+jyJJZYG3zIcYy0nrnl111gz9oeVOAm11XmeU4okKLgbMy+7RUHY07C+OnYfrwyA==
X-Received: by 2002:a17:906:6097:b0:6f3:ee8d:b924 with SMTP id t23-20020a170906609700b006f3ee8db924mr3704773ejj.536.1651321158446;
        Sat, 30 Apr 2022 05:19:18 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id c26-20020a056402159a00b0042617ba63d1sm4059091edv.91.2022.04.30.05.19.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Apr 2022 05:19:18 -0700 (PDT)
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
Subject: [PATCH v2 8/9] arm64: dts: exynos: drop useless 'dma-channels/requests' properties
Date:   Sat, 30 Apr 2022 14:19:01 +0200
Message-Id: <20220430121902.59895-9-krzysztof.kozlowski@linaro.org>
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
 arch/arm64/boot/dts/exynos/exynos5433.dtsi | 6 ------
 arch/arm64/boot/dts/exynos/exynos7.dtsi    | 4 ----
 2 files changed, 10 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos5433.dtsi b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
index 017ccc2f4650..75b548e495a0 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
@@ -1866,8 +1866,6 @@ pdma0: dma-controller@15610000 {
 			clocks = <&cmu_fsys CLK_PDMA0>;
 			clock-names = "apb_pclk";
 			#dma-cells = <1>;
-			#dma-channels = <8>;
-			#dma-requests = <32>;
 		};
 
 		pdma1: dma-controller@15600000 {
@@ -1877,8 +1875,6 @@ pdma1: dma-controller@15600000 {
 			clocks = <&cmu_fsys CLK_PDMA1>;
 			clock-names = "apb_pclk";
 			#dma-cells = <1>;
-			#dma-channels = <8>;
-			#dma-requests = <32>;
 		};
 
 		audio-subsystem@11400000 {
@@ -1898,8 +1894,6 @@ adma: dma-controller@11420000 {
 				clocks = <&cmu_aud CLK_ACLK_DMAC>;
 				clock-names = "apb_pclk";
 				#dma-cells = <1>;
-				#dma-channels = <8>;
-				#dma-requests = <32>;
 				power-domains = <&pd_aud>;
 			};
 
diff --git a/arch/arm64/boot/dts/exynos/exynos7.dtsi b/arch/arm64/boot/dts/exynos/exynos7.dtsi
index e38bb02a2152..1cd771c90b47 100644
--- a/arch/arm64/boot/dts/exynos/exynos7.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos7.dtsi
@@ -149,8 +149,6 @@ pdma0: dma-controller@10e10000 {
 			clocks = <&clock_fsys0 ACLK_PDMA0>;
 			clock-names = "apb_pclk";
 			#dma-cells = <1>;
-			#dma-channels = <8>;
-			#dma-requests = <32>;
 		};
 
 		pdma1: dma-controller@10eb0000 {
@@ -160,8 +158,6 @@ pdma1: dma-controller@10eb0000 {
 			clocks = <&clock_fsys0 ACLK_PDMA1>;
 			clock-names = "apb_pclk";
 			#dma-cells = <1>;
-			#dma-channels = <8>;
-			#dma-requests = <32>;
 		};
 
 		clock_topc: clock-controller@10570000 {
-- 
2.32.0

