From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH] ARM: dts: exynos: Remove redundant interrupt properties in
 gpio-keys
Date: Fri, 15 Sep 2017 08:42:47 +0200
Message-ID: <1505457767-24104-1-git-send-email-m.szyprowski@samsung.com>
References: <CGME20170915064253eucas1p24582912a3103187d751dde26a0aa0300@eucas1p2.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:44261 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751135AbdIOGm6 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 15 Sep 2017 02:42:58 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

GPIO keys don't need interrupt property. Interrupt number can be derived
directly from the GPIO pin definition, so remove redundant 'interrupts'
and 'interrupt-parent' properties from gpio-keys nodes.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm/boot/dts/exynos4412-odroid-common.dtsi | 2 --
 arch/arm/boot/dts/exynos4412-odroidx.dts        | 2 --
 2 files changed, 4 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4412-odroid-common.dtsi b/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
index 102acd78be15..ce20f30db268 100644
--- a/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
+++ b/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
@@ -31,8 +31,6 @@
 		pinctrl-0 = <&gpio_power_key>;
 
 		power_key {
-			interrupt-parent = <&gpx1>;
-			interrupts = <3 IRQ_TYPE_NONE>;
 			gpios = <&gpx1 3 GPIO_ACTIVE_LOW>;
 			linux,code = <KEY_POWER>;
 			label = "power key";
diff --git a/arch/arm/boot/dts/exynos4412-odroidx.dts b/arch/arm/boot/dts/exynos4412-odroidx.dts
index 97882267ef09..acf48a018e5e 100644
--- a/arch/arm/boot/dts/exynos4412-odroidx.dts
+++ b/arch/arm/boot/dts/exynos4412-odroidx.dts
@@ -43,8 +43,6 @@
 		pinctrl-0 = <&gpio_power_key &gpio_home_key>;
 
 		home_key {
-			interrupt-parent = <&gpx2>;
-			interrupts = <2 IRQ_TYPE_NONE>;
 			gpios = <&gpx2 2 GPIO_ACTIVE_HIGH>;
 			linux,code = <KEY_HOME>;
 			label = "home key";
-- 
1.9.1
