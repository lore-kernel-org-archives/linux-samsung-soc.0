From: Vikas Sajjan <vikas.sajjan@linaro.org>
Subject: [PATCH v4 3/5] ARM: dts: Add FIMD node and display timing node to exynos4412-origen.dts
Date: Fri, 15 Feb 2013 12:39:58 +0530
Message-ID: <1360912200-26377-4-git-send-email-vikas.sajjan@linaro.org>
References: <1360912200-26377-1-git-send-email-vikas.sajjan@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f54.google.com ([209.85.160.54]:34596 "EHLO
	mail-pb0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753165Ab3BOHK0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 15 Feb 2013 02:10:26 -0500
Received: by mail-pb0-f54.google.com with SMTP id rr4so514663pbb.41
        for <linux-samsung-soc@vger.kernel.org>; Thu, 14 Feb 2013 23:10:25 -0800 (PST)
In-Reply-To: <1360912200-26377-1-git-send-email-vikas.sajjan@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, sachin.kamat@linaro.org, patches@linaro.org

Adds FIMD DT support to Origen quad board

Signed-off-by: Vikas Sajjan <vikas.sajjan@linaro.org>
---
 arch/arm/boot/dts/exynos4412-origen.dts |   22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4412-origen.dts b/arch/arm/boot/dts/exynos4412-origen.dts
index 31e14c4..a6fd41f 100644
--- a/arch/arm/boot/dts/exynos4412-origen.dts
+++ b/arch/arm/boot/dts/exynos4412-origen.dts
@@ -70,6 +70,28 @@
 		status = "okay";
 	};
 
+       fimd@11c00000 {
+		samsung,power-domain = <&pd_lcd0>;
+		pinctrl-0 = <&lcd_sync &lcd_clk &lcd_en &lcd_data24 &pwm1_out>;
+		pinctrl-names = "default";
+		status = "okay";
+	};
+
+	display-timings {
+		native-mode = <&timing0>;
+		timing0: timing@0 {
+			clock-frequency = <50000>;
+			hactive = <1024>;
+			vactive = <600>;
+			hfront-porch = <64>;
+			hback-porch = <16>;
+			hsync-len = <48>;
+			vback-porch = <64>;
+			vfront-porch = <16>;
+			vsync-len = <3>;
+		};
+	};
+
 	serial@13800000 {
 		status = "okay";
 	};
-- 
1.7.9.5
