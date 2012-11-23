From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: [PATCH] ARM: dts: add max8997 device node for exynos4210-origen board
Date: Fri, 23 Nov 2012 15:23:32 +0530
Message-ID: <1353664412-17678-1-git-send-email-thomas.abraham@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:28237 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758644Ab2KWJZT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 23 Nov 2012 04:25:19 -0500
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MDX00KU4OTNYZW0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 23 Nov 2012 18:25:17 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.37])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MDX00A9ZOSEGV50@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 23 Nov 2012 18:25:17 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com

Add max8997 regulator device node for exynos4210-origen board and list
all the supported regulators.

Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
---
 arch/arm/boot/dts/exynos4210-origen.dts |  143 +++++++++++++++++++++++++++++++
 1 files changed, 143 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4210-origen.dts b/arch/arm/boot/dts/exynos4210-origen.dts
index f271001..3bdd23d 100644
--- a/arch/arm/boot/dts/exynos4210-origen.dts
+++ b/arch/arm/boot/dts/exynos4210-origen.dts
@@ -73,6 +73,149 @@
 		status = "okay";
 	};
 
+	i2c@13860000 {
+		status = "okay";
+		samsung,i2c-sda-delay = <100>;
+		samsung,i2c-max-bus-freq = <20000>;
+		pinctrl-0 = <&i2c0_bus>;
+		pinctrl-names = "default";
+
+		max8997_pmic@66 {
+			compatible = "maxim,max8997-pmic";
+			reg = <0x66>;
+			interrupt-parent = <&gpx0>;
+			interrupts = <4 0>, <3 0>;
+
+			max8997,pmic-buck1-dvs-voltage = <1350000>;
+			max8997,pmic-buck2-dvs-voltage = <1100000>;
+			max8997,pmic-buck5-dvs-voltage = <1200000>;
+
+			regulators {
+				ldo1_reg: LDO1 {
+					regulator-name = "VDD_ABB_3.3V";
+					regulator-min-microvolt = <3300000>;
+					regulator-max-microvolt = <3300000>;
+				};
+
+				ldo2_reg: LDO2 {
+					regulator-name = "VDD_ALIVE_1.1V";
+					regulator-min-microvolt = <1100000>;
+					regulator-max-microvolt = <1100000>;
+					regulator-always-on;
+				};
+
+				ldo3_reg: LDO3 {
+					regulator-name = "VMIPI_1.1V";
+					regulator-min-microvolt = <1100000>;
+					regulator-max-microvolt = <1100000>;
+				};
+
+				ldo4_reg: LDO4 {
+					regulator-name = "VDD_RTC_1.8V";
+					regulator-min-microvolt = <1800000>;
+					regulator-max-microvolt	= <1800000>;
+					regulator-always-on;
+				};
+
+				ldo6_reg: LDO6 {
+					regulator-name = "VMIPI_1.8V";
+					regulator-min-microvolt = <1800000>;
+					regulator-max-microvolt	= <1800000>;
+					regulator-always-on;
+				};
+
+				ldo7_reg: LDO7 {
+					regulator-name = "VDD_AUD_1.8V";
+					regulator-min-microvolt = <1800000>;
+					regulator-max-microvolt	= <1800000>;
+				};
+
+				ldo8_reg: LDO8 {
+					regulator-name = "VADC_3.3V";
+					regulator-min-microvolt = <3300000>;
+					regulator-max-microvolt	= <3300000>;
+				};
+
+				ldo9_reg: LDO9 {
+					regulator-name = "DVDD_SWB_2.8V";
+					regulator-min-microvolt = <2800000>;
+					regulator-max-microvolt	= <2800000>;
+					regulator-always-on;
+				};
+
+				ldo10_reg: LDO10 {
+					regulator-name = "VDD_PLL_1.1V";
+					regulator-min-microvolt = <1100000>;
+					regulator-max-microvolt	= <1100000>;
+					regulator-always-on;
+				};
+
+				ldo11_reg: LDO11 {
+					regulator-name = "VDD_AUD_3V";
+					regulator-min-microvolt = <3000000>;
+					regulator-max-microvolt	= <3000000>;
+				};
+
+				ldo14_reg: LDO14 {
+					regulator-name = "AVDD18_SWB_1.8V";
+					regulator-min-microvolt = <1800000>;
+					regulator-max-microvolt	= <1800000>;
+					regulator-always-on;
+				};
+
+				ldo17_reg: LDO17 {
+					regulator-name = "VDD_SWB_3.3V";
+					regulator-min-microvolt = <3300000>;
+					regulator-max-microvolt	= <3300000>;
+					regulator-always-on;
+				};
+
+				ldo21_reg: LDO21 {
+					regulator-name = "VDD_MIF_1.2V";
+					regulator-min-microvolt = <1200000>;
+					regulator-max-microvolt	= <1200000>;
+					regulator-always-on;
+				};
+
+				buck1_reg: BUCK1 {
+					regulator-name = "VDD_ARM_1.2V";
+					regulator-min-microvolt = <950000>;
+					regulator-max-microvolt	= <1350000>;
+					regulator-always-on;
+					regulator-boot-on;
+				};
+
+				buck2_reg: BUCK2 {
+					regulator-name = "VDD_INT_1.1V";
+					regulator-min-microvolt = <900000>;
+					regulator-max-microvolt	= <1100000>;
+					regulator-always-on;
+					regulator-boot-on;
+				};
+
+				buck3_reg: BUCK3 {
+					regulator-name = "VDD_G3D_1.1V";
+					regulator-min-microvolt = <900000>;
+					regulator-max-microvolt = <1100000>;
+				};
+
+				buck5_reg: BUCK5 {
+					regulator-name = "VDDQ_M1M2_1.2V";
+					regulator-min-microvolt = <1200000>;
+					regulator-max-microvolt = <1200000>;
+					regulator-always-on;
+				};
+
+				buck7_reg: BUCK7 {
+					regulator-name = "VDD_LCD_3.3V";
+					regulator-min-microvolt = <3300000>;
+					regulator-max-microvolt = <3300000>;
+					regulator-boot-on;
+				};
+			};
+		};
+	};
+
 	gpio_keys {
 		compatible = "gpio-keys";
 		#address-cells = <1>;
-- 
1.6.6.rc2
