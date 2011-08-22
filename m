From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH] ARM: EXYNOS4: Add FIMC device on Origen board
Date: Mon, 22 Aug 2011 17:31:58 +0530
Message-ID: <1314014518-10516-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pz0-f42.google.com ([209.85.210.42]:65268 "EHLO
	mail-pz0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751637Ab1HVMEj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 22 Aug 2011 08:04:39 -0400
Received: by pzk37 with SMTP id 37so8554005pzk.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 22 Aug 2011 05:04:39 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, linaro-dev@lists.linaro.org, patches@linaro.org, sachin.kamat@linaro.org

This patch adds definitions to enable support for s5p-fimc driver on
Origen board.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 arch/arm/mach-exynos4/Kconfig       |    4 ++++
 arch/arm/mach-exynos4/mach-origen.c |    4 ++++
 2 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos4/Kconfig b/arch/arm/mach-exynos4/Kconfig
index e6925de..a3d92a8 100644
--- a/arch/arm/mach-exynos4/Kconfig
+++ b/arch/arm/mach-exynos4/Kconfig
@@ -227,6 +227,10 @@ config MACH_NURI
 config MACH_ORIGEN
 	bool "ORIGEN"
 	select CPU_EXYNOS4210
+	select S5P_DEV_FIMC0
+	select S5P_DEV_FIMC1
+	select S5P_DEV_FIMC2
+	select S5P_DEV_FIMC3
 	select S3C_DEV_RTC
 	select S3C_DEV_WDT
 	select S3C_DEV_HSMMC2
diff --git a/arch/arm/mach-exynos4/mach-origen.c b/arch/arm/mach-exynos4/mach-origen.c
index ed59f86..4a2ac49 100644
--- a/arch/arm/mach-exynos4/mach-origen.c
+++ b/arch/arm/mach-exynos4/mach-origen.c
@@ -80,6 +80,10 @@ static struct s3c_sdhci_platdata origen_hsmmc2_pdata __initdata = {
 };
 
 static struct platform_device *origen_devices[] __initdata = {
+	&s5p_device_fimc0,
+	&s5p_device_fimc1,
+	&s5p_device_fimc2,
+	&s5p_device_fimc3,
 	&s3c_device_hsmmc2,
 	&s3c_device_rtc,
 	&s3c_device_wdt,
-- 
1.7.4.1
