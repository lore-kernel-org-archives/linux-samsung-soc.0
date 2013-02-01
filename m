From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH] ARM: Exynos: enable ARM_HAS_SG_CHAIN
Date: Fri, 01 Feb 2013 15:49:03 +0100
Message-ID: <1359730143-462-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:51848 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756409Ab3BAOt4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 1 Feb 2013 09:49:56 -0500
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MHJ00KCYQJ6S901@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 01 Feb 2013 23:49:54 +0900 (KST)
Received: from localhost.localdomain ([106.116.147.30])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MHJ00L7BQIWZG40@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 01 Feb 2013 23:49:54 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Inki Dae <inki.dae@samsung.com>

Exynos DRM driver needs support for scatter-list chaining and all
drivers available on Samsung platform, which use scatter-lists are
already aware of chaining api, so lets enable global support for it.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm/Kconfig |    1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index cb06d7a..939b0d9 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -836,6 +836,7 @@ config ARCH_EXYNOS
 	select ARCH_HAS_CPUFREQ
 	select ARCH_HAS_HOLES_MEMORYMODEL
 	select ARCH_SPARSEMEM_ENABLE
+	select ARM_HAS_SG_CHAIN
 	select CLKDEV_LOOKUP
 	select CPU_V7
 	select GENERIC_CLOCKEVENTS
-- 
1.7.9.5
