From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 2/3] ARM: S5PV210: Add audio platform device in Aquila board
Date: Thu,  5 Jul 2012 14:31:57 +0530
Message-ID: <1341478918-6602-3-git-send-email-sachin.kamat@linaro.org>
References: <1341478918-6602-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:42785 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753335Ab2GEJOn (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 5 Jul 2012 05:14:43 -0400
Received: by mail-pb0-f46.google.com with SMTP id rp8so12487389pbb.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 05 Jul 2012 02:14:42 -0700 (PDT)
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
 arch/arm/mach-s5pv210/mach-aquila.c |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-s5pv210/mach-aquila.c b/arch/arm/mach-s5pv210/mach-aquila.c
index af528f9..78028df 100644
--- a/arch/arm/mach-s5pv210/mach-aquila.c
+++ b/arch/arm/mach-s5pv210/mach-aquila.c
@@ -600,10 +600,17 @@ static void aquila_setup_sdhci(void)
 	s3c_sdhci2_set_platdata(&aquila_hsmmc2_data);
 };
 
+/* Audio device */
+static struct platform_device aquila_device_audio = {
+	.name = "smdk-audio",
+	.id = -1,
+};
+
 static struct platform_device *aquila_devices[] __initdata = {
 	&aquila_i2c_gpio_pmic,
 	&aquila_i2c_gpio5,
 	&aquila_device_gpiokeys,
+	&aquila_device_audio,
 	&s3c_device_fb,
 	&s5p_device_onenand,
 	&s3c_device_hsmmc0,
-- 
1.7.4.1
