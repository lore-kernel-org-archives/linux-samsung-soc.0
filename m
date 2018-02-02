From: Maciej Purski <m.purski@samsung.com>
Subject: [PATCH 04/10] ARM: dts: exynos: Use labels instead of full names in
 exynos4210
Date: Fri, 02 Feb 2018 16:43:49 +0100
Message-ID: <1517586235-16603-5-git-send-email-m.purski@samsung.com>
References: <1517586235-16603-1-git-send-email-m.purski@samsung.com>
        <CGME20180202154407eucas1p2b8df9fd358d944e96651bf117b4b0408@eucas1p2.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:35467 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751746AbeBBPoL (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 2 Feb 2018 10:44:11 -0500
In-reply-to: <1517586235-16603-1-git-send-email-m.purski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, m.szyprowski@samsung.com, b.zolnierkie@samsung.com, Maciej Purski <m.purski@samsung.com>

Camera, fimc, mixer and tmu labels has been defined in exynos4.dtsi.
Use them in exynos4210 instead of full names.

Signed-off-by: Maciej Purski <m.purski@samsung.com>
---
 arch/arm/boot/dts/exynos4210.dtsi | 102 +++++++++++++++++++-------------------
 1 file changed, 51 insertions(+), 51 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4210.dtsi b/arch/arm/boot/dts/exynos4210.dtsi
index 82c1a32..07b2197 100644
--- a/arch/arm/boot/dts/exynos4210.dtsi
+++ b/arch/arm/boot/dts/exynos4210.dtsi
@@ -152,18 +152,6 @@
 		reg = <0x03860000 0x1000>;
 	};
 
-	tmu: tmu@100c0000 {
-		compatible = "samsung,exynos4210-tmu";
-		interrupt-parent = <&combiner>;
-		reg = <0x100C0000 0x100>;
-		interrupts = <2 4>;
-		clocks = <&clock CLK_TMU_APBIF>;
-		clock-names = "tmu_apbif";
-		samsung,tmu_gain = <15>;
-		samsung,tmu_reference_voltage = <7>;
-		status = "disabled";
-	};
-
 	thermal-zones {
 		cpu_thermal: cpu-thermal {
 			polling-delay-passive = <0>;
@@ -194,45 +182,6 @@
 		iommus = <&sysmmu_g2d>;
 	};
 
-	camera {
-		clocks = <&clock CLK_SCLK_CAM0>, <&clock CLK_SCLK_CAM1>,
-			 <&clock CLK_PIXELASYNCM0>, <&clock CLK_PIXELASYNCM1>;
-		clock-names = "sclk_cam0", "sclk_cam1", "pxl_async0", "pxl_async1";
-
-		fimc_0: fimc@11800000 {
-			samsung,pix-limits = <4224 8192 1920 4224>;
-			samsung,mainscaler-ext;
-			samsung,cam-if;
-		};
-
-		fimc_1: fimc@11810000 {
-			samsung,pix-limits = <4224 8192 1920 4224>;
-			samsung,mainscaler-ext;
-			samsung,cam-if;
-		};
-
-		fimc_2: fimc@11820000 {
-			samsung,pix-limits = <4224 8192 1920 4224>;
-			samsung,mainscaler-ext;
-			samsung,lcd-wb;
-		};
-
-		fimc_3: fimc@11830000 {
-			samsung,pix-limits = <1920 8192 1366 1920>;
-			samsung,rotators = <0>;
-			samsung,mainscaler-ext;
-			samsung,lcd-wb;
-		};
-	};
-
-	mixer: mixer@12c10000 {
-		clock-names = "mixer", "hdmi", "sclk_hdmi", "vp", "mout_mixer",
-			"sclk_mixer";
-		clocks = <&clock CLK_MIXER>, <&clock CLK_HDMI>,
-			<&clock CLK_SCLK_HDMI>, <&clock CLK_VP>,
-			<&clock CLK_MOUT_MIXER>, <&clock CLK_SCLK_MIXER>;
-	};
-
 	ppmu_lcd1: ppmu_lcd1@12240000 {
 		compatible = "samsung,exynos-ppmu";
 		reg = <0x12240000 0x2000>;
@@ -427,6 +376,12 @@
 	cpu-offset = <0x8000>;
 };
 
+&camera {
+	clocks = <&clock CLK_SCLK_CAM0>, <&clock CLK_SCLK_CAM1>,
+		 <&clock CLK_PIXELASYNCM0>, <&clock CLK_PIXELASYNCM1>;
+	clock-names = "sclk_cam0", "sclk_cam1", "pxl_async0", "pxl_async1";
+};
+
 &combiner {
 	samsung,combiner-nr = <16>;
 	interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>,
@@ -447,10 +402,43 @@
 		     <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>;
 };
 
+&fimc_0 {
+	samsung,pix-limits = <4224 8192 1920 4224>;
+	samsung,mainscaler-ext;
+	samsung,cam-if;
+};
+
+&fimc_1 {
+	samsung,pix-limits = <4224 8192 1920 4224>;
+	samsung,mainscaler-ext;
+	samsung,cam-if;
+};
+
+&fimc_2 {
+	samsung,pix-limits = <4224 8192 1920 4224>;
+	samsung,mainscaler-ext;
+	samsung,lcd-wb;
+};
+
+&fimc_3 {
+	samsung,pix-limits = <1920 8192 1366 1920>;
+	samsung,rotators = <0>;
+	samsung,mainscaler-ext;
+	samsung,lcd-wb;
+};
+
 &mdma1 {
 	power-domains = <&pd_lcd0>;
 };
 
+&mixer {
+	clock-names = "mixer", "hdmi", "sclk_hdmi", "vp", "mout_mixer",
+		      "sclk_mixer";
+	clocks = <&clock CLK_MIXER>, <&clock CLK_HDMI>,
+		 <&clock CLK_SCLK_HDMI>, <&clock CLK_VP>,
+		 <&clock CLK_MOUT_MIXER>, <&clock CLK_SCLK_MIXER>;
+};
+
 &pmu_system_controller {
 	clock-names = "clkout0", "clkout1", "clkout2", "clkout3",
 			"clkout4", "clkout8", "clkout9";
@@ -468,4 +456,16 @@
 	power-domains = <&pd_lcd0>;
 };
 
+&tmu {
+	compatible = "samsung,exynos4210-tmu";
+	interrupt-parent = <&combiner>;
+	reg = <0x100C0000 0x100>;
+	interrupts = <2 4>;
+	clocks = <&clock CLK_TMU_APBIF>;
+	clock-names = "tmu_apbif";
+	samsung,tmu_gain = <15>;
+	samsung,tmu_reference_voltage = <7>;
+	status = "disabled";
+};
+
 #include "exynos4210-pinctrl.dtsi"
-- 
2.7.4
