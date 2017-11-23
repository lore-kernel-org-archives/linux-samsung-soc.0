From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: [PATCH] ARM: dts: move G2D node to exynos5
Date: Thu, 23 Nov 2017 14:58:21 +0100
Message-ID: <20171123135821.29489-1-tjakobi@math.uni-bielefeld.de>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:36400 "EHLO
        smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1752785AbdKWN63 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 23 Nov 2017 08:58:29 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: m.szyprowski@samsung.com, devicetree@vger.kernel.org, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>

Current the node is only defined in the exynos5250 DT, while
the corresponding MMUs are also to be found in the exynos5420
DT. Move the node to exynos5 and only setup the MMUs in the
corresponding DT.

Disable the node by default, since exynos5410 also includes
the dtsi, but currently does not define the G2D clock.

Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
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
2.13.5
