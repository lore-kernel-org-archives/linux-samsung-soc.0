From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH v2] ARM: dts: Add regulator entries to Exynos5420 SMDK board
Date: Thu,  5 Dec 2013 15:14:24 +0530
Message-ID: <1386236664-27763-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f52.google.com ([209.85.160.52]:54000 "EHLO
	mail-pb0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751926Ab3LEJrQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 5 Dec 2013 04:47:16 -0500
Received: by mail-pb0-f52.google.com with SMTP id uo5so25455012pbc.39
        for <linux-samsung-soc@vger.kernel.org>; Thu, 05 Dec 2013 01:47:15 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, sachin.kamat@linaro.org

Added regulator entries to Exynos5420 SMDK board.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
Changes since v1:
Changed node name
---
 arch/arm/boot/dts/exynos5420-smdk5420.dts |  216 +++++++++++++++++++++++++++++
 1 file changed, 216 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5420-smdk5420.dts b/arch/arm/boot/dts/exynos5420-smdk5420.dts
index fb5a1e25c632..62e1ebe4e989 100644
--- a/arch/arm/boot/dts/exynos5420-smdk5420.dts
+++ b/arch/arm/boot/dts/exynos5420-smdk5420.dts
@@ -120,4 +120,220 @@
 			reg = <0x50>;
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
+			s2mps11_osc: clocks {
+				#clock-cells = <1>;
+				clock-output-names = "s2mps11_ap",
+						"s2mps11_cp", "s2mps11_bt";
+			};
+
+			regulators {
+				ldo1_reg: LDO1 {
+					regulator-name = "vdd_ldo1";
+					regulator-min-microvolt = <1000000>;
+					regulator-max-microvolt = <1000000>;
+					regulator-always-on;
+				};
+
+				ldo3_reg: LDO3 {
+					regulator-name = "vdd_ldo3";
+					regulator-min-microvolt = <1800000>;
+					regulator-max-microvolt = <1800000>;
+					regulator-always-on;
+				};
+
+				ldo5_reg: LDO5 {
+					regulator-name = "vdd_ldo5";
+					regulator-min-microvolt = <1800000>;
+					regulator-max-microvolt = <1800000>;
+					regulator-always-on;
+				};
+
+				ldo6_reg: LDO6 {
+					regulator-name = "vdd_ldo6";
+					regulator-min-microvolt = <1000000>;
+					regulator-max-microvolt = <1000000>;
+					regulator-always-on;
+				};
+
+				ldo7_reg: LDO7 {
+					regulator-name = "vdd_ldo7";
+					regulator-min-microvolt = <1800000>;
+					regulator-max-microvolt = <1800000>;
+					regulator-always-on;
+				};
+
+				ldo8_reg: LDO8 {
+					regulator-name = "vdd_ldo8";
+					regulator-min-microvolt = <1800000>;
+					regulator-max-microvolt = <1800000>;
+					regulator-always-on;
+				};
+
+				ldo9_reg: LDO9 {
+					regulator-name = "vdd_ldo9";
+					regulator-min-microvolt = <3000000>;
+					regulator-max-microvolt = <3000000>;
+					regulator-always-on;
+				};
+
+				ldo10_reg: LDO10 {
+					regulator-name = "vdd_ldo10";
+					regulator-min-microvolt = <1800000>;
+					regulator-max-microvolt = <1800000>;
+					regulator-always-on;
+				};
+
+				ldo11_reg: LDO11 {
+					regulator-name = "vdd_ldo11";
+					regulator-min-microvolt = <1000000>;
+					regulator-max-microvolt = <1000000>;
+					regulator-always-on;
+				};
+
+				ldo12_reg: LDO12 {
+					regulator-name = "vdd_ldo12";
+					regulator-min-microvolt = <1800000>;
+					regulator-max-microvolt = <1800000>;
+					regulator-always-on;
+				};
+
+				ldo13_reg: LDO13 {
+					regulator-name = "vdd_ldo13";
+					regulator-min-microvolt = <2800000>;
+					regulator-max-microvolt = <2800000>;
+					regulator-always-on;
+				};
+
+				ldo15_reg: LDO15 {
+					regulator-name = "vdd_ldo15";
+					regulator-min-microvolt = <3100000>;
+					regulator-max-microvolt = <3100000>;
+					regulator-always-on;
+				};
+
+				ldo16_reg: LDO16 {
+					regulator-name = "vdd_ldo16";
+					regulator-min-microvolt = <2200000>;
+					regulator-max-microvolt = <2200000>;
+					regulator-always-on;
+				};
+
+				ldo17_reg: LDO17 {
+					regulator-name = "tsp_avdd";
+					regulator-min-microvolt = <3300000>;
+					regulator-max-microvolt = <3300000>;
+					regulator-always-on;
+				};
+
+				ldo19_reg: LDO19 {
+					regulator-name = "vdd_sd";
+					regulator-min-microvolt = <2800000>;
+					regulator-max-microvolt = <2800000>;
+					regulator-always-on;
+				};
+
+				ldo24_reg: LDO24 {
+					regulator-name = "tsp_io";
+					regulator-min-microvolt = <2800000>;
+					regulator-max-microvolt = <2800000>;
+					regulator-always-on;
+				};
+
+				buck1_reg: BUCK1 {
+					regulator-name = "vdd_mif";
+					regulator-min-microvolt = <800000>;
+					regulator-max-microvolt = <1300000>;
+					regulator-always-on;
+					regulator-boot-on;
+				};
+
+				buck2_reg: BUCK2 {
+					regulator-name = "vdd_arm";
+					regulator-min-microvolt = <800000>;
+					regulator-max-microvolt = <1500000>;
+					regulator-always-on;
+					regulator-boot-on;
+				};
+
+				buck3_reg: BUCK3 {
+					regulator-name = "vdd_int";
+					regulator-min-microvolt = <800000>;
+					regulator-max-microvolt = <1400000>;
+					regulator-always-on;
+					regulator-boot-on;
+				};
+
+				buck4_reg: BUCK4 {
+					regulator-name = "vdd_g3d";
+					regulator-min-microvolt = <800000>;
+					regulator-max-microvolt = <1400000>;
+					regulator-always-on;
+					regulator-boot-on;
+				};
+
+				buck5_reg: BUCK5 {
+					regulator-name = "vdd_mem";
+					regulator-min-microvolt = <800000>;
+					regulator-max-microvolt = <1400000>;
+					regulator-always-on;
+					regulator-boot-on;
+				};
+
+				buck6_reg: BUCK6 {
+					regulator-name = "vdd_kfc";
+					regulator-min-microvolt = <800000>;
+					regulator-max-microvolt = <1500000>;
+					regulator-always-on;
+					regulator-boot-on;
+				};
+
+				buck7_reg: BUCK7 {
+					regulator-name = "vdd_1.0v_ldo";
+					regulator-min-microvolt = <800000>;
+					regulator-max-microvolt = <1500000>;
+					regulator-always-on;
+					regulator-boot-on;
+				};
+
+				buck8_reg: BUCK8 {
+					regulator-name = "vdd_1.8v_ldo";
+					regulator-min-microvolt = <800000>;
+					regulator-max-microvolt = <1500000>;
+					regulator-always-on;
+					regulator-boot-on;
+				};
+
+				buck9_reg: BUCK9 {
+					regulator-name = "vdd_2.8v_ldo";
+					regulator-min-microvolt = <3000000>;
+					regulator-max-microvolt = <3750000>;
+					regulator-always-on;
+					regulator-boot-on;
+				};
+
+				buck10_reg: BUCK10 {
+					regulator-name = "vdd_vmem";
+					regulator-min-microvolt = <2850000>;
+					regulator-max-microvolt = <2850000>;
+					regulator-always-on;
+					regulator-boot-on;
+				};
+			};
+		};
+	};
 };
-- 
1.7.9.5
