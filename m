From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v2 2/6] arm64: dts: exynos: Add DISP power domain to Exynos
 5433 SoC
Date: Wed, 29 Nov 2017 12:26:34 +0100
Message-ID: <20171129112638.15813-3-m.szyprowski@samsung.com>
References: <20171129112638.15813-1-m.szyprowski@samsung.com>
        <CGME20171129112649eucas1p16bc5ac7a6237eba11fc42ec2bd38dc52@eucas1p1.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:37120 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932262AbdK2L0w (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 29 Nov 2017 06:26:52 -0500
In-reply-to: <20171129112638.15813-1-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Inki Dae <inki.dae@samsung.com>

This patch adds support for DISP power domain to Exynos 5433 SoCs, which
contains following devices: a clock controller, two display controllers
(DECON and DECON TV), their SYSMMUs, MIC, DSI and HDMI video devices.

OCSigned-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm64/boot/dts/exynos/exynos5433.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos5433.dtsi b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
index 2a03be0c9ae7..95f30ccc00a3 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
@@ -386,6 +386,7 @@
 				<&cmu_mif CLK_SCLK_DECON_ECLK_DISP>,
 				<&cmu_mif CLK_SCLK_DECON_TV_VCLK_DISP>,
 				<&cmu_mif CLK_ACLK_DISP_333>;
+			power-domains = <&pd_disp>;
 		};
 
 		cmu_aud: clock-controller@114c0000 {
@@ -551,6 +552,13 @@
 			label = "GSCL";
 		};
 
+		pd_disp: power-domain@105c4080 {
+			compatible = "samsung,exynos5433-pd";
+			reg = <0x105c4080 0x20>;
+			#power-domain-cells = <0>;
+			label = "DISP";
+		};
+
 		tmu_atlas0: tmu@10060000 {
 			compatible = "samsung,exynos5433-tmu";
 			reg = <0x10060000 0x200>;
@@ -754,6 +762,7 @@
 			clock-names = "pclk", "aclk_decon", "aclk_smmu_decon0x",
 				"aclk_xiu_decon0x", "pclk_smmu_decon0x",
 				"sclk_decon_vclk", "sclk_decon_eclk";
+			power-domains = <&pd_disp>;
 			interrupt-names = "fifo", "vsync", "lcd_sys";
 			interrupts = <GIC_SPI 201 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 202 IRQ_TYPE_LEVEL_HIGH>,
@@ -791,6 +800,7 @@
 				      "aclk_xiu_decon0x", "pclk_smmu_decon0x",
 				      "sclk_decon_vclk", "sclk_decon_eclk";
 			samsung,disp-sysreg = <&syscon_disp>;
+			power-domains = <&pd_disp>;
 			interrupt-names = "fifo", "vsync", "lcd_sys";
 			interrupts = <GIC_SPI 210 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 211 IRQ_TYPE_LEVEL_HIGH>,
@@ -816,6 +826,7 @@
 					"phyclk_mipidphy0_rxclkesc0",
 					"sclk_rgb_vclk_to_dsim0",
 					"sclk_mipi";
+			power-domains = <&pd_disp>;
 			status = "disabled";
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -839,6 +850,7 @@
 			clocks = <&cmu_disp CLK_PCLK_MIC0>,
 				<&cmu_disp CLK_SCLK_RGB_VCLK_TO_MIC0>;
 			clock-names = "pclk_mic0", "sclk_rgb_vclk_to_mic0";
+			power-domains = <&pd_disp>;
 			samsung,disp-syscon = <&syscon_disp>;
 			status = "disabled";
 
@@ -980,6 +992,7 @@
 			clock-names = "pclk", "aclk";
 			clocks = <&cmu_disp CLK_PCLK_SMMU_DECON0X>,
 				<&cmu_disp CLK_ACLK_SMMU_DECON0X>;
+			power-domains = <&pd_disp>;
 			#iommu-cells = <0>;
 		};
 
@@ -991,6 +1004,7 @@
 			clocks = <&cmu_disp CLK_PCLK_SMMU_DECON1X>,
 				<&cmu_disp CLK_ACLK_SMMU_DECON1X>;
 			#iommu-cells = <0>;
+			power-domains = <&pd_disp>;
 		};
 
 		sysmmu_tv0x: sysmmu@13a20000 {
@@ -1001,6 +1015,7 @@
 			clocks = <&cmu_disp CLK_PCLK_SMMU_TV0X>,
 				<&cmu_disp CLK_ACLK_SMMU_TV0X>;
 			#iommu-cells = <0>;
+			power-domains = <&pd_disp>;
 		};
 
 		sysmmu_tv1x: sysmmu@13a30000 {
@@ -1011,6 +1026,7 @@
 			clocks = <&cmu_disp CLK_PCLK_SMMU_TV1X>,
 				<&cmu_disp CLK_ACLK_SMMU_TV1X>;
 			#iommu-cells = <0>;
+			power-domains = <&pd_disp>;
 		};
 
 		sysmmu_gscl0: sysmmu@13c80000 {
-- 
2.15.0
