From: Ajay Kumar <ajaykumar.rs@samsung.com>
Subject: [PATCH 2/3] ARM: dts: Add DT changes for display on peach_pit
Date: Sat, 26 Jul 2014 01:14:23 +0530
Message-ID: <1406317464-7525-3-git-send-email-ajaykumar.rs@samsung.com>
References: <1406317464-7525-1-git-send-email-ajaykumar.rs@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:49498 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S935062AbaGYTrb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 25 Jul 2014 15:47:31 -0400
In-reply-to: <1406317464-7525-1-git-send-email-ajaykumar.rs@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: kgene.kim@samsung.com, dianders@chromium.org, ajaynumb@gmail.com, joshi@samsung.com, prashanth.g@samsung.com, Ajay Kumar <ajaykumar.rs@samsung.com>

Add DT nodes for ps8622 bridge chip and panel-simple panel.
Add backlight power supply for pwm-backlight.
Also add bridge phandle needed by dp to enable display on peach_pit.

Note that, peach_pit doesn't support "chunghwa,claa101wb01" panel,
but still we choose to reuse the binding since "chunghwa,claa101wb01"
has similar LCD timings.

Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
---
 arch/arm/boot/dts/exynos5420-peach-pit.dts |   36 +++++++++++++++-------------
 1 file changed, 19 insertions(+), 17 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5420-peach-pit.dts b/arch/arm/boot/dts/exynos5420-peach-pit.dts
index 228a6b1..79beba8 100644
--- a/arch/arm/boot/dts/exynos5420-peach-pit.dts
+++ b/arch/arm/boot/dts/exynos5420-peach-pit.dts
@@ -30,11 +30,12 @@
 		i2c20 = "/spi@12d40000/cros-ec@0/i2c-tunnel";
 	};
 
-	backlight {
+	backlight: backlight {
 		compatible = "pwm-backlight";
 		pwms = <&pwm 0 1000000 0>;
 		brightness-levels = <0 100 500 1000 1500 2000 2500 2800>;
 		default-brightness-level = <7>;
+		power-supply = <&tps65090_fet1>;
 		pinctrl-0 = <&pwm0_out>;
 		pinctrl-names = "default";
 	};
@@ -100,6 +101,12 @@
 		regulator-boot-on;
 		regulator-always-on;
 	};
+
+	panel: panel-simple {
+		compatible = "chunghwa,claa101wb01", "simple-panel";
+		power-supply = <&tps65090_fet6>;
+		backlight = <&backlight>;
+	};
 };
 
 &dp {
@@ -113,22 +120,7 @@
 	samsung,link-rate = <0x06>;
 	samsung,lane-count = <2>;
 	samsung,hpd-gpio = <&gpx2 6 0>;
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
+	bridge = <&ps8625>;
 };
 
 &fimd {
@@ -155,6 +147,16 @@
 		pinctrl-names = "default";
 		pinctrl-0 = <&max98090_irq>;
 	};
+
+	ps8625: ps8625-bridge@48 {
+		compatible = "parade,ps8625";
+		reg = <0x48>;
+		sleep-gpios = <&gpx3 5 0>;
+		reset-gpios = <&gpy7 7 0>;
+		lane-count = <2>;
+		panel = <&panel>;
+		backlight = <&backlight>;
+	};
 };
 
 &hsi2c_9 {
-- 
1.7.9.5
