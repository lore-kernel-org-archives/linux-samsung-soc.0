From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: [PATCH 17/27] ARM: dts: exynos3250: Add ADC dt node to read analog raw
 data
Date: Thu, 10 Apr 2014 19:06:07 +0900
Message-ID: <1397124377-16969-9-git-send-email-cw00.choi@samsung.com>
References: <1397122658-16013-1-git-send-email-cw00.choi@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1397122658-16013-1-git-send-email-cw00.choi@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: kgene.kim@samsung.com, t.figa@samsung.com, linux-samsung-soc@vger.kernel.org
Cc: kyungmin.park@samsung.com, cw00.choi@samsung.com, inki.dae@samsung.com, sw0312.kim@samsung.com, hyunhee.kim@samsung.com, yj44.cho@samsung.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

This patch add ADC (Analog to Digital Converter) dt node to get raw data with
IIO subsystem. Usually, ADC is used to check temperature, jack type and so on.
Exynos3250 includes ADCv2 which is different from ADCv1 for Exynos4 SoC.

Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/boot/dts/exynos3250.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm/boot/dts/exynos3250.dtsi b/arch/arm/boot/dts/exynos3250.dtsi
index 2013d0d..c5e6917 100644
--- a/arch/arm/boot/dts/exynos3250.dtsi
+++ b/arch/arm/boot/dts/exynos3250.dtsi
@@ -84,6 +84,17 @@
 		interrupts = <0 240 0>;
 	};
 
+	adc: adc@126C0000 {
+		compatible = "samsung,exynos-adc-v2";
+		reg = <0x126C0000 0x100>, <0x10020718 0x4>;
+		interrupts = <0 137 0>;
+		clock-names = "adc", "sclk_tsadc";
+		clocks = <&cmu CLK_TSADC>, <&cmu CLK_SCLK_TSADC>;
+		#io-channel-cells = <1>;
+		io-channel-ranges;
+		status = "disabled";
+	};
+
 	serial@13800000 {
 		compatible = "samsung,exynos4210-uart";
 		reg = <0x13800000 0x100>;
-- 
1.8.0
