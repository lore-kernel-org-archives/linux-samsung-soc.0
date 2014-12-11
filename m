From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH/RFC 14/14] ARM: dts: Switch Odroid X2/U2 to simple-audio-card
Date: Thu, 11 Dec 2014 18:45:52 +0100
Message-ID: <1418319952-10163-15-git-send-email-s.nawrocki@samsung.com>
References: <1418319952-10163-1-git-send-email-s.nawrocki@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:24397 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932412AbaLKRrJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 11 Dec 2014 12:47:09 -0500
In-reply-to: <1418319952-10163-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org
Cc: broonie@kernel.org, padma.v@samsung.com, drake@endlessm.com, sbkim73@samsung.com, Sylwester Nawrocki <s.nawrocki@samsung.com>, devicetree@vger.kernel.org

Now when the CDCLK I2S output clock can be handled through the clock
API the Odroid X2/U3 can be switched to the simple-audio-card DT binding.

Cc: devicetree@vger.kernel.org
Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 arch/arm/boot/dts/exynos4.dtsi                  |    3 +++
 arch/arm/boot/dts/exynos4412-odroid-common.dtsi |   19 ++++++++++++++++---
 arch/arm/boot/dts/exynos4412-odroidu3.dts       |    8 +++++---
 arch/arm/boot/dts/exynos4412-odroidx2.dts       |    8 ++++++--
 4 files changed, 30 insertions(+), 8 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4.dtsi b/arch/arm/boot/dts/exynos4.dtsi
index e1ce457..5f9e72f 100644
--- a/arch/arm/boot/dts/exynos4.dtsi
+++ b/arch/arm/boot/dts/exynos4.dtsi
@@ -66,6 +66,7 @@
 		dmas = <&pdma0 12>, <&pdma0 11>, <&pdma0 10>;
 		dma-names = "tx", "rx", "tx-sec";
 		samsung,idma-addr = <0x03000000>;
+		#sound-dai-cells = <1>;
 		status = "disabled";
 	};

@@ -378,6 +379,7 @@
 		clock-output-names = "i2s_cdclk1";
 		dmas = <&pdma1 12>, <&pdma1 11>;
 		dma-names = "tx", "rx";
+		#sound-dai-cells = <1>;
 		status = "disabled";
 	};

@@ -390,6 +392,7 @@
 		clock-output-names = "i2s_cdclk2";
 		dmas = <&pdma0 14>, <&pdma0 13>;
 		dma-names = "tx", "rx";
+		#sound-dai-cells = <1>;
 		status = "disabled";
 	};

diff --git a/arch/arm/boot/dts/exynos4412-odroid-common.dtsi b/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
index 956737e..89fed7a 100644
--- a/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
+++ b/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
@@ -43,9 +43,7 @@
 	};

 	sound: sound {
-		compatible = "samsung,odroidx2-audio";
-		samsung,i2s-controller = <&i2s0>;
-		samsung,audio-codec = <&max98090>;
+		compatible = "simple-audio-card";
 		assigned-clocks = <&clock_audss EXYNOS_MOUT_AUDSS>,
 				<&clock_audss EXYNOS_MOUT_I2S>,
 				<&clock_audss EXYNOS_DOUT_SRP>,
@@ -56,6 +54,20 @@
 				<0>,
 				<192000000>,
 				<19200000>;
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
+			clocks = <&i2s0 0>;
+		};
 	};

 	mmc@12550000 {
@@ -360,6 +372,7 @@
 			interrupts = <0 0>;
 			clocks = <&i2s0 0>;
 			clock-names = "mclk";
+			#sound-dai-cells = <0>;
 		};
 	};

diff --git a/arch/arm/boot/dts/exynos4412-odroidu3.dts b/arch/arm/boot/dts/exynos4412-odroidu3.dts
index c8a64be..44684e5 100644
--- a/arch/arm/boot/dts/exynos4412-odroidu3.dts
+++ b/arch/arm/boot/dts/exynos4412-odroidu3.dts
@@ -49,9 +49,11 @@
 };

 &sound {
-	compatible = "samsung,odroidu3-audio";
-	samsung,model = "Odroid-U3";
-	samsung,audio-routing =
+	simple-audio-card,name = "Odroid-U3";
+	simple-audio-card,widgets =
+		"Headphone", "Headphone Jack",
+		"Speakers", "Speakers";
+	simple-audio-card,routing =
 		"Headphone Jack", "HPL",
 		"Headphone Jack", "HPR",
 		"Headphone Jack", "MICBIAS",
diff --git a/arch/arm/boot/dts/exynos4412-odroidx2.dts b/arch/arm/boot/dts/exynos4412-odroidx2.dts
index 96b43f4..6e33678 100644
--- a/arch/arm/boot/dts/exynos4412-odroidx2.dts
+++ b/arch/arm/boot/dts/exynos4412-odroidx2.dts
@@ -23,8 +23,12 @@
 };

 &sound {
-	samsung,model = "Odroid-X2";
-	samsung,audio-routing =
+	simple-audio-card,name = "Odroid-X2";
+	simple-audio-card,widgets =
+		"Headphone", "Headphone Jack",
+		"Microphone", "Mic Jack",
+		"Microphone", "DMIC";
+	simple-audio-card,routing =
 		"Headphone Jack", "HPL",
 		"Headphone Jack", "HPR",
 		"IN1", "Mic Jack",
--
1.7.9.5
