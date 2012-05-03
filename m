From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 2/2] ARM: EXYNOS: Add FIMC device to SMDK4X12
Date: Thu,  3 May 2012 15:42:36 +0530
Message-ID: <1336039956-19263-2-git-send-email-sachin.kamat@linaro.org>
References: <1336039956-19263-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:35163 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751525Ab2ECKWE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 3 May 2012 06:22:04 -0400
Received: by pbbrp8 with SMTP id rp8so2297752pbb.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 03 May 2012 03:22:04 -0700 (PDT)
In-Reply-To: <1336039956-19263-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, sachin.kamat@linaro.org, patches@linaro.org

Enable FIMC 0,1,2,3 and media device (md) support on SMDK4X12 boards.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 arch/arm/mach-exynos/Kconfig         |    4 ++++
 arch/arm/mach-exynos/mach-smdk4x12.c |    5 +++++
 2 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kconfig
index ac72490..9727cf5 100644
--- a/arch/arm/mach-exynos/Kconfig
+++ b/arch/arm/mach-exynos/Kconfig
@@ -343,6 +343,10 @@ config MACH_SMDK4212
 	select S3C_DEV_I2C7
 	select S3C_DEV_RTC
 	select S3C_DEV_WDT
+	select S5P_DEV_FIMC0
+	select S5P_DEV_FIMC1
+	select S5P_DEV_FIMC2
+	select S5P_DEV_FIMC3
 	select S5P_DEV_MFC
 	select SAMSUNG_DEV_BACKLIGHT
 	select SAMSUNG_DEV_KEYPAD
diff --git a/arch/arm/mach-exynos/mach-smdk4x12.c b/arch/arm/mach-exynos/mach-smdk4x12.c
index 1c259f2..fe772d8 100644
--- a/arch/arm/mach-exynos/mach-smdk4x12.c
+++ b/arch/arm/mach-exynos/mach-smdk4x12.c
@@ -243,6 +243,11 @@ static struct platform_device *smdk4x12_devices[] __initdata = {
 	&s3c_device_i2c7,
 	&s3c_device_rtc,
 	&s3c_device_wdt,
+	&s5p_device_fimc0,
+	&s5p_device_fimc1,
+	&s5p_device_fimc2,
+	&s5p_device_fimc3,
+	&s5p_device_fimc_md,
 	&s5p_device_mfc,
 	&s5p_device_mfc_l,
 	&s5p_device_mfc_r,
-- 
1.7.4.1
