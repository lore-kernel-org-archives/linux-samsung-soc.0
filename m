Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A569BC433F5
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 27 Apr 2022 15:59:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241054AbiD0QCi (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 27 Apr 2022 12:02:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241317AbiD0QCa (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 27 Apr 2022 12:02:30 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3FAB1A5809
        for <linux-samsung-soc@vger.kernel.org>; Wed, 27 Apr 2022 08:59:06 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id g20so2473622edw.6
        for <linux-samsung-soc@vger.kernel.org>; Wed, 27 Apr 2022 08:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=76W1cUhpVZ4S1kk1owDY4fNBWLgNIFgf8c4KyIt+188=;
        b=crGsQu75U2P+YiYm4OLO1RAMBFX+JBucI6Hse1p27B8vuZvTO1eDpVf3XiMTYBL7wf
         suuQgktoE/OB+Eo1RxJWXW1Bl9Uob8kZWOpCLMnAbbqLejmphreCc5bL+sccVJUfOKY0
         k77Hn91bAWF/nAUpynIHeo8Z1wtghV35s2Ua4NNuWhpGFKWeTy+8lw1PP8X9eXN9vhGt
         gWiaHW2XSZBD2+je5N3YWDyJihxaFCz1JZhj1s0Fh2xeuP6j+j5erROZLMHqF3RiCCNS
         aGKIlmFEX/BcDxzSyLq+r8+hTKDVT6zBUHk+83NXUz/8vq59DaqiwpJiRqwS8Fepgnm1
         0NNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=76W1cUhpVZ4S1kk1owDY4fNBWLgNIFgf8c4KyIt+188=;
        b=JBRqqcO88iYh6L2wIb0kevXafTTzfk69knqA5KSq4wrTw0Ot2BePrNyw1xlgy4Lqcx
         e3JM71zgeZXmOqEjAwE3Wk0TsKRX3+oAJfqkzGNi1oAn7SHtIIpKFUcz0vKzn3fPtsV4
         H4NP/+V5dBhHXV8QCO2Lue2Oqxms0dovScMOpZjSd2rDZmyyDGTtgnIzFcqmiFJY3Hjh
         A20M1HycDwEKnHkMTsd4anlJ8uixdew9UwsVc5/4g0E9GhO6rCYmc/tZc7eSCyBDCZXH
         WjbirtODMlE7wgVrj5tSJ9rUDC9amFdroiAfjEFvA2F7lz0I8Jygh7YJ7PSxyxldGjbK
         wi9Q==
X-Gm-Message-State: AOAM532zueH5YUzNszO3YwbxvyYTj+2zzz0GqyUtBbAFAW4lh7YtV6+/
        4uXKpETPViz/njjSXYR6oqOMCQ==
X-Google-Smtp-Source: ABdhPJykwglLB5mxEF++h8AEZRS2tUiHCIGL3J/BB834XWnFYca4p+5vl3EQBBArh/CVlfSqzcAmJw==
X-Received: by 2002:a50:9e61:0:b0:419:d8e5:6236 with SMTP id z88-20020a509e61000000b00419d8e56236mr31130749ede.327.1651075141506;
        Wed, 27 Apr 2022 08:59:01 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id l20-20020a1709062a9400b006ce71a88bf5sm6931993eje.183.2022.04.27.08.59.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Apr 2022 08:59:01 -0700 (PDT)
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
Subject: [PATCH 10/10] arm64: dts: fsd: use proper 'dma-channels/requests' properties
Date:   Wed, 27 Apr 2022 17:58:40 +0200
Message-Id: <20220427155840.596535-11-krzysztof.kozlowski@linaro.org>
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
 arch/arm64/boot/dts/tesla/fsd.dtsi | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/tesla/fsd.dtsi b/arch/arm64/boot/dts/tesla/fsd.dtsi
index 10c217a57a7d..7fba37d860b2 100644
--- a/arch/arm64/boot/dts/tesla/fsd.dtsi
+++ b/arch/arm64/boot/dts/tesla/fsd.dtsi
@@ -432,8 +432,8 @@ mdma0: dma-controller@10100000 {
 			reg = <0x0 0x10100000 0x0 0x1000>;
 			interrupts = <GIC_SPI 424 IRQ_TYPE_LEVEL_HIGH>;
 			#dma-cells = <1>;
-			#dma-channels = <8>;
-			#dma-requests = <32>;
+			dma-channels = <8>;
+			dma-requests = <32>;
 			clocks = <&clock_imem IMEM_DMA0_IPCLKPORT_ACLK>;
 			clock-names = "apb_pclk";
 			iommus = <&smmu_imem 0x800 0x0>;
@@ -444,8 +444,8 @@ mdma1: dma-controller@10110000 {
 			reg = <0x0 0x10110000 0x0 0x1000>;
 			interrupts = <GIC_SPI 425 IRQ_TYPE_LEVEL_HIGH>;
 			#dma-cells = <1>;
-			#dma-channels = <8>;
-			#dma-requests = <32>;
+			dma-channels = <8>;
+			dma-requests = <32>;
 			clocks = <&clock_imem IMEM_DMA1_IPCLKPORT_ACLK>;
 			clock-names = "apb_pclk";
 			iommus = <&smmu_imem 0x801 0x0>;
@@ -456,8 +456,8 @@ pdma0: dma-controller@14280000 {
 			reg = <0x0 0x14280000 0x0 0x1000>;
 			interrupts = <GIC_SPI 190 IRQ_TYPE_LEVEL_HIGH>;
 			#dma-cells = <1>;
-			#dma-channels = <8>;
-			#dma-requests = <32>;
+			dma-channels = <8>;
+			dma-requests = <32>;
 			clocks = <&clock_peric PERIC_DMA0_IPCLKPORT_ACLK>;
 			clock-names = "apb_pclk";
 			iommus = <&smmu_peric 0x2 0x0>;
@@ -468,8 +468,8 @@ pdma1: dma-controller@14290000 {
 			reg = <0x0 0x14290000 0x0 0x1000>;
 			interrupts = <GIC_SPI 191 IRQ_TYPE_LEVEL_HIGH>;
 			#dma-cells = <1>;
-			#dma-channels = <8>;
-			#dma-requests = <32>;
+			dma-channels = <8>;
+			dma-requests = <32>;
 			clocks = <&clock_peric PERIC_DMA1_IPCLKPORT_ACLK>;
 			clock-names = "apb_pclk";
 			iommus = <&smmu_peric 0x1 0x0>;
-- 
2.32.0

