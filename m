From: Vladimir Zapolskiy <vzapolskiy@gmail.com>
Subject: [PATCH 4/4] ARM: S5PV210: add security subsystem platform device to SMDK boards
Date: Tue, 12 Apr 2011 01:02:57 +0300
Message-ID: <1302559377-14857-5-git-send-email-vzapolskiy@gmail.com>
References: <1302559377-14857-1-git-send-email-vzapolskiy@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ey0-f174.google.com ([209.85.215.174]:51354 "EHLO
	mail-ey0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754404Ab1DKWD1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 11 Apr 2011 18:03:27 -0400
Received: by mail-ey0-f174.google.com with SMTP id 24so1854467eyx.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 11 Apr 2011 15:03:26 -0700 (PDT)
In-Reply-To: <1302559377-14857-1-git-send-email-vzapolskiy@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Kukjin Kim <kgene.kim@samsung.com>, Vladimir Zapolskiy <vzapolskiy@gmail.com>

This change enables platform device for SMDKC110 and SMDKV210 boards.

Signed-off-by: Vladimir Zapolskiy <vzapolskiy@gmail.com>
---
 arch/arm/mach-s5pv210/Kconfig         |    2 ++
 arch/arm/mach-s5pv210/mach-smdkc110.c |    1 +
 arch/arm/mach-s5pv210/mach-smdkv210.c |    1 +
 3 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-s5pv210/Kconfig b/arch/arm/mach-s5pv210/Kconfig
index 37b5a97..f1b075c 100644
--- a/arch/arm/mach-s5pv210/Kconfig
+++ b/arch/arm/mach-s5pv210/Kconfig
@@ -109,6 +109,7 @@ config MACH_SMDKC110
 	select S3C_DEV_I2C2
 	select S3C_DEV_RTC
 	select S3C_DEV_WDT
+	select S5P_DEV_SECSS
 	select SAMSUNG_DEV_IDE
 	select S5PV210_SETUP_I2C1
 	select S5PV210_SETUP_I2C2
@@ -133,6 +134,7 @@ config MACH_SMDKV210
 	select S3C_DEV_I2C2
 	select S3C_DEV_RTC
 	select S3C_DEV_WDT
+	select S5P_DEV_SECSS
 	select SAMSUNG_DEV_ADC
 	select SAMSUNG_DEV_IDE
 	select SAMSUNG_DEV_KEYPAD
diff --git a/arch/arm/mach-s5pv210/mach-smdkc110.c b/arch/arm/mach-s5pv210/mach-smdkc110.c
index 6c412c8..db4ff680 100644
--- a/arch/arm/mach-s5pv210/mach-smdkc110.c
+++ b/arch/arm/mach-s5pv210/mach-smdkc110.c
@@ -86,6 +86,7 @@ static struct platform_device *smdkc110_devices[] __initdata = {
 	&s5pv210_device_iis0,
 	&s5pv210_device_ac97,
 	&s5pv210_device_spdif,
+	&s5p_device_secss,
 	&s3c_device_cfcon,
 	&s3c_device_i2c0,
 	&s3c_device_i2c1,
diff --git a/arch/arm/mach-s5pv210/mach-smdkv210.c b/arch/arm/mach-s5pv210/mach-smdkv210.c
index c6a9e86..f6b2ea5 100644
--- a/arch/arm/mach-s5pv210/mach-smdkv210.c
+++ b/arch/arm/mach-s5pv210/mach-smdkv210.c
@@ -272,6 +272,7 @@ static struct platform_device *smdkv210_devices[] __initdata = {
 	&smdkv210_lcd_lte480wv,
 	&s3c_device_timer[3],
 	&smdkv210_backlight_device,
+	&s5p_device_secss,
 };
 
 static void __init smdkv210_dm9000_init(void)
-- 
1.7.2.3
