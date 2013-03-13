From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 3/3] ARM: dts: Add keypad entries to SMDK4412
Date: Wed, 13 Mar 2013 10:38:09 +0530
Message-ID: <1363151289-685-3-git-send-email-sachin.kamat@linaro.org>
References: <1363151289-685-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f54.google.com ([209.85.160.54]:47908 "EHLO
	mail-pb0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751147Ab3CMFTE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 13 Mar 2013 01:19:04 -0400
Received: by mail-pb0-f54.google.com with SMTP id rr4so623839pbb.27
        for <linux-samsung-soc@vger.kernel.org>; Tue, 12 Mar 2013 22:19:03 -0700 (PDT)
In-Reply-To: <1363151289-685-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, sachin.kamat@linaro.org, patches@linaro.org

Added keypad node entries to SMDK4412 board DT file.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 arch/arm/boot/dts/exynos4412-smdk4412.dts |   87 +++++++++++++++++++++++++++++
 1 files changed, 87 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4412-smdk4412.dts b/arch/arm/boot/dts/exynos4412-smdk4412.dts
index 539670b..1ee565c 100644
--- a/arch/arm/boot/dts/exynos4412-smdk4412.dts
+++ b/arch/arm/boot/dts/exynos4412-smdk4412.dts
@@ -35,6 +35,93 @@
 		status = "okay";
 	};
 
+	pinctrl@11000000 {
+		keypad_rows: keypad-rows {
+			samsung,pins = "gpx2-0", "gpx2-1", "gpx2-2";
+			samsung,pin-function = <3>;
+			samsung,pin-pud = <3>;
+			samsung,pin-drv = <0>;
+		};
+
+		keypad_cols: keypad-cols {
+			samsung,pins = "gpx1-0", "gpx1-1", "gpx1-2", "gpx1-3",
+				       "gpx1-4", "gpx1-5", "gpx1-6", "gpx1-7";
+			samsung,pin-function = <3>;
+			samsung,pin-pud = <0>;
+			samsung,pin-drv = <0>;
+		};
+	};
+
+	keypad@100A0000 {
+		samsung,keypad-num-rows = <3>;
+		samsung,keypad-num-columns = <8>;
+		linux,keypad-no-autorepeat;
+		linux,keypad-wakeup;
+		pinctrl-0 = <&keypad_rows &keypad_cols>;
+		pinctrl-names = "default";
+		status = "okay";
+
+		key_1 {
+			keypad,row = <1>;
+			keypad,column = <3>;
+			linux,code = <2>;
+		};
+
+		key_2 {
+			keypad,row = <1>;
+			keypad,column = <4>;
+			linux,code = <3>;
+		};
+
+		key_3 {
+			keypad,row = <1>;
+			keypad,column = <5>;
+			linux,code = <4>;
+		};
+
+		key_4 {
+			keypad,row = <1>;
+			keypad,column = <6>;
+			linux,code = <5>;
+		};
+
+		key_5 {
+			keypad,row = <1>;
+			keypad,column = <7>;
+			linux,code = <6>;
+		};
+
+		key_A {
+			keypad,row = <2>;
+			keypad,column = <6>;
+			linux,code = <30>;
+		};
+
+		key_B {
+			keypad,row = <2>;
+			keypad,column = <7>;
+			linux,code = <48>;
+		};
+
+		key_C {
+			keypad,row = <0>;
+			keypad,column = <5>;
+			linux,code = <46>;
+		};
+
+		key_D {
+			keypad,row = <2>;
+			keypad,column = <5>;
+			linux,code = <32>;
+		};
+
+		key_E {
+			keypad,row = <0>;
+			keypad,column = <7>;
+			linux,code = <18>;
+		};
+	};
+
 	sdhci@12530000 {
 		bus-width = <4>;
 		pinctrl-0 = <&sd2_clk &sd2_cmd &sd2_bus4 &sd2_cd>;
-- 
1.7.4.1
