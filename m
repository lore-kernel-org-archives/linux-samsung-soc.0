From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH-RESEND 3/4] ARM: S5PV210: Enable FIMC on SMDKV210
Date: Mon, 13 Feb 2012 10:48:50 +0530
Message-ID: <1329110331-12746-4-git-send-email-sachin.kamat@linaro.org>
References: <1329110331-12746-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pw0-f46.google.com ([209.85.160.46]:48042 "EHLO
	mail-pw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751363Ab2BMFYo (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 13 Feb 2012 00:24:44 -0500
Received: by pbcun15 with SMTP id un15so4264500pbc.19
        for <linux-samsung-soc@vger.kernel.org>; Sun, 12 Feb 2012 21:24:44 -0800 (PST)
In-Reply-To: <1329110331-12746-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: sachin.kamat@linaro.org, kgene.kim@samsung.com, patches@linaro.org

Enable FIMC 0,1,2 and media device(md) on SMDKV210 board.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 arch/arm/mach-s5pv210/Kconfig         |    3 +++
 arch/arm/mach-s5pv210/mach-smdkv210.c |    4 ++++
 2 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-s5pv210/Kconfig b/arch/arm/mach-s5pv210/Kconfig
index dd9bdab..cf3be3b 100644
--- a/arch/arm/mach-s5pv210/Kconfig
+++ b/arch/arm/mach-s5pv210/Kconfig
@@ -143,6 +143,9 @@ config MACH_SMDKV210
 	select S3C_DEV_I2C2
 	select S3C_DEV_RTC
 	select S3C_DEV_WDT
+	select S5P_DEV_FIMC0
+	select S5P_DEV_FIMC1
+	select S5P_DEV_FIMC2
 	select S5P_DEV_MFC
 	select SAMSUNG_DEV_ADC
 	select SAMSUNG_DEV_BACKLIGHT
diff --git a/arch/arm/mach-s5pv210/mach-smdkv210.c b/arch/arm/mach-s5pv210/mach-smdkv210.c
index 0b0d65d..7b9d0ce 100644
--- a/arch/arm/mach-s5pv210/mach-smdkv210.c
+++ b/arch/arm/mach-s5pv210/mach-smdkv210.c
@@ -224,6 +224,10 @@ static struct platform_device *smdkv210_devices[] __initdata = {
 	&s3c_device_rtc,
 	&s3c_device_ts,
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
