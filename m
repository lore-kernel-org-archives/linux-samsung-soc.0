From: Yuvaraj Kumar C D <yuvaraj.cd@gmail.com>
Subject: [PATCH] ARM: dts: update binding document exynos-dw-mshc.txt
Date: Thu, 29 Aug 2013 17:23:57 +0530
Message-ID: <1377777238-25087-1-git-send-email-yuvaraj.cd@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f41.google.com ([209.85.220.41]:55343 "EHLO
	mail-pa0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752608Ab3H2LyM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 29 Aug 2013 07:54:12 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, devicetree@vger.kernel.org
Cc: rob.herring@calxeda.com, pawel.moll@arm.com, mark.rutland@arm.com, swarren@wwwdotorg.org, ian.campbell@citrix.com, t.figa@samsung.com, dianders@chromium.org, cjb@laptop.org, thomas.abraham@linaro.org, ks.giri@samsung.com, Yuvaraj Kumar C D <yuvaraj.cd@samsung.com>

This patch updates the exynos-dw-mshc.txt.Currently we are using
"pinctrl" binding property to describe the CMD and DATA line's
of Mobile Storage Host Controller(mshc) node.

Signed-off-by: Yuvaraj Kumar C D <yuvaraj.cd@samsung.com>
---
 .../devicetree/bindings/mmc/exynos-dw-mshc.txt     |   34 ++++++++++----------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/Documentation/devicetree/bindings/mmc/exynos-dw-mshc.txt b/Documentation/devicetree/bindings/mmc/exynos-dw-mshc.txt
index 84cd56f..646a902 100644
--- a/Documentation/devicetree/bindings/mmc/exynos-dw-mshc.txt
+++ b/Documentation/devicetree/bindings/mmc/exynos-dw-mshc.txt
@@ -7,9 +7,9 @@ differences between the core Synopsis dw mshc controller properties described
 by synopsis-dw-mshc.txt and the properties used by the Samsung Exynos specific
 extensions to the Synopsis Designware Mobile Storage Host Controller.
 
-Required Properties:
+Required SoC Specific Properties:
 
-* compatible: should be
+* compatible: should be one of the following
 	- "samsung,exynos4210-dw-mshc": for controllers with Samsung Exynos4210
 	  specific extensions.
 	- "samsung,exynos4412-dw-mshc": for controllers with Samsung Exynos4412
@@ -19,6 +19,8 @@ Required Properties:
 	- "samsung,exynos5420-dw-mshc": for controllers with Samsung Exynos5420
 	  specific extensions.
 
+Required Board Specific Properties:
+
 * samsung,dw-mshc-ciu-div: Specifies the divider value for the card interface
   unit (ciu) clock. This property is applicable only for Exynos5 SoC's and
   ignored for Exynos4 SoC's. The valid range of divider value is 0 to 7.
@@ -46,44 +48,42 @@ Required Properties:
       - if CIU clock divider value is 0 (that is divide by 1), both tx and rx
         phase shift clocks should be 0.
 
-Required properties for a slot:
-
-* gpios: specifies a list of gpios used for command, clock and data bus. The
-  first gpio is the command line and the second gpio is the clock line. The
-  rest of the gpios (depending on the bus-width property) are the data lines in
-  no particular order. The format of the gpio specifier depends on the gpio
-  controller.
+* pinctrl-0: Should specify pin control groups used for this controller.
+* pinctrl-names: Should contain only one value - "default".
 
+Required properties for a slot:
+	Refer synopsis-dw-mshc.txt
 Example:
 
   The MSHC controller node can be split into two portions, SoC specific and
   board specific portions as listed below.
 
-	dwmmc0@12200000 {
+	mshc@12200000 {
 		compatible = "samsung,exynos5250-dw-mshc";
 		reg = <0x12200000 0x1000>;
 		interrupts = <0 75 0>;
 		#address-cells = <1>;
 		#size-cells = <0>;
+		clocks = <&clock 351>, <&clock 132>;
+		clock-names = "biu", "ciu";
+		fifo-depth = <0x80>;
+		status = "disabled";
 	};
 
-	dwmmc0@12200000 {
+	mshc@12200000 {
+		status = "okay";
 		num-slots = <1>;
 		supports-highspeed;
 		broken-cd;
-		fifo-depth = <0x80>;
 		card-detect-delay = <200>;
 		samsung,dw-mshc-ciu-div = <3>;
 		samsung,dw-mshc-sdr-timing = <2 3>;
 		samsung,dw-mshc-ddr-timing = <1 2>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&sd0_clk &sd0_cmd &sd0_bus4 &sd0_bus8>;
 
 		slot@0 {
 			reg = <0>;
 			bus-width = <8>;
-			gpios = <&gpc0 0 2 0 3>, <&gpc0 1 2 0 3>,
-				<&gpc1 0 2 3 3>, <&gpc1 1 2 3 3>,
-				<&gpc1 2 2 3 3>, <&gpc1 3 2 3 3>,
-				<&gpc0 3 2 3 3>, <&gpc0 4 2 3 3>,
-				<&gpc0 5 2 3 3>, <&gpc0 6 2 3 3>;
 		};
 	};
-- 
1.7.9.5
