From: Tushar Behera <tushar.b@samsung.com>
Subject: [PATCH 2/2] ARM: dts: Sort nodes within Peach-pit/Peach-pi dts files
Date: Fri, 20 Jun 2014 13:50:19 +0530
Message-ID: <1403252419-28352-3-git-send-email-tushar.b@samsung.com>
References: <1403252419-28352-1-git-send-email-tushar.b@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f177.google.com ([209.85.192.177]:40095 "EHLO
	mail-pd0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S965273AbaFTIXa (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 20 Jun 2014 04:23:30 -0400
Received: by mail-pd0-f177.google.com with SMTP id y10so2734070pdj.36
        for <linux-samsung-soc@vger.kernel.org>; Fri, 20 Jun 2014 01:23:29 -0700 (PDT)
In-Reply-To: <1403252419-28352-1-git-send-email-tushar.b@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, broonie@kernel.org, dianders@chromium.org, trblinux@gmail.com

Peach-pit and Peach-pi boards are almost similar, hence the DTS file
is also very similar. Sorting nodes in both these files will allow
us to figure out the difference easily.

All the node aliases are sorted in alphabetically increasing order.
There is no functional change with this patch.

Signed-off-by: Tushar Behera <tushar.b@samsung.com>
---
 arch/arm/boot/dts/exynos5420-peach-pit.dts |  236 ++++++++++++++--------------
 arch/arm/boot/dts/exynos5800-peach-pi.dts  |  225 +++++++++++++-------------
 2 files changed, 233 insertions(+), 228 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5420-peach-pit.dts b/arch/arm/boot/dts/exynos5420-peach-pit.dts
index 1c5b8f9..7649982 100644
--- a/arch/arm/boot/dts/exynos5420-peach-pit.dts
+++ b/arch/arm/boot/dts/exynos5420-peach-pit.dts
@@ -25,8 +25,13 @@
 		"google,pit", "google,peach","samsung,exynos5420",
 		"samsung,exynos5";
 
-	memory {
-		reg = <0x20000000 0x80000000>;
+	backlight {
+		compatible = "pwm-backlight";
+		pwms = <&pwm 0 1000000 0>;
+		brightness-levels = <0 100 500 1000 1500 2000 2500 2800>;
+		default-brightness-level = <7>;
+		pinctrl-0 = <&pwm0_out>;
+		pinctrl-names = "default";
 	};
 
 	fixed-rate-clocks {
@@ -50,13 +55,8 @@
 		};
 	};
 
-	backlight {
-		compatible = "pwm-backlight";
-		pwms = <&pwm 0 1000000 0>;
-		brightness-levels = <0 100 500 1000 1500 2000 2500 2800>;
-		default-brightness-level = <7>;
-		pinctrl-0 = <&pwm0_out>;
-		pinctrl-names = "default";
+	memory {
+		reg = <0x20000000 0x80000000>;
 	};
 
 	sound {
@@ -89,64 +89,83 @@
 	};
 };
 
-&pinctrl_0 {
-	max98090_irq: max98090-irq {
-		samsung,pins = "gpx0-2";
-		samsung,pin-function = <0>;
-		samsung,pin-pud = <0>;
-		samsung,pin-drv = <0>;
-	};
+&dp {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&dp_hpd_gpio>;
+	samsung,color-space = <0>;
+	samsung,dynamic-range = <0>;
+	samsung,ycbcr-coeff = <0>;
+	samsung,color-depth = <1>;
+	samsung,link-rate = <0x06>;
+	samsung,lane-count = <2>;
+	samsung,hpd-gpio = <&gpx2 6 0>;
 
-	tpm_irq: tpm-irq {
-		samsung,pins = "gpx1-0";
-		samsung,pin-function = <0>;
-		samsung,pin-pud = <0>;
-		samsung,pin-drv = <0>;
-	};
+	display-timings {
+		native-mode = <&timing1>;
 
-	power_key_irq: power-key-irq {
-		samsung,pins = "gpx1-2";
-		samsung,pin-function = <0>;
-		samsung,pin-pud = <0>;
-		samsung,pin-drv = <0>;
+		timing1: timing@1 {
+			clock-frequency = <70589280>;
+			hactive = <1366>;
+			vactive = <768>;
+			hfront-porch = <40>;
+			hback-porch = <40>;
+			hsync-len = <32>;
+			vback-porch = <10>;
+			vfront-porch = <12>;
+			vsync-len = <6>;
+		};
 	};
+};
 
-	hdmi_hpd_irq: hdmi-hpd-irq {
-		samsung,pins = "gpx3-7";
-		samsung,pin-function = <0>;
-		samsung,pin-pud = <1>;
-		samsung,pin-drv = <0>;
-	};
+&fimd {
+	status = "okay";
+	samsung,invert-vclk;
+};
 
-	dp_hpd_gpio: dp_hpd_gpio {
-		samsung,pins = "gpx2-6";
-		samsung,pin-function = <0>;
-		samsung,pin-pud = <3>;
-		samsung,pin-drv = <0>;
-	};
+&hdmi {
+	status = "okay";
+	hpd-gpio = <&gpx3 7 GPIO_ACTIVE_HIGH>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&hdmi_hpd_irq>;
+	ddc = <&i2c_2>;
 };
 
-&pinctrl_3 {
-	usb300_vbus_en: usb300-vbus-en {
-		samsung,pins = "gph0-0";
-		samsung,pin-function = <1>;
-		samsung,pin-pud = <0>;
-		samsung,pin-drv = <0>;
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
 	};
+};
 
-	usb301_vbus_en: usb301-vbus-en {
-		samsung,pins = "gph0-1";
-		samsung,pin-function = <1>;
-		samsung,pin-pud = <0>;
-		samsung,pin-drv = <0>;
+&hsi2c_9 {
+	status = "okay";
+	clock-frequency = <400000>;
+
+	tpm@20 {
+		compatible = "infineon,slb9645tt";
+		reg = <0x20>;
+
+		/* Unused irq; but still need to configure the pins */
+		pinctrl-names = "default";
+		pinctrl-0 = <&tpm_irq>;
 	};
 };
 
-&rtc {
+&i2c_2 {
 	status = "okay";
+	samsung,i2c-sda-delay = <100>;
+	samsung,i2c-max-bus-freq = <66000>;
+	samsung,i2c-slave-addr = <0x50>;
 };
 
-&uart_3 {
+&i2s0 {
 	status = "okay";
 };
 
@@ -189,46 +208,66 @@
 	};
 };
 
-&hsi2c_7 {
-	status = "okay";
 
-	max98090: codec@10 {
-		compatible = "maxim,max98090";
-		reg = <0x10>;
-		interrupts = <2 0>;
-		interrupt-parent = <&gpx0>;
-		pinctrl-names = "default";
-		pinctrl-0 = <&max98090_irq>;
+&pinctrl_0 {
+	max98090_irq: max98090-irq {
+		samsung,pins = "gpx0-2";
+		samsung,pin-function = <0>;
+		samsung,pin-pud = <0>;
+		samsung,pin-drv = <0>;
 	};
-};
 
-&hsi2c_9 {
-	status = "okay";
-	clock-frequency = <400000>;
+	tpm_irq: tpm-irq {
+		samsung,pins = "gpx1-0";
+		samsung,pin-function = <0>;
+		samsung,pin-pud = <0>;
+		samsung,pin-drv = <0>;
+	};
 
-	tpm@20 {
-		compatible = "infineon,slb9645tt";
-		reg = <0x20>;
+	power_key_irq: power-key-irq {
+		samsung,pins = "gpx1-2";
+		samsung,pin-function = <0>;
+		samsung,pin-pud = <0>;
+		samsung,pin-drv = <0>;
+	};
 
-		/* Unused irq; but still need to configure the pins */
-		pinctrl-names = "default";
-		pinctrl-0 = <&tpm_irq>;
+	dp_hpd_gpio: dp_hpd_gpio {
+		samsung,pins = "gpx2-6";
+		samsung,pin-function = <0>;
+		samsung,pin-pud = <3>;
+		samsung,pin-drv = <0>;
+	};
+
+	hdmi_hpd_irq: hdmi-hpd-irq {
+		samsung,pins = "gpx3-7";
+		samsung,pin-function = <0>;
+		samsung,pin-pud = <1>;
+		samsung,pin-drv = <0>;
 	};
 };
 
-&i2c_2	{
+&pinctrl_3 {
+	usb300_vbus_en: usb300-vbus-en {
+		samsung,pins = "gph0-0";
+		samsung,pin-function = <1>;
+		samsung,pin-pud = <0>;
+		samsung,pin-drv = <0>;
+	};
+
+	usb301_vbus_en: usb301-vbus-en {
+		samsung,pins = "gph0-1";
+		samsung,pin-function = <1>;
+		samsung,pin-pud = <0>;
+		samsung,pin-drv = <0>;
+	};
+};
+
+&rtc {
 	status = "okay";
-	samsung,i2c-sda-delay = <100>;
-	samsung,i2c-max-bus-freq = <66000>;
-	samsung,i2c-slave-addr = <0x50>;
 };
 
-&hdmi {
+&uart_3 {
 	status = "okay";
-	hpd-gpio = <&gpx3 7 GPIO_ACTIVE_HIGH>;
-	pinctrl-names = "default";
-	pinctrl-0 = <&hdmi_hpd_irq>;
-	ddc = <&i2c_2>;
 };
 
 &usbdrd_phy0 {
@@ -248,40 +287,3 @@
 	timeout-sec = <32>;
 };
 
-&i2s0 {
-	status = "okay";
-};
-
-&fimd {
-	status = "okay";
-	samsung,invert-vclk;
-};
-
-&dp {
-	status = "okay";
-	pinctrl-names = "default";
-	pinctrl-0 = <&dp_hpd_gpio>;
-	samsung,color-space = <0>;
-	samsung,dynamic-range = <0>;
-	samsung,ycbcr-coeff = <0>;
-	samsung,color-depth = <1>;
-	samsung,link-rate = <0x06>;
-	samsung,lane-count = <2>;
-	samsung,hpd-gpio = <&gpx2 6 0>;
-
-	display-timings {
-		native-mode = <&timing1>;
-
-		timing1: timing@1 {
-			clock-frequency = <70589280>;
-			hactive = <1366>;
-			vactive = <768>;
-			hfront-porch = <40>;
-			hback-porch = <40>;
-			hsync-len = <32>;
-			vback-porch = <10>;
-			vfront-porch = <12>;
-			vsync-len = <6>;
-		};
-	};
-};
diff --git a/arch/arm/boot/dts/exynos5800-peach-pi.dts b/arch/arm/boot/dts/exynos5800-peach-pi.dts
index ef94ab8..2c2c137 100644
--- a/arch/arm/boot/dts/exynos5800-peach-pi.dts
+++ b/arch/arm/boot/dts/exynos5800-peach-pi.dts
@@ -23,8 +23,13 @@
 		"google,pi", "google,peach", "samsung,exynos5800",
 		"samsung,exynos5";
 
-	memory {
-		reg = <0x20000000 0x80000000>;
+	backlight {
+		compatible = "pwm-backlight";
+		pwms = <&pwm 0 1000000 0>;
+		brightness-levels = <0 100 500 1000 1500 2000 2500 2800>;
+		default-brightness-level = <7>;
+		pinctrl-0 = <&pwm0_out>;
+		pinctrl-names = "default";
 	};
 
 	fixed-rate-clocks {
@@ -48,13 +53,8 @@
 		};
 	};
 
-	backlight {
-		compatible = "pwm-backlight";
-		pwms = <&pwm 0 1000000 0>;
-		brightness-levels = <0 100 500 1000 1500 2000 2500 2800>;
-		default-brightness-level = <7>;
-		pinctrl-0 = <&pwm0_out>;
-		pinctrl-names = "default";
+	memory {
+		reg = <0x20000000 0x80000000>;
 	};
 
 	sound {
@@ -87,64 +87,83 @@
 	};
 };
 
-&pinctrl_0 {
-	max98091_irq: max98091-irq {
-		samsung,pins = "gpx0-2";
-		samsung,pin-function = <0>;
-		samsung,pin-pud = <0>;
-		samsung,pin-drv = <0>;
-	};
+&dp {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&dp_hpd_gpio>;
+	samsung,color-space = <0>;
+	samsung,dynamic-range = <0>;
+	samsung,ycbcr-coeff = <0>;
+	samsung,color-depth = <1>;
+	samsung,link-rate = <0x0a>;
+	samsung,lane-count = <2>;
+	samsung,hpd-gpio = <&gpx2 6 0>;
 
-	tpm_irq: tpm-irq {
-		samsung,pins = "gpx1-0";
-		samsung,pin-function = <0>;
-		samsung,pin-pud = <0>;
-		samsung,pin-drv = <0>;
-	};
+	display-timings {
+		native-mode = <&timing1>;
 
-	power_key_irq: power-key-irq {
-		samsung,pins = "gpx1-2";
-		samsung,pin-function = <0>;
-		samsung,pin-pud = <0>;
-		samsung,pin-drv = <0>;
+		timing1: timing@1 {
+			clock-frequency = <150660000>;
+			hactive = <1920>;
+			vactive = <1080>;
+			hfront-porch = <60>;
+			hback-porch = <172>;
+			hsync-len = <80>;
+			vback-porch = <25>;
+			vfront-porch = <10>;
+			vsync-len = <10>;
+		};
 	};
+};
 
-	dp_hpd_gpio: dp_hpd_gpio {
-		samsung,pins = "gpx2-6";
-		samsung,pin-function = <0>;
-		samsung,pin-pud = <3>;
-		samsung,pin-drv = <0>;
-	};
+&fimd {
+	status = "okay";
+	samsung,invert-vclk;
+};
 
-	hdmi_hpd_irq: hdmi-hpd-irq {
-		samsung,pins = "gpx3-7";
-		samsung,pin-function = <0>;
-		samsung,pin-pud = <1>;
-		samsung,pin-drv = <0>;
-	};
+&hdmi {
+	status = "okay";
+	hpd-gpio = <&gpx3 7 GPIO_ACTIVE_HIGH>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&hdmi_hpd_irq>;
+	ddc = <&i2c_2>;
 };
 
-&pinctrl_3 {
-	usb300_vbus_en: usb300-vbus-en {
-		samsung,pins = "gph0-0";
-		samsung,pin-function = <1>;
-		samsung,pin-pud = <0>;
-		samsung,pin-drv = <0>;
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
 	};
+};
 
-	usb301_vbus_en: usb301-vbus-en {
-		samsung,pins = "gph0-1";
-		samsung,pin-function = <1>;
-		samsung,pin-pud = <0>;
-		samsung,pin-drv = <0>;
+&hsi2c_9 {
+	status = "okay";
+	clock-frequency = <400000>;
+
+	tpm@20 {
+		compatible = "infineon,slb9645tt";
+		reg = <0x20>;
+
+		/* Unused irq; but still need to configure the pins */
+		pinctrl-names = "default";
+		pinctrl-0 = <&tpm_irq>;
 	};
 };
 
-&rtc {
+&i2c_2 {
 	status = "okay";
+	samsung,i2c-sda-delay = <100>;
+	samsung,i2c-max-bus-freq = <66000>;
+	samsung,i2c-slave-addr = <0x50>;
 };
 
-&uart_3 {
+&i2s0 {
 	status = "okay";
 };
 
@@ -187,79 +206,66 @@
 	};
 };
 
-&dp {
-	status = "okay";
-	pinctrl-names = "default";
-	pinctrl-0 = <&dp_hpd_gpio>;
-	samsung,color-space = <0>;
-	samsung,dynamic-range = <0>;
-	samsung,ycbcr-coeff = <0>;
-	samsung,color-depth = <1>;
-	samsung,link-rate = <0x0a>;
-	samsung,lane-count = <2>;
-	samsung,hpd-gpio = <&gpx2 6 0>;
 
-	display-timings {
-		native-mode = <&timing1>;
+&pinctrl_0 {
+	max98091_irq: max98091-irq {
+		samsung,pins = "gpx0-2";
+		samsung,pin-function = <0>;
+		samsung,pin-pud = <0>;
+		samsung,pin-drv = <0>;
+	};
 
-		timing1: timing@1 {
-			clock-frequency = <150660000>;
-			hactive = <1920>;
-			vactive = <1080>;
-			hfront-porch = <60>;
-			hback-porch = <172>;
-			hsync-len = <80>;
-			vback-porch = <25>;
-			vfront-porch = <10>;
-			vsync-len = <10>;
-		};
+	tpm_irq: tpm-irq {
+		samsung,pins = "gpx1-0";
+		samsung,pin-function = <0>;
+		samsung,pin-pud = <0>;
+		samsung,pin-drv = <0>;
 	};
-};
 
-&fimd {
-	status = "okay";
-	samsung,invert-vclk;
-};
+	power_key_irq: power-key-irq {
+		samsung,pins = "gpx1-2";
+		samsung,pin-function = <0>;
+		samsung,pin-pud = <0>;
+		samsung,pin-drv = <0>;
+	};
 
-&hsi2c_7 {
-	status = "okay";
+	dp_hpd_gpio: dp_hpd_gpio {
+		samsung,pins = "gpx2-6";
+		samsung,pin-function = <0>;
+		samsung,pin-pud = <3>;
+		samsung,pin-drv = <0>;
+	};
 
-	max98091: codec@10 {
-		compatible = "maxim,max98091";
-		reg = <0x10>;
-		interrupts = <2 0>;
-		interrupt-parent = <&gpx0>;
-		pinctrl-names = "default";
-		pinctrl-0 = <&max98091_irq>;
+	hdmi_hpd_irq: hdmi-hpd-irq {
+		samsung,pins = "gpx3-7";
+		samsung,pin-function = <0>;
+		samsung,pin-pud = <1>;
+		samsung,pin-drv = <0>;
 	};
 };
 
-&hsi2c_9 {
-	status = "okay";
-	clock-frequency = <400000>;
+&pinctrl_3 {
+	usb300_vbus_en: usb300-vbus-en {
+		samsung,pins = "gph0-0";
+		samsung,pin-function = <1>;
+		samsung,pin-pud = <0>;
+		samsung,pin-drv = <0>;
+	};
 
-	tpm@20 {
-		compatible = "infineon,slb9645tt";
-		reg = <0x20>;
-		/* Unused irq; but still need to configure the pins */
-		pinctrl-names = "default";
-		pinctrl-0 = <&tpm_irq>;
+	usb301_vbus_en: usb301-vbus-en {
+		samsung,pins = "gph0-1";
+		samsung,pin-function = <1>;
+		samsung,pin-pud = <0>;
+		samsung,pin-drv = <0>;
 	};
 };
 
-&i2c_2 {
+&rtc {
 	status = "okay";
-	samsung,i2c-sda-delay = <100>;
-	samsung,i2c-max-bus-freq = <66000>;
-	samsung,i2c-slave-addr = <0x50>;
 };
 
-&hdmi {
+&uart_3 {
 	status = "okay";
-	hpd-gpio = <&gpx3 7 GPIO_ACTIVE_HIGH>;
-	pinctrl-names = "default";
-	pinctrl-0 = <&hdmi_hpd_irq>;
-	ddc = <&i2c_2>;
 };
 
 &usbdrd_phy0 {
@@ -279,6 +285,3 @@
 	timeout-sec = <32>;
 };
 
-&i2s0 {
-	status = "okay";
-};
-- 
1.7.9.5
