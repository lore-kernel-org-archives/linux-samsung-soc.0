From: Vikas Sajjan <vikas.sajjan@linaro.org>
Subject: [PATCH v3 3/5] ARM: dts: Add FIMD node and display timing node to exynos4412-origen.dts
Date: Fri,  1 Feb 2013 17:02:54 +0530
Message-ID: <1359718376-21947-4-git-send-email-vikas.sajjan@linaro.org>
References: <1359718376-21947-1-git-send-email-vikas.sajjan@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-da0-f45.google.com ([209.85.210.45]:34487 "EHLO
	mail-da0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755681Ab3BALdM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 1 Feb 2013 06:33:12 -0500
Received: by mail-da0-f45.google.com with SMTP id w4so1714754dam.32
        for <linux-samsung-soc@vger.kernel.org>; Fri, 01 Feb 2013 03:33:11 -0800 (PST)
In-Reply-To: <1359718376-21947-1-git-send-email-vikas.sajjan@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, sachin.kamat@linaro.org

Adds FIMD DT support to Origen quad board

Signed-off-by: Vikas Sajjan <vikas.sajjan@linaro.org>
---
 arch/arm/boot/dts/exynos4412-origen.dts |   22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4412-origen.dts b/arch/arm/boot/dts/exynos4412-origen.dts
index 4eba374..0bb183b 100644
--- a/arch/arm/boot/dts/exynos4412-origen.dts
+++ b/arch/arm/boot/dts/exynos4412-origen.dts
@@ -44,6 +44,28 @@
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
