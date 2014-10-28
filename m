From: Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: [PATCH] ARM: EXYNOS: fix typo in static struct name
 "exynos5_list_diable_wfi_wfe"
Date: Tue, 28 Oct 2014 15:20:32 +0530
Message-ID: <1414489832-28011-1-git-send-email-pankaj.dubey@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:14050 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754243AbaJ1J4h (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 28 Oct 2014 05:56:37 -0400
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0NE500DH2FMBV810@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 28 Oct 2014 18:56:35 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, linux@arm.linux.org.uk, thomas.ab@samsung.com, Pankaj Dubey <pankaj.dubey@samsung.com>

This patch fixes a typo in struct named as "exynos5_list_diable_wfi_wfe"
by making it "exynos5_list_disable_wfi_wfe" which is more meaningful.

Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
---
 arch/arm/mach-exynos/pmu.c |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/mach-exynos/pmu.c b/arch/arm/mach-exynos/pmu.c
index cfc62e8..e5e1846 100644
--- a/arch/arm/mach-exynos/pmu.c
+++ b/arch/arm/mach-exynos/pmu.c
@@ -330,7 +330,7 @@ static unsigned int const exynos5_list_both_cnt_feed[] = {
 	EXYNOS5_TOP_PWR_SYSMEM_OPTION,
 };
 
-static unsigned int const exynos5_list_diable_wfi_wfe[] = {
+static unsigned int const exynos5_list_disable_wfi_wfe[] = {
 	EXYNOS5_ARM_CORE1_OPTION,
 	EXYNOS5_FSYS_ARM_OPTION,
 	EXYNOS5_ISP_ARM_OPTION,
@@ -361,11 +361,11 @@ static void exynos5_init_pmu(void)
 	/*
 	 * Disable WFI/WFE on XXX_OPTION
 	 */
-	for (i = 0 ; i < ARRAY_SIZE(exynos5_list_diable_wfi_wfe) ; i++) {
-		tmp = pmu_raw_readl(exynos5_list_diable_wfi_wfe[i]);
+	for (i = 0 ; i < ARRAY_SIZE(exynos5_list_disable_wfi_wfe) ; i++) {
+		tmp = pmu_raw_readl(exynos5_list_disable_wfi_wfe[i]);
 		tmp &= ~(EXYNOS5_OPTION_USE_STANDBYWFE |
 			 EXYNOS5_OPTION_USE_STANDBYWFI);
-		pmu_raw_writel(tmp, exynos5_list_diable_wfi_wfe[i]);
+		pmu_raw_writel(tmp, exynos5_list_disable_wfi_wfe[i]);
 	}
 }
 
-- 
1.7.9.5
