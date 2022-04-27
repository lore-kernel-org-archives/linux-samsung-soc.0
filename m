Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3A5CC4332F
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 27 Apr 2022 15:59:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241287AbiD0QC1 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 27 Apr 2022 12:02:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241240AbiD0QCX (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 27 Apr 2022 12:02:23 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02905169413
        for <linux-samsung-soc@vger.kernel.org>; Wed, 27 Apr 2022 08:58:58 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id i19so4278926eja.11
        for <linux-samsung-soc@vger.kernel.org>; Wed, 27 Apr 2022 08:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MKjLCUlOQvdpI7FmKAK8Um8s2AvYcZEoiKQJO1h/+7Q=;
        b=jV5dkMpL8DMNsYEhimDMDFrNviKnXilTKfixSFASCo7FkFdj5jGKav2rglWw4a0Tvg
         LdL1UChY18gfncekKP/RvUMVNuLSOgh6QrNa1QaBSp6pf0Zim0l+HcZJjCyBOHmul2Ik
         Nk1osJMnmiFIJQKsiu0wNjkQVzEtbLxZgT/n6WNcb0HW/v9b6qdDRgd8CVDiLUYPYbrr
         8caBZE18NXwy7djZkwvFTFAuVHWvVRWJaSejiCK2+RHaAIaUIqjUj6/wOfTyvfngOBGt
         01HlL52fAZjRraOEeBGMxlZpvac5ew/gNZ92WVOyfLFCjhErySkyMk6M799fuOaOopOA
         3qIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MKjLCUlOQvdpI7FmKAK8Um8s2AvYcZEoiKQJO1h/+7Q=;
        b=DYPiqBsiFyL74VbcdYVvXkJ3/HkGwOjx+BP6VjGW7CstIyxAVqwmbbee5Day6IMj5/
         DYxXSt56Z9Lu5Q7sdYUlGczF1QhfUD32M3D156SpGdUhlgSEIpCPVdayvFo1gJmuLO6s
         BTfNPl3a1au8y9El0JhJINdHb1v5M4zDJ7DFls8DMj6SUnnxH6J64aIjc8wPPKnECCgl
         zUDJZra9TpvsAbUVX31XbdFiFx3qCFuKiYyFWh5qltBflL/b0wXUEIhwLWICkHKsOInA
         LDgWxKYterTYsYk+2pr/htWIDStgQTdZVpfGWLyjjmSiQPibeYCzq9zDdtAZDER2QwGH
         9Q+A==
X-Gm-Message-State: AOAM5301+14Ziye5qQtBxVWraDBMUBwmOG/j7+7JHipqNiK9aodStFfg
        3ByuNJgYT//v3IvFBLVRK6yvFg==
X-Google-Smtp-Source: ABdhPJwgDgUDyTITCSSTY6QkoaxRAdqwIx735kozAEcyj2uLvbYu824QguLZougmsAmYQRNxtRSZYA==
X-Received: by 2002:a17:907:6d22:b0:6f3:a9e5:d074 with SMTP id sa34-20020a1709076d2200b006f3a9e5d074mr10320453ejc.639.1651075132678;
        Wed, 27 Apr 2022 08:58:52 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id l20-20020a1709062a9400b006ce71a88bf5sm6931993eje.183.2022.04.27.08.58.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Apr 2022 08:58:52 -0700 (PDT)
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
Subject: [PATCH 05/10] arm64: dts: broadcom: use proper 'dma-channels/requests' properties
Date:   Wed, 27 Apr 2022 17:58:35 +0200
Message-Id: <20220427155840.596535-6-krzysztof.kozlowski@linaro.org>
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
 arch/arm64/boot/dts/broadcom/northstar2/ns2.dtsi    | 4 ++--
 arch/arm64/boot/dts/broadcom/stingray/stingray.dtsi | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/broadcom/northstar2/ns2.dtsi b/arch/arm64/boot/dts/broadcom/northstar2/ns2.dtsi
index f59fa3979a04..230ccb685be6 100644
--- a/arch/arm64/boot/dts/broadcom/northstar2/ns2.dtsi
+++ b/arch/arm64/boot/dts/broadcom/northstar2/ns2.dtsi
@@ -289,8 +289,8 @@ dma0: dma-controller@61360000 {
 				     <GIC_SPI 215 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 216 IRQ_TYPE_LEVEL_HIGH>;
 			#dma-cells = <1>;
-			#dma-channels = <8>;
-			#dma-requests = <32>;
+			dma-channels = <8>;
+			dma-requests = <32>;
 			clocks = <&iprocslow>;
 			clock-names = "apb_pclk";
 		};
diff --git a/arch/arm64/boot/dts/broadcom/stingray/stingray.dtsi b/arch/arm64/boot/dts/broadcom/stingray/stingray.dtsi
index 7f1b8efd0883..2a58c1b43f6f 100644
--- a/arch/arm64/boot/dts/broadcom/stingray/stingray.dtsi
+++ b/arch/arm64/boot/dts/broadcom/stingray/stingray.dtsi
@@ -556,8 +556,8 @@ dma0: dma-controller@310000 {
 				     <GIC_SPI 200 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 201 IRQ_TYPE_LEVEL_HIGH>;
 			#dma-cells = <1>;
-			#dma-channels = <8>;
-			#dma-requests = <32>;
+			dma-channels = <8>;
+			dma-requests = <32>;
 			clocks = <&hsls_div2_clk>;
 			clock-names = "apb_pclk";
 			iommus = <&smmu 0x6000 0x0000>;
-- 
2.32.0

