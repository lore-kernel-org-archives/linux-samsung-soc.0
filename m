From: Maciej Purski <m.purski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 09/10] ARM: dts: exynos: Use labels instead of full names in
 exynos4412-trats2
Date: Fri, 02 Feb 2018 16:43:54 +0100
Message-ID: <1517586235-16603-10-git-send-email-m.purski@samsung.com>
References: <1517586235-16603-1-git-send-email-m.purski@samsung.com>
        <CGME20180202154410eucas1p253a471a4532ba80e1b0a4d4bce7bdeca@eucas1p2.samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1517586235-16603-1-git-send-email-m.purski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Maciej Purski <m.purski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Camera and i2c1_isp labels are defined in exynos4.dtsi and
exynos4412.dtsi. Use them exynos4412-trats2.

Signed-off-by: Maciej Purski <m.purski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
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

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
