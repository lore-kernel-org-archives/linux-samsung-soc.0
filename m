From: =?ks_c_5601-1987?B?s7K/tbnO?= <youngmin.nam@samsung.com>
Subject: [PATCH] ARM: dts: Enable RTC by default on Exynos5440
Date: Sat, 08 Jun 2013 11:35:59 +0900
Message-ID: <00b201ce63f0$e96033e0$bc209ba0$%nam@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ks_c_5601-1987
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:39315 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751034Ab3FHCgC (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 7 Jun 2013 22:36:02 -0400
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MO100DG8Z801V00@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 08 Jun 2013 11:36:00 +0900 (KST)
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com
Cc: linux-samsung-soc@vger.kernel.org

This patch enables RTC on Exynos5440 by default.

RTC is a basic feature of Exynos5440.
But it was disabled by issue that comes from Exynos5250.
(commit id: 522ccdb6fd0e9689fbdc005ce95a42d70ec81629)
That issue only applies to Exynos5250 not Exynos5440. So, there is
no issue with enabled RTC on Exynos5440.
This change was tested on Exynos5440.

Signed-off-by: Youngmin Nam <youngmin.nam@samsung.com>
---
 arch/arm/boot/dts/exynos5440.dtsi |    1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/exynos5440.dtsi
b/arch/arm/boot/dts/exynos5440.dtsi
index f6b1c89..93e9028 100644
--- a/arch/arm/boot/dts/exynos5440.dtsi
+++ b/arch/arm/boot/dts/exynos5440.dtsi
@@ -214,6 +214,5 @@
 		interrupts = <0 17 0>, <0 16 0>;
 		clocks = <&clock 21>;
 		clock-names = "rtc";
-		status = "disabled";
 	};
 };
-- 
1.7.10.4
