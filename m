From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: [PATCH 3/4] ARM: Exynos5: Fix incorrect initialization of GIC
Date: Tue, 27 Mar 2012 14:56:04 +0530
Message-ID: <1332840365-24827-4-git-send-email-thomas.abraham@linaro.org>
References: <1332840365-24827-1-git-send-email-thomas.abraham@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:23871 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755359Ab2C0JWq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 27 Mar 2012 05:22:46 -0400
Received: from epcpsbgm2.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0M1J0077JE1WRAD0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 27 Mar 2012 18:22:46 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.37])
 by mmp2.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0M1J003DJDYYQZJ0@mmp2.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Tue, 27 Mar 2012 18:22:45 +0900 (KST)
In-reply-to: <1332840365-24827-1-git-send-email-thomas.abraham@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, linux-arm-kernel@lists.infradead.org

Use the of_irq_init() call to setup the gic which also properly registers
the gic device node pointer with gic irq domain, without which all interrupt
specifier translations for gic fail.

Signed-off-by: Thomas Abraham <thomas.ab@samsung.com>
---
 arch/arm/mach-exynos/common.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/arm/mach-exynos/common.c b/arch/arm/mach-exynos/common.c
index f265dc4..3bf39a8 100644
--- a/arch/arm/mach-exynos/common.c
+++ b/arch/arm/mach-exynos/common.c
@@ -542,7 +542,7 @@ void __init exynos5_init_irq(void)
 {
 	int irq;
 
-	gic_init(0, IRQ_PPI(0), S5P_VA_GIC_DIST, S5P_VA_GIC_CPU);
+	of_irq_init(exynos4_dt_irq_match);
 
 	for (irq = 0; irq < EXYNOS5_MAX_COMBINER_NR; irq++) {
 		combiner_init(irq, (void __iomem *)S5P_VA_COMBINER(irq),
-- 
1.6.6.rc2
