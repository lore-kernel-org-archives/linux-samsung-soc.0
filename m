From: Beomho Seo <beomho.seo@samsung.com>
Subject: [PATCH] ARM: dts: use key code macros on exynos4 series boards
Date: Wed, 11 Jun 2014 22:01:49 +0900
Message-ID: <1402491709-29490-1-git-send-email-beomho.seo@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:38567 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750929AbaFKNB7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 11 Jun 2014 09:01:59 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: kgene.kim@samsung.com, t.figa@samsung.com, sachin.kamat@linaro.org, myungjoo.ham@samsung.com, cw00.choi@samsung.com, jh80.chung@samsung.com, Beomho Seo <beomho.seo@samsung.com>

This patch use key code macros on exynos4 series boards.
Using macros improve readability on device tree.

Signed-off-by: Beomho Seo <beomho.seo@samsung.com>
---
 arch/arm/boot/dts/exynos4.dtsi                  |    1 +
 arch/arm/boot/dts/exynos4210-origen.dts         |    1 -
 arch/arm/boot/dts/exynos4210-smdkv310.dts       |   20 ++++++++++----------
 arch/arm/boot/dts/exynos4210-trats.dts          |    8 ++++----
 arch/arm/boot/dts/exynos4210-universal_c210.dts |   12 ++++++------
 arch/arm/boot/dts/exynos4412-smdk4412.dts       |   20 ++++++++++----------
 arch/arm/boot/dts/exynos4412-trats2.dts         |    8 ++++----
 7 files changed, 35 insertions(+), 35 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4.dtsi b/arch/arm/boot/dts/exynos4.dtsi
index b8ece4b..00bf06e 100644
--- a/arch/arm/boot/dts/exynos4.dtsi
+++ b/arch/arm/boot/dts/exynos4.dtsi
@@ -21,6 +21,7 @@
 
 #include <dt-bindings/clock/exynos4.h>
 #include <dt-bindings/clock/exynos-audss-clk.h>
