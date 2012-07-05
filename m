From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 3/3] ARM: S5PV210: Add audio platform device in Goni board
Date: Thu,  5 Jul 2012 14:31:58 +0530
Message-ID: <1341478918-6602-4-git-send-email-sachin.kamat@linaro.org>
References: <1341478918-6602-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:42785 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753335Ab2GEJOq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 5 Jul 2012 05:14:46 -0400
Received: by mail-pb0-f46.google.com with SMTP id rp8so12487389pbb.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 05 Jul 2012 02:14:45 -0700 (PDT)
In-Reply-To: <1341478918-6602-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, m.szyprowski@samsung.com, kyungmin.park@samsung.com, sachin.kamat@linaro.org, patches@linaro.org

After using snd_soc_register_card() in smdk_wm8994.c, the sound
card is registered as a platform driver and it needs related platform
device entry in machine file.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 arch/arm/mach-s5pv210/mach-goni.c |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-s5pv210/mach-goni.c b/arch/arm/mach-s5pv210/mach-goni.c
index bf5087c..b2cae13 100644
--- a/arch/arm/mach-s5pv210/mach-goni.c
+++ b/arch/arm/mach-s5pv210/mach-goni.c
@@ -859,12 +859,19 @@ static struct s5p_platform_fimc goni_fimc_md_platdata __initdata = {
 	.num_clients	= ARRAY_SIZE(goni_camera_sensors),
 };
 
+/* Audio device */
+static struct platform_device goni_device_audio = {
+	.name = "smdk-audio",
+	.id = -1,
+};
+
 static struct platform_device *goni_devices[] __initdata = {
 	&s3c_device_fb,
 	&s5p_device_onenand,
 	&goni_spi_gpio,
 	&goni_i2c_gpio_pmic,
 	&goni_i2c_gpio5,
+	&goni_device_audio,
 	&mmc2_fixed_voltage,
 	&goni_device_gpiokeys,
 	&s5p_device_mfc,
-- 
1.7.4.1
