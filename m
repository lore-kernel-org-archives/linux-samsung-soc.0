From: Markus Reichl <m.reichl@fivetechno.de>
Subject: [PATCH 1/1] ARM: dts: Add LEDs on odroid XU3 board.
Date: Thu, 02 Apr 2015 11:47:04 +0200
Message-ID: <1469684.01kDeJpqeV@dell2.five-lan.de>
Reply-To: m.reichl@fivetechno.de
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from wp126.webpack.hosteurope.de ([80.237.132.133]:42957 "EHLO
	wp126.webpack.hosteurope.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751054AbbDBJr0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 2 Apr 2015 05:47:26 -0400
Received: from dell2.five-lan.de (p5B22DC95.dip0.t-ipconnect.de [91.34.220.149])
	(authenticated bits=0)
	by linuxbbg.five-lan.de (8.14.9/8.14.5/SuSE Linux 0.8) with ESMTP id t329l4xG013631
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-samsung-soc@vger.kernel.org>; Thu, 2 Apr 2015 11:47:23 +0200
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>

This patch adds the RGB-LED on XU3 as 3 gpio-leds.
It is derived from hardkernel's 3.10 tree.

Signed-off-by: Markus Reichl <m.reichl@fivetechno.de>
---
 arch/arm/boot/dts/exynos5422-odroidxu3.dts | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5422-odroidxu3.dts b/arch/arm/boot/dts/exynos5422-odroidxu3.dts
index a519c86..0a32302 100644
--- a/arch/arm/boot/dts/exynos5422-odroidxu3.dts
+++ b/arch/arm/boot/dts/exynos5422-odroidxu3.dts
@@ -278,6 +278,30 @@
 	rtc@101E0000 {
 		status = "okay";
 	};
+
+	leds {
+		compatible = "gpio-leds";
+		heartbeat {
+			label = "blue:heartbeart";
+			gpios = <&gpb2 2 0>;
+			default-state = "off";
+			linux,default-trigger = "heartbeat";
+		};
+
+		eMMC {
+			label = "green:eMMC";
+			gpios = <&gpb2 1 0>;
+			default-state = "off";
+			linux,default-trigger = "mmc0";
+		};
+
+		microSD {
+			label = "red:microSD";
+			gpios = <&gpx2 3 0>;
+			default-state = "off";
+			linux,default-trigger = "mmc1";
+		};
+	};
 };
 
 &hdmi {
-- 
1.9.1
