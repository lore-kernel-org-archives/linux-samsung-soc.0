From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Subject: [PATCH] MAINTAINERS: add maintainer entry for SAMSUNG EXYNOS
 DeviceTree
Date: Wed, 22 Feb 2012 09:16:30 +0900
Message-ID: <00f301ccf0f7$39f222a0$add667e0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:56253 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753122Ab2BVAQe (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 21 Feb 2012 19:16:34 -0500
Received: from epcpsbgm2.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LZR00DZMQ3FGR80@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 22 Feb 2012 09:16:32 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp1.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LZR00AOJQ3IP620@mmp1.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Wed, 22 Feb 2012 09:16:32 +0900 (KST)
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: 'Thomas Abraham' <thomas.abraham@linaro.org>, grant.likely@secretlab.ca, 'Kukjin Kim' <kgene.kim@samsung.com>, arnd@arndb.de

Add Samsung EXYNOS DT maintainer

Cc: Thomas Abraham <thomas.abraham@linaro.org>
Cc: Grant Likely <grant.likely@secretlab.ca>
Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 MAINTAINERS |   10 ++++++++++
 1 files changed, 10 insertions(+), 0 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 9a648eb..5ac5aaf 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1065,6 +1065,16 @@ S:	Maintained
 F:	arch/arm/mach-s5p*/
 F:	arch/arm/mach-exynos*/
 
+ARM/SAMSUNG EXYNOS DEVICE TREE
+M:	Thomas Abraham <thomas.abraham@linaro.org>
+M:	Kukjin Kim <kgene.kim@samsung.com>
+L:	devicetree-discuss@lists.ozlabs.org (moderated for non-subscribers)
+L:	linux-samsung-soc@vger.kernel.org (moderated for non-subscribers)
+S:	Maintained
+F:	arch/arm/boot/dts/exynos*
+F:	arch/arm/mach-exynos/*dt.c
+F:	Documentation/devicetree/*/*/*samsung*
+
 ARM/SAMSUNG MOBILE MACHINE SUPPORT
 M:	Kyungmin Park <kyungmin.park@samsung.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
-- 
1.7.1
