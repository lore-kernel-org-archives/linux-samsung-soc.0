From: Leela Krishna Amudala <l.krishna@samsung.com>
Subject: [PATCH] ARM: EXYNOS: call scu_enable() only in case of cortex-A9
 processor
Date: Fri, 31 May 2013 15:13:15 +0530
Message-ID: <1369993395-6185-1-git-send-email-l.krishna@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:40958 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754477Ab3EaJTI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 31 May 2013 05:19:08 -0400
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MNN004KLOJ9I5I0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 31 May 2013 18:19:06 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, dianders@chromium.org

This patch reads the cpuid part number and if it matches with
cortex-A9, calls scu_enable()

Signed-off-by: Leela Krishna Amudala <l.krishna@samsung.com>
---
 arch/arm/mach-exynos/platsmp.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-exynos/platsmp.c b/arch/arm/mach-exynos/platsmp.c
index a0e8ff7..d9c6d0a 100644
--- a/arch/arm/mach-exynos/platsmp.c
+++ b/arch/arm/mach-exynos/platsmp.c
@@ -200,7 +200,7 @@ static void __init exynos_smp_prepare_cpus(unsigned int max_cpus)
 {
 	int i;
 
-	if (!(soc_is_exynos5250() || soc_is_exynos5440()))
+	if (read_cpuid_part_number() == ARM_CPU_PART_CORTEX_A9)
 		scu_enable(scu_base_addr());
 
 	/*
-- 
1.7.10.4
