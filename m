Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84936C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 27 Apr 2022 15:59:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241301AbiD0QCq (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 27 Apr 2022 12:02:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241304AbiD0QC2 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 27 Apr 2022 12:02:28 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2BB416A5C4
        for <linux-samsung-soc@vger.kernel.org>; Wed, 27 Apr 2022 08:59:01 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id m20so4278844ejj.10
        for <linux-samsung-soc@vger.kernel.org>; Wed, 27 Apr 2022 08:59:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eKvDuuB9QgS27uH7omTMpe+GPkov4ZRdj/Xw46TVghk=;
        b=Xj4JuGcggLnu/0KkPElctnR4Our3/z/gp+RPHn3BZYUOLqE4ghTux4rLELcw722Rxq
         Z3J4uXVYrZHPx3n6yNtdGJsn2QgJ4sF3j5ltEMKJCoKumElPOl1yGzHujd4fXNrolRIo
         f3pnaY+xyxM6XMfo26fNrK6k8J7DBYllNHEEf7YXbKzPTat0ealbgKQxyj9BRJ20EKA7
         P5RcEJJE3B+3Ej10xzgHR2jJg+C6UPQ9LWd2hzDKdJOzdhK48w8IJIaJqJYZMYenBJxQ
         sZkrmkRERanjdlFvTGQ+qmtvEE0V3LnjT0liVNOVsfQnclVRMF2OMnt1lQ13PpCfhZzT
         EYWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eKvDuuB9QgS27uH7omTMpe+GPkov4ZRdj/Xw46TVghk=;
        b=3IBvZpTXGwvq+Bs2LZNKmcNzynAKCmDC4+30+IRrNpzvAaXYmRZNIj6ia5fMtS/0yX
         /if5amXgR3WvT/aSpBtl1XOwuUokuV2kTCp+UkK6SnZB9GVfrAw6YY4XQjvUfy5RDKOV
         sXde7/kHiHF2bjpg4swa+SVZecH3Et5Vj+/TFZYdc7ds8JErpSUw9uy3aB+lb1zAaVxr
         1EbsjRLTgk/phNKGvhVKhhN2Sde/fzWK4mwIe6X4Z0CXVPRUmo/iRBu39rlU+1sZssbj
         0Bgn/a4h+6aXPcoPGOnKYJAxNVRkNGX7AbJWe2vOqFvaWJc8NdZK+oMWHqfytCisQZLt
         OX9Q==
X-Gm-Message-State: AOAM533xsX2wQ7PE00O48VweIHqpiOseUstxRF55NiZxlOX9hZgcgheB
        c3pTPkTHRPlxTi8czXKAWQC1ug==
X-Google-Smtp-Source: ABdhPJzUU6FhLxV2t/BOpMHiXfLyUyiy2Pp2RkecMzFq2opxeB5FMpvjvc+/h+NzLAfoXNvF4CQQNQ==
X-Received: by 2002:a17:907:7eaa:b0:6f3:bb9a:7f39 with SMTP id qb42-20020a1709077eaa00b006f3bb9a7f39mr6900446ejc.233.1651075136200;
        Wed, 27 Apr 2022 08:58:56 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id l20-20020a1709062a9400b006ce71a88bf5sm6931993eje.183.2022.04.27.08.58.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Apr 2022 08:58:55 -0700 (PDT)
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
Subject: [PATCH 07/10] ARM: dts: s5pv210: use proper 'dma-channels/requests' properties
Date:   Wed, 27 Apr 2022 17:58:37 +0200
Message-Id: <20220427155840.596535-8-krzysztof.kozlowski@linaro.org>
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
 arch/arm/boot/dts/s5pv210.dtsi | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/s5pv210.dtsi b/arch/arm/boot/dts/s5pv210.dtsi
index ac281f42e8f5..f6988ba3393d 100644
--- a/arch/arm/boot/dts/s5pv210.dtsi
+++ b/arch/arm/boot/dts/s5pv210.dtsi
@@ -125,8 +125,8 @@ pdma0: dma-controller@e0900000 {
 			clocks = <&clocks CLK_PDMA0>;
 			clock-names = "apb_pclk";
 			#dma-cells = <1>;
-			#dma-channels = <8>;
-			#dma-requests = <32>;
+			dma-channels = <8>;
+			dma-requests = <32>;
 		};
 
 		pdma1: dma-controller@e0a00000 {
@@ -137,8 +137,8 @@ pdma1: dma-controller@e0a00000 {
 			clocks = <&clocks CLK_PDMA1>;
 			clock-names = "apb_pclk";
 			#dma-cells = <1>;
-			#dma-channels = <8>;
-			#dma-requests = <32>;
+			dma-channels = <8>;
+			dma-requests = <32>;
 		};
 
 		adc: adc@e1700000 {
@@ -526,8 +526,8 @@ mdma1: dma-controller@fa200000 {
 			clocks = <&clocks CLK_MDMA>;
 			clock-names = "apb_pclk";
 			#dma-cells = <1>;
-			#dma-channels = <8>;
-			#dma-requests = <1>;
+			dma-channels = <8>;
+			dma-requests = <1>;
 		};
 
 		rotator: rotator@fa300000 {
-- 
2.32.0

