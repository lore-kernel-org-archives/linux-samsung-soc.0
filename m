From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH RESEND 7/8] ASoC: samsung: s3c24xx_uda134x: debug/error trace
 cleanup
Date: Fri, 05 Aug 2016 11:47:09 +0200
Message-ID: <1470390429-30902-1-git-send-email-s.nawrocki@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:48227 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S934875AbcHEJri (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 5 Aug 2016 05:47:38 -0400
Received: from epcpsbgm2new.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OBF00I10KJBMJ30@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 05 Aug 2016 18:47:35 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: broonie@kernel.org
Cc: alsa-devel@alsa-project.org, b.zolnierkie@samsung.com, linux-samsung-soc@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>

Switch from pr_* to dev_* macros and drop some debug traces.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---

Rebased onto topic/samsung branch.

 sound/soc/samsung/s3c24xx_uda134x.c | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/sound/soc/samsung/s3c24xx_uda134x.c b/sound/soc/samsung/s3c24xx_uda134x.c
index 13e52fb..1619e76 100644
--- a/sound/soc/samsung/s3c24xx_uda134x.c
+++ b/sound/soc/samsung/s3c24xx_uda134x.c
@@ -62,18 +62,18 @@ static int s3c24xx_uda134x_startup(struct snd_pcm_substream *substream)
 #endif

 	mutex_lock(&clk_lock);
-	pr_debug("%s %d\n", __func__, clk_users);
+
 	if (clk_users == 0) {
 		xtal = clk_get(rtd->dev, "xtal");
 		if (IS_ERR(xtal)) {
-			printk(KERN_ERR "%s cannot get xtal\n", __func__);
+			dev_err(rtd->dev, "%s cannot get xtal\n", __func__);
 			ret = PTR_ERR(xtal);
 		} else {
 			pclk = clk_get(&s3c24xx_uda134x_snd_device->dev,
 				       "pclk");
 			if (IS_ERR(pclk)) {
-				printk(KERN_ERR "%s cannot get pclk\n",
-				       __func__);
+				dev_err(rtd->dev, "%s cannot get pclk\n",
+					__func__);
 				clk_put(xtal);
 				ret = PTR_ERR(pclk);
 			}
@@ -99,8 +99,8 @@ static int s3c24xx_uda134x_startup(struct snd_pcm_substream *substream)
 						 SNDRV_PCM_HW_PARAM_RATE,
 						 &hw_constraints_rates);
 		if (ret < 0)
-			printk(KERN_ERR "%s cannot set constraints\n",
-			       __func__);
+			dev_err(rtd->dev, "%s cannot set constraints\n",
+				__func__);
 #endif
 	}
 	return ret;
@@ -109,7 +109,6 @@ static int s3c24xx_uda134x_startup(struct snd_pcm_substream *substream)
 static void s3c24xx_uda134x_shutdown(struct snd_pcm_substream *substream)
 {
 	mutex_lock(&clk_lock);
-	pr_debug("%s %d\n", __func__, clk_users);
 	clk_users -= 1;
 	if (clk_users == 0) {
 		clk_put(xtal);
@@ -156,18 +155,19 @@ static int s3c24xx_uda134x_hw_params(struct snd_pcm_substream *substream,
 		clk_source = S3C24XX_CLKSRC_PCLK;
 		div = bi % 33;
 	}
-	pr_debug("%s desired rate %lu, %d\n", __func__, rate, bi);
+
+	dev_dbg(rtd->dev, "%s desired rate %lu, %d\n", __func__, rate, bi);

 	clk = (fs_mode == S3C2410_IISMOD_384FS ? 384 : 256) * rate;
-	pr_debug("%s will use: %s %s %d sysclk %d err %ld\n", __func__,
-		 fs_mode == S3C2410_IISMOD_384FS ? "384FS" : "256FS",
-		 clk_source == S3C24XX_CLKSRC_MPLL ? "MPLLin" : "PCLK",
-		 div, clk, err);
+
+	dev_dbg(rtd->dev, "%s will use: %s %s %d sysclk %d err %ld\n", __func__,
+		fs_mode == S3C2410_IISMOD_384FS ? "384FS" : "256FS",
+		clk_source == S3C24XX_CLKSRC_MPLL ? "MPLLin" : "PCLK",
+		div, clk, err);

 	if ((err * 100 / rate) > 5) {
-		printk(KERN_ERR "S3C24XX_UDA134X: effective frequency "
-		       "too different from desired (%ld%%)\n",
-		       err * 100 / rate);
+		dev_err(rtd->dev, "effective frequency too different "
+				  "from desired (%ld%%)\n", err * 100 / rate);
 		return -EINVAL;
 	}

--
1.9.1
