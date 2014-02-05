From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 2/2] ARM: dts: Add I2S nodes to Exynos5420
Date: Wed,  5 Feb 2014 16:58:31 +0530
Message-ID: <1391599711-30328-2-git-send-email-sachin.kamat@linaro.org>
References: <1391599711-30328-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:48172 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751374AbaBELdn (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 5 Feb 2014 06:33:43 -0500
Received: by mail-pb0-f46.google.com with SMTP id um1so253270pbc.33
        for <linux-samsung-soc@vger.kernel.org>; Wed, 05 Feb 2014 03:33:42 -0800 (PST)
In-Reply-To: <1391599711-30328-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, broonie@linaro.org, sachin.kamat@linaro.org

Added I2S nodes to Exynos5420 DT file.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 arch/arm/boot/dts/exynos5420.dtsi |   43 +++++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
index 376d177e8810..d65cd1e4b4fa 100644
--- a/arch/arm/boot/dts/exynos5420.dtsi
+++ b/arch/arm/boot/dts/exynos5420.dtsi
@@ -337,6 +337,49 @@
 		};
 	};
 
+	i2s0: i2s@03830000 {
+		compatible = "samsung,exynos5420-i2s";
+		reg = <0x03830000 0x100>;
+		dmas = <&adma 0
+			&adma 2
+			&adma 1>;
+		dma-names = "tx", "rx", "tx-sec";
+		clocks = <&clock_audss EXYNOS_I2S_BUS>,
+			<&clock_audss EXYNOS_I2S_BUS>,
+			<&clock_audss EXYNOS_SCLK_I2S>;
+		clock-names = "iis", "i2s_opclk0", "i2s_opclk1";
+		samsung,idma-addr = <0x03000000>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&i2s0_bus>;
+		status = "disabled";
+	};
+
+	i2s1: i2s@12D60000 {
+		compatible = "samsung,exynos5420-i2s";
+		reg = <0x12D60000 0x100>;
+		dmas = <&pdma1 12
+			&pdma1 11>;
+		dma-names = "tx", "rx";
+		clocks = <&clock 275>, <&clock 138>;
+		clock-names = "iis", "i2s_opclk0";
+		pinctrl-names = "default";
+		pinctrl-0 = <&i2s1_bus>;
+		status = "disabled";
+	};
+
+	i2s2: i2s@12D70000 {
+		compatible = "samsung,exynos5420-i2s";
+		reg = <0x12D70000 0x100>;
+		dmas = <&pdma0 12
+			&pdma0 11>;
+		dma-names = "tx", "rx";
+		clocks = <&clock 276>, <&clock 139>;
+		clock-names = "iis", "i2s_opclk0";
+		pinctrl-names = "default";
+		pinctrl-0 = <&i2s2_bus>;
+		status = "disabled";
+	};
+
 	spi_0: spi@12d20000 {
 		compatible = "samsung,exynos4210-spi";
 		reg = <0x12d20000 0x100>;
-- 
1.7.9.5
