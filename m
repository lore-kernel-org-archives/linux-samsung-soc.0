From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v2 1/6] arm64: dts: exynos: Add GSCL power domain to Exynos
 5433 SoC
Date: Wed, 29 Nov 2017 12:26:33 +0100
Message-ID: <20171129112638.15813-2-m.szyprowski@samsung.com>
References: <20171129112638.15813-1-m.szyprowski@samsung.com>
        <CGME20171129112649eucas1p1e631c8dd108b28b39924e3b3228dfa73@eucas1p1.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:37118 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932247AbdK2L0w (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 29 Nov 2017 06:26:52 -0500
In-reply-to: <20171129112638.15813-1-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Inki Dae <inki.dae@samsung.com>

This patch adds support for GSCL power domain to Exynos 5433 SoCs, which
contains following devices: a clock controller, three GSCL video scalers and
their SYSMMUs.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm64/boot/dts/exynos/exynos5433.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos5433.dtsi b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
index 9484d2f867dc..2a03be0c9ae7 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
@@ -443,6 +443,7 @@
 			clocks = <&xxti>,
 				<&cmu_top CLK_ACLK_GSCL_111>,
 				<&cmu_top CLK_ACLK_GSCL_333>;
+			power-domains = <&pd_gscl>;
 		};
 
 		cmu_apollo: clock-controller@11900000 {
@@ -543,6 +544,13 @@
 				<&cmu_top CLK_ACLK_CAM1_552>;
 		};
 
+		pd_gscl: power-domain@105c4000 {
+			compatible = "samsung,exynos5433-pd";
+			reg = <0x105c4000 0x20>;
+			#power-domain-cells = <0>;
+			label = "GSCL";
+		};
+
 		tmu_atlas0: tmu@10060000 {
 			compatible = "samsung,exynos5433-tmu";
 			reg = <0x10060000 0x200>;
@@ -910,6 +918,7 @@
 				 <&cmu_gscl CLK_ACLK_XIU_GSCLX>,
 				 <&cmu_gscl CLK_ACLK_GSCLBEND_333>;
 			iommus = <&sysmmu_gscl0>;
+			power-domains = <&pd_gscl>;
 		};
 
 		gsc_1: video-scaler@13C10000 {
@@ -923,6 +932,7 @@
 				 <&cmu_gscl CLK_ACLK_XIU_GSCLX>,
 				 <&cmu_gscl CLK_ACLK_GSCLBEND_333>;
 			iommus = <&sysmmu_gscl1>;
+			power-domains = <&pd_gscl>;
 		};
 
 		gsc_2: video-scaler@13C20000 {
@@ -936,6 +946,7 @@
 				 <&cmu_gscl CLK_ACLK_XIU_GSCLX>,
 				 <&cmu_gscl CLK_ACLK_GSCLBEND_333>;
 			iommus = <&sysmmu_gscl2>;
+			power-domains = <&pd_gscl>;
 		};
 
 		jpeg: codec@15020000 {
@@ -1010,6 +1021,7 @@
 			clocks = <&cmu_gscl CLK_ACLK_SMMU_GSCL0>,
 				 <&cmu_gscl CLK_PCLK_SMMU_GSCL0>;
 			#iommu-cells = <0>;
+			power-domains = <&pd_gscl>;
 		};
 
 		sysmmu_gscl1: sysmmu@13c90000 {
@@ -1020,6 +1032,7 @@
 			clocks = <&cmu_gscl CLK_ACLK_SMMU_GSCL1>,
 				 <&cmu_gscl CLK_PCLK_SMMU_GSCL1>;
 			#iommu-cells = <0>;
+			power-domains = <&pd_gscl>;
 		};
 
 		sysmmu_gscl2: sysmmu@13ca0000 {
@@ -1030,6 +1043,7 @@
 			clocks = <&cmu_gscl CLK_ACLK_SMMU_GSCL2>,
 				 <&cmu_gscl CLK_PCLK_SMMU_GSCL2>;
 			#iommu-cells = <0>;
+			power-domains = <&pd_gscl>;
 		};
 
 		sysmmu_jpeg: sysmmu@15060000 {
-- 
2.15.0
