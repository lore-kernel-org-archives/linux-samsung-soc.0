From: Markus Reichl <m.reichl@fivetechno.de>
Subject: [RESEND] [PATCH 1/1] ARM: dts: Add LEDs on odroid XU3 board
Date: Mon, 13 Apr 2015 10:43:54 +0200
Message-ID: <552B81CA.4090102@fivetechno.de>
Reply-To: m.reichl@fivetechno.de
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from wp126.webpack.hosteurope.de ([80.237.132.133]:57536 "EHLO
	wp126.webpack.hosteurope.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753109AbbDMIoK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 13 Apr 2015 04:44:10 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene@kernel.org>, Anand Moon <linux.amoon@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>

This patch adds the RGB-LED on XU3 as 3 gpio-leds.
It is derived from hardkernel's 3.10 tree.

Tested-by: Anand Moon <linux.amoon@gmail.com>
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

