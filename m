From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 3/4] ARM: S5PV210: Enable FIMC on SMDKV210
Date: Mon, 26 Dec 2011 15:30:12 +0530
Message-ID: <1324893613-5469-4-git-send-email-sachin.kamat@linaro.org>
References: <1324893613-5469-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-tul01m020-f174.google.com ([209.85.214.174]:58992 "EHLO
	mail-tul01m020-f174.google.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753955Ab1LZKDm (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 26 Dec 2011 05:03:42 -0500
Received: by obcwo16 with SMTP id wo16so6387035obc.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 26 Dec 2011 02:03:42 -0800 (PST)
In-Reply-To: <1324893613-5469-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: sachin.kamat@linaro.org, kgene.kim@samsung.com, patches@linaro.org

This patch adds support for FIMC 0, 1 and 2 on SMDKV210 board.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 arch/arm/mach-s5pv210/Kconfig         |    3 +++
 arch/arm/mach-s5pv210/mach-smdkv210.c |    3 +++
 2 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-s5pv210/Kconfig b/arch/arm/mach-s5pv210/Kconfig
index 32893c7..66e1b3d 100644
--- a/arch/arm/mach-s5pv210/Kconfig
+++ b/arch/arm/mach-s5pv210/Kconfig
@@ -138,6 +138,9 @@ config MACH_SMDKV210
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
index d50cacd..038fc5f 100644
--- a/arch/arm/mach-s5pv210/mach-smdkv210.c
+++ b/arch/arm/mach-s5pv210/mach-smdkv210.c
@@ -226,6 +226,9 @@ static struct platform_device *smdkv210_devices[] __initdata = {
 	&s3c_device_rtc,
 	&s3c_device_ts,
 	&s3c_device_wdt,
+	&s5p_device_fimc0,
+	&s5p_device_fimc1,
+	&s5p_device_fimc2,
 	&s5p_device_mfc,
 	&s5p_device_mfc_l,
 	&s5p_device_mfc_r,
-- 
1.7.4.1
