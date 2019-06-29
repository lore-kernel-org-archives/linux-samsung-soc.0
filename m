From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH 2/2] ARM: dts: exynos: Adjust buck[78] regulators to supported values on Arndale Octa
Date: Sat, 29 Jun 2019 13:47:39 +0200
Message-ID: <20190629114739.11702-2-krzk@kernel.org>
References: <20190629114739.11702-1-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190629114739.11702-1-krzk@kernel.org>
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
safe side.  Anyway these regulators stay at default value so this should
not have effect.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm/boot/dts/exynos5420-arndale-octa.dts | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5420-arndale-octa.dts b/arch/arm/boot/dts/exynos5420-arndale-octa.dts
index ac7f2fa0ba22..592d7b45ecc8 100644
--- a/arch/arm/boot/dts/exynos5420-arndale-octa.dts
+++ b/arch/arm/boot/dts/exynos5420-arndale-octa.dts
@@ -723,15 +723,15 @@
 
 			buck7_reg: BUCK7 {
 				regulator-name = "VIN_LLDO_1V4";
-				regulator-min-microvolt = <800000>;
+				regulator-min-microvolt = <1200000>;
 				regulator-max-microvolt = <1500000>;
 				regulator-always-on;
 			};
 
 			buck8_reg: BUCK8 {
 				regulator-name = "VIN_MLDO_2V0";
-				regulator-min-microvolt = <800000>;
-				regulator-max-microvolt = <2000000>;
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <2100000>;
 				regulator-always-on;
 			};
 
-- 
2.17.1
