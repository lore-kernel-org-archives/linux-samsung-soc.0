From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH-RESEND 4/4] ARM: S5PV210: Enable FIMC on SMDKC110
Date: Mon, 13 Feb 2012 10:48:51 +0530
Message-ID: <1329110331-12746-5-git-send-email-sachin.kamat@linaro.org>
References: <1329110331-12746-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pw0-f46.google.com ([209.85.160.46]:48042 "EHLO
	mail-pw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751161Ab2BMFYv (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 13 Feb 2012 00:24:51 -0500
Received: by mail-pw0-f46.google.com with SMTP id un15so4264500pbc.19
        for <linux-samsung-soc@vger.kernel.org>; Sun, 12 Feb 2012 21:24:51 -0800 (PST)
In-Reply-To: <1329110331-12746-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: sachin.kamat@linaro.org, kgene.kim@samsung.com, patches@linaro.org

Enable FIMC 0,1,2 and media device (md) on SMDKC110 board.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 arch/arm/mach-s5pv210/Kconfig         |    3 +++
 arch/arm/mach-s5pv210/mach-smdkc110.c |    4 ++++
 2 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-s5pv210/Kconfig b/arch/arm/mach-s5pv210/Kconfig
index cf3be3b..c338b86 100644
--- a/arch/arm/mach-s5pv210/Kconfig
+++ b/arch/arm/mach-s5pv210/Kconfig
@@ -118,6 +118,9 @@ config MACH_SMDKC110
 	select S3C_DEV_I2C2
 	select S3C_DEV_RTC
 	select S3C_DEV_WDT
+	select S5P_DEV_FIMC0
+	select S5P_DEV_FIMC1
+	select S5P_DEV_FIMC2
 	select S5P_DEV_MFC
 	select SAMSUNG_DEV_IDE
 	select S5PV210_SETUP_I2C1
diff --git a/arch/arm/mach-s5pv210/mach-smdkc110.c b/arch/arm/mach-s5pv210/mach-smdkc110.c
index 7100f7e..dfc2923 100644
--- a/arch/arm/mach-s5pv210/mach-smdkc110.c
+++ b/arch/arm/mach-s5pv210/mach-smdkc110.c
@@ -95,6 +95,10 @@ static struct platform_device *smdkc110_devices[] __initdata = {
 	&s3c_device_i2c2,
 	&s3c_device_rtc,
 	&s3c_device_wdt,
+	&s5p_device_fimc0,
+	&s5p_device_fimc1,
+	&s5p_device_fimc2,
+	&s5p_device_fimc_md,
 	&s5p_device_mfc,
 	&s5p_device_mfc_l,
 	&s5p_device_mfc_r,
-- 
1.7.4.1
