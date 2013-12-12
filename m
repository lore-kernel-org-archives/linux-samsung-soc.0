From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH 2/3] ARM: dts: exynos4x12: Fix definition of MSHC device tree
 nodes
Date: Thu, 12 Dec 2013 17:18:02 +0100
Message-ID: <1386865083-20082-3-git-send-email-t.figa@samsung.com>
References: <1386865083-20082-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:52058 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751564Ab3LLQS3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 12 Dec 2013 11:18:29 -0500
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MXP007NTBYR7U60@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 12 Dec 2013 16:18:27 +0000 (GMT)
In-reply-to: <1386865083-20082-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Stephen Warren <swarren@wwwdotorg.org>, Kukjin Kim <kgene.kim@samsung.com>, Mike Turquette <mturquette@linaro.org>, Tomasz Figa <t.figa@samsung.com>

All SoCs from Exynos4x12 series contain the MSHC block, so its node can
be located in exynos4x12.dtsi. In addition, missing clock specifiers
are added, generic SoC attributes are moved from board dts files
to common dtsi file of SoC family and the node is renamed to a more
generic name to follow node naming recommendations.

Signed-off-by: Tomasz Figa <t.figa@samsung.com>
Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/boot/dts/exynos4412-odroidx.dts |  5 +----
 arch/arm/boot/dts/exynos4412-origen.dts  |  5 +----
 arch/arm/boot/dts/exynos4412.dtsi        |  8 --------
 arch/arm/boot/dts/exynos4x12.dtsi        | 13 +++++++++++++
 4 files changed, 15 insertions(+), 16 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4412-odroidx.dts b/arch/arm/boot/dts/exynos4412-odroidx.dts
index 46c678e..8aad5f7 100644
--- a/arch/arm/boot/dts/exynos4412-odroidx.dts
+++ b/arch/arm/boot/dts/exynos4412-odroidx.dts
@@ -38,9 +38,7 @@
 		};
 	};
 
-	mshc@12550000 {
-		#address-cells = <1>;
-		#size-cells = <0>;
+	mmc@12550000 {
 		pinctrl-0 = <&sd4_clk &sd4_cmd &sd4_bus4 &sd4_bus8>;
 		pinctrl-names = "default";
 		vmmc-supply = <&ldo20_reg &buck8_reg>;
@@ -49,7 +47,6 @@
 		num-slots = <1>;
 		supports-highspeed;
 		broken-cd;
-		fifo-depth = <0x80>;
 		card-detect-delay = <200>;
 		samsung,dw-mshc-ciu-div = <3>;
 		samsung,dw-mshc-sdr-timing = <2 3>;
diff --git a/arch/arm/boot/dts/exynos4412-origen.dts b/arch/arm/boot/dts/exynos4412-origen.dts
index d65984c..0fe0161 100644
--- a/arch/arm/boot/dts/exynos4412-origen.dts
+++ b/arch/arm/boot/dts/exynos4412-origen.dts
@@ -122,9 +122,7 @@
 		status = "okay";
 	};
 
-	mshc@12550000 {
-		#address-cells = <1>;
-		#size-cells = <0>;
+	mmc@12550000 {
 		pinctrl-0 = <&sd4_clk &sd4_cmd &sd4_bus4 &sd4_bus8>;
 		pinctrl-names = "default";
 		status = "okay";
@@ -132,7 +130,6 @@
 		num-slots = <1>;
 		supports-highspeed;
 		broken-cd;
-		fifo-depth = <0x80>;
 		card-detect-delay = <200>;
 		samsung,dw-mshc-ciu-div = <3>;
 		samsung,dw-mshc-sdr-timing = <2 3>;
diff --git a/arch/arm/boot/dts/exynos4412.dtsi b/arch/arm/boot/dts/exynos4412.dtsi
index e743e67..7a0c871 100644
--- a/arch/arm/boot/dts/exynos4412.dtsi
+++ b/arch/arm/boot/dts/exynos4412.dtsi
@@ -34,7 +34,6 @@
 			     <0 12 0>, <0 13 0>, <0 14 0>, <0 15 0>,
 			     <0 107 0>, <0 108 0>, <0 48 0>, <0 42 0>;
 	};
-
 	mct@10050000 {
 		compatible = "samsung,exynos4412-mct";
 		reg = <0x10050000 0x800>;
@@ -61,11 +60,4 @@
 		};
 	};
 
-	mshc@12550000 {
-		compatible = "samsung,exynos4412-dw-mshc";
-		reg = <0x12550000 0x1000>;
-		interrupts = <0 77 0>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-	};
 };
diff --git a/arch/arm/boot/dts/exynos4x12.dtsi b/arch/arm/boot/dts/exynos4x12.dtsi
index ad531fe..1917c82 100644
--- a/arch/arm/boot/dts/exynos4x12.dtsi
+++ b/arch/arm/boot/dts/exynos4x12.dtsi
@@ -28,6 +28,7 @@
 		pinctrl3 = &pinctrl_3;
 		fimc-lite0 = &fimc_lite_0;
 		fimc-lite1 = &fimc_lite_1;
+		mshc0 = &mshc_0;
 	};
 
 	pd_isp: isp-power-domain@10023CA0 {
@@ -176,4 +177,16 @@
 			};
 		};
 	};
+
+	mshc_0: mmc@12550000 {
+		compatible = "samsung,exynos4412-dw-mshc";
+		reg = <0x12550000 0x1000>;
+		interrupts = <0 77 0>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		fifo-depth = <0x80>;
+		clocks = <&clock 301>, <&clock 149>;
+		clock-names = "biu", "ciu";
+		status = "disabled";
+	};
 };
-- 
1.8.4.3
