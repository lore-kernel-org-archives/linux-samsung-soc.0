From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: [PATCH] ARM: Exynos: remove unused init_uarts callback for exynos4x12
 platforms
Date: Mon, 05 Nov 2012 20:02:53 +0530
Message-ID: <1352125973-24228-1-git-send-email-thomas.abraham@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:9494 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751088Ab2KEOH5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 5 Nov 2012 09:07:57 -0500
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MD000FN6PWYR1B0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 05 Nov 2012 23:07:56 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.37])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MD000JO6PW5FMA0@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 05 Nov 2012 23:07:56 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com

All the Exynos4x12 based platforms use only device tree based boot. So remove
the unused 'init_uarts' callback from exynos cpu_ids table.

Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
---
 arch/arm/mach-exynos/common.c |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-exynos/common.c b/arch/arm/mach-exynos/common.c
index 56844d1..ce91cba 100644
--- a/arch/arm/mach-exynos/common.c
+++ b/arch/arm/mach-exynos/common.c
@@ -78,7 +78,6 @@ static struct cpu_table cpu_ids[] __initdata = {
 		.idmask		= EXYNOS4_CPU_MASK,
 		.map_io		= exynos4_map_io,
 		.init_clocks	= exynos4_init_clocks,
-		.init_uarts	= exynos_init_uarts,
 		.init		= exynos_init,
 		.name		= name_exynos4212,
 	}, {
@@ -86,7 +85,6 @@ static struct cpu_table cpu_ids[] __initdata = {
 		.idmask		= EXYNOS4_CPU_MASK,
 		.map_io		= exynos4_map_io,
 		.init_clocks	= exynos4_init_clocks,
-		.init_uarts	= exynos_init_uarts,
 		.init		= exynos_init,
 		.name		= name_exynos4412,
 	}, {
-- 
1.6.6.rc2
