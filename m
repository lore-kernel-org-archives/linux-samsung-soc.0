From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: [PATCH v5 5/9] arm64: dts: exynos: Add RTC and ADC dt node for
 Exynos5433 SoC
Date: Thu, 05 Mar 2015 14:38:27 +0900
Message-ID: <1425533911-14800-6-git-send-email-cw00.choi@samsung.com>
References: <1425533911-14800-1-git-send-email-cw00.choi@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1425533911-14800-1-git-send-email-cw00.choi@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: kgene@kernel.org
Cc: mark.rutland@arm.com, marc.zyngier@arm.com, arnd@arndb.de, olof@lixom.net, catalin.marinas@arm.com, will.deacon@arm.com, inki.dae@samsung.com, chanho61.park@samsung.com, sw0312.kim@samsung.com, jh80.chung@samsung.com, ideal.song@samsung.com, cw00.choi@samsung.com, a.kesavan@samsung.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

This patch adds RTC (Real Time Clock) dt node for Exynos5433 SoC and adds
ADC dt node for Exynos5433 SoC. The c1b501564c98a94b4(iio: adc: exynos_adc:
Add support for exynos7) commit supports the ADC for Exynos7. Exynos5433's ADC
IP is the same with Exynos7's ADC IP. Exynos5433 has a little different from
ADCv2 on ADC_CON2 register. Exynos5433 don't contain OSEL/ESEL /HIGHF of ADC_CON2.

Cc: Kukjin Kim <kgene@kernel.org>
Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
Acked-by: Inki Dae <inki.dae@samsung.com>
---
 arch/arm64/boot/dts/exynos/exynos5433.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos5433.dtsi b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
index 0cf8a02..760ad81 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
@@ -816,6 +816,24 @@
 			clocks = <&xxti>;
 		};
 
+		rtc: rtc@10590000 {
+			compatible = "samsung,exynos3250-rtc";
+			reg = <0x10590000 0x100>;
+			interrupts = <0 385 0>, <0 386 0>;
+			status = "disabled";
+		};
+
+		adc: adc@14d10000 {
+			compatible = "samsung,exynos7-adc";
+			reg = <0x14d10000 0x100>;
+			interrupts = <0 438 0>;
+			clock-names = "adc";
+			clocks = <&cmu_peric CLK_PCLK_ADCIF>;
+			#io-channel-cells = <1>;
+			io-channel-ranges;
+			status = "disabled";
+		};
+
 		timer {
 			compatible = "arm,armv8-timer";
 			interrupts = <1 13 0xff04>,
-- 
1.8.5.5
