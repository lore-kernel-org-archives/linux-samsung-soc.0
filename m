From: Vikas Sajjan <vikas.sajjan@linaro.org>
Subject: [PATCH v3 2/5] ARM: dts: Adds lcd pinctrl node entries for SAMSUNG EXYNOS4412 SoC
Date: Fri,  1 Feb 2013 17:02:53 +0530
Message-ID: <1359718376-21947-3-git-send-email-vikas.sajjan@linaro.org>
References: <1359718376-21947-1-git-send-email-vikas.sajjan@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-da0-f46.google.com ([209.85.210.46]:41088 "EHLO
	mail-da0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755681Ab3BALdJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 1 Feb 2013 06:33:09 -0500
Received: by mail-da0-f46.google.com with SMTP id p5so1713317dak.5
        for <linux-samsung-soc@vger.kernel.org>; Fri, 01 Feb 2013 03:33:08 -0800 (PST)
In-Reply-To: <1359718376-21947-1-git-send-email-vikas.sajjan@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, sachin.kamat@linaro.org

From: Sachin Kamat <sachin.kamat@linaro.org>

This patch adds the lcd panel related picntrl nodes for Exynos4412 SoC

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
Signed-off-by: Vikas Sajjan <vikas.sajjan@linaro.org>
---
 arch/arm/boot/dts/exynos4x12-pinctrl.dtsi |   14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4x12-pinctrl.dtsi b/arch/arm/boot/dts/exynos4x12-pinctrl.dtsi
index 8e6115a..332fc33 100644
--- a/arch/arm/boot/dts/exynos4x12-pinctrl.dtsi
+++ b/arch/arm/boot/dts/exynos4x12-pinctrl.dtsi
@@ -354,6 +354,20 @@
 			samsung,pin-drv = <0>;
 		};
 
+		lcd_sync: lcd-sync {
+			samsung,pins = "gpf0-0", "gpf0-1";
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
