From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH] ARM: dts: Specify default clocks for Exynos4 camera devices
Date: Thu, 20 Nov 2014 17:14:59 +0100
Message-ID: <1416500099-19656-1-git-send-email-s.nawrocki@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:31451 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755212AbaKTQPN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 20 Nov 2014 11:15:13 -0500
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0NFC00D6TIHBL600@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 21 Nov 2014 01:15:11 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene@kernel.org
Cc: drake@endlessm.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com, Sylwester Nawrocki <s.nawrocki@samsung.com>

Specify the default mux and divider clocks in device tree
to ensure the FIMC devices on Trats, Trats2, Universal_c210
and Odroid X2/U3 boards are clocked from recommended clock
source and with maximum supported frequency.
For Trats2 also the MIPI-CSIS and the camera sensor clocks
are configured, the 'clock-frequency' property is deprecated
in favour of 'assigned-clock-rates' property.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 arch/arm/boot/dts/exynos4210-trats.dts          |   16 ++++++++++++
 arch/arm/boot/dts/exynos4210-universal_c210.dts |   16 ++++++++++++
 arch/arm/boot/dts/exynos4412-odroid-common.dtsi |   16 ++++++++++++
 arch/arm/boot/dts/exynos4412-trats2.dts         |   32 ++++++++++++++++++++---
 4 files changed, 77 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4210-trats.dts b/arch/arm/boot/dts/exynos4210-trats.dts
