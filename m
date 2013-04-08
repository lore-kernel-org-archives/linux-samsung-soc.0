From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH] ARM: dts: Fix build error in exynos5250-smdk5250.dts
Date: Mon,  8 Apr 2013 10:31:21 +0530
Message-ID: <1365397281-32217-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f50.google.com ([209.85.220.50]:54145 "EHLO
	mail-pa0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751098Ab3DHFNQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 8 Apr 2013 01:13:16 -0400
Received: by mail-pa0-f50.google.com with SMTP id bg2so3088663pad.37
        for <linux-samsung-soc@vger.kernel.org>; Sun, 07 Apr 2013 22:13:15 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, sachin.kamat@linaro.org, patches@linaro.org

Fixes the following build error:
Error: arch/arm/boot/dts/exynos5250-smdk5250.dts:250.3-251.1 syntax error
FATAL ERROR: Unable to parse input tree
make[1]: *** [arch/arm/boot/dts/exynos5250-smdk5250.dtb] Error 1
make: *** [dtbs] Error 2

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
Based on Kukjin's for-next tree.
---
 arch/arm/boot/dts/exynos5250-smdk5250.dts |    1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/exynos5250-smdk5250.dts b/arch/arm/boot/dts/exynos5250-smdk5250.dts
index 4be14df..26d856b 100644
--- a/arch/arm/boot/dts/exynos5250-smdk5250.dts
+++ b/arch/arm/boot/dts/exynos5250-smdk5250.dts
@@ -239,6 +239,7 @@
 			vback-porch = <4>;
 			vfront-porch = <4>;
 			vsync-len = <4>;
+		};
 	};
 
 	fixed-rate-clocks {
-- 
1.7.9.5
