From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH] arm64: dts: exynos: Exynos5433: swap clock order of sysmmu
Date: Thu, 19 Sep 2019 15:50:53 +0200
Message-ID: <20190919135053.11849-1-m.szyprowski@samsung.com>
References: <20190919131944.11007-1-m.szyprowski@samsung.com>
        <CGME20190919135115eucas1p2e1c9c090c5a75211e5a137c598721287@eucas1p2.samsung.com>
Content-Type: text/plain; charset="utf-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190919131944.11007-1-m.szyprowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Maciej Falkowski <m.falkowski@samsung.com>, krzk@kernel.org, mark.rutland@arm.com, robh@kernel.org, a.hajda@samsung.com, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

From: Maciej Falkowski <m.falkowski@samsung.com>

dt-schema supports only order of names "aclk", "pclk".
Swap some sysmmu definitions to make them compatible with schema.

Signed-off-by: Maciej Falkowski <m.falkowski@samsung.com>
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm64/boot/dts/exynos/exynos5433.dtsi | 54 +++++++++++-----------
 1 file changed, 27 insertions(+), 27 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos5433.dtsi b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
index a76f620f7f35..ba66ea906f60 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
@@ -1179,9 +1179,9 @@
 			compatible = "samsung,exynos-sysmmu";
 			reg = <0x13a00000 0x1000>;
 			interrupts = <GIC_SPI 192 IRQ_TYPE_LEVEL_HIGH>;
-			clock-names = "pclk", "aclk";
-			clocks = <&cmu_disp CLK_PCLK_SMMU_DECON0X>,
-				<&cmu_disp CLK_ACLK_SMMU_DECON0X>;
+			clock-names = "aclk", "pclk";
+			clocks = <&cmu_disp CLK_ACLK_SMMU_DECON0X>,
+				<&cmu_disp CLK_PCLK_SMMU_DECON0X>;
 			power-domains = <&pd_disp>;
 			#iommu-cells = <0>;
 		};
@@ -1190,9 +1190,9 @@
 			compatible = "samsung,exynos-sysmmu";
 			reg = <0x13a10000 0x1000>;
 			interrupts = <GIC_SPI 194 IRQ_TYPE_LEVEL_HIGH>;
-			clock-names = "pclk", "aclk";
-			clocks = <&cmu_disp CLK_PCLK_SMMU_DECON1X>,
-				<&cmu_disp CLK_ACLK_SMMU_DECON1X>;
+			clock-names = "aclk", "pclk";
+			clocks = <&cmu_disp CLK_ACLK_SMMU_DECON1X>,
+				<&cmu_disp CLK_PCLK_SMMU_DECON1X>;
 			#iommu-cells = <0>;
 			power-domains = <&pd_disp>;
 		};
@@ -1201,9 +1201,9 @@
 			compatible = "samsung,exynos-sysmmu";
 			reg = <0x13a20000 0x1000>;
 			interrupts = <GIC_SPI 214 IRQ_TYPE_LEVEL_HIGH>;
-			clock-names = "pclk", "aclk";
-			clocks = <&cmu_disp CLK_PCLK_SMMU_TV0X>,
-				<&cmu_disp CLK_ACLK_SMMU_TV0X>;
+			clock-names = "aclk", "pclk";
+			clocks = <&cmu_disp CLK_ACLK_SMMU_TV0X>,
+				<&cmu_disp CLK_PCLK_SMMU_TV0X>;
 			#iommu-cells = <0>;
 			power-domains = <&pd_disp>;
 		};
@@ -1212,9 +1212,9 @@
 			compatible = "samsung,exynos-sysmmu";
 			reg = <0x13a30000 0x1000>;
 			interrupts = <GIC_SPI 216 IRQ_TYPE_LEVEL_HIGH>;
-			clock-names = "pclk", "aclk";
-			clocks = <&cmu_disp CLK_PCLK_SMMU_TV1X>,
-				<&cmu_disp CLK_ACLK_SMMU_TV1X>;
+			clock-names = "aclk", "pclk";
+			clocks = <&cmu_disp CLK_ACLK_SMMU_TV1X>,
+				<&cmu_disp CLK_PCLK_SMMU_TV1X>;
 			#iommu-cells = <0>;
 			power-domains = <&pd_disp>;
 		};
