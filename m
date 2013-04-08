From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH] ARM: dts: Fix gmac clock ids due to changes in Exynos5440
Date: Mon, 08 Apr 2013 16:24:06 +0900
Message-ID: <2c9401ce342a$0e02d320$2a087960$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:9232 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751374Ab3DHHYJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 8 Apr 2013 03:24:09 -0400
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MKX00DY8DW1ELO0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 08 Apr 2013 16:24:07 +0900 (KST)
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: 'Thomas Abraham' <thomas.ab@samsung.com>, 'Kukjin Kim' <kgene.kim@samsung.com>

From: Thomas Abraham <thomas.ab@samsung.com>

The Exynos5440 common clock driver has changed the clock ID's for
some of the clocks. Fix the gmac clock entries in Exynos5440 dtsi
file accordingly.

Signed-off-by: Thomas Abraham <thomas.ab@samsung.com>
Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/boot/dts/exynos5440.dtsi |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/exynos5440.dtsi b/arch/arm/boot/dts/exynos5440.dtsi
index 5a339f0..7906d5f 100644
--- a/arch/arm/boot/dts/exynos5440.dtsi
+++ b/arch/arm/boot/dts/exynos5440.dtsi
@@ -162,7 +162,7 @@
 		interrupts = <0 31 4>;
 		interrupt-names = "macirq";
 		phy-mode = "sgmii";
-		clocks = <&clock 12>;
+		clocks = <&clock 25>;
 		clock-names = "stmmaceth";
 	};
 
-- 
1.7.10.4
