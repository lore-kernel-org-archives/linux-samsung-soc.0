From: Alim Akhtar <alim.akhtar@samsung.com>
Subject: [PATCH 7/7] ARM: EXYNOS: Remove code for restart and poweroff for
 exynos SoCs
Date: Mon, 19 Oct 2015 11:33:55 +0530
Message-ID: <1445234635-3950-8-git-send-email-alim.akhtar@samsung.com>
References: <1445234635-3950-1-git-send-email-alim.akhtar@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:60796 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751596AbbJSGRu (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 19 Oct 2015 02:17:50 -0400
In-reply-to: <1445234635-3950-1-git-send-email-alim.akhtar@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene@kernel.org, k.kozlowski@samsung.com, javier@osg.samsung.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Now we can use the generic syscon-{reboot/poweroff} drivers,
so we don't need special handling for reboot/poweroff in
exynos pmu driver. This patch remove the same.

Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
---
 arch/arm/mach-exynos/pmu.c |   43 -------------------------------------------
 1 file changed, 43 deletions(-)

diff --git a/arch/arm/mach-exynos/pmu.c b/arch/arm/mach-exynos/pmu.c
index de68938ee6aa..393c04aa727e 100644
--- a/arch/arm/mach-exynos/pmu.c
+++ b/arch/arm/mach-exynos/pmu.c
@@ -14,9 +14,6 @@
 #include <linux/of_address.h>
 #include <linux/platform_device.h>
 #include <linux/delay.h>
-#include <linux/notifier.h>
-#include <linux/reboot.h>
-
 
 #include "exynos-pmu.h"
 #include "regs-pmu.h"
@@ -681,23 +678,6 @@ static unsigned int const exynos5420_list_disable_pmu_reg[] = {
 	EXYNOS5420_CMU_RESET_FSYS_SYS_PWR_REG,
 };
 
-static void exynos_power_off(void)
-{
-	unsigned int tmp;
-
-	pr_info("Power down.\n");
-	tmp = pmu_raw_readl(EXYNOS_PS_HOLD_CONTROL);
-	tmp ^= (1 << 8);
-	pmu_raw_writel(tmp, EXYNOS_PS_HOLD_CONTROL);
-
-	/* Wait a little so we don't give a false warning below */
-	mdelay(100);
-
-	pr_err("Power down failed, please power off system manually.\n");
-	while (1)
-		;
-}
-
 static void exynos5420_powerdown_conf(enum sys_powerdown mode)
 {
 	u32 this_cluster;
@@ -875,14 +855,6 @@ static void exynos5420_pmu_init(void)
 	pr_info("EXYNOS5420 PMU initialized\n");
 }
 
-static int pmu_restart_notify(struct notifier_block *this,
-		unsigned long code, void *unused)
-{
-	pmu_raw_writel(0x1, EXYNOS_SWRESET);
-
-	return NOTIFY_DONE;
-}
-
 static const struct exynos_pmu_data exynos3250_pmu_data = {
 	.pmu_config	= exynos3250_pmu_config,
 	.pmu_init	= exynos3250_pmu_init,
@@ -940,20 +912,11 @@ static const struct of_device_id exynos_pmu_of_device_ids[] = {
 	{ /*sentinel*/ },
 };
 
-/*
- * Exynos PMU restart notifier, handles restart functionality
- */
-static struct notifier_block pmu_restart_handler = {
-	.notifier_call = pmu_restart_notify,
-	.priority = 128,
-};
-
 static int exynos_pmu_probe(struct platform_device *pdev)
 {
 	const struct of_device_id *match;
 	struct device *dev = &pdev->dev;
 	struct resource *res;
-	int ret;
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	pmu_base_addr = devm_ioremap_resource(dev, res);
@@ -978,12 +941,6 @@ static int exynos_pmu_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, pmu_context);
 
-	ret = register_restart_handler(&pmu_restart_handler);
-	if (ret)
-		dev_warn(dev, "can't register restart handler err=%d\n", ret);
-
-	pm_power_off = exynos_power_off;
-
 	dev_dbg(dev, "Exynos PMU Driver probe done\n");
 	return 0;
 }
-- 
1.7.10.4
