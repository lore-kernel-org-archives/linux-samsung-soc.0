From: Vikas Sajjan <vikas.sajjan@linaro.org>
Subject: [PATCH 1/7] ARM: dts: Move display-timimg information inside FIMD DT node for exynos5250
Date: Mon, 29 Jul 2013 19:19:25 +0530
Message-ID: <1375105771-8106-2-git-send-email-vikas.sajjan@linaro.org>
References: <1375105771-8106-1-git-send-email-vikas.sajjan@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f182.google.com ([209.85.192.182]:54800 "EHLO
	mail-pd0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751453Ab3G2Ntt (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 29 Jul 2013 09:49:49 -0400
Received: by mail-pd0-f182.google.com with SMTP id r11so1197892pdi.13
        for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Jul 2013 06:49:48 -0700 (PDT)
In-Reply-To: <1375105771-8106-1-git-send-email-vikas.sajjan@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, t.figa@samsung.com, devicetree-discuss@lists.ozlabs.org, jg1.han@samsung.com, inki.dae@samsung.com, patches@linaro.org, linaro-kernel@lists.linaro.org

As the display-timing information is parsed by FIMD driver, it makes
sense to move the display-timimg DT node inside FIMD DT node for exynos5250

Signed-off-by: Vikas Sajjan <vikas.sajjan@linaro.org>
---
 arch/arm/boot/dts/exynos5250-smdk5250.dts |   28 +++++++++++++++-------------
 1 file changed, 15 insertions(+), 13 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5250-smdk5250.dts b/arch/arm/boot/dts/exynos5250-smdk5250.dts
index 49f18c2..3b32c26 100644
--- a/arch/arm/boot/dts/exynos5250-smdk5250.dts
+++ b/arch/arm/boot/dts/exynos5250-smdk5250.dts
@@ -262,19 +262,21 @@
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
+	fimd {
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
