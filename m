From: Ajay Kumar <ajaykumar.rs@samsung.com>
Subject: [PATCH] ARM: dts: enable pwm backlight on exynos5250-snow
Date: Wed, 07 May 2014 18:26:11 +0530
Message-ID: <1399467371-12242-1-git-send-email-ajaykumar.rs@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:42608 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932243AbaEGM53 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 7 May 2014 08:57:29 -0400
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N5700EK4FZQKXA0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 07 May 2014 21:57:26 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: ajaynumb@gmail.com, kgene.kim@samsung.com, tomasz.figa@gmail.com, joshi@samsung.com, prashanth.g@samsung.com, Ajay Kumar <ajaykumar.rs@samsung.com>, Olof Johansson <olof@lixom.net>

Add PWM backlight node for exynos5250 and enable the same on exynos5250
based snow board.

Signed-off-by: Olof Johansson <olof@lixom.net>
Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
---
 arch/arm/boot/dts/exynos5250-pinctrl.dtsi |    7 +++++++
 arch/arm/boot/dts/exynos5250-snow.dts     |    5 +++++
 arch/arm/boot/dts/exynos5250.dtsi         |   10 ++++++++++
 3 files changed, 22 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5250-pinctrl.dtsi b/arch/arm/boot/dts/exynos5250-pinctrl.dtsi
index 9a49e68..2a4680c 100644
--- a/arch/arm/boot/dts/exynos5250-pinctrl.dtsi
+++ b/arch/arm/boot/dts/exynos5250-pinctrl.dtsi
@@ -351,6 +351,13 @@
 			samsung,pin-drv = <0>;
 		};
 
+		backlight_pwm: backlight-pwm {
+			samsung,pins = "gpb2-0";
+			samsung,pin-function = <2>;
+			samsung,pin-pud = <0>;
+			samsung,pin-drv = <0>;
+		};
+
 		i2c7_bus: i2c7-bus {
 			samsung,pins = "gpb2-2", "gpb2-3";
 			samsung,pin-function = <3>;
diff --git a/arch/arm/boot/dts/exynos5250-snow.dts b/arch/arm/boot/dts/exynos5250-snow.dts
index 1ce1088..9fcd3e8 100644
--- a/arch/arm/boot/dts/exynos5250-snow.dts
+++ b/arch/arm/boot/dts/exynos5250-snow.dts
@@ -206,4 +206,9 @@
 			clock-frequency = <24000000>;
 		};
 	};
+
+	backlight {
+		status = "okay";
+	};
+
 };
diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index 3742331..89a9955 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -593,6 +593,16 @@
 		clock-names = "timers";
 	};
 
+	backlight: backlight {
+		compatible = "pwm-backlight";
+		pwms = <&pwm 0 1000000 0>;
+		brightness-levels = <0 100 500 1000 1500 2000 2500 2800>;
+		default-brightness-level = <7>;
+		pinctrl-0 = <&backlight_pwm>;
+		pinctrl-names = "default";
+		status = "disabled";
+	};
+
 	amba {
 		#address-cells = <1>;
 		#size-cells = <1>;
-- 
1.7.9.5
