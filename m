Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4561C38142
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 27 Jan 2023 21:28:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232018AbjA0V17 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 27 Jan 2023 16:27:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229946AbjA0V13 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 27 Jan 2023 16:27:29 -0500
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 076542B63F
        for <linux-samsung-soc@vger.kernel.org>; Fri, 27 Jan 2023 13:27:28 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id bg13-20020a05600c3c8d00b003d9712b29d2so6254763wmb.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 27 Jan 2023 13:27:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LW3LDw7FGTqoQX2IoeX7+zasLLbTbzH7aQ5hccH1lSE=;
        b=Xo1ER8zi+03jkZmbTf+qcFtfNTwjewlVDtni+l3Lax5osgm9kzf7nwrDqRguJ7AGgy
         kXmJqfOBHbwT5iWVVKJN9LwM8ng+cG47Qu8Fw2fRZg8814xKuPxB+Tla7NKkvLPqFvLq
         /8RxvxP+yHpeSwrO7IwdnE1tdAORhnVDJBEo5EgOjQJenA0/DpYcVT4YfFu8lPLAowao
         kJk1YzxeEG9k4Obmp90TWxvkPUwBwLGf+BNndb8D5n7vtwbGBIch1Pkd3++WmCqpaNBd
         xjsmJ6tBkGoNYWaa1RYD4PvV3ZTSBv/TIDTANS+7MBuuOjyVUPzUfea+rQnyhl//FC8o
         A9JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LW3LDw7FGTqoQX2IoeX7+zasLLbTbzH7aQ5hccH1lSE=;
        b=fv3LIQp0W7DsJ4Nwe9roWu6oEMNrh1hBPGDdWkCP+dkTl81fKQKAw3pe56g7qTV/H8
         WZLXqrXBIPAgZWhNCJVqf4jLH3AYwDz6STgIsP2KmE6gzjluMAxcLHk8ooiZvbstgbAs
         Z7oo7DBV0uTN2ymYixnQFm3eLRMByXk9frRkv2keV3RpXJfyFGGQnInImPj+x1zz7+Dx
         QVL75AmxmZIovMeRNsurE0t/iGs/kGYbBxO0ZW20akukzQk8REzGgv1m9T4fFdO5E2zo
         lFkU3VGFBDzd1knjgLfebUNu2LBnOtrOWIIAEjRJMyyMOzAi0fIneNbnDPHdCtujWHB6
         cYZA==
X-Gm-Message-State: AFqh2krh7MAu0Zo0/f6u+5OfBHWmuMkCFKTnBh0NxDE4bJZk72IfcE1p
        eKg9XiM8OrUVnIXut2O45iAqqA==
X-Google-Smtp-Source: AMrXdXvn+Yb/fjfBtocT0N9a3tcDiAQPHU/XrLJ9TetyIixDYeNxoOXwgyNlJjGPDPNoI0a6WDdZYw==
X-Received: by 2002:a05:600c:2d84:b0:3d9:e8b3:57f9 with SMTP id i4-20020a05600c2d8400b003d9e8b357f9mr42431967wmg.8.1674854847608;
        Fri, 27 Jan 2023 13:27:27 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id d11-20020a05600c3acb00b003db30be4a54sm8645303wms.38.2023.01.27.13.27.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jan 2023 13:27:27 -0800 (PST)
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
Subject: [RFT PATCH v3 3/4] arm64: dts: exynos: add unit address to DWC3 node wrapper in Exynos5433
Date:   Fri, 27 Jan 2023 22:27:12 +0100
Message-Id: <20230127212713.267014-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230127212713.267014-1-krzysztof.kozlowski@linaro.org>
References: <20230127212713.267014-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Neither simple-bus bindings nor dtc W=1 accept device nodes in soc@ node
which do not have unit address.  Therefore usethe address space
of child device (actual DWC3 Controller) as the wrapper's address to
fix:

  exynos5433-tm2e.dtb: soc@0: usbdrd: {'compatible': ['samsung,exynos5433-dwusb3'], ...
    should not be valid under {'type': 'object'}

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes since v2:
1. Fix typo/build error.

Changes since v1:
1. New patch
---
 arch/arm64/boot/dts/exynos/exynos5433.dtsi | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos5433.dtsi b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
index 9da24fe958a3..5519a80576c5 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
@@ -1742,7 +1742,7 @@ hsi2c_11: i2c@14df0000 {
 			status = "disabled";
 		};
 
-		usbdrd30: usbdrd {
+		usbdrd30: usb@15400000 {
 			compatible = "samsung,exynos5433-dwusb3";
 			clocks = <&cmu_fsys CLK_ACLK_USBDRD30>,
 				<&cmu_fsys CLK_SCLK_USBDRD30>,
@@ -1751,16 +1751,16 @@ usbdrd30: usbdrd {
 			clock-names = "aclk", "susp_clk", "phyclk", "pipe_pclk";
 			#address-cells = <1>;
 			#size-cells = <1>;
-			ranges;
+			ranges = <0x0 0x15400000 0x10000>;
 			status = "disabled";
 
-			usbdrd_dwc3: usb@15400000 {
+			usbdrd_dwc3: usb@0 {
 				compatible = "snps,dwc3";
 				clocks = <&cmu_fsys CLK_SCLK_USBDRD30>,
 					<&cmu_fsys CLK_ACLK_USBDRD30>,
 					<&cmu_fsys CLK_SCLK_USBDRD30>;
 				clock-names = "ref", "bus_early", "suspend";
-				reg = <0x15400000 0x10000>;
+				reg = <0x0 0x10000>;
 				interrupts = <GIC_SPI 231 IRQ_TYPE_LEVEL_HIGH>;
 				phys = <&usbdrd30_phy 0>, <&usbdrd30_phy 1>;
 				phy-names = "usb2-phy", "usb3-phy";
@@ -1795,7 +1795,7 @@ usbhost30_phy: phy@15580000 {
 			status = "disabled";
 		};
 
-		usbhost30: usbhost {
+		usbhost30: usb@15a00000 {
 			compatible = "samsung,exynos5433-dwusb3";
 			clocks = <&cmu_fsys CLK_ACLK_USBHOST30>,
 				<&cmu_fsys CLK_SCLK_USBHOST30>,
@@ -1804,16 +1804,16 @@ usbhost30: usbhost {
 			clock-names = "aclk", "susp_clk", "phyclk", "pipe_pclk";
 			#address-cells = <1>;
 			#size-cells = <1>;
-			ranges;
+			ranges = <0x0 0x15a00000 0x10000>;
 			status = "disabled";
 
-			usbhost_dwc3: usb@15a00000 {
+			usbhost_dwc3: usb@0 {
 				compatible = "snps,dwc3";
 				clocks = <&cmu_fsys CLK_SCLK_USBHOST30>,
 					<&cmu_fsys CLK_ACLK_USBHOST30>,
 					<&cmu_fsys CLK_SCLK_USBHOST30>;
 				clock-names = "ref", "bus_early", "suspend";
-				reg = <0x15a00000 0x10000>;
+				reg = <0x0 0x10000>;
 				interrupts = <GIC_SPI 244 IRQ_TYPE_LEVEL_HIGH>;
 				phys = <&usbhost30_phy 0>, <&usbhost30_phy 1>;
 				phy-names = "usb2-phy", "usb3-phy";
-- 
2.34.1

