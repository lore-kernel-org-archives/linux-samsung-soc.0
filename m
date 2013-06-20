From: Sunil Joshi <joshi@samsung.com>
Subject: [PATCH] ARM: dts: Add device tree support for dwmmc
Date: Thu, 20 Jun 2013 12:06:28 +0530
Message-ID: <1371710188-22885-1-git-send-email-joshi@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:9368 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751175Ab3FTGMw (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 20 Jun 2013 02:12:52 -0400
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MOO00AJZH9FK6P0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 20 Jun 2013 15:12:51 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
Cc: kgene.kim@samsung.com, alim.akhtar@samsung.com, prathyush.k@samsung.com, arun.kk@samsung.com

From: Alim Akhtar <alim.akhtar@samsung.com>

This patch adds alias names, device tree nodes for
dw-mmc controller for exynos5420 soc.

Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
Signed-off-by: Prathyush K <prathyush.k@samsung.com>
Signed-off-by: Arun Kumar K <arun.kk@samsung.com>
Signed-off-by: Sunil Joshi <joshi@samsung.com>
---
 .../devicetree/bindings/mmc/exynos-dw-mshc.txt     |    2 +-
 arch/arm/boot/dts/exynos5.dtsi                     |    3 ++
 arch/arm/boot/dts/exynos5420-smdk5420.dts          |   38 ++++++++++++++++++++
 arch/arm/boot/dts/exynos5420.dtsi                  |   21 +++++++++++
 4 files changed, 63 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mmc/exynos-dw-mshc.txt b/Documentation/devicetree/bindings/mmc/exynos-dw-mshc.txt
index 6d1c098..c48570e 100644
--- a/Documentation/devicetree/bindings/mmc/exynos-dw-mshc.txt
+++ b/Documentation/devicetree/bindings/mmc/exynos-dw-mshc.txt
@@ -15,7 +15,7 @@ Required Properties:
 	- "samsung,exynos4412-dw-mshc": for controllers with Samsung Exynos4412
 	  specific extensions.
 	- "samsung,exynos5250-dw-mshc": for controllers with Samsung Exynos5250
-	  specific extensions.
+	  and Exynos5420 specific extensions.
 
 * samsung,dw-mshc-ciu-div: Specifies the divider value for the card interface
   unit (ciu) clock. This property is applicable only for Exynos5 SoC's and
diff --git a/arch/arm/boot/dts/exynos5.dtsi b/arch/arm/boot/dts/exynos5.dtsi
index f65e124..6cb6f03 100644
--- a/arch/arm/boot/dts/exynos5.dtsi
+++ b/arch/arm/boot/dts/exynos5.dtsi
@@ -55,6 +55,7 @@
 		interrupts = <0 75 0>;
 		#address-cells = <1>;
 		#size-cells = <0>;
+		status = "disabled";
 	};
 
 	dwmmc_1: dwmmc1@12210000 {
@@ -62,6 +63,7 @@
 		interrupts = <0 76 0>;
 		#address-cells = <1>;
 		#size-cells = <0>;
+		status = "disabled";
 	};
 
 	dwmmc_2: dwmmc2@12220000 {
@@ -69,6 +71,7 @@
 		interrupts = <0 77 0>;
 		#address-cells = <1>;
 		#size-cells = <0>;
+		status = "disabled";
 	};
 
 	serial@12C00000 {
diff --git a/arch/arm/boot/dts/exynos5420-smdk5420.dts b/arch/arm/boot/dts/exynos5420-smdk5420.dts
index 08607df..d05de7a 100644
--- a/arch/arm/boot/dts/exynos5420-smdk5420.dts
+++ b/arch/arm/boot/dts/exynos5420-smdk5420.dts
@@ -30,4 +30,42 @@
 			clock-frequency = <24000000>;
 		};
 	};
+
+	dwmmc0@12200000 {
+		status = "okay";
+		num-slots = <1>;
+		broken-cd;
+		bypass-smu;
+		supports-highspeed;
+		fifo-depth = <0x40>;
+		card-detect-delay = <200>;
+		samsung,dw-mshc-ciu-div = <3>;
+		samsung,dw-mshc-sdr-timing = <0 4>;
+		samsung,dw-mshc-ddr-timing = <0 2>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&sd0_clk &sd0_cmd &sd0_bus4 &sd0_bus8>;
+
+		slot@0 {
+			reg = <0>;
+			bus-width = <8>;
+		};
+	};
+
+	dwmmc2@12220000 {
+		status = "okay";
+		num-slots = <1>;
+		supports-highspeed;
+		fifo-depth = <0x40>;
+		card-detect-delay = <200>;
+		samsung,dw-mshc-ciu-div = <3>;
+		samsung,dw-mshc-sdr-timing = <2 3>;
+		samsung,dw-mshc-ddr-timing = <1 2>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&sd2_clk &sd2_cmd &sd2_cd &sd2_bus4>;
+
+		slot@0 {
+			reg = <0>;
+			bus-width = <4>;
+		};
+	};
 };
diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
index 8c54c4b..0736994 100644
--- a/arch/arm/boot/dts/exynos5420.dtsi
+++ b/arch/arm/boot/dts/exynos5420.dtsi
@@ -24,6 +24,9 @@
 		pinctrl2 = &pinctrl_2;
 		pinctrl3 = &pinctrl_3;
 		pinctrl4 = &pinctrl_4;
+		mshc0 = &dwmmc_0;
+		mshc1 = &dwmmc_1;
+		mshc2 = &dwmmc_2;
 	};
 
 	cpus {
@@ -145,4 +148,22 @@
 		clocks = <&clock 260>, <&clock 131>;
 		clock-names = "uart", "clk_uart_baud0";
 	};
+
+	dwmmc_0: dwmmc0@12200000 {
+		reg = <0x12200000 0x2000>;
+		clocks = <&clock 351>, <&clock 132>;
+		clock-names = "biu", "ciu";
+	};
+
+	dwmmc_1: dwmmc1@12210000 {
+		reg = <0x12210000 0x2000>;
+		clocks = <&clock 352>, <&clock 133>;
+		clock-names = "biu", "ciu";
+	};
+
+	dwmmc_2: dwmmc2@12220000 {
+		reg = <0x12220000 0x2000>;
+		clocks = <&clock 353>, <&clock 134>;
+		clock-names = "biu", "ciu";
+	};
 };
-- 
1.7.9.5
