From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v2 3/3] arm64: dts: exynos: TM2 - add support for MFC video
 codec device
Date: Thu, 17 Nov 2016 10:01:57 +0100
Message-ID: <1479373317-11711-4-git-send-email-m.szyprowski@samsung.com>
References: <1479373317-11711-1-git-send-email-m.szyprowski@samsung.com>
 <CGME20161117090208eucas1p1f7351d61845d828038595ecc2ea73a28@eucas1p1.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:46198 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751518AbcKQJCM (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 17 Nov 2016 04:02:12 -0500
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OGS00A8H3RMUS80@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 17 Nov 2016 09:02:10 +0000 (GMT)
In-reply-to: <1479373317-11711-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>

This patch adds device nodes for MFC video codec device to Exynos5433 SoC
dtsi and proper initial clock configuration to TM2 dts.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm64/boot/dts/exynos/exynos5433-tm2.dts |  5 +++++
 arch/arm64/boot/dts/exynos/exynos5433.dtsi    | 32 +++++++++++++++++++++++++++
 2 files changed, 37 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts b/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts
index 16490e1e596f..235912dd823d 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts
+++ b/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts
@@ -203,6 +203,11 @@
 				 <&cmu_top CLK_ACLK_GSCL_333>;
 };
 
+&cmu_mfc {
+	assigned-clocks = <&cmu_mfc CLK_MOUT_ACLK_MFC_400_USER>;
+	assigned-clock-parents = <&cmu_top CLK_ACLK_MFC_400>;
+};
+
 &cmu_mscl {
 	assigned-clocks = <&cmu_mscl CLK_MOUT_ACLK_MSCL_400_USER>,
 			  <&cmu_mscl CLK_MOUT_SCLK_JPEG_USER>,
diff --git a/arch/arm64/boot/dts/exynos/exynos5433.dtsi b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
index 4660c8576a33..2a575af9e63e 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
@@ -849,6 +849,18 @@
 			iommus = <&sysmmu_jpeg>;
 		};
 
+		mfc: codec@152E0000 {
+			compatible = "samsung,exynos5433-mfc";
+			reg = <0x152E0000 0x10000>;
+			interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
+			clock-names = "pclk", "aclk", "aclk_xiu";
+			clocks = <&cmu_mfc CLK_PCLK_MFC>,
+				 <&cmu_mfc CLK_ACLK_MFC>,
+				 <&cmu_mfc CLK_ACLK_XIU_MFCX>;
+			iommus = <&sysmmu_mfc_0>, <&sysmmu_mfc_1>;
+			iommu-names = "left", "right";
+		};
+
 		sysmmu_decon0x: sysmmu@0x13a00000 {
 			compatible = "samsung,exynos-sysmmu";
 			reg = <0x13a00000 0x1000>;
@@ -909,6 +921,26 @@
 			#iommu-cells = <0>;
 		};
 
+		sysmmu_mfc_0: sysmmu@0x15200000 {
+			compatible = "samsung,exynos-sysmmu";
+			reg = <0x15200000 0x1000>;
+			interrupts = <GIC_SPI 352 IRQ_TYPE_LEVEL_HIGH>;
+			clock-names = "pclk", "aclk";
+			clocks = <&cmu_mfc CLK_PCLK_SMMU_MFC_0>,
+				 <&cmu_mfc CLK_ACLK_SMMU_MFC_0>;
+			#iommu-cells = <0>;
+		};
+
+		sysmmu_mfc_1: sysmmu@0x15210000 {
+			compatible = "samsung,exynos-sysmmu";
+			reg = <0x15210000 0x1000>;
+			interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>;
+			clock-names = "pclk", "aclk";
+			clocks = <&cmu_mfc CLK_PCLK_SMMU_MFC_1>,
+				 <&cmu_mfc CLK_ACLK_SMMU_MFC_1>;
+			#iommu-cells = <0>;
+		};
+
 		serial_0: serial@14c10000 {
 			compatible = "samsung,exynos5433-uart";
 			reg = <0x14c10000 0x100>;
-- 
1.9.1
