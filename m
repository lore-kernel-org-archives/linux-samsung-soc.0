From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v2 RESEND 3/3] arm64: dts: exynos: TM2 - add support for MFC
 video codec device
Date: Fri, 18 Nov 2016 13:23:13 +0100
Message-ID: <1479471793-13021-4-git-send-email-m.szyprowski@samsung.com>
References: <1479471793-13021-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:37114 "EHLO
        mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751959AbcKRMXx (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 18 Nov 2016 07:23:53 -0500
Received: from epcpsbgm2new.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OGU030727RNEX80@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 18 Nov 2016 21:23:50 +0900 (KST)
In-reply-to: <1479471793-13021-1-git-send-email-m.szyprowski@samsung.com>
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
index 6f506dd..ce41781 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts
+++ b/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts
@@ -196,6 +196,11 @@
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
index 1d47480..64226d5 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
@@ -856,6 +856,18 @@
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
@@ -916,6 +928,26 @@
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
