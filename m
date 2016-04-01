From: Markus Reichl <m.reichl@fivetechno.de>
Subject: [PATCH] ARM: dts: exynos-5422-odroid: Add eMMC and SD regulator
 supplies
Date: Fri, 1 Apr 2016 15:42:28 +0200
Message-ID: <56FE7AC4.4090508@fivetechno.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from wp126.webpack.hosteurope.de ([80.237.132.133]:36988 "EHLO
	wp126.webpack.hosteurope.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751442AbcDANmc (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 1 Apr 2016 09:42:32 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Kukjin Kim <kgene@kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>

Add vmmc and vqmmc supplies from MF circuit sheets for eMMC and SD on
odroid XU3 and XU4 to avoid warnings in dmesg output.

Signed-off-by: Markus Reichl <m.reichl@fivetechno.de>
---
 arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi b/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
index 1bd507b..eec425a 100644
--- a/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
+++ b/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
@@ -121,7 +121,7 @@
                        };
 
                        ldo3_reg: LDO3 {
-                               regulator-name = "vdd_ldo3";
+                               regulator-name = "vddq_mmc0";
                                regulator-min-microvolt = <1800000>;
                                regulator-max-microvolt = <1800000>;
                                regulator-always-on;
@@ -184,7 +184,7 @@
                        };
 
                        ldo13_reg: LDO13 {
-                               regulator-name = "vdd_ldo13";
+                               regulator-name = "vddq_mmc2";
                                regulator-min-microvolt = <2800000>;
                                regulator-max-microvolt = <2800000>;
                                regulator-always-on;
@@ -211,6 +211,13 @@
                                regulator-always-on;
                        };
 
+                       ldo18_reg: LDO18 {
+                               regulator-name = "vdd_emmc_1V8";
+                               regulator-min-microvolt = <1800000>;
+                               regulator-max-microvolt = <1800000>;
+                               regulator-always-on;
+                       };
+
                        ldo19_reg: LDO19 {
                                regulator-name = "vdd_sd";
                                regulator-min-microvolt = <2800000>;
@@ -347,6 +354,8 @@
        cap-mmc-highspeed;
        mmc-hs200-1_8v;
        mmc-hs400-1_8v;
+       vmmc-supply = <&ldo18_reg>;
+       vqmmc-supply = <&ldo3_reg>;
 };
 
 &mmc_2 {
@@ -359,6 +368,8 @@
        pinctrl-0 = <&sd2_clk &sd2_cmd &sd2_cd &sd2_bus1 &sd2_bus4>;
        bus-width = <4>;
        cap-sd-highspeed;
+       vmmc-supply = <&ldo19_reg>;
+       vqmmc-supply = <&ldo13_reg>;
 };
 
 &pinctrl_0 {
-- 
2.1.4
