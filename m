From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH] ARM: dts: exynos: Use space after '=' in exynos4412-itop-scp-core
Date: Sat, 27 Jul 2019 16:16:56 +0200
Message-ID: <20190727141656.10692-1-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Replace tab with space after assignment operator.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 .../arm/boot/dts/exynos4412-itop-scp-core.dtsi | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4412-itop-scp-core.dtsi b/arch/arm/boot/dts/exynos4412-itop-scp-core.dtsi
index 462a5409b1de..dfceb155b3a7 100644
--- a/arch/arm/boot/dts/exynos4412-itop-scp-core.dtsi
+++ b/arch/arm/boot/dts/exynos4412-itop-scp-core.dtsi
@@ -377,7 +377,7 @@
 			buck1_reg: BUCK1 {
 				regulator-name = "vdd_mif";
 				regulator-min-microvolt = <850000>;
-				regulator-max-microvolt	= <1100000>;
+				regulator-max-microvolt = <1100000>;
 				regulator-always-on;
 				regulator-boot-on;
 				op_mode = <1>; /* Normal Mode */
@@ -386,7 +386,7 @@
 			buck2_reg: BUCK2 {
 				regulator-name = "vdd_arm";
 				regulator-min-microvolt = <850000>;
-				regulator-max-microvolt	= <1456250>;
+				regulator-max-microvolt = <1456250>;
 				regulator-always-on;
 				regulator-boot-on;
 				op_mode = <1>; /* Normal Mode */
@@ -395,7 +395,7 @@
 			buck3_reg: BUCK3 {
 				regulator-name = "vdd_int";
 				regulator-min-microvolt = <875000>;
-				regulator-max-microvolt	= <1200000>;
+				regulator-max-microvolt = <1200000>;
 				regulator-always-on;
 				regulator-boot-on;
 				op_mode = <1>; /* Normal Mode */
@@ -404,7 +404,7 @@
 			buck4_reg: BUCK4 {
 				regulator-name = "vdd_g3d";
 				regulator-min-microvolt = <750000>;
-				regulator-max-microvolt	= <1500000>;
+				regulator-max-microvolt = <1500000>;
 				regulator-always-on;
 				regulator-boot-on;
 				op_mode = <1>; /* Normal Mode */
@@ -413,7 +413,7 @@
 			buck5_reg: BUCK5 {
 				regulator-name = "vdd_m12";
 				regulator-min-microvolt = <750000>;
-				regulator-max-microvolt	= <1500000>;
+				regulator-max-microvolt = <1500000>;
 				regulator-always-on;
 				regulator-boot-on;
 				op_mode = <1>; /* Normal Mode */
@@ -422,7 +422,7 @@
 			buck6_reg: BUCK6 {
 				regulator-name = "vdd12_5m";
 				regulator-min-microvolt = <750000>;
-				regulator-max-microvolt	= <1500000>;
+				regulator-max-microvolt = <1500000>;
 				regulator-always-on;
 				regulator-boot-on;
 				op_mode = <1>; /* Normal Mode */
@@ -431,7 +431,7 @@
 			buck7_reg: BUCK7 {
 				regulator-name = "pvdd_buck7";
 				regulator-min-microvolt = <750000>;
-				regulator-max-microvolt	= <2000000>;
+				regulator-max-microvolt = <2000000>;
 				regulator-boot-on;
 				regulator-always-on;
 				op_mode = <1>; /* Normal Mode */
@@ -440,7 +440,7 @@
 			buck8_reg: BUCK8 {
 				regulator-name = "pvdd_buck8";
 				regulator-min-microvolt = <750000>;
-				regulator-max-microvolt	= <1500000>;
+				regulator-max-microvolt = <1500000>;
 				regulator-boot-on;
 				regulator-always-on;
 				op_mode = <1>; /* Normal Mode */
@@ -449,7 +449,7 @@
 			buck9_reg: BUCK9 {
 				regulator-name = "vddf28_emmc";
 				regulator-min-microvolt = <750000>;
-				regulator-max-microvolt	= <3000000>;
+				regulator-max-microvolt = <3000000>;
 				op_mode = <1>; /* Normal Mode */
 			};
 		};
-- 
2.17.1
