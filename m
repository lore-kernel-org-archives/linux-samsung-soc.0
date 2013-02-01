From: Abhilash Kesavan <a.kesavan@samsung.com>
Subject: [PATCH] ARM: EXYNOS5: Fix PMU register configuration for local power
 blocks
Date: Fri, 01 Feb 2013 11:50:26 +0530
Message-ID: <1359699626-28525-1-git-send-email-a.kesavan@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:31942 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754438Ab3BAGMD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 1 Feb 2013 01:12:03 -0500
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MHJ00LAN2JJ77M0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 01 Feb 2013 15:12:01 +0900 (KST)
Received: from abhilash-ubuntu.sisodomain.com ([107.108.73.92])
 by mmp1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTPA id <0MHJ003512JP2WB0@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 01 Feb 2013 15:12:01 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com
Cc: kyungmin.park@samsung.com, Abhilash Kesavan <a.kesavan@samsung.com>

For the six local power blocks - MFC, DISP1, GSC, MAU, G3D and ISP
the respective CMU_RESET, CMU_SYSCLK and CMU_CLKSTOP registers need
to be low initially for normal mode on Exynos5250.
Also fix the corresponding AFTR and LPA configurations.

Signed-off-by: Abhilash Kesavan <a.kesavan@samsung.com>
---
 arch/arm/mach-exynos/pmu.c |   66 ++++++++++++++++++++++++++++++++------------
 1 file changed, 48 insertions(+), 18 deletions(-)

diff --git a/arch/arm/mach-exynos/pmu.c b/arch/arm/mach-exynos/pmu.c
index daebc1a..61cedd7 100644
--- a/arch/arm/mach-exynos/pmu.c
+++ b/arch/arm/mach-exynos/pmu.c
@@ -295,24 +295,24 @@ static struct exynos_pmu_conf exynos5250_pmu_config[] = {
 	{ EXYNOS5_G3D_SYS_PWR_REG,			{ 0x7, 0x0, 0x0} },
 	{ EXYNOS5_DISP1_SYS_PWR_REG,			{ 0x7, 0x0, 0x0} },
 	{ EXYNOS5_MAU_SYS_PWR_REG,			{ 0x7, 0x7, 0x0} },
-	{ EXYNOS5_CMU_CLKSTOP_GSCL_SYS_PWR_REG,		{ 0x1, 0x0, 0x0} },
-	{ EXYNOS5_CMU_CLKSTOP_ISP_SYS_PWR_REG,		{ 0x1, 0x0, 0x0} },
-	{ EXYNOS5_CMU_CLKSTOP_MFC_SYS_PWR_REG,		{ 0x1, 0x0, 0x0} },
-	{ EXYNOS5_CMU_CLKSTOP_G3D_SYS_PWR_REG,		{ 0x1, 0x0, 0x0} },
-	{ EXYNOS5_CMU_CLKSTOP_DISP1_SYS_PWR_REG,	{ 0x1, 0x0, 0x0} },
-	{ EXYNOS5_CMU_CLKSTOP_MAU_SYS_PWR_REG,		{ 0x1, 0x1, 0x0} },
-	{ EXYNOS5_CMU_SYSCLK_GSCL_SYS_PWR_REG,		{ 0x1, 0x0, 0x0} },
-	{ EXYNOS5_CMU_SYSCLK_ISP_SYS_PWR_REG,		{ 0x1, 0x0, 0x0} },
-	{ EXYNOS5_CMU_SYSCLK_MFC_SYS_PWR_REG,		{ 0x1, 0x0, 0x0} },
-	{ EXYNOS5_CMU_SYSCLK_G3D_SYS_PWR_REG,		{ 0x1, 0x0, 0x0} },
-	{ EXYNOS5_CMU_SYSCLK_DISP1_SYS_PWR_REG,		{ 0x1, 0x0, 0x0} },
-	{ EXYNOS5_CMU_SYSCLK_MAU_SYS_PWR_REG,		{ 0x1, 0x1, 0x0} },
-	{ EXYNOS5_CMU_RESET_GSCL_SYS_PWR_REG,		{ 0x1, 0x0, 0x0} },
-	{ EXYNOS5_CMU_RESET_ISP_SYS_PWR_REG,		{ 0x1, 0x0, 0x0} },
-	{ EXYNOS5_CMU_RESET_MFC_SYS_PWR_REG,		{ 0x1, 0x0, 0x0} },
-	{ EXYNOS5_CMU_RESET_G3D_SYS_PWR_REG,		{ 0x1, 0x0, 0x0} },
-	{ EXYNOS5_CMU_RESET_DISP1_SYS_PWR_REG,		{ 0x1, 0x0, 0x0} },
-	{ EXYNOS5_CMU_RESET_MAU_SYS_PWR_REG,		{ 0x1, 0x1, 0x0} },
+	{ EXYNOS5_CMU_CLKSTOP_GSCL_SYS_PWR_REG,		{ 0x0, 0x0, 0x0} },
+	{ EXYNOS5_CMU_CLKSTOP_ISP_SYS_PWR_REG,		{ 0x0, 0x0, 0x0} },
+	{ EXYNOS5_CMU_CLKSTOP_MFC_SYS_PWR_REG,		{ 0x0, 0x0, 0x0} },
+	{ EXYNOS5_CMU_CLKSTOP_G3D_SYS_PWR_REG,		{ 0x0, 0x0, 0x0} },
+	{ EXYNOS5_CMU_CLKSTOP_DISP1_SYS_PWR_REG,	{ 0x0, 0x0, 0x0} },
+	{ EXYNOS5_CMU_CLKSTOP_MAU_SYS_PWR_REG,		{ 0x0, 0x0, 0x0} },
+	{ EXYNOS5_CMU_SYSCLK_GSCL_SYS_PWR_REG,		{ 0x0, 0x0, 0x0} },
+	{ EXYNOS5_CMU_SYSCLK_ISP_SYS_PWR_REG,		{ 0x0, 0x0, 0x0} },
+	{ EXYNOS5_CMU_SYSCLK_MFC_SYS_PWR_REG,		{ 0x0, 0x0, 0x0} },
+	{ EXYNOS5_CMU_SYSCLK_G3D_SYS_PWR_REG,		{ 0x0, 0x0, 0x0} },
+	{ EXYNOS5_CMU_SYSCLK_DISP1_SYS_PWR_REG,		{ 0x0, 0x0, 0x0} },
+	{ EXYNOS5_CMU_SYSCLK_MAU_SYS_PWR_REG,		{ 0x0, 0x0, 0x0} },
+	{ EXYNOS5_CMU_RESET_GSCL_SYS_PWR_REG,		{ 0x0, 0x0, 0x0} },
+	{ EXYNOS5_CMU_RESET_ISP_SYS_PWR_REG,		{ 0x0, 0x0, 0x0} },
+	{ EXYNOS5_CMU_RESET_MFC_SYS_PWR_REG,		{ 0x0, 0x0, 0x0} },
+	{ EXYNOS5_CMU_RESET_G3D_SYS_PWR_REG,		{ 0x0, 0x0, 0x0} },
+	{ EXYNOS5_CMU_RESET_DISP1_SYS_PWR_REG,		{ 0x0, 0x0, 0x0} },
+	{ EXYNOS5_CMU_RESET_MAU_SYS_PWR_REG,		{ 0x0, 0x0, 0x0} },
 	{ PMU_TABLE_END,},
 };
 
