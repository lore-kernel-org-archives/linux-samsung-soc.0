From: Kamil Debski <k.debski@samsung.com>
Subject: [PATCH] ARM: dts: Add pwm-fan node to the Odroid-U3 board
Date: Mon, 03 Nov 2014 15:43:24 +0100
Message-ID: <1415025804-24274-1-git-send-email-k.debski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:15518 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752209AbaKCOnl (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 3 Nov 2014 09:43:41 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, Kamil Debski <k.debski@samsung.com>

Add pwm-fan node to the Odroid-U3 board file to enable PWM control of the
cooling fan.

Signed-off-by: Kamil Debski <k.debski@samsung.com>
---
 arch/arm/boot/dts/exynos4412-odroidu3.dts |   13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4412-odroidu3.dts b/arch/arm/boot/dts/exynos4412-odroidu3.dts
index c8a64be..764bda4 100644
--- a/arch/arm/boot/dts/exynos4412-odroidu3.dts
+++ b/arch/arm/boot/dts/exynos4412-odroidu3.dts
@@ -31,6 +31,19 @@
 			linux,default-trigger = "heartbeat";
 		};
 	};
+
+	pwm: pwm@139D0000 {
+		pinctrl-0 = <&pwm0_out>;
+		pinctrl-names = "default";
+		samsung,pwm-outputs = <0>;
+		status = "okay";
+	};
+
+	pwm-fan {
+		compatible = "pwm-fan";
+		status = "okay";
+		pwms = <&pwm 0 10000 0>;
+	};
 };
 
 &usb3503 {
-- 
1.7.9.5
