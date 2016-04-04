From: Markus Reichl <m.reichl@fivetechno.de>
Subject: [PATCH v2] ARM: dts: exynos-5422-odroid: Add eMMC and SD regulator
 supplies
Date: Mon, 4 Apr 2016 11:55:13 +0200
Message-ID: <57023A01.4070403@fivetechno.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from wp126.webpack.hosteurope.de ([80.237.132.133]:58354 "EHLO
	wp126.webpack.hosteurope.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751018AbcDDJzT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 4 Apr 2016 05:55:19 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Kukjin Kim <kgene@kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>

Add vmmc and vqmmc supplies from MF circuit sheets for eMMC and SD on
odroid XU3 and XU4 to avoid warnings in dmesg output and remove their
always_on properties.

Signed-off-by: Markus Reichl <m.reichl@fivetechno.de>
---
Changes in V2:
    Sqashed two patches in one.

Tested with eMMC only on XU4.
SD still needs testing.
---
 arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi b/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
index 1bd507b..0e71d42 100644
--- a/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
+++ b/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
@@ -121,10 +121,9 @@
 			};
 
 			ldo3_reg: LDO3 {
-				regulator-name = "vdd_ldo3";
+				regulator-name = "vddq_mmc0";
 				regulator-min-microvolt = <1800000>;
 				regulator-max-microvolt = <1800000>;
-				regulator-always-on;
 			};
 
 			ldo5_reg: LDO5 {
@@ -184,10 +183,9 @@
 			};
 
 			ldo13_reg: LDO13 {
-				regulator-name = "vdd_ldo13";
+				regulator-name = "vddq_mmc2";
 				regulator-min-microvolt = <2800000>;
 				regulator-max-microvolt = <2800000>;
-				regulator-always-on;
 			};
 
 			ldo15_reg: LDO15 {
@@ -211,11 +209,16 @@
 				regulator-always-on;
 			};
 
+			ldo18_reg: LDO18 {
+				regulator-name = "vdd_emmc_1V8";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+			};
+
 			ldo19_reg: LDO19 {
 				regulator-name = "vdd_sd";
 				regulator-min-microvolt = <2800000>;
 				regulator-max-microvolt = <2800000>;
-				regulator-always-on;
 			};
 
 			ldo24_reg: LDO24 {
@@ -347,6 +350,8 @@
 	cap-mmc-highspeed;
 	mmc-hs200-1_8v;
 	mmc-hs400-1_8v;
+	vmmc-supply = <&ldo18_reg>;
+	vqmmc-supply = <&ldo3_reg>;
 };
 
 &mmc_2 {
@@ -359,6 +364,8 @@
 	pinctrl-0 = <&sd2_clk &sd2_cmd &sd2_cd &sd2_bus1 &sd2_bus4>;
 	bus-width = <4>;
 	cap-sd-highspeed;
+	vmmc-supply = <&ldo19_reg>;
+	vqmmc-supply = <&ldo13_reg>;
 };
 
 &pinctrl_0 {
-- 
2.1.4
