From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [RESEND PATCH V3 13/15] ARM: dts: Exynos4 and Odroid X2/U3 sound
 device nodes update
Date: Tue, 03 Feb 2015 15:06:20 +0100
Message-ID: <1422972382-18520-1-git-send-email-s.nawrocki@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:22398 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S965481AbbBCOHK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 3 Feb 2015 09:07:10 -0500
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0NJ700BB68JWDWB0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 03 Feb 2015 23:07:08 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: broonie@kernel.org
Cc: kgene@kernel.org, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>

Clock related properties are added to the Exynos4 I2S device nodes
so they can be referred to as clock providers. Missing i2s_opclk1
clock is added to the I2S0 node and clock properties are added
to the MAX98090 codec node to allow it to control/read frequency
of the MCLK clock directly.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 arch/arm/boot/dts/exynos4.dtsi                  |    6 ++++++
 arch/arm/boot/dts/exynos4412-odroid-common.dtsi |    8 ++++++--
 2 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4.dtsi b/arch/arm/boot/dts/exynos4.dtsi
index b8168f1..38d8f68 100644
--- a/arch/arm/boot/dts/exynos4.dtsi
+++ b/arch/arm/boot/dts/exynos4.dtsi
@@ -61,6 +61,8 @@
 		reg = <0x03830000 0x100>;
 		clocks = <&clock_audss EXYNOS_I2S_BUS>;
 		clock-names = "iis";
+		#clock-cells = <1>;
+		clock-output-names = "i2s_cdclk0";
 		dmas = <&pdma0 12>, <&pdma0 11>, <&pdma0 10>;
 		dma-names = "tx", "rx", "tx-sec";
 		samsung,idma-addr = <0x03000000>;
@@ -372,6 +374,8 @@
 		reg = <0x13960000 0x100>;
 		clocks = <&clock CLK_I2S1>;
 		clock-names = "iis";
+		#clock-cells = <1>;
+		clock-output-names = "i2s_cdclk1";
 		dmas = <&pdma1 12>, <&pdma1 11>;
 		dma-names = "tx", "rx";
 		status = "disabled";
@@ -382,6 +386,8 @@
 		reg = <0x13970000 0x100>;
 		clocks = <&clock CLK_I2S2>;
 		clock-names = "iis";
+		#clock-cells = <1>;
+		clock-output-names = "i2s_cdclk2";
 		dmas = <&pdma0 14>, <&pdma0 13>;
 		dma-names = "tx", "rx";
 		status = "disabled";
diff --git a/arch/arm/boot/dts/exynos4412-odroid-common.dtsi b/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
index 3fbf588..c26b9fb 100644
--- a/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
+++ b/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
@@ -7,6 +7,7 @@
  * published by the Free Software Foundation.
 */

+#include <dt-bindings/sound/samsung-i2s.h>
 #include <dt-bindings/input/input.h>
 #include "exynos4412.dtsi"

@@ -37,8 +38,9 @@
 		pinctrl-names = "default";
 		status = "okay";
 		clocks = <&clock_audss EXYNOS_I2S_BUS>,
-			 <&clock_audss EXYNOS_DOUT_AUD_BUS>;
-		clock-names = "iis", "i2s_opclk0";
+			 <&clock_audss EXYNOS_DOUT_AUD_BUS>,
+			 <&clock_audss EXYNOS_SCLK_I2S>;
+		clock-names = "iis", "i2s_opclk0", "i2s_opclk1";
 	};

 	sound: sound {
@@ -373,6 +375,8 @@
 			reg = <0x10>;
 			interrupt-parent = <&gpx0>;
 			interrupts = <0 0>;
+			clocks = <&i2s0 CLK_I2S_CDCLK>;
+			clock-names = "mclk";
 		};
 	};

--
1.7.9.5
