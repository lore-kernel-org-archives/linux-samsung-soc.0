From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v2 3/6] arm64: dts: exynos: Add MSCL power domain to Exynos
 5433 SoC
Date: Wed, 29 Nov 2017 12:26:35 +0100
Message-ID: <20171129112638.15813-4-m.szyprowski@samsung.com>
References: <20171129112638.15813-1-m.szyprowski@samsung.com>
        <CGME20171129112650eucas1p13a3cc167bc64d133cf24e4f621865203@eucas1p1.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:57054 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932266AbdK2L0y (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 29 Nov 2017 06:26:54 -0500
In-reply-to: <20171129112638.15813-1-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Inki Dae <inki.dae@samsung.com>

This patch adds support for MSCL power domain to Exynos 5433 SoCs, which
contains following devices: a clock controller, JPEG codec device and its
SYSMMU.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm64/boot/dts/exynos/exynos5433.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos5433.dtsi b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
index 95f30ccc00a3..0a06be283a31 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
@@ -476,6 +476,7 @@
 			clocks = <&xxti>,
 				<&cmu_top CLK_SCLK_JPEG_MSCL>,
 				<&cmu_top CLK_ACLK_MSCL_400>;
+			power-domains = <&pd_mscl>;
 		};
 
 		cmu_mfc: clock-controller@15280000 {
@@ -552,6 +553,13 @@
 			label = "GSCL";
 		};
 
+		pd_mscl: power-domain@105c4040 {
+			compatible = "samsung,exynos5433-pd";
+			reg = <0x105c4040 0x20>;
+			#power-domain-cells = <0>;
+			label = "MSCL";
+		};
+
 		pd_disp: power-domain@105c4080 {
 			compatible = "samsung,exynos5433-pd";
 			reg = <0x105c4080 0x20>;
@@ -971,6 +979,7 @@
 				 <&cmu_mscl CLK_ACLK_XIU_MSCLX>,
 				 <&cmu_mscl CLK_SCLK_JPEG>;
 			iommus = <&sysmmu_jpeg>;
+			power-domains = <&pd_mscl>;
 		};
 
 		mfc: codec@152E0000 {
@@ -1070,6 +1079,7 @@
 			clocks = <&cmu_mscl CLK_PCLK_SMMU_JPEG>,
 				 <&cmu_mscl CLK_ACLK_SMMU_JPEG>;
 			#iommu-cells = <0>;
+			power-domains = <&pd_mscl>;
 		};
 
 		sysmmu_mfc_0: sysmmu@15200000 {
-- 
2.15.0
