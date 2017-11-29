From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v2 4/6] arm64: dts: exynos: Add MFC power domain to Exynos
 5433 SoC
Date: Wed, 29 Nov 2017 12:26:36 +0100
Message-ID: <20171129112638.15813-5-m.szyprowski@samsung.com>
References: <20171129112638.15813-1-m.szyprowski@samsung.com>
        <CGME20171129112650eucas1p14c99978fbf664f9246d57360ca91353e@eucas1p1.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:57059 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932287AbdK2L0y (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 29 Nov 2017 06:26:54 -0500
In-reply-to: <20171129112638.15813-1-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Inki Dae <inki.dae@samsung.com>

This patch adds support for MFC power domain to Exynos 5433 SoCs, which
contains following devices: a clock controller, MFC codec device and its
SYSMMUs.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm64/boot/dts/exynos/exynos5433.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos5433.dtsi b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
index 0a06be283a31..cfa2a0d4dc2f 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
@@ -486,6 +486,7 @@
 
 			clock-names = "oscclk", "aclk_mfc_400";
 			clocks = <&xxti>, <&cmu_top CLK_ACLK_MFC_400>;
+			power-domains = <&pd_mfc>;
 		};
 
 		cmu_hevc: clock-controller@14f80000 {
@@ -567,6 +568,13 @@
 			label = "DISP";
 		};
 
+		pd_mfc: power-domain@105c4180 {
+			compatible = "samsung,exynos5433-pd";
+			reg = <0x105c4180 0x20>;
+			#power-domain-cells = <0>;
+			label = "MFC";
+		};
+
 		tmu_atlas0: tmu@10060000 {
 			compatible = "samsung,exynos5433-tmu";
 			reg = <0x10060000 0x200>;
@@ -992,6 +1000,7 @@
 				 <&cmu_mfc CLK_ACLK_XIU_MFCX>;
 			iommus = <&sysmmu_mfc_0>, <&sysmmu_mfc_1>;
 			iommu-names = "left", "right";
+			power-domains = <&pd_mfc>;
 		};
 
 		sysmmu_decon0x: sysmmu@13a00000 {
@@ -1090,6 +1099,7 @@
 			clocks = <&cmu_mfc CLK_PCLK_SMMU_MFC_0>,
 				 <&cmu_mfc CLK_ACLK_SMMU_MFC_0>;
 			#iommu-cells = <0>;
+			power-domains = <&pd_mfc>;
 		};
 
 		sysmmu_mfc_1: sysmmu@15210000 {
@@ -1100,6 +1110,7 @@
 			clocks = <&cmu_mfc CLK_PCLK_SMMU_MFC_1>,
 				 <&cmu_mfc CLK_ACLK_SMMU_MFC_1>;
 			#iommu-cells = <0>;
+			power-domains = <&pd_mfc>;
 		};
 
 		serial_0: serial@14c10000 {
-- 
2.15.0
