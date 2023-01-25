Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA138C61DA0
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 25 Jan 2023 09:46:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235494AbjAYJqS (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 25 Jan 2023 04:46:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235435AbjAYJqI (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 25 Jan 2023 04:46:08 -0500
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DCD161AB
        for <linux-samsung-soc@vger.kernel.org>; Wed, 25 Jan 2023 01:45:45 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id m15so13279627wms.4
        for <linux-samsung-soc@vger.kernel.org>; Wed, 25 Jan 2023 01:45:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QAZoZHoBuUI+69gut0sQWpWd9KE5DC+R6xcdQlwzKj8=;
        b=f8AwW5Q4c9/VM8GlsR72Mql0ugf2w0XnfBl4LAvtuFM9WAfaqDQkteATZIBMvPgvGI
         9b4P7WiXO/gUsQtWkLkaPn0zUFKmkMtYZ8No4rgY04MPdyPpg4GHjks6C20feCmsvbvT
         nAAXh+0jImh6BFjBumVHEd3/UMz3TCMGrAdNQqvYJL2tNk5LO2Id2FyCSvMP+Spp7dGI
         ppIjz/qsCY2F++V7JKkZVEi5vT9NdQjMsQqcUk0uWaj0u34WAE+wEQGlPmnBcdt0dZvz
         ueTSvaZ67Njr0P1Nl4CPBgbVMKggEmNW5rHbLMaeoN61LL7TQlnrKVb2FSbrBK/3tteL
         c6Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QAZoZHoBuUI+69gut0sQWpWd9KE5DC+R6xcdQlwzKj8=;
        b=uYbxALqn0wioC06V9B3Yu/bHgB/OXFuHbWGbO5zBqBJJSqs9hyD7xhCV6LKVqwwHuL
         XrXSRMj0z3UBKA97FszfPkE5PjmvzrJ0bDq9S0wLp+1O2aBjjaqIk6ZYw8iYwl62s0YM
         ME/gcgsPRuSrMLNSO1oToIrzNwm9kkZ54tx50pJOrjoGjsA1bijMFMdDk0nb+rya9SLw
         9dqp7kQmy/bdjtHP+qs29TsBGYc5nTCUI7MopY8+rE9XOwFQGU4qgo72CVNN2IaHQliB
         gcE/FgeW+IhUSIc2S4zI4YQslMyrESQzqjRH3+4Ff+iC4TWbSHTH262kI/Qn3G0NZo6q
         ASpw==
X-Gm-Message-State: AFqh2kpsxOnu+TuTcqOy0IB9bw4PPhl4FaQ+NP6mbAhuXYHcOtUh05ff
        8xpTdL2fHqVOOiT407YUobg+WQ==
X-Google-Smtp-Source: AMrXdXsTWzMhynRXYBhoD3rS9kAh4qvXH+6PtaedUbtI+gMYVKGHI4S56ushtgvoEZ6tDkHje5QR5w==
X-Received: by 2002:a05:600c:4f86:b0:3db:15b1:fb28 with SMTP id n6-20020a05600c4f8600b003db15b1fb28mr27321965wmq.19.1674639935212;
        Wed, 25 Jan 2023 01:45:35 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id fl22-20020a05600c0b9600b003d1e3b1624dsm1419238wmb.2.2023.01.25.01.45.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 01:45:34 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Kukjin Kim <kgene@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     replicant@osuosl.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        =?UTF-8?q?Martin=20J=C3=BCcker?= <martin.juecker@gmail.com>,
        Henrik Grimler <henrik@grimler.se>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 9/9] arm64: dts: exynos: use lowercase hex addresses
Date:   Wed, 25 Jan 2023 10:45:13 +0100
Message-Id: <20230125094513.155063-9-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230125094513.155063-1-krzysztof.kozlowski@linaro.org>
References: <20230125094513.155063-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

By convention the hex addresses should be lowercase.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/exynos/exynos5433.dtsi      | 12 ++++++------
 arch/arm64/boot/dts/exynos/exynos7-espresso.dts |  2 +-
 arch/arm64/boot/dts/exynos/exynos7.dtsi         |  6 +++---
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos5433.dtsi b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
index 47b5ac06f0d6..9da24fe958a3 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
@@ -351,7 +351,7 @@ psci {
 		compatible = "arm,psci";
 		method = "smc";
 		cpu_off = <0x84000002>;
-		cpu_on = <0xC4000003>;
+		cpu_on = <0xc4000003>;
 	};
 
 	soc: soc@0 {
@@ -1020,7 +1020,7 @@ decon_tv: decon@13880000 {
 
 		dsi: dsi@13900000 {
 			compatible = "samsung,exynos5433-mipi-dsi";
-			reg = <0x13900000 0xC0>;
+			reg = <0x13900000 0xc0>;
 			interrupts = <GIC_SPI 205 IRQ_TYPE_LEVEL_HIGH>;
 			phys = <&mipi_phy 1>;
 			phy-names = "dsim";
@@ -1272,7 +1272,7 @@ jpeg: codec@15020000 {
 
 		mfc: codec@152e0000 {
 			compatible = "samsung,exynos5433-mfc";
-			reg = <0x152E0000 0x10000>;
+			reg = <0x152e0000 0x10000>;
 			interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
 			clock-names = "pclk", "aclk", "aclk_xiu";
 			clocks = <&cmu_mfc CLK_PCLK_MFC>,
@@ -1329,7 +1329,7 @@ sysmmu_tv1x: sysmmu@13a30000 {
 
 		sysmmu_gscl0: sysmmu@13c80000 {
 			compatible = "samsung,exynos-sysmmu";
-			reg = <0x13C80000 0x1000>;
+			reg = <0x13c80000 0x1000>;
 			interrupts = <GIC_SPI 288 IRQ_TYPE_LEVEL_HIGH>;
 			clock-names = "aclk", "pclk";
 			clocks = <&cmu_gscl CLK_ACLK_SMMU_GSCL0>,
@@ -1340,7 +1340,7 @@ sysmmu_gscl0: sysmmu@13c80000 {
 
 		sysmmu_gscl1: sysmmu@13c90000 {
 			compatible = "samsung,exynos-sysmmu";
-			reg = <0x13C90000 0x1000>;
+			reg = <0x13c90000 0x1000>;
 			interrupts = <GIC_SPI 290 IRQ_TYPE_LEVEL_HIGH>;
 			clock-names = "aclk", "pclk";
 			clocks = <&cmu_gscl CLK_ACLK_SMMU_GSCL1>,
@@ -1351,7 +1351,7 @@ sysmmu_gscl1: sysmmu@13c90000 {
 
 		sysmmu_gscl2: sysmmu@13ca0000 {
 			compatible = "samsung,exynos-sysmmu";
-			reg = <0x13CA0000 0x1000>;
+			reg = <0x13ca0000 0x1000>;
 			interrupts = <GIC_SPI 292 IRQ_TYPE_LEVEL_HIGH>;
 			clock-names = "aclk", "pclk";
 			clocks = <&cmu_gscl CLK_ACLK_SMMU_GSCL2>,
diff --git a/arch/arm64/boot/dts/exynos/exynos7-espresso.dts b/arch/arm64/boot/dts/exynos/exynos7-espresso.dts
index abb3bd700d6f..f3f4a6ab4b49 100644
--- a/arch/arm64/boot/dts/exynos/exynos7-espresso.dts
+++ b/arch/arm64/boot/dts/exynos/exynos7-espresso.dts
@@ -28,7 +28,7 @@ chosen {
 
 	memory@40000000 {
 		device_type = "memory";
-		reg = <0x0 0x40000000 0x0 0xC0000000>;
+		reg = <0x0 0x40000000 0x0 0xc0000000>;
 	};
 
 	usb30_vbus_reg: regulator-usb30 {
diff --git a/arch/arm64/boot/dts/exynos/exynos7.dtsi b/arch/arm64/boot/dts/exynos/exynos7.dtsi
index f378d8629d88..82fee1b7caab 100644
--- a/arch/arm64/boot/dts/exynos/exynos7.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos7.dtsi
@@ -119,7 +119,7 @@ psci {
 		compatible = "arm,psci";
 		method = "smc";
 		cpu_off = <0x84000002>;
-		cpu_on = <0xC4000003>;
+		cpu_on = <0xc4000003>;
 	};
 
 	soc: soc@0 {
@@ -146,7 +146,7 @@ gic: interrupt-controller@11001000 {
 
 		pdma0: dma-controller@10e10000 {
 			compatible = "arm,pl330", "arm,primecell";
-			reg = <0x10E10000 0x1000>;
+			reg = <0x10e10000 0x1000>;
 			interrupts = <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clock_fsys0 ACLK_PDMA0>;
 			clock-names = "apb_pclk";
@@ -155,7 +155,7 @@ pdma0: dma-controller@10e10000 {
 
 		pdma1: dma-controller@10eb0000 {
 			compatible = "arm,pl330", "arm,primecell";
-			reg = <0x10EB0000 0x1000>;
+			reg = <0x10eb0000 0x1000>;
 			interrupts = <GIC_SPI 226 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clock_fsys0 ACLK_PDMA1>;
 			clock-names = "apb_pclk";
-- 
2.34.1

