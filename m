From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH] ARM: dts: cleanup exynos5440.dtsi
Date: Mon, 10 Dec 2012 10:13:30 +0900
Message-ID: <031b01cdd673$90cb7b50$b26271f0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:25161 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750777Ab2LJBNc (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 9 Dec 2012 20:13:32 -0500
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MES004RTJBI4BA0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 10 Dec 2012 10:13:30 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.120.199])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MES00LF2JEI9H10@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 10 Dec 2012 10:13:30 +0900 (KST)
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org


remove duplicated compatible

Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/boot/dts/exynos5440.dtsi |    5 -----
 1 files changed, 0 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5440.dtsi b/arch/arm/boot/dts/exynos5440.dtsi
index 024269d..5406689 100644
--- a/arch/arm/boot/dts/exynos5440.dtsi
+++ b/arch/arm/boot/dts/exynos5440.dtsi
@@ -58,11 +58,6 @@
 		};
 	};
 
-	common {
-		compatible = "samsung,exynos5440";
-
-	};
-
 	serial@B0000 {
 		compatible = "samsung,exynos4210-uart";
 		reg = <0xB0000 0x1000>;
-- 
1.7.4.1
