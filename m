From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH 1/4] ARM: dts: exynos: Add missing used PMIC regulators on Exynos5422 Odroid boards
Date: Mon,  6 Aug 2018 18:09:30 +0200
Message-ID: <20180806160933.6578-1-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Define LDO2, LDO23 and LDO27 critical board regulators to describe the
hardware.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm/boot/dts/exynos5422-odroid-core.dtsi | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5422-odroid-core.dtsi b/arch/arm/boot/dts/exynos5422-odroid-core.dtsi
index 2f4f40882dab..d0218a82c93a 100644
--- a/arch/arm/boot/dts/exynos5422-odroid-core.dtsi
+++ b/arch/arm/boot/dts/exynos5422-odroid-core.dtsi
@@ -154,6 +154,13 @@
 				regulator-always-on;
 			};
 
+			ldo2_reg: LDO2 {
+				regulator-name = "vdd_ldo2";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-always-on;
+			};
+
 			ldo3_reg: LDO3 {
 				regulator-name = "vddq_mmc0";
 				regulator-min-microvolt = <1800000>;
@@ -261,6 +268,13 @@
 				regulator-max-microvolt = <2800000>;
 			};
 
+			ldo23_reg: LDO23 {
+				regulator-name = "vdd_mifs";
+				regulator-min-microvolt = <1100000>;
+				regulator-max-microvolt = <1100000>;
+				regulator-always-on;
+			};
+
 			ldo24_reg: LDO24 {
 				regulator-name = "tsp_io";
 				regulator-min-microvolt = <2800000>;
@@ -275,6 +289,13 @@
 				regulator-always-on;
 			};
 
+			ldo27_reg: LDO27 {
+				regulator-name = "vdd_g3ds";
+				regulator-min-microvolt = <1000000>;
+				regulator-max-microvolt = <1000000>;
+				regulator-always-on;
+			};
+
 			buck1_reg: BUCK1 {
 				regulator-name = "vdd_mif";
 				regulator-min-microvolt = <800000>;
-- 
2.14.1
