From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: [PATCH] ARM: dts: exynos4412-odroid: add 'rtc_src' clock to rtc node
Date: Fri, 20 Mar 2015 02:29:12 +0100
Message-ID: <1426814952-13458-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:52152 "EHLO
	smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1750731AbbCTB3W (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 19 Mar 2015 21:29:22 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: m.reichl@fivetechno.de, javier.martinez@collabora.co.uk

From: Markus Reichl <m.reichl@fivetechno.de>

The Exynos4412 SoC has a s3c6410 RTC where the source clock
is now a mandatory property.

This patch fixes probe failure of s3c-rtc on Odroid-X2/U2/U3 boards.

Signed-off-by: Markus Reichl <m.reichl@fivetechno.de>
Tested-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
---
 arch/arm/boot/dts/exynos4412-odroid-common.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4412-odroid-common.dtsi b/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
index 1ff4c88..0a8e6aa4 100644
--- a/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
+++ b/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
@@ -9,6 +9,7 @@
 
 #include <dt-bindings/sound/samsung-i2s.h>
 #include <dt-bindings/input/input.h>
+#include <dt-bindings/clock/maxim,max77686.h>
 #include "exynos4412.dtsi"
 
 / {
@@ -143,6 +144,8 @@
 
 	rtc@10070000 {
 		status = "okay";
+		clocks = <&clock CLK_RTC>, <&max77686 MAX77686_CLK_AP>;
+		clock-names = "rtc", "rtc_src";
 	};
 
 	g2d@10800000 {
-- 
2.0.5
