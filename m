From: Vikas Sajjan <vikas.sajjan@linaro.org>
Subject: [PATCH v10 2/3] ARM: dts: Add FIMD node and display timing node to exynos4412-origen.dts
Date: Mon,  1 Apr 2013 19:52:31 +0530
Message-ID: <1364826153-8925-3-git-send-email-vikas.sajjan@linaro.org>
References: <1364826153-8925-1-git-send-email-vikas.sajjan@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-da0-f48.google.com ([209.85.210.48]:47752 "EHLO
	mail-da0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758232Ab3DAOW5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 1 Apr 2013 10:22:57 -0400
Received: by mail-da0-f48.google.com with SMTP id p8so1079616dan.21
        for <linux-samsung-soc@vger.kernel.org>; Mon, 01 Apr 2013 07:22:56 -0700 (PDT)
In-Reply-To: <1364826153-8925-1-git-send-email-vikas.sajjan@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, sylvester.nawrocki@gmail.com, devicetree-discuss@lists.ozlabs.org, inki.dae@samsung.com, patches@linaro.org, linaro-kernel@lists.linaro.org

This patch adds FIMD related nodes for the Origen Quad board.

Signed-off-by: Vikas Sajjan <vikas.sajjan@linaro.org>
---
 arch/arm/boot/dts/exynos4412-origen.dts |   21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4412-origen.dts b/arch/arm/boot/dts/exynos4412-origen.dts
index a5478bd..cb0c507 100644
--- a/arch/arm/boot/dts/exynos4412-origen.dts
+++ b/arch/arm/boot/dts/exynos4412-origen.dts
@@ -70,6 +70,27 @@
 		status = "okay";
 	};
 
+	fimd@11c00000 {
+		pinctrl-0 = <&lcd_clk &lcd_data24 &pwm1_out>;
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
