From: Vikas Sajjan <vikas.sajjan@linaro.org>
Subject: [PATCH 3/5] ARM: dts: Add FIMD node and display timing node to exynos4412-origen.dts
Date: Mon, 28 Jan 2013 11:14:30 +0530
Message-ID: <1359351872-20518-4-git-send-email-vikas.sajjan@linaro.org>
References: <1359351872-20518-1-git-send-email-vikas.sajjan@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f54.google.com ([209.85.160.54]:57225 "EHLO
	mail-pb0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751644Ab3A1Fov (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 28 Jan 2013 00:44:51 -0500
Received: by mail-pb0-f54.google.com with SMTP id rr4so1257318pbb.27
        for <linux-samsung-soc@vger.kernel.org>; Sun, 27 Jan 2013 21:44:50 -0800 (PST)
In-Reply-To: <1359351872-20518-1-git-send-email-vikas.sajjan@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, thomas.abraham@linaro.org, sachin.kamat@linaro.org, t.figa@samsung.com, sylvester.nawrocki@gmail.com

Adds FIMD DT support to Origen quad board

Signed-off-by: Vikas Sajjan <vikas.sajjan@linaro.org>
---
 arch/arm/boot/dts/exynos4412-origen.dts |   21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4412-origen.dts b/arch/arm/boot/dts/exynos4412-origen.dts
index 4eba374..30655d5 100644
--- a/arch/arm/boot/dts/exynos4412-origen.dts
+++ b/arch/arm/boot/dts/exynos4412-origen.dts
@@ -44,6 +44,27 @@
 		status = "okay";
 	};
 
+       fimd@11c00000 {
+	       samsung,power-domain = <&pd_lcd0>;
+	       pinctrl-0 = <&lcd_sync &lcd_clk &lcd_en &lcd0_data &pwm1_out>;
+	       pinctrl-names = "default";
+	};
+
+	display-timings {
+                native-mode = <&timing0>;
+                timing0: timing@0 {
+			clock-frequency = <50000>;
+			hactive = <1024>;
+			vactive = <600>;
+			hfront-porch = <64>;
+			hback-porch = <16>;
+			hsync-len = <48>;
+			vback-porch = <64>;
+			vfront-porch = <16>;
+			vsync-len = <3>;
+                };
+        };
+
 	serial@13800000 {
 		status = "okay";
 	};
-- 
1.7.9.5
