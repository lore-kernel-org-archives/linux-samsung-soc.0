From: Amit Daniel Kachhap <amit.kachhap@linaro.org>
Subject: [PATCH V5 3/5] ARM: exynos: save L2 settings during bootup
Date: Thu,  5 Jan 2012 09:55:23 +0530
Message-ID: <1325737525-12869-4-git-send-email-amit.kachhap@linaro.org>
References: <1325737525-12869-1-git-send-email-amit.kachhap@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:44964 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757849Ab2AEE1W (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 4 Jan 2012 23:27:22 -0500
Received: by mail-iy0-f174.google.com with SMTP id h11so277558iae.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 04 Jan 2012 20:27:22 -0800 (PST)
In-Reply-To: <1325737525-12869-1-git-send-email-amit.kachhap@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, linux-arm-kernel@lists.infradead.org, amit.kachhap@linaro.org, patches@linaro.org

This patch adds code to save L2 register configuration at boot, and
later used to resume L2 before MMU is enabled in suspend and cpuidle
resume paths.

Signed-off-by: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Signed-off-by: Amit Daniel Kachhap <amit.kachhap@linaro.org>
---
 arch/arm/mach-exynos/common.c |   42 ++++++++++++++++++++++++++++++----------
 1 files changed, 31 insertions(+), 11 deletions(-)

diff --git a/arch/arm/mach-exynos/common.c b/arch/arm/mach-exynos/common.c
index ba4ab1f..f8bb808 100644
--- a/arch/arm/mach-exynos/common.c
+++ b/arch/arm/mach-exynos/common.c
@@ -26,10 +26,12 @@
 #include <asm/hardware/gic.h>
 #include <asm/mach/map.h>
 #include <asm/mach/irq.h>
+#include <asm/cacheflush.h>
 
 #include <mach/regs-irq.h>
 #include <mach/regs-pmu.h>
 #include <mach/regs-gpio.h>
+#include <mach/pmu.h>
 
 #include <plat/cpu.h>
 #include <plat/clock.h>
@@ -451,20 +453,38 @@ core_initcall(exynos4_core_init);
 #ifdef CONFIG_CACHE_L2X0
 static int __init exynos4_l2x0_cache_init(void)
 {
-	/* TAG, Data Latency Control: 2cycle */
-	__raw_writel(0x110, S5P_VA_L2CC + L2X0_TAG_LATENCY_CTRL);
+	if (!(__raw_readl(S5P_VA_L2CC + L2X0_CTRL) & 0x1)) {
+		l2x0_saved_regs.phy_base = EXYNOS4_PA_L2CC;
+		/* TAG, Data Latency Control: 2 cycles */
+		l2x0_saved_regs.tag_latency = 0x110;
 
-	if (soc_is_exynos4210())
-		__raw_writel(0x110, S5P_VA_L2CC + L2X0_DATA_LATENCY_CTRL);
-	else if (soc_is_exynos4212() || soc_is_exynos4412())
-		__raw_writel(0x120, S5P_VA_L2CC + L2X0_DATA_LATENCY_CTRL);
+		if (soc_is_exynos4212() || soc_is_exynos4412())
+			l2x0_saved_regs.data_latency = 0x120;
+		else
+			l2x0_saved_regs.data_latency = 0x110;
+
+		l2x0_saved_regs.prefetch_ctrl = 0x30000007;
+		l2x0_saved_regs.pwr_ctrl =
+			(L2X0_DYNAMIC_CLK_GATING_EN | L2X0_STNDBY_MODE_EN);
+
+		l2x0_regs_phys = virt_to_phys(&l2x0_saved_regs);
 
-	/* L2X0 Prefetch Control */
-	__raw_writel(0x30000007, S5P_VA_L2CC + L2X0_PREFETCH_CTRL);
+		__raw_writel(l2x0_saved_regs.tag_latency,
+				S5P_VA_L2CC + L2X0_TAG_LATENCY_CTRL);
+		__raw_writel(l2x0_saved_regs.data_latency,
+				S5P_VA_L2CC + L2X0_DATA_LATENCY_CTRL);
 
-	/* L2X0 Power Control */
-	__raw_writel(L2X0_DYNAMIC_CLK_GATING_EN | L2X0_STNDBY_MODE_EN,
-		     S5P_VA_L2CC + L2X0_POWER_CTRL);
+		/* L2X0 Prefetch Control */
+		__raw_writel(l2x0_saved_regs.prefetch_ctrl,
+				S5P_VA_L2CC + L2X0_PREFETCH_CTRL);
+
+		/* L2X0 Power Control */
+		__raw_writel(l2x0_saved_regs.pwr_ctrl,
+				S5P_VA_L2CC + L2X0_POWER_CTRL);
+
+		clean_dcache_area(&l2x0_regs_phys, sizeof(unsigned long));
+		clean_dcache_area(&l2x0_saved_regs, sizeof(struct l2x0_regs));
+	}
 
 	l2x0_init(S5P_VA_L2CC, 0x7C470001, 0xC200ffff);
 
-- 
1.7.1
