From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH 6/8] ASoC: samsung: Convert s3c24xx_uda134x to use
 devm_snd_soc_register_card()
Date: Thu, 04 Aug 2016 15:38:46 +0200
Message-ID: <1470317928-25365-7-git-send-email-s.nawrocki@samsung.com>
References: <1470317928-25365-1-git-send-email-s.nawrocki@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:43534 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933733AbcHDNkZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 4 Aug 2016 09:40:25 -0400
Received: from epcpsbgm1new.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OBE013KD0GKDQE0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 04 Aug 2016 22:39:35 +0900 (KST)
In-reply-to: <1470317928-25365-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: broonie@kernel.org
Cc: krzk@kernel.org, alsa-devel@alsa-project.org, b.zolnierkie@samsung.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Sylwester Nawrocki <s.nawrocki@samsung.com>

Suppreses a following kernel warning: "soc-audio soc-audio:
ASoC: machine S3C24XX_UDA134X should use snd_soc_register_card()".

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 sound/soc/samsung/s3c24xx_uda134x.c | 34 +++++++---------------------------
 1 file changed, 7 insertions(+), 27 deletions(-)

diff --git a/sound/soc/samsung/s3c24xx_uda134x.c b/sound/soc/samsung/s3c24xx_uda134x.c
index 794e30d..a8102a7 100644
--- a/sound/soc/samsung/s3c24xx_uda134x.c
+++ b/sound/soc/samsung/s3c24xx_uda134x.c
@@ -54,8 +54,6 @@ static struct snd_pcm_hw_constraint_list hw_constraints_rates = {
 };
 #endif
 
-static struct platform_device *s3c24xx_uda134x_snd_device;
-
 static int s3c24xx_uda134x_startup(struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
@@ -68,7 +66,7 @@ static int s3c24xx_uda134x_startup(struct snd_pcm_substream *substream)
 	mutex_lock(&clk_lock);
 	pr_debug("%s %d\n", __func__, clk_users);
 	if (clk_users == 0) {
-		xtal = clk_get(&s3c24xx_uda134x_snd_device->dev, "xtal");
+		xtal = clk_get(rtd->dev, "xtal");
 		if (IS_ERR(xtal)) {
 			printk(KERN_ERR "%s cannot get xtal\n", __func__);
 			ret = PTR_ERR(xtal);
@@ -229,43 +227,25 @@ static struct snd_soc_card snd_soc_s3c24xx_uda134x = {
 
 static int s3c24xx_uda134x_probe(struct platform_device *pdev)
 {
+	struct snd_soc_card *card = &snd_soc_s3c24xx_uda134x;
 	int ret;
 
-	printk(KERN_INFO "S3C24XX_UDA134X SoC Audio driver\n");
-
-	s3c24xx_uda134x_snd_device = platform_device_alloc("soc-audio", -1);
-	if (!s3c24xx_uda134x_snd_device) {
-		printk(KERN_ERR "S3C24XX_UDA134X SoC Audio: "
-		       "Unable to register\n");
-		return -ENOMEM;
-	}
+	platform_set_drvdata(pdev, card);
+	card->dev = &pdev->dev;
 
-	platform_set_drvdata(s3c24xx_uda134x_snd_device,
-			     &snd_soc_s3c24xx_uda134x);
-
-	ret = platform_device_add(s3c24xx_uda134x_snd_device);
-	if (ret) {
-		printk(KERN_ERR "S3C24XX_UDA134X SoC Audio: Unable to add\n");
-		platform_device_put(s3c24xx_uda134x_snd_device);
-	}
+	ret = devm_snd_soc_register_card(&pdev->dev, card);
+	if (ret)
+		dev_err(&pdev->dev, "failed to register card: %d\n", ret);
 
 	return ret;
 }
 
-static int s3c24xx_uda134x_remove(struct platform_device *pdev)
-{
-	platform_device_unregister(s3c24xx_uda134x_snd_device);
-	return 0;
-}
-
 static struct platform_driver s3c24xx_uda134x_driver = {
 	.probe  = s3c24xx_uda134x_probe,
-	.remove = s3c24xx_uda134x_remove,
 	.driver = {
 		.name = "s3c24xx_uda134x",
 	},
 };
-
 module_platform_driver(s3c24xx_uda134x_driver);
 
 MODULE_AUTHOR("Zoltan Devai, Christian Pellegrin <chripell@evolware.org>");
-- 
1.9.1
