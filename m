From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v6 8/8] ARM64: dts: exynos: Add mem-2-mem Scaler devices
Date: Thu, 09 Nov 2017 09:11:56 +0100
Message-ID: <20171109081156.7111-9-m.szyprowski@samsung.com>
References: <20171109081156.7111-1-m.szyprowski@samsung.com>
        <CGME20171109081216eucas1p149bf267d58d50dcefc11429cc03b2588@eucas1p1.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:44945 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753124AbdKIIMU (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 9 Nov 2017 03:12:20 -0500
In-reply-to: <20171109081156.7111-1-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Andrzej Pietrasiewicz <andrzej.p@samsung.com>, Hoegeun Kwon <hoegeun.kwon@samsung.com>

From: Andrzej Pietrasiewicz <andrzej.p@samsung.com>

There are two Scaler devices in Exynos5433 SoCs. Add nodes for them and
their SYSMMU controllers.

Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@samsung.com>
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm64/boot/dts/exynos/exynos5433.dtsi | 42 ++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos5433.dtsi b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
index 7fe994b750da..97866114767f 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
@@ -920,6 +920,28 @@
 			iommus = <&sysmmu_gscl2>;
 		};
 
+		scaler_0: scaler@15000000 {
+			compatible = "samsung,exynos5433-scaler";
+			reg = <0x15000000 0x1294>;
+			interrupts = <0 402 IRQ_TYPE_LEVEL_HIGH>;
+			clock-names = "pclk", "aclk", "aclk_xiu";
+			clocks = <&cmu_mscl CLK_PCLK_M2MSCALER0>,
+				 <&cmu_mscl CLK_ACLK_M2MSCALER0>,
+				 <&cmu_mscl CLK_ACLK_XIU_MSCLX>;
+			iommus = <&sysmmu_scaler_0>;
+		};
+
+		scaler_1: scaler@15010000 {
+			compatible = "samsung,exynos5433-scaler";
+			reg = <0x15010000 0x1294>;
+			interrupts = <0 403 IRQ_TYPE_LEVEL_HIGH>;
+			clock-names = "pclk", "aclk", "aclk_xiu";
+			clocks = <&cmu_mscl CLK_PCLK_M2MSCALER1>,
+				 <&cmu_mscl CLK_ACLK_M2MSCALER1>,
+				 <&cmu_mscl CLK_ACLK_XIU_MSCLX>;
+			iommus = <&sysmmu_scaler_1>;
+		};
+
 		jpeg: codec@15020000 {
 			compatible = "samsung,exynos5433-jpeg";
 			reg = <0x15020000 0x10000>;
@@ -1014,6 +1036,26 @@
 			#iommu-cells = <0>;
 		};
 
+		sysmmu_scaler_0: sysmmu@0x15040000 {
+			compatible = "samsung,exynos-sysmmu";
+			reg = <0x15040000 0x1000>;
+			interrupts = <GIC_SPI 404 IRQ_TYPE_LEVEL_HIGH>;
+			clock-names = "pclk", "aclk";
+			clocks = <&cmu_mscl CLK_PCLK_SMMU_M2MSCALER0>,
+				 <&cmu_mscl CLK_ACLK_SMMU_M2MSCALER0>;
+			#iommu-cells = <0>;
+		};
+
+		sysmmu_scaler_1: sysmmu@0x15050000 {
+			compatible = "samsung,exynos-sysmmu";
+			reg = <0x15050000 0x1000>;
+			interrupts = <GIC_SPI 406 IRQ_TYPE_LEVEL_HIGH>;
+			clock-names = "pclk", "aclk";
+			clocks = <&cmu_mscl CLK_PCLK_SMMU_M2MSCALER1>,
+				 <&cmu_mscl CLK_ACLK_SMMU_M2MSCALER1>;
+			#iommu-cells = <0>;
+		};
+
 		sysmmu_jpeg: sysmmu@15060000 {
 			compatible = "samsung,exynos-sysmmu";
 			reg = <0x15060000 0x1000>;
-- 
2.14.2
