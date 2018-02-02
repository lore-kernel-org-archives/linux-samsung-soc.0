From: Maciej Purski <m.purski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 06/10] ARM: dts: exynos: Use labels instead of full names in
 exynos4210-universal_c210
Date: Fri, 02 Feb 2018 16:43:51 +0100
Message-ID: <1517586235-16603-7-git-send-email-m.purski@samsung.com>
References: <1517586235-16603-1-git-send-email-m.purski@samsung.com>
        <CGME20180202154409eucas1p2c9e152e8f5be42cddd28cfa012756d22@eucas1p2.samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1517586235-16603-1-git-send-email-m.purski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Maciej Purski <m.purski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Camera, Fimc, mct and sysram labels are defined in exynos4210.dtsi. Use
them in exynos4210-universal_c210.dts instead of full names.

Signed-off-by: Maciej Purski <m.purski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---
 arch/arm/boot/dts/exynos4210-universal_c210.dts | 115 ++++++++++++------------
 1 file changed, 58 insertions(+), 57 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4210-universal_c210.dts b/arch/arm/boot/dts/exynos4210-universal_c210.dts
index 21fff7c..0ac619d 100644
--- a/arch/arm/boot/dts/exynos4210-universal_c210.dts
+++ b/arch/arm/boot/dts/exynos4210-universal_c210.dts
@@ -28,24 +28,6 @@
 		stdout-path = &serial_2;
 	};
 
-	sysram@2020000 {
-		smp-sysram@0 {
-			status = "disabled";
-		};
-
-		smp-sysram@5000 {
-			compatible = "samsung,exynos4210-sysram";
-			reg = <0x5000 0x1000>;
-		};
-
-		smp-sysram@1f000 {
-			status = "disabled";
-		};
-	};
-
-	mct@10050000 {
-		compatible = "none";
-	};
 
 	fixed-rate-clocks {
 		xxti {
@@ -173,45 +155,6 @@
 		};
 	};
 
-	camera {
-		status = "okay";
-
-		pinctrl-names = "default";
-		pinctrl-0 = <>;
-
-		fimc_0: fimc@11800000 {
-			status = "okay";
-			assigned-clocks = <&clock CLK_MOUT_FIMC0>,
-					<&clock CLK_SCLK_FIMC0>;
-			assigned-clock-parents = <&clock CLK_SCLK_MPLL>;
-			assigned-clock-rates = <0>, <160000000>;
-		};
-
-		fimc_1: fimc@11810000 {
-			status = "okay";
-			assigned-clocks = <&clock CLK_MOUT_FIMC1>,
-					<&clock CLK_SCLK_FIMC1>;
-			assigned-clock-parents = <&clock CLK_SCLK_MPLL>;
-			assigned-clock-rates = <0>, <160000000>;
-		};
-
-		fimc_2: fimc@11820000 {
-			status = "okay";
-			assigned-clocks = <&clock CLK_MOUT_FIMC2>,
-					<&clock CLK_SCLK_FIMC2>;
-			assigned-clock-parents = <&clock CLK_SCLK_MPLL>;
-			assigned-clock-rates = <0>, <160000000>;
-		};
-
-		fimc_3: fimc@11830000 {
-			status = "okay";
-			assigned-clocks = <&clock CLK_MOUT_FIMC3>,
-					<&clock CLK_SCLK_FIMC3>;
-			assigned-clock-parents = <&clock CLK_SCLK_MPLL>;
-			assigned-clock-rates = <0>, <160000000>;
-		};
-	};
-
 	hdmi_en: voltage-regulator-hdmi-5v {
 		compatible = "regulator-fixed";
 		regulator-name = "HDMI_5V";
@@ -250,6 +193,38 @@
 	vbus-supply = <&safeout1_reg>;
 };
 
+&fimc_0 {
+	status = "okay";
+	assigned-clocks = <&clock CLK_MOUT_FIMC0>,
+			  <&clock CLK_SCLK_FIMC0>;
+	assigned-clock-parents = <&clock CLK_SCLK_MPLL>;
+	assigned-clock-rates = <0>, <160000000>;
+};
+
+&fimc_1 {
+	status = "okay";
+	assigned-clocks = <&clock CLK_MOUT_FIMC1>,
+			  <&clock CLK_SCLK_FIMC1>;
+	assigned-clock-parents = <&clock CLK_SCLK_MPLL>;
+	assigned-clock-rates = <0>, <160000000>;
+};
+
+&fimc_2 {
+	status = "okay";
+	assigned-clocks = <&clock CLK_MOUT_FIMC2>,
+			  <&clock CLK_SCLK_FIMC2>;
+	assigned-clock-parents = <&clock CLK_SCLK_MPLL>;
+	assigned-clock-rates = <0>, <160000000>;
+};
+
+&fimc_3 {
+	status = "okay";
+	assigned-clocks = <&clock CLK_MOUT_FIMC3>,
+			  <&clock CLK_SCLK_FIMC3>;
+	assigned-clock-parents = <&clock CLK_SCLK_MPLL>;
+	assigned-clock-rates = <0>, <160000000>;
+};
+
 &fimd {
 	pinctrl-0 = <&lcd_clk>, <&lcd_data24>;
 	pinctrl-names = "default";
@@ -497,10 +472,21 @@
 	};
 };
 
+&camera {
+	status = "okay";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <>;
+};
+
 &i2c_8 {
 	status = "okay";
 };
 
+&mct {
+	compatible = "none";
+};
+
 &mdma1 {
 	reg = <0x12840000 0x1000>;
 };
@@ -579,3 +565,18 @@
 	/delete-property/dmas;
 	/delete-property/dma-names;
 };
+
+&sysram {
+	smp-sysram@0 {
+		status = "disabled";
+	};
+
+	smp-sysram@5000 {
+		compatible = "samsung,exynos4210-sysram";
+		reg = <0x5000 0x1000>;
+	};
+
+	smp-sysram@1f000 {
+		status = "disabled";
+	};
+};
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
