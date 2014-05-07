From: Tushar Behera <tushar.behera@linaro.org>
Subject: [PATCH V2 2/2] ARM: dts: Add sound node for Peach-pit board
Date: Wed,  7 May 2014 10:22:28 +0530
Message-ID: <1399438348-10819-3-git-send-email-tushar.behera@linaro.org>
References: <1399438348-10819-1-git-send-email-tushar.behera@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f43.google.com ([209.85.220.43]:41314 "EHLO
	mail-pa0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750905AbaEGFIb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 7 May 2014 01:08:31 -0400
Received: by mail-pa0-f43.google.com with SMTP id hz1so596429pad.16
        for <linux-samsung-soc@vger.kernel.org>; Tue, 06 May 2014 22:08:30 -0700 (PDT)
In-Reply-To: <1399438348-10819-1-git-send-email-tushar.behera@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: kgene.kim@samsung.com, robh+dt@kernel.org

The audio setup on Peach-pit board is similar to Snow board, hence the
sound-card driver used on Snow board can be reused on Peach-pit board.

Peach-pit board uses MAX98090 audio codec.

Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
---
Changes for V2:
1. Rebased on now-accepted exynos5420-peach-pit.dts file

 arch/arm/boot/dts/exynos5420-peach-pit.dts |   31 ++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5420-peach-pit.dts b/arch/arm/boot/dts/exynos5420-peach-pit.dts
index fae33dd..9902183 100644
--- a/arch/arm/boot/dts/exynos5420-peach-pit.dts
+++ b/arch/arm/boot/dts/exynos5420-peach-pit.dts
@@ -58,9 +58,23 @@
 		pinctrl-0 = <&pwm0_out>;
 		pinctrl-names = "default";
 	};
+
+	sound {
+		compatible = "google,snow-audio-max98090";
+
+		samsung,i2s-controller = <&i2s0>;
+		samsung,audio-codec = <&max98090>;
+	};
 };
 
 &pinctrl_0 {
+	max98090_irq: max98090-irq {
+		samsung,pins = "gpx0-2";
+		samsung,pin-function = <0>;
+		samsung,pin-pud = <0>;
+		samsung,pin-drv = <0>;
+	};
+
 	tpm_irq: tpm-irq {
 		samsung,pins = "gpx1-0";
 		samsung,pin-function = <0>;
@@ -123,6 +137,19 @@
 	};
 };
 
+&hsi2c_7 {
+	status = "okay";
+
+	max98090: codec@10 {
+		compatible = "maxim,max98090";
+		reg = <0x10>;
+		interrupts = <2 0>;
+		interrupt-parent = <&gpx0>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&max98090_irq>;
+	};
+};
+
 &hsi2c_9 {
 	status = "okay";
 	clock-frequency = <400000>;
@@ -145,3 +172,7 @@
 &watchdog {
 	timeout-sec = <32>;
 };
+
+&i2s0 {
+	status = "okay";
+};
-- 
1.7.9.5