+#include <dt-bindings/input/input.h>
 #include "skeleton.dtsi"
 
 / {
diff --git a/arch/arm/boot/dts/exynos4210-origen.dts b/arch/arm/boot/dts/exynos4210-origen.dts
index f767c42..b8440da 100644
--- a/arch/arm/boot/dts/exynos4210-origen.dts
+++ b/arch/arm/boot/dts/exynos4210-origen.dts
@@ -16,7 +16,6 @@
 
 /dts-v1/;
 #include "exynos4210.dtsi"
-#include <dt-bindings/input/input.h>
 
 / {
 	model = "Insignal Origen evaluation board based on Exynos4210";
diff --git a/arch/arm/boot/dts/exynos4210-smdkv310.dts b/arch/arm/boot/dts/exynos4210-smdkv310.dts
index 636d166..cc78ca2 100644
--- a/arch/arm/boot/dts/exynos4210-smdkv310.dts
+++ b/arch/arm/boot/dts/exynos4210-smdkv310.dts
@@ -91,61 +91,61 @@
 		key_1 {
 			keypad,row = <0>;
 			keypad,column = <3>;
-			linux,code = <2>;
+			linux,code = <KEY_1>;
 		};
 
 		key_2 {
 			keypad,row = <0>;
 			keypad,column = <4>;
-			linux,code = <3>;
+			linux,code = <KEY_2>;
 		};
 
 		key_3 {
 			keypad,row = <0>;
 			keypad,column = <5>;
-			linux,code = <4>;
+			linux,code = <KEY_3>;
 		};
 
 		key_4 {
 			keypad,row = <0>;
 			keypad,column = <6>;
-			linux,code = <5>;
+			linux,code = <KEY_4>;
 		};
 
 		key_5 {
 			keypad,row = <0>;
 			keypad,column = <7>;
-			linux,code = <6>;
+			linux,code = <KEY_5>;
 		};
 
 		key_a {
 			keypad,row = <1>;
 			keypad,column = <3>;
-			linux,code = <30>;
+			linux,code = <KEY_A>;
 		};
 
 		key_b {
 			keypad,row = <1>;
 			keypad,column = <4>;
-			linux,code = <48>;
+			linux,code = <KEY_B>;
 		};
 
 		key_c {
 			keypad,row = <1>;
 			keypad,column = <5>;
-			linux,code = <46>;
+			linux,code = <KEY_C>;
 		};
 
 		key_d {
 			keypad,row = <1>;
 			keypad,column = <6>;
-			linux,code = <32>;
+			linux,code = <KEY_D>;
 		};
 
 		key_e {
 			keypad,row = <1>;
 			keypad,column = <7>;
-			linux,code = <18>;
+			linux,code = <KEY_E>;
 		};
 	};
 
diff --git a/arch/arm/boot/dts/exynos4210-trats.dts b/arch/arm/boot/dts/exynos4210-trats.dts
index f516da9..0d9d143 100644
--- a/arch/arm/boot/dts/exynos4210-trats.dts
+++ b/arch/arm/boot/dts/exynos4210-trats.dts
@@ -128,21 +128,21 @@
 
 		vol-down-key {
 			gpios = <&gpx2 1 1>;
-			linux,code = <114>;
+			linux,code = <KEY_VOLUMEDOWN>;
 			label = "volume down";
 			debounce-interval = <10>;
 		};
 
 		vol-up-key {
 			gpios = <&gpx2 0 1>;
-			linux,code = <115>;
+			linux,code = <KEY_VOLUMEUP>;
 			label = "volume up";
 			debounce-interval = <10>;
 		};
 
 		power-key {
 			gpios = <&gpx2 7 1>;
-			linux,code = <116>;
+			linux,code = <KEY_POWER>;
 			label = "power";
 			debounce-interval = <10>;
 			gpio-key,wakeup;
@@ -150,7 +150,7 @@
 
 		ok-key {
 			gpios = <&gpx3 5 1>;
-			linux,code = <352>;
+			linux,code = <KEY_OK>;
 			label = "ok";
 			debounce-interval = <10>;
 		};
diff --git a/arch/arm/boot/dts/exynos4210-universal_c210.dts b/arch/arm/boot/dts/exynos4210-universal_c210.dts
index d50eb3a..43a7bba 100644
--- a/arch/arm/boot/dts/exynos4210-universal_c210.dts
+++ b/arch/arm/boot/dts/exynos4210-universal_c210.dts
@@ -132,21 +132,21 @@
 
 		vol-up-key {
 			gpios = <&gpx2 0 1>;
-			linux,code = <115>;
+			linux,code = <KEY_VOLUMEUP>;
 			label = "volume up";
 			debounce-interval = <1>;
 		};
 
 		vol-down-key {
 			gpios = <&gpx2 1 1>;
-			linux,code = <114>;
+			linux,code = <KEY_VOLUMEDOWN>;
 			label = "volume down";
 			debounce-interval = <1>;
 		};
 
 		config-key {
 			gpios = <&gpx2 2 1>;
-			linux,code = <171>;
+			linux,code = <KEY_CONFIG>;
 			label = "config";
 			debounce-interval = <1>;
 			gpio-key,wakeup;
@@ -154,14 +154,14 @@
 
 		camera-key {
 			gpios = <&gpx2 3 1>;
-			linux,code = <212>;
+			linux,code = <KEY_CAMERA>;
 			label = "camera";
 			debounce-interval = <1>;
 		};
 
 		power-key {
 			gpios = <&gpx2 7 1>;
-			linux,code = <116>;
+			linux,code = <KEY_POWER>;
 			label = "power";
 			debounce-interval = <1>;
 			gpio-key,wakeup;
@@ -169,7 +169,7 @@
 
 		ok-key {
 			gpios = <&gpx3 5 1>;
-			linux,code = <352>;
+			linux,code = <KEY_OK>;
 			label = "ok";
 			debounce-interval = <1>;
 		};
diff --git a/arch/arm/boot/dts/exynos4412-smdk4412.dts b/arch/arm/boot/dts/exynos4412-smdk4412.dts
index ded0b70..5ff6985 100644
--- a/arch/arm/boot/dts/exynos4412-smdk4412.dts
+++ b/arch/arm/boot/dts/exynos4412-smdk4412.dts
@@ -60,61 +60,61 @@
 		key_1 {
 			keypad,row = <1>;
 			keypad,column = <3>;
-			linux,code = <2>;
+			linux,code = <KEY_1>;
 		};
 
 		key_2 {
 			keypad,row = <1>;
 			keypad,column = <4>;
-			linux,code = <3>;
+			linux,code = <KEY_2>;
 		};
 
 		key_3 {
 			keypad,row = <1>;
 			keypad,column = <5>;
-			linux,code = <4>;
+			linux,code = <KEY_3>;
 		};
 
 		key_4 {
 			keypad,row = <1>;
 			keypad,column = <6>;
-			linux,code = <5>;
+			linux,code = <KEY_4>;
 		};
 
 		key_5 {
 			keypad,row = <1>;
 			keypad,column = <7>;
-			linux,code = <6>;
+			linux,code = <KEY_5>;
 		};
 
 		key_A {
 			keypad,row = <2>;
 			keypad,column = <6>;
-			linux,code = <30>;
+			linux,code = <KEY_A>;
 		};
 
 		key_B {
 			keypad,row = <2>;
 			keypad,column = <7>;
-			linux,code = <48>;
+			linux,code = <KEY_B>;
 		};
 
 		key_C {
 			keypad,row = <0>;
-			keypad,column = <5>;
+			keypad,column = <KEY_C>;
 			linux,code = <46>;
 		};
 
 		key_D {
 			keypad,row = <2>;
 			keypad,column = <5>;
-			linux,code = <32>;
+			linux,code = <KEY_D>;
 		};
 
 		key_E {
 			keypad,row = <0>;
 			keypad,column = <7>;
-			linux,code = <18>;
+			linux,code = <KEY_E>;
 		};
 	};
 
diff --git a/arch/arm/boot/dts/exynos4412-trats2.dts b/arch/arm/boot/dts/exynos4412-trats2.dts
index 106a705..718436d 100644
--- a/arch/arm/boot/dts/exynos4412-trats2.dts
+++ b/arch/arm/boot/dts/exynos4412-trats2.dts
@@ -115,21 +115,21 @@
 
 		key-down {
 			gpios = <&gpx3 3 1>;
-			linux,code = <114>;
+			linux,code = <KEY_VOLUMEDOWN>;
 			label = "volume down";
 			debounce-interval = <10>;
 		};
 
 		key-up {
 			gpios = <&gpx2 2 1>;
-			linux,code = <115>;
+			linux,code = <KEY_VOLUMEUP>;
 			label = "volume up";
 			debounce-interval = <10>;
 		};
 
 		key-power {
 			gpios = <&gpx2 7 1>;
-			linux,code = <116>;
+			linux,code = <KEY_POWER>;
 			label = "power";
 			debounce-interval = <10>;
 			gpio-key,wakeup;
@@ -137,7 +137,7 @@
 
 		key-ok {
 			gpios = <&gpx0 1 1>;
-			linux,code = <139>;
+			linux,code = <KEY_MENU>;
 			label = "ok";
 			debounce-inteval = <10>;
 			gpio-key,wakeup;
-- 
1.7.9.5
