From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 1/1] ARM: EXYNOS: Add default latency values for Device and Power Domain
Date: Fri,  8 Nov 2013 11:57:05 +0530
Message-ID: <1383892025-14759-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f174.google.com ([209.85.192.174]:52229 "EHLO
	mail-pd0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750995Ab3KHG2s (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 8 Nov 2013 01:28:48 -0500
Received: by mail-pd0-f174.google.com with SMTP id z10so1707149pdj.33
        for <linux-samsung-soc@vger.kernel.org>; Thu, 07 Nov 2013 22:28:47 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, prathyush.k@samsung.com, sachin.kamat@linaro.org, Prasanna Kumar <prasanna.ps@samsung.com>

From: Prasanna Kumar <prasanna.ps@samsung.com>

Power domain and device timing data are intialized with default
values to avoid dump of warnings from various power domains
during power gating.

Signed-off-by: Prasanna Kumar <prasanna.ps@samsung.com>
Signed-off-by: Prathyush K <prathyush.k@samsung.com>
Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 arch/arm/mach-exynos/pm_domains.c |   15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-exynos/pm_domains.c b/arch/arm/mach-exynos/pm_domains.c
index 84e0483a0500..9bbb4ac23980 100644
--- a/arch/arm/mach-exynos/pm_domains.c
+++ b/arch/arm/mach-exynos/pm_domains.c
@@ -25,6 +25,10 @@
 #include <mach/regs-pmu.h>
 #include <plat/devs.h>
 
+#define DEFAULT_DEV_LATENCY_NS			1000000UL
+#define DEFAULT_PD_PWRON_LATENCY_NS		10000000UL
+#define DEFAULT_PD_PWROFF_LATENCY_NS		10000000UL
+
 /*
  * Exynos specific wrapper around the generic power domain
  */
@@ -36,6 +40,13 @@ struct exynos_pm_domain {
 	u32 enable;
 };
 
+static struct gpd_timing_data dev_latencies = {
+	.stop_latency_ns = DEFAULT_DEV_LATENCY_NS,
+	.start_latency_ns = DEFAULT_DEV_LATENCY_NS,
+	.save_state_latency_ns = DEFAULT_DEV_LATENCY_NS,
+	.restore_state_latency_ns = DEFAULT_DEV_LATENCY_NS,
+};
+
 static int exynos_pd_power(struct generic_pm_domain *domain, bool power_on)
 {
 	struct exynos_pm_domain *pd;
@@ -83,7 +94,7 @@ static void exynos_add_device_to_domain(struct exynos_pm_domain *pd,
 	dev_dbg(dev, "adding to power domain %s\n", pd->pd.name);
 
 	while (1) {
-		ret = pm_genpd_add_device(&pd->pd, dev);
+		ret = __pm_genpd_add_device(&pd->pd, dev, &dev_latencies);
 		if (ret != -EAGAIN)
 			break;
 		cond_resched();
@@ -173,6 +184,8 @@ static __init int exynos4_pm_init_power_domain(void)
 		pd->base = of_iomap(np, 0);
 		pd->pd.power_off = exynos_pd_power_off;
 		pd->pd.power_on = exynos_pd_power_on;
+		pd->pd.power_off_latency_ns = DEFAULT_PD_PWROFF_LATENCY_NS;
+		pd->pd.power_on_latency_ns = DEFAULT_PD_PWRON_LATENCY_NS;
 		pd->pd.of_node = np;
 
 		platform_set_drvdata(pdev, pd);
-- 
1.7.9.5
