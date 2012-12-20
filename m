From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH] ARM: dts: fix split memory bank for SSDK5440
Date: Thu, 20 Dec 2012 11:03:37 -0800
Message-ID: <1356030217-5472-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:19113 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752342Ab2LTTDw (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 20 Dec 2012 14:03:52 -0500
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MFC003ZJFMEI6T0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 21 Dec 2012 04:03:50 +0900 (KST)
Received: from cass.0.0.1 ([105.128.18.183])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MFC009N7FM7EL10@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 21 Dec 2012 04:03:50 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Kukjin Kim <kgene.kim@samsung.com>

The size of memory bank should be under 256MB, because current
section size is 256MB on EXYNOS SoCs. This patch fixes it.

Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/boot/dts/exynos5440-ssdk5440.dts |    9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/exynos5440-ssdk5440.dts b/arch/arm/boot/dts/exynos5440-ssdk5440.dts
index 44d4d24..79d02cc 100644
--- a/arch/arm/boot/dts/exynos5440-ssdk5440.dts
+++ b/arch/arm/boot/dts/exynos5440-ssdk5440.dts
@@ -17,7 +17,14 @@
 	compatible = "samsung,ssdk5440", "samsung,exynos5440";
 
 	memory {
-		reg = <0x80000000 0x80000000>;
+		reg = <0x80000000 0x10000000
+		       0x90000000 0x10000000
+		       0xA0000000 0x10000000
+		       0xB0000000 0x10000000
+		       0xC0000000 0x10000000
+		       0xD0000000 0x10000000
+		       0xE0000000 0x10000000
+		       0xF0000000 0x10000000>;
 	};
 
 	chosen {
-- 
1.7.10.4
