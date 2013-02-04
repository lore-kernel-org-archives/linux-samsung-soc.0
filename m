From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 1/1] ARM: dts: Add s5m8767 PMIC node to exynos4412-origen.dts
Date: Mon,  4 Feb 2013 12:01:54 +0530
Message-ID: <1359959514-21866-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-da0-f45.google.com ([209.85.210.45]:46462 "EHLO
	mail-da0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751699Ab3BDGlP (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 4 Feb 2013 01:41:15 -0500
Received: by mail-da0-f45.google.com with SMTP id w4so2514744dam.32
        for <linux-samsung-soc@vger.kernel.org>; Sun, 03 Feb 2013 22:41:14 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, sachin.kamat@linaro.org, patches@linaro.org

Added s5m8767 PMIC node to exynos4412-origen DT file.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
This patch is created against for-next branch of Kukjin Kim's tree.
This patch is added on top of the following patch:
http://www.spinics.net/lists/linux-samsung-soc/msg15423.html

and based on the below patch:
http://comments.gmane.org/gmane.linux.kernel/1434801
---
 arch/arm/boot/dts/exynos4412-origen.dts |  330 +++++++++++++++++++++++++++++++
 1 files changed, 330 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4412-origen.dts b/arch/arm/boot/dts/exynos4412-origen.dts
index e066fc6..daa3884 100644
--- a/arch/arm/boot/dts/exynos4412-origen.dts
+++ b/arch/arm/boot/dts/exynos4412-origen.dts
@@ -65,4 +65,334 @@
 	serial@13830000 {
 		status = "okay";
 	};
+
+	i2c@13860000 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		samsung,i2c-sda-delay = <100>;
+		samsung,i2c-max-bus-freq = <20000>;
+		pinctrl-0 = <&i2c0_bus>;
+		pinctrl-names = "default";
+		status = "okay";
+
+		s5m8767_pmic@66 {
+			compatible = "samsung,s5m8767-pmic";
+			reg = <0x66>;
+
+			s5m8767,pmic-buck-default-dvs-idx = <3>;
+
+			s5m8767,pmic-buck-dvs-gpios = <&gpx2 3 0>,
+							 <&gpx2 4 0>,
+							 <&gpx2 5 0>;
+
+			s5m8767,pmic-buck-ds-gpios = <&gpm3 5 0>,
+							<&gpm3 6 0>,
+							<&gpm3 7 0>;
+
+			s5m8767,pmic-buck2-dvs-voltage = <1250000>, <1200000>,
+							 <1200000>, <1200000>,
+							 <1200000>, <1200000>,
+							 <1200000>, <1200000>;
+
+			s5m8767,pmic-buck3-dvs-voltage = <1100000>, <1100000>,
+							 <1100000>, <1100000>,
+							 <1100000>, <1100000>,
+							 <1100000>, <1100000>;
+
+			s5m8767,pmic-buck4-dvs-voltage = <1200000>, <1200000>,
+							 <1200000>, <1200000>,
+							 <1200000>, <1200000>,
+							 <1200000>, <1200000>;
+
+			regulators {
+				ldo1_reg: LDO1 {
+					regulator-name = "VDD_ALIVE";
+					regulator-min-microvolt = <1100000>;
+					regulator-max-microvolt = <1100000>;
+					regulator-always-on;
+					regulator-boot-on;
+					op_mode = <1>; /* Normal Mode */
+				};
+
+				ldo2_reg: LDO2 {
+					regulator-name = "VDDQ_M12";
+					regulator-min-microvolt = <1200000>;
+					regulator-max-microvolt = <1200000>;
+					regulator-always-on;
+					op_mode = <1>; /* Normal Mode */
+				};
+
+				ldo3_reg: LDO3 {
+					regulator-name = "VDDIOAP_18";
+					regulator-min-microvolt = <1800000>;
+					regulator-max-microvolt = <1800000>;
+					regulator-always-on;
+					op_mode = <1>; /* Normal Mode */
+				};
+
+				ldo4_reg: LDO4 {
+					regulator-name = "VDDQ_PRE";
+					regulator-min-microvolt = <1800000>;
+					regulator-max-microvolt = <1800000>;
+					regulator-always-on;
+					op_mode = <1>; /* Normal Mode */
+				};
+
+				ldo5_reg: LDO5 {
+					regulator-name = "VDD18_2M";
+					regulator-min-microvolt = <1800000>;
+					regulator-max-microvolt = <1800000>;
+					regulator-always-on;
+					op_mode = <1>; /* Normal Mode */
+				};
+
+				ldo6_reg: LDO6 {
+					regulator-name = "VDD10_MPLL";
+					regulator-min-microvolt = <1000000>;
+					regulator-max-microvolt = <1000000>;
+					regulator-always-on;
+					op_mode = <1>; /* Normal Mode */
+				};
+
+				ldo7_reg: LDO7 {
+					regulator-name = "VDD10_XPLL";
+					regulator-min-microvolt = <1000000>;
+					regulator-max-microvolt = <1000000>;
+					regulator-always-on;
+					op_mode = <1>; /* Normal Mode */
+				};
+
+				ldo8_reg: LDO8 {
+					regulator-name = "VDD10_MIPI";
+					regulator-min-microvolt = <1000000>;
+					regulator-max-microvolt = <1000000>;
+					regulator-always-on;
+					op_mode = <1>; /* Normal Mode */
+				};
+
+				ldo9_reg: LDO9 {
+					regulator-name = "VDD33_LCD";
+					regulator-min-microvolt = <3300000>;
+					regulator-max-microvolt = <3300000>;
+					regulator-always-on;
+					op_mode = <1>; /* Normal Mode */
+				};
+
+				ldo10_reg: LDO10 {
+					regulator-name = "VDD18_MIPI";
+					regulator-min-microvolt = <1800000>;
+					regulator-max-microvolt = <1800000>;
+					regulator-always-on;
+					op_mode = <1>; /* Normal Mode */
+				};
+
+				ldo11_reg: LDO11 {
+					regulator-name = "VDD18_ABB1";
+					regulator-min-microvolt = <1800000>;
+					regulator-max-microvolt = <1800000>;
+					regulator-always-on;
+					op_mode = <1>; /* Normal Mode */
+				};
+
+				ldo12_reg: LDO12 {
+					regulator-name = "VDD33_UOTG";
+					regulator-min-microvolt = <3300000>;
+					regulator-max-microvolt = <3300000>;
+					regulator-always-on;
+					op_mode = <1>; /* Normal Mode */
+				};
+
+				ldo13_reg: LDO13 {
+					regulator-name = "VDDIOPERI_18";
+					regulator-min-microvolt = <1800000>;
+					regulator-max-microvolt = <1800000>;
+					regulator-always-on;
+					op_mode = <1>; /* Normal Mode */
+				};
+
+				ldo14_reg: LDO14 {
+					regulator-name = "VDD18_ABB02";
+					regulator-min-microvolt = <1800000>;
+					regulator-max-microvolt = <1800000>;
+					regulator-always-on;
+					op_mode = <1>; /* Normal Mode */
+				};
+
+				ldo15_reg: LDO15 {
+					regulator-name = "VDD10_USH";
+					regulator-min-microvolt = <1000000>;
+					regulator-max-microvolt = <1000000>;
+					regulator-always-on;
+					op_mode = <1>; /* Normal Mode */
+				};
+
+				ldo16_reg: LDO16 {
+					regulator-name = "VDD18_HSIC";
+					regulator-min-microvolt = <1800000>;
+					regulator-max-microvolt = <1800000>;
+					regulator-always-on;
+					op_mode = <1>; /* Normal Mode */
+				};
+
+				ldo17_reg: LDO17 {
+					regulator-name = "VDDIOAP_MMC012_28";
+					regulator-min-microvolt = <2800000>;
+					regulator-max-microvolt = <2800000>;
+					regulator-always-on;
+					op_mode = <1>; /* Normal Mode */
+				};
+
+				ldo18_reg: LDO18 {
+					regulator-name = "VDDIOPERI_28";
+					regulator-min-microvolt = <2800000>;
+					regulator-max-microvolt = <2800000>;
+					regulator-always-on;
+					op_mode = <1>; /* Normal Mode */
+				};
+
+				ldo19_reg: LDO19 {
+					regulator-name = "DVDD25";
+					regulator-min-microvolt = <2500000>;
+					regulator-max-microvolt = <2500000>;
+					regulator-always-on;
+					op_mode = <1>; /* Normal Mode */
+				};
+
+				ldo20_reg: LDO20 {
+					regulator-name = "VDD28_CAM";
+					regulator-min-microvolt = <2800000>;
+					regulator-max-microvolt = <2800000>;
+					regulator-always-on;
+					op_mode = <1>; /* Normal Mode */
+				};
+
+				ldo21_reg: LDO21 {
+					regulator-name = "VDD28_AF";
+					regulator-min-microvolt = <2800000>;
+					regulator-max-microvolt = <2800000>;
+					regulator-always-on;
+					op_mode = <1>; /* Normal Mode */
+				};
+
+				ldo22_reg: LDO22 {
+					regulator-name = "VDDA28_2M";
+					regulator-min-microvolt = <2800000>;
+					regulator-max-microvolt = <2800000>;
+					regulator-always-on;
+					op_mode = <1>; /* Normal Mode */
+				};
+
+				ldo23_reg: LDO23 {
+					regulator-name = "VDD28_TF";
+					regulator-min-microvolt = <2800000>;
+					regulator-max-microvolt = <2800000>;
+					regulator-always-on;
+					op_mode = <1>; /* Normal Mode */
+				};
+
+				ldo24_reg: LDO24 {
+					regulator-name = "VDD33_A31";
+					regulator-min-microvolt = <3300000>;
+					regulator-max-microvolt = <3300000>;
+					regulator-always-on;
+					op_mode = <1>; /* Normal Mode */
+				};
+
+				ldo25_reg: LDO25 {
+					regulator-name = "VDD18_CAM";
+					regulator-min-microvolt = <1800000>;
+					regulator-max-microvolt = <1800000>;
+					regulator-always-on;
+					op_mode = <1>; /* Normal Mode */
+				};
+
+				ldo26_reg: LDO26 {
+					regulator-name = "VDD18_A31";
+					regulator-min-microvolt = <1800000>;
+					regulator-max-microvolt = <1800000>;
+					regulator-always-on;
+					op_mode = <1>; /* Normal Mode */
+				};
+
+				ldo27_reg: LDO27 {
+					regulator-name = "GPS_1V8";
+					regulator-min-microvolt = <1800000>;
+					regulator-max-microvolt = <1800000>;
+					regulator-always-on;
+					op_mode = <1>; /* Normal Mode */
+				};
+
+				ldo28_reg: LDO28 {
+					regulator-name = "DVDD12";
+					regulator-min-microvolt = <1200000>;
+					regulator-max-microvolt = <1200000>;
+					regulator-always-on;
+					op_mode = <1>; /* Normal Mode */
+				};
+
+				buck1_reg: BUCK1 {
+					regulator-name = "vdd_mif";
+					regulator-min-microvolt = <950000>;
+					regulator-max-microvolt	= <1100000>;
+					regulator-always-on;
+					regulator-boot-on;
+					op_mode = <1>; /* Normal Mode */
+				};
+
+				buck2_reg: BUCK2 {
+					regulator-name = "vdd_arm";
+					regulator-min-microvolt = <925000>;
+					regulator-max-microvolt	= <1300000>;
+					regulator-always-on;
+					regulator-boot-on;
+					op_mode = <1>; /* Normal Mode */
+				};
+
+				buck3_reg: BUCK3 {
+					regulator-name = "vdd_int";
+					regulator-min-microvolt = <900000>;
+					regulator-max-microvolt	= <1200000>;
+					regulator-always-on;
+					regulator-boot-on;
+					op_mode = <1>; /* Normal Mode */
+				};
+
+				buck4_reg: BUCK4 {
+					regulator-name = "vdd_g3d";
+					regulator-min-microvolt = <750000>;
+					regulator-max-microvolt	= <1500000>;
+					regulator-always-on;
+					regulator-boot-on;
+					op_mode = <1>; /* Normal Mode */
+				};
+
+				buck5_reg: BUCK5 {
+					regulator-name = "vdd_m12";
+					regulator-min-microvolt = <750000>;
+					regulator-max-microvolt	= <1500000>;
+					regulator-always-on;
+					regulator-boot-on;
+					op_mode = <1>; /* Normal Mode */
+				};
+
+				buck6_reg: BUCK6 {
+					regulator-name = "vdd12_5m";
+					regulator-min-microvolt = <750000>;
+					regulator-max-microvolt	= <1500000>;
+					regulator-always-on;
+					regulator-boot-on;
+					op_mode = <1>; /* Normal Mode */
+				};
+
+				buck9_reg: BUCK9 {
+					regulator-name = "vddf28_emmc";
+					regulator-min-microvolt = <750000>;
+					regulator-max-microvolt	= <3000000>;
+					regulator-always-on;
+					regulator-boot-on;
+					op_mode = <1>; /* Normal Mode */
+				};
+			};
+		};
+	};
 };
-- 
1.7.4.1
