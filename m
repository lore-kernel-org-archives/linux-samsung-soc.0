From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH v2] ARM: EXYNOS4: Add HDMI support for Origen
Date: Thu,  8 Sep 2011 15:18:09 +0530
Message-ID: <1315475289-10967-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yi0-f46.google.com ([209.85.218.46]:53033 "EHLO
	mail-yi0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932400Ab1IHJvj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 8 Sep 2011 05:51:39 -0400
Received: by yie30 with SMTP id 30so496761yie.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 08 Sep 2011 02:51:38 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, sachin.kamat@linaro.org

This patch adds HDMI (TVout) support for Origen board.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
Re-submitting the patch with minor changes since v1:
* Re-ordered the entries in Kconfig and init data

This patch is based on for-next branch of Kukjin Kim's tree:
http://git.kernel.org/?p=linux/kernel/git/kgene/linux-samsung.git;a=summary

This patch is tested using Hatim's patch:
http://www.spinics.net/lists/linux-samsung-soc/msg06367.html
---
 arch/arm/mach-exynos4/Kconfig       |    2 ++
 arch/arm/mach-exynos4/mach-origen.c |    4 ++++
 2 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos4/Kconfig b/arch/arm/mach-exynos4/Kconfig
index 181fb04..e0c217f 100644
--- a/arch/arm/mach-exynos4/Kconfig
+++ b/arch/arm/mach-exynos4/Kconfig
@@ -224,6 +224,8 @@ config MACH_ORIGEN
 	select S3C_DEV_RTC
 	select S3C_DEV_WDT
 	select S3C_DEV_HSMMC2
+	select S5P_DEV_I2C_HDMIPHY
+	select S5P_DEV_TV
 	select EXYNOS4_SETUP_SDHCI
 	help
 	  Machine support for ORIGEN based on Samsung EXYNOS4210
diff --git a/arch/arm/mach-exynos4/mach-origen.c b/arch/arm/mach-exynos4/mach-origen.c
index ed59f86..5525329 100644
--- a/arch/arm/mach-exynos4/mach-origen.c
+++ b/arch/arm/mach-exynos4/mach-origen.c
@@ -83,6 +83,9 @@ static struct platform_device *origen_devices[] __initdata = {
 	&s3c_device_hsmmc2,
 	&s3c_device_rtc,
 	&s3c_device_wdt,
+	&s5p_device_i2c_hdmiphy,
+	&s5p_device_hdmi,
+	&s5p_device_mixer,
 };
 
 static void __init origen_map_io(void)
@@ -95,6 +98,7 @@ static void __init origen_map_io(void)
 static void __init origen_machine_init(void)
 {
 	s3c_sdhci2_set_platdata(&origen_hsmmc2_pdata);
+	s5p_i2c_hdmiphy_set_platdata(NULL);
 	platform_add_devices(origen_devices, ARRAY_SIZE(origen_devices));
 }
 
-- 
1.7.4.1
