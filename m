From: Abhilash Kesavan <a.kesavan@samsung.com>
Subject: [PATCH] ARM: EXYNOS: Fix the check for non-smp configuration
Date: Thu, 03 Jul 2014 10:33:32 +0530
Message-ID: <1404363812-26307-1-git-send-email-a.kesavan@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:18772 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750736AbaGCFBf (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 3 Jul 2014 01:01:35 -0400
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N8400CR8DYM7610@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 03 Jul 2014 14:01:34 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com
Cc: olof@lixom.net, arnd@arndb.de, kesavan.abhilash@gmail.com, Abhilash Kesavan <a.kesavan@samsung.com>

Commit 1754c42e3db5("ARM: exynos: move sysram info to exynos.c") missed
out the CONFIG_ prefix causing exynos_sysram_init() to get called twice
for SMP configurations.

Signed-off-by: Abhilash Kesavan <a.kesavan@samsung.com>
---
 arch/arm/mach-exynos/exynos.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-exynos/exynos.c b/arch/arm/mach-exynos/exynos.c
index f38cf7c..95cad25 100644
--- a/arch/arm/mach-exynos/exynos.c
+++ b/arch/arm/mach-exynos/exynos.c
@@ -297,7 +297,7 @@ static void __init exynos_dt_machine_init(void)
 	 * This is called from smp_prepare_cpus if we've built for SMP, but
 	 * we still need to set it up for PM and firmware ops if not.
 	 */
-	if (!IS_ENABLED(SMP))
+	if (!IS_ENABLED(CONFIG_SMP))
 		exynos_sysram_init();
 
 	exynos_cpuidle_init();
-- 
1.7.9.5
