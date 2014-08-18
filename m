From: Vikas Sajjan <vikas.sajjan@samsung.com>
Subject: [PATCH v4 1/2] ARM: EXYNOS: Move Disabling of JPEG USE_RETENTION for exynos5250 to pmu.c
Date: Mon, 18 Aug 2014 19:34:20 +0545
Message-ID: <1408369761-5458-2-git-send-email-vikas.sajjan@samsung.com>
References: <1408369761-5458-1-git-send-email-vikas.sajjan@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f41.google.com ([209.85.220.41]:61015 "EHLO
	mail-pa0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750709AbaHRNtm (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 18 Aug 2014 09:49:42 -0400
Received: by mail-pa0-f41.google.com with SMTP id rd3so7743154pab.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 18 Aug 2014 06:49:37 -0700 (PDT)
In-Reply-To: <1408369761-5458-1-git-send-email-vikas.sajjan@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, tomasz.figa@gmail.com, joshi@samsung.com, sajjan.linux@gmail.com, dianders@chromium.org, olof@lixom.net

Move the Disabling of JPEG USE_RETENTION for exynos5250 to pmu.c to make way for
refactoring of pm.c and to create common functions across exynos4 and
exynos5250.

Signed-off-by: Vikas Sajjan <vikas.sajjan@samsung.com>
Reviewed-by: Tomasz Figa <t.figa@samsung.com>
---
 arch/arm/mach-exynos/pm.c  |    7 +------
 arch/arm/mach-exynos/pmu.c |    1 +
 2 files changed, 2 insertions(+), 6 deletions(-)

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
index ff9d23f..cfc62e8 100644
--- a/arch/arm/mach-exynos/pmu.c
+++ b/arch/arm/mach-exynos/pmu.c
@@ -264,6 +264,7 @@ static const struct exynos_pmu_conf exynos5250_pmu_config[] = {
 	{ EXYNOS5_INTRAM_MEM_SYS_PWR_REG,		{ 0x3, 0x0, 0x0} },
 	{ EXYNOS5_INTROM_MEM_SYS_PWR_REG,		{ 0x3, 0x0, 0x0} },
 	{ EXYNOS5_JPEG_MEM_SYS_PWR_REG,			{ 0x3, 0x0, 0x0} },
+	{ EXYNOS5_JPEG_MEM_OPTION,			{ 0x10, 0x10, 0x0} },
 	{ EXYNOS5_HSI_MEM_SYS_PWR_REG,			{ 0x3, 0x0, 0x0} },
 	{ EXYNOS5_MCUIOP_MEM_SYS_PWR_REG,		{ 0x3, 0x0, 0x0} },
 	{ EXYNOS5_SATA_MEM_SYS_PWR_REG,			{ 0x3, 0x0, 0x0} },
-- 
1.7.9.5
