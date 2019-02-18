From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH 2/3] ARM: dts: exynos: Add unused PMIC regulators on Arndale Octa board
Date: Mon, 18 Feb 2019 18:32:57 +0100
Message-ID: <20190218173258.7071-2-krzk@kernel.org>
References: <20190218173258.7071-1-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190218173258.7071-1-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Markus Reichl <reichl@t-online.de>
List-Id: linux-samsung-soc@vger.kernel.org

Define the LDO14, LDO17, LDO22, LDO25, LDO30, LDO34, LDO36 and LDO37
unused regulators to describe the hardware.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm/boot/dts/exynos5420-arndale-octa.dts | 56 +++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5420-arndale-octa.dts b/arch/arm/boot/dts/exynos5420-arndale-octa.dts
index 832757999e4f..308c74ebeacd 100644
--- a/arch/arm/boot/dts/exynos5420-arndale-octa.dts
+++ b/arch/arm/boot/dts/exynos5420-arndale-octa.dts
@@ -180,6 +180,13 @@
 				regulator-max-microvolt = <2800000>;
 			};
 
+			ldo14_reg: LDO14 {
+				/* Unused */
+				regulator-name = "PVDD_LDO14";
+				regulator-min-microvolt = <800000>;
+				regulator-max-microvolt = <3950000>;
+			};
+
 			ldo15_reg: LDO15 {
 				regulator-name = "PVDD_PERI_2V8";
 				regulator-min-microvolt = <3300000>;
@@ -192,6 +199,13 @@
 				regulator-max-microvolt = <2200000>;
 			};
 
+			ldo17_reg: LDO17 {
+				/* Unused */
+				regulator-name = "PVDD_LDO17";
+				regulator-min-microvolt = <800000>;
+				regulator-max-microvolt = <3950000>;
+			};
+
 			ldo18_reg: LDO18 {
 				regulator-name = "PVDD_EMMC_1V8";
 				regulator-min-microvolt = <1800000>;
@@ -216,6 +230,13 @@
 				regulator-max-microvolt = <1800000>;
 			};
 
+			ldo22_reg: LDO22 {
+				/* Unused */
+				regulator-name = "PVDD_LDO22";
+				regulator-min-microvolt = <800000>;
+				regulator-max-microvolt = <2375000>;
+			};
+
 			ldo23_reg: LDO23 {
 				regulator-name = "PVDD_MIFS_1V1";
 				regulator-min-microvolt = <1200000>;
@@ -229,6 +250,13 @@
 				regulator-max-microvolt = <2800000>;
 			};
 
+			ldo25_reg: LDO25 {
+				/* Unused */
+				regulator-name = "PVDD_LDO25";
+				regulator-min-microvolt = <800000>;
+				regulator-max-microvolt = <3950000>;
+			};
+
 			ldo26_reg: LDO26 {
 				regulator-name = "PVDD_CAM0_AF_2V8";
 				regulator-min-microvolt = <3000000>;
@@ -253,6 +281,13 @@
 				regulator-max-microvolt = <1800000>;
 			};
 
+			ldo30_reg: LDO30 {
+				/* Unused */
+				regulator-name = "PVDD_LDO30";
+				regulator-min-microvolt = <800000>;
+				regulator-max-microvolt = <3950000>;
+			};
+
 			ldo31_reg: LDO31 {
 				regulator-name = "PVDD_PERI_1V8";
 				regulator-min-microvolt = <1800000>;
@@ -271,12 +306,33 @@
 				regulator-max-microvolt = <1800000>;
 			};
 
+			ldo34_reg: LDO34 {
+				/* Unused */
+				regulator-name = "PVDD_LDO34";
+				regulator-min-microvolt = <800000>;
+				regulator-max-microvolt = <3950000>;
+			};
+
 			ldo35_reg: LDO35 {
 				regulator-name = "PVDD_CAM0_DVDD_1V2";
 				regulator-min-microvolt = <1200000>;
 				regulator-max-microvolt = <1200000>;
 			};
 
+			ldo36_reg: LDO36 {
+				/* Unused */
+				regulator-name = "PVDD_LDO36";
+				regulator-min-microvolt = <800000>;
+				regulator-max-microvolt = <3950000>;
+			};
+
+			ldo37_reg: LDO37 {
+				/* Unused */
+				regulator-name = "PVDD_LDO37";
+				regulator-min-microvolt = <800000>;
+				regulator-max-microvolt = <3950000>;
+			};
+
 			ldo38_reg: LDO38 {
 				regulator-name = "PVDD_CAM0_AVDD_2V8";
 				regulator-min-microvolt = <2800000>;
-- 
2.17.1
