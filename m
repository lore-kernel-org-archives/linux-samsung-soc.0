From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 1/1] ARM: dts: Fix a typo in exynos5420-pinctrl.dtsi
Date: Thu,  7 Nov 2013 09:39:46 +0530
Message-ID: <1383797386-29458-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f53.google.com ([209.85.220.53]:54237 "EHLO
	mail-pa0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750766Ab3KGELY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 6 Nov 2013 23:11:24 -0500
Received: by mail-pa0-f53.google.com with SMTP id kx10so3106pab.26
        for <linux-samsung-soc@vger.kernel.org>; Wed, 06 Nov 2013 20:11:24 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, sachin.kamat@linaro.org

Fixed samaung -> samsung in property name.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 arch/arm/boot/dts/exynos5420-pinctrl.dtsi |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/exynos5420-pinctrl.dtsi b/arch/arm/boot/dts/exynos5420-pinctrl.dtsi
index e695aba5f73c..e62c8eb57438 100644
--- a/arch/arm/boot/dts/exynos5420-pinctrl.dtsi
+++ b/arch/arm/boot/dts/exynos5420-pinctrl.dtsi
@@ -64,7 +64,7 @@
 			samsung,pins = "gpx0-7";
 			samsung,pin-function = <3>;
 			samsung,pin-pud = <0>;
-			samaung,pin-drv = <0>;
+			samsung,pin-drv = <0>;
 		};
 	};
 
-- 
1.7.9.5
