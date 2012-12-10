From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH] ARM: EXYNOS: fix skip scu_enable() for EXYNOS5440
Date: Mon, 10 Dec 2012 10:08:56 +0900
Message-ID: <030d01cdd672$ed68da20$c83a8e60$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:62844 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754152Ab2LJBI5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 9 Dec 2012 20:08:57 -0500
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MES00HHVJ6QW4D0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 10 Dec 2012 10:08:56 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.120.199])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MES00MH4J6V7R20@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 10 Dec 2012 10:08:56 +0900 (KST)
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org


Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/mach-exynos/platsmp.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/arm/mach-exynos/platsmp.c b/arch/arm/mach-exynos/platsmp.c
index 4ca8ff1..c5c840e 100644
--- a/arch/arm/mach-exynos/platsmp.c
+++ b/arch/arm/mach-exynos/platsmp.c
@@ -198,7 +198,7 @@ static void __init exynos_smp_prepare_cpus(unsigned int max_cpus)
 {
 	int i;
 
-	if (!soc_is_exynos5250())
+	if (!(soc_is_exynos5250() || soc_is_exynos5440()))
 		scu_enable(scu_base_addr());
 
 	/*
-- 
1.7.4.1
