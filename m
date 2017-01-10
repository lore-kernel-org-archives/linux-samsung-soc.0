From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH] arm64: dts: exynos5433: fix addresses in node names
Date: Tue, 10 Jan 2017 10:30:48 +0100
Message-ID: <1484040648-23763-1-git-send-email-a.hajda@samsung.com>
References: <CGME20170110093054eucas1p1bb74f8494dd6cece0debfabfc8ec34ca@eucas1p1.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:58595 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1759167AbdAJJa6 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 10 Jan 2017 04:30:58 -0500
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OJK00IP753EHY80@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 10 Jan 2017 09:30:55 +0000 (GMT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Andrzej Hajda <a.hajda@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Javier Martinez Canillas <javier@osg.samsung.com>

Address should not contain 0x prefix.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 arch/arm64/boot/dts/exynos/exynos5433.dtsi | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos5433.dtsi b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
index 441270f..aacd5f7 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
@@ -299,7 +299,7 @@
 			#clock-cells = <1>;
 		};
 
-		cmu_peris: clock-controller@0x10040000 {
+		cmu_peris: clock-controller@10040000 {
 			compatible = "samsung,exynos5433-cmu-peris";
 			reg = <0x10040000 0x1000>;
 			#clock-cells = <1>;
@@ -944,7 +944,7 @@
 			iommu-names = "left", "right";
 		};
 
-		sysmmu_decon0x: sysmmu@0x13a00000 {
+		sysmmu_decon0x: sysmmu@13a00000 {
 			compatible = "samsung,exynos-sysmmu";
 			reg = <0x13a00000 0x1000>;
 			interrupts = <GIC_SPI 192 IRQ_TYPE_LEVEL_HIGH>;
@@ -954,7 +954,7 @@
 			#iommu-cells = <0>;
 		};
 
-		sysmmu_decon1x: sysmmu@0x13a10000 {
+		sysmmu_decon1x: sysmmu@13a10000 {
 			compatible = "samsung,exynos-sysmmu";
 			reg = <0x13a10000 0x1000>;
 			interrupts = <GIC_SPI 194 IRQ_TYPE_LEVEL_HIGH>;
@@ -984,7 +984,7 @@
 			#iommu-cells = <0>;
 		};
 
-		sysmmu_gscl0: sysmmu@0x13C80000 {
+		sysmmu_gscl0: sysmmu@13c80000 {
 			compatible = "samsung,exynos-sysmmu";
 			reg = <0x13C80000 0x1000>;
 			interrupts = <GIC_SPI 288 IRQ_TYPE_LEVEL_HIGH>;
@@ -994,7 +994,7 @@
 			#iommu-cells = <0>;
 		};
 
-		sysmmu_gscl1: sysmmu@0x13C90000 {
+		sysmmu_gscl1: sysmmu@13c90000 {
 			compatible = "samsung,exynos-sysmmu";
 			reg = <0x13C90000 0x1000>;
 			interrupts = <GIC_SPI 290 IRQ_TYPE_LEVEL_HIGH>;
@@ -1004,7 +1004,7 @@
 			#iommu-cells = <0>;
 		};
 
-		sysmmu_gscl2: sysmmu@0x13CA0000 {
+		sysmmu_gscl2: sysmmu@13ca0000 {
 			compatible = "samsung,exynos-sysmmu";
 			reg = <0x13CA0000 0x1000>;
 			interrupts = <GIC_SPI 292 IRQ_TYPE_LEVEL_HIGH>;
@@ -1014,7 +1014,7 @@
 			#iommu-cells = <0>;
 		};
 
-		sysmmu_jpeg: sysmmu@0x15060000 {
+		sysmmu_jpeg: sysmmu@15060000 {
 			compatible = "samsung,exynos-sysmmu";
 			reg = <0x15060000 0x1000>;
 			interrupts = <GIC_SPI 408 IRQ_TYPE_LEVEL_HIGH>;
@@ -1024,7 +1024,7 @@
 			#iommu-cells = <0>;
 		};
 
-		sysmmu_mfc_0: sysmmu@0x15200000 {
+		sysmmu_mfc_0: sysmmu@15200000 {
 			compatible = "samsung,exynos-sysmmu";
 			reg = <0x15200000 0x1000>;
 			interrupts = <GIC_SPI 352 IRQ_TYPE_LEVEL_HIGH>;
@@ -1034,7 +1034,7 @@
 			#iommu-cells = <0>;
 		};
 
-		sysmmu_mfc_1: sysmmu@0x15210000 {
+		sysmmu_mfc_1: sysmmu@15210000 {
 			compatible = "samsung,exynos-sysmmu";
 			reg = <0x15210000 0x1000>;
 			interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.7.4
