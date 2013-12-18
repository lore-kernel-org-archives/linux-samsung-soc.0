From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH v2 1/1] ARM: dts: Add PMIC support to Arndale octa board
Date: Wed, 18 Dec 2013 13:52:23 +0530
Message-ID: <1387354943-8169-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f48.google.com ([209.85.160.48]:38183 "EHLO
	mail-pb0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751991Ab3LRIZd (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 18 Dec 2013 03:25:33 -0500
Received: by mail-pb0-f48.google.com with SMTP id md12so8104212pbc.21
        for <linux-samsung-soc@vger.kernel.org>; Wed, 18 Dec 2013 00:25:33 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, sachin.kamat@linaro.org

Added PMIC node to Arndale-Octa board.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
Changes since v1:
* Renamed the labels and fixed voltage levels as per board schema.
---
 arch/arm/boot/dts/exynos5420-arndale-octa.dts |  281 +++++++++++++++++++++++++
 1 file changed, 281 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5420-arndale-octa.dts b/arch/arm/boot/dts/exynos5420-arndale-octa.dts
index ec68b0e89a25..edd933feaf48 100644
--- a/arch/arm/boot/dts/exynos5420-arndale-octa.dts
+++ b/arch/arm/boot/dts/exynos5420-arndale-octa.dts
@@ -11,6 +11,7 @@
 
 /dts-v1/;
 #include "exynos5420.dtsi"
+#include <dt-bindings/interrupt-controller/irq.h>
 
 / {
 	model = "Insignal Arndale Octa evaluation board based on EXYNOS5420";
@@ -68,4 +69,284 @@
 			bus-width = <4>;
 		};
 	};
+
+	hsi2c_4: i2c@12CA0000 {
+		status = "okay";
+
+		s2mps11_pmic@66 {
+			compatible = "samsung,s2mps11-pmic";
+			reg = <0x66>;
+			s2mps11,buck2-ramp-delay = <12>;
+			s2mps11,buck34-ramp-delay = <12>;
+			s2mps11,buck16-ramp-delay = <12>;
+			s2mps11,buck6-ramp-enable = <1>;
+			s2mps11,buck2-ramp-enable = <1>;
+			s2mps11,buck3-ramp-enable = <1>;
+			s2mps11,buck4-ramp-enable = <1>;
+
+			interrupt-parent = <&gpx3>;
+			interrupts = <2 IRQ_TYPE_LEVEL_HIGH>;
+
+			s2mps11_osc: clocks {
+				#clock-cells = <1>;
+				clock-output-names = "s2mps11_ap",
+						"s2mps11_cp", "s2mps11_bt";
+			};
+
+			regulators {
+				ldo1_reg: LDO1 {
+					regulator-name = "PVDD_ALIVE_1V0";
+					regulator-min-microvolt = <1000000>;
+					regulator-max-microvolt = <1000000>;
+					regulator-always-on;
+				};
+
+				ldo2_reg: LDO2 {
+					regulator-name = "PVDD_APIO_1V8";
+					regulator-min-microvolt = <1800000>;
+					regulator-max-microvolt = <1800000>;
+				};
+
+				ldo3_reg: LDO3 {
+					regulator-name = "PVDD_APIO_MMCON_1V8";
+					regulator-min-microvolt = <1800000>;
+					regulator-max-microvolt = <1800000>;
+				};
+
+				ldo4_reg: LDO4 {
+					regulator-name = "PVDD_ADC_1V8";
+					regulator-min-microvolt = <1800000>;
+					regulator-max-microvolt = <1800000>;
+				};
+
+				ldo5_reg: LDO5 {
+					regulator-name = "PVDD_PLL_1V8";
+					regulator-min-microvolt = <1800000>;
+					regulator-max-microvolt = <1800000>;
+					regulator-always-on;
+				};
+
+				ldo6_reg: LDO6 {
+					regulator-name = "PVDD_ANAIP_1V0";
+					regulator-min-microvolt = <1000000>;
+					regulator-max-microvolt = <1000000>;
+				};
+
+				ldo7_reg: LDO7 {
+					regulator-name = "PVDD_ANAIP_1V8";
+					regulator-min-microvolt = <1800000>;
+					regulator-max-microvolt = <1800000>;
+				};
+
+				ldo8_reg: LDO8 {
+					regulator-name = "PVDD_ABB_1V8";
+					regulator-min-microvolt = <1800000>;
+					regulator-max-microvolt = <1800000>;
+				};
+
+				ldo9_reg: LDO9 {
+					regulator-name = "PVDD_USB_3V3";
+					regulator-min-microvolt = <3000000>;
+					regulator-max-microvolt = <3000000>;
+				};
+
+				ldo10_reg: LDO10 {
+					regulator-name = "PVDD_PRE_1V8";
+					regulator-min-microvolt = <1800000>;
+					regulator-max-microvolt = <1800000>;
+					regulator-always-on;
+				};
+
+				ldo11_reg: LDO11 {
+					regulator-name = "PVDD_USB_1V0";
+					regulator-min-microvolt = <1000000>;
+					regulator-max-microvolt = <1000000>;
+					regulator-always-on;
+				};
+
+				ldo12_reg: LDO12 {
+					regulator-name = "PVDD_HSIC_1V8";
+					regulator-min-microvolt = <1800000>;
+					regulator-max-microvolt = <1800000>;
+				};
+
+				ldo13_reg: LDO13 {
+					regulator-name = "PVDD_APIO_MMCOFF_2V8";
+					regulator-min-microvolt = <2800000>;
+					regulator-max-microvolt = <2800000>;
+				};
+
+				ldo15_reg: LDO15 {
+					regulator-name = "PVDD_PERI_2V8";
+					regulator-min-microvolt = <3300000>;
+					regulator-max-microvolt = <3300000>;
+				};
+
+				ldo16_reg: LDO16 {
+					regulator-name = "PVDD_PERI_3V3";
+					regulator-min-microvolt = <2200000>;
+					regulator-max-microvolt = <2200000>;
+				};
+
+				ldo18_reg: LDO18 {
+					regulator-name = "PVDD_EMMC_1V8";
+					regulator-min-microvolt = <1800000>;
+					regulator-max-microvolt = <1800000>;
+				};
+
+				ldo19_reg: LDO19 {
+					regulator-name = "PVDD_TFLASH_2V8";
+					regulator-min-microvolt = <2800000>;
+					regulator-max-microvolt = <2800000>;
+				};
+
+				ldo20_reg: LDO20 {
+					regulator-name = "PVDD_BTWIFI_1V8";
+					regulator-min-microvolt = <1800000>;
+					regulator-max-microvolt = <1800000>;
+				};
+
+				ldo21_reg: LDO21 {
+					regulator-name = "PVDD_CAM1IO_1V8";
+					regulator-min-microvolt = <1800000>;
+					regulator-max-microvolt = <1800000>;
+				};
+
+				ldo23_reg: LDO23 {
+					regulator-name = "PVDD_MIFS_1V1";
+					regulator-min-microvolt = <1200000>;
+					regulator-max-microvolt = <1200000>;
+				};
+
+				ldo24_reg: LDO24 {
+					regulator-name = "PVDD_CAM1_AVDD_2V8";
+					regulator-min-microvolt = <2800000>;
+					regulator-max-microvolt = <2800000>;
+				};
+
+				ldo26_reg: LDO26 {
+					regulator-name = "PVDD_CAM0_AF_2V8";
+					regulator-min-microvolt = <3000000>;
+					regulator-max-microvolt = <3000000>;
+				};
+
+				ldo27_reg: LDO27 {
+					regulator-name = "PVDD_G3DS_1V0";
+					regulator-min-microvolt = <1200000>;
+					regulator-max-microvolt = <1200000>;
+				};
+
+				ldo28_reg: LDO28 {
+					regulator-name = "PVDD_TSP_3V3";
+					regulator-min-microvolt = <3300000>;
+					regulator-max-microvolt = <3300000>;
+				};
+
+				ldo29_reg: LDO29 {
+					regulator-name = "PVDD_AUDIO_1V8";
+					regulator-min-microvolt = <1800000>;
+					regulator-max-microvolt = <1800000>;
+				};
+
+				ldo31_reg: LDO31 {
+					regulator-name = "PVDD_PERI_1V8";
+					regulator-min-microvolt = <1800000>;
+					regulator-max-microvolt = <1800000>;
+				};
+
+				ldo32_reg: LDO32 {
+					regulator-name = "PVDD_LCD_1V8";
+					regulator-min-microvolt = <1800000>;
+					regulator-max-microvolt = <1800000>;
+				};
+
+				ldo33_reg: LDO33 {
+					regulator-name = "PVDD_CAM0IO_1V8";
+					regulator-min-microvolt = <1800000>;
+					regulator-max-microvolt = <1800000>;
+				};
+
+				ldo35_reg: LDO35 {
+					regulator-name = "PVDD_CAM0_DVDD_1V2";
+					regulator-min-microvolt = <1200000>;
+					regulator-max-microvolt = <1200000>;
+				};
+
+				ldo38_reg: LDO38 {
+					regulator-name = "PVDD_CAM0_AVDD_2V8";
+					regulator-min-microvolt = <2800000>;
+					regulator-max-microvolt = <2800000>;
+				};
+
+				buck1_reg: BUCK1 {
+					regulator-name = "PVDD_MIF_1V1";
+					regulator-min-microvolt = <800000>;
+					regulator-max-microvolt = <1100000>;
+					regulator-always-on;
+				};
+
+				buck2_reg: BUCK2 {
+					regulator-name = "vdd_arm";
+					regulator-min-microvolt = <800000>;
+					regulator-max-microvolt = <1000000>;
+					regulator-always-on;
+				};
+
+				buck3_reg: BUCK3 {
+					regulator-name = "PVDD_INT_1V0";
+					regulator-min-microvolt = <800000>;
+					regulator-max-microvolt = <1000000>;
+					regulator-always-on;
+				};
+
+				buck4_reg: BUCK4 {
+					regulator-name = "PVDD_G3D_1V0";
+					regulator-min-microvolt = <800000>;
+					regulator-max-microvolt = <1000000>;
+				};
+
+				buck5_reg: BUCK5 {
+					regulator-name = "PVDD_LPDDR3_1V2";
+					regulator-min-microvolt = <800000>;
+					regulator-max-microvolt = <1200000>;
+					regulator-always-on;
+				};
+
+				buck6_reg: BUCK6 {
+					regulator-name = "PVDD_KFC_1V0";
+					regulator-min-microvolt = <800000>;
+					regulator-max-microvolt = <1000000>;
+					regulator-always-on;
+				};
+
+				buck7_reg: BUCK7 {
+					regulator-name = "VIN_LLDO_1V4";
+					regulator-min-microvolt = <800000>;
+					regulator-max-microvolt = <1400000>;
+					regulator-always-on;
+				};
+
+				buck8_reg: BUCK8 {
+					regulator-name = "VIN_MLDO_2V0";
+					regulator-min-microvolt = <800000>;
+					regulator-max-microvolt = <2000000>;
+					regulator-always-on;
+				};
+
+				buck9_reg: BUCK9 {
+					regulator-name = "VIN_HLDO_3V5";
+					regulator-min-microvolt = <3000000>;
+					regulator-max-microvolt = <3500000>;
+					regulator-always-on;
+				};
+
+				buck10_reg: BUCK10 {
+					regulator-name = "PVDD_EMMCF_2V8";
+					regulator-min-microvolt = <2800000>;
+					regulator-max-microvolt = <2800000>;
+				};
+			};
+		};
+	};
+
 };
-- 
1.7.9.5
