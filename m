From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH] ARM: EXYNOS4: Enable system MMU support on Origen
Date: Wed, 17 Aug 2011 12:32:31 +0530
Message-ID: <1313564551-1196-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pz0-f42.google.com ([209.85.210.42]:46374 "EHLO
	mail-pz0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750813Ab1HQHEy (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 17 Aug 2011 03:04:54 -0400
Received: by pzk37 with SMTP id 37so577472pzk.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 17 Aug 2011 00:04:54 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, linaro-dev@lists.linaro.org, patches@linaro.org, sachin.kamat@linaro.org

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 arch/arm/mach-exynos4/Kconfig       |    1 +
 arch/arm/mach-exynos4/mach-origen.c |    1 +
 2 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos4/Kconfig b/arch/arm/mach-exynos4/Kconfig
index 3ab0f18..bdb76e2 100644
--- a/arch/arm/mach-exynos4/Kconfig
+++ b/arch/arm/mach-exynos4/Kconfig
@@ -192,6 +192,7 @@ config MACH_ORIGEN
 	select S3C_DEV_RTC
 	select S3C_DEV_WDT
 	select S3C_DEV_HSMMC2
+	select EXYNOS4_DEV_SYSMMU
 	select EXYNOS4_SETUP_SDHCI
 	help
 	  Machine support for ORIGEN based on Samsung EXYNOS4210
diff --git a/arch/arm/mach-exynos4/mach-origen.c b/arch/arm/mach-exynos4/mach-origen.c
index ed59f86..d04f7ee 100644
--- a/arch/arm/mach-exynos4/mach-origen.c
+++ b/arch/arm/mach-exynos4/mach-origen.c
@@ -83,6 +83,7 @@ static struct platform_device *origen_devices[] __initdata = {
 	&s3c_device_hsmmc2,
 	&s3c_device_rtc,
 	&s3c_device_wdt,
+	&exynos4_device_sysmmu,
 };
 
 static void __init origen_map_io(void)
-- 
1.7.4.1
