From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH 2/7] ASoC: samsung: Drop usage of struct s3c_dma_params from
 s3c24xx-i2s.c
Date: Thu, 04 Aug 2016 11:30:27 +0200
Message-ID: <1470303032-14582-3-git-send-email-s.nawrocki@samsung.com>
References: <1470303032-14582-1-git-send-email-s.nawrocki@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:54978 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932532AbcHDJbe (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 4 Aug 2016 05:31:34 -0400
Received: from epcpsbgm2new.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OBD014VDP3FUR40@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 04 Aug 2016 18:30:56 +0900 (KST)
In-reply-to: <1470303032-14582-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: broonie@kernel.org
Cc: alsa-devel@alsa-project.org, b.zolnierkie@samsung.com, linux-samsung-soc@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>

struct s3c_dma_params already includes struct snd_dmaengine_dai_dma_data,
there is no need for such an indirection so switch to using struct
snd_dmaengine_dai_dma_data instead of struct s3c_dma_params.  This also
allows us to use snd_soc_dai_init_dma_data() function instead of the
platform specific samsung_asoc_init_dma_data helper.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 sound/soc/samsung/s3c24xx-i2s.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/sound/soc/samsung/s3c24xx-i2s.c b/sound/soc/samsung/s3c24xx-i2s.c
index 3e76f2a..c78a936 100644
--- a/sound/soc/samsung/s3c24xx-i2s.c
+++ b/sound/soc/samsung/s3c24xx-i2s.c
@@ -32,14 +32,14 @@
 
 #include <linux/platform_data/asoc-s3c.h>
 
-static struct s3c_dma_params s3c24xx_i2s_pcm_stereo_out = {
-	.ch_name	= "tx",
-	.dma_size	= 2,
+static struct snd_dmaengine_dai_dma_data s3c24xx_i2s_pcm_stereo_out = {
+	.chan_name	= "tx",
+	.addr_width	= 2,
 };
 
-static struct s3c_dma_params s3c24xx_i2s_pcm_stereo_in = {
-	.ch_name	= "rx",
-	.dma_size	= 2,
+static struct snd_dmaengine_dai_dma_data s3c24xx_i2s_pcm_stereo_in = {
+	.chan_name	= "rx",
+	.addr_width	= 2,
 };
 
 struct s3c24xx_i2s_info {
@@ -360,8 +360,8 @@ static int s3c24xx_i2s_probe(struct snd_soc_dai *dai)
 {
 	pr_debug("Entered %s\n", __func__);
 
-	samsung_asoc_init_dma_data(dai, &s3c24xx_i2s_pcm_stereo_out,
-		&s3c24xx_i2s_pcm_stereo_in);
+	snd_soc_dai_init_dma_data(dai, &s3c24xx_i2s_pcm_stereo_out,
+					&s3c24xx_i2s_pcm_stereo_in);
 
 	s3c24xx_i2s.iis_clk = devm_clk_get(dai->dev, "iis");
 	if (IS_ERR(s3c24xx_i2s.iis_clk)) {
@@ -469,10 +469,10 @@ static int s3c24xx_iis_dev_probe(struct platform_device *pdev)
 	if (IS_ERR(s3c24xx_i2s.regs))
 		return PTR_ERR(s3c24xx_i2s.regs);
 
-	s3c24xx_i2s_pcm_stereo_out.dma_addr = res->start + S3C2410_IISFIFO;
-	s3c24xx_i2s_pcm_stereo_out.slave = pdata->dma_playback;
-	s3c24xx_i2s_pcm_stereo_in.dma_addr = res->start + S3C2410_IISFIFO;
-	s3c24xx_i2s_pcm_stereo_in.slave = pdata->dma_capture;
+	s3c24xx_i2s_pcm_stereo_out.addr = res->start + S3C2410_IISFIFO;
+	s3c24xx_i2s_pcm_stereo_out.filter_data = pdata->dma_playback;
+	s3c24xx_i2s_pcm_stereo_in.addr = res->start + S3C2410_IISFIFO;
+	s3c24xx_i2s_pcm_stereo_in.filter_data = pdata->dma_capture;
 
 	ret = devm_snd_soc_register_component(&pdev->dev,
 			&s3c24xx_i2s_component, &s3c24xx_i2s_dai, 1);
-- 
1.9.1
