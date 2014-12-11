From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH/RFC 13/14] ARM: dts: Exynos4 and Odroid X2/U3 sound device
 nodes update
Date: Thu, 11 Dec 2014 18:45:51 +0100
Message-ID: <1418319952-10163-14-git-send-email-s.nawrocki@samsung.com>
References: <1418319952-10163-1-git-send-email-s.nawrocki@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:25230 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932412AbaLKRrF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 11 Dec 2014 12:47:05 -0500
In-reply-to: <1418319952-10163-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org
Cc: broonie@kernel.org, padma.v@samsung.com, drake@endlessm.com, sbkim73@samsung.com, Sylwester Nawrocki <s.nawrocki@samsung.com>, devicetree@vger.kernel.org

Clock related properties are added to the Exynos4 I2S device nodes
so they can be referred to as clock providers. Missing i2s_opclk1
clock is added to the I2S0 node and clock properties are added
to the MAX98090 codec node to allow it to control/read frequency
of the MCLK clock directly.

Cc: devicetree@vger.kernel.org
Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 arch/arm/boot/dts/exynos4.dtsi                  |    6 ++++++
 arch/arm/boot/dts/exynos4412-odroid-common.dtsi |    7 +++++--
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4.dtsi b/arch/arm/boot/dts/exynos4.dtsi
index e0278ec..e1ce457 100644
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
index b41950f..956737e 100644
--- a/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
+++ b/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
@@ -37,8 +37,9 @@
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
@@ -357,6 +358,8 @@
 			reg = <0x10>;
 			interrupt-parent = <&gpx0>;
 			interrupts = <0 0>;
+			clocks = <&i2s0 0>;
+			clock-names = "mclk";
 		};
 	};

--
1.7.9.5