index f516da9..7208362 100644
--- a/arch/arm/boot/dts/exynos4210-trats.dts
+++ b/arch/arm/boot/dts/exynos4210-trats.dts
@@ -431,18 +431,34 @@
 
 		fimc_0: fimc@11800000 {
 			status = "okay";
+			assigned-clocks = <&clock CLK_MOUT_FIMC0>,
+					<&clock CLK_SCLK_FIMC0>;
+			assigned-clock-parents = <&clock CLK_SCLK_MPLL>;
+			assigned-clock-rates = <0>, <160000000>;
 		};
 
 		fimc_1: fimc@11810000 {
 			status = "okay";
+			assigned-clocks = <&clock CLK_MOUT_FIMC1>,
+					<&clock CLK_SCLK_FIMC1>;
+			assigned-clock-parents = <&clock CLK_SCLK_MPLL>;
+			assigned-clock-rates = <0>, <160000000>;
 		};
 
 		fimc_2: fimc@11820000 {
 			status = "okay";
+			assigned-clocks = <&clock CLK_MOUT_FIMC2>,
+					<&clock CLK_SCLK_FIMC2>;
+			assigned-clock-parents = <&clock CLK_SCLK_MPLL>;
+			assigned-clock-rates = <0>, <160000000>;
 		};
 
 		fimc_3: fimc@11830000 {
 			status = "okay";
+			assigned-clocks = <&clock CLK_MOUT_FIMC3>,
+					<&clock CLK_SCLK_FIMC3>;
+			assigned-clock-parents = <&clock CLK_SCLK_MPLL>;
+			assigned-clock-rates = <0>, <160000000>;
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/exynos4210-universal_c210.dts b/arch/arm/boot/dts/exynos4210-universal_c210.dts
index d50eb3a..aaf0cae 100644
--- a/arch/arm/boot/dts/exynos4210-universal_c210.dts
+++ b/arch/arm/boot/dts/exynos4210-universal_c210.dts
@@ -473,18 +473,34 @@
 
 		fimc_0: fimc@11800000 {
 			status = "okay";
+			assigned-clocks = <&clock CLK_MOUT_FIMC0>,
+					<&clock CLK_SCLK_FIMC0>;
+			assigned-clock-parents = <&clock CLK_SCLK_MPLL>;
+			assigned-clock-rates = <0>, <160000000>;
 		};
 
 		fimc_1: fimc@11810000 {
 			status = "okay";
+			assigned-clocks = <&clock CLK_MOUT_FIMC1>,
+					<&clock CLK_SCLK_FIMC1>;
+			assigned-clock-parents = <&clock CLK_SCLK_MPLL>;
+			assigned-clock-rates = <0>, <160000000>;
 		};
 
 		fimc_2: fimc@11820000 {
 			status = "okay";
+			assigned-clocks = <&clock CLK_MOUT_FIMC2>,
+					<&clock CLK_SCLK_FIMC2>;
+			assigned-clock-parents = <&clock CLK_SCLK_MPLL>;
+			assigned-clock-rates = <0>, <160000000>;
 		};
 
 		fimc_3: fimc@11830000 {
 			status = "okay";
+			assigned-clocks = <&clock CLK_MOUT_FIMC3>,
+					<&clock CLK_SCLK_FIMC3>;
+			assigned-clock-parents = <&clock CLK_SCLK_MPLL>;
+			assigned-clock-rates = <0>, <160000000>;
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/exynos4412-odroid-common.dtsi b/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
index c697ff0..adf1331 100644
--- a/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
+++ b/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
@@ -82,18 +82,34 @@
 
 		fimc_0: fimc@11800000 {
 			status = "okay";
+			assigned-clocks = <&clock CLK_MOUT_FIMC0>,
+					<&clock CLK_SCLK_FIMC0>;
+			assigned-clock-parents = <&clock CLK_MOUT_MPLL_USER_T>;
+			assigned-clock-rates = <0>, <176000000>;
 		};
 
 		fimc_1: fimc@11810000 {
 			status = "okay";
+			assigned-clocks = <&clock CLK_MOUT_FIMC1>,
+					<&clock CLK_SCLK_FIMC1>;
+			assigned-clock-parents = <&clock CLK_MOUT_MPLL_USER_T>;
+			assigned-clock-rates = <0>, <176000000>;
 		};
 
 		fimc_2: fimc@11820000 {
 			status = "okay";
+			assigned-clocks = <&clock CLK_MOUT_FIMC2>,
+					<&clock CLK_SCLK_FIMC2>;
+			assigned-clock-parents = <&clock CLK_MOUT_MPLL_USER_T>;
+			assigned-clock-rates = <0>, <176000000>;
 		};
 
 		fimc_3: fimc@11830000 {
 			status = "okay";
+			assigned-clocks = <&clock CLK_MOUT_FIMC3>,
+					<&clock CLK_SCLK_FIMC3>;
+			assigned-clock-parents = <&clock CLK_MOUT_MPLL_USER_T>;
+			assigned-clock-rates = <0>, <176000000>;
 		};
 	};
 
diff --git a/arch/arm/boot/dts/exynos4412-trats2.dts b/arch/arm/boot/dts/exynos4412-trats2.dts
index 8ee20bd..08bc948 100644
--- a/arch/arm/boot/dts/exynos4412-trats2.dts
+++ b/arch/arm/boot/dts/exynos4412-trats2.dts
@@ -701,28 +701,51 @@
 		pinctrl-0 = <&cam_port_a_clk_active &cam_port_b_clk_active>;
 		pinctrl-names = "default";
 		status = "okay";
+		assigned-clocks = <&clock CLK_MOUT_CAM0>,
+				  <&clock CLK_MOUT_CAM1>;
+		assigned-clock-parents = <&clock CLK_MOUT_MPLL_USER_T>,
+				         <&clock CLK_MOUT_MPLL_USER_T>;
 
 		fimc_0: fimc@11800000 {
 			status = "okay";
+			assigned-clocks = <&clock CLK_MOUT_FIMC0>,
+					<&clock CLK_SCLK_FIMC0>;
+			assigned-clock-parents = <&clock CLK_MOUT_MPLL_USER_T>;
+			assigned-clock-rates = <0>, <176000000>;
 		};
 
 		fimc_1: fimc@11810000 {
 			status = "okay";
+			assigned-clocks = <&clock CLK_MOUT_FIMC1>,
+					<&clock CLK_SCLK_FIMC1>;
+			assigned-clock-parents = <&clock CLK_MOUT_MPLL_USER_T>;
+			assigned-clock-rates = <0>, <176000000>;
 		};
 
 		fimc_2: fimc@11820000 {
 			status = "okay";
+			assigned-clocks = <&clock CLK_MOUT_FIMC2>,
+					<&clock CLK_SCLK_FIMC2>;
+			assigned-clock-parents = <&clock CLK_MOUT_MPLL_USER_T>;
+			assigned-clock-rates = <0>, <176000000>;
 		};
 
 		fimc_3: fimc@11830000 {
 			status = "okay";
+			assigned-clocks = <&clock CLK_MOUT_FIMC3>,
+					<&clock CLK_SCLK_FIMC3>;
+			assigned-clock-parents = <&clock CLK_MOUT_MPLL_USER_T>;
+			assigned-clock-rates = <0>, <176000000>;
 		};
 
 		csis_0: csis@11880000 {
 			status = "okay";
 			vddcore-supply = <&ldo8_reg>;
 			vddio-supply = <&ldo10_reg>;
-			clock-frequency = <176000000>;
+			assigned-clocks = <&clock CLK_MOUT_CSIS0>,
+					<&clock CLK_SCLK_CSIS0>;
+			assigned-clock-parents = <&clock CLK_MOUT_MPLL_USER_T>;
+			assigned-clock-rates = <0>, <176000000>;
 
 			/* Camera C (3) MIPI CSI-2 (CSIS0) */
 			port@3 {
@@ -736,10 +759,13 @@
 		};
 
 		csis_1: csis@11890000 {
+			status = "okay";
 			vddcore-supply = <&ldo8_reg>;
 			vddio-supply = <&ldo10_reg>;
-			clock-frequency = <160000000>;
-			status = "okay";
+			assigned-clocks = <&clock CLK_MOUT_CSIS1>,
+					<&clock CLK_SCLK_CSIS1>;
+			assigned-clock-parents = <&clock CLK_MOUT_MPLL_USER_T>;
+			assigned-clock-rates = <0>, <176000000>;
 
 			/* Camera D (4) MIPI CSI-2 (CSIS1) */
 			port@4 {
-- 
1.7.9.5
