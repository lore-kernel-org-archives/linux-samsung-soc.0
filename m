From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH 5/6] ARM: dts: exynos: Add regulator suspend configuration to Arndale Octa board
Date: Thu, 20 Jun 2019 20:35:29 +0200
Message-ID: <20190620183530.5386-5-krzk@kernel.org>
References: <20190620183530.5386-1-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190620183530.5386-1-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Sangbeom Kim <sbkim73@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Lee Jones <lee.jones@linaro.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, notify@kernel.org, Sylwester Nawrocki <snawrocki@kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

Add the PMIC regulator suspend configuration to Arndale Octa board to
reduce power usage during suspend and keep necessary regulators on.  The
configuration is based on vendor (Insignal) reference kernel.

This is purely for hardware description because board does not support
Suspend to RAM and the S2MPS11 driver does not support
"regulator-on-in-suspend" property.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm/boot/dts/exynos5420-arndale-octa.dts | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5420-arndale-octa.dts b/arch/arm/boot/dts/exynos5420-arndale-octa.dts
index dc9162a17475..4463af8fa79d 100644
--- a/arch/arm/boot/dts/exynos5420-arndale-octa.dts
+++ b/arch/arm/boot/dts/exynos5420-arndale-octa.dts
@@ -451,6 +451,10 @@
 				regulator-name = "PVDD_APIO_MMCOFF_2V8";
 				regulator-min-microvolt = <1800000>;
 				regulator-max-microvolt = <2800000>;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
 			};
 
 			ldo14_reg: LDO14 {
@@ -464,12 +468,20 @@
 				regulator-name = "PVDD_PERI_2V8";
 				regulator-min-microvolt = <3300000>;
 				regulator-max-microvolt = <3300000>;
+
+				regulator-state-mem {
+					regulator-on-in-suspend;
+				};
 			};
 
 			ldo16_reg: LDO16 {
 				regulator-name = "PVDD_PERI_3V3";
 				regulator-min-microvolt = <2200000>;
 				regulator-max-microvolt = <2200000>;
+
+				regulator-state-mem {
+					regulator-on-in-suspend;
+				};
 			};
 
 			ldo17_reg: LDO17 {
@@ -489,6 +501,10 @@
 				regulator-name = "PVDD_TFLASH_2V8";
 				regulator-min-microvolt = <2800000>;
 				regulator-max-microvolt = <2800000>;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
 			};
 
 			ldo20_reg: LDO20 {
@@ -515,12 +531,20 @@
 				regulator-min-microvolt = <800000>;
 				regulator-max-microvolt = <1100000>;
 				regulator-always-on;
+
+				regulator-state-mem {
+					regulator-on-in-suspend;
+				};
 			};
 
 			ldo24_reg: LDO24 {
 				regulator-name = "PVDD_CAM1_AVDD_2V8";
 				regulator-min-microvolt = <2800000>;
 				regulator-max-microvolt = <2800000>;
+
+				regulator-state-mem {
+					regulator-on-in-suspend;
+				};
 			};
 
 			ldo25_reg: LDO25 {
@@ -540,6 +564,10 @@
 				regulator-name = "PVDD_G3DS_1V0";
 				regulator-min-microvolt = <800000>;
 				regulator-max-microvolt = <1100000>;
+
+				regulator-state-mem {
+					regulator-on-in-suspend;
+				};
 			};
 
 			ldo28_reg: LDO28 {
@@ -617,6 +645,10 @@
 				regulator-min-microvolt = <800000>;
 				regulator-max-microvolt = <1300000>;
 				regulator-always-on;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
 			};
 
 			buck2_reg: BUCK2 {
@@ -624,6 +656,10 @@
 				regulator-min-microvolt = <800000>;
 				regulator-max-microvolt = <1500000>;
 				regulator-always-on;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
 			};
 
 			buck3_reg: BUCK3 {
@@ -631,12 +667,20 @@
 				regulator-min-microvolt = <800000>;
 				regulator-max-microvolt = <1400000>;
 				regulator-always-on;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
 			};
 
 			buck4_reg: BUCK4 {
 				regulator-name = "PVDD_G3D_1V0";
 				regulator-min-microvolt = <800000>;
 				regulator-max-microvolt = <1400000>;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
 			};
 
 			buck5_reg: BUCK5 {
@@ -651,6 +695,10 @@
 				regulator-min-microvolt = <800000>;
 				regulator-max-microvolt = <1500000>;
 				regulator-always-on;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
 			};
 
 			buck7_reg: BUCK7 {
-- 
2.17.1
