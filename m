From: Inha Song <ideal.song@samsung.com>
Subject: [alsa-devel] [PATCH v2 RESEND] ARM: dts: Support audio on
 Exynos5422-odroidxu3 using simple-audio-card
Date: Fri, 10 Apr 2015 16:32:58 +0900
Message-ID: <1428651178-18186-1-git-send-email-ideal.song@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:61127 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753636AbbDJHdE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 10 Apr 2015 03:33:04 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene@kernel.org
Cc: s.nawrocki@samsung.com, broonie@kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, alsa-devel@alsa-project.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, cw00.choi@samsung.com, Inha Song <ideal.song@samsung.com>

Add MAX98090 audio codec, I2S interface and the sound nodes to support
audio on Exynos5422 SoC Based Odroid-XU3 board. Now we can support audio
in Odroid-XU3 board using simple-audio-card DT binding.

Signed-off-by: Inha Song <ideal.song@samsung.com>
Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 arch/arm/boot/dts/exynos5420.dtsi          |  9 +++++
 arch/arm/boot/dts/exynos5422-odroidxu3.dts | 59 ++++++++++++++++++++++++++++++
 2 files changed, 68 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
index ac6f860..73886d6 100644
--- a/arch/arm/boot/dts/exynos5420.dtsi
+++ b/arch/arm/boot/dts/exynos5420.dtsi
@@ -415,6 +415,9 @@
 			<&clock_audss EXYNOS_I2S_BUS>,
 			<&clock_audss EXYNOS_SCLK_I2S>;
 		clock-names = "iis", "i2s_opclk0", "i2s_opclk1";
+		#clock-cells = <1>;
+		clock-output-names = "i2s_cdclk0";
+		#sound-dai-cells = <1>;
 		samsung,idma-addr = <0x03000000>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&i2s0_bus>;
@@ -429,6 +432,9 @@
 		dma-names = "tx", "rx";
 		clocks = <&clock CLK_I2S1>, <&clock CLK_SCLK_I2S1>;
 		clock-names = "iis", "i2s_opclk0";
+		#clock-cells = <1>;
+		clock-output-names = "i2s_cdclk1";
+		#sound-dai-cells = <1>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&i2s1_bus>;
 		status = "disabled";
@@ -442,6 +448,9 @@
 		dma-names = "tx", "rx";
 		clocks = <&clock CLK_I2S2>, <&clock CLK_SCLK_I2S2>;
 		clock-names = "iis", "i2s_opclk0";
+		#clock-cells = <1>;
+		clock-output-names = "i2s_cdclk2";
+		#sound-dai-cells = <1>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&i2s2_bus>;
 		status = "disabled";
diff --git a/arch/arm/boot/dts/exynos5422-odroidxu3.dts b/arch/arm/boot/dts/exynos5422-odroidxu3.dts
index edc25cf..c038f0d 100644
--- a/arch/arm/boot/dts/exynos5422-odroidxu3.dts
+++ b/arch/arm/boot/dts/exynos5422-odroidxu3.dts
@@ -11,6 +11,7 @@
 */
 
 /dts-v1/;
+#include <dt-bindings/sound/samsung-i2s.h>
 #include "exynos5800.dtsi"
 
 / {
@@ -285,6 +286,64 @@
 	rtc@101E0000 {
 		status = "okay";
 	};
+
+	sound: sound {
+		compatible = "simple-audio-card";
+
+		simple-audio-card,name = "Odroid-XU3";
+		simple-audio-card,widgets =
+			"Headphone", "Headphone Jack",
+			"Speakers", "Speakers";
+		simple-audio-card,routing =
+			"Headphone Jack", "HPL",
+			"Headphone Jack", "HPR",
+			"Headphone Jack", "MICBIAS",
+			"IN1", "Headphone Jack",
+			"Speakers", "SPKL",
+			"Speakers", "SPKR";
+
+		simple-audio-card,format = "i2s";
+		simple-audio-card,bitclock-master = <&link0_codec>;
+		simple-audio-card,frame-master = <&link0_codec>;
+
+		simple-audio-card,cpu {
+			sound-dai = <&i2s0 0>;
+			system-clock-frequency = <19200000>;
+		};
+
+		link0_codec: simple-audio-card,codec {
+			sound-dai = <&max98090>;
+			clocks = <&i2s0 CLK_I2S_CDCLK>;
+		};
+	};
+};
+
+&clock_audss {
+	assigned-clocks = <&clock_audss EXYNOS_MOUT_AUDSS>,
+			<&clock_audss EXYNOS_MOUT_I2S>,
+			<&clock_audss EXYNOS_DOUT_AUD_BUS>;
+	assigned-clock-parents = <&clock CLK_FIN_PLL>,
+			<&clock_audss EXYNOS_MOUT_AUDSS>;
+	assigned-clock-rates = <0>,
+			<0>,
+			<19200000>;
+};
+
+&hsi2c_5 {
+	status = "okay";
+	max98090: max98090@10 {
+		compatible = "maxim,max98090";
+		reg = <0x10>;
+		interrupt-parent = <&gpx3>;
+		interrupts = <2 0>;
+		clocks = <&i2s0 CLK_I2S_CDCLK>;
+		clock-names = "mclk";
+		#sound-dai-cells = <0>;
+	};
+};
+
+&i2s0 {
+	status = "okay";
 };
 
 &hdmi {
-- 
2.0.0.390.gcb682f8
