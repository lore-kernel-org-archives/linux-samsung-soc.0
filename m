From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH] ARM: dts: Add rear camera nodes for Exynos4412 Trats2 board
Date: Fri, 11 Apr 2014 16:25:03 +0200
Message-ID: <1397226303-29844-1-git-send-email-s.nawrocki@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:40606 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753964AbaDKOZT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 11 Apr 2014 10:25:19 -0400
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0N3V00GJ5EQ520B0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 11 Apr 2014 23:25:18 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Sylwester Nawrocki <s.nawrocki@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>

This patch enables the rear facing camera (s5c73m3) on TRATS2 board
by adding the I2C0 bus controller, s5c73m3 sensor, MIPI CSI-2 receiver
and the sensor's voltage regulator supply nodes.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 arch/arm/boot/dts/exynos4412-trats2.dts |   72 +++++++++++++++++++++++++++++--
 1 file changed, 69 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4412-trats2.dts b/arch/arm/boot/dts/exynos4412-trats2.dts
index a55961a..cd45077 100644
--- a/arch/arm/boot/dts/exynos4412-trats2.dts
+++ b/arch/arm/boot/dts/exynos4412-trats2.dts
@@ -80,7 +80,24 @@
 			enable-active-high;
 		};
 
-		/* More to come */
+		cam_af_reg: voltage-regulator-3 {
+			compatible = "regulator-fixed";
+			regulator-name = "CAM_AF";
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <2800000>;
+			gpio = <&gpm0 4 0>;
+			enable-active-high;
+		};
+
+		cam_isp_core_reg: voltage-regulator-4 {
+			compatible = "regulator-fixed";
+			regulator-name = "CAM_ISP_CORE_1.2V_EN";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			gpio = <&gpm0 3 0>;
+			enable-active-high;
+			regulator-always-on;
+		};
 	};
 
 	gpio-keys {
@@ -140,6 +157,38 @@
 		};
 	};
 
+	i2c_0: i2c@13860000 {
+		samsung,i2c-sda-delay = <100>;
+		samsung,i2c-slave-addr = <0x10>;
+		samsung,i2c-max-bus-freq = <400000>;
+		pinctrl-0 = <&i2c0_bus>;
+		pinctrl-names = "default";
+		status = "okay";
+
+		s5c73m3@3c {
+			compatible = "samsung,s5c73m3";
+			reg = <0x3c>;
+			standby-gpios = <&gpm0 1 1>;   /* ISP_STANDBY */
+			xshutdown-gpios = <&gpf1 3 1>; /* ISP_RESET */
+			vdd-int-supply = <&buck9_reg>;
+			vddio-cis-supply = <&ldo9_reg>;
+			vdda-supply = <&ldo17_reg>;
+			vddio-host-supply = <&ldo18_reg>;
+			vdd-af-supply = <&cam_af_reg>;
+			vdd-reg-supply = <&cam_io_reg>;
+			clock-frequency = <24000000>;
+			/* CAM_A_CLKOUT */
+			clocks = <&camera 0>;
+			clock-names = "cis_extclk";
+			port {
+				s5c73m3_ep: endpoint {
+					remote-endpoint = <&csis0_ep>;
+					data-lanes = <1 2 3 4>;
+				};
+			};
+		};
+	};
+
 	i2c@138D0000 {
 		samsung,i2c-sda-delay = <100>;
 		samsung,i2c-slave-addr = <0x10>;
@@ -586,8 +635,8 @@
 		status = "okay";
 	};
 
-	camera {
-		pinctrl-0 = <&cam_port_b_clk_active>;
+	camera: camera {
+		pinctrl-0 = <&cam_port_a_clk_active &cam_port_b_clk_active>;
 		pinctrl-names = "default";
 		status = "okay";
 
@@ -607,6 +656,23 @@
 			status = "okay";
 		};
 
+		csis_0: csis@11880000 {
+			status = "okay";
+			vddcore-supply = <&ldo8_reg>;
+			vddio-supply = <&ldo10_reg>;
+			clock-frequency = <176000000>;
+
+			/* Camera C (3) MIPI CSI-2 (CSIS0) */
+			port@3 {
+				reg = <3>;
+				csis0_ep: endpoint {
+					remote-endpoint = <&s5c73m3_ep>;
+					data-lanes = <1 2 3 4>;
+					samsung,csis-hs-settle = <12>;
+				};
+			};
+		};
+
 		csis_1: csis@11890000 {
 			vddcore-supply = <&ldo8_reg>;
 			vddio-supply = <&ldo10_reg>;
-- 
1.7.9.5
