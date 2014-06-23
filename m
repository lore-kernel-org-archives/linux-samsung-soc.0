From: Vasily Khoruzhick <anarsoul@gmail.com>
Subject: [PATCH v3 2/4] ASoC: samsung: drop support for legacy S3C24XX DMA API
Date: Mon, 23 Jun 2014 23:24:05 +0300
Message-ID: <1403555047-14783-3-git-send-email-anarsoul@gmail.com>
References: <1403555047-14783-1-git-send-email-anarsoul@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f48.google.com ([74.125.82.48]:39176 "EHLO
	mail-wg0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932366AbaFWU0s (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 23 Jun 2014 16:26:48 -0400
Received: by mail-wg0-f48.google.com with SMTP id n12so6889786wgh.31
        for <linux-samsung-soc@vger.kernel.org>; Mon, 23 Jun 2014 13:26:47 -0700 (PDT)
In-Reply-To: <1403555047-14783-1-git-send-email-anarsoul@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org, Kukjin Kim <kgene.kim@samsung.com>, Sangbeom Kim <sbkim73@samsung.com>, Lars-Peter Clausen <lars@metafoo.de>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Tomasz Figa <t.figa@samsung.com>, =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>
Cc: Vasily Khoruzhick <anarsoul@gmail.com>

Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
---
 sound/soc/samsung/Kconfig  |   3 -
 sound/soc/samsung/Makefile |   2 -
 sound/soc/samsung/dma.c    | 454 ---------------------------------------------
 3 files changed, 459 deletions(-)

diff --git a/sound/soc/samsung/Kconfig b/sound/soc/samsung/Kconfig
index 98767d3..17547a4 100644
--- a/sound/soc/samsung/Kconfig
+++ b/sound/soc/samsung/Kconfig
@@ -13,9 +13,6 @@ config SND_SOC_SAMSUNG
 config SND_S3C_DMA
 	tristate
 
-config SND_S3C_DMA_LEGACY
-	tristate
-
 config SND_S3C24XX_I2S
 	tristate
 
diff --git a/sound/soc/samsung/Makefile b/sound/soc/samsung/Makefile
index 6d0212b..6469199 100644
--- a/sound/soc/samsung/Makefile
+++ b/sound/soc/samsung/Makefile
@@ -1,6 +1,5 @@
 # S3c24XX Platform Support
 snd-soc-s3c-dma-objs := dmaengine.o
-snd-soc-s3c-dma-legacy-objs := dma.o
 snd-soc-idma-objs := idma.o
 snd-soc-s3c24xx-i2s-objs := s3c24xx-i2s.o
 snd-soc-s3c2412-i2s-objs := s3c2412-i2s.o
@@ -11,7 +10,6 @@ snd-soc-pcm-objs := pcm.o
 snd-soc-i2s-objs := i2s.o
 
 obj-$(CONFIG_SND_S3C_DMA) += snd-soc-s3c-dma.o
-obj-$(CONFIG_SND_S3C_DMA_LEGACY) += snd-soc-s3c-dma-legacy.o
 obj-$(CONFIG_SND_S3C24XX_I2S) += snd-soc-s3c24xx-i2s.o
 obj-$(CONFIG_SND_SAMSUNG_AC97) += snd-soc-ac97.o
 obj-$(CONFIG_SND_S3C2412_SOC_I2S) += snd-soc-s3c2412-i2s.o
diff --git a/sound/soc/samsung/dma.c b/sound/soc/samsung/dma.c
deleted file mode 100644
index d9dc7bc..0000000
--- a/sound/soc/samsung/dma.c
+++ /dev/null
@@ -1,454 +0,0 @@
-/*
- * dma.c  --  ALSA Soc Audio Layer
- *
- * (c) 2006 Wolfson Microelectronics PLC.
- * Graeme Gregory graeme.gregory@wolfsonmicro.com or linux@wolfsonmicro.com
- *
- * Copyright 2004-2005 Simtec Electronics
- *	http://armlinux.simtec.co.uk/
- *	Ben Dooks <ben@simtec.co.uk>
- *
- *  This program is free software; you can redistribute  it and/or modify it
- *  under  the terms of  the GNU General  Public License as published by the
- *  Free Software Foundation;  either version 2 of the  License, or (at your
- *  option) any later version.
- */
-
-#include <linux/slab.h>
-#include <linux/dma-mapping.h>
-#include <linux/module.h>
-
-#include <sound/soc.h>
-#include <sound/pcm_params.h>
-
-#include <asm/dma.h>
-#include <mach/hardware.h>
-#include <mach/dma.h>
-
-#include "dma.h"
-
-#define ST_RUNNING		(1<<0)
-#define ST_OPENED		(1<<1)
-
-static const struct snd_pcm_hardware dma_hardware = {
-	.info			= SNDRV_PCM_INFO_INTERLEAVED |
-				    SNDRV_PCM_INFO_BLOCK_TRANSFER |
-				    SNDRV_PCM_INFO_MMAP |
-				    SNDRV_PCM_INFO_MMAP_VALID,
-	.buffer_bytes_max	= 128*1024,
-	.period_bytes_min	= PAGE_SIZE,
-	.period_bytes_max	= PAGE_SIZE*2,
-	.periods_min		= 2,
-	.periods_max		= 128,
-	.fifo_size		= 32,
-};
-
-struct runtime_data {
-	spinlock_t lock;
-	int state;
-	unsigned int dma_loaded;
-	unsigned int dma_period;
-	dma_addr_t dma_start;
-	dma_addr_t dma_pos;
-	dma_addr_t dma_end;
-	struct s3c_dma_params *params;
-};
-
-static void audio_buffdone(void *data);
-
-/* dma_enqueue
- *
- * place a dma buffer onto the queue for the dma system
- * to handle.
- */
-static void dma_enqueue(struct snd_pcm_substream *substream)
-{
-	struct runtime_data *prtd = substream->runtime->private_data;
-	dma_addr_t pos = prtd->dma_pos;
-	unsigned int limit;
-	struct samsung_dma_prep dma_info;
-
-	pr_debug("Entered %s\n", __func__);
-
-	limit = (prtd->dma_end - prtd->dma_start) / prtd->dma_period;
-
-	pr_debug("%s: loaded %d, limit %d\n",
-				__func__, prtd->dma_loaded, limit);
-
-	dma_info.cap = (samsung_dma_has_circular() ? DMA_CYCLIC : DMA_SLAVE);
-	dma_info.direction =
-		(substream->stream == SNDRV_PCM_STREAM_PLAYBACK
-		? DMA_MEM_TO_DEV : DMA_DEV_TO_MEM);
-	dma_info.fp = audio_buffdone;
-	dma_info.fp_param = substream;
-	dma_info.period = prtd->dma_period;
-	dma_info.len = prtd->dma_period*limit;
-
-	if (dma_info.cap == DMA_CYCLIC) {
-		dma_info.buf = pos;
-		prtd->params->ops->prepare(prtd->params->ch, &dma_info);
-		prtd->dma_loaded += limit;
-		return;
-	}
-
-	while (prtd->dma_loaded < limit) {
-		pr_debug("dma_loaded: %d\n", prtd->dma_loaded);
-
-		if ((pos + dma_info.period) > prtd->dma_end) {
-			dma_info.period  = prtd->dma_end - pos;
-			pr_debug("%s: corrected dma len %ld\n",
-					__func__, dma_info.period);
-		}
-
-		dma_info.buf = pos;
-		prtd->params->ops->prepare(prtd->params->ch, &dma_info);
-
-		prtd->dma_loaded++;
-		pos += prtd->dma_period;
-		if (pos >= prtd->dma_end)
-			pos = prtd->dma_start;
-	}
-
-	prtd->dma_pos = pos;
-}
-
-static void audio_buffdone(void *data)
-{
-	struct snd_pcm_substream *substream = data;
-	struct runtime_data *prtd = substream->runtime->private_data;
-
-	pr_debug("Entered %s\n", __func__);
-
-	if (prtd->state & ST_RUNNING) {
-		prtd->dma_pos += prtd->dma_period;
-		if (prtd->dma_pos >= prtd->dma_end)
-			prtd->dma_pos = prtd->dma_start;
-
-		if (substream)
-			snd_pcm_period_elapsed(substream);
-
-		spin_lock(&prtd->lock);
-		if (!samsung_dma_has_circular()) {
-			prtd->dma_loaded--;
-			dma_enqueue(substream);
-		}
-		spin_unlock(&prtd->lock);
-	}
-}
-
-static int dma_hw_params(struct snd_pcm_substream *substream,
-	struct snd_pcm_hw_params *params)
-{
-	struct snd_pcm_runtime *runtime = substream->runtime;
-	struct runtime_data *prtd = runtime->private_data;
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	unsigned long totbytes = params_buffer_bytes(params);
-	struct s3c_dma_params *dma =
-		snd_soc_dai_get_dma_data(rtd->cpu_dai, substream);
-	struct samsung_dma_req req;
-	struct samsung_dma_config config;
-
-	pr_debug("Entered %s\n", __func__);
-
-	/* return if this is a bufferless transfer e.g.
-	 * codec <--> BT codec or GSM modem -- lg FIXME */
-	if (!dma)
-		return 0;
-
-	/* this may get called several times by oss emulation
-	 * with different params -HW */
-	if (prtd->params == NULL) {
-		/* prepare DMA */
-		prtd->params = dma;
-
-		pr_debug("params %p, client %p, channel %d\n", prtd->params,
-			prtd->params->client, prtd->params->channel);
-
-		prtd->params->ops = samsung_dma_get_ops();
-
-		req.cap = (samsung_dma_has_circular() ?
-			DMA_CYCLIC : DMA_SLAVE);
-		req.client = prtd->params->client;
-		config.direction =
-			(substream->stream == SNDRV_PCM_STREAM_PLAYBACK
-			? DMA_MEM_TO_DEV : DMA_DEV_TO_MEM);
-		config.width = prtd->params->dma_size;
-		config.fifo = prtd->params->dma_addr;
-		prtd->params->ch = prtd->params->ops->request(
-				prtd->params->channel, &req, rtd->cpu_dai->dev,
-				prtd->params->ch_name);
-		if (!prtd->params->ch) {
-			pr_err("Failed to allocate DMA channel\n");
-			return -ENXIO;
-		}
-		prtd->params->ops->config(prtd->params->ch, &config);
-	}
-
-	snd_pcm_set_runtime_buffer(substream, &substream->dma_buffer);
-
-	runtime->dma_bytes = totbytes;
-
-	spin_lock_irq(&prtd->lock);
-	prtd->dma_loaded = 0;
-	prtd->dma_period = params_period_bytes(params);
-	prtd->dma_start = runtime->dma_addr;
-	prtd->dma_pos = prtd->dma_start;
-	prtd->dma_end = prtd->dma_start + totbytes;
-	spin_unlock_irq(&prtd->lock);
-
-	return 0;
-}
-
-static int dma_hw_free(struct snd_pcm_substream *substream)
-{
-	struct runtime_data *prtd = substream->runtime->private_data;
-
-	pr_debug("Entered %s\n", __func__);
-
-	snd_pcm_set_runtime_buffer(substream, NULL);
-
-	if (prtd->params) {
-		prtd->params->ops->flush(prtd->params->ch);
-		prtd->params->ops->release(prtd->params->ch,
-					prtd->params->client);
-		prtd->params = NULL;
-	}
-
-	return 0;
-}
-
-static int dma_prepare(struct snd_pcm_substream *substream)
-{
-	struct runtime_data *prtd = substream->runtime->private_data;
-	int ret = 0;
-
-	pr_debug("Entered %s\n", __func__);
-
-	/* return if this is a bufferless transfer e.g.
-	 * codec <--> BT codec or GSM modem -- lg FIXME */
-	if (!prtd->params)
-		return 0;
-
-	/* flush the DMA channel */
-	prtd->params->ops->flush(prtd->params->ch);
-
-	prtd->dma_loaded = 0;
-	prtd->dma_pos = prtd->dma_start;
-
-	/* enqueue dma buffers */
-	dma_enqueue(substream);
-
-	return ret;
-}
-
-static int dma_trigger(struct snd_pcm_substream *substream, int cmd)
-{
-	struct runtime_data *prtd = substream->runtime->private_data;
-	int ret = 0;
-
-	pr_debug("Entered %s\n", __func__);
-
-	spin_lock(&prtd->lock);
-
-	switch (cmd) {
-	case SNDRV_PCM_TRIGGER_START:
-		prtd->state |= ST_RUNNING;
-		prtd->params->ops->trigger(prtd->params->ch);
-		break;
-
-	case SNDRV_PCM_TRIGGER_STOP:
-		prtd->state &= ~ST_RUNNING;
-		prtd->params->ops->stop(prtd->params->ch);
-		break;
-
-	default:
-		ret = -EINVAL;
-		break;
-	}
-
-	spin_unlock(&prtd->lock);
-
-	return ret;
-}
-
-static snd_pcm_uframes_t
-dma_pointer(struct snd_pcm_substream *substream)
-{
-	struct snd_pcm_runtime *runtime = substream->runtime;
-	struct runtime_data *prtd = runtime->private_data;
-	unsigned long res;
-
-	pr_debug("Entered %s\n", __func__);
-
-	res = prtd->dma_pos - prtd->dma_start;
-
-	pr_debug("Pointer offset: %lu\n", res);
-
-	/* we seem to be getting the odd error from the pcm library due
-	 * to out-of-bounds pointers. this is maybe due to the dma engine
-	 * not having loaded the new values for the channel before being
-	 * called... (todo - fix )
-	 */
-
-	if (res >= snd_pcm_lib_buffer_bytes(substream)) {
-		if (res == snd_pcm_lib_buffer_bytes(substream))
-			res = 0;
-	}
-
-	return bytes_to_frames(substream->runtime, res);
-}
-
-static int dma_open(struct snd_pcm_substream *substream)
-{
-	struct snd_pcm_runtime *runtime = substream->runtime;
-	struct runtime_data *prtd;
-
-	pr_debug("Entered %s\n", __func__);
-
-	snd_pcm_hw_constraint_integer(runtime, SNDRV_PCM_HW_PARAM_PERIODS);
-	snd_soc_set_runtime_hwparams(substream, &dma_hardware);
-
-	prtd = kzalloc(sizeof(struct runtime_data), GFP_KERNEL);
-	if (prtd == NULL)
-		return -ENOMEM;
-
-	spin_lock_init(&prtd->lock);
-
-	runtime->private_data = prtd;
-	return 0;
-}
-
-static int dma_close(struct snd_pcm_substream *substream)
-{
-	struct snd_pcm_runtime *runtime = substream->runtime;
-	struct runtime_data *prtd = runtime->private_data;
-
-	pr_debug("Entered %s\n", __func__);
-
-	if (!prtd)
-		pr_debug("dma_close called with prtd == NULL\n");
-
-	kfree(prtd);
-
-	return 0;
-}
-
-static int dma_mmap(struct snd_pcm_substream *substream,
-	struct vm_area_struct *vma)
-{
-	struct snd_pcm_runtime *runtime = substream->runtime;
-
-	pr_debug("Entered %s\n", __func__);
-
-	return dma_mmap_writecombine(substream->pcm->card->dev, vma,
-				     runtime->dma_area,
-				     runtime->dma_addr,
-				     runtime->dma_bytes);
-}
-
-static struct snd_pcm_ops dma_ops = {
-	.open		= dma_open,
-	.close		= dma_close,
-	.ioctl		= snd_pcm_lib_ioctl,
-	.hw_params	= dma_hw_params,
-	.hw_free	= dma_hw_free,
-	.prepare	= dma_prepare,
-	.trigger	= dma_trigger,
-	.pointer	= dma_pointer,
-	.mmap		= dma_mmap,
-};
-
-static int preallocate_dma_buffer(struct snd_pcm *pcm, int stream)
-{
-	struct snd_pcm_substream *substream = pcm->streams[stream].substream;
-	struct snd_dma_buffer *buf = &substream->dma_buffer;
-	size_t size = dma_hardware.buffer_bytes_max;
-
-	pr_debug("Entered %s\n", __func__);
-
-	buf->dev.type = SNDRV_DMA_TYPE_DEV;
-	buf->dev.dev = pcm->card->dev;
-	buf->private_data = NULL;
-	buf->area = dma_alloc_writecombine(pcm->card->dev, size,
-					   &buf->addr, GFP_KERNEL);
-	if (!buf->area)
-		return -ENOMEM;
-	buf->bytes = size;
-	return 0;
-}
-
-static void dma_free_dma_buffers(struct snd_pcm *pcm)
-{
-	struct snd_pcm_substream *substream;
-	struct snd_dma_buffer *buf;
-	int stream;
-
-	pr_debug("Entered %s\n", __func__);
-
-	for (stream = 0; stream < 2; stream++) {
-		substream = pcm->streams[stream].substream;
-		if (!substream)
-			continue;
-
-		buf = &substream->dma_buffer;
-		if (!buf->area)
-			continue;
-
-		dma_free_writecombine(pcm->card->dev, buf->bytes,
-				      buf->area, buf->addr);
-		buf->area = NULL;
-	}
-}
-
-static int dma_new(struct snd_soc_pcm_runtime *rtd)
-{
-	struct snd_card *card = rtd->card->snd_card;
-	struct snd_pcm *pcm = rtd->pcm;
-	int ret;
-
-	pr_debug("Entered %s\n", __func__);
-
-	ret = dma_coerce_mask_and_coherent(card->dev, DMA_BIT_MASK(32));
-	if (ret)
-		return ret;
-
-	if (pcm->streams[SNDRV_PCM_STREAM_PLAYBACK].substream) {
-		ret = preallocate_dma_buffer(pcm,
-			SNDRV_PCM_STREAM_PLAYBACK);
-		if (ret)
-			goto out;
-	}
-
-	if (pcm->streams[SNDRV_PCM_STREAM_CAPTURE].substream) {
-		ret = preallocate_dma_buffer(pcm,
-			SNDRV_PCM_STREAM_CAPTURE);
-		if (ret)
-			goto out;
-	}
-out:
-	return ret;
-}
-
-static struct snd_soc_platform_driver samsung_asoc_platform = {
-	.ops		= &dma_ops,
-	.pcm_new	= dma_new,
-	.pcm_free	= dma_free_dma_buffers,
-};
-
-void samsung_asoc_init_dma_data(struct snd_soc_dai *dai,
-				struct s3c_dma_params *playback,
-				struct s3c_dma_params *capture)
-{
-	snd_soc_dai_init_dma_data(dai, playback, capture);
-}
-EXPORT_SYMBOL_GPL(samsung_asoc_init_dma_data);
-
-int samsung_asoc_dma_platform_register(struct device *dev)
-{
-	return devm_snd_soc_register_platform(dev, &samsung_asoc_platform);
-}
-EXPORT_SYMBOL_GPL(samsung_asoc_dma_platform_register);
-
-MODULE_AUTHOR("Ben Dooks, <ben@simtec.co.uk>");
-MODULE_DESCRIPTION("Samsung ASoC DMA Driver");
-MODULE_LICENSE("GPL");
-- 
2.0.0
