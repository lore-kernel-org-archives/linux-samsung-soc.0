From: Arun Kumar K <arun.kk@samsung.com>
Subject: [PATCH] ARM: dts: Add pwmX_out pinctrl nodes to Exynos5420
Date: Fri,  2 May 2014 18:18:57 +0530
Message-ID: <1399034937-24683-1-git-send-email-arun.kk@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f48.google.com ([209.85.220.48]:59303 "EHLO
	mail-pa0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752383AbaEBMtK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 2 May 2014 08:49:10 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: kgene.kim@samsung.com, t.figa@samsung.com, dianders@chromium.org, arunkk.samsung@gmail.com

Adds the PWM nodes to 5420 pinctrl dtsi file.

Signed-off-by: Arun Kumar K <arun.kk@samsung.com>
---
 arch/arm/boot/dts/exynos5420-pinctrl.dtsi |   28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5420-pinctrl.dtsi b/arch/arm/boot/dts/exynos5420-pinctrl.dtsi
index e62c8eb..ba686e4 100644
--- a/arch/arm/boot/dts/exynos5420-pinctrl.dtsi
+++ b/arch/arm/boot/dts/exynos5420-pinctrl.dtsi
@@ -624,6 +624,34 @@
 			samsung,pin-drv = <0>;
 		};
 
+		pwm0_out: pwm0-out {
+			samsung,pins = "gpb2-0";
+			samsung,pin-function = <2>;
+			samsung,pin-pud = <0>;
+			samsung,pin-drv = <0>;
+		};
+
+		pwm1_out: pwm1-out {
+			samsung,pins = "gpb2-1";
+			samsung,pin-function = <2>;
+			samsung,pin-pud = <0>;
+			samsung,pin-drv = <0>;
+		};
+
+		pwm2_out: pwm2-out {
+			samsung,pins = "gpb2-2";
+			samsung,pin-function = <2>;
+			samsung,pin-pud = <0>;
+			samsung,pin-drv = <0>;
+		};
+
+		pwm3_out: pwm3-out {
+			samsung,pins = "gpb2-3";
+			samsung,pin-function = <2>;
+			samsung,pin-pud = <0>;
+			samsung,pin-drv = <0>;
+		};
+
 		i2c7_hs_bus: i2c7-hs-bus {
 			samsung,pins = "gpb2-2", "gpb2-3";
 			samsung,pin-function = <3>;
-- 
1.7.9.5
