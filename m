Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97A90C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 27 Apr 2022 15:59:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241498AbiD0QCm (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 27 Apr 2022 12:02:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241363AbiD0QCc (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 27 Apr 2022 12:02:32 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDEC8174F4C
        for <linux-samsung-soc@vger.kernel.org>; Wed, 27 Apr 2022 08:59:04 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id a21so2488681edb.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 27 Apr 2022 08:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=63VeYgzArcJTAJPbGvfo3jR2495WIely7Cl6nb2vvt4=;
        b=ptUeoIdrGVpAlxgfm3SHHA/2ZZYRkB1tr41w4xLCIFu+v1tBxUR8EKRrA22d3aqLFK
         lHkr2M/0Ek9Gxz9mNDmxnyddPkTpB0zAwH4h5WgmXXPWVRvQzP+bn3PGIy+1ttDo0NHu
         6NpRv8nG57JtjPD5P/mxp2lYiGubwu1ugphT9FhhFJ+WUkkD3uwEFdK4rsIESN+SaZVj
         mTXG08wUSyIs9KZopuUHhutWfHyGXi6kU7sWj/yfWgVFoT8Nsb6mpPSq7qoHEhrgVsvR
         g/sBCyVF7QRkcvnpuYXY7h2qhmhqKqeK/RnhXz1Ut2JLcG4G7XudGpe2wrMMhvb7mCfp
         STxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=63VeYgzArcJTAJPbGvfo3jR2495WIely7Cl6nb2vvt4=;
        b=lOfln+MZvN0m0y+yPrvpomYBYjqqybvFYk8kzzwJ4Z7b4LBo6z6BYYgjjiRk1C7CVa
         66s+Ds/yROa6svPyqJC0Kz8jE2CsgPLjUF4RUCj9fBSd8oH7GX2XVBIF4kM6KMb/bTwS
         aCzFt5gAeC0JdQvxsbLCdY/sZB12Ngt5xx5N5uhqOC29cZBO613fC3EoN2yOM5HP3bXL
         w42Zlzdi05JmegqkRWyt2jXQO8mKgz94gfDtLrfKslQgTHeke/sUEfw6od1zU+UBsYGO
         8QEDMXIE3nAE8cVAypj0t9pKTz04nWzXKtSkKWCwD8xwu3JF3YgLzeRz95jJSjDdZ11J
         aNWw==
X-Gm-Message-State: AOAM531Btmoa/lmLMQJQJA+of1ze3VMlH7U45/Ubvyw53UWQUW9VXIDs
        AV0slTN539uke9ysK4dZ6ONI4g==
X-Google-Smtp-Source: ABdhPJzy/efEMnS4dAAty/FMYgqViLiv7F+JrXcmW96LxbDzDhkVE0m0Uv5c16HuMio/TX6Np4dhZA==
X-Received: by 2002:a05:6402:524e:b0:423:e919:8eb4 with SMTP id t14-20020a056402524e00b00423e9198eb4mr31487595edd.153.1651075140245;
        Wed, 27 Apr 2022 08:59:00 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id l20-20020a1709062a9400b006ce71a88bf5sm6931993eje.183.2022.04.27.08.58.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Apr 2022 08:58:59 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
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
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH 09/10] arm64: dts: exynos: use proper 'dma-channels/requests' properties
Date:   Wed, 27 Apr 2022 17:58:39 +0200
Message-Id: <20220427155840.596535-10-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220427155840.596535-1-krzysztof.kozlowski@linaro.org>
References: <20220427155840.596535-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

pl330 DMA controller bindings documented 'dma-channels' and
'dma-requests' properties (without leading hash sign), so fix the DTS to
match the bindings.

Reported-by: Rob Herring <robh@kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/exynos/exynos5433.dtsi | 12 ++++++------
 arch/arm64/boot/dts/exynos/exynos7.dtsi    |  8 ++++----
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos5433.dtsi b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
index 017ccc2f4650..91e82e4283b2 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
@@ -1866,8 +1866,8 @@ pdma0: dma-controller@15610000 {
 			clocks = <&cmu_fsys CLK_PDMA0>;
 			clock-names = "apb_pclk";
 			#dma-cells = <1>;
-			#dma-channels = <8>;
-			#dma-requests = <32>;
+			dma-channels = <8>;
+			dma-requests = <32>;
 		};
 
 		pdma1: dma-controller@15600000 {
@@ -1877,8 +1877,8 @@ pdma1: dma-controller@15600000 {
 			clocks = <&cmu_fsys CLK_PDMA1>;
 			clock-names = "apb_pclk";
 			#dma-cells = <1>;
-			#dma-channels = <8>;
-			#dma-requests = <32>;
+			dma-channels = <8>;
+			dma-requests = <32>;
 		};
 
 		audio-subsystem@11400000 {
@@ -1898,8 +1898,8 @@ adma: dma-controller@11420000 {
 				clocks = <&cmu_aud CLK_ACLK_DMAC>;
 				clock-names = "apb_pclk";
 				#dma-cells = <1>;
-				#dma-channels = <8>;
-				#dma-requests = <32>;
+				dma-channels = <8>;
+				dma-requests = <32>;
 				power-domains = <&pd_aud>;
 			};
 
diff --git a/arch/arm64/boot/dts/exynos/exynos7.dtsi b/arch/arm64/boot/dts/exynos/exynos7.dtsi
index e38bb02a2152..c31534771620 100644
--- a/arch/arm64/boot/dts/exynos/exynos7.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos7.dtsi
@@ -149,8 +149,8 @@ pdma0: dma-controller@10e10000 {
 			clocks = <&clock_fsys0 ACLK_PDMA0>;
 			clock-names = "apb_pclk";
 			#dma-cells = <1>;
-			#dma-channels = <8>;
-			#dma-requests = <32>;
+			dma-channels = <8>;
+			dma-requests = <32>;
 		};
 
 		pdma1: dma-controller@10eb0000 {
@@ -160,8 +160,8 @@ pdma1: dma-controller@10eb0000 {
 			clocks = <&clock_fsys0 ACLK_PDMA1>;
 			clock-names = "apb_pclk";
 			#dma-cells = <1>;
-			#dma-channels = <8>;
-			#dma-requests = <32>;
+			dma-channels = <8>;
+			dma-requests = <32>;
 		};
 
 		clock_topc: clock-controller@10570000 {
-- 
2.32.0

