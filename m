From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH 3/7] ASoC: samsung: Drop usage of struct s3c_dma_params from
 s3c2412-i2s.c
Date: Thu, 04 Aug 2016 11:30:28 +0200
Message-ID: <1470303032-14582-4-git-send-email-s.nawrocki@samsung.com>
References: <1470303032-14582-1-git-send-email-s.nawrocki@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:59617 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933208AbcHDJbb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 4 Aug 2016 05:31:31 -0400
Received: from epcpsbgm1new.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OBD00V68P3HE550@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 04 Aug 2016 18:30:59 +0900 (KST)
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
 sound/soc/samsung/s3c-i2s-v2.c  |  2 +-
 sound/soc/samsung/s3c-i2s-v2.h  |  4 ++--
 sound/soc/samsung/s3c2412-i2s.c | 24 ++++++++++++------------
 3 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/sound/soc/samsung/s3c-i2s-v2.c b/sound/soc/samsung/s3c-i2s-v2.c
index bf8ae79..74a7f4b 100644
--- a/sound/soc/samsung/s3c-i2s-v2.c
+++ b/sound/soc/samsung/s3c-i2s-v2.c
@@ -302,7 +302,7 @@ static int s3c_i2sv2_hw_params(struct snd_pcm_substream *substream,
 				 struct snd_soc_dai *dai)
 {
 	struct s3c_i2sv2_info *i2s = to_info(dai);
-	struct s3c_dma_params *dma_data;
+	struct snd_dmaengine_dai_dma_data *dma_data;
 	u32 iismod;
 
 	pr_debug("Entered %s\n", __func__);
diff --git a/sound/soc/samsung/s3c-i2s-v2.h b/sound/soc/samsung/s3c-i2s-v2.h
index d068414..182d805 100644
--- a/sound/soc/samsung/s3c-i2s-v2.h
+++ b/sound/soc/samsung/s3c-i2s-v2.h
@@ -60,8 +60,8 @@ struct s3c_i2sv2_info {
 
 	unsigned char	 master;
 
-	struct s3c_dma_params	*dma_playback;
-	struct s3c_dma_params	*dma_capture;
+	struct snd_dmaengine_dai_dma_data *dma_playback;
+	struct snd_dmaengine_dai_dma_data *dma_capture;
 
 	u32		 suspend_iismod;
 	u32		 suspend_iiscon;
diff --git a/sound/soc/samsung/s3c2412-i2s.c b/sound/soc/samsung/s3c2412-i2s.c
index d45dffb..3e89fbc 100644
--- a/sound/soc/samsung/s3c2412-i2s.c
+++ b/sound/soc/samsung/s3c2412-i2s.c
@@ -34,14 +34,14 @@
 
 #include <linux/platform_data/asoc-s3c.h>
 
-static struct s3c_dma_params s3c2412_i2s_pcm_stereo_out = {
-	.ch_name	= "tx",
-	.dma_size	= 4,
+static struct snd_dmaengine_dai_dma_data s3c2412_i2s_pcm_stereo_out = {
+	.chan_name	= "tx",
+	.addr_width	= 4,
 };
 
-static struct s3c_dma_params s3c2412_i2s_pcm_stereo_in = {
-	.ch_name	= "rx",
-	.dma_size	= 4,
+static struct snd_dmaengine_dai_dma_data s3c2412_i2s_pcm_stereo_in = {
+	.chan_name	= "rx",
+	.addr_width	= 4,
 };
 
 static struct s3c_i2sv2_info s3c2412_i2s;
@@ -52,8 +52,8 @@ static int s3c2412_i2s_probe(struct snd_soc_dai *dai)
 
 	pr_debug("Entered %s\n", __func__);
 
-	samsung_asoc_init_dma_data(dai, &s3c2412_i2s_pcm_stereo_out,
-		&s3c2412_i2s_pcm_stereo_in);
+	snd_soc_dai_init_dma_data(dai, &s3c2412_i2s_pcm_stereo_out,
+					&s3c2412_i2s_pcm_stereo_in);
 
 	ret = s3c_i2sv2_probe(dai, &s3c2412_i2s, S3C2410_PA_IIS);
 	if (ret)
@@ -163,10 +163,10 @@ static int s3c2412_iis_dev_probe(struct platform_device *pdev)
 	if (IS_ERR(s3c2412_i2s.regs))
 		return PTR_ERR(s3c2412_i2s.regs);
 
-	s3c2412_i2s_pcm_stereo_out.dma_addr = res->start + S3C2412_IISTXD;
-	s3c2412_i2s_pcm_stereo_out.slave = pdata->dma_playback;
-	s3c2412_i2s_pcm_stereo_in.dma_addr = res->start + S3C2412_IISRXD;
-	s3c2412_i2s_pcm_stereo_in.slave = pdata->dma_capture;
+	s3c2412_i2s_pcm_stereo_out.addr = res->start + S3C2412_IISTXD;
+	s3c2412_i2s_pcm_stereo_out.filter_data = pdata->dma_playback;
+	s3c2412_i2s_pcm_stereo_in.addr = res->start + S3C2412_IISRXD;
+	s3c2412_i2s_pcm_stereo_in.filter_data = pdata->dma_capture;
 
 	ret = s3c_i2sv2_register_component(&pdev->dev, -1,
 					   &s3c2412_i2s_component,
-- 
1.9.1
