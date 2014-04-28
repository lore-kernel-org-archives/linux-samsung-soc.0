From: Russell King <rmk+kernel@arm.linux.org.uk>
Subject: [PATCH 58/97] ARM: l2c: exynos: remove cache size override
Date: Mon, 28 Apr 2014 20:31:08 +0100
Message-ID: <E1WerGe-0001Xg-BB@rmk-PC.arm.linux.org.uk>
References: <20140428192419.GV26756@n2100.arm.linux.org.uk>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from gw-1.arm.linux.org.uk ([78.32.30.217]:55735 "EHLO
	pandora.arm.linux.org.uk" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S933019AbaD1TbK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 28 Apr 2014 15:31:10 -0400
In-Reply-To: <20140428192419.GV26756@n2100.arm.linux.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.ifradead.org
Cc: Kukjin Kim <kgene.kim@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Signed-off-by: Russell King <rmk+kernel@arm.linux.org.uk>
---
 arch/arm/mach-exynos/exynos.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/arm/mach-exynos/exynos.c b/arch/arm/mach-exynos/exynos.c
index e6828fb46034..a51bf25e7523 100644
--- a/arch/arm/mach-exynos/exynos.c
+++ b/arch/arm/mach-exynos/exynos.c
@@ -32,9 +32,6 @@
 #include "mfc.h"
 #include "regs-pmu.h"
 
-#define L2_AUX_VAL 0x3c470001
-#define L2_AUX_MASK 0xc200ffff
-
 static struct map_desc exynos4_iodesc[] __initdata = {
 	{
 		.virtual	= (unsigned long)S3C_VA_SYS,
@@ -323,7 +320,7 @@ static int __init exynos4_l2x0_cache_init(void)
 {
 	int ret;
 
-	ret = l2x0_of_init(L2_AUX_VAL, L2_AUX_MASK);
+	ret = l2x0_of_init(0x3c400001, 0xc20fffff);
 	if (ret)
 		return ret;
 
-- 
1.8.3.1
