From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH v3 07/13] ASoC: samsung: Specify DMA channel
 names through custom DMA config
Date: Wed, 13 Feb 2019 19:42:06 +0100
Message-ID: <20190213184212.5473-8-s.nawrocki@samsung.com>
References: <20190213184212.5473-1-s.nawrocki@samsung.com>
 <CGME20190213184317epcas2p17fc18ee2ac4b92a7d1690c56e36739d6@epcas2p1.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
In-reply-to: <20190213184212.5473-1-s.nawrocki@samsung.com>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: broonie@kernel.org
Cc: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, b.zolnierkie@samsung.com, sbkim73@samsung.com, lgirdwood@gmail.com, krzk@kernel.org, linux-kernel@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>, m.szyprowski@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

This is a part of conversion of Samsung platforms to use the custom DMA
config for specifying DMA channel names, in addition to passing custom
DMA device for the secondary CPU DAI's "PCM" component for some variants
of the I2S controller.

We also don't set the SND_DMAENGINE_PCM_FLAG_CUSTOM_CHANNEL_NAME any more
as setting it wouldn't allow to specify DMA channels through the custom
DMA config.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 sound/soc/samsung/dmaengine.c   | 12 ++++--------
 sound/soc/samsung/i2s.c         |  2 +-
 sound/soc/samsung/s3c2412-i2s.c |  2 +-
 sound/soc/samsung/s3c24xx-i2s.c |  2 +-
 4 files changed, 7 insertions(+), 11 deletions(-)

diff --git a/sound/soc/samsung/dmaengine.c b/sound/soc/samsung/dmaengine.c
index 84601fa9aa46..302871974cb3 100644
--- a/sound/soc/samsung/dmaengine.c
+++ b/sound/soc/samsung/dmaengine.c
@@ -28,7 +28,6 @@ int samsung_asoc_dma_platform_register(struct device *dev, dma_filter_fn filter,
 				       const char *tx, const char *rx,
 				       struct device *dma_dev)
 {
-	unsigned int flags = SND_DMAENGINE_PCM_FLAG_COMPAT;
 	struct snd_dmaengine_pcm_config *pcm_conf;
 
 	pcm_conf = devm_kzalloc(dev, sizeof(*pcm_conf), GFP_KERNEL);
@@ -39,14 +38,11 @@ int samsung_asoc_dma_platform_register(struct device *dev, dma_filter_fn filter,
 	pcm_conf->compat_filter_fn = filter;
 	pcm_conf->dma_dev = dma_dev;
 
-	if (dev->of_node) {
-		pcm_conf->chan_names[SNDRV_PCM_STREAM_PLAYBACK] = tx;
-		pcm_conf->chan_names[SNDRV_PCM_STREAM_CAPTURE] = rx;
-	} else {
-		flags |= SND_DMAENGINE_PCM_FLAG_CUSTOM_CHANNEL_NAME;
-	}
+	pcm_conf->chan_names[SNDRV_PCM_STREAM_PLAYBACK] = tx;
+	pcm_conf->chan_names[SNDRV_PCM_STREAM_CAPTURE] = rx;
 
-	return devm_snd_dmaengine_pcm_register(dev, pcm_conf, flags);
+	return devm_snd_dmaengine_pcm_register(dev, pcm_conf,
+				SND_DMAENGINE_PCM_FLAG_COMPAT);
 }
 EXPORT_SYMBOL_GPL(samsung_asoc_dma_platform_register);
 
diff --git a/sound/soc/samsung/i2s.c b/sound/soc/samsung/i2s.c
index 692a752b194c..6ab99e38e6dd 100644
--- a/sound/soc/samsung/i2s.c
+++ b/sound/soc/samsung/i2s.c
@@ -1460,7 +1460,7 @@ static int samsung_i2s_probe(struct platform_device *pdev)
 		pri_dai->drv->playback.channels_max = 6;
 
 	ret = samsung_asoc_dma_platform_register(&pdev->dev, pri_dai->filter,
-						 NULL, NULL, NULL);
+						 "tx", "rx", NULL);
 	if (ret < 0)
 		goto err_disable_clk;
 
diff --git a/sound/soc/samsung/s3c2412-i2s.c b/sound/soc/samsung/s3c2412-i2s.c
index 67dfa27ae321..c08638b0e458 100644
--- a/sound/soc/samsung/s3c2412-i2s.c
+++ b/sound/soc/samsung/s3c2412-i2s.c
@@ -177,7 +177,7 @@ static int s3c2412_iis_dev_probe(struct platform_device *pdev)
 
 	ret = samsung_asoc_dma_platform_register(&pdev->dev,
 						 pdata->dma_filter,
-						 NULL, NULL, NULL);
+						 "tx", "rx", NULL);
 	if (ret) {
 		pr_err("failed to register the DMA: %d\n", ret);
 		return ret;
diff --git a/sound/soc/samsung/s3c24xx-i2s.c b/sound/soc/samsung/s3c24xx-i2s.c
index ba0f2b94f8d4..a8026b640c95 100644
--- a/sound/soc/samsung/s3c24xx-i2s.c
+++ b/sound/soc/samsung/s3c24xx-i2s.c
@@ -446,7 +446,7 @@ static int s3c24xx_iis_dev_probe(struct platform_device *pdev)
 	s3c24xx_i2s_pcm_stereo_in.addr = res->start + S3C2410_IISFIFO;
 
 	ret = samsung_asoc_dma_platform_register(&pdev->dev, NULL,
-						 NULL, NULL, NULL);
+						 "tx", "rx", NULL);
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to register the DMA: %d\n", ret);
 		return ret;
-- 
2.17.1
