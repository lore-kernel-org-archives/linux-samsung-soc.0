From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH RESEND] ARM: dts: exynos: Move G2D node to exynos5.dtsi
Date: Wed, 29 Nov 2017 12:42:34 +0100
Message-ID: <20171129114234.16132-1-m.szyprowski@samsung.com>
References: <CGME20171129114250eucas1p17b5a0213e7a486c85f72ef7a5d39f0d5@eucas1p1.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:41337 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751496AbdK2Lmy (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 29 Nov 2017 06:42:54 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>

From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>

Current the node is only defined in the exynos5250 DT, while
the corresponding SYSMMUs are also to be found in the exynos5420
DT. Move the node to exynos5 and only setup the SYSMMUs in the
corresponding DT.

Disable the node by default, since exynos5410 also includes
the dtsi, but currently does not define the G2D clock.

Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
[mszyprow: rephrased commit message]
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
resend on Krzysztof's request
---
 arch/arm/boot/dts/exynos5.dtsi    |  7 +++++++
 arch/arm/boot/dts/exynos5250.dtsi | 16 +++++++---------
 arch/arm/boot/dts/exynos5420.dtsi |  7 +++++++
 3 files changed, 21 insertions(+), 9 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5.dtsi b/arch/arm/boot/dts/exynos5.dtsi
index 66d22521c976..f3fec03a7595 100644
--- a/arch/arm/boot/dts/exynos5.dtsi
+++ b/arch/arm/boot/dts/exynos5.dtsi
@@ -204,5 +204,12 @@
 			#size-cells = <0>;
 			status = "disabled";
 		};
+
+		g2d: g2d@10850000 {
+			compatible = "samsung,exynos5250-g2d";
+			reg = <0x10850000 0x1000>;
+			interrupts = <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
 	};
 };
diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index 5286084e1032..b6a8a2ef499a 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -245,15 +245,6 @@
 			samsung,syscon-phandle = <&pmu_system_controller>;
 		};
 
-		g2d@10850000 {
-			compatible = "samsung,exynos5250-g2d";
-			reg = <0x10850000 0x1000>;
-			interrupts = <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&clock CLK_G2D>;
-			clock-names = "fimg2d";
-			iommus = <&sysmmu_g2d>;
-		};
-
 		mfc: codec@11000000 {
 			compatible = "samsung,mfc-v6";
 			reg = <0x11000000 0x10000>;
@@ -1024,6 +1015,13 @@
 	iommus = <&sysmmu_fimd1>;
 };
 
+&g2d {
+	iommus = <&sysmmu_g2d>;
+	clocks = <&clock CLK_G2D>;
+	clock-names = "fimg2d";
+	status = "okay";
+};
+
 &i2c_0 {
 	clocks = <&clock CLK_I2C0>;
 	clock-names = "i2c";
diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
index 8aa2cc7aa125..81447fffcc94 100644
--- a/arch/arm/boot/dts/exynos5420.dtsi
+++ b/arch/arm/boot/dts/exynos5420.dtsi
@@ -1349,6 +1349,13 @@
 	iommu-names = "m0", "m1";
 };
 
+&g2d {
+	iommus = <&sysmmu_g2dr>, <&sysmmu_g2dw>;
+	clocks = <&clock CLK_G2D>;
+	clock-names = "fimg2d";
+	status = "okay";
+};
+
 &i2c_0 {
 	clocks = <&clock CLK_I2C0>;
 	clock-names = "i2c";
-- 
2.15.0
