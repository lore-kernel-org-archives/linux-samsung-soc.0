From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v3 8/9] ARM: dts: exynos: Add mem-2-mem Scaler devices
Date: Tue, 17 Oct 2017 13:07:51 +0200
Message-ID: <20171017110752.25096-9-m.szyprowski@samsung.com>
References: <20171017110752.25096-1-m.szyprowski@samsung.com>
        <CGME20171017110815eucas1p176ec31bb797825518cb6e131124a120c@eucas1p1.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:38800 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1758877AbdJQLIS (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 17 Oct 2017 07:08:18 -0400
In-reply-to: <20171017110752.25096-1-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Andrzej Pietrasiewicz <andrzej.p@samsung.com>, Hoegeun Kwon <hoegeun.kwon@samsung.com>

From: Andrzej Pietrasiewicz <andrzej.p@samsung.com>

There are 3 Scaler devices in Exynos5420 SoCs, all are a part of MSCL
power domain. MSCL power domain and SYSMMU controllers (two per each
scaler device) have been already added to exynos5420.dtsi earlier,
so bind them to newly added devices.

Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@samsung.com>
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm/boot/dts/exynos5420.dtsi | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
index 88e5d6d3f901..7894045bd91b 100644
--- a/arch/arm/boot/dts/exynos5420.dtsi
+++ b/arch/arm/boot/dts/exynos5420.dtsi
@@ -678,6 +678,35 @@
 			iommus = <&sysmmu_gscl1>;
 		};
 
+		scaler_0: scaler@12800000 {
+			compatible = "samsung,exynos5420-scaler";
+			reg = <0x12800000 0x1294>;
+			interrupts = <0 220 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clock CLK_MSCL0>;
+			clock-names = "mscl";
+			power-domains = <&msc_pd>;
+			iommus = <&sysmmu_scaler0r>, <&sysmmu_scaler0w>;
+		};
+
+		scaler_1: scaler@12810000 {
+			compatible = "samsung,exynos5420-scaler";
+			reg = <0x12810000 0x1294>;
+			interrupts = <0 221 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clock CLK_MSCL1>;
+			clock-names = "mscl";
+			power-domains = <&msc_pd>;
+			iommus = <&sysmmu_scaler1r>, <&sysmmu_scaler1w>;
+		};
+		scaler_2: scaler@12820000 {
+			compatible = "samsung,exynos5420-scaler";
+			reg = <0x12820000 0x1294>;
+			interrupts = <0 222 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clock CLK_MSCL2>;
+			clock-names = "mscl";
+			power-domains = <&msc_pd>;
+			iommus = <&sysmmu_scaler2r>, <&sysmmu_scaler2w>;
+		};
+
 		jpeg_0: jpeg@11F50000 {
 			compatible = "samsung,exynos5420-jpeg";
 			reg = <0x11F50000 0x1000>;
@@ -812,6 +841,7 @@
 			interrupts = <22 4>;
 			clock-names = "sysmmu", "master";
 			clocks = <&clock CLK_SMMU_MSCL0>, <&clock CLK_MSCL0>;
+			power-domains = <&msc_pd>;
 			#iommu-cells = <0>;
 		};
 
@@ -821,6 +851,7 @@
 			interrupts = <GIC_SPI 186 IRQ_TYPE_LEVEL_HIGH>;
 			clock-names = "sysmmu", "master";
 			clocks = <&clock CLK_SMMU_MSCL1>, <&clock CLK_MSCL1>;
+			power-domains = <&msc_pd>;
 			#iommu-cells = <0>;
 		};
 
@@ -830,6 +861,7 @@
 			interrupts = <GIC_SPI 188 IRQ_TYPE_LEVEL_HIGH>;
 			clock-names = "sysmmu", "master";
 			clocks = <&clock CLK_SMMU_MSCL2>, <&clock CLK_MSCL2>;
+			power-domains = <&msc_pd>;
 			#iommu-cells = <0>;
 		};
 
@@ -840,6 +872,7 @@
 			interrupts = <27 2>;
 			clock-names = "sysmmu", "master";
 			clocks = <&clock CLK_SMMU_MSCL0>, <&clock CLK_MSCL0>;
+			power-domains = <&msc_pd>;
 			#iommu-cells = <0>;
 		};
 
@@ -850,6 +883,7 @@
 			interrupts = <22 6>;
 			clock-names = "sysmmu", "master";
 			clocks = <&clock CLK_SMMU_MSCL1>, <&clock CLK_MSCL1>;
+			power-domains = <&msc_pd>;
 			#iommu-cells = <0>;
 		};
 
@@ -860,6 +894,7 @@
 			interrupts = <19 6>;
 			clock-names = "sysmmu", "master";
 			clocks = <&clock CLK_SMMU_MSCL2>, <&clock CLK_MSCL2>;
+			power-domains = <&msc_pd>;
 			#iommu-cells = <0>;
 		};
 
-- 
2.14.2
