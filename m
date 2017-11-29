From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v2 5/6] arm64: dts: exynos: Add AUD power domain to
 Exynos5433 SoC
Date: Wed, 29 Nov 2017 12:26:37 +0100
Message-ID: <20171129112638.15813-6-m.szyprowski@samsung.com>
References: <20171129112638.15813-1-m.szyprowski@samsung.com>
        <CGME20171129112651eucas1p18703aa0c427252abed987e1553ff4efe@eucas1p1.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:57067 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932291AbdK2L0y (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 29 Nov 2017 06:26:54 -0500
In-reply-to: <20171129112638.15813-1-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Inki Dae <inki.dae@samsung.com>

This patch adds support for AUD power domain to Exynos5433 SoCs, which
contains following devices: a clock controller, a pin controller, LPASS
module, I2S controller, ADMA PL330 engine and UART #3 device.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm64/boot/dts/exynos/exynos5433.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos5433.dtsi b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
index cfa2a0d4dc2f..2c019a0fd8e3 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
@@ -395,6 +395,7 @@
 			#clock-cells = <1>;
 			clock-names = "oscclk", "fout_aud_pll";
 			clocks = <&xxti>, <&cmu_top CLK_FOUT_AUD_PLL>;
+			power-domains = <&pd_aud>;
 		};
 
 		cmu_bus0: clock-controller@13600000 {
@@ -568,6 +569,13 @@
 			label = "DISP";
 		};
 
+		pd_aud: power-domain@105c40c0 {
+			compatible = "samsung,exynos5433-pd";
+			reg = <0x105c40c0 0x20>;
+			#power-domain-cells = <0>;
+			label = "AUD";
+		};
+
 		pd_mfc: power-domain@105c4180 {
 			compatible = "samsung,exynos5433-pd";
 			reg = <0x105c4180 0x20>;
@@ -687,6 +695,7 @@
 			compatible = "samsung,exynos5433-pinctrl";
 			reg = <0x114b0000 0x1000>;
 			interrupts = <GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH>;
+			power-domains = <&pd_aud>;
 		};
 
 		pinctrl_cpif: pinctrl@10fe0000 {
@@ -1566,6 +1575,7 @@
 			clocks = <&cmu_aud CLK_PCLK_SFR0_CTRL>;
 			clock-names = "sfr0_ctrl";
 			samsung,pmu-syscon = <&pmu_system_controller>;
+			power-domains = <&pd_aud>;
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges;
@@ -1579,6 +1589,7 @@
 				#dma-cells = <1>;
 				#dma-channels = <8>;
 				#dma-requests = <32>;
+				power-domains = <&pd_aud>;
 			};
 
 			i2s0: i2s0@11440000 {
@@ -1595,6 +1606,7 @@
 				clock-names = "iis", "i2s_opclk0", "i2s_opclk1";
 				pinctrl-names = "default";
 				pinctrl-0 = <&i2s0_bus>;
+				power-domains = <&pd_aud>;
 				status = "disabled";
 			};
 
@@ -1607,6 +1619,7 @@
 				clock-names = "uart", "clk_uart_baud0";
 				pinctrl-names = "default";
 				pinctrl-0 = <&uart_aud_bus>;
+				power-domains = <&pd_aud>;
 				status = "disabled";
 			};
 		};
-- 
2.15.0
