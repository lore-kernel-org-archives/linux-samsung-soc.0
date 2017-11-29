From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v2] ARM: dts: exynos: Add audio power domain support to
 Exynos542x SoCs
Date: Wed, 29 Nov 2017 12:35:14 +0100
Message-ID: <20171129113514.15988-1-m.szyprowski@samsung.com>
References: <CGME20171129113526eucas1p11045cbb1dcdd42a68c2f5ba81a635213@eucas1p1.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:59313 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752530AbdK2Lf3 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 29 Nov 2017 06:35:29 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

Audio power domain includes following hardware modules: Pin controller
for GPZ bank, AudioSS clock controller, PL330 ADMA device and Exynos I2S
controller.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
Currently this domain will not be turned off, because pinctrl driver
don't support runtime PM and PL330 ADMA requires irq-safe runtime PM.
This will be fixed in the future.

Issues pointed in the discussion of v1 has been resolved by commit
07731019c59c ("pinctrl: samsung: Move retention control from mach-exynos
to the pinctrl driver").

Best regards
Marek Szyprowski
Samsung R&D Institute Poland

Changelog:
v2:
- added domain label

v1: https://patchwork.kernel.org/patch/9485083/
- initial version
---
 arch/arm/boot/dts/exynos5420.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
index 8aa2cc7aa125..933075bfce2a 100644
--- a/arch/arm/boot/dts/exynos5420.dtsi
+++ b/arch/arm/boot/dts/exynos5420.dtsi
@@ -188,6 +188,7 @@
 			clocks = <&clock CLK_FIN_PLL>, <&clock CLK_MAU_EPLL>,
 				 <&clock CLK_SCLK_MAUDIO0>, <&clock CLK_SCLK_MAUPCM0>;
 			clock-names = "pll_ref", "pll_in", "sclk_audio", "sclk_pcm_in";
+			power-domains = <&mau_pd>;
 		};
 
 		mfc: codec@11000000 {
@@ -322,6 +323,13 @@
 			clock-names = "oscclk", "clk0", "clk1", "clk2", "asb0", "asb1";
 		};
 
+		mau_pd: power-domain@100440E0 {
+			compatible = "samsung,exynos4210-pd";
+			reg = <0x100440E0 0x20>;
+			#power-domain-cells = <0>;
+			label = "MAU";
+		};
+
 		pinctrl_0: pinctrl@13400000 {
 			compatible = "samsung,exynos5420-pinctrl";
 			reg = <0x13400000 0x1000>;
@@ -356,6 +364,7 @@
 			compatible = "samsung,exynos5420-pinctrl";
 			reg = <0x03860000 0x1000>;
 			interrupts = <GIC_SPI 47 IRQ_TYPE_LEVEL_HIGH>;
+			power-domains = <&mau_pd>;
 		};
 
 		amba {
@@ -374,6 +383,7 @@
 				#dma-cells = <1>;
 				#dma-channels = <6>;
 				#dma-requests = <16>;
+				power-domains = <&mau_pd>;
 			};
 
 			pdma0: pdma@121A0000 {
@@ -446,6 +456,7 @@
 			samsung,idma-addr = <0x03000000>;
 			pinctrl-names = "default";
 			pinctrl-0 = <&i2s0_bus>;
+			power-domains = <&mau_pd>;
 			status = "disabled";
 		};
 
-- 
2.15.0
