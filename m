From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH] ARM: EXYNOS: Hook up JPEG PD to generic PD infrastructure
Date: Mon, 20 Feb 2012 11:15:02 +0530
Message-ID: <1329716702-9337-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pz0-f46.google.com ([209.85.210.46]:52294 "EHLO
	mail-pz0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750932Ab2BTFvB (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 20 Feb 2012 00:51:01 -0500
Received: by daed14 with SMTP id d14so5426305dae.19
        for <linux-samsung-soc@vger.kernel.org>; Sun, 19 Feb 2012 21:51:01 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, sachin.kamat@linaro.org, patches@linaro.org

Add JPEG power domain (PD) to generic power domain infrastructure.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
Hi Kukjin,
Please apply this over the JPEG platform suport patches for Exynos.

---
 arch/arm/mach-exynos/pm_domains.c |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos/pm_domains.c b/arch/arm/mach-exynos/pm_domains.c
index 0b04af2..4e8340f 100644
--- a/arch/arm/mach-exynos/pm_domains.c
+++ b/arch/arm/mach-exynos/pm_domains.c
@@ -183,6 +183,9 @@ static __init int exynos4_pm_init_power_domain(void)
 #ifdef CONFIG_S5P_DEV_CSIS1
 	exynos_pm_add_dev_to_genpd(&s5p_device_mipi_csis1, &exynos4_pd_cam);
 #endif
+#ifdef CONFIG_S5P_DEV_JPEG
+	exynos_pm_add_dev_to_genpd(&s5p_device_jpeg, &exynos4_pd_cam);
+#endif
 	return 0;
 }
 arch_initcall(exynos4_pm_init_power_domain);
-- 
1.7.4.1
