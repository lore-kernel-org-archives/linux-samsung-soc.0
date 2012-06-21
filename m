From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH] ARM: EXYNOS: Clear SYS_WDTRESET bit to use watchdog reset
Date: Thu, 21 Jun 2012 10:28:14 +0900
Message-ID: <038801cd4f4d$20942bf0$61bc83d0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:11708 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755883Ab2FUB2Q (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 20 Jun 2012 21:28:16 -0400
Received: from epcpsbgm2.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M5Y008641DEHRA0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 21 Jun 2012 10:28:15 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M5Y00B9F1F2SC60@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 21 Jun 2012 10:28:15 +0900 (KST)
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: 'Jonghwan Choi' <jhbird.choi@samsung.com>

From: Jonghwan Choi <jhbird.choi@samsung.com>

When SYS_WDTRESET is set, watchdog timer reset request
is ignored by power management unit.

Signed-off-by: Jonghwan Choi <jhbird.choi@samsung.com>
Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/mach-exynos/include/mach/regs-pmu.h |    5 +++++
 arch/arm/mach-exynos/pmu.c                   |   14 ++++++++++++++
 2 files changed, 19 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos/include/mach/regs-pmu.h b/arch/arm/mach-exynos/include/mach/regs-pmu.h
index 43a99e6..d4e392b 100644
--- a/arch/arm/mach-exynos/include/mach/regs-pmu.h
+++ b/arch/arm/mach-exynos/include/mach/regs-pmu.h
@@ -232,6 +232,11 @@
 
 #define EXYNOS5_USB_CFG						S5P_PMUREG(0x0230)
 
+#define EXYNOS5_AUTO_WDTRESET_DISABLE				S5P_PMUREG(0x0408)
+#define EXYNOS5_MASK_WDTRESET_REQUEST				S5P_PMUREG(0x040C)
+
+#define EXYNOS5_SYS_WDTRESET					(1 << 20)
+
 #define EXYNOS5_ARM_CORE0_SYS_PWR_REG				S5P_PMUREG(0x1000)
 #define EXYNOS5_DIS_IRQ_ARM_CORE0_LOCAL_SYS_PWR_REG		S5P_PMUREG(0x1004)
 #define EXYNOS5_DIS_IRQ_ARM_CORE0_CENTRAL_SYS_PWR_REG		S5P_PMUREG(0x1008)
diff --git a/arch/arm/mach-exynos/pmu.c b/arch/arm/mach-exynos/pmu.c
index 4aacb66..bb4c522 100644
--- a/arch/arm/mach-exynos/pmu.c
+++ b/arch/arm/mach-exynos/pmu.c
@@ -390,6 +390,8 @@ void exynos_sys_powerdown_conf(enum sys_powerdown mode)
 
 static int __init exynos_pmu_init(void)
 {
+	unsigned int value;
+
 	exynos_pmu_config = exynos4210_pmu_config;
 
 	if (soc_is_exynos4210()) {
@@ -399,6 +401,18 @@ static int __init exynos_pmu_init(void)
 		exynos_pmu_config = exynos4x12_pmu_config;
 		pr_info("EXYNOS4x12 PMU Initialize\n");
 	} else if (soc_is_exynos5250()) {
+		/*
+		 * When SYS_WDTRESET is set, watchdog timer reset request
+		 * is ignored by power management unit.
+		 */
+		value = __raw_readl(EXYNOS5_AUTO_WDTRESET_DISABLE);
+		value &= ~EXYNOS5_SYS_WDTRESET;
+		__raw_writel(value, EXYNOS5_AUTO_WDTRESET_DISABLE);
+
+		value = __raw_readl(EXYNOS5_MASK_WDTRESET_REQUEST);
+		value &= ~EXYNOS5_SYS_WDTRESET;
+		__raw_writel(value, EXYNOS5_MASK_WDTRESET_REQUEST);
+
 		exynos_pmu_config = exynos5250_pmu_config;
 		pr_info("EXYNOS5250 PMU Initialize\n");
 	} else {
-- 
1.7.1
