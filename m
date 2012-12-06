From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 1/2] ARM: dts: Fix gpio pin names of keypad columns in exynos4x12-pinctrl
Date: Thu,  6 Dec 2012 15:43:34 +0530
Message-ID: <1354788815-21579-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f46.google.com ([209.85.220.46]:65171 "EHLO
	mail-pa0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754149Ab2LFKUd (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 6 Dec 2012 05:20:33 -0500
Received: by mail-pa0-f46.google.com with SMTP id bh2so4335222pad.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 06 Dec 2012 02:20:32 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, sachin.kamat@linaro.org, patches@linaro.org, Tomasz Figa <t.figa@samsung.com>

Keypad columns are connected to gpx1 pins on 4x12.

Cc: Tomasz Figa <t.figa@samsung.com>
Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 arch/arm/boot/dts/exynos4x12-pinctrl.dtsi |   16 ++++++++--------
 1 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4x12-pinctrl.dtsi b/arch/arm/boot/dts/exynos4x12-pinctrl.dtsi
index 8e6115a..0b293fb 100644
--- a/arch/arm/boot/dts/exynos4x12-pinctrl.dtsi
+++ b/arch/arm/boot/dts/exynos4x12-pinctrl.dtsi
@@ -779,56 +779,56 @@
 		};
 
 		keypad_col0: keypad-col0 {
-			samsung,pins = "gpl2-0";
+			samsung,pins = "gpx1-0";
 			samsung,pin-function = <3>;
 			samsung,pin-pud = <0>;
 			samsung,pin-drv = <0>;
 		};
 
 		keypad_col1: keypad-col1 {
-			samsung,pins = "gpl2-1";
+			samsung,pins = "gpx1-1";
 			samsung,pin-function = <3>;
 			samsung,pin-pud = <0>;
 			samsung,pin-drv = <0>;
 		};
 
 		keypad_col2: keypad-col2 {
-			samsung,pins = "gpl2-2";
+			samsung,pins = "gpx1-2";
 			samsung,pin-function = <3>;
 			samsung,pin-pud = <0>;
 			samsung,pin-drv = <0>;
 		};
 
 		keypad_col3: keypad-col3 {
-			samsung,pins = "gpl2-3";
+			samsung,pins = "gpx1-3";
 			samsung,pin-function = <3>;
 			samsung,pin-pud = <0>;
 			samsung,pin-drv = <0>;
 		};
 
 		keypad_col4: keypad-col4 {
-			samsung,pins = "gpl2-4";
+			samsung,pins = "gpx1-4";
 			samsung,pin-function = <3>;
 			samsung,pin-pud = <0>;
 			samsung,pin-drv = <0>;
 		};
 
 		keypad_col5: keypad-col5 {
-			samsung,pins = "gpl2-5";
+			samsung,pins = "gpx1-5";
 			samsung,pin-function = <3>;
 			samsung,pin-pud = <0>;
 			samsung,pin-drv = <0>;
 		};
 
 		keypad_col6: keypad-col6 {
-			samsung,pins = "gpl2-6";
+			samsung,pins = "gpx1-6";
 			samsung,pin-function = <3>;
 			samsung,pin-pud = <0>;
 			samsung,pin-drv = <0>;
 		};
 
 		keypad_col7: keypad-col7 {
-			samsung,pins = "gpl2-7";
+			samsung,pins = "gpx1-7";
 			samsung,pin-function = <3>;
 			samsung,pin-pud = <0>;
 			samsung,pin-drv = <0>;
-- 
1.7.4.1
