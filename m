From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v2 3/3] arm64: dts: exynos: Add initial configuration for DISP
 clocks for TM2/TM2e
Date: Thu, 26 Jan 2017 13:37:54 +0100
Message-ID: <1485434274-6579-4-git-send-email-m.szyprowski@samsung.com>
References: <1485434274-6579-1-git-send-email-m.szyprowski@samsung.com>
 <CGME20170126123806eucas1p2dfbb67c5248e6c3dd979bdd343a3b7cb@eucas1p2.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:58480 "EHLO
        mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752107AbdAZMiQ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 26 Jan 2017 07:38:16 -0500
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OKE00D6F0FJ6K20@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 26 Jan 2017 12:38:07 +0000 (GMT)
In-reply-to: <1485434274-6579-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>

Add initial clock configuration for display subsystem for Exynos5433
based TM2/TM2e boards in device tree in order to avoid dependency on the
configuration left by the bootloader. This initial configuration is also
needed to ensure that display subsystem is operational if display power
domain gets turned off before clock controller is probed and the inital
clock configuration left by the bootloader saved.

TM2 and TM2e uses different rate for DISP PLL clock, but for better
maintainability all 'assigned-clocks-*' properties for DISP CMU are
defines in each board dts instead of redefining the rates property.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 .../boot/dts/exynos/exynos5433-tm2-common.dtsi     | 12 ---------
 arch/arm64/boot/dts/exynos/exynos5433-tm2.dts      | 29 ++++++++++++++++++++++
 arch/arm64/boot/dts/exynos/exynos5433-tm2e.dts     | 29 ++++++++++++++++++++++
 3 files changed, 58 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi b/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
index 5c207575ed0a..1c1c03142e6d 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
@@ -217,18 +217,6 @@
 	assigned-clock-parents = <&cmu_top CLK_FOUT_AUD_PLL>;
 };
 
-&cmu_disp {
-	assigned-clocks = <&cmu_mif CLK_MOUT_SCLK_DECON_TV_ECLK_A>,
-			  <&cmu_mif CLK_DIV_SCLK_DECON_TV_ECLK>,
-			  <&cmu_disp CLK_MOUT_SCLK_DECON_TV_ECLK_USER>,
-			  <&cmu_disp CLK_MOUT_SCLK_DECON_TV_ECLK>;
-	assigned-clock-parents = <&cmu_mif CLK_MOUT_BUS_PLL_DIV2>,
-				 <0>,
-				 <&cmu_mif CLK_SCLK_DECON_TV_ECLK_DISP>,
-				 <&cmu_disp CLK_MOUT_SCLK_DECON_TV_ECLK_USER>;
-	assigned-clock-rates = <0>, <400000000>;
-};
-
 &cmu_fsys {
 	assigned-clocks = <&cmu_top CLK_MOUT_SCLK_USBDRD30>,
 		<&cmu_top CLK_MOUT_SCLK_USBHOST30>,
diff --git a/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts b/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts
index ddba2f889326..b8bb053495af 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts
+++ b/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts
@@ -18,6 +18,35 @@
 	compatible = "samsung,tm2", "samsung,exynos5433";
 };
 
