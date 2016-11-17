From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v2 2/3] arm64: dts: exynos: TM2 - add support for JPEG codec
 device
Date: Thu, 17 Nov 2016 10:01:56 +0100
Message-ID: <1479373317-11711-3-git-send-email-m.szyprowski@samsung.com>
References: <1479373317-11711-1-git-send-email-m.szyprowski@samsung.com>
 <CGME20161117090208eucas1p1401ba825691a38a47b50870c2c58f76a@eucas1p1.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:45431 "EHLO
        mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751741AbcKQJCN (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 17 Nov 2016 04:02:13 -0500
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OGS00AES3RLFX80@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 17 Nov 2016 09:02:09 +0000 (GMT)
In-reply-to: <1479373317-11711-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>

This patch adds device nodes for JPEG codec device to Exynos5433 SoC dtsi
and proper initial clock configuration to TM2 dts.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm64/boot/dts/exynos/exynos5433-tm2.dts | 11 +++++++++++
 arch/arm64/boot/dts/exynos/exynos5433.dtsi    | 22 ++++++++++++++++++++++
 2 files changed, 33 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts b/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts
index 15436d30268f..16490e1e596f 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts
+++ b/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts
@@ -203,6 +203,17 @@
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
 &cpu0 {
 	cpu-supply = <&buck3_reg>;
 };
diff --git a/arch/arm64/boot/dts/exynos/exynos5433.dtsi b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
index 956096f9d2e6..4660c8576a33 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
@@ -837,6 +837,18 @@
 			iommus = <&sysmmu_gscl2>;
 		};
 
+		jpeg: codec@15020000 {
+			compatible = "samsung,exynos5433-jpeg";
+			reg = <0x15020000 0x10000>;
+			interrupts = <GIC_SPI 411 IRQ_TYPE_LEVEL_HIGH>;
+			clock-names = "pclk", "aclk", "aclk_xiu", "sclk";
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
@@ -887,6 +899,16 @@
 			#iommu-cells = <0>;
 		};
 
+		sysmmu_jpeg: sysmmu@0x15060000 {
+			compatible = "samsung,exynos-sysmmu";
+			reg = <0x15060000 0x1000>;
+			interrupts = <GIC_SPI 408 IRQ_TYPE_LEVEL_HIGH>;
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
