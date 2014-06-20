From: Tushar Behera <tushar.b@samsung.com>
Subject: [PATCH v2 1/2] ARM: dts: Enable audio support for Peach-pi board
Date: Fri, 20 Jun 2014 13:50:18 +0530
Message-ID: <1403252419-28352-2-git-send-email-tushar.b@samsung.com>
References: <1403252419-28352-1-git-send-email-tushar.b@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f46.google.com ([209.85.220.46]:45674 "EHLO
	mail-pa0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S965273AbaFTIX1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 20 Jun 2014 04:23:27 -0400
Received: by mail-pa0-f46.google.com with SMTP id eu11so2861268pac.33
        for <linux-samsung-soc@vger.kernel.org>; Fri, 20 Jun 2014 01:23:26 -0700 (PDT)
In-Reply-To: <1403252419-28352-1-git-send-email-tushar.b@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, broonie@kernel.org, dianders@chromium.org, trblinux@gmail.com

Peach-pi board has MAX98091 audio codec connected on HSI2C-7 bus.

Signed-off-by: Tushar Behera <tushar.b@samsung.com>
---
Changes for v2:
* Replaced max98090 with max98091.

 arch/arm/boot/dts/exynos5800-peach-pi.dts |   31 +++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5800-peach-pi.dts b/arch/arm/boot/dts/exynos5800-peach-pi.dts
index f3af207..ef94ab8 100644
--- a/arch/arm/boot/dts/exynos5800-peach-pi.dts
+++ b/arch/arm/boot/dts/exynos5800-peach-pi.dts
@@ -57,6 +57,13 @@
 		pinctrl-names = "default";
 	};
 
+	sound {
+		compatible = "google,snow-audio-max98091";
+
+		samsung,i2s-controller = <&i2s0>;
+		samsung,audio-codec = <&max98091>;
+	};
+
 	usb300_vbus_reg: regulator-usb300 {
 		compatible = "regulator-fixed";
 		regulator-name = "P5.0V_USB3CON0";
@@ -81,6 +88,13 @@
 };
 
 &pinctrl_0 {
+	max98091_irq: max98091-irq {
+		samsung,pins = "gpx0-2";
+		samsung,pin-function = <0>;
+		samsung,pin-pud = <0>;
+		samsung,pin-drv = <0>;
+	};
+
 	tpm_irq: tpm-irq {
 		samsung,pins = "gpx1-0";
 		samsung,pin-function = <0>;
@@ -207,6 +221,19 @@
 	samsung,invert-vclk;
 };
 
+&hsi2c_7 {
+	status = "okay";
+
+	max98091: codec@10 {
+		compatible = "maxim,max98091";
+		reg = <0x10>;
+		interrupts = <2 0>;
+		interrupt-parent = <&gpx0>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&max98091_irq>;
+	};
+};
+
 &hsi2c_9 {
 	status = "okay";
 	clock-frequency = <400000>;
@@ -251,3 +278,7 @@
 &watchdog {
 	timeout-sec = <32>;
 };
+
+&i2s0 {
+	status = "okay";
+};
-- 
1.7.9.5
