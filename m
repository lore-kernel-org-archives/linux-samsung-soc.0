Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BFD6C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 27 Apr 2022 15:59:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240955AbiD0QCN (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 27 Apr 2022 12:02:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240764AbiD0QCM (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 27 Apr 2022 12:02:12 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25FEF1154F2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 27 Apr 2022 08:58:55 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id m20so4278275ejj.10
        for <linux-samsung-soc@vger.kernel.org>; Wed, 27 Apr 2022 08:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3dtCogE+SAcSJ5Db+VnZ4c0f5WnBEqvHUWyxz2QP74w=;
        b=Zm29Qnp/nmmh8p4d2DCNGi7rClqLQTnkfd+6NBizcIwYdr9cNb3c21woXy+2fIQVaK
         rSdRckr+k3QU9uU4WctQk9753Aky3NhKrnWQhhuQiWHcOOdTPKlr8RPYUIc3P14FSkDB
         d1q3ommRGAufKlK4BGWD1Gr6OSF6EpeyWsWSSgY0+6IiEvCyqTJYPMM1vf4gEHX7aG3A
         l8OFfCJ7WDSfkAOaiAQlDsV4JIHIqAwiIVporr++6HeZZQcYd2vYmidpb0FtaR7wDjIM
         MtWtRupdrG6Nv8y8GgPX8OZp5Hvv+whfhYosrJN2Krqx13lNoZ7pU2it1n8J/be7sMlQ
         m+qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3dtCogE+SAcSJ5Db+VnZ4c0f5WnBEqvHUWyxz2QP74w=;
        b=Xum0/GkYkmVnZWzNn9ZXLJV2keDMXWflUX8g1fiiftidAii757KBQBA7db2O+Qaxxf
         PHhXXphuj3XJ2rZkWbGX2/Q/rSYxw8FCtR0TjJTQ06ckYgHQ+PDODSlbV3R5kb/Om8vN
         SggSFm9+5VtMWr8EfV2rMKoW8Qt7ZSMiouFgU6C+X7sHgDTtaqbwNnbXKMc9ICDM8LfK
         C/Uoe6fCwAZUbU/zdlReDukiCjLqw/D4J3B5Bqv3sxpMYk0wQH8Pfvw9eBmeEL/L4zL/
         d+EK8kkXLGON5CUmHDWkjSasPp6844bYAvQaD8NRxvoeX7TB+YI0mMBt7s8sDAhj+cY5
         8IBQ==
X-Gm-Message-State: AOAM532uYLJtJWiEDjmP24un3bN/ETzmiA7qZx7aChZWq6D6gopNaSPz
        JhGU6HJZOijyqTPLpnS3/Z47Aw==
X-Google-Smtp-Source: ABdhPJw9Som5p5H+C+616fLW8c09GFbZ29OzLFxuQ5Lh/jDun7pKXw4Kxr+tc0PcoDTU00qm8yeXCw==
X-Received: by 2002:a17:907:7f13:b0:6f3:bfbb:2f9b with SMTP id qf19-20020a1709077f1300b006f3bfbb2f9bmr5202247ejc.101.1651075130113;
        Wed, 27 Apr 2022 08:58:50 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id l20-20020a1709062a9400b006ce71a88bf5sm6931993eje.183.2022.04.27.08.58.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Apr 2022 08:58:49 -0700 (PDT)
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
Subject: [PATCH 03/10] arm64: dts: stratix10/agilex: use proper 'dma-channels/requests' properties
Date:   Wed, 27 Apr 2022 17:58:33 +0200
Message-Id: <20220427155840.596535-4-krzysztof.kozlowski@linaro.org>
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
 arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi | 4 ++--
 arch/arm64/boot/dts/intel/socfpga_agilex.dtsi     | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi b/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi
index 884bda106399..b743e625f482 100644
--- a/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi
+++ b/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi
@@ -346,8 +346,8 @@ pdma: dma-controller@ffda0000 {
 				     <0 88 4>,
 				     <0 89 4>;
 			#dma-cells = <1>;
-			#dma-channels = <8>;
-			#dma-requests = <32>;
+			dma-channels = <8>;
+			dma-requests = <32>;
 			clocks = <&clkmgr STRATIX10_L4_MAIN_CLK>;
 			clock-names = "apb_pclk";
 			resets = <&rst DMA_RESET>, <&rst DMA_OCP_RESET>;
diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex.dtsi b/arch/arm64/boot/dts/intel/socfpga_agilex.dtsi
index c78371703e76..2bf632edc3ad 100644
--- a/arch/arm64/boot/dts/intel/socfpga_agilex.dtsi
+++ b/arch/arm64/boot/dts/intel/socfpga_agilex.dtsi
@@ -350,8 +350,8 @@ pdma: dma-controller@ffda0000 {
 				     <GIC_SPI 88 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>;
 			#dma-cells = <1>;
-			#dma-channels = <8>;
-			#dma-requests = <32>;
+			dma-channels = <8>;
+			dma-requests = <32>;
 			resets = <&rst DMA_RESET>, <&rst DMA_OCP_RESET>;
 			reset-names = "dma", "dma-ocp";
 			clocks = <&clkmgr AGILEX_L4_MAIN_CLK>;
-- 
2.32.0

