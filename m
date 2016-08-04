From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH] ASoC: samsung: Fix clock handling in S3C24XX_UDA134X card
Date: Thu, 04 Aug 2016 11:51:25 +0200
Message-ID: <1470304285-14831-1-git-send-email-s.nawrocki@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:54972 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753475AbcHDJv7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 4 Aug 2016 05:51:59 -0400
Received: from epcpsbgm2new.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OBD00XN5Q28W860@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 04 Aug 2016 18:51:45 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: broonie@kernel.org
Cc: alsa-devel@alsa-project.org, b.zolnierkie@samsung.com, linux-samsung-soc@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>

There is no "pclk" alias in the s3c2440 clk driver for "soc-audio"
device so related clk_get() fails, which prevents any operation
of the S3C24XX_UDA134X sound card.
Instead we get the clock on behalf of the I2S device, i.e. we use
the I2S block gate clock which has PCLK is its parent clock.

Without this patch there is an error like:

s3c24xx_uda134x_startup cannot get pclk
ASoC: UDA134X startup failed: -2

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 sound/soc/samsung/s3c24xx_uda134x.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/sound/soc/samsung/s3c24xx_uda134x.c b/sound/soc/samsung/s3c24xx_uda134x.c
index 50849e1..92e88bc 100644
--- a/sound/soc/samsung/s3c24xx_uda134x.c
+++ b/sound/soc/samsung/s3c24xx_uda134x.c
@@ -58,10 +58,12 @@ static struct platform_device *s3c24xx_uda134x_snd_device;
 
 static int s3c24xx_uda134x_startup(struct snd_pcm_substream *substream)
 {
-	int ret = 0;
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
 #ifdef ENFORCE_RATES
 	struct snd_pcm_runtime *runtime = substream->runtime;
 #endif
+	int ret = 0;
 
 	mutex_lock(&clk_lock);
 	pr_debug("%s %d\n", __func__, clk_users);
@@ -71,8 +73,7 @@ static int s3c24xx_uda134x_startup(struct snd_pcm_substream *substream)
 			printk(KERN_ERR "%s cannot get xtal\n", __func__);
 			ret = PTR_ERR(xtal);
 		} else {
-			pclk = clk_get(&s3c24xx_uda134x_snd_device->dev,
-				       "pclk");
+			pclk = clk_get(cpu_dai->dev, "iis");
 			if (IS_ERR(pclk)) {
 				printk(KERN_ERR "%s cannot get pclk\n",
 				       __func__);
-- 
1.9.1
