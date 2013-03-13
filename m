From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 2/3] ARM: dts: Add keypad entries to Exynos4412 based Origen
Date: Wed, 13 Mar 2013 10:38:08 +0530
Message-ID: <1363151289-685-2-git-send-email-sachin.kamat@linaro.org>
References: <1363151289-685-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f44.google.com ([209.85.160.44]:33609 "EHLO
	mail-pb0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751147Ab3CMFTB (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 13 Mar 2013 01:19:01 -0400
Received: by mail-pb0-f44.google.com with SMTP id wz12so628600pbc.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 12 Mar 2013 22:19:00 -0700 (PDT)
In-Reply-To: <1363151289-685-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, sachin.kamat@linaro.org, patches@linaro.org

Added keypad node entries to Exynos4412 based Origen board DT file.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 arch/arm/boot/dts/exynos4412-origen.dts |   62 +++++++++++++++++++++++++++++++
 1 files changed, 62 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4412-origen.dts b/arch/arm/boot/dts/exynos4412-origen.dts
index 31e14c4..65e6039 100644
--- a/arch/arm/boot/dts/exynos4412-origen.dts
+++ b/arch/arm/boot/dts/exynos4412-origen.dts
@@ -36,6 +36,68 @@
 		enable-active-high;
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
+			samsung,pins = "gpx1-0", "gpx1-1";
+			samsung,pin-function = <3>;
+			samsung,pin-pud = <0>;
+			samsung,pin-drv = <0>;
+		};
+	};
+
+	keypad@100A0000 {
+		samsung,keypad-num-rows = <3>;
+		samsung,keypad-num-columns = <2>;
+		linux,keypad-no-autorepeat;
+		linux,keypad-wakeup;
+		pinctrl-0 = <&keypad_rows &keypad_cols>;
+		pinctrl-names = "default";
+		status = "okay";
+
+		key_home {
+			keypad,row = <0>;
+			keypad,column = <0>;
+			linux,code = <102>;
+		};
+
+		key_down {
+			keypad,row = <0>;
+			keypad,column = <1>;
+			linux,code = <108>;
+		};
+
+		key_up {
+			keypad,row = <1>;
+			keypad,column = <0>;
+			linux,code = <103>;
+		};
+
+		key_menu {
+			keypad,row = <1>;
+			keypad,column = <1>;
+			linux,code = <139>;
+		};
+
+		key_back {
+			keypad,row = <2>;
+			keypad,column = <0>;
+			linux,code = <158>;
+		};
+
+		key_enter {
+			keypad,row = <2>;
+			keypad,column = <1>;
+			linux,code = <28>;
+		};
+	};
+
 	sdhci@12530000 {
 		bus-width = <4>;
 		pinctrl-0 = <&sd2_clk &sd2_cmd &sd2_bus4 &sd2_cd>;
-- 
1.7.4.1
