From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 1/3] ARM: dts: Remove keypad entries from exynos4x12-pinctrl.dtsi
Date: Wed, 13 Mar 2013 10:38:07 +0530
Message-ID: <1363151289-685-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-da0-f49.google.com ([209.85.210.49]:42116 "EHLO
	mail-da0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751147Ab3CMFS6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 13 Mar 2013 01:18:58 -0400
Received: by mail-da0-f49.google.com with SMTP id t11so247262daj.22
        for <linux-samsung-soc@vger.kernel.org>; Tue, 12 Mar 2013 22:18:58 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, sachin.kamat@linaro.org, patches@linaro.org

Keypad pins/lines are board specific and should be added to respective
board dts files.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 arch/arm/boot/dts/exynos4x12-pinctrl.dtsi |   56 -----------------------------
 1 files changed, 0 insertions(+), 56 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4x12-pinctrl.dtsi b/arch/arm/boot/dts/exynos4x12-pinctrl.dtsi
index 099cec7..704290f 100644
--- a/arch/arm/boot/dts/exynos4x12-pinctrl.dtsi
+++ b/arch/arm/boot/dts/exynos4x12-pinctrl.dtsi
@@ -778,62 +778,6 @@
 			samsung,pin-drv = <3>;
 		};
 
-		keypad_col0: keypad-col0 {
-			samsung,pins = "gpl2-0";
-			samsung,pin-function = <3>;
-			samsung,pin-pud = <0>;
-			samsung,pin-drv = <0>;
-		};
-
-		keypad_col1: keypad-col1 {
-			samsung,pins = "gpl2-1";
-			samsung,pin-function = <3>;
-			samsung,pin-pud = <0>;
-			samsung,pin-drv = <0>;
-		};
-
-		keypad_col2: keypad-col2 {
-			samsung,pins = "gpl2-2";
-			samsung,pin-function = <3>;
-			samsung,pin-pud = <0>;
-			samsung,pin-drv = <0>;
-		};
-
-		keypad_col3: keypad-col3 {
-			samsung,pins = "gpl2-3";
-			samsung,pin-function = <3>;
-			samsung,pin-pud = <0>;
-			samsung,pin-drv = <0>;
-		};
-
-		keypad_col4: keypad-col4 {
-			samsung,pins = "gpl2-4";
-			samsung,pin-function = <3>;
-			samsung,pin-pud = <0>;
-			samsung,pin-drv = <0>;
-		};
-
-		keypad_col5: keypad-col5 {
-			samsung,pins = "gpl2-5";
-			samsung,pin-function = <3>;
-			samsung,pin-pud = <0>;
-			samsung,pin-drv = <0>;
-		};
-
-		keypad_col6: keypad-col6 {
-			samsung,pins = "gpl2-6";
-			samsung,pin-function = <3>;
-			samsung,pin-pud = <0>;
-			samsung,pin-drv = <0>;
-		};
-
-		keypad_col7: keypad-col7 {
-			samsung,pins = "gpl2-7";
-			samsung,pin-function = <3>;
-			samsung,pin-pud = <0>;
-			samsung,pin-drv = <0>;
-		};
-
 		cam_port_b: cam-port-b {
 			samsung,pins = "gpm0-0", "gpm0-1", "gpm0-2", "gpm0-3",
 					"gpm0-4", "gpm0-5", "gpm0-6", "gpm0-7",
-- 
1.7.4.1