@@ -1256,9 +1256,9 @@
 			compatible = "samsung,exynos-sysmmu";
 			reg = <0x15040000 0x1000>;
 			interrupts = <GIC_SPI 404 IRQ_TYPE_LEVEL_HIGH>;
-			clock-names = "pclk", "aclk";
-			clocks = <&cmu_mscl CLK_PCLK_SMMU_M2MSCALER0>,
-				 <&cmu_mscl CLK_ACLK_SMMU_M2MSCALER0>;
+			clock-names = "aclk", "pclk";
+			clocks = <&cmu_mscl CLK_ACLK_SMMU_M2MSCALER0>,
+				<&cmu_mscl CLK_PCLK_SMMU_M2MSCALER0>;
 			#iommu-cells = <0>;
 			power-domains = <&pd_mscl>;
 		};
@@ -1267,9 +1267,9 @@
 			compatible = "samsung,exynos-sysmmu";
 			reg = <0x15050000 0x1000>;
 			interrupts = <GIC_SPI 406 IRQ_TYPE_LEVEL_HIGH>;
-			clock-names = "pclk", "aclk";
-			clocks = <&cmu_mscl CLK_PCLK_SMMU_M2MSCALER1>,
-				 <&cmu_mscl CLK_ACLK_SMMU_M2MSCALER1>;
+			clock-names = "aclk", "pclk";
+			clocks = <&cmu_mscl CLK_ACLK_SMMU_M2MSCALER1>,
+				<&cmu_mscl CLK_PCLK_SMMU_M2MSCALER1>;
 			#iommu-cells = <0>;
 			power-domains = <&pd_mscl>;
 		};
@@ -1278,9 +1278,9 @@
 			compatible = "samsung,exynos-sysmmu";
 			reg = <0x15060000 0x1000>;
 			interrupts = <GIC_SPI 408 IRQ_TYPE_LEVEL_HIGH>;
-			clock-names = "pclk", "aclk";
-			clocks = <&cmu_mscl CLK_PCLK_SMMU_JPEG>,
-				 <&cmu_mscl CLK_ACLK_SMMU_JPEG>;
+			clock-names = "aclk", "pclk";
+			clocks = <&cmu_mscl CLK_ACLK_SMMU_JPEG>,
+				<&cmu_mscl CLK_PCLK_SMMU_JPEG>;
 			#iommu-cells = <0>;
 			power-domains = <&pd_mscl>;
 		};
@@ -1289,9 +1289,9 @@
 			compatible = "samsung,exynos-sysmmu";
 			reg = <0x15200000 0x1000>;
 			interrupts = <GIC_SPI 352 IRQ_TYPE_LEVEL_HIGH>;
-			clock-names = "pclk", "aclk";
-			clocks = <&cmu_mfc CLK_PCLK_SMMU_MFC_0>,
-				 <&cmu_mfc CLK_ACLK_SMMU_MFC_0>;
+			clock-names = "aclk", "pclk";
+			clocks = <&cmu_mfc CLK_ACLK_SMMU_MFC_0>,
+				<&cmu_mfc CLK_PCLK_SMMU_MFC_0>;
 			#iommu-cells = <0>;
 			power-domains = <&pd_mfc>;
 		};
@@ -1300,9 +1300,9 @@
 			compatible = "samsung,exynos-sysmmu";
 			reg = <0x15210000 0x1000>;
 			interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>;
-			clock-names = "pclk", "aclk";
-			clocks = <&cmu_mfc CLK_PCLK_SMMU_MFC_1>,
-				 <&cmu_mfc CLK_ACLK_SMMU_MFC_1>;
+			clock-names = "aclk", "pclk";
+			clocks = <&cmu_mfc CLK_ACLK_SMMU_MFC_1>,
+				<&cmu_mfc CLK_PCLK_SMMU_MFC_1>;
 			#iommu-cells = <0>;
 			power-domains = <&pd_mfc>;
 		};
-- 
2.17.1
