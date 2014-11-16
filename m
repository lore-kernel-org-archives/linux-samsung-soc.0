From: juergen@kreuzholzen.de
Subject: (unknown)
Date: Sun, 16 Nov 2014 18:29:37 +0100
Message-ID: <E1Xq3dp-0006lG-CH@sslproxy02.your-server.de>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from www291.your-server.de ([78.46.156.197]:51648 "EHLO
	www291.your-server.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755403AbaKPR3l (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 16 Nov 2014 12:29:41 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

>From 6b429d8fd28c6ebd6600a120ccba5cafd6bd07e4 Mon Sep 17 00:00:00 2001
Message-Id: <6b429d8fd28c6ebd6600a120ccba5cafd6bd07e4.1416158605.git.juergen@kreuzholzen.de>
In-Reply-To: <cover.1416158605.git.juergen@kreuzholzen.de>
References: <cover.1416158605.git.juergen@kreuzholzen.de>
From: Juergen Borleis <juergen@kreuzholzen.de>
Date: Sat, 15 Nov 2014 16:06:26 +0100
Subject: [PATCH 8/8] ARM/Mini6410: enable USB OHCI support
To: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org

All required drivers are now in place. Make use of them.

Signed-off-by: Juergen Borleis <juergen@kreuzholzen.de>
---
 arch/arm/boot/dts/s3c6410-mini6410.dts | 50 ++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/arch/arm/boot/dts/s3c6410-mini6410.dts b/arch/arm/boot/dts/s3c6410-mini6410.dts
index 1e196ca..ab606d9 100644
--- a/arch/arm/boot/dts/s3c6410-mini6410.dts
+++ b/arch/arm/boot/dts/s3c6410-mini6410.dts
@@ -30,6 +30,42 @@
 		bootargs = "console=ttySAC0,115200n8 earlyprintk rootwait root=/dev/mmcblk0p1";
 	};
 
+	regulators {
+		compatible = "simple-bus";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&gpio_regs>;
+
+		votg: fixed-regulator@6 {
+			/* U6 is of type XC6219B331MR = 3.3 V */
+			/* digital power for the USB OTG phy */
+			compatible = "regulator-fixed";
+			regulator-name = "vddotg";
+			regulator-min-microvolt = <3300000>;
+			regulator-max-microvolt = <3300000>;
+		};
+
+		/*
+		 * Both 'vddotg' and 'vddotgi' are controlled via GPIO GPF13
+		 * We cannot forward the same GPIO pin twice, so let the lower
+		 * voltage regulator looks like it uses the voltage from the
+		 * other regulator.
+		 */
+		votgi: fixed-regulator@7 {
+			/* U7 is of type XC6219B121MR = 1.2 V */
+			/* analog power for the USB OTG phy */
+			pinctrl-names = "default";
+			pinctrl-0 = <&gpio_regs>;
+			compatible = "regulator-fixed";
+			regulator-name = "vddotgi";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			gpio = <&gpf 13 GPIO_ACTIVE_HIGH>; /* active if GPF13 is high */
+			enable-active-high;
+		};
+	};
+
 	clocks {
 		compatible = "simple-bus";
 		#address-cells = <1>;
@@ -213,6 +249,11 @@
 				"gpn-4", "gpn-5", "gpl-11", "gpl-12";
 		samsung,pin-pud = <PIN_PULL_NONE>;
 	};
+
+	gpio_regs: gpio-regs {
+		samsung,pins = "gpf-13";
+		samsung,pin-pud = <PIN_PULL_NONE>;
+	};
 };
 
 &i2c0 {
@@ -234,3 +275,12 @@
 &rtc {
 	status = "okay";
 };
+
+&usbphy {
+	status = "okay";
+	analog-supply = <&votgi>; /* analog power supply */
+};
+
+&usbhost {
+	status = "okay";
+};
-- 
1.8.1
