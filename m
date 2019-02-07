From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH 03/22] ASoC: samsung: dmaengine: Allow to specify custom DMA
 device
Date: Thu, 07 Feb 2019 18:00:11 +0100
Message-ID: <20190207170028.720-4-s.nawrocki@samsung.com>
References: <20190207170028.720-1-s.nawrocki@samsung.com>
        <CGME20190207170054epcas1p1e61320d308bc5be30187919f3360f501@epcas1p1.samsung.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <20190207170028.720-1-s.nawrocki@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, krzk@kernel.org, sbkim73@samsung.com, m.szyprowski@samsung.com, b.zolnierkie@samsung.com, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

The additional function argument will allow to select proper DMA device
for requesting DMA channel for the secondary CPU DAI.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 sound/soc/samsung/dma.h         | 3 ++-
 sound/soc/samsung/dmaengine.c   | 4 +++-
 sound/soc/samsung/i2s.c         | 4 ++--
 sound/soc/samsung/pcm.c         | 2 +-
 sound/soc/samsung/s3c2412-i2s.c | 2 +-
 sound/soc/samsung/s3c24xx-i2s.c | 2 +-
 sound/soc/samsung/spdif.c       | 2 +-
 7 files changed, 11 insertions(+), 8 deletions(-)

diff --git a/sound/soc/samsung/dma.h b/sound/soc/samsung/dma.h
index 7ae580d677c8..0ae15d01a3f6 100644
--- a/sound/soc/samsung/dma.h
+++ b/sound/soc/samsung/dma.h
@@ -17,5 +17,6 @@
  * otherwise actual DMA channel names must be passed to this function.
  */
 int samsung_asoc_dma_platform_register(struct device *dev, dma_filter_fn filter,
-				       const char *tx, const char *rx);
+				       const char *tx, const char *rx,
+				       struct device *dma_dev);
 #endif /* _SAMSUNG_DMA_H */
diff --git a/sound/soc/samsung/dmaengine.c b/sound/soc/samsung/dmaengine.c
index 9104c98deeb7..84601fa9aa46 100644
--- a/sound/soc/samsung/dmaengine.c
+++ b/sound/soc/samsung/dmaengine.c
@@ -25,7 +25,8 @@
 #include "dma.h"
 
 int samsung_asoc_dma_platform_register(struct device *dev, dma_filter_fn filter,
-				       const char *tx, const char *rx)
+				       const char *tx, const char *rx,
+				       struct device *dma_dev)
 {
 	unsigned int flags = SND_DMAENGINE_PCM_FLAG_COMPAT;
 	struct snd_dmaengine_pcm_config *pcm_conf;
@@ -36,6 +37,7 @@ int samsung_asoc_dma_platform_register(struct device *dev, dma_filter_fn filter,
 
 	pcm_conf->prepare_slave_config = snd_dmaengine_pcm_prepare_slave_config;
 	pcm_conf->compat_filter_fn = filter;
+	pcm_conf->dma_dev = dma_dev;
 
 	if (dev->of_node) {
 		pcm_conf->chan_names[SNDRV_PCM_STREAM_PLAYBACK] = tx;
diff --git a/sound/soc/samsung/i2s.c b/sound/soc/samsung/i2s.c
index ce00fe2f6aae..9d3dcb2204fe 100644
--- a/sound/soc/samsung/i2s.c
+++ b/sound/soc/samsung/i2s.c
@@ -1345,7 +1345,7 @@ static int samsung_i2s_probe(struct platform_device *pdev)
 		pri_dai->i2s_dai_drv.playback.channels_max = 6;
 
 	ret = samsung_asoc_dma_platform_register(&pdev->dev, pri_dai->filter,
-						 NULL, NULL);
+						 NULL, NULL, NULL);
 	if (ret < 0)
 		goto err_disable_clk;
 
@@ -1382,7 +1382,7 @@ static int samsung_i2s_probe(struct platform_device *pdev)
 		pri_dai->sec_dai = sec_dai;
 
 		ret = samsung_asoc_dma_platform_register(&pdev->dev,
-					sec_dai->filter, "tx-sec", NULL);
+					sec_dai->filter, "tx-sec", NULL, NULL);
 		if (ret < 0)
 			goto err_disable_clk;
 
diff --git a/sound/soc/samsung/pcm.c b/sound/soc/samsung/pcm.c
index 37f95eee1558..3c7baa561084 100644
--- a/sound/soc/samsung/pcm.c
+++ b/sound/soc/samsung/pcm.c
@@ -553,7 +553,7 @@ static int s3c_pcm_dev_probe(struct platform_device *pdev)
 	pcm->dma_playback = &s3c_pcm_stereo_out[pdev->id];
 
 	ret = samsung_asoc_dma_platform_register(&pdev->dev, filter,
-						 NULL, NULL);
+						 NULL, NULL, NULL);
 	if (ret) {
 		dev_err(&pdev->dev, "failed to get register DMA: %d\n", ret);
 		goto err_dis_pclk;
diff --git a/sound/soc/samsung/s3c2412-i2s.c b/sound/soc/samsung/s3c2412-i2s.c
index cc0840fff5aa..67dfa27ae321 100644
--- a/sound/soc/samsung/s3c2412-i2s.c
+++ b/sound/soc/samsung/s3c2412-i2s.c
@@ -177,7 +177,7 @@ static int s3c2412_iis_dev_probe(struct platform_device *pdev)
 
 	ret = samsung_asoc_dma_platform_register(&pdev->dev,
 						 pdata->dma_filter,
-						 NULL, NULL);
+						 NULL, NULL, NULL);
 	if (ret) {
 		pr_err("failed to register the DMA: %d\n", ret);
 		return ret;
diff --git a/sound/soc/samsung/s3c24xx-i2s.c b/sound/soc/samsung/s3c24xx-i2s.c
index 8d58d02183bf..ba0f2b94f8d4 100644
--- a/sound/soc/samsung/s3c24xx-i2s.c
+++ b/sound/soc/samsung/s3c24xx-i2s.c
@@ -446,7 +446,7 @@ static int s3c24xx_iis_dev_probe(struct platform_device *pdev)
 	s3c24xx_i2s_pcm_stereo_in.addr = res->start + S3C2410_IISFIFO;
 
 	ret = samsung_asoc_dma_platform_register(&pdev->dev, NULL,
-						 NULL, NULL);
+						 NULL, NULL, NULL);
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to register the DMA: %d\n", ret);
 		return ret;
diff --git a/sound/soc/samsung/spdif.c b/sound/soc/samsung/spdif.c
index cb59911e65c0..5e4afb330416 100644
--- a/sound/soc/samsung/spdif.c
+++ b/sound/soc/samsung/spdif.c
@@ -430,7 +430,7 @@ static int spdif_probe(struct platform_device *pdev)
 	spdif->dma_playback = &spdif_stereo_out;
 
 	ret = samsung_asoc_dma_platform_register(&pdev->dev, filter,
-						 NULL, NULL);
+						 NULL, NULL, NULL);
 	if (ret) {
 		dev_err(&pdev->dev, "failed to register DMA: %d\n", ret);
 		goto err4;
-- 
2.20.1
