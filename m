From: Vikas Sajjan <vikas.sajjan@linaro.org>
Subject: [PATCH v2 3/5] ARM: dts: Add FIMD node and display timing node to exynos4412-origen.dts
Date: Wed, 30 Jan 2013 17:29:25 +0530
Message-ID: <1359547167-16560-4-git-send-email-vikas.sajjan@linaro.org>
References: <1359547167-16560-1-git-send-email-vikas.sajjan@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f50.google.com ([209.85.160.50]:44333 "EHLO
	mail-pb0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751845Ab3A3L7t (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 30 Jan 2013 06:59:49 -0500
Received: by mail-pb0-f50.google.com with SMTP id ro8so929064pbb.37
        for <linux-samsung-soc@vger.kernel.org>; Wed, 30 Jan 2013 03:59:48 -0800 (PST)
In-Reply-To: <1359547167-16560-1-git-send-email-vikas.sajjan@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, thomas.abraham@linaro.org, sachin.kamat@linaro.org, t.figa@samsung.com, sylvester.nawrocki@gmail.com

Adds FIMD DT support to Origen quad board

Signed-off-by: Vikas Sajjan <vikas.sajjan@linaro.org>
---
 arch/arm/boot/dts/exynos4412-origen.dts |   22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4412-origen.dts b/arch/arm/boot/dts/exynos4412-origen.dts
index 4eba374..de877c5 100644
--- a/arch/arm/boot/dts/exynos4412-origen.dts
+++ b/arch/arm/boot/dts/exynos4412-origen.dts
@@ -44,6 +44,28 @@
 		status = "okay";
 	};
 
+       fimd@11c00000 {
+		samsung,power-domain = <&pd_lcd0>;
+		pinctrl-0 = <&lcd_sync &lcd_clk &lcd_en &lcd0_data &pwm1_out>;
+		pinctrl-names = "default";
+		status = "okay";
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
