From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 2/3] ARM: dts: exynos: Add audio power domain to Exynos5250
Date: Fri, 08 Dec 2017 15:53:55 +0100
Message-ID: <20171208145356.24152-3-m.szyprowski@samsung.com>
References: <20171208145356.24152-1-m.szyprowski@samsung.com>
        <CGME20171208145403eucas1p15c5b3075062c6ca28a877976d8d647bc@eucas1p1.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:50881 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754133AbdLHOyG (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 8 Dec 2017 09:54:06 -0500
In-reply-to: <20171208145356.24152-1-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

Audio power domain includes following hardware modules: Pin controller
for GPZ bank, AudioSS clock controller and three Exynos I2S controller.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm/boot/dts/exynos5250.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index a4168aa926f9..709a54743d73 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -136,6 +136,13 @@
 			clock-names = "oscclk", "clk0", "clk1";
 		};
 
+		pd_mau: power-domain@100440C0 {
+			compatible = "samsung,exynos4210-pd";
+			reg = <0x100440C0 0x20>;
+			#power-domain-cells = <0>;
+			label = "MAU";
+		};
+
 		clock: clock-controller@10010000 {
 			compatible = "samsung,exynos5250-clock";
 			reg = <0x10010000 0x30000>;
@@ -149,6 +156,7 @@
 			clocks = <&clock CLK_FIN_PLL>, <&clock CLK_FOUT_EPLL>,
 				 <&clock CLK_SCLK_AUDIO0>, <&clock CLK_DIV_PCM0>;
 			clock-names = "pll_ref", "pll_in", "sclk_audio", "sclk_pcm_in";
+			power-domains = <&pd_mau>;
 		};
 
 		timer {
@@ -223,6 +231,7 @@
 			compatible = "samsung,exynos5250-pinctrl";
 			reg = <0x03860000 0x1000>;
 			interrupts = <GIC_SPI 47 IRQ_TYPE_LEVEL_HIGH>;
+			power-domains = <&pd_mau>;
 		};
 
 		pmu_system_controller: system-controller@10040000 {
@@ -486,6 +495,7 @@
 			samsung,idma-addr = <0x03000000>;
 			pinctrl-names = "default";
 			pinctrl-0 = <&i2s0_bus>;
+			power-domains = <&pd_mau>;
 		};
 
 		i2s1: i2s@12D60000 {
@@ -499,6 +509,7 @@
 			clock-names = "iis", "i2s_opclk0";
 			pinctrl-names = "default";
 			pinctrl-0 = <&i2s1_bus>;
+			power-domains = <&pd_mau>;
 		};
 
 		i2s2: i2s@12D70000 {
@@ -512,6 +523,7 @@
 			clock-names = "iis", "i2s_opclk0";
 			pinctrl-names = "default";
 			pinctrl-0 = <&i2s2_bus>;
+			power-domains = <&pd_mau>;
 		};
 
 		usb_dwc3 {
-- 
2.15.0
