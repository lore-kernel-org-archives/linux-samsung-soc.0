From: Vikas Sajjan <vikas.sajjan@linaro.org>
Subject: [PATCH v5 3/5] ARM: dts: Add FIMD node and display timing node to exynos4412-origen.dts
Date: Wed, 27 Feb 2013 14:13:38 +0530
Message-ID: <1361954620-20614-4-git-send-email-vikas.sajjan@linaro.org>
References: <1361954620-20614-1-git-send-email-vikas.sajjan@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-da0-f45.google.com ([209.85.210.45]:58077 "EHLO
	mail-da0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754832Ab3B0IoI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 27 Feb 2013 03:44:08 -0500
Received: by mail-da0-f45.google.com with SMTP id v40so192851dad.18
        for <linux-samsung-soc@vger.kernel.org>; Wed, 27 Feb 2013 00:44:07 -0800 (PST)
In-Reply-To: <1361954620-20614-1-git-send-email-vikas.sajjan@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, inki.dae@samsung.com, t.figa@samsung.com, sylvester.nawrocki@gmail.com, devicetree-discuss@lists.ozlabs.org, sachin.kamat@linaro.org, joshi@samsung.com

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
