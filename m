From: Vikas Sajjan <vikas.sajjan@linaro.org>
Subject: [PATCH v2 2/5] ARM: dts: Adds lcd pinctrl node entries for SAMSUNG EXYNOS4412 SoC
Date: Wed, 30 Jan 2013 17:29:24 +0530
Message-ID: <1359547167-16560-3-git-send-email-vikas.sajjan@linaro.org>
References: <1359547167-16560-1-git-send-email-vikas.sajjan@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f50.google.com ([209.85.160.50]:60165 "EHLO
	mail-pb0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751482Ab3A3L7p (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 30 Jan 2013 06:59:45 -0500
Received: by mail-pb0-f50.google.com with SMTP id ro8so929036pbb.37
        for <linux-samsung-soc@vger.kernel.org>; Wed, 30 Jan 2013 03:59:44 -0800 (PST)
In-Reply-To: <1359547167-16560-1-git-send-email-vikas.sajjan@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, thomas.abraham@linaro.org, sachin.kamat@linaro.org, t.figa@samsung.com, sylvester.nawrocki@gmail.com

From: Sachin Kamat <sachin.kamat@linaro.org>

This patch adds the lcd panel related picntrl nodes for Exynos4412 SoC

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
Signed-off-by: Vikas Sajjan <vikas.sajjan@linaro.org>
---
 arch/arm/boot/dts/exynos4x12-pinctrl.dtsi |   26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4x12-pinctrl.dtsi b/arch/arm/boot/dts/exynos4x12-pinctrl.dtsi
index 8e6115a..33a549c 100644
--- a/arch/arm/boot/dts/exynos4x12-pinctrl.dtsi
+++ b/arch/arm/boot/dts/exynos4x12-pinctrl.dtsi
@@ -354,6 +354,32 @@
 			samsung,pin-drv = <0>;
 		};
 
+		lcd_sync: lcd-sync {
+			samsung,pins = "gpf0-0", "gpf0-1";
+			samsung,pin-function = <2>;
+			samsung,pin-pud = <0>;
+			samsung,pin-drv = <0>;
+		};
+
+		lcd0_data: lcd0-data {
+			samsung,pins = "gpf0-4", "gpf0-5", "gpf0-6", "gpf0-7",
+					"gpf1-0", "gpf1-1", "gpf1-2", "gpf1-3",
+					"gpf1-4", "gpf1-5", "gpf1-6", "gpf1-7",
+					"gpf2-0", "gpf2-1", "gpf2-2", "gpf2-3",
+					"gpf2-4", "gpf2-5", "gpf2-6", "gpf2-7",
+					"gpf3-0", "gpf3-1", "gpf3-2", "gpf3-3";
+			samsung,pin-function = <2>;
+			samsung,pin-pud = <0>;
+			samsung,pin-drv = <0>;
+		};
+
+		lcd_en: lcd-en {
+			samsung,pins = "gpf0-3";
+			samsung,pin-function = <2>;
+			samsung,pin-pud = <0>;
+			samsung,pin-drv = <0>;
+		};
+
 		lcd_clk: lcd-clk {
 			samsung,pins = "gpf0-0", "gpf0-1", "gpf0-2", "gpf0-3";
 			samsung,pin-function = <2>;
-- 
1.7.9.5
