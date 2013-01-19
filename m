From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH] ARM: dts: fix tick and alarm inq numbers for exynos5440
Date: Fri, 18 Jan 2013 20:57:02 -0800
Message-ID: <1358571422-21832-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:53559 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753850Ab3ASE5q (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 18 Jan 2013 23:57:46 -0500
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MGU00G5EWG9AP40@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 19 Jan 2013 13:57:45 +0900 (KST)
Received: from localhost.localdomain ([105.128.18.183])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MGU000K9WFYZC10@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 19 Jan 2013 13:57:45 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Giridhar Maruthy <giridhar.m@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>

From: Giridhar Maruthy <giridhar.m@samsung.com>

The interrupts for RTC tick and alarm interrupt were swapped.
Has been fixed here.

Signed-off-by: Giridhar Maruthy <giridhar.m@samsung.com>
Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/boot/dts/exynos5440.dtsi |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/exynos5440.dtsi b/arch/arm/boot/dts/exynos5440.dtsi
index 25f0fa6..5f3562a 100644
--- a/arch/arm/boot/dts/exynos5440.dtsi
+++ b/arch/arm/boot/dts/exynos5440.dtsi
@@ -154,6 +154,6 @@
 	rtc {
 		compatible = "samsung,s3c6410-rtc";
 		reg = <0x130000 0x1000>;
-		interrupts = <0 16 0>, <0 17 0>;
+		interrupts = <0 17 0>, <0 16 0>;
 	};
 };
-- 
1.7.10.4
