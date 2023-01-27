Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1F93C636CD
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 27 Jan 2023 21:16:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231697AbjA0VQI (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 27 Jan 2023 16:16:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229611AbjA0VQG (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 27 Jan 2023 16:16:06 -0500
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D08E08A572
        for <linux-samsung-soc@vger.kernel.org>; Fri, 27 Jan 2023 13:15:42 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id m5-20020a05600c4f4500b003db03b2559eso4356572wmq.5
        for <linux-samsung-soc@vger.kernel.org>; Fri, 27 Jan 2023 13:15:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wufxP51EWGGk9HXvgWg83TOisM7XYlAWLVo728uV5hA=;
        b=lEzaGzBzxj++Qq8Um2MpC3xBscakPNAIJT//Pm1Ljxs07iEZq0ueR6JqM0Wf0byEXm
         7URmc0mhsf5k9aRGCvZVvRKzd/vJO6b4sXVmAFiq1B1j7NeBTMa1Rq2NuNUH69oztVGU
         h9jOdYEljDVJRs4/K+8EyP026DkhyEvEPdAlRnOIoSKsgU8LHcJoO0VlO5GDmFhK0qfD
         1OpMg+SQ0/cfgjHQyQOCbcDrJdoa5xTotLCFGbHaDljITeC8DXcM0BCcf8IoQixWPZc4
         xyYqHpuylk5wMNgRKEYQ9qkzQPNr7dQZKxuN0A8FeXDHzOvpBhYxe1meQaA6hzJ/KOuu
         ZWnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wufxP51EWGGk9HXvgWg83TOisM7XYlAWLVo728uV5hA=;
        b=NRholKWEOvbjq9nn5m3T2+IcEF2o5GK9gcqjpL9WmGznfmW8CJxY9if74uakaEFPMt
         48AbakZ6GxpxhyF5XODU9+4YQWn3xvoyE+MzfU40YerGuUC/FyIZ90RGKKDx/uKFdh0s
         taIWiKCX2AQs4gZgqybjyHkvAtmCjLc6UOw8reV4JBMWonIDhiHS+BjX5AOvvYvjni1G
         d3DQhR24U6NIRHryXv5/KgoGMHCq+ntn1t35fI1OE3FHpUnGxagMJCS/XMQCsBJAbM2j
         qzvH73vA6MhUw1ZGVSV7AcTdDkWKe/1ZYytpVAEs4vIijhcfEKPv+LJoY5s8Ay+2PubS
         +PQA==
X-Gm-Message-State: AFqh2koQerx5Iq7TyNe5VwPnje6Qlabw/uxp5CuAHylJ7HkZ1zQHBhpl
        L4JV7YLcXEfW2WLjYHSC8GHiwQ==
X-Google-Smtp-Source: AMrXdXtVli+Plarr/bjnv+Znr/PYPIxv/6oixV/TElu2iN1BpDXGkXHbtqD/2EWg0j6DFaVjGT98+w==
X-Received: by 2002:a1c:7414:0:b0:3d9:779e:9788 with SMTP id p20-20020a1c7414000000b003d9779e9788mr38649914wmc.37.1674854141449;
        Fri, 27 Jan 2023 13:15:41 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id l16-20020a7bc350000000b003d9aa76dc6asm10513504wmj.0.2023.01.27.13.15.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jan 2023 13:15:41 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     replicant@osuosl.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        =?UTF-8?q?Martin=20J=C3=BCcker?= <martin.juecker@gmail.com>,
        Henrik Grimler <henrik@grimler.se>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Chanho Park <chanho61.park@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [RFT PATCH v2 4/4] arm64: dts: exynos: add unit address to DWC3 node wrapper in Exynos7
Date:   Fri, 27 Jan 2023 22:15:27 +0100
Message-Id: <20230127211527.260060-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230127211527.260060-1-krzysztof.kozlowski@linaro.org>
References: <20230127211527.260060-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Neither simple-bus bindings nor dtc W=1 accept device nodes in soc@ node
which do not have unit address.  Therefore usethe address space
of child device (actual DWC3 Controller) as the wrapper's address to
fix:

  exynos7-espresso.dtb: soc@0: usb: {'compatible': ['samsung,exynos7-dwusb3'], ...
    should not be valid under {'type': 'object'}

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes since v1:
1. New patch
---
 arch/arm64/boot/dts/exynos/exynos7.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos7.dtsi b/arch/arm64/boot/dts/exynos/exynos7.dtsi
index 82fee1b7caab..b1fa68835b09 100644
--- a/arch/arm64/boot/dts/exynos/exynos7.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos7.dtsi
@@ -690,7 +690,7 @@ usbdrd_phy: phy@15500000 {
 			#phy-cells = <1>;
 		};
 
-		usbdrd: usb {
+		usbdrd: usb@15400000 {
 			compatible = "samsung,exynos7-dwusb3";
 			clocks = <&clock_fsys0 ACLK_USBDRD300>,
 			       <&clock_fsys0 SCLK_USBDRD300_SUSPENDCLK>,
@@ -699,11 +699,11 @@ usbdrd: usb {
 				"usbdrd30_axius_clk";
 			#address-cells = <1>;
 			#size-cells = <1>;
-			ranges;
+			ranges = <0x0 0x15400000 0x10000>;
 
-			usb@15400000 {
+			usb@0 {
 				compatible = "snps,dwc3";
-				reg = <0x15400000 0x10000>;
+				reg = <0x0 0x10000>;
 				interrupts = <GIC_SPI 223 IRQ_TYPE_LEVEL_HIGH>;
 				phys = <&usbdrd_phy 0>, <&usbdrd_phy 1>;
 				phy-names = "usb2-phy", "usb3-phy";
-- 
2.34.1

