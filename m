From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 4/5] ARM: dts: Replace numbers with key code macros on Arndale board
Date: Fri, 23 May 2014 11:38:57 +0530
Message-ID: <1400825338-1272-4-git-send-email-sachin.kamat@linaro.org>
References: <1400825338-1272-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f49.google.com ([209.85.220.49]:46399 "EHLO
	mail-pa0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752164AbaEWGLQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 23 May 2014 02:11:16 -0400
Received: by mail-pa0-f49.google.com with SMTP id lj1so3619513pab.36
        for <linux-samsung-soc@vger.kernel.org>; Thu, 22 May 2014 23:11:16 -0700 (PDT)
In-Reply-To: <1400825338-1272-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, sachin.kamat@linaro.org

Key code macros improve readability.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 arch/arm/boot/dts/exynos5250-arndale.dts |   13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5250-arndale.dts b/arch/arm/boot/dts/exynos5250-arndale.dts
index cde19c818667..d0de1f50d15b 100644
--- a/arch/arm/boot/dts/exynos5250-arndale.dts
+++ b/arch/arm/boot/dts/exynos5250-arndale.dts
@@ -12,6 +12,7 @@
 /dts-v1/;
 #include "exynos5250.dtsi"
 #include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/input/input.h>
 
 / {
 	model = "Insignal Arndale evaluation board based on EXYNOS5250";
@@ -445,42 +446,42 @@
 		menu {
 			label = "SW-TACT2";
 			gpios = <&gpx1 4 1>;
-			linux,code = <139>;
+			linux,code = <KEY_MENU>;
 			gpio-key,wakeup;
 		};
 
 		home {
 			label = "SW-TACT3";
 			gpios = <&gpx1 5 1>;
-			linux,code = <102>;
+			linux,code = <KEY_HOME>;
 			gpio-key,wakeup;
 		};
 
 		up {
 			label = "SW-TACT4";
 			gpios = <&gpx1 6 1>;
-			linux,code = <103>;
+			linux,code = <KEY_UP>;
 			gpio-key,wakeup;
 		};
 
 		down {
 			label = "SW-TACT5";
 			gpios = <&gpx1 7 1>;
-			linux,code = <108>;
+			linux,code = <KEY_DOWN>;
 			gpio-key,wakeup;
 		};
 
 		back {
 			label = "SW-TACT6";
 			gpios = <&gpx2 0 1>;
-			linux,code = <158>;
+			linux,code = <KEY_BACK>;
 			gpio-key,wakeup;
 		};
 
 		wakeup {
 			label = "SW-TACT7";
 			gpios = <&gpx2 1 1>;
-			linux,code = <143>;
+			linux,code = <KEY_WAKEUP>;
 			gpio-key,wakeup;
 		};
 	};
-- 
1.7.9.5