@@ -336,6 +336,27 @@ static void __iomem *exynos5_list_diable_wfi_wfe[] = {
 	EXYNOS5_ISP_ARM_OPTION,
 };
 
+void __iomem *exynos5_list_disable_pmu_reg[] = {
+	EXYNOS5_CMU_CLKSTOP_GSCL_SYS_PWR_REG,
+	EXYNOS5_CMU_CLKSTOP_ISP_SYS_PWR_REG,
+	EXYNOS5_CMU_CLKSTOP_MFC_SYS_PWR_REG,
+	EXYNOS5_CMU_CLKSTOP_G3D_SYS_PWR_REG,
+	EXYNOS5_CMU_CLKSTOP_DISP1_SYS_PWR_REG,
+	EXYNOS5_CMU_CLKSTOP_MAU_SYS_PWR_REG,
+	EXYNOS5_CMU_SYSCLK_GSCL_SYS_PWR_REG,
+	EXYNOS5_CMU_SYSCLK_ISP_SYS_PWR_REG,
+	EXYNOS5_CMU_SYSCLK_MFC_SYS_PWR_REG,
+	EXYNOS5_CMU_SYSCLK_G3D_SYS_PWR_REG,
+	EXYNOS5_CMU_SYSCLK_DISP1_SYS_PWR_REG,
+	EXYNOS5_CMU_SYSCLK_MAU_SYS_PWR_REG,
+	EXYNOS5_CMU_RESET_GSCL_SYS_PWR_REG,
+	EXYNOS5_CMU_RESET_ISP_SYS_PWR_REG,
+	EXYNOS5_CMU_RESET_MFC_SYS_PWR_REG,
+	EXYNOS5_CMU_RESET_G3D_SYS_PWR_REG,
+	EXYNOS5_CMU_RESET_DISP1_SYS_PWR_REG,
+	EXYNOS5_CMU_RESET_MAU_SYS_PWR_REG,
+};
+
 static void exynos5_init_pmu(void)
 {
 	unsigned int i;
@@ -392,6 +413,7 @@ void exynos_sys_powerdown_conf(enum sys_powerdown mode)
 static int __init exynos_pmu_init(void)
 {
 	unsigned int value;
+	unsigned int i;
 
 	exynos_pmu_config = exynos4210_pmu_config;
 
@@ -414,6 +436,14 @@ static int __init exynos_pmu_init(void)
 		value &= ~EXYNOS5_SYS_WDTRESET;
 		__raw_writel(value, EXYNOS5_MASK_WDTRESET_REQUEST);
 
+		/*
+		 * Set the CMU_RESET, CMU_SYSCLK and CMU_CLKSTOP registers for
+		 * local power blocks to Low initially as per the "System-Level
+		 * Power-Down Configuration Registers" table.
+		 */
+		for (i = 0; i < ARRAY_SIZE(exynos5_list_disable_pmu_reg); i++)
+			__raw_writel(0x0, exynos5_list_disable_pmu_reg[i]);
+
 		exynos_pmu_config = exynos5250_pmu_config;
 		pr_info("EXYNOS5250 PMU Initialize\n");
 	} else {
-- 
1.7.9.5
