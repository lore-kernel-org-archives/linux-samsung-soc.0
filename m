From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH v2 15/16] ARM: dts: Switch Odroid X2/U2 to simple-audio-card
Date: Fri, 19 Dec 2014 14:55:35 +0100
Message-ID: <1418997336-17777-16-git-send-email-s.nawrocki@samsung.com>
References: <1418997336-17777-1-git-send-email-s.nawrocki@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:11196 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752465AbaLSOAK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 19 Dec 2014 09:00:10 -0500
In-reply-to: <1418997336-17777-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: broonie@kernel.org, kgene@kernel.org, alsa-devel@alsa-project.org
Cc: padma.v@samsung.com, drake@endlessm.com, sbkim73@samsung.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>

Now when the CDCLK I2S output clock can be handled through the clock
API the Odroid X2/U3 can be switched to the simple-audio-card DT binding.

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
index 9ccdc1f..051343e 100644
--- a/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
+++ b/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
@@ -44,9 +44,7 @@
 	};
 
 	sound: sound {
-		compatible = "samsung,odroidx2-audio";
-		samsung,i2s-controller = <&i2s0>;
-		samsung,audio-codec = <&max98090>;
+		compatible = "simple-audio-card";
 		assigned-clocks = <&clock_audss EXYNOS_MOUT_AUDSS>,
 				<&clock_audss EXYNOS_MOUT_I2S>,
 				<&clock_audss EXYNOS_DOUT_SRP>,
@@ -57,6 +55,20 @@
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
+			clocks = <&i2s0 CLK_I2S_CDCLK>;
+		};
 	};
 
 	mmc@12550000 {
@@ -361,6 +373,7 @@
 			interrupts = <0 0>;
 			clocks = <&i2s0 CLK_I2S_CDCLK>;
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
