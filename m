From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH 6/8] ASoC: samsung: pcm: Do not use platform_data for DMA
 parameters
Date: Thu, 10 Nov 2016 16:17:54 +0100
Message-ID: <1478791076-19528-7-git-send-email-s.nawrocki@samsung.com>
References: <1478791076-19528-1-git-send-email-s.nawrocki@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:49697 "EHLO
        mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933884AbcKJPTf (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 10 Nov 2016 10:19:35 -0500
In-reply-to: <1478791076-19528-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: krzk@kernel.org, vinod.koul@intel.com, kgene@kernel.org
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, dmaengine@vger.kernel.org, broonie@kernel.org, ckeepax@opensource.wolfsonmicro.com, ym0914@gmail.com, arnd@arndb.de, javier@osg.samsung.com, andi.shyti@samsung.com, sbkim73@samsung.com, Sylwester Nawrocki <s.nawrocki@samsung.com>

All related platforms use either devicetree or the DMA slave
map API for mapping DMA channels to slave devices so we can now
stop using platform_data for passing DMA details.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Acked-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/samsung/pcm.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/sound/soc/samsung/pcm.c b/sound/soc/samsung/pcm.c
index 43e367a..ccedab2 100644
--- a/sound/soc/samsung/pcm.c
+++ b/sound/soc/samsung/pcm.c
@@ -134,18 +134,22 @@ struct s3c_pcm_info {
 static struct snd_dmaengine_dai_dma_data s3c_pcm_stereo_out[] = {
 	[0] = {
 		.addr_width	= 4,
+		.chan_name	= "tx",
 	},
 	[1] = {
 		.addr_width	= 4,
+		.chan_name	= "tx",
 	},
 };
 
 static struct snd_dmaengine_dai_dma_data s3c_pcm_stereo_in[] = {
 	[0] = {
 		.addr_width	= 4,
+		.chan_name	= "rx",
 	},
 	[1] = {
 		.addr_width	= 4,
+		.chan_name	= "rx",
 	},
 };
 
@@ -488,7 +492,6 @@ static int s3c_pcm_dev_probe(struct platform_device *pdev)
 	struct s3c_pcm_info *pcm;
 	struct resource *mem_res;
 	struct s3c_audio_pdata *pcm_pdata;
-	dma_filter_fn filter;
 	int ret;
 
 	/* Check for valid device index */
@@ -555,13 +558,6 @@ static int s3c_pcm_dev_probe(struct platform_device *pdev)
 	s3c_pcm_stereo_in[pdev->id].addr = mem_res->start + S3C_PCM_RXFIFO;
 	s3c_pcm_stereo_out[pdev->id].addr = mem_res->start + S3C_PCM_TXFIFO;
 
-	filter = NULL;
-	if (pcm_pdata) {
-		s3c_pcm_stereo_in[pdev->id].filter_data = pcm_pdata->dma_capture;
-		s3c_pcm_stereo_out[pdev->id].filter_data = pcm_pdata->dma_playback;
-		filter = pcm_pdata->dma_filter;
-	}
-
 	pcm->dma_capture = &s3c_pcm_stereo_in[pdev->id];
 	pcm->dma_playback = &s3c_pcm_stereo_out[pdev->id];
 
@@ -574,7 +570,7 @@ static int s3c_pcm_dev_probe(struct platform_device *pdev)
 		goto err5;
 	}
 
-	ret = samsung_asoc_dma_platform_register(&pdev->dev, filter,
+	ret = samsung_asoc_dma_platform_register(&pdev->dev, NULL,
 						 NULL, NULL);
 	if (ret) {
 		dev_err(&pdev->dev, "failed to get register DMA: %d\n", ret);
-- 
1.9.1
