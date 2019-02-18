From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH 3/3] ARM: dts: exynos: Raise maximum buck regulator voltages on Arndale Octa
Date: Mon, 18 Feb 2019 18:32:58 +0100
Message-ID: <20190218173258.7071-3-krzk@kernel.org>
References: <20190218173258.7071-1-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190218173258.7071-1-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Markus Reichl <reichl@t-online.de>
List-Id: linux-samsung-soc@vger.kernel.org

Raise the buck 1-7 regulators voltages to allow cpufreq choosing them
and to fix warnings during boot:

    core: _opp_supported_by_regulators: OPP minuV: 1250000 maxuV: 1250000, not supported by regulator
    cpu cpu0: _opp_add: OPP not supported by regulators (1800000000)

The maximum value is now in sync with other Exynos5420 boards with
S2MPS11 PMIC (SMDK5420, Odroid XU3 family).  This also matches the
values used in old patches done by Linaro Samsung team.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm/boot/dts/exynos5420-arndale-octa.dts | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5420-arndale-octa.dts b/arch/arm/boot/dts/exynos5420-arndale-octa.dts
index 308c74ebeacd..c7d9604a119e 100644
--- a/arch/arm/boot/dts/exynos5420-arndale-octa.dts
+++ b/arch/arm/boot/dts/exynos5420-arndale-octa.dts
@@ -342,48 +342,48 @@
 			buck1_reg: BUCK1 {
 				regulator-name = "PVDD_MIF_1V1";
 				regulator-min-microvolt = <800000>;
-				regulator-max-microvolt = <1100000>;
+				regulator-max-microvolt = <1300000>;
 				regulator-always-on;
 			};
 
 			buck2_reg: BUCK2 {
 				regulator-name = "vdd_arm";
 				regulator-min-microvolt = <800000>;
-				regulator-max-microvolt = <1000000>;
+				regulator-max-microvolt = <1500000>;
 				regulator-always-on;
 			};
 
 			buck3_reg: BUCK3 {
 				regulator-name = "PVDD_INT_1V0";
 				regulator-min-microvolt = <800000>;
-				regulator-max-microvolt = <1000000>;
+				regulator-max-microvolt = <1400000>;
 				regulator-always-on;
 			};
 
 			buck4_reg: BUCK4 {
 				regulator-name = "PVDD_G3D_1V0";
 				regulator-min-microvolt = <800000>;
-				regulator-max-microvolt = <1000000>;
+				regulator-max-microvolt = <1400000>;
 			};
 
 			buck5_reg: BUCK5 {
 				regulator-name = "PVDD_LPDDR3_1V2";
 				regulator-min-microvolt = <800000>;
-				regulator-max-microvolt = <1200000>;
+				regulator-max-microvolt = <1400000>;
 				regulator-always-on;
 			};
 
 			buck6_reg: BUCK6 {
 				regulator-name = "PVDD_KFC_1V0";
 				regulator-min-microvolt = <800000>;
-				regulator-max-microvolt = <1000000>;
+				regulator-max-microvolt = <1500000>;
 				regulator-always-on;
 			};
 
 			buck7_reg: BUCK7 {
 				regulator-name = "VIN_LLDO_1V4";
 				regulator-min-microvolt = <800000>;
-				regulator-max-microvolt = <1400000>;
+				regulator-max-microvolt = <1500000>;
 				regulator-always-on;
 			};
 
-- 
2.17.1
