Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC269C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 27 Apr 2022 15:59:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241199AbiD0QCd (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 27 Apr 2022 12:02:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241272AbiD0QC0 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 27 Apr 2022 12:02:26 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 503C011E189
        for <linux-samsung-soc@vger.kernel.org>; Wed, 27 Apr 2022 08:58:57 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id a21so2488191edb.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 27 Apr 2022 08:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ngwz3q2zpsd8pn+c3WCkgPU+RQZwoiDX6UsfQMMTgSQ=;
        b=uh6vYHVpkd2S6gEKQiWeP0+fiBt6JCAWebIv3XdrN3Rb91/msRrhpL8KrGEdrThkGN
         6KYoegTI5K6neGhQCztoJxWMkqoQz2RUAURn4c0pIgliyAMbLGnNE1rrhLvVtnXaB+5v
         84y3L9wtizEpOxZEYm7eR+tNRT+SmZ3jR9Qdj7SKm1k2G7ufqxrM7pq/6MA12vgazN2z
         ROCm5PKCTac+YBCPUo8usJAmeTcvakLi5WjAmRW6C6EZw1wkIxwRz3RiGLVXzg3JgVAe
         23TDN60HOaWtCdTrlb5dCHtxis2Pp9kQ1ebMmifF7T3Aej6c7RWJeqI/4H/O+xgntUp3
         tZOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ngwz3q2zpsd8pn+c3WCkgPU+RQZwoiDX6UsfQMMTgSQ=;
        b=JrikaYEihyLxUW9I46BroOc3gY8JLyxVWkEyFV0zcSbKwsjc0zfzl7w8rYNqeQW/Px
         IMJaZgQMWkm88DRNh6CdLDzJJaS/JBgqDVIVbZJZNKuSU1rVHRhUu3xKns69EpB6WRBH
         aT0UnctCJM78MNmGpZNMxeTEDrY+4PGwkiNXSPmqxE57w3nZroLpAefWaixipVXZP5Ij
         aM5ymB7fhtDbxxytUCzu66HOm1ELhUsKAMLdN+itcexzSlsFVfDBa/7Bq4Skfes9Wav6
         HmewyeVMQ+6/QqiG9gvwKKNuHY9sIHBPV2WnFo8nFLIhq2Zq2DwdyPa77Yk9CrrnO0ov
         LPNA==
X-Gm-Message-State: AOAM531nT4VyJ6ztZmbMWbsP0kwkvx0ELbBvqfzaywgHNI+/VUpKem/b
        fqScSBjCx21QPA03MA7xydezXg==
X-Google-Smtp-Source: ABdhPJzd9n2AJH3No5QlSrAvOiQTtyKdLZzv5A2nYegCcOLTkKkmFf/LyoZbk7dTN5lW/SMLXlTvyw==
X-Received: by 2002:a05:6402:278f:b0:425:e89c:35e with SMTP id b15-20020a056402278f00b00425e89c035emr17275331ede.50.1651075131515;
        Wed, 27 Apr 2022 08:58:51 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id l20-20020a1709062a9400b006ce71a88bf5sm6931993eje.183.2022.04.27.08.58.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Apr 2022 08:58:51 -0700 (PDT)
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
Subject: [PATCH 04/10] arm64: dts: juno: use proper 'dma-channels/requests' properties
Date:   Wed, 27 Apr 2022 17:58:34 +0200
Message-Id: <20220427155840.596535-5-krzysztof.kozlowski@linaro.org>
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
 arch/arm64/boot/dts/arm/juno-base.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/arm/juno-base.dtsi b/arch/arm64/boot/dts/arm/juno-base.dtsi
index 4f40a5c8f565..96ef0ddc0b2d 100644
--- a/arch/arm64/boot/dts/arm/juno-base.dtsi
+++ b/arch/arm64/boot/dts/arm/juno-base.dtsi
@@ -829,8 +829,8 @@ dma-controller@7ff00000 {
 		compatible = "arm,pl330", "arm,primecell";
 		reg = <0x0 0x7ff00000 0 0x1000>;
 		#dma-cells = <1>;
-		#dma-channels = <8>;
-		#dma-requests = <32>;
+		dma-channels = <8>;
+		dma-requests = <32>;
 		interrupts = <GIC_SPI 88 IRQ_TYPE_LEVEL_HIGH>,
 			     <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>,
 			     <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>,
-- 
2.32.0

