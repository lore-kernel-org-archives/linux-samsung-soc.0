From: Tushar Behera <tushar.b@samsung.com>
Subject: [PATCH] ARM: dts: Move display-timings node under fimd node
Date: Mon, 23 Jun 2014 10:29:12 +0530
Message-ID: <1403499552-12464-1-git-send-email-tushar.b@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f52.google.com ([209.85.160.52]:48854 "EHLO
	mail-pb0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751066AbaFWFCW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 23 Jun 2014 01:02:22 -0400
Received: by mail-pb0-f52.google.com with SMTP id rq2so5354692pbb.25
        for <linux-samsung-soc@vger.kernel.org>; Sun, 22 Jun 2014 22:02:21 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, trblinux@gmail.com

'display-timings' should be a subnode for fimd node. Moving this
node appropriately gets the display back on Origen/Origen-Quad boards.

Signed-off-by: Tushar Behera <tushar.b@samsung.com>
---
Based on next-20140620.

Tested on Exynos4210-Origen board. Looks like there are still some pending
bits on Exynos4412-Origen to get display working.

 arch/arm/boot/dts/exynos4210-origen.dts |   26 +++++++++++++-------------
 arch/arm/boot/dts/exynos4412-origen.dts |   26 +++++++++++++-------------
 2 files changed, 26 insertions(+), 26 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4210-origen.dts b/arch/arm/boot/dts/exynos4210-origen.dts
index f767c42..a39323f 100644
--- a/arch/arm/boot/dts/exynos4210-origen.dts
+++ b/arch/arm/boot/dts/exynos4210-origen.dts
@@ -317,20 +317,20 @@
 		pinctrl-0 = <&lcd_en &lcd_clk &lcd_data24 &pwm0_out>;
 		pinctrl-names = "default";
 		status = "okay";
-	};
 
-	display-timings {
-		native-mode = <&timing0>;
-		timing0: timing {
-			clock-frequency = <47500000>;
-			hactive = <1024>;
-			vactive = <600>;
-			hfront-porch = <64>;
-			hback-porch = <16>;
-			hsync-len = <48>;
-			vback-porch = <64>;
-			vfront-porch = <16>;
-			vsync-len = <3>;
+		display-timings {
+			native-mode = <&timing0>;
+			timing0: timing {
+				clock-frequency = <47500000>;
+				hactive = <1024>;
+				vactive = <600>;
+				hfront-porch = <64>;
+				hback-porch = <16>;
+				hsync-len = <48>;
+				vback-porch = <64>;
+				vfront-porch = <16>;
+				vsync-len = <3>;
+			};
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/exynos4412-origen.dts b/arch/arm/boot/dts/exynos4412-origen.dts
index e925c9f..0604220 100644
--- a/arch/arm/boot/dts/exynos4412-origen.dts
+++ b/arch/arm/boot/dts/exynos4412-origen.dts
@@ -160,20 +160,20 @@
 		pinctrl-0 = <&lcd_clk &lcd_data24 &pwm1_out>;
 		pinctrl-names = "default";
 		status = "okay";
-	};
 
-	display-timings {
-		native-mode = <&timing0>;
-		timing0: timing {
-			clock-frequency = <47500000>;
-			hactive = <1024>;
-			vactive = <600>;
-			hfront-porch = <64>;
-			hback-porch = <16>;
-			hsync-len = <48>;
-			vback-porch = <64>;
-			vfront-porch = <16>;
-			vsync-len = <3>;
+		display-timings {
+			native-mode = <&timing0>;
+			timing0: timing {
+				clock-frequency = <47500000>;
+				hactive = <1024>;
+				vactive = <600>;
+				hfront-porch = <64>;
+				hback-porch = <16>;
+				hsync-len = <48>;
+				vback-porch = <64>;
+				vfront-porch = <16>;
+				vsync-len = <3>;
+			};
 		};
 	};
 
-- 
1.7.9.5
