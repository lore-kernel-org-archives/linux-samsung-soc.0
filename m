From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH] ARM: S5PV210: Enable FIMC on SMDKC110
Date: Thu, 29 Dec 2011 09:53:07 +0530
Message-ID: <1325132587-30543-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:34006 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750785Ab1L2E1K (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 28 Dec 2011 23:27:10 -0500
Received: by iaeh11 with SMTP id h11so23034184iae.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 28 Dec 2011 20:27:10 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, sachin.kamat@linaro.org, patches@linaro.org

This patch enables FIMC 0,1,2 and media device (md) on SMDKC110 board.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 arch/arm/mach-s5pv210/Kconfig         |    3 +++
 arch/arm/mach-s5pv210/mach-smdkc110.c |    4 ++++
 2 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-s5pv210/Kconfig b/arch/arm/mach-s5pv210/Kconfig
index 2cdc42e..afceaa9 100644
--- a/arch/arm/mach-s5pv210/Kconfig
+++ b/arch/arm/mach-s5pv210/Kconfig
@@ -118,6 +118,9 @@ config MACH_SMDKC110
 	select S3C_DEV_I2C2
 	select S3C_DEV_RTC
 	select S3C_DEV_WDT
+	select S5P_DEV_FIMC0
+	select S5P_DEV_FIMC1
+	select S5P_DEV_FIMC2
 	select SAMSUNG_DEV_IDE
 	select S5PV210_SETUP_I2C1
 	select S5PV210_SETUP_I2C2
diff --git a/arch/arm/mach-s5pv210/mach-smdkc110.c b/arch/arm/mach-s5pv210/mach-smdkc110.c
index f7266bb..cd823e5 100644
--- a/arch/arm/mach-s5pv210/mach-smdkc110.c
+++ b/arch/arm/mach-s5pv210/mach-smdkc110.c
@@ -92,6 +92,10 @@ static struct platform_device *smdkc110_devices[] __initdata = {
 	&s3c_device_i2c2,
 	&s3c_device_rtc,
 	&s3c_device_wdt,
+	&s5p_device_fimc0,
+	&s5p_device_fimc1,
+	&s5p_device_fimc2,
+	&s5p_device_fimc_md,
 };
 
 static struct i2c_board_info smdkc110_i2c_devs0[] __initdata = {
-- 
1.7.4.1
