From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 1/3] arm64: dts: exynos: TM2 - add support for GScaler devices
Date: Wed, 16 Nov 2016 14:11:27 +0100
Message-ID: <1479301889-11393-2-git-send-email-m.szyprowski@samsung.com>
References: <1479301889-11393-1-git-send-email-m.szyprowski@samsung.com>
 <CGME20161116131137eucas1p198803f55c69c10f95031b54d878c72d3@eucas1p1.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:22879 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752328AbcKPNLl (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 16 Nov 2016 08:11:41 -0500
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OGQ00KN6KNFU160@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 16 Nov 2016 13:11:39 +0000 (GMT)
In-reply-to: <1479301889-11393-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>

This patch adds device nodes for GScaler devices to Exynos 5433 SoC dtsi
and proper initial clock configuration to TM2 dts.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm64/boot/dts/exynos/exynos5433-tm2.dts |  7 +++
 arch/arm64/boot/dts/exynos/exynos5433.dtsi    | 81 +++++++++++++++++++++++++++
 2 files changed, 88 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts b/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts
index 5ab1028..5ff5c30 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts
+++ b/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts
@@ -909,6 +909,13 @@
 	assigned-clock-rates = <0>, <0>, <0>, <0>, <66700000>;
 };
 
+&cmu_gscl {
+	assigned-clocks = <&cmu_gscl CLK_MOUT_ACLK_GSCL_111_USER>,
+			  <&cmu_gscl CLK_MOUT_ACLK_GSCL_333_USER>;
+	assigned-clock-parents = <&cmu_top CLK_ACLK_GSCL_111>,
+				 <&cmu_top CLK_ACLK_GSCL_333>;
+};
+
 &spi_1 {
 	cs-gpios = <&gpd6 3 GPIO_ACTIVE_HIGH>;
 	status = "okay";
diff --git a/arch/arm64/boot/dts/exynos/exynos5433.dtsi b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
index ab29352..8ecde41 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
@@ -26,6 +26,12 @@
 
 	interrupt-parent = <&gic>;
 
+	aliases {
+		gsc0 = &gsc_0;
+		gsc1 = &gsc_1;
+		gsc2 = &gsc_2;
+	};
+
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
@@ -798,6 +804,51 @@
 			reg = <0x145f0000 0x1038>;
 		};
 
+		gsc_0: video-scaler@13C00000 {
+			compatible = "samsung,exynos5433-gsc";
+			reg = <0x13c00000 0x1000>;
+			interrupts = <GIC_SPI 297 0>;
+			clocks = <&cmu_gscl CLK_PCLK_GSCL0>,
+				 <&cmu_gscl CLK_ACLK_GSCL0>,
+				 <&cmu_gscl CLK_ACLK_XIU_GSCLX>,
+				 <&cmu_gscl CLK_ACLK_GSCLBEND_333>;
+			clock-names = "pclk",
+				      "aclk",
+				      "aclk_xiu",
+				      "aclk_gsclbend";
+			iommus = <&sysmmu_gscl0>;
+		};
+
+		gsc_1: video-scaler@13C10000 {
+			compatible = "samsung,exynos5433-gsc";
+			reg = <0x13c10000 0x1000>;
+			interrupts = <GIC_SPI 298 0>;
+			clocks = <&cmu_gscl CLK_PCLK_GSCL1>,
+				 <&cmu_gscl CLK_ACLK_GSCL1>,
+				 <&cmu_gscl CLK_ACLK_XIU_GSCLX>,
+				 <&cmu_gscl CLK_ACLK_GSCLBEND_333>;
+			clock-names = "pclk",
+				      "aclk",
+				      "aclk_xiu",
+				      "aclk_gsclbend";
+			iommus = <&sysmmu_gscl1>;
+		};
+
+		gsc_2: video-scaler@13C20000 {
+			compatible = "samsung,exynos5433-gsc";
+			reg = <0x13c20000 0x1000>;
+			interrupts = <GIC_SPI 299 0>;
+			clocks = <&cmu_gscl CLK_PCLK_GSCL2>,
+				 <&cmu_gscl CLK_ACLK_GSCL2>,
+				 <&cmu_gscl CLK_ACLK_XIU_GSCLX>,
+				 <&cmu_gscl CLK_ACLK_GSCLBEND_333>;
+			clock-names = "pclk",
+				      "aclk",
+				      "aclk_xiu",
+				      "aclk_gsclbend";
+			iommus = <&sysmmu_gscl2>;
+		};
+
 		sysmmu_decon0x: sysmmu@0x13a00000 {
 			compatible = "samsung,exynos-sysmmu";
 			reg = <0x13a00000 0x1000>;
@@ -818,6 +869,36 @@
 			#iommu-cells = <0>;
 		};
 
+		sysmmu_gscl0: sysmmu@0x13C80000 {
+			compatible = "samsung,exynos-sysmmu";
+			reg = <0x13C80000 0x1000>;
+			interrupts = <GIC_SPI 288 0>;
+			clock-names = "aclk", "pclk";
+			clocks = <&cmu_gscl CLK_ACLK_SMMU_GSCL0>,
+				 <&cmu_gscl CLK_PCLK_SMMU_GSCL0>;
+			#iommu-cells = <0>;
+		};
+
+		sysmmu_gscl1: sysmmu@0x13C90000 {
+			compatible = "samsung,exynos-sysmmu";
+			reg = <0x13C90000 0x1000>;
+			interrupts = <GIC_SPI 290 0>;
+			clock-names = "aclk", "pclk";
+			clocks = <&cmu_gscl CLK_ACLK_SMMU_GSCL1>,
+				 <&cmu_gscl CLK_PCLK_SMMU_GSCL1>;
+			#iommu-cells = <0>;
+		};
+
+		sysmmu_gscl2: sysmmu@0x13CA0000 {
+			compatible = "samsung,exynos-sysmmu";
+			reg = <0x13CA0000 0x1000>;
+			interrupts = <GIC_SPI 292 0>;
+			clock-names = "aclk", "pclk";
+			clocks = <&cmu_gscl CLK_ACLK_SMMU_GSCL2>,
+				 <&cmu_gscl CLK_PCLK_SMMU_GSCL2>;
+			#iommu-cells = <0>;
+		};
+
 		serial_0: serial@14c10000 {
 			compatible = "samsung,exynos5433-uart";
 			reg = <0x14c10000 0x100>;
-- 
1.9.1
