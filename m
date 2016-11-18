From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v2 RESEND 1/3] arm64: dts: exynos: TM2 - add support for
 GScaler devices
Date: Fri, 18 Nov 2016 13:23:11 +0100
Message-ID: <1479471793-13021-2-git-send-email-m.szyprowski@samsung.com>
References: <1479471793-13021-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:37114 "EHLO
        mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752903AbcKRMXq (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 18 Nov 2016 07:23:46 -0500
Received: from epcpsbgm1new.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OGU001M57RDQK60@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 18 Nov 2016 21:23:43 +0900 (KST)
In-reply-to: <1479471793-13021-1-git-send-email-m.szyprowski@samsung.com>
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
index 2569e4a..8eb59ad 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts
+++ b/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts
@@ -23,6 +23,9 @@
 	compatible = "samsung,tm2", "samsung,exynos5433";
 
 	aliases {
+		gsc0 = &gsc_0;
+		gsc1 = &gsc_1;
+		gsc2 = &gsc_2;
 		pinctrl0 = &pinctrl_alive;
 		pinctrl1 = &pinctrl_aud;
 		pinctrl2 = &pinctrl_cpif;
@@ -186,6 +189,13 @@
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
index 7d71827..945b250 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
@@ -805,6 +805,45 @@
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
@@ -825,6 +864,36 @@
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
