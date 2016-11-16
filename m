From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 2/3] arm64: dts: exynos: TM2 - add support for JPEG codec device
Date: Wed, 16 Nov 2016 14:11:28 +0100
Message-ID: <1479301889-11393-3-git-send-email-m.szyprowski@samsung.com>
References: <1479301889-11393-1-git-send-email-m.szyprowski@samsung.com>
 <CGME20161116131138eucas1p18c6a9d4469caff62cbd8a73cb443d5e0@eucas1p1.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:16089 "EHLO
        mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932140AbcKPNLo (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 16 Nov 2016 08:11:44 -0500
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OGQ00J1CKNFHY70@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 16 Nov 2016 13:11:39 +0000 (GMT)
In-reply-to: <1479301889-11393-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>

This patch adds device nodes for JPEG codec device to Exynos
5433 SoC dtsi and proper initial clock configuration to TM2 dts.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm64/boot/dts/exynos/exynos5433-tm2.dts | 11 +++++++++++
 arch/arm64/boot/dts/exynos/exynos5433.dtsi    | 25 +++++++++++++++++++++++++
 2 files changed, 36 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts b/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts
index 5ff5c30..2e76b30 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts
+++ b/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts
@@ -916,6 +916,17 @@
 				 <&cmu_top CLK_ACLK_GSCL_333>;
 };
 
+&cmu_mscl {
+	assigned-clocks = <&cmu_mscl CLK_MOUT_ACLK_MSCL_400_USER>,
+			  <&cmu_mscl CLK_MOUT_SCLK_JPEG_USER>,
+			  <&cmu_mscl CLK_MOUT_SCLK_JPEG>,
+			  <&cmu_top CLK_MOUT_SCLK_JPEG_A>;
+	assigned-clock-parents = <&cmu_top CLK_ACLK_MSCL_400>,
+				 <&cmu_top CLK_SCLK_JPEG_MSCL>,
+				 <&cmu_mscl CLK_MOUT_SCLK_JPEG_USER>,
+				 <&cmu_top CLK_MOUT_BUS_PLL_USER>;
+};
+
 &spi_1 {
 	cs-gpios = <&gpd6 3 GPIO_ACTIVE_HIGH>;
 	status = "okay";
diff --git a/arch/arm64/boot/dts/exynos/exynos5433.dtsi b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
index 8ecde41..68127ab 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
@@ -849,6 +849,21 @@
 			iommus = <&sysmmu_gscl2>;
 		};
 
+		jpeg: codec@15020000 {
+			compatible = "samsung,exynos5433-jpeg";
+			reg = <0x15020000 0x10000>;
+			interrupts = <GIC_SPI 411 0>;
+			clock-names = "pclk",
+				      "aclk",
+				      "aclk_xiu",
+				      "sclk";
+			clocks = <&cmu_mscl CLK_PCLK_JPEG>,
+				 <&cmu_mscl CLK_ACLK_JPEG>,
+				 <&cmu_mscl CLK_ACLK_XIU_MSCLX>,
+				 <&cmu_mscl CLK_SCLK_JPEG>;
+			iommus = <&sysmmu_jpeg>;
+		};
+
 		sysmmu_decon0x: sysmmu@0x13a00000 {
 			compatible = "samsung,exynos-sysmmu";
 			reg = <0x13a00000 0x1000>;
@@ -899,6 +914,16 @@
 			#iommu-cells = <0>;
 		};
 
+		sysmmu_jpeg: sysmmu@0x15060000 {
+			compatible = "samsung,exynos-sysmmu";
+			reg = <0x15060000 0x1000>;
+			interrupts = <GIC_SPI 408 0>;
+			clock-names = "pclk", "aclk";
+			clocks = <&cmu_mscl CLK_PCLK_SMMU_JPEG>,
+				 <&cmu_mscl CLK_ACLK_SMMU_JPEG>;
+			#iommu-cells = <0>;
+		};
+
 		serial_0: serial@14c10000 {
 			compatible = "samsung,exynos5433-uart";
 			reg = <0x14c10000 0x100>;
-- 
1.9.1
