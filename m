From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 2/2] ARM: dts: Add keypad row entries for exynos4x12
Date: Thu,  6 Dec 2012 15:43:35 +0530
Message-ID: <1354788815-21579-2-git-send-email-sachin.kamat@linaro.org>
References: <1354788815-21579-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:56813 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754704Ab2LFKUg (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 6 Dec 2012 05:20:36 -0500
Received: by mail-pb0-f46.google.com with SMTP id wy7so4391361pbc.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 06 Dec 2012 02:20:35 -0800 (PST)
In-Reply-To: <1354788815-21579-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, sachin.kamat@linaro.org, patches@linaro.org

This patch adds keypad row support for Exynos4x12.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 arch/arm/boot/dts/exynos4x12-pinctrl.dtsi |   56 +++++++++++++++++++++++++++++
 1 files changed, 56 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4x12-pinctrl.dtsi b/arch/arm/boot/dts/exynos4x12-pinctrl.dtsi
index 0b293fb..bdfdf51 100644
--- a/arch/arm/boot/dts/exynos4x12-pinctrl.dtsi
+++ b/arch/arm/boot/dts/exynos4x12-pinctrl.dtsi
@@ -778,6 +778,62 @@
 			samsung,pin-drv = <3>;
 		};
 
+		keypad_row0: keypad-row0 {
+			samsung,pins = "gpx2-0";
+			samsung,pin-function = <3>;
+			samsung,pin-pud = <3>;
+			samsung,pin-drv = <0>;
+		};
+
+		keypad_row1: keypad-row1 {
+			samsung,pins = "gpx2-1";
+			samsung,pin-function = <3>;
+			samsung,pin-pud = <3>;
+			samsung,pin-drv = <0>;
+		};
+
+		keypad_row2: keypad-row2 {
+			samsung,pins = "gpx2-2";
+			samsung,pin-function = <3>;
+			samsung,pin-pud = <3>;
+			samsung,pin-drv = <0>;
+		};
+
+		keypad_row3: keypad-row3 {
+			samsung,pins = "gpx2-3";
+			samsung,pin-function = <3>;
+			samsung,pin-pud = <3>;
+			samsung,pin-drv = <0>;
+		};
+
+		keypad_row4: keypad-row4 {
+			samsung,pins = "gpx2-4";
+			samsung,pin-function = <3>;
+			samsung,pin-pud = <3>;
+			samsung,pin-drv = <0>;
+		};
+
+		keypad_row5: keypad-row5 {
+			samsung,pins = "gpx2-5";
+			samsung,pin-function = <3>;
+			samsung,pin-pud = <3>;
+			samsung,pin-drv = <0>;
+		};
+
+		keypad_row6: keypad-row6 {
+			samsung,pins = "gpx2-6";
+			samsung,pin-function = <3>;
+			samsung,pin-pud = <3>;
+			samsung,pin-drv = <0>;
+		};
+
+		keypad_row7: keypad-row7 {
+			samsung,pins = "gpx2-7";
+			samsung,pin-function = <3>;
+			samsung,pin-pud = <3>;
+			samsung,pin-drv = <0>;
+		};
+
 		keypad_col0: keypad-col0 {
 			samsung,pins = "gpx1-0";
 			samsung,pin-function = <3>;
-- 
1.7.4.1
