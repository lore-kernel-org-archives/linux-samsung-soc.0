From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH] ARM: dts: Add watchdog in exynos5440-ssdk5440 device list
Date: Fri, 18 Jan 2013 21:00:51 -0800
Message-ID: <1358571651-22020-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:53849 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750716Ab3ASFB0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 19 Jan 2013 00:01:26 -0500
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MGU00D2UWMDX950@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 19 Jan 2013 14:01:25 +0900 (KST)
Received: from localhost.localdomain ([105.128.18.183])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MGU00LEQWM8X010@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 19 Jan 2013 14:01:25 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Giridhar Maruthy <giridhar.m@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>

From: Giridhar Maruthy <giridhar.m@samsung.com>

Signed-off-by: Giridhar Maruthy <giridhar.m@samsung.com>
Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/boot/dts/exynos5440-ssdk5440.dts |    4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5440-ssdk5440.dts b/arch/arm/boot/dts/exynos5440-ssdk5440.dts
index 81e2c96..5239d75 100644
--- a/arch/arm/boot/dts/exynos5440-ssdk5440.dts
+++ b/arch/arm/boot/dts/exynos5440-ssdk5440.dts
@@ -36,10 +36,6 @@
 		status = "disabled";
 	};
 
-	watchdog {
-		status = "disabled";
-	};
-
 	rtc {
 		status = "disabled";
 	};
-- 
1.7.10.4
