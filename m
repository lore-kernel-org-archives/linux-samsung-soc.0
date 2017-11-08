From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v5 8/8] ARM64: dts: exynos: Add mem-2-mem Scaler devices
Date: Wed, 08 Nov 2017 10:41:47 +0100
Message-ID: <20171108094147.25854-9-m.szyprowski@samsung.com>
References: <20171108094147.25854-1-m.szyprowski@samsung.com>
        <CGME20171108094158eucas1p231b707f18ac2e572f493cecd159a4168@eucas1p2.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:60950 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751658AbdKHJmB (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 8 Nov 2017 04:42:01 -0500
In-reply-to: <20171108094147.25854-1-m.szyprowski@samsung.com>
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
