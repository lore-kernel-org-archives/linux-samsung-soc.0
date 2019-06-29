From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH 1/2] ARM: dts: exynos: Adjust buck[78] regulators to supported values on Odroid XU3 family
Date: Sat, 29 Jun 2019 13:47:38 +0200
Message-ID: <20190629114739.11702-1-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Anand Moon <linux.amoon@gmail.com>, Marek Szyprowski <m.szyprowski@samsung.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

The datasheet of S2MPS11 PMIC is slightly non-consistent in buck[78]
voltage regulators values.

1. The voltage tables for configuring their registers mention range of
   voltages: 0.750 V to 3.55 V,
2. The constrains in electrical specifications say output voltage range
   to be different (buck7: 1.2 V to 1.5 V, buck8: 1.8 V to 2.1 V).

Adjust the ranges to match the electrical specifications to stay on the
safe side.  Also change the name of regulators to match reality.  Anyway
these regulators stay at default value so this should not have effect.

Reported-by: Anand Moon <linux.amoon@gmail.com>
Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm/boot/dts/exynos5422-odroid-core.dtsi | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5422-odroid-core.dtsi b/arch/arm/boot/dts/exynos5422-odroid-core.dtsi
index 9843d21d6924..829147e320e0 100644
--- a/arch/arm/boot/dts/exynos5422-odroid-core.dtsi
+++ b/arch/arm/boot/dts/exynos5422-odroid-core.dtsi
@@ -551,17 +551,17 @@
 			};
 
 			buck7_reg: BUCK7 {
-				regulator-name = "vdd_1.0v_ldo";
-				regulator-min-microvolt = <800000>;
+				regulator-name = "vdd_1.35v_ldo";
+				regulator-min-microvolt = <1200000>;
 				regulator-max-microvolt = <1500000>;
 				regulator-always-on;
 				regulator-boot-on;
 			};
 
 			buck8_reg: BUCK8 {
-				regulator-name = "vdd_1.8v_ldo";
-				regulator-min-microvolt = <800000>;
-				regulator-max-microvolt = <2000000>;
+				regulator-name = "vdd_2.0v_ldo";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <2100000>;
 				regulator-always-on;
 				regulator-boot-on;
 			};
-- 
2.17.1
