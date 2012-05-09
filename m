From: Sangwook Lee <sangwook.lee@linaro.org>
Subject: [PATCH] ARM: EXYNOS: PD: Fix duplicate variable
Date: Wed,  9 May 2012 13:50:28 +0100
Message-ID: <1336567828-9967-1-git-send-email-sangwook.lee@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bk0-f46.google.com ([209.85.214.46]:60170 "EHLO
	mail-bk0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759200Ab2EIMwf (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 9 May 2012 08:52:35 -0400
Received: by bkcji2 with SMTP id ji2so228737bkc.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 09 May 2012 05:52:34 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, linux@arm.linux.org.uk, linaro-dev@lists.linaro.org, patches@linaro.org, Sangwook Lee <sangwook.lee@linaro.org>

struct generic_pm_domain already has a field for name. Use that field
instead of creating another field in struct exynos_pm_domain

Signed-off-by: Sangwook Lee <sangwook.lee@linaro.org>
---
 arch/arm/mach-exynos/pm_domains.c |    7 +++----
 1 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/arch/arm/mach-exynos/pm_domains.c b/arch/arm/mach-exynos/pm_domains.c
index 13b3068..4d2563c 100644
--- a/arch/arm/mach-exynos/pm_domains.c
+++ b/arch/arm/mach-exynos/pm_domains.c
@@ -28,7 +28,6 @@
  */
 struct exynos_pm_domain {
 	void __iomem *base;
-	char const *name;
 	bool is_off;
 	struct generic_pm_domain pd;
 };
@@ -75,10 +74,10 @@ static int exynos_pd_power_off(struct generic_pm_domain *domain)
 #define EXYNOS_GPD(PD, BASE, NAME)			\
 static struct exynos_pm_domain PD = {			\
 	.base = (void __iomem *)BASE,			\
-	.name = NAME,					\
 	.pd = {						\
 		.power_off = exynos_pd_power_off,	\
 		.power_on = exynos_pd_power_on,	\
+		.name = NAME,				\
 	},						\
 }
 
@@ -99,7 +98,7 @@ static __init int exynos_pm_dt_parse_domains(void)
 
 		if (of_get_property(np, "samsung,exynos4210-pd-off", NULL))
 			pd->is_off = true;
-		pd->name = np->name;
+		pd->pd.name = (char *)np->name;
 		pd->base = of_iomap(np, 0);
 		pd->pd.power_off = exynos_pd_power_off;
 		pd->pd.power_on = exynos_pd_power_on;
@@ -122,7 +121,7 @@ static __init void exynos_pm_add_dev_to_genpd(struct platform_device *pdev,
 		if (pm_genpd_add_device(&pd->pd, &pdev->dev))
 			pr_info("%s: error in adding %s device to %s power"
 				"domain\n", __func__, dev_name(&pdev->dev),
-				pd->name);
+				pd->pd.name);
 	}
 }
 
-- 
1.7.4.1
