From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH] exynos: pmu: use PS_HOLD based poweroff for all supported SoCs
Date: Mon, 09 Feb 2015 08:25:41 +0100
Message-ID: <1423466741-11421-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:23515 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752616AbbBIHZw (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 9 Feb 2015 02:25:52 -0500
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0NJH005J5U5P5020@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 09 Feb 2015 07:29:49 +0000 (GMT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Kukjin Kim <kgene@kernel.org>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Daniel Drake <drake@endlessm.com>

PS_HOLD based power off procedure is common for all Exynos SoCs, so use
it for every Exynos SoC.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm/mach-exynos/pmu.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/mach-exynos/pmu.c b/arch/arm/mach-exynos/pmu.c
index c15761ca2f18..e812c1c85624 100644
--- a/arch/arm/mach-exynos/pmu.c
+++ b/arch/arm/mach-exynos/pmu.c
@@ -681,7 +681,7 @@ static unsigned int const exynos5420_list_disable_pmu_reg[] = {
 	EXYNOS5420_CMU_RESET_FSYS_SYS_PWR_REG,
 };
 
-static void exynos5_power_off(void)
+static void exynos_power_off(void)
 {
 	unsigned int tmp;
 
@@ -872,8 +872,6 @@ static void exynos5420_pmu_init(void)
 			EXYNOS5420_ARM_INTR_SPREAD_USE_STANDBYWFI);
 
 	pmu_raw_writel(0x1, EXYNOS5420_UP_SCHEDULER);
-
-	pm_power_off = exynos5_power_off;
 	pr_info("EXYNOS5420 PMU initialized\n");
 }
 
@@ -984,6 +982,8 @@ static int exynos_pmu_probe(struct platform_device *pdev)
 	if (ret)
 		dev_warn(dev, "can't register restart handler err=%d\n", ret);
 
+	pm_power_off = exynos_power_off;
+
 	dev_dbg(dev, "Exynos PMU Driver probe done\n");
 	return 0;
 }
-- 
1.9.2
