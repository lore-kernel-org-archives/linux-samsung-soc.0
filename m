From: Russell King <rmk+kernel@arm.linux.org.uk>
Subject: [PATCH 56/75] ARM: l2c: exynos: remove cache size override
Date: Fri, 28 Mar 2014 15:19:12 +0000
Message-ID: <E1WTYYq-0007Ge-SD@rmk-PC.arm.linux.org.uk>
References: <20140328151249.GJ7528@n2100.arm.linux.org.uk>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from gw-1.arm.linux.org.uk ([78.32.30.217]:41475 "EHLO
	pandora.arm.linux.org.uk" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1751862AbaC1PTP (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 28 Mar 2014 11:19:15 -0400
In-Reply-To: <20140328151249.GJ7528@n2100.arm.linux.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org

Signed-off-by: Russell King <rmk+kernel@arm.linux.org.uk>
---
 arch/arm/mach-exynos/common.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/arm/mach-exynos/common.c b/arch/arm/mach-exynos/common.c
index cd53b72449a0..0d19a1b0444e 100644
--- a/arch/arm/mach-exynos/common.c
+++ b/arch/arm/mach-exynos/common.c
@@ -45,9 +45,6 @@
 #include "common.h"
 #include "regs-pmu.h"
 
-#define L2_AUX_VAL 0x3c470001
-#define L2_AUX_MASK 0xc200ffff
-
 static const char name_exynos4210[] = "EXYNOS4210";
 static const char name_exynos4212[] = "EXYNOS4212";
 static const char name_exynos4412[] = "EXYNOS4412";
@@ -400,7 +397,7 @@ static int __init exynos4_l2x0_cache_init(void)
 {
 	int ret;
 
-	ret = l2x0_of_init(L2_AUX_VAL, L2_AUX_MASK);
+	ret = l2x0_of_init(0x3c400001, 0xc20fffff);
 	if (ret)
 		return ret;
 
-- 
1.8.3.1
