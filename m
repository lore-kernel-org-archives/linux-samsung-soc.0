From: Amit Daniel Kachhap <amit.kachhap@linaro.org>
Subject: [PATCH V6 5/5] ARM: exynos: Enable l2 configuration through device tree
Date: Tue, 21 Feb 2012 11:49:50 +0530
Message-ID: <1329805190-8874-6-git-send-email-amit.kachhap@linaro.org>
References: <1329805190-8874-1-git-send-email-amit.kachhap@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pz0-f46.google.com ([209.85.210.46]:42614 "EHLO
	mail-pz0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750975Ab2BUGVy (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 21 Feb 2012 01:21:54 -0500
Received: by mail-pz0-f46.google.com with SMTP id d14so6537359dae.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 20 Feb 2012 22:21:54 -0800 (PST)
In-Reply-To: <1329805190-8874-1-git-send-email-amit.kachhap@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, amit.kachhap@linaro.org, patches@linaro.org

This patch enables calling generic l2 setup functions if device tree is used.

Signed-off-by: Amit Daniel Kachhap <amit.kachhap@linaro.org>
---
 arch/arm/mach-exynos/common.c |   13 +++++++++++--
 1 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-exynos/common.c b/arch/arm/mach-exynos/common.c
index 9ff38aa..cb5ad8c 100644
--- a/arch/arm/mach-exynos/common.c
+++ b/arch/arm/mach-exynos/common.c
@@ -47,6 +47,8 @@
 #include <plat/regs-serial.h>
 
 #include "common.h"
+#define L2_AUX_VAL 0x7C470001
+#define L2_AUX_MASK 0xC200ffff
 
 static const char name_exynos4210[] = "EXYNOS4210";
 static const char name_exynos4212[] = "EXYNOS4212";
@@ -443,6 +445,14 @@ core_initcall(exynos4_core_init);
 #ifdef CONFIG_CACHE_L2X0
 static int __init exynos4_l2x0_cache_init(void)
 {
+	int ret;
+	ret = l2x0_of_init(L2_AUX_VAL, L2_AUX_MASK);
+	if (!ret) {
+		l2x0_regs_phys = virt_to_phys(&l2x0_saved_regs);
+		clean_dcache_area(&l2x0_regs_phys, sizeof(unsigned long));
+		return 0;
+	}
+
 	if (!(__raw_readl(S5P_VA_L2CC + L2X0_CTRL) & 0x1)) {
 		l2x0_saved_regs.phy_base = EXYNOS4_PA_L2CC;
 		/* TAG, Data Latency Control: 2 cycles */
@@ -476,8 +486,7 @@ static int __init exynos4_l2x0_cache_init(void)
 		clean_dcache_area(&l2x0_saved_regs, sizeof(struct l2x0_regs));
 	}
 
-	l2x0_init(S5P_VA_L2CC, 0x7C470001, 0xC200ffff);
-
+	l2x0_init(S5P_VA_L2CC, L2_AUX_VAL, L2_AUX_MASK);
 	return 0;
 }
 
-- 
1.7.1
