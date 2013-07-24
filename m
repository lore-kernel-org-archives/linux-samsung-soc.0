From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH v4 08/13] ARM: dts: Add camera device nodes for Exynos4412
 TRATS2 board
Date: Wed, 24 Jul 2013 15:17:20 +0200
Message-ID: <1374671845-30373-9-git-send-email-s.nawrocki@samsung.com>
References: <1374671845-30373-1-git-send-email-s.nawrocki@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:27641 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750902Ab3GXNTd (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 24 Jul 2013 09:19:33 -0400
In-reply-to: <1374671845-30373-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com
Cc: kyungmin.park@samsung.com, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Sylwester Nawrocki <s.nawrocki@samsung.com>

This patch enables the front camera using the internal
camera ISP (FIMC-IS).

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
Reviewed-by: Tomasz Figa <t.figa@samsung.com>
---

Changes since v3:
 - #address-cells/#size-cells properties in csis nodes
    moved to exynos4.dtsi,
 - added clock properties to s5k6a3 sensor node,
 - s/voltage-regulator@3/voltage-regulator-1.
---
 arch/arm/boot/dts/exynos4412-trats2.dts |   88 +++++++++++++++++++++++++++++++
 1 file changed, 88 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4412-trats2.dts b/arch/arm/boot/dts/exynos4412-trats2.dts
index cab4c0e..5558e5a 100644
--- a/arch/arm/boot/dts/exynos4412-trats2.dts
+++ b/arch/arm/boot/dts/exynos4412-trats2.dts
@@ -62,6 +62,15 @@
 			enable-active-high;
 		};
 
+		cam_io_reg: voltage-regulator-1 {
+			compatible = "regulator-fixed";
+			regulator-name = "CAM_SENSOR_A";
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <2800000>;
+			gpio = <&gpm0 2 0>;
+			enable-active-high;
+		};
+
 		/* More to come */
 	};
 
@@ -472,4 +481,83 @@
 			gpios = <&gpj0 7 0>;
 		};
 	};
+
+	camera {
+		pinctrl-0 = <&cam_port_b_clk_active>;
+		pinctrl-names = "default";
+		status = "okay";
+
+		fimc_0: fimc@11800000 {
+			status = "okay";
+		};
+
+		fimc_1: fimc@11810000 {
+			status = "okay";
+		};
+
+		fimc_2: fimc@11820000 {
+			status = "okay";
+		};
+
+		fimc_3: fimc@11830000 {
+			status = "okay";
+		};
+
+		csis_1: csis@11890000 {
+			vddcore-supply = <&ldo8_reg>;
+			vddio-supply = <&ldo10_reg>;
+			clock-frequency = <160000000>;
+			status = "okay";
+
+			/* Camera D (4) MIPI CSI-2 (CSIS1) */
+			port@4 {
+				reg = <4>;
+				csis1_ep: endpoint {
+					remote-endpoint = <&is_s5k6a3_ep>;
+					data-lanes = <1>;
+					samsung,csis-hs-settle = <18>;
+					samsung,csis-wclk;
+				};
+			};
+		};
+
+		fimc_lite_0: fimc-lite@12390000 {
+			status = "okay";
+		};
+
+		fimc_lite_1: fimc-lite@123A0000 {
+			status = "okay";
+		};
+
+		fimc-is@12000000 {
+			pinctrl-0 = <&fimc_is_uart>;
+			pinctrl-names = "default";
+			status = "okay";
+
+			i2c1_isp: i2c-isp@12140000 {
+				pinctrl-0 = <&fimc_is_i2c1>;
+				pinctrl-names = "default";
+
+				s5k6a3@10 {
+					compatible = "samsung,s5k6a3";
+					reg = <0x10>;
+					svdda-supply = <&cam_io_reg>;
+					svddio-supply = <&ldo19_reg>;
+					clock-frequency = <24000000>;
+					/* CAM_B_CLKOUT */
+					clocks = <&clock_cam 1>;
+					clock-names = "mclk";
+					samsung,camclk-out = <1>;
+					gpios = <&gpm1 6 0>;
+
+					port {
+						is_s5k6a3_ep: endpoint {
+							remote-endpoint = <&csis1_ep>;
+							data-lanes = <1>;
+						};
+					};
+				};
+			};
+		};
+	};
 };
-- 
1.7.9.5
