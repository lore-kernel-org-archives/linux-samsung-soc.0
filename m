From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v2 1/3] arm64: dts: exynos: TM2 - add support for GScaler
 devices
Date: Thu, 17 Nov 2016 10:01:55 +0100
Message-ID: <1479373317-11711-2-git-send-email-m.szyprowski@samsung.com>
References: <1479373317-11711-1-git-send-email-m.szyprowski@samsung.com>
 <CGME20161117090207eucas1p2d01763d592faff079342b2aca27e30ad@eucas1p2.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:45431 "EHLO
        mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751320AbcKQJCL (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 17 Nov 2016 04:02:11 -0500
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OGS008JK3RL4A80@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 17 Nov 2016 09:02:09 +0000 (GMT)
In-reply-to: <1479373317-11711-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>

This patch adds device nodes for GScaler devices to Exynos5433 SoC dtsi
and proper initial clock configuration to TM2 dts.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm64/boot/dts/exynos/exynos5433-tm2.dts | 10 ++++
 arch/arm64/boot/dts/exynos/exynos5433.dtsi    | 69 +++++++++++++++++++++++++++
 2 files changed, 79 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts b/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts
index 48da2095e381..15436d30268f 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts
+++ b/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts
@@ -30,6 +30,9 @@
 	model_info-hw_rev_end = <7>;
 
 	aliases {
+		gsc0 = &gsc_0;
+		gsc1 = &gsc_1;
+		gsc2 = &gsc_2;
 		pinctrl0 = &pinctrl_alive;
 		pinctrl1 = &pinctrl_aud;
 		pinctrl2 = &pinctrl_cpif;
@@ -193,6 +196,13 @@
 			       <66700000>, <66700000>;
 };
 
+&cmu_gscl {
+	assigned-clocks = <&cmu_gscl CLK_MOUT_ACLK_GSCL_111_USER>,
+			  <&cmu_gscl CLK_MOUT_ACLK_GSCL_333_USER>;
+	assigned-clock-parents = <&cmu_top CLK_ACLK_GSCL_111>,
+				 <&cmu_top CLK_ACLK_GSCL_333>;
+};
+
 &cpu0 {
 	cpu-supply = <&buck3_reg>;
 };
diff --git a/arch/arm64/boot/dts/exynos/exynos5433.dtsi b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
index ab2935253cca..956096f9d2e6 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
@@ -798,6 +798,45 @@
 			reg = <0x145f0000 0x1038>;
 		};
 
+		gsc_0: video-scaler@13C00000 {
+			compatible = "samsung,exynos5433-gsc";
+			reg = <0x13c00000 0x1000>;
+			interrupts = <GIC_SPI 297 IRQ_TYPE_LEVEL_HIGH>;
+			clock-names = "pclk", "aclk", "aclk_xiu",
+				      "aclk_gsclbend";
+			clocks = <&cmu_gscl CLK_PCLK_GSCL0>,
+				 <&cmu_gscl CLK_ACLK_GSCL0>,
+				 <&cmu_gscl CLK_ACLK_XIU_GSCLX>,
+				 <&cmu_gscl CLK_ACLK_GSCLBEND_333>;
+			iommus = <&sysmmu_gscl0>;
+		};
+
+		gsc_1: video-scaler@13C10000 {
+			compatible = "samsung,exynos5433-gsc";
+			reg = <0x13c10000 0x1000>;
+			interrupts = <GIC_SPI 298 IRQ_TYPE_LEVEL_HIGH>;
+			clock-names = "pclk", "aclk", "aclk_xiu",
+				      "aclk_gsclbend";
+			clocks = <&cmu_gscl CLK_PCLK_GSCL1>,
+				 <&cmu_gscl CLK_ACLK_GSCL1>,
+				 <&cmu_gscl CLK_ACLK_XIU_GSCLX>,
+				 <&cmu_gscl CLK_ACLK_GSCLBEND_333>;
+			iommus = <&sysmmu_gscl1>;
+		};
+
+		gsc_2: video-scaler@13C20000 {
+			compatible = "samsung,exynos5433-gsc";
+			reg = <0x13c20000 0x1000>;
+			interrupts = <GIC_SPI 299 IRQ_TYPE_LEVEL_HIGH>;
+			clock-names = "pclk", "aclk", "aclk_xiu",
+				      "aclk_gsclbend";
+			clocks = <&cmu_gscl CLK_PCLK_GSCL2>,
+				 <&cmu_gscl CLK_ACLK_GSCL2>,
+				 <&cmu_gscl CLK_ACLK_XIU_GSCLX>,
+				 <&cmu_gscl CLK_ACLK_GSCLBEND_333>;
+			iommus = <&sysmmu_gscl2>;
+		};
+
 		sysmmu_decon0x: sysmmu@0x13a00000 {
 			compatible = "samsung,exynos-sysmmu";
 			reg = <0x13a00000 0x1000>;
@@ -818,6 +857,36 @@
 			#iommu-cells = <0>;
 		};
 
+		sysmmu_gscl0: sysmmu@0x13C80000 {
+			compatible = "samsung,exynos-sysmmu";
+			reg = <0x13C80000 0x1000>;
+			interrupts = <GIC_SPI 288 IRQ_TYPE_LEVEL_HIGH>;
+			clock-names = "aclk", "pclk";
+			clocks = <&cmu_gscl CLK_ACLK_SMMU_GSCL0>,
+				 <&cmu_gscl CLK_PCLK_SMMU_GSCL0>;
+			#iommu-cells = <0>;
+		};
+
+		sysmmu_gscl1: sysmmu@0x13C90000 {
+			compatible = "samsung,exynos-sysmmu";
+			reg = <0x13C90000 0x1000>;
+			interrupts = <GIC_SPI 290 IRQ_TYPE_LEVEL_HIGH>;
+			clock-names = "aclk", "pclk";
+			clocks = <&cmu_gscl CLK_ACLK_SMMU_GSCL1>,
+				 <&cmu_gscl CLK_PCLK_SMMU_GSCL1>;
+			#iommu-cells = <0>;
+		};
+
+		sysmmu_gscl2: sysmmu@0x13CA0000 {
+			compatible = "samsung,exynos-sysmmu";
+			reg = <0x13CA0000 0x1000>;
+			interrupts = <GIC_SPI 292 IRQ_TYPE_LEVEL_HIGH>;
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
