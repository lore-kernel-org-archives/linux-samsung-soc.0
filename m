From: Vikas Sajjan <vikas.sajjan@samsung.com>
Subject: [PATCH v3 1/2] ARM: EXYNOS: Move Disabling of JPEG USE_RETENTION for exynos5250 to pmu.c
Date: Thu,  7 Aug 2014 17:44:47 +0545
Message-ID: <1407412789-1919-2-git-send-email-vikas.sajjan@samsung.com>
References: <1407412789-1919-1-git-send-email-vikas.sajjan@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f44.google.com ([209.85.220.44]:48280 "EHLO
	mail-pa0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757235AbaHGMAM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 7 Aug 2014 08:00:12 -0400
Received: by mail-pa0-f44.google.com with SMTP id eu11so5344957pac.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 07 Aug 2014 05:00:11 -0700 (PDT)
In-Reply-To: <1407412789-1919-1-git-send-email-vikas.sajjan@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, tomasz.figa@gmail.com, joshi@samsung.com, sajjan.linux@gmail.com, dianders@chromium.org, olof@lixom.net

Move the Disabling of JPEG USE_RETENTION for exynos5250 to pmu.c to make way for
refactoring of pm.c and to create common functions across exynos4 and
exynos5250.

Signed-off-by: Vikas Sajjan <vikas.sajjan@samsung.com>
---
 arch/arm/mach-exynos/pm.c  |    7 +------
 arch/arm/mach-exynos/pmu.c |    6 ++++++
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/arch/arm/mach-exynos/pm.c b/arch/arm/mach-exynos/pm.c
index c4c6d98..fdd68c2 100644
--- a/arch/arm/mach-exynos/pm.c
+++ b/arch/arm/mach-exynos/pm.c
@@ -265,13 +265,8 @@ static void exynos_pm_prepare(void)
 
 	s3c_pm_do_save(exynos_core_save, ARRAY_SIZE(exynos_core_save));
 
-	if (soc_is_exynos5250()) {
+	if (soc_is_exynos5250())
 		s3c_pm_do_save(exynos5_sys_save, ARRAY_SIZE(exynos5_sys_save));
-		/* Disable USE_RETENTION of JPEG_MEM_OPTION */
-		tmp = pmu_raw_readl(EXYNOS5_JPEG_MEM_OPTION);
-		tmp &= ~EXYNOS5_OPTION_USE_RETENTION;
-		pmu_raw_writel(tmp, EXYNOS5_JPEG_MEM_OPTION);
-	}
 
 	/* Set value of power down register for sleep mode */
 
diff --git a/arch/arm/mach-exynos/pmu.c b/arch/arm/mach-exynos/pmu.c
index ff9d23f..6021adb 100644
--- a/arch/arm/mach-exynos/pmu.c
+++ b/arch/arm/mach-exynos/pmu.c
@@ -389,6 +389,7 @@ void exynos_sys_powerdown_conf(enum sys_powerdown mode)
 static int __init exynos_pmu_init(void)
 {
 	unsigned int value;
+	unsigned int tmp;
 
 	exynos_pmu_config = exynos4210_pmu_config;
 
@@ -411,6 +412,11 @@ static int __init exynos_pmu_init(void)
 		value &= ~EXYNOS5_SYS_WDTRESET;
 		pmu_raw_writel(value, EXYNOS5_MASK_WDTRESET_REQUEST);
 
+		/* Disable USE_RETENTION of JPEG_MEM_OPTION */
+		tmp = pmu_raw_readl(EXYNOS5_JPEG_MEM_OPTION);
+		tmp &= ~EXYNOS5_OPTION_USE_RETENTION;
+		pmu_raw_writel(tmp, EXYNOS5_JPEG_MEM_OPTION);
+
 		exynos_pmu_config = exynos5250_pmu_config;
 		pr_info("EXYNOS5250 PMU Initialize\n");
 	} else {
-- 
1.7.9.5
