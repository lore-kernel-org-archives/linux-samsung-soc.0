From: Hatim Ali <hatim.rv@samsung.com>
Subject: [PATCH V2 1/3] ARM: EXYNOS4: Add TVOUT support for SMDKV310
Date: Wed, 21 Sep 2011 11:14:18 +0530
Message-ID: <1316583860-32510-2-git-send-email-hatim.rv@samsung.com>
References: <1316583860-32510-1-git-send-email-hatim.rv@samsung.com>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:52906 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751918Ab1IUFqM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 21 Sep 2011 01:46:12 -0400
Received: from epcpsbgm2.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LRU003M4YOUEB00@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 21 Sep 2011 14:46:11 +0900 (KST)
Received: from hatim-linux.sisodomain.com ([107.108.73.95])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LRU0000KYO05M@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 21 Sep 2011 14:46:11 +0900 (KST)
In-reply-to: <1316583860-32510-1-git-send-email-hatim.rv@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com
Cc: t.stanislaws@samsung.com, mchehab@infradead.org, hverkuil@xs4all.nl, laurent.pinchart@ideasonboard.com, banajit.g@samsung.com, Hatim Ali <hatim.rv@samsung.com>

Add support for TVOUT on SMDKV310 board.

Signed-off-by: Hatim Ali <hatim.rv@samsung.com>
---
Changes since V1:
Incorporated changes as suggested by Tomasz Stanislawski
- Added  GPIO settings for hot-plug detection.
- Added setting hdmi and mixer's parent for TV power domain.

 arch/arm/mach-exynos4/Kconfig         |    2 ++
 arch/arm/mach-exynos4/mach-smdkv310.c |   25 +++++++++++++++++++++++++
 2 files changed, 27 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos4/Kconfig b/arch/arm/mach-exynos4/Kconfig
index 3b594fe..0bf0fe04 100644
--- a/arch/arm/mach-exynos4/Kconfig
+++ b/arch/arm/mach-exynos4/Kconfig
@@ -131,6 +131,7 @@ config MACH_SMDKV310
 	select S3C_DEV_RTC
 	select S3C_DEV_WDT
 	select S3C_DEV_I2C1
+	select S5P_DEV_I2C_HDMIPHY
 	select S5P_DEV_MFC
 	select S3C_DEV_HSMMC
 	select S3C_DEV_HSMMC1
@@ -140,6 +141,7 @@ config MACH_SMDKV310
 	select EXYNOS4_DEV_AHCI
 	select SAMSUNG_DEV_KEYPAD
 	select EXYNOS4_DEV_PD
+	select S5P_DEV_TV
 	select SAMSUNG_DEV_PWM
 	select EXYNOS4_DEV_SYSMMU
 	select EXYNOS4_SETUP_FIMD0
diff --git a/arch/arm/mach-exynos4/mach-smdkv310.c b/arch/arm/mach-exynos4/mach-smdkv310.c
index 7ce4d8b..50de270 100644
--- a/arch/arm/mach-exynos4/mach-smdkv310.c
+++ b/arch/arm/mach-exynos4/mach-smdkv310.c
@@ -239,6 +239,7 @@ static struct platform_device *smdkv310_devices[] __initdata = {
 	&s3c_device_hsmmc2,
 	&s3c_device_hsmmc3,
 	&s3c_device_i2c1,
+	&s5p_device_i2c_hdmiphy,
 	&s3c_device_rtc,
 	&s3c_device_wdt,
 	&exynos4_device_ac97,
@@ -262,6 +263,8 @@ static struct platform_device *smdkv310_devices[] __initdata = {
 	&smdkv310_lcd_lte480wv,
 	&smdkv310_smsc911x,
 	&exynos4_device_ahci,
+	&s5p_device_hdmi,
+	&s5p_device_mixer,
 };
 
 static void __init smdkv310_smsc911x_init(void)
@@ -298,6 +301,25 @@ static struct platform_pwm_backlight_data smdkv310_bl_data = {
 	.pwm_period_ns  = 1000,
 };
 
+static void s5p_tv_setup(void)
+{
+	int ret;
+
+	/* direct HPD to HDMI chip */
+	ret = gpio_request(EXYNOS4_GPX3(7), "hpd-plug");
+
+	if (!ret) {
+		gpio_direction_input(EXYNOS4_GPX3(7));
+		s3c_gpio_cfgpin_range(EXYNOS4_GPX3(7),
+					1, S3C_GPIO_SFN(3));
+	} else
+		pr_err("Failed to request gpio for hpd: %d\n", ret);
+
+	/* setup dependencies between TV devices */
+	s5p_device_hdmi.dev.parent = &exynos4_device_pd[PD_TV].dev;
+	s5p_device_mixer.dev.parent = &exynos4_device_pd[PD_TV].dev;
+}
+
 static void __init smdkv310_map_io(void)
 {
 	s5p_init_io(NULL, 0, S5P_VA_CHIPID);
@@ -327,6 +349,9 @@ static void __init smdkv310_machine_init(void)
 	samsung_bl_set(&smdkv310_bl_gpio_info, &smdkv310_bl_data);
 	s5p_fimd0_set_platdata(&smdkv310_lcd0_pdata);
 
+	s5p_tv_setup();
+	s5p_i2c_hdmiphy_set_platdata(NULL);
+
 	platform_add_devices(smdkv310_devices, ARRAY_SIZE(smdkv310_devices));
 	s5p_device_mfc.dev.parent = &exynos4_device_pd[PD_MFC].dev;
 }
-- 
1.7.2.3
