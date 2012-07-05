From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 1/3] ARM: EXYNOS: Add audio platform device in SMDKV310 board
Date: Thu,  5 Jul 2012 14:31:56 +0530
Message-ID: <1341478918-6602-2-git-send-email-sachin.kamat@linaro.org>
References: <1341478918-6602-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:42785 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753335Ab2GEJOk (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 5 Jul 2012 05:14:40 -0400
Received: by pbbrp8 with SMTP id rp8so12487389pbb.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 05 Jul 2012 02:14:39 -0700 (PDT)
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
 arch/arm/mach-exynos/mach-smdkv310.c |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos/mach-smdkv310.c b/arch/arm/mach-exynos/mach-smdkv310.c
index 95ce9f6..9b7c878 100644
--- a/arch/arm/mach-exynos/mach-smdkv310.c
+++ b/arch/arm/mach-exynos/mach-smdkv310.c
@@ -274,6 +274,12 @@ static void __init smdkv310_ohci_init(void)
 /* USB OTG */
 static struct s3c_hsotg_plat smdkv310_hsotg_pdata;
 
+/* Audio device */
+static struct platform_device smdkv310_device_audio = {
+	.name = "smdk-audio",
+	.id = -1,
+};
+
 static struct platform_device *smdkv310_devices[] __initdata = {
 	&s3c_device_hsmmc0,
 	&s3c_device_hsmmc1,
@@ -306,6 +312,7 @@ static struct platform_device *smdkv310_devices[] __initdata = {
 	&samsung_asoc_dma,
 	&samsung_asoc_idma,
 	&s5p_device_fimd0,
+	&smdkv310_device_audio,
 	&smdkv310_lcd_lte480wv,
 	&smdkv310_smsc911x,
 	&exynos4_device_ahci,
-- 
1.7.4.1
