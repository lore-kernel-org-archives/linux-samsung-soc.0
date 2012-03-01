From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 4/4] ARM: S5PV210: Enable JPEG on SMDKV210
Date: Thu,  1 Mar 2012 09:35:52 +0530
Message-ID: <1330574752-14088-5-git-send-email-sachin.kamat@linaro.org>
References: <1330574752-14088-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pz0-f51.google.com ([209.85.210.51]:57766 "EHLO
	mail-pz0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754186Ab2CAEUr (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 29 Feb 2012 23:20:47 -0500
Received: by dady9 with SMTP id y9so281788dad.10
        for <linux-samsung-soc@vger.kernel.org>; Wed, 29 Feb 2012 20:20:47 -0800 (PST)
In-Reply-To: <1330574752-14088-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, sachin.kamat@linaro.org, patches@linaro.org

Enables JPEG support on SMDKV210 board.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 arch/arm/mach-s5pv210/Kconfig         |    1 +
 arch/arm/mach-s5pv210/mach-smdkv210.c |    1 +
 2 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-s5pv210/Kconfig b/arch/arm/mach-s5pv210/Kconfig
index 2cdc42e..ba63c3a 100644
--- a/arch/arm/mach-s5pv210/Kconfig
+++ b/arch/arm/mach-s5pv210/Kconfig
@@ -142,6 +142,7 @@ config MACH_SMDKV210
 	select S3C_DEV_I2C2
 	select S3C_DEV_RTC
 	select S3C_DEV_WDT
+	select S5P_DEV_JPEG
 	select SAMSUNG_DEV_ADC
 	select SAMSUNG_DEV_BACKLIGHT
 	select SAMSUNG_DEV_IDE
diff --git a/arch/arm/mach-s5pv210/mach-smdkv210.c b/arch/arm/mach-s5pv210/mach-smdkv210.c
index 0933c8e..37b16fc 100644
--- a/arch/arm/mach-s5pv210/mach-smdkv210.c
+++ b/arch/arm/mach-s5pv210/mach-smdkv210.c
@@ -223,6 +223,7 @@ static struct platform_device *smdkv210_devices[] __initdata = {
 	&s3c_device_rtc,
 	&s3c_device_ts,
 	&s3c_device_wdt,
+	&s5p_device_jpeg,
 	&s5pv210_device_ac97,
 	&s5pv210_device_iis0,
 	&s5pv210_device_spdif,
-- 
1.7.4.1
