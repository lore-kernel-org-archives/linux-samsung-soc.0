From: Vikas Sajjan <vikas.sajjan@linaro.org>
Subject: [PATCH v2 1/7] ARM: dts: Move display-timimg information inside FIMD DT node for exynos5250
Date: Tue, 30 Jul 2013 16:49:32 +0530
Message-ID: <1375183178-8201-2-git-send-email-vikas.sajjan@linaro.org>
References: <1375183178-8201-1-git-send-email-vikas.sajjan@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f49.google.com ([209.85.220.49]:39559 "EHLO
	mail-pa0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752515Ab3G3LT6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 30 Jul 2013 07:19:58 -0400
Received: by mail-pa0-f49.google.com with SMTP id bi5so7006366pad.36
        for <linux-samsung-soc@vger.kernel.org>; Tue, 30 Jul 2013 04:19:58 -0700 (PDT)
In-Reply-To: <1375183178-8201-1-git-send-email-vikas.sajjan@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, t.figa@samsung.com, devicetree@vger.kernel.org, jg1.han@samsung.com, inki.dae@samsung.com, ajaynumb@gmail.com, patches@linaro.org, linaro-kernel@lists.linaro.org

As the display-timing information is parsed by FIMD driver, it makes
sense to move the display-timimg DT node inside FIMD DT node for exynos5250

Signed-off-by: Vikas Sajjan <vikas.sajjan@linaro.org>
---
 arch/arm/boot/dts/exynos5250-smdk5250.dts |   29 ++++++++++++++++-------------
 1 file changed, 16 insertions(+), 13 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5250-smdk5250.dts b/arch/arm/boot/dts/exynos5250-smdk5250.dts
index 49f18c2..d176dbb 100644
--- a/arch/arm/boot/dts/exynos5250-smdk5250.dts
+++ b/arch/arm/boot/dts/exynos5250-smdk5250.dts
@@ -262,19 +262,22 @@
 		pinctrl-0 = <&dp_hpd>;
 	};
 
-	display-timings {
-		native-mode = <&timing0>;
-		timing0: timing@0 {
-			/* 1280x800 */
-			clock-frequency = <50000>;
-			hactive = <1280>;
-			vactive = <800>;
-			hfront-porch = <4>;
-			hback-porch = <4>;
-			hsync-len = <4>;
-			vback-porch = <4>;
-			vfront-porch = <4>;
-			vsync-len = <4>;
+	fimd@14400000 {
+		status = "okay";
+		display-timings {
+			native-mode = <&timing0>;
+			timing0: timing@0 {
+				/* 1280x800 */
+				clock-frequency = <50000>;
+				hactive = <1280>;
+				vactive = <800>;
+				hfront-porch = <4>;
+				hback-porch = <4>;
+				hsync-len = <4>;
+				vback-porch = <4>;
+				vfront-porch = <4>;
+				vsync-len = <4>;
+			};
 		};
 	};
 
-- 
1.7.9.5
