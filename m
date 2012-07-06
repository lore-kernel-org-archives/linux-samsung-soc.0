From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 1/1] ARM: EXYNOS: Add missing static storage class specifier in pmu.c file
Date: Fri,  6 Jul 2012 17:22:23 +0530
Message-ID: <1341575543-19521-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yw0-f46.google.com ([209.85.213.46]:50305 "EHLO
	mail-yw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1030337Ab2GFMEs (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 6 Jul 2012 08:04:48 -0400
Received: by yhmm54 with SMTP id m54so9277134yhm.19
        for <linux-samsung-soc@vger.kernel.org>; Fri, 06 Jul 2012 05:04:48 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, sachin.kamat@linaro.org, patches@linaro.org

arch/arm/mach-exynos/pmu.c:318:14: warning:
symbol 'exynos5_list_both_cnt_feed' was not declared. Should it be static?
arch/arm/mach-exynos/pmu.c:332:14: warning:
symbol 'exynos5_list_diable_wfi_wfe' was not declared. Should it be static?

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 arch/arm/mach-exynos/pmu.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-exynos/pmu.c b/arch/arm/mach-exynos/pmu.c
index bb4c522..3a48c85 100644
--- a/arch/arm/mach-exynos/pmu.c
+++ b/arch/arm/mach-exynos/pmu.c
@@ -315,7 +315,7 @@ static struct exynos_pmu_conf exynos5250_pmu_config[] = {
 	{ PMU_TABLE_END,},
 };
 
-void __iomem *exynos5_list_both_cnt_feed[] = {
+static void __iomem *exynos5_list_both_cnt_feed[] = {
 	EXYNOS5_ARM_CORE0_OPTION,
 	EXYNOS5_ARM_CORE1_OPTION,
 	EXYNOS5_ARM_COMMON_OPTION,
@@ -329,7 +329,7 @@ void __iomem *exynos5_list_both_cnt_feed[] = {
 	EXYNOS5_TOP_PWR_SYSMEM_OPTION,
 };
 
-void __iomem *exynos5_list_diable_wfi_wfe[] = {
+static void __iomem *exynos5_list_diable_wfi_wfe[] = {
 	EXYNOS5_ARM_CORE1_OPTION,
 	EXYNOS5_FSYS_ARM_OPTION,
 	EXYNOS5_ISP_ARM_OPTION,
-- 
1.7.4.1
