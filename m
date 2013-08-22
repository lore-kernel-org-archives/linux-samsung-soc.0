From: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
Subject: [PATCH] arm: dts: fix NTC thermistor device nodes for cros5250
Date: Thu, 22 Aug 2013 17:18:34 +0530
Message-ID: <1377172114-8312-1-git-send-email-ch.naveen@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:34330 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753221Ab3HVLyI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 22 Aug 2013 07:54:08 -0400
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MRX00ELQL26M3M0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 22 Aug 2013 20:54:06 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com, ben-linux@fluff.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: naveenkrishna.ch@gmail.com

This patch fixes NTC devices nodes connected to ADC channel 3, 4, 5 and 6
on exynos5250 based snow device.

Signed-off-by: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
Signed-off-by: Doug Anderson <dianders@chromium.org>
---
 arch/arm/boot/dts/cros5250-common.dtsi |   33 ++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/arm/boot/dts/cros5250-common.dtsi b/arch/arm/boot/dts/cros5250-common.dtsi
index dc259e8b..26bc25a 100644
--- a/arch/arm/boot/dts/cros5250-common.dtsi
+++ b/arch/arm/boot/dts/cros5250-common.dtsi
@@ -313,4 +313,37 @@
 			gpio-key,wakeup;
 		};
 	};
+
+	adc@12D10000 {
+		vdd-supply = <&buck5_reg>;
+
+		ncp15wb473@3 {
+			compatible = "ntc,ncp15wb473";
+			pullup-uv = <1800000>;
+			pullup-ohm = <47000>;
+			pulldown-ohm = <0>;
+			io-channels = <&adc 3>;
+		};
+		ncp15wb473@4 {
+			compatible = "ntc,ncp15wb473";
+			pullup-uv = <1800000>;
+			pullup-ohm = <47000>;
+			pulldown-ohm = <0>;
+			io-channels = <&adc 4>;
+		};
+		ncp15wb473@5 {
+			compatible = "ntc,ncp15wb473";
+			pullup-uv = <1800000>;
+			pullup-ohm = <47000>;
+			pulldown-ohm = <0>;
+			io-channels = <&adc 5>;
+		};
+		ncp15wb473@6 {
+			compatible = "ntc,ncp15wb473";
+			pullup-uv = <1800000>;
+			pullup-ohm = <47000>;
+			pulldown-ohm = <0>;
+			io-channels = <&adc 6>;
+		};
+	};
 };
-- 
1.7.9.5
