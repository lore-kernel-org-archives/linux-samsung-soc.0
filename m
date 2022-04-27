Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4389EC4332F
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 27 Apr 2022 15:59:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241014AbiD0QCL (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 27 Apr 2022 12:02:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241081AbiD0QCJ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 27 Apr 2022 12:02:09 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7ED81586E8
        for <linux-samsung-soc@vger.kernel.org>; Wed, 27 Apr 2022 08:58:51 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id kq17so4328467ejb.4
        for <linux-samsung-soc@vger.kernel.org>; Wed, 27 Apr 2022 08:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FfoH2+93jiElrAWTEZ/Q7dNpBENcDt+C1xVnkM3EKH0=;
        b=aDxm4D43Uhl3iOHQUzXpfXWzGb/UigzhcXaNFnpII0mJc39so3qCwm2fE5v0WlaCD1
         iiIj7mXuxl4vLl08tsVAqb/yQ99Klv17DSS7v7YSY4w2lb1yBRsC2I/fP6jw8WqGAfZ2
         9J8C7/bMPTWUvJQ3sZMvRdZB+a0hYWKNNqhZr1/SBBMSuCfk1CeJmmSw2ig3d93qNqA4
         3I2FntpgkthKFxff1hXUqb6Dk6gPxhaB/FDmqprkDCYz8qeQ3gaJdJ2FmYwFbS3XRpm8
         QIn+rk0OPEFC2T214H3rCJtJgot3GfT1DL/ZKf9SnboOT3JXtXcounnPp1EufD15JqJc
         Nnkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FfoH2+93jiElrAWTEZ/Q7dNpBENcDt+C1xVnkM3EKH0=;
        b=kZ3v9FzQc0rjZOsfvhqDiu7wF0MSKfLxZZuhW+Qwb2HiVjewA9uffBFoixs8uKHF7R
         IQhIjl5xTy/iIvlaWDjH8xC+f341VJB6nMflD60doh1ML/obzYlHK9Grd2ptG4V25m7K
         VMsUdSY+230a1GCbMXJxj5hwOUIcwUSTzzFx+VF7mzFfxq8BrXTgKPAzh9FX0ieenQJa
         y9uCqBYc9Z8ZSFg+7OOlLHJ1BZaabMc47z7MsIoIjT5/3rJhKtnNDGBV/FAExNQlWLOj
         aaLTFOYcdv26XwRKpmU+hFrTo4HuDbLySa0+BmVqAIEdIzv2mAAz+CONj23LAaMzuZKn
         yOCg==
X-Gm-Message-State: AOAM531K9CF5VbG1PrBRDPCZA97xlGqOwwDPsrr2Ae85uvGz2CM+2Pd+
        GQf0Jo3ZOowYI89HlEaivFw89w==
X-Google-Smtp-Source: ABdhPJxkTC6bstznqDirh3yOz28YdsL99Ic+MVOKQR7saWm8FlFuBZI4c+b5iie8jou2S74gwAsutg==
X-Received: by 2002:a17:906:730b:b0:6f3:a3bc:b69e with SMTP id di11-20020a170906730b00b006f3a3bcb69emr11977792ejc.377.1651075127531;
        Wed, 27 Apr 2022 08:58:47 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id l20-20020a1709062a9400b006ce71a88bf5sm6931993eje.183.2022.04.27.08.58.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Apr 2022 08:58:46 -0700 (PDT)
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
Subject: [PATCH 01/10] ARM: dts: zynq-7000: use proper 'dma-channels/requests' properties
Date:   Wed, 27 Apr 2022 17:58:31 +0200
Message-Id: <20220427155840.596535-2-krzysztof.kozlowski@linaro.org>
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
 arch/arm/boot/dts/zynq-7000.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/zynq-7000.dtsi b/arch/arm/boot/dts/zynq-7000.dtsi
index 47c2a4b14c06..40c60a2b6d2c 100644
--- a/arch/arm/boot/dts/zynq-7000.dtsi
+++ b/arch/arm/boot/dts/zynq-7000.dtsi
@@ -343,8 +343,8 @@ dmac_s: dmac@f8003000 {
 			             <0 40 4>, <0 41 4>,
 			             <0 42 4>, <0 43 4>;
 			#dma-cells = <1>;
-			#dma-channels = <8>;
-			#dma-requests = <4>;
+			dma-channels = <8>;
+			dma-requests = <4>;
 			clocks = <&clkc 27>;
 			clock-names = "apb_pclk";
 		};
-- 
2.32.0

