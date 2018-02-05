From: Maciej Purski <m.purski@samsung.com>
Subject: [PATCH v2 8/9] ARM: dts: exynos: Use labels instead of full names
 in exynos4412-trats2
Date: Mon, 05 Feb 2018 08:57:07 +0100
Message-ID: <1517817428-7898-9-git-send-email-m.purski@samsung.com>
References: <1517817428-7898-1-git-send-email-m.purski@samsung.com>
        <CGME20180205075730eucas1p196ccf9ed382aed52c2079e5c6c5c42c4@eucas1p1.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:35363 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752675AbeBEH5e (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 5 Feb 2018 02:57:34 -0500
In-reply-to: <1517817428-7898-1-git-send-email-m.purski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, m.szyprowski@samsung.com, b.zolnierkie@samsung.com, Maciej Purski <m.purski@samsung.com>

Camera and i2c1_isp labels are defined in exynos4.dtsi and
exynos4412.dtsi. Use them exynos4412-trats2.

Signed-off-by: Maciej Purski <m.purski@samsung.com>
---
 arch/arm/boot/dts/exynos4412-trats2.dts | 73 ++++++++++++++++-----------------
 1 file changed, 36 insertions(+), 37 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4412-trats2.dts b/arch/arm/boot/dts/exynos4412-trats2.dts
index f285790..b8abc21 100644
--- a/arch/arm/boot/dts/exynos4412-trats2.dts
+++ b/arch/arm/boot/dts/exynos4412-trats2.dts
@@ -288,17 +288,6 @@
 		};
 	};
 
-	camera: camera {
-		pinctrl-0 = <&cam_port_a_clk_active &cam_port_b_clk_active>;
-		pinctrl-names = "default";
-		status = "okay";
-		assigned-clocks = <&clock CLK_MOUT_CAM0>,
-				  <&clock CLK_MOUT_CAM1>;
-		assigned-clock-parents = <&clock CLK_XUSBXTI>,
-					 <&clock CLK_XUSBXTI>;
-
-
-	};
 
 	wlan_pwrseq: sdhci3-pwrseq {
 		compatible = "mmc-pwrseq-simple";
@@ -403,6 +392,16 @@
 	status = "okay";
 };
 
+&camera {
+	pinctrl-0 = <&cam_port_a_clk_active &cam_port_b_clk_active>;
+	pinctrl-names = "default";
+	status = "okay";
+	assigned-clocks = <&clock CLK_MOUT_CAM0>,
+			  <&clock CLK_MOUT_CAM1>;
+	assigned-clock-parents = <&clock CLK_XUSBXTI>,
+				 <&clock CLK_XUSBXTI>;
+};
+
 &cpu0 {
 	cpu0-supply = <&buck2_reg>;
 };
@@ -527,32 +526,6 @@
 	pinctrl-0 = <&fimc_is_uart>;
 	pinctrl-names = "default";
 	status = "okay";
-
-	i2c1_isp: i2c-isp@12140000 {
-		pinctrl-0 = <&fimc_is_i2c1>;
-		pinctrl-names = "default";
-
-		s5k6a3@10 {
-			compatible = "samsung,s5k6a3";
-			reg = <0x10>;
-			svdda-supply = <&cam_io_reg>;
-			svddio-supply = <&ldo19_reg>;
-			afvdd-supply = <&ldo19_reg>;
-			clock-frequency = <24000000>;
-			/* CAM_B_CLKOUT */
-			clocks = <&camera 1>;
-			clock-names = "extclk";
-			samsung,camclk-out = <1>;
-			gpios = <&gpm1 6 GPIO_ACTIVE_HIGH>;
-
-			port {
-				is_s5k6a3_ep: endpoint {
-					remote-endpoint = <&csis1_ep>;
-					data-lanes = <1>;
-				};
-			};
-		};
-	};
 };
 
 &fimc_lite_0 {
@@ -629,6 +602,32 @@
 	};
 };
 
+&i2c1_isp {
+	pinctrl-0 = <&fimc_is_i2c1>;
+	pinctrl-names = "default";
+
+	s5k6a3@10 {
+		compatible = "samsung,s5k6a3";
+		reg = <0x10>;
+		svdda-supply = <&cam_io_reg>;
+		svddio-supply = <&ldo19_reg>;
+		afvdd-supply = <&ldo19_reg>;
+		clock-frequency = <24000000>;
+		/* CAM_B_CLKOUT */
+		clocks = <&camera 1>;
+		clock-names = "extclk";
+		samsung,camclk-out = <1>;
+		gpios = <&gpm1 6 GPIO_ACTIVE_HIGH>;
+
+		port {
+			is_s5k6a3_ep: endpoint {
+				remote-endpoint = <&csis1_ep>;
+				data-lanes = <1>;
+			};
+		};
+	};
+};
+
 &i2c_3 {
 	samsung,i2c-sda-delay = <100>;
 	samsung,i2c-slave-addr = <0x10>;
-- 
2.7.4
