From: Daniel Drake <drake@endlessm.com>
Subject: [PATCH 1/2] ARM: dts: Enable PMIC interrupts on ODROID
Date: Wed, 16 Jul 2014 09:50:05 +0100
Message-ID: <1405500606-5752-1-git-send-email-drake@endlessm.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f46.google.com ([74.125.82.46]:40362 "EHLO
	mail-wg0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751091AbaGPIuM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 16 Jul 2014 04:50:12 -0400
Received: by mail-wg0-f46.google.com with SMTP id m15so553543wgh.29
        for <linux-samsung-soc@vger.kernel.org>; Wed, 16 Jul 2014 01:50:11 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com
Cc: linux-samsung-soc@vger.kernel.org, liquid.acid@gmx.net, m.szyprowski@samsung.com, linux-arm-kernel@lists.infradead.org

The ODROID kernel shows that the PMIC interrupt line is hooked up
to pin GPX3-2.

This is needed for the max77686-irq driver to create the PMIC IRQ
domain, which is needed by max77686-rtc.

Signed-off-by: Daniel Drake <drake@endlessm.com>
---
 arch/arm/boot/dts/exynos4412-odroid-common.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4412-odroid-common.dtsi b/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
index 6d6d23c..cb6f55f 100644
--- a/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
+++ b/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
@@ -148,6 +148,10 @@
 
 		max77686: pmic@09 {
 			compatible = "maxim,max77686";
+			interrupt-parent = <&gpx3>;
+			interrupts = <2 0>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&max77686_irq>;
 			reg = <0x09>;
 			#clock-cells = <1>;
 
@@ -368,4 +372,11 @@
 		samsung,pins = "gpx1-3";
 		samsung,pin-pud = <0>;
 	};
+
+	max77686_irq: max77686-irq {
+		samsung,pins = "gpx3-2";
+		samsung,pin-function = <0>;
+		samsung,pin-pud = <0>;
+		samsung,pin-drv = <0>;
+	};
 };
-- 
1.9.1
