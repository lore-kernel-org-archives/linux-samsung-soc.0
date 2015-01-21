From: Inha Song <ideal.song@samsung.com>
Subject: [PATCH] ARM: dts: exynos5422-odroidxu3: add sound nodes
Date: Wed, 21 Jan 2015 14:58:43 +0900
Message-ID: <1421819923-27575-1-git-send-email-ideal.song@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: kgene@kernel.org, linux-samsung-soc@vger.kernel.org
Cc: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@arm.linux.org.uk, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Inha Song <ideal.song@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Add MAX98090 audio codec, I2S interface and the sound nodes to support
audio on Odroid-XU3 board.

Signed-off-by: Inha Song <ideal.song@samsung.com>
---
 arch/arm/boot/dts/exynos5422-odroidxu3.dts | 34 ++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5422-odroidxu3.dts b/arch/arm/boot/dts/exynos5422-odroidxu3.dts
index 7874da2..79493d1 100644
--- a/arch/arm/boot/dts/exynos5422-odroidxu3.dts
+++ b/arch/arm/boot/dts/exynos5422-odroidxu3.dts
@@ -310,6 +310,40 @@
 	rtc@101E0000 {
 		status = "okay";
 	};
+
+	sound: sound {
+		compatible = "samsung,odroidu3-audio";
+		samsung,model = "Odroid-XU3";
+		samsung,i2s-controller = <&i2s0>;
+		samsung,audio-codec = <&max98090>;
+		assigned-clocks = <&clock_audss EXYNOS_MOUT_AUDSS>,
+				  <&clock_audss EXYNOS_MOUT_I2S>;
+		assigned-clock-parents = <&clock CLK_FIN_PLL>,
+				<&clock_audss EXYNOS_MOUT_AUDSS>;
+		samsung,audio-routing =
+			"Headphone Jack", "HPL",
+			"Headphone Jack", "HPR",
+			"Headphone Jack", "MICBIAS",
+			"IN1", "Headphone Jack",
+			"Speakers", "SPKL",
+			"Speakers", "SPKR";
+	};
+};
+
+&hsi2c_5 {
+	status = "okay";
+	max98090: max98090@10 {
+		compatible = "maxim,max98090";
+		reg = <0x10>;
+		interrupt-parent = <&gpx3>;
+		interrupts = <2 0>;
+		clocks = <&clock_audss EXYNOS_DOUT_AUD_BUS>;
+		clock-names = "mclk";
+	};
+};
+
+&i2s0 {
+	status = "okay";
 };
 
 &hdmi {
-- 
2.0.0.390.gcb682f8
