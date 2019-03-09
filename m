From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH 2/3] ARM: dts: exynos: Add support for UHS-I SD cards on Arndale Octa
Date: Sat,  9 Mar 2019 16:00:38 +0100
Message-ID: <20190309150039.8705-2-krzk@kernel.org>
References: <20190309150039.8705-1-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190309150039.8705-1-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

The Exynos5420's Mobile Storage Host supports SD cards in UHS-I standard
(SD specification v3.0), with 1.8 V signaling in SD UHS DDR50.  Adjust
the regulator and add necessary capability properties.  Change the SDR
and DDR timings to match values in Insignal v3.4 Android kernel.

Tested with SD UHS-I card in SD UHS DDR50 mode.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm/boot/dts/exynos5420-arndale-octa.dts | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5420-arndale-octa.dts b/arch/arm/boot/dts/exynos5420-arndale-octa.dts
index 751e772b5710..96a0eb73a99b 100644
--- a/arch/arm/boot/dts/exynos5420-arndale-octa.dts
+++ b/arch/arm/boot/dts/exynos5420-arndale-octa.dts
@@ -441,7 +441,7 @@
 
 			ldo13_reg: LDO13 {
 				regulator-name = "PVDD_APIO_MMCOFF_2V8";
-				regulator-min-microvolt = <2800000>;
+				regulator-min-microvolt = <1800000>;
 				regulator-max-microvolt = <2800000>;
 			};
 
@@ -701,14 +701,17 @@
 	status = "okay";
 	card-detect-delay = <200>;
 	samsung,dw-mshc-ciu-div = <3>;
-	samsung,dw-mshc-sdr-timing = <2 3>;
-	samsung,dw-mshc-ddr-timing = <1 2>;
+	samsung,dw-mshc-sdr-timing = <0 4>;
+	samsung,dw-mshc-ddr-timing = <0 2>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&sd2_clk &sd2_cmd &sd2_cd &sd2_bus1 &sd2_bus4>;
 	vmmc-supply = <&ldo19_reg>;
 	vqmmc-supply = <&ldo13_reg>;
 	bus-width = <4>;
 	cap-sd-highspeed;
+	sd-uhs-sdr50;
+	sd-uhs-sdr104;
+	sd-uhs-ddr50;
 };
 
 &pinctrl_0 {
-- 
2.17.1
