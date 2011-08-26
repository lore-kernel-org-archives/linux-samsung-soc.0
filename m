From: Hatim Ali <hatim.rv@samsung.com>
Subject: [PATCH 1/2] ARM: EXYNOS4: Add TVOUT support for SMDKV310
Date: Fri, 26 Aug 2011 12:09:06 +0530
Message-ID: <1314340747-13816-2-git-send-email-hatim.rv@samsung.com>
References: <1314340747-13816-1-git-send-email-hatim.rv@samsung.com>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:57909 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751846Ab1HZGjv (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 26 Aug 2011 02:39:51 -0400
Received: from epcpsbgm2.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LQI00IQUVT2IAE0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 26 Aug 2011 15:39:50 +0900 (KST)
Received: from hatim-linux.sisodomain.com ([107.108.73.95])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LQI000VMVTXBB@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 26 Aug 2011 15:39:50 +0900 (KST)
In-reply-to: <1314340747-13816-1-git-send-email-hatim.rv@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: kgene.kim@samsung.com, m.szyprowski@samsung.com, t.stanislaws@samsung.com, banajit.g@samsung.com

Add support for TVOUT on SMDKV310 board.

Signed-off-by: Hatim Ali <hatim.rv@samsung.com>
---
 arch/arm/mach-exynos4/Kconfig         |    2 ++
 arch/arm/mach-exynos4/mach-smdkv310.c |    5 +++++
 2 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos4/Kconfig b/arch/arm/mach-exynos4/Kconfig
index e6925de..4c399c0 100644
--- a/arch/arm/mach-exynos4/Kconfig
+++ b/arch/arm/mach-exynos4/Kconfig
@@ -139,6 +139,7 @@ config MACH_SMDKV310
 	select S3C_DEV_RTC
 	select S3C_DEV_WDT
 	select S3C_DEV_I2C1
+	select S5P_DEV_I2C_HDMIPHY
 	select S5P_DEV_MFC
 	select S3C_DEV_HSMMC
 	select S3C_DEV_HSMMC1
@@ -148,6 +149,7 @@ config MACH_SMDKV310
 	select EXYNOS4_DEV_AHCI
 	select SAMSUNG_DEV_KEYPAD
 	select EXYNOS4_DEV_PD
+	select S5P_DEV_TV
 	select SAMSUNG_DEV_PWM
 	select EXYNOS4_DEV_SYSMMU
 	select EXYNOS4_SETUP_FIMD0
diff --git a/arch/arm/mach-exynos4/mach-smdkv310.c b/arch/arm/mach-exynos4/mach-smdkv310.c
index 5f62b2b..8fdba16 100644
--- a/arch/arm/mach-exynos4/mach-smdkv310.c
+++ b/arch/arm/mach-exynos4/mach-smdkv310.c
@@ -173,6 +173,7 @@ static struct platform_device *smdkv310_devices[] __initdata = {
 	&s3c_device_hsmmc2,
 	&s3c_device_hsmmc3,
 	&s3c_device_i2c1,
+	&s5p_device_i2c_hdmiphy,
 	&s3c_device_rtc,
 	&s3c_device_wdt,
 	&exynos4_device_ac97,
@@ -194,6 +195,8 @@ static struct platform_device *smdkv310_devices[] __initdata = {
 	&samsung_asoc_idma,
 	&smdkv310_smsc911x,
 	&exynos4_device_ahci,
+	&s5p_device_hdmi,
+	&s5p_device_mixer,
 };
 
 static void __init smdkv310_smsc911x_init(void)
@@ -254,6 +257,8 @@ static void __init smdkv310_machine_init(void)
 	s3c_sdhci2_set_platdata(&smdkv310_hsmmc2_pdata);
 	s3c_sdhci3_set_platdata(&smdkv310_hsmmc3_pdata);
 
+	s5p_i2c_hdmiphy_set_platdata(NULL);
+
 	samsung_keypad_set_platdata(&smdkv310_keypad_data);
 
 	samsung_bl_set(&smdkv310_bl_gpio_info, &smdkv310_bl_data);
-- 
1.7.2.3
