Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C868C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Sat, 30 Apr 2022 12:19:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355053AbiD3MWn (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 30 Apr 2022 08:22:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357160AbiD3MWk (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 30 Apr 2022 08:22:40 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B318AAE16
        for <linux-samsung-soc@vger.kernel.org>; Sat, 30 Apr 2022 05:19:17 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id g6so19996578ejw.1
        for <linux-samsung-soc@vger.kernel.org>; Sat, 30 Apr 2022 05:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AVU+HyGPvDq4Ad26182u3753XqKolh2zdBKACINyN/M=;
        b=z2Ju8wcf62pztJwxKYamzJ6kihOLF7cgd6EI9ikBHkSqLOF4Qn80OpkSZkv+ZLcDDO
         mZZPCgxvPWcTKuXrpdAwaeMCeivsCjx+PWNf76JYN9+VX/KF94PH0erTmNV7niydcIKv
         3KSB87Ni0AlSR79I9r7YKXX9HboDCpJjnNGtIpAO1Y/YXQiIY339gNxJzqvAzpVyxt4K
         /vDRXE5RRlXRgW4tJ6K+sfzXefixElebre6mZii/xvoc0L8SFsahIRSFhekwhtEeBV4B
         gBg55PQ/zZB1zqTPgmBZ9F5dcchIQyIAedS3HHECjLNYUhb0+amMD7p2KKlONCU2wGo3
         KNyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AVU+HyGPvDq4Ad26182u3753XqKolh2zdBKACINyN/M=;
        b=J8MWgauG3cS3/vEiHLKAplM9QbFXOVcVX2yTbyS2ro1Mw4XtsdGOLlyJzUzeK0hnjW
         0DxCy+/v/x5HQVgyGpXyl0cGihGInCK23KcbTBW8FGTSScdjjn9qojV57V0Zl9El0Lwx
         zICQSJ3D7aQqViwFNQ8wQkq6PodqxrBqMiFnHjrzjS/B8VhYjZpg87riUK6skad7LVJ9
         n+CD4LxP9v/VR1ADuDl9N5vF/Zv4QdvFK7en8PnfdaNgl5ljqr7GiMUcL2MopdLSxFeT
         um8kcF+R9IIkUdhBLRLY7IQRG2xlbkfGXhgQyfc4ezUYMv+mDPhGi7C8a2jwjueUW7yW
         rkSQ==
X-Gm-Message-State: AOAM530miHYbGvAyrW6i3gkHQRLlcInJN8G5R7mHU7XaVLyAP46YrqjJ
        jVerdV14Y0aNAN/ijSa1ktC4hw==
X-Google-Smtp-Source: ABdhPJyx0rP9PLsYenZ7A3IngtRJNpNScCw5DbUxYcmFPPRYw+VKw3/DCQKDCSdbeWXRQetyuhoEXQ==
X-Received: by 2002:a17:906:9b8a:b0:6f3:fcc9:f863 with SMTP id dd10-20020a1709069b8a00b006f3fcc9f863mr3632098ejc.672.1651321156115;
        Sat, 30 Apr 2022 05:19:16 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id c26-20020a056402159a00b0042617ba63d1sm4059091edv.91.2022.04.30.05.19.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Apr 2022 05:19:15 -0700 (PDT)
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
Subject: [PATCH v2 6/9] ARM: dts: s5pv210: drop useless 'dma-channels/requests' properties
Date:   Sat, 30 Apr 2022 14:18:59 +0200
Message-Id: <20220430121902.59895-7-krzysztof.kozlowski@linaro.org>
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
 arch/arm/boot/dts/s5pv210.dtsi | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/arm/boot/dts/s5pv210.dtsi b/arch/arm/boot/dts/s5pv210.dtsi
index ac281f42e8f5..f1b85aae8842 100644
--- a/arch/arm/boot/dts/s5pv210.dtsi
+++ b/arch/arm/boot/dts/s5pv210.dtsi
@@ -125,8 +125,6 @@ pdma0: dma-controller@e0900000 {
 			clocks = <&clocks CLK_PDMA0>;
 			clock-names = "apb_pclk";
 			#dma-cells = <1>;
-			#dma-channels = <8>;
-			#dma-requests = <32>;
 		};
 
 		pdma1: dma-controller@e0a00000 {
@@ -137,8 +135,6 @@ pdma1: dma-controller@e0a00000 {
 			clocks = <&clocks CLK_PDMA1>;
 			clock-names = "apb_pclk";
 			#dma-cells = <1>;
-			#dma-channels = <8>;
-			#dma-requests = <32>;
 		};
 
 		adc: adc@e1700000 {
@@ -526,8 +522,6 @@ mdma1: dma-controller@fa200000 {
 			clocks = <&clocks CLK_MDMA>;
 			clock-names = "apb_pclk";
 			#dma-cells = <1>;
-			#dma-channels = <8>;
-			#dma-requests = <1>;
 		};
 
 		rotator: rotator@fa300000 {
-- 
2.32.0

