From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 3/5] ARM: dts: Replace numbers with key code macros on Origen boards
Date: Fri, 23 May 2014 11:38:56 +0530
Message-ID: <1400825338-1272-3-git-send-email-sachin.kamat@linaro.org>
References: <1400825338-1272-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f54.google.com ([209.85.220.54]:50643 "EHLO
	mail-pa0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752164AbaEWGLO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 23 May 2014 02:11:14 -0400
Received: by mail-pa0-f54.google.com with SMTP id bj1so3643858pad.13
        for <linux-samsung-soc@vger.kernel.org>; Thu, 22 May 2014 23:11:13 -0700 (PDT)
In-Reply-To: <1400825338-1272-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, sachin.kamat@linaro.org

Key code macros improve readability.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 arch/arm/boot/dts/exynos4210-origen.dts |   11 ++++++-----
 arch/arm/boot/dts/exynos4412-origen.dts |   13 +++++++------
 2 files changed, 13 insertions(+), 11 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4210-origen.dts b/arch/arm/boot/dts/exynos4210-origen.dts
index f018e2149168..f767c425d0b5 100644
--- a/arch/arm/boot/dts/exynos4210-origen.dts
+++ b/arch/arm/boot/dts/exynos4210-origen.dts
@@ -16,6 +16,7 @@
 
 /dts-v1/;
 #include "exynos4210.dtsi"
+#include <dt-bindings/input/input.h>
 
 / {
 	model = "Insignal Origen evaluation board based on Exynos4210";
@@ -259,35 +260,35 @@
 		up {
 			label = "Up";
 			gpios = <&gpx2 0 1>;
-			linux,code = <103>;
+			linux,code = <KEY_UP>;
 			gpio-key,wakeup;
 		};
 
 		down {
 			label = "Down";
 			gpios = <&gpx2 1 1>;
-			linux,code = <108>;
+			linux,code = <KEY_DOWN>;
 			gpio-key,wakeup;
 		};
 
 		back {
 			label = "Back";
 			gpios = <&gpx1 7 1>;
-			linux,code = <158>;
+			linux,code = <KEY_BACK>;
 			gpio-key,wakeup;
 		};
 
 		home {
 			label = "Home";
 			gpios = <&gpx1 6 1>;
-			linux,code = <102>;
+			linux,code = <KEY_HOME>;
 			gpio-key,wakeup;
 		};
 
 		menu {
 			label = "Menu";
 			gpios = <&gpx1 5 1>;
-			linux,code = <139>;
+			linux,code = <KEY_MENU>;
 			gpio-key,wakeup;
 		};
 	};
diff --git a/arch/arm/boot/dts/exynos4412-origen.dts b/arch/arm/boot/dts/exynos4412-origen.dts
index bd3985b767c4..e925c9fbfb07 100644
--- a/arch/arm/boot/dts/exynos4412-origen.dts
+++ b/arch/arm/boot/dts/exynos4412-origen.dts
@@ -14,6 +14,7 @@
 
 /dts-v1/;
 #include "exynos4412.dtsi"
+#include <dt-bindings/input/input.h>
 
 / {
 	model = "Insignal Origen evaluation board based on Exynos4412";
@@ -84,37 +85,37 @@
 		key_home {
 			keypad,row = <0>;
 			keypad,column = <0>;
-			linux,code = <102>;
+			linux,code = <KEY_HOME>;
 		};
 
 		key_down {
 			keypad,row = <0>;
 			keypad,column = <1>;
-			linux,code = <108>;
+			linux,code = <KEY_DOWN>;
 		};
 
 		key_up {
 			keypad,row = <1>;
 			keypad,column = <0>;
-			linux,code = <103>;
+			linux,code = <KEY_UP>;
 		};
 
 		key_menu {
 			keypad,row = <1>;
 			keypad,column = <1>;
-			linux,code = <139>;
+			linux,code = <KEY_MENU>;
 		};
 
 		key_back {
 			keypad,row = <2>;
 			keypad,column = <0>;
-			linux,code = <158>;
+			linux,code = <KEY_BACK>;
 		};
 
 		key_enter {
 			keypad,row = <2>;
 			keypad,column = <1>;
-			linux,code = <28>;
+			linux,code = <KEY_ENTER>;
 		};
 	};
 
-- 
1.7.9.5
