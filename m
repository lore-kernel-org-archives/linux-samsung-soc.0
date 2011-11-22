From: Amit Daniel Kachhap <amit.kachhap@linaro.org>
Subject: [PATCH V3 6/6] ARM: exynos: Enable l2 configuration through device tree
Date: Tue, 22 Nov 2011 15:05:32 +0530
Message-ID: <1321954532-18724-7-git-send-email-amit.kachhap@linaro.org>
References: <1321954532-18724-1-git-send-email-amit.kachhap@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-gy0-f174.google.com ([209.85.160.174]:46155 "EHLO
	mail-gy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753801Ab1KVJio (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 22 Nov 2011 04:38:44 -0500
Received: by ghrr1 with SMTP id r1so712674ghr.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 22 Nov 2011 01:38:44 -0800 (PST)
In-Reply-To: <1321954532-18724-1-git-send-email-amit.kachhap@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com, amit.kachhap@linaro.org, patches@linaro.org

This patch enables calling generic l2 setup functions if device tree is used.

Signed-off-by: Amit Daniel Kachhap <amit.kachhap@linaro.org>
---
 arch/arm/mach-exynos/cpu.c |   12 ++++++++++--
 1 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-exynos/cpu.c b/arch/arm/mach-exynos/cpu.c
index 252e346..b62a90f 100644
--- a/arch/arm/mach-exynos/cpu.c
+++ b/arch/arm/mach-exynos/cpu.c
@@ -37,6 +37,9 @@
 #include <mach/regs-pmu.h>
 #include <mach/pmu.h>
 
+#define L2_AUX_VAL 0x7C470001
+#define L2_AUX_MASK 0xC200ffff
+
 unsigned int gic_bank_offset __read_mostly;
 
 extern int combiner_init(unsigned int combiner_nr, void __iomem *base,
@@ -299,6 +302,7 @@ core_initcall(exynos4_core_init);
 #ifdef CONFIG_CACHE_L2X0
 static int __init exynos4_l2x0_cache_init(void)
 {
+#ifndef CONFIG_OF
 	if (!(__raw_readl(S5P_VA_L2CC + L2X0_CTRL) & 0x1)) {
 		l2x0_saved_regs.phy_base = EXYNOS4_PA_L2CC;
 		/* TAG, Data Latency Control: 2 cycles */
@@ -332,8 +336,12 @@ static int __init exynos4_l2x0_cache_init(void)
 		clean_dcache_area(&l2x0_saved_regs, sizeof(struct l2x0_regs));
 	}
 
-	l2x0_init(S5P_VA_L2CC, 0x7C470001, 0xC200ffff);
-
+	l2x0_init(S5P_VA_L2CC, L2_AUX_VAL, L2_AUX_MASK);
+#else
+	l2x0_of_init(L2_AUX_VAL, L2_AUX_MASK);
+	l2x0_regs_phys = virt_to_phys(&l2x0_saved_regs);
+	clean_dcache_area(&l2x0_regs_phys, sizeof(unsigned long));
+#endif
 	return 0;
 }
 
-- 
1.7.1
