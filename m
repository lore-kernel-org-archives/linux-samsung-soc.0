From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v2 1/2] ARM: dts: exynos: Correct clocks for Exynos4 I2S module
Date: Fri, 09 Dec 2016 08:22:10 +0100
Message-ID: <1481268131-1264-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:44261 "EHLO
        mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751983AbcLIHWe (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 9 Dec 2016 02:22:34 -0500
Received: from epcpsbgm1new.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OHW01LW2PTGGW10@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 09 Dec 2016 16:22:32 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>

"iis", "i2s_opclk0" and "i2s_opclk1" are standard clocks for Exynos4 I2S
hardware module, so they should be defined in .dtsi file not in the random
board .dts file.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
Changelog:
v2:
- added changes for exynos4412-itop-elite board
---
 arch/arm/boot/dts/exynos4.dtsi                  | 6 ++++--
 arch/arm/boot/dts/exynos4412-itop-elite.dts     | 4 ----
 arch/arm/boot/dts/exynos4412-odroid-common.dtsi | 4 ----
 3 files changed, 4 insertions(+), 10 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4.dtsi b/arch/arm/boot/dts/exynos4.dtsi
index c64737b..23d85601 100644
--- a/arch/arm/boot/dts/exynos4.dtsi
+++ b/arch/arm/boot/dts/exynos4.dtsi
@@ -64,8 +64,10 @@
 	i2s0: i2s@03830000 {
 		compatible = "samsung,s5pv210-i2s";
 		reg = <0x03830000 0x100>;
-		clocks = <&clock_audss EXYNOS_I2S_BUS>;
-		clock-names = "iis";
+		clocks = <&clock_audss EXYNOS_I2S_BUS>,
+			 <&clock_audss EXYNOS_DOUT_AUD_BUS>,
+			 <&clock_audss EXYNOS_SCLK_I2S>;
+		clock-names = "iis", "i2s_opclk0", "i2s_opclk1";
 		#clock-cells = <1>;
 		clock-output-names = "i2s_cdclk0";
 		dmas = <&pdma0 12>, <&pdma0 11>, <&pdma0 10>;
diff --git a/arch/arm/boot/dts/exynos4412-itop-elite.dts b/arch/arm/boot/dts/exynos4412-itop-elite.dts
index 76d87f3..1ac9129 100644
--- a/arch/arm/boot/dts/exynos4412-itop-elite.dts
+++ b/arch/arm/boot/dts/exynos4412-itop-elite.dts
@@ -198,10 +198,6 @@
 	pinctrl-0 = <&i2s0_bus>;
 	pinctrl-names = "default";
 	status = "okay";
-	clocks = <&clock_audss EXYNOS_I2S_BUS>,
-		 <&clock_audss EXYNOS_DOUT_AUD_BUS>,
-		 <&clock_audss EXYNOS_SCLK_I2S>;
-	clock-names = "iis", "i2s_opclk0", "i2s_opclk1";
 };
 
 &pinctrl_1 {
diff --git a/arch/arm/boot/dts/exynos4412-odroid-common.dtsi b/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
index 8aa19ba..7815efd 100644
--- a/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
+++ b/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
@@ -503,10 +503,6 @@
 	pinctrl-0 = <&i2s0_bus>;
 	pinctrl-names = "default";
 	status = "okay";
-	clocks = <&clock_audss EXYNOS_I2S_BUS>,
-		 <&clock_audss EXYNOS_DOUT_AUD_BUS>,
-		 <&clock_audss EXYNOS_SCLK_I2S>;
-	clock-names = "iis", "i2s_opclk0", "i2s_opclk1";
 };
 
 &mixer {
-- 
1.9.1
