From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH v2 37/38] ARM: EXYNOS: Remove legacy L2X0 initialization
Date: Mon, 17 Jun 2013 18:34:22 +0200
Message-ID: <1371486863-12398-38-git-send-email-t.figa@samsung.com>
References: <1371486863-12398-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:10306 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753084Ab3FQQe7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 17 Jun 2013 12:34:59 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MOJ0085OQ1L6450@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 17 Jun 2013 17:34:58 +0100 (BST)
In-reply-to: <1371486863-12398-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Kukjin Kim <kgene.kim@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Marek Szyprowski <m.szyprowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>, Tomasz Figa <t.figa@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>

Since Exynos is now supporting only DT-based boot, the old L2X0
initialization code is not needed anymore, so exynos4_l2x0_cache_init()
can be greatly simplified.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Tomasz Figa <t.figa@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/mach-exynos/common.c | 48 ++++---------------------------------------
 1 file changed, 4 insertions(+), 44 deletions(-)

diff --git a/arch/arm/mach-exynos/common.c b/arch/arm/mach-exynos/common.c
index 561890f..e886154 100644
--- a/arch/arm/mach-exynos/common.c
+++ b/arch/arm/mach-exynos/common.c
@@ -412,59 +412,19 @@ static int __init exynos_core_init(void)
 }
 core_initcall(exynos_core_init);
 
-#ifdef CONFIG_CACHE_L2X0
 static int __init exynos4_l2x0_cache_init(void)
 {
 	int ret;
 
-	if (soc_is_exynos5250() || soc_is_exynos5440())
-		return 0;
-
 	ret = l2x0_of_init(L2_AUX_VAL, L2_AUX_MASK);
-	if (!ret) {
-		l2x0_regs_phys = virt_to_phys(&l2x0_saved_regs);
-		clean_dcache_area(&l2x0_regs_phys, sizeof(unsigned long));
-		return 0;
-	}
-
-	if (!(__raw_readl(S5P_VA_L2CC + L2X0_CTRL) & 0x1)) {
-		l2x0_saved_regs.phy_base = EXYNOS4_PA_L2CC;
-		/* TAG, Data Latency Control: 2 cycles */
-		l2x0_saved_regs.tag_latency = 0x110;
-
-		if (soc_is_exynos4212() || soc_is_exynos4412())
-			l2x0_saved_regs.data_latency = 0x120;
-		else
-			l2x0_saved_regs.data_latency = 0x110;
-
-		l2x0_saved_regs.prefetch_ctrl = 0x30000007;
-		l2x0_saved_regs.pwr_ctrl =
-			(L2X0_DYNAMIC_CLK_GATING_EN | L2X0_STNDBY_MODE_EN);
-
-		l2x0_regs_phys = virt_to_phys(&l2x0_saved_regs);
-
-		__raw_writel(l2x0_saved_regs.tag_latency,
-				S5P_VA_L2CC + L2X0_TAG_LATENCY_CTRL);
-		__raw_writel(l2x0_saved_regs.data_latency,
-				S5P_VA_L2CC + L2X0_DATA_LATENCY_CTRL);
-
-		/* L2X0 Prefetch Control */
-		__raw_writel(l2x0_saved_regs.prefetch_ctrl,
-				S5P_VA_L2CC + L2X0_PREFETCH_CTRL);
-
-		/* L2X0 Power Control */
-		__raw_writel(l2x0_saved_regs.pwr_ctrl,
-				S5P_VA_L2CC + L2X0_POWER_CTRL);
-
-		clean_dcache_area(&l2x0_regs_phys, sizeof(unsigned long));
-		clean_dcache_area(&l2x0_saved_regs, sizeof(struct l2x0_regs));
-	}
+	if (ret)
+		return ret;
 
-	l2x0_init(S5P_VA_L2CC, L2_AUX_VAL, L2_AUX_MASK);
+	l2x0_regs_phys = virt_to_phys(&l2x0_saved_regs);
+	clean_dcache_area(&l2x0_regs_phys, sizeof(unsigned long));
 	return 0;
 }
 early_initcall(exynos4_l2x0_cache_init);
-#endif
 
 static int __init exynos_init(void)
 {
-- 
1.8.2.1
