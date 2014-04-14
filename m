From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 2/4] ARM: dts: exynos5250-snow: add pinctrl for EC irq
Date: Mon, 14 Apr 2014 18:46:05 +0530
Message-ID: <1397481367-12652-2-git-send-email-sachin.kamat@linaro.org>
References: <1397481367-12652-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:57891 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754142AbaDNNRA (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 14 Apr 2014 09:17:00 -0400
Received: by mail-pb0-f46.google.com with SMTP id rq2so8204027pbb.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 14 Apr 2014 06:17:00 -0700 (PDT)
In-Reply-To: <1397481367-12652-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, dianders@chromium.org, sachin.kamat@linaro.org, joshi@samsung.com, ajaykumar.rs@samsung.com

From: Doug Anderson <dianders@chromium.org>

Added pinctrl node for embedded controller (EC) IRQ
on Snow board.

Signed-off-by: Doug Anderson <dianders@chromium.org>
Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 arch/arm/boot/dts/exynos5250-snow.dts |    9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5250-snow.dts b/arch/arm/boot/dts/exynos5250-snow.dts
index 32715b3..469c85d 100644
--- a/arch/arm/boot/dts/exynos5250-snow.dts
+++ b/arch/arm/boot/dts/exynos5250-snow.dts
@@ -25,6 +25,13 @@
 	};
 
 	pinctrl@11400000 {
+		ec_irq: ec-irq {
+			samsung,pins = "gpx1-6";
+			samsung,pin-function = <0>;
+			samsung,pin-pud = <0>;
+			samsung,pin-drv = <0>;
+		};
+
 		sd3_clk: sd3-clk {
 			samsung,pin-drv = <0>;
 		};
@@ -101,6 +108,8 @@
 				reg = <0x1e>;
 				interrupts = <6 0>;
 				interrupt-parent = <&gpx1>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&ec_irq>;
 				wakeup-source;
 
 				keyboard-controller {
-- 
1.7.9.5
