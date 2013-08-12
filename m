From: Padmavathi Venna <padma.v@samsung.com>
Subject: [PATCH V4 3/4] ARM: dts: exynos5250: move common i2s properties to
 exynos5 dtsi
Date: Mon, 12 Aug 2013 15:19:53 +0530
Message-ID: <1376300994-1679-4-git-send-email-padma.v@samsung.com>
References: <1376300994-1679-1-git-send-email-padma.v@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:44962 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756027Ab3HLJsl (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 12 Aug 2013 05:48:41 -0400
In-reply-to: <1376300994-1679-1-git-send-email-padma.v@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org, devicetree@vger.kernel.org, padma.v@samsung.com, padma.kvr@gmail.com
Cc: broonie@kernel.org, kgene.kim@samsung.com, tomasz.figa@gmail.com, abrestic@chromium.org

I2S nodes shares some properties across exynos5 SoCs (exynos5250
and exyno5420). Common code is moved to exynos5.dtsi which is
included in exyno5250 and exynos5420 SoC files.

Signed-off-by: Padmavathi Venna <padma.v@samsung.com>
---
 arch/arm/boot/dts/exynos5.dtsi    |   21 +++++++++++++++++++++
 arch/arm/boot/dts/exynos5250.dtsi |   12 ------------
 2 files changed, 21 insertions(+), 12 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5.dtsi b/arch/arm/boot/dts/exynos5.dtsi
index f65e124..aae2fa1 100644
--- a/arch/arm/boot/dts/exynos5.dtsi
+++ b/arch/arm/boot/dts/exynos5.dtsi
@@ -108,4 +108,25 @@
 		interrupts = <0 42 0>;
 		status = "disabled";
 	};
+
+	i2s0: i2s@03830000 {
+		reg = <0x03830000 0x100>;
+		samsung,idma-addr = <0x03000000>;
+	};
+
+	i2s1: i2s@12D60000 {
+		compatible = "samsung,i2s-v5";
+		reg = <0x12D60000 0x100>;
+		dmas = <&pdma1 12
+			&pdma1 11>;
+		dma-names = "tx", "rx";
+	};
+
+	i2s2: i2s@12D70000 {
+		compatible = "samsung,i2s-v5";
+		reg = <0x12D70000 0x100>;
+		dmas = <&pdma0 12
+			&pdma0 11>;
+		dma-names = "tx", "rx";
+	};
 };
diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index ef57277..f941d52 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -406,7 +406,6 @@
 
 	i2s0: i2s@03830000 {
 		compatible = "samsung,i2s-v5";
-		reg = <0x03830000 0x100>;
 		dmas = <&pdma0 10
 			&pdma0 9
 			&pdma0 8>;
@@ -418,17 +417,11 @@
 		samsung,supports-6ch;
 		samsung,supports-rstclr;
 		samsung,supports-secdai;
-		samsung,idma-addr = <0x03000000>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&i2s0_bus>;
 	};
 
 	i2s1: i2s@12D60000 {
-		compatible = "samsung,i2s-v5";
-		reg = <0x12D60000 0x100>;
-		dmas = <&pdma1 12
-			&pdma1 11>;
-		dma-names = "tx", "rx";
 		clocks = <&clock 307>, <&clock 157>;
 		clock-names = "iis", "i2s_opclk0";
 		pinctrl-names = "default";
@@ -436,11 +429,6 @@
 	};
 
 	i2s2: i2s@12D70000 {
-		compatible = "samsung,i2s-v5";
-		reg = <0x12D70000 0x100>;
-		dmas = <&pdma0 12
-			&pdma0 11>;
-		dma-names = "tx", "rx";
 		clocks = <&clock 308>, <&clock 158>;
 		clock-names = "iis", "i2s_opclk0";
 		pinctrl-names = "default";
-- 
1.7.4.4
