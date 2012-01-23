From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH] ARM: Exynos4: fix non-SMP builds
Date: Mon, 23 Jan 2012 10:41:28 +0100
Message-ID: <1327311688-5856-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:37469 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752227Ab2AWJlr (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 23 Jan 2012 04:41:47 -0500
Received: from euspt1 (mailout2.w1.samsung.com [210.118.77.12])
 by mailout2.w1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0LY800B1HW9L2A@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 23 Jan 2012 09:41:45 +0000 (GMT)
Received: from linux.samsung.com ([106.116.38.10])
 by spt1.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0LY800LXXW9JEB@spt1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 23 Jan 2012 09:41:45 +0000 (GMT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>

This patch fixes the following build issue, which happens only if SMP
has been disabled:

arch/arm/mach-exynos/built-in.o: In function `exynos4_pm_resume':
arch/arm/mach-exynos/pm.c:387: undefined reference to `scu_enable'

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/mach-exynos/pm.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos/pm.c b/arch/arm/mach-exynos/pm.c
index 9a13af5..7a737c6 100644
--- a/arch/arm/mach-exynos/pm.c
+++ b/arch/arm/mach-exynos/pm.c
@@ -388,7 +388,9 @@ static void exynos4_pm_resume(void)
 
 	exynos4_restore_pll();
 
+#ifdef CONFIG_SMP
 	scu_enable(S5P_VA_SCU);
+#endif
 
 #ifdef CONFIG_CACHE_L2X0
 	s3c_pm_do_restore_core(exynos4_l2cc_save, ARRAY_SIZE(exynos4_l2cc_save));
-- 
1.7.1.569.g6f426
