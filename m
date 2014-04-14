From: Arun Kumar K <arun.kk@samsung.com>
Subject: [PATCH] ARM: dts: Add atmel trackpad node to 5250 cros
Date: Mon, 14 Apr 2014 12:05:25 +0530
Message-ID: <1397457325-5054-1-git-send-email-arun.kk@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f47.google.com ([209.85.220.47]:35833 "EHLO
	mail-pa0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750807AbaDNGfd (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 14 Apr 2014 02:35:33 -0400
Received: by mail-pa0-f47.google.com with SMTP id lj1so7792063pab.6
        for <linux-samsung-soc@vger.kernel.org>; Sun, 13 Apr 2014 23:35:33 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
Cc: kgene.kim@samsung.com, arunkk.samsung@gmail.com

The newer versions of exynos5250 based Snow boards have
atmel trackpad. Updating relevant nodes for the same.

Signed-off-by: Arun Kumar K <arun.kk@samsung.com>
---
 arch/arm/boot/dts/exynos5250-cros-common.dtsi |   24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5250-cros-common.dtsi b/arch/arm/boot/dts/exynos5250-cros-common.dtsi
index 2c1560d..658f086 100644
--- a/arch/arm/boot/dts/exynos5250-cros-common.dtsi
+++ b/arch/arm/boot/dts/exynos5250-cros-common.dtsi
@@ -28,6 +28,13 @@
 			samsung,pin-pud = <0>;
 		};
 
+		trackpad_irq: trackpad-irq {
+			samsung,pins = "gpx1-2";
+			samsung,pin-function = <0>;
+			samsung,pin-pud = <0>;
+			samsung,pin-drv = <0>;
+		};
+
 		max77686_irq: max77686-irq {
 			samsung,pins = "gpx3-2";
 			samsung,pin-function = <0>;
@@ -191,6 +198,9 @@
 		samsung,i2c-sda-delay = <100>;
 		samsung,i2c-max-bus-freq = <378000>;
 
+		pinctrl-names = "default";
+		pinctrl-0 = <&i2c1_bus &trackpad_irq>;
+
 		trackpad {
 			reg = <0x67>;
 			compatible = "cypress,cyapa";
@@ -198,6 +208,20 @@
 			interrupt-parent = <&gpx1>;
 			wakeup-source;
 		};
+		trackpad-alt {
+			reg = <0x4b>;
+			compatible = "atmel,atmel_mxt_tp";
+			interrupts = <2 0>;
+			interrupt-parent = <&gpx1>;
+			wakeup-source;
+		};
+		trackpad-bootloader {
+			reg = <0x25>;
+			compatible = "atmel,atmel_mxt_tp";
+			interrupts = <2 0>;
+			interrupt-parent = <&gpx1>;
+			wakeup-source;
+		};
 	};
 
 	i2c@12C80000 {
-- 
1.7.9.5
