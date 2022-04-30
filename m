Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C226C433FE
	for <linux-samsung-soc@archiver.kernel.org>; Sat, 30 Apr 2022 12:19:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245112AbiD3MWl (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 30 Apr 2022 08:22:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355058AbiD3MWf (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 30 Apr 2022 08:22:35 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 100943AA4D
        for <linux-samsung-soc@vger.kernel.org>; Sat, 30 Apr 2022 05:19:14 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id g20so11806761edw.6
        for <linux-samsung-soc@vger.kernel.org>; Sat, 30 Apr 2022 05:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=a5kf3y2M7fy8iPzpUwHWQL83aZ36k2Uw1ck+FQf0ju8=;
        b=AFP6mba/7P9HcbJqFT7v0yz7OS9fTLfs2qGRSUDRTTc0IUFlzm8WApVcajerOLqZpb
         4O0WM1rMPlfF0CjUlxALNLVboKFCe9t+HEjrVq9Nzjo27SEWSXPDoqbIlGZRXTemMang
         4jX+wI5gEl3Rz1FtGQwke7bA1NdwOK4vJWGsv6KSyLxeurgrCI+n4fmdOpzbEFLsusOJ
         wEUKOZ6ya5WHdOsr5/gZXQTIU8ldyM+BgD2JXsEj8Iu41pT4Nz/RY6ZnQgahuzM0HCeo
         UprogZYE3B8/tQrUAFKHmpqJ9joSIQGl/BUCkn3uFR2uFLQt9b2+GQyKMhrBpB9O6Goh
         +8cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=a5kf3y2M7fy8iPzpUwHWQL83aZ36k2Uw1ck+FQf0ju8=;
        b=R+24N2lxoQxinCMl2zi1fiV8zafkcGk/himZNLudcD3wm+RHJFnqDj9KG3oK3E8kkP
         1EdpK4SqXTjOnG4AD1FY38N4HO7SgsHUxbeMTOvzQlbo/P5Zs5mF2GGIQzpj/+XFrNhS
         cxkRBpetJ9jlrWf1j0Mc2y4FGv4Nu9e0nLXnlMDl45lWhWIizO3Q1d8wygKQQ90BFwVd
         Ta/EmyJxPoXw+Bv9pzsMNC6fXcDyudFx6P4+1BR+TfC91fzm5q9W97wDvNEzDd8YJotj
         9yPxLgiOb4Gm114zY/F/Ncw9mPmTjW/xY+k0W+XuC4fJyryCNZWaK1NGQpUFQMVAVDC/
         IJDw==
X-Gm-Message-State: AOAM532hz9z4QWfjt5zHN+1xV1GTOCUO77T/mFma/SmXDV+JCEGRjqPe
        8CO1WqeVi1tpLu8UUSrdv20sXQ==
X-Google-Smtp-Source: ABdhPJxtWWrrtZbl39jx7xyI9RksIBurQ9DcfP+anq2xMaGPQkQ0yTyW8lJ3p10615dHqYj8q07/pg==
X-Received: by 2002:a05:6402:1908:b0:426:30d3:7e1f with SMTP id e8-20020a056402190800b0042630d37e1fmr4139168edz.174.1651321152591;
        Sat, 30 Apr 2022 05:19:12 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id c26-20020a056402159a00b0042617ba63d1sm4059091edv.91.2022.04.30.05.19.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Apr 2022 05:19:12 -0700 (PDT)
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
Subject: [PATCH v2 3/9] arm64: dts: stratix10/agilex: drop useless 'dma-channels/requests' properties
Date:   Sat, 30 Apr 2022 14:18:56 +0200
Message-Id: <20220430121902.59895-4-krzysztof.kozlowski@linaro.org>
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
 arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi | 2 --
 arch/arm64/boot/dts/intel/socfpga_agilex.dtsi     | 2 --
 2 files changed, 4 deletions(-)

diff --git a/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi b/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi
index 884bda106399..aa2bba75265f 100644
--- a/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi
+++ b/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi
@@ -346,8 +346,6 @@ pdma: dma-controller@ffda0000 {
 				     <0 88 4>,
 				     <0 89 4>;
 			#dma-cells = <1>;
-			#dma-channels = <8>;
-			#dma-requests = <32>;
 			clocks = <&clkmgr STRATIX10_L4_MAIN_CLK>;
 			clock-names = "apb_pclk";
 			resets = <&rst DMA_RESET>, <&rst DMA_OCP_RESET>;
diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex.dtsi b/arch/arm64/boot/dts/intel/socfpga_agilex.dtsi
index c78371703e76..caccb0334ada 100644
--- a/arch/arm64/boot/dts/intel/socfpga_agilex.dtsi
+++ b/arch/arm64/boot/dts/intel/socfpga_agilex.dtsi
@@ -350,8 +350,6 @@ pdma: dma-controller@ffda0000 {
 				     <GIC_SPI 88 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>;
 			#dma-cells = <1>;
-			#dma-channels = <8>;
-			#dma-requests = <32>;
 			resets = <&rst DMA_RESET>, <&rst DMA_OCP_RESET>;
 			reset-names = "dma", "dma-ocp";
 			clocks = <&clkmgr AGILEX_L4_MAIN_CLK>;
-- 
2.32.0

