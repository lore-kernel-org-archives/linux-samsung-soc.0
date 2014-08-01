From: Ajay Kumar <ajaykumar.rs@samsung.com>
Subject: [PATCH V2] ARM: dts: Add DT changes for display on peach_pi
Date: Fri, 01 Aug 2014 21:54:18 +0530
Message-ID: <1406910258-28036-1-git-send-email-ajaykumar.rs@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:48388 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751303AbaHAQ1l (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 1 Aug 2014 12:27:41 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: kgene.kim@samsung.com, inki.dae@samsung.com, thierry.reding@gmail.com, seanpaul@google.com, ajaynumb@gmail.com, jg1.han@samsung.com, joshi@samsung.com, prashanth.g@samsung.com, Ajay Kumar <ajaykumar.rs@samsung.com>

Add DT nodes for panel-simple "auo,b133htn01" panel.
Add backlight enable pin and backlight power supply for pwm-backlight.
Also add panel phandle needed by dp to enable display on peach_pi.

Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
---
Changes since V1:
Remove "simple-panel" compatible string and use only ""auo,b133htn01".

 arch/arm/boot/dts/exynos5800-peach-pi.dts |   27 ++++++++++-----------------
 1 file changed, 10 insertions(+), 17 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5800-peach-pi.dts b/arch/arm/boot/dts/exynos5800-peach-pi.dts
index f3ee48b..f8c2e61 100644
--- a/arch/arm/boot/dts/exynos5800-peach-pi.dts
+++ b/arch/arm/boot/dts/exynos5800-peach-pi.dts
@@ -28,11 +28,13 @@
 		i2c20 = "/spi@12d40000/cros-ec@0/i2c-tunnel";
 	};
 
-	backlight {
+	backlight: backlight {
 		compatible = "pwm-backlight";
 		pwms = <&pwm 0 1000000 0>;
 		brightness-levels = <0 100 500 1000 1500 2000 2500 2800>;
 		default-brightness-level = <7>;
+		enable-gpios = <&gpx2 2 0>;
+		power-supply = <&tps65090_fet1>;
 		pinctrl-0 = <&pwm0_out>;
 		pinctrl-names = "default";
 	};
@@ -98,6 +100,12 @@
 		regulator-boot-on;
 		regulator-always-on;
 	};
+
+	panel: panel-simple {
+		compatible = "auo,b133htn01";
+		power-supply = <&tps65090_fet6>;
+		backlight = <&backlight>;
+	};
 };
 
 &dp {
@@ -111,22 +119,7 @@
 	samsung,link-rate = <0x0a>;
 	samsung,lane-count = <2>;
 	samsung,hpd-gpio = <&gpx2 6 0>;
-
-	display-timings {
-		native-mode = <&timing1>;
-
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
-	};
+	panel = <&panel>;
 };
 
 &fimd {
-- 
1.7.9.5
