From: Maciej Purski <m.purski@samsung.com>
Subject: [PATCH v2 4/9] ARM: dts: exynos: Use fimc labels in
 exynos4210-trats
Date: Mon, 05 Feb 2018 08:57:03 +0100
Message-ID: <1517817428-7898-5-git-send-email-m.purski@samsung.com>
References: <1517817428-7898-1-git-send-email-m.purski@samsung.com>
        <CGME20180205075728eucas1p15c9366900381a23cd8c31a1ddb724a6a@eucas1p1.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:56118 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752654AbeBEH5b (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 5 Feb 2018 02:57:31 -0500
In-reply-to: <1517817428-7898-1-git-send-email-m.purski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, m.szyprowski@samsung.com, b.zolnierkie@samsung.com, Maciej Purski <m.purski@samsung.com>

Camera and fimc labels have been defined in exynos4.dtsi Use them
in exynos4210-trats instead of full names.

Signed-off-by: Maciej Purski <m.purski@samsung.com>
---
 arch/arm/boot/dts/exynos4210-trats.dts | 73 +++++++++++++++++-----------------
 1 file changed, 37 insertions(+), 36 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4210-trats.dts b/arch/arm/boot/dts/exynos4210-trats.dts
index aaade17..268bd38 100644
--- a/arch/arm/boot/dts/exynos4210-trats.dts
+++ b/arch/arm/boot/dts/exynos4210-trats.dts
@@ -148,43 +148,12 @@
 		};
 	};
 
-	camera {
-		pinctrl-names = "default";
-		pinctrl-0 = <>;
-		status = "okay";
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
+};
 
-		fimc_3: fimc@11830000 {
-			status = "okay";
-			assigned-clocks = <&clock CLK_MOUT_FIMC3>,
-					<&clock CLK_SCLK_FIMC3>;
-			assigned-clock-parents = <&clock CLK_SCLK_MPLL>;
-			assigned-clock-rates = <0>, <160000000>;
-		};
-	};
+&camera {
+	pinctrl-names = "default";
+	pinctrl-0 = <>;
+	status = "okay";
 };
 
 &cpu0 {
@@ -234,6 +203,38 @@
 	vbus-supply = <&safe1_sreg>;
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
+		assigned-clock-rates = <0>, <160000000>;
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
 	status = "okay";
 };
-- 
2.7.4