+&cmu_disp {
+	assigned-clocks = <&cmu_disp CLK_FOUT_DISP_PLL>,
+			  <&cmu_mif CLK_DIV_SCLK_DECON_TV_ECLK>,
+			  <&cmu_disp CLK_MOUT_ACLK_DISP_333_USER>,
+			  <&cmu_disp CLK_MOUT_SCLK_DSIM0_USER>,
+			  <&cmu_disp CLK_MOUT_SCLK_DSIM0>,
+			  <&cmu_disp CLK_MOUT_SCLK_DECON_ECLK_USER>,
+			  <&cmu_disp CLK_MOUT_SCLK_DECON_ECLK>,
+			  <&cmu_disp CLK_MOUT_PHYCLK_MIPIDPHY0_RXCLKESC0_USER>,
+			  <&cmu_disp CLK_MOUT_PHYCLK_MIPIDPHY0_BITCLKDIV8_USER>,
+			  <&cmu_disp CLK_MOUT_DISP_PLL>,
+			  <&cmu_mif CLK_MOUT_SCLK_DECON_TV_ECLK_A>,
+			  <&cmu_disp CLK_MOUT_SCLK_DECON_TV_ECLK_USER>,
+			  <&cmu_disp CLK_MOUT_SCLK_DECON_TV_ECLK>;
+	assigned-clock-parents = <0>, <0>,
+				 <&cmu_mif CLK_ACLK_DISP_333>,
+				 <&cmu_mif CLK_SCLK_DSIM0_DISP>,
+				 <&cmu_disp CLK_MOUT_SCLK_DSIM0_USER>,
+				 <&cmu_mif CLK_SCLK_DECON_ECLK_DISP>,
+				 <&cmu_disp CLK_MOUT_SCLK_DECON_ECLK_USER>,
+				 <&cmu_disp CLK_PHYCLK_MIPIDPHY0_RXCLKESC0_PHY>,
+				 <&cmu_disp CLK_PHYCLK_MIPIDPHY0_BITCLKDIV8_PHY>,
+				 <&cmu_disp CLK_FOUT_DISP_PLL>,
+				 <&cmu_mif CLK_MOUT_BUS_PLL_DIV2>,
+				 <&cmu_mif CLK_SCLK_DECON_TV_ECLK_DISP>,
+				 <&cmu_disp CLK_MOUT_SCLK_DECON_TV_ECLK_USER>;
+	assigned-clock-rates = <250000000>, <400000000>;
+};
+
 &hsi2c_9 {
 	status = "okay";
 
diff --git a/arch/arm64/boot/dts/exynos/exynos5433-tm2e.dts b/arch/arm64/boot/dts/exynos/exynos5433-tm2e.dts
index d8bca75a1afe..c27500b7d8b5 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433-tm2e.dts
+++ b/arch/arm64/boot/dts/exynos/exynos5433-tm2e.dts
@@ -18,6 +18,35 @@
 	compatible = "samsung,tm2e", "samsung,exynos5433";
 };
 
+&cmu_disp {
+	assigned-clocks = <&cmu_disp CLK_FOUT_DISP_PLL>,
+			  <&cmu_mif CLK_DIV_SCLK_DECON_TV_ECLK>,
+			  <&cmu_disp CLK_MOUT_ACLK_DISP_333_USER>,
+			  <&cmu_disp CLK_MOUT_SCLK_DSIM0_USER>,
+			  <&cmu_disp CLK_MOUT_SCLK_DSIM0>,
+			  <&cmu_disp CLK_MOUT_SCLK_DECON_ECLK_USER>,
+			  <&cmu_disp CLK_MOUT_SCLK_DECON_ECLK>,
+			  <&cmu_disp CLK_MOUT_PHYCLK_MIPIDPHY0_RXCLKESC0_USER>,
+			  <&cmu_disp CLK_MOUT_PHYCLK_MIPIDPHY0_BITCLKDIV8_USER>,
+			  <&cmu_disp CLK_MOUT_DISP_PLL>,
+			  <&cmu_mif CLK_MOUT_SCLK_DECON_TV_ECLK_A>,
+			  <&cmu_disp CLK_MOUT_SCLK_DECON_TV_ECLK_USER>,
+			  <&cmu_disp CLK_MOUT_SCLK_DECON_TV_ECLK>;
+	assigned-clock-parents = <0>, <0>,
+				 <&cmu_mif CLK_ACLK_DISP_333>,
+				 <&cmu_mif CLK_SCLK_DSIM0_DISP>,
+				 <&cmu_disp CLK_MOUT_SCLK_DSIM0_USER>,
+				 <&cmu_mif CLK_SCLK_DECON_ECLK_DISP>,
+				 <&cmu_disp CLK_MOUT_SCLK_DECON_ECLK_USER>,
+				 <&cmu_disp CLK_PHYCLK_MIPIDPHY0_RXCLKESC0_PHY>,
+				 <&cmu_disp CLK_PHYCLK_MIPIDPHY0_BITCLKDIV8_PHY>,
+				 <&cmu_disp CLK_FOUT_DISP_PLL>,
+				 <&cmu_mif CLK_MOUT_BUS_PLL_DIV2>,
+				 <&cmu_mif CLK_SCLK_DECON_TV_ECLK_DISP>,
+				 <&cmu_disp CLK_MOUT_SCLK_DECON_TV_ECLK_USER>;
+	assigned-clock-rates = <278000000>, <400000000>;
+};
+
 &ldo31_reg {
 	regulator-name = "TSP_VDD_1.8V_AP";
 	regulator-min-microvolt = <1800000>;
-- 
1.9.1
