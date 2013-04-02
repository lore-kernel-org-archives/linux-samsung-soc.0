From: Tushar Behera <tushar.behera@linaro.org>
Subject: [PATCH V3 4/7] ARM: dts: Add PMIC node entry for Arndale board
Date: Tue,  2 Apr 2013 13:45:04 +0530
Message-ID: <1364890507-19261-5-git-send-email-tushar.behera@linaro.org>
References: <1364890507-19261-1-git-send-email-tushar.behera@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f172.google.com ([209.85.192.172]:62211 "EHLO
	mail-pd0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1761296Ab3DBI1D (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 2 Apr 2013 04:27:03 -0400
Received: by mail-pd0-f172.google.com with SMTP id 5so114353pdd.17
        for <linux-samsung-soc@vger.kernel.org>; Tue, 02 Apr 2013 01:27:02 -0700 (PDT)
In-Reply-To: <1364890507-19261-1-git-send-email-tushar.behera@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
Cc: kgene.kim@samsung.com, patches@linaro.org, Amit Daniel Kachhap <amit.daniel@samsung.com>

From: Amit Daniel Kachhap <amit.daniel@samsung.com>

Added S5M8767 PMIC DT nodes for Arndale board. Only the used
LDO's/BUCK are defined here. Also the nodes describe the default/reset
state LDO's and no power mangement tuning is implemented. The usage
desription can be found in s5m8767 device tree binding documentation.

Signed-off-by: Amit Daniel Kachhap <amit.daniel@samsung.com>
Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
---
Changes for V3:
* Pin-control related modifications.

 arch/arm/boot/dts/exynos5250-arndale.dts |  255 +++++++++++++++++++++++++++++-
 1 file changed, 254 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/exynos5250-arndale.dts b/arch/arm/boot/dts/exynos5250-arndale.dts
index 03c9ad5..7c3f54b 100644
--- a/arch/arm/boot/dts/exynos5250-arndale.dts
+++ b/arch/arm/boot/dts/exynos5250-arndale.dts
@@ -25,7 +25,260 @@
 	};
 
 	i2c@12C60000 {
-		status = "disabled";
+		samsung,i2c-sda-delay = <100>;
+		samsung,i2c-max-bus-freq = <20000>;
+		samsung,i2c-slave-addr = <0x66>;
+
+		s5m8767_pmic@66 {
+			compatible = "samsung,s5m8767-pmic";
+			reg = <0x66>;
+
+			s5m8767,pmic-buck2-dvs-voltage = <1300000>;
+			s5m8767,pmic-buck3-dvs-voltage = <1100000>;
+			s5m8767,pmic-buck4-dvs-voltage = <1200000>;
+			s5m8767,pmic-buck-dvs-gpios = <&gpd1 0 0>,
+							<&gpd1 1 0>,
+							<&gpd1 2 0>;
+			s5m8767,pmic-buck-ds-gpios = <&gpx2 3 0>,
+							<&gpx2 4 0>,
+							<&gpx2 5 0>;
+			regulators {
+				ldo1_reg: LDO1 {
+					regulator-name = "VDD_ALIVE_1.0V";
+					regulator-min-microvolt = <1100000>;
+					regulator-max-microvolt = <1100000>;
+					regulator-always-on;
+					regulator-boot-on;
+					op_mode = <1>;
+				};
+
+				ldo2_reg: LDO2 {
+					regulator-name = "VDD_28IO_DP_1.35V";
+					regulator-min-microvolt = <1200000>;
+					regulator-max-microvolt = <1200000>;
+					regulator-always-on;
+					regulator-boot-on;
+					op_mode = <1>;
+				};
+
+				ldo3_reg: LDO3 {
+					regulator-name = "VDD_COMMON1_1.8V";
+					regulator-min-microvolt = <1800000>;
+					regulator-max-microvolt = <1800000>;
+					regulator-always-on;
+					regulator-boot-on;
+					op_mode = <1>;
+				};
+
+				ldo4_reg: LDO4 {
+					regulator-name = "VDD_IOPERI_1.8V";
+					regulator-min-microvolt = <1800000>;
+					regulator-max-microvolt = <1800000>;
+					op_mode = <1>;
+				};
+
+				ldo5_reg: LDO5 {
+					regulator-name = "VDD_EXT_1.8V";
+					regulator-min-microvolt = <1800000>;
+					regulator-max-microvolt = <1800000>;
+					regulator-always-on;
+					regulator-boot-on;
+					op_mode = <1>;
+				};
+
+				ldo6_reg: LDO6 {
+					regulator-name = "VDD_MPLL_1.1V";
+					regulator-min-microvolt = <1100000>;
+					regulator-max-microvolt = <1100000>;
+					regulator-always-on;
+					regulator-boot-on;
+					op_mode = <1>;
+				};
+
+				ldo7_reg: LDO7 {
+					regulator-name = "VDD_XPLL_1.1V";
+					regulator-min-microvolt = <1100000>;
+					regulator-max-microvolt = <1100000>;
+					regulator-always-on;
+					regulator-boot-on;
+					op_mode = <1>;
+				};
+
+				ldo8_reg: LDO8 {
+					regulator-name = "VDD_COMMON2_1.0V";
+					regulator-min-microvolt = <1000000>;
+					regulator-max-microvolt = <1000000>;
+					regulator-always-on;
+					regulator-boot-on;
+					op_mode = <1>;
+				};
+
+				ldo9_reg: LDO9 {
+					regulator-name = "VDD_33ON_3.0V";
+					regulator-min-microvolt = <3000000>;
+					regulator-max-microvolt = <3000000>;
+					op_mode = <1>;
+				};
+
+				ldo10_reg: LDO10 {
+					regulator-name = "VDD_COMMON3_1.8V";
+					regulator-min-microvolt = <1800000>;
+					regulator-max-microvolt = <1800000>;
+					regulator-always-on;
+					regulator-boot-on;
+					op_mode = <1>;
+				};
+
+				ldo11_reg: LDO11 {
+					regulator-name = "VDD_ABB2_1.8V";
+					regulator-min-microvolt = <1800000>;
+					regulator-max-microvolt = <1800000>;
+					regulator-always-on;
+					regulator-boot-on;
+					op_mode = <1>;
+				};
+
+				ldo12_reg: LDO12 {
+					regulator-name = "VDD_USB_3.0V";
+					regulator-min-microvolt = <3000000>;
+					regulator-max-microvolt = <3000000>;
+					regulator-always-on;
+					regulator-boot-on;
+					op_mode = <1>;
+				};
+
+				ldo13_reg: LDO13 {
+					regulator-name = "VDDQ_C2C_W_1.8V";
+					regulator-min-microvolt = <1800000>;
+					regulator-max-microvolt = <1800000>;
+					regulator-always-on;
+					regulator-boot-on;
+					op_mode = <1>;
+				};
+
+				ldo14_reg: LDO14 {
+					regulator-name = "VDD18_ABB0_3_1.8V";
+					regulator-min-microvolt = <1800000>;
+					regulator-max-microvolt = <1800000>;
+					regulator-always-on;
+					regulator-boot-on;
+					op_mode = <1>;
+				};
+
+				ldo15_reg: LDO15 {
+					regulator-name = "VDD10_COMMON4_1.0V";
+					regulator-min-microvolt = <1000000>;
+					regulator-max-microvolt = <1000000>;
+					regulator-always-on;
+					regulator-boot-on;
+					op_mode = <1>;
+				};
+
+				ldo16_reg: LDO16 {
+					regulator-name = "VDD18_HSIC_1.8V";
+					regulator-min-microvolt = <1800000>;
+					regulator-max-microvolt = <1800000>;
+					regulator-always-on;
+					regulator-boot-on;
+					op_mode = <1>;
+				};
+
+				ldo17_reg: LDO17 {
+					regulator-name = "VDDQ_MMC2_3_2.8V";
+					regulator-min-microvolt = <2800000>;
+					regulator-max-microvolt = <2800000>;
+					regulator-always-on;
+					regulator-boot-on;
+					op_mode = <1>;
+				};
+
+				ldo18_reg: LDO18 {
+					regulator-name = "VDD_33ON_2.8V";
+					regulator-min-microvolt = <2800000>;
+					regulator-max-microvolt = <2800000>;
+					op_mode = <1>;
+				};
+
+				ldo22_reg: LDO22 {
+					regulator-name = "EXT_33_OFF";
+					regulator-min-microvolt = <3300000>;
+					regulator-max-microvolt = <3300000>;
+					op_mode = <1>;
+				};
+
+				ldo23_reg: LDO23 {
+					regulator-name = "EXT_28_OFF";
+					regulator-min-microvolt = <2800000>;
+					regulator-max-microvolt = <2800000>;
+					op_mode = <1>;
+				};
+
+				ldo25_reg: LDO25 {
+					regulator-name = "PVDD_LDO25";
+					regulator-min-microvolt = <1200000>;
+					regulator-max-microvolt = <1200000>;
+					op_mode = <1>;
+				};
+
+				ldo26_reg: LDO26 {
+					regulator-name = "EXT_18_OFF";
+					regulator-min-microvolt = <1800000>;
+					regulator-max-microvolt = <1800000>;
+					op_mode = <1>;
+				};
+
+				buck1_reg: BUCK1 {
+					regulator-name = "vdd_mif";
+					regulator-min-microvolt = <950000>;
+					regulator-max-microvolt = <1200000>;
+					regulator-always-on;
+					regulator-boot-on;
+					op_mode = <1>;
+				};
+
+				buck2_reg: BUCK2 {
+					regulator-name = "vdd_arm";
+					regulator-min-microvolt = <925000>;
+					regulator-max-microvolt = <1300000>;
+					regulator-always-on;
+					regulator-boot-on;
+					op_mode = <1>;
+				};
+
+				buck3_reg: BUCK3 {
+					regulator-name = "vdd_int";
+					regulator-min-microvolt = <900000>;
+					regulator-max-microvolt = <1200000>;
+					regulator-always-on;
+					regulator-boot-on;
+					op_mode = <1>;
+				};
+
+				buck4_reg: BUCK4 {
+					regulator-name = "vdd_g3d";
+					regulator-min-microvolt = <1000000>;
+					regulator-max-microvolt = <1000000>;
+					regulator-boot-on;
+					op_mode = <1>;
+				};
+
+				buck5_reg: BUCK5 {
+					regulator-name = "VDD_MEM_1.35V";
+					regulator-min-microvolt = <750000>;
+					regulator-max-microvolt = <1355000>;
+					regulator-always-on;
+					regulator-boot-on;
+					op_mode = <1>;
+				};
+
+				buck9_reg: BUCK9 {
+					regulator-name = "VDD_33_OFF_EXT1";
+					regulator-min-microvolt = <750000>;
+					regulator-max-microvolt = <3000000>;
+					op_mode = <1>;
+				};
+			};
+		};
 	};
 
 	i2c@12C70000 {
-- 
1.7.9.5
