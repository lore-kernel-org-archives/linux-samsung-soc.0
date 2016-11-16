From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 3/5] arm64: dts: exynos: Move FSYS CMU configuration from
 Exynos5433 dtsi to TM2 dts
Date: Wed, 16 Nov 2016 14:06:53 +0100
Message-ID: <1479301615-11240-4-git-send-email-m.szyprowski@samsung.com>
References: <1479301615-11240-1-git-send-email-m.szyprowski@samsung.com>
 <CGME20161116130708eucas1p15ac7edddb555cc2b55bb28142ce9656e@eucas1p1.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:26673 "EHLO
        mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752745AbcKPNHQ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 16 Nov 2016 08:07:16 -0500
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OGQ001IZKFXAI60@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 16 Nov 2016 13:07:09 +0000 (GMT)
In-reply-to: <1479301615-11240-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>

Move initial FSYS CMU (related to USB 3.0 devices) clocks configuration
from generic exynos5433.dtsi file to exynos5433-tm2.dts, as this is
a board specific item.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm64/boot/dts/exynos/exynos5433-tm2.dts | 13 +++++++++++++
 arch/arm64/boot/dts/exynos/exynos5433.dtsi    | 28 ---------------------------
 2 files changed, 13 insertions(+), 28 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts b/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts
index 9ea3f32..b7b2482 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts
+++ b/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts
@@ -892,6 +892,19 @@
 	status = "okay";
 };
 
+&cmu_fsys {
+	assigned-clocks = <&cmu_fsys CLK_MOUT_SCLK_USBDRD30_USER>,
+		<&cmu_top CLK_MOUT_SCLK_USBDRD30>,
+		<&cmu_fsys CLK_MOUT_PHYCLK_USBDRD30_UDRD30_PIPE_PCLK_USER>,
+		<&cmu_fsys CLK_MOUT_PHYCLK_USBDRD30_UDRD30_PHYCLOCK_USER>,
+		<&cmu_top CLK_DIV_SCLK_USBDRD30>;
+	assigned-clock-parents = <&cmu_top CLK_SCLK_USBDRD30_FSYS>,
+		<&cmu_top CLK_MOUT_BUS_PLL_USER>,
+		<&cmu_fsys CLK_PHYCLK_USBDRD30_UDRD30_PIPE_PCLK_PHY>,
+		<&cmu_fsys CLK_PHYCLK_USBDRD30_UDRD30_PHYCLOCK_PHY>;
+	assigned-clock-rates = <0>, <0>, <0>, <0>, <66700000>;
+};
+
 &spi_1 {
 	cs-gpios = <&gpd6 3 GPIO_ACTIVE_HIGH>;
 	status = "okay";
diff --git a/arch/arm64/boot/dts/exynos/exynos5433.dtsi b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
index a80eb4c..ab29352 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
@@ -1134,14 +1134,6 @@
 			clocks = <&cmu_fsys CLK_ACLK_USBDRD30>,
 				<&cmu_fsys CLK_SCLK_USBDRD30>;
 			clock-names = "usbdrd30", "usbdrd30_susp_clk";
-			assigned-clocks =
-				<&cmu_fsys CLK_MOUT_SCLK_USBDRD30_USER>,
-				<&cmu_top CLK_MOUT_SCLK_USBDRD30>,
-				<&cmu_top CLK_DIV_SCLK_USBDRD30>;
-			assigned-clock-parents =
-				<&cmu_top CLK_SCLK_USBDRD30_FSYS>,
-				<&cmu_top CLK_MOUT_BUS_PLL_USER>;
-			assigned-clock-rates = <0>, <0>, <66700000>;
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges;
@@ -1165,12 +1157,6 @@
 				<&cmu_fsys CLK_SCLK_USBDRD30>;
 			clock-names = "phy", "ref", "phy_utmi", "phy_pipe",
 					"itp";
-			assigned-clocks =
-				<&cmu_fsys CLK_MOUT_PHYCLK_USBDRD30_UDRD30_PIPE_PCLK_USER>,
-				<&cmu_fsys CLK_MOUT_PHYCLK_USBDRD30_UDRD30_PHYCLOCK_USER>;
-			assigned-clock-parents =
-				<&cmu_fsys CLK_PHYCLK_USBDRD30_UDRD30_PIPE_PCLK_PHY>,
-				<&cmu_fsys CLK_PHYCLK_USBDRD30_UDRD30_PHYCLOCK_PHY>;
 			#phy-cells = <1>;
 			samsung,pmu-syscon = <&pmu_system_controller>;
 			status = "disabled";
@@ -1185,12 +1171,6 @@
 				<&cmu_fsys CLK_SCLK_USBHOST30>;
 			clock-names = "phy", "ref", "phy_utmi", "phy_pipe",
 					"itp";
-			assigned-clocks =
-				<&cmu_fsys CLK_MOUT_PHYCLK_USBHOST30_UHOST30_PIPE_PCLK_USER>,
-				<&cmu_fsys CLK_MOUT_PHYCLK_USBHOST30_UHOST30_PHYCLOCK_USER>;
-			assigned-clock-parents =
-				<&cmu_fsys CLK_PHYCLK_USBHOST30_UHOST30_PIPE_PCLK_PHY>,
-				<&cmu_fsys CLK_PHYCLK_USBHOST30_UHOST30_PHYCLOCK_PHY>;
 			#phy-cells = <1>;
 			samsung,pmu-syscon = <&pmu_system_controller>;
 			status = "disabled";
@@ -1201,14 +1181,6 @@
 			clocks = <&cmu_fsys CLK_ACLK_USBHOST30>,
 				<&cmu_fsys CLK_SCLK_USBHOST30>;
 			clock-names = "usbdrd30", "usbdrd30_susp_clk";
-			assigned-clocks =
-				<&cmu_fsys CLK_MOUT_SCLK_USBHOST30_USER>,
-				<&cmu_top CLK_MOUT_SCLK_USBHOST30>,
-				<&cmu_top CLK_DIV_SCLK_USBHOST30>;
-			assigned-clock-parents =
-				<&cmu_top CLK_SCLK_USBHOST30_FSYS>,
-				<&cmu_top CLK_MOUT_BUS_PLL_USER>;
-			assigned-clock-rates = <0>, <0>, <66700000>;
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges;
-- 
1.9.1
