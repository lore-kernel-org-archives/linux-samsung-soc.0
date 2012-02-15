From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH] ARM: EXYNOS: Hook up G2D PD to generic PD infrastructure
Date: Wed, 15 Feb 2012 09:31:02 +0530
Message-ID: <1329278462-30851-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pw0-f46.google.com ([209.85.160.46]:59470 "EHLO
	mail-pw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752509Ab2BOEG7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 14 Feb 2012 23:06:59 -0500
Received: by pbcun15 with SMTP id un15so1053121pbc.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 14 Feb 2012 20:06:58 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, rjw@sisk.pl, thomas.abraham@linaro.org, sachin.kamat@linaro.org, patches@linaro.org

Add G2D power domain (PD) to generic power domain infrastructure.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 arch/arm/mach-exynos/pm_domains.c |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos/pm_domains.c b/arch/arm/mach-exynos/pm_domains.c
index 0b04af2..a84df72 100644
--- a/arch/arm/mach-exynos/pm_domains.c
+++ b/arch/arm/mach-exynos/pm_domains.c
@@ -183,6 +183,9 @@ static __init int exynos4_pm_init_power_domain(void)
 #ifdef CONFIG_S5P_DEV_CSIS1
 	exynos_pm_add_dev_to_genpd(&s5p_device_mipi_csis1, &exynos4_pd_cam);
 #endif
+#ifdef CONFIG_S5P_DEV_G2D
+	exynos_pm_add_dev_to_genpd(&s5p_device_g2d, &exynos4_pd_lcd0);
+#endif
 	return 0;
 }
 arch_initcall(exynos4_pm_init_power_domain);
-- 
1.7.4.1
