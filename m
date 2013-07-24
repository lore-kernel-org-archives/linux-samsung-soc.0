From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH v4 13/13] ARM: dts: Add S5K5BA sensor regulator definitions for
 Trats board
Date: Wed, 24 Jul 2013 15:17:25 +0200
Message-ID: <1374671845-30373-14-git-send-email-s.nawrocki@samsung.com>
References: <1374671845-30373-1-git-send-email-s.nawrocki@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:18399 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750909Ab3GXNTw (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 24 Jul 2013 09:19:52 -0400
In-reply-to: <1374671845-30373-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com
Cc: kyungmin.park@samsung.com, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Andrzej Hajda <a.hajda@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>

From: Andrzej Hajda <a.hajda@samsung.com>

Add MAX8998 LDO12 and fixed voltage regulator nodes. While at it,
all fixed voltage regulator nodes are grouped in a 'regulators' node.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
Reviewed-by: Tomasz Figa <t.figa@samsung.com>
---
Changes since v3:
 - removed #address-cells/#size-cells properties from 'regulators'
   node and the individual regulator node naming changed to regulator-<N>
---
 arch/arm/boot/dts/exynos4210-trats.dts |   78 +++++++++++++++++++++++++-------
 1 file changed, 62 insertions(+), 16 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4210-trats.dts b/arch/arm/boot/dts/exynos4210-trats.dts
index 199ff1e..1c164f2 100644
--- a/arch/arm/boot/dts/exynos4210-trats.dts
+++ b/arch/arm/boot/dts/exynos4210-trats.dts
@@ -30,13 +30,62 @@
 		bootargs = "console=ttySAC2,115200N8 root=/dev/mmcblk0p5 rootwait earlyprintk panic=5";
 	};
 
-	vemmc_reg: voltage-regulator@0 {
-	        compatible = "regulator-fixed";
-		regulator-name = "VMEM_VDD_2.8V";
-		regulator-min-microvolt = <2800000>;
-		regulator-max-microvolt = <2800000>;
-		gpio = <&gpk0 2 0>;
-		enable-active-high;
+	regulators {
+		compatible = "simple-bus";
+
+		vemmc_reg: regulator-0 {
+			compatible = "regulator-fixed";
+			regulator-name = "VMEM_VDD_2.8V";
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <2800000>;
+			gpio = <&gpk0 2 0>;
+			enable-active-high;
+		};
+
+		tsp_reg: regulator-1 {
+			compatible = "regulator-fixed";
+			regulator-name = "TSP_FIXED_VOLTAGES";
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <2800000>;
+			gpio = <&gpl0 3 0>;
+			enable-active-high;
+		};
+
+		cam_af_28v_reg: regulator-2 {
+			compatible = "regulator-fixed";
+			regulator-name = "8M_AF_2.8V_EN";
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <2800000>;
+			gpio = <&gpk1 1 0>;
+			enable-active-high;
+		};
+
+		cam_io_en_reg: regulator-3 {
+			compatible = "regulator-fixed";
+			regulator-name = "CAM_IO_EN";
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <2800000>;
+			gpio = <&gpe2 1 0>;
+			enable-active-high;
+		};
+
+		cam_io_12v_reg: regulator-4 {
+			compatible = "regulator-fixed";
+			regulator-name = "8M_1.2V_EN";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			gpio = <&gpe2 5 0>;
+			enable-active-high;
+		};
+
+		vt_core_15v_reg: regulator-5 {
+			compatible = "regulator-fixed";
+			regulator-name = "VT_CORE_1.5V";
+			regulator-min-microvolt = <1500000>;
+			regulator-max-microvolt = <1500000>;
+			gpio = <&gpe2 2 0>;
+			enable-active-high;
+		};
 	};
 
 	sdhci_emmc: sdhci@12510000 {
@@ -97,15 +146,6 @@
 		};
 	};
 
-	tsp_reg: voltage-regulator {
-		compatible = "regulator-fixed";
-		regulator-name = "TSP_FIXED_VOLTAGES";
-		regulator-min-microvolt = <2800000>;
-		regulator-max-microvolt = <2800000>;
-		gpio = <&gpl0 3 0>;
-		enable-active-high;
-	};
-
 	i2c@13890000 {
 		samsung,i2c-sda-delay = <100>;
 		samsung,i2c-slave-addr = <0x10>;
@@ -218,6 +258,12 @@
 				     regulator-always-on;
 				};
 
+				vtcam_reg: LDO12 {
+				     regulator-name = "VT_CAM_1.8V";
+				     regulator-min-microvolt = <1800000>;
+				     regulator-max-microvolt = <1800000>;
+				};
+
 				vcclcd_reg: LDO13 {
 				     regulator-name = "VCC_3.3V_LCD";
 				     regulator-min-microvolt = <3300000>;
-- 
1.7.9.5
