From: jassisinghbrar@gmail.com
Subject: [PATCH 2/7] S3C AUDIO: Rename s3c24xx-pcm driver to generic s3c_audio
Date: Wed,  4 Nov 2009 17:29:04 +0900
Message-ID: <1257323349-18481-2-git-send-email-jassisinghbrar@gmail.com>
References: <1257323349-18481-1-git-send-email-jassisinghbrar@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:37795 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753526AbZKDIdY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 4 Nov 2009 03:33:24 -0500
In-Reply-To: <1257323349-18481-1-git-send-email-jassisinghbrar@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Jassi Brar <jassi.brar@samsung.com>

From: Jassi Brar <jassi.brar@samsung.com>

Following the s3c24xx_pcm prefix rename, the driver is also renamed.

Signed-off-by: Jassi Brar <jassi.brar@samsung.com>
---
 sound/soc/s3c24xx/Makefile                     |    2 +-
 sound/soc/s3c24xx/jive_wm8750.c                |    2 +-
 sound/soc/s3c24xx/ln2440sbc_alc650.c           |    2 +-
 sound/soc/s3c24xx/neo1973_gta02_wm8753.c       |    2 +-
 sound/soc/s3c24xx/neo1973_wm8753.c             |    2 +-
 sound/soc/s3c24xx/s3c-audio.c                  |  467 ++++++++++++++++++++++++
 sound/soc/s3c24xx/s3c-audio.h                  |   31 ++
 sound/soc/s3c24xx/s3c-i2s-v2.c                 |    2 +-
 sound/soc/s3c24xx/s3c2412-i2s.c                |    2 +-
 sound/soc/s3c24xx/s3c2443-ac97.c               |    2 +-
 sound/soc/s3c24xx/s3c24xx-i2s.c                |    2 +-
 sound/soc/s3c24xx/s3c24xx-pcm.c                |  467 ------------------------
 sound/soc/s3c24xx/s3c24xx-pcm.h                |   31 --
 sound/soc/s3c24xx/s3c24xx_simtec.c             |    2 +-
 sound/soc/s3c24xx/s3c24xx_simtec_hermes.c      |    2 +-
 sound/soc/s3c24xx/s3c24xx_simtec_tlv320aic23.c |    2 +-
 sound/soc/s3c24xx/s3c24xx_uda134x.c            |    2 +-
 sound/soc/s3c24xx/s3c64xx-i2s.c                |    2 +-
 sound/soc/s3c24xx/smdk2443_wm9710.c            |    2 +-
 sound/soc/s3c24xx/smdk64xx_wm8580.c            |    2 +-
 20 files changed, 514 insertions(+), 514 deletions(-)
 create mode 100644 sound/soc/s3c24xx/s3c-audio.c
 create mode 100644 sound/soc/s3c24xx/s3c-audio.h
 delete mode 100644 sound/soc/s3c24xx/s3c24xx-pcm.c
 delete mode 100644 sound/soc/s3c24xx/s3c24xx-pcm.h

diff --git a/sound/soc/s3c24xx/Makefile b/sound/soc/s3c24xx/Makefile
index 7790406..3bdb74d 100644
--- a/sound/soc/s3c24xx/Makefile
+++ b/sound/soc/s3c24xx/Makefile
@@ -1,5 +1,5 @@
 # S3c24XX Platform Support
-snd-soc-s3c24xx-objs := s3c24xx-pcm.o
+snd-soc-s3c24xx-objs := s3c-audio.o
 snd-soc-s3c24xx-i2s-objs := s3c24xx-i2s.o
 snd-soc-s3c2412-i2s-objs := s3c2412-i2s.o
 snd-soc-s3c64xx-i2s-objs := s3c64xx-i2s.o
diff --git a/sound/soc/s3c24xx/jive_wm8750.c b/sound/soc/s3c24xx/jive_wm8750.c
index 93e6c87..ac3a709 100644
--- a/sound/soc/s3c24xx/jive_wm8750.c
+++ b/sound/soc/s3c24xx/jive_wm8750.c
@@ -25,7 +25,7 @@
 
 #include <asm/mach-types.h>
 
-#include "s3c24xx-pcm.h"
+#include "s3c-audio.h"
 #include "s3c2412-i2s.h"
 
 #include "../codecs/wm8750.h"
diff --git a/sound/soc/s3c24xx/ln2440sbc_alc650.c b/sound/soc/s3c24xx/ln2440sbc_alc650.c
index 12c7148..3896e52 100644
--- a/sound/soc/s3c24xx/ln2440sbc_alc650.c
+++ b/sound/soc/s3c24xx/ln2440sbc_alc650.c
@@ -24,7 +24,7 @@
 #include <sound/soc-dapm.h>
 
 #include "../codecs/ac97.h"
-#include "s3c24xx-pcm.h"
+#include "s3c-audio.h"
 #include "s3c24xx-ac97.h"
 
 static struct snd_soc_card ln2440sbc;
diff --git a/sound/soc/s3c24xx/neo1973_gta02_wm8753.c b/sound/soc/s3c24xx/neo1973_gta02_wm8753.c
index 26409a9..1d05137 100644
--- a/sound/soc/s3c24xx/neo1973_gta02_wm8753.c
+++ b/sound/soc/s3c24xx/neo1973_gta02_wm8753.c
@@ -32,7 +32,7 @@
 #include <asm/io.h>
 #include <mach/gta02.h>
 #include "../codecs/wm8753.h"
-#include "s3c24xx-pcm.h"
+#include "s3c-audio.h"
 #include "s3c24xx-i2s.h"
 
 static struct snd_soc_card neo1973_gta02;
diff --git a/sound/soc/s3c24xx/neo1973_wm8753.c b/sound/soc/s3c24xx/neo1973_wm8753.c
index 77de6c5..9183166 100644
--- a/sound/soc/s3c24xx/neo1973_wm8753.c
+++ b/sound/soc/s3c24xx/neo1973_wm8753.c
@@ -36,7 +36,7 @@
 
 #include "../codecs/wm8753.h"
 #include "lm4857.h"
-#include "s3c24xx-pcm.h"
+#include "s3c-audio.h"
 #include "s3c24xx-i2s.h"
 
 /* define the scenarios */
diff --git a/sound/soc/s3c24xx/s3c-audio.c b/sound/soc/s3c24xx/s3c-audio.c
new file mode 100644
index 0000000..57bdcea
--- /dev/null
+++ b/sound/soc/s3c24xx/s3c-audio.c
@@ -0,0 +1,467 @@
+/*
+ * s3c-audio.c  --  ALSA Soc Audio Layer
+ *
+ * (c) 2006 Wolfson Microelectronics PLC.
+ * Graeme Gregory graeme.gregory@wolfsonmicro.com or linux@wolfsonmicro.com
+ *
+ * Copyright 2004-2005 Simtec Electronics
+ *	http://armlinux.simtec.co.uk/
+ *	Ben Dooks <ben@simtec.co.uk>
+ *
+ *  This program is free software; you can redistribute  it and/or modify it
+ *  under  the terms of  the GNU General  Public License as published by the
+ *  Free Software Foundation;  either version 2 of the  License, or (at your
+ *  option) any later version.
+ */
+
+#include <linux/module.h>
+#include <linux/init.h>
+#include <linux/io.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+#include <linux/dma-mapping.h>
+
+#include <sound/core.h>
+#include <sound/pcm.h>
+#include <sound/pcm_params.h>
+#include <sound/soc.h>
+
+#include <asm/dma.h>
+#include <mach/hardware.h>
+#include <mach/dma.h>
+
+#include "s3c-audio.h"
+
+static const struct snd_pcm_hardware s3c_audio_hardware = {
+	.info			= SNDRV_PCM_INFO_INTERLEAVED |
+				    SNDRV_PCM_INFO_BLOCK_TRANSFER |
+				    SNDRV_PCM_INFO_MMAP |
+				    SNDRV_PCM_INFO_MMAP_VALID |
+				    SNDRV_PCM_INFO_PAUSE |
+				    SNDRV_PCM_INFO_RESUME,
+	.formats		= SNDRV_PCM_FMTBIT_S16_LE |
+				    SNDRV_PCM_FMTBIT_U16_LE |
+				    SNDRV_PCM_FMTBIT_U8 |
+				    SNDRV_PCM_FMTBIT_S8,
+	.channels_min		= 2,
+	.channels_max		= 2,
+	.buffer_bytes_max	= 128*1024,
+	.period_bytes_min	= PAGE_SIZE,
+	.period_bytes_max	= PAGE_SIZE*2,
+	.periods_min		= 2,
+	.periods_max		= 128,
+	.fifo_size		= 32,
+};
+
+struct s3c24xx_runtime_data {
+	spinlock_t lock;
+	int state;
+	unsigned int dma_loaded;
+	unsigned int dma_limit;
+	unsigned int dma_period;
+	dma_addr_t dma_start;
+	dma_addr_t dma_pos;
+	dma_addr_t dma_end;
+	struct s3c_audio_dma_params *params;
+};
+
+/* s3c_audio_dma_enqueue
+ *
+ * place a dma buffer onto the queue for the dma system
+ * to handle.
+*/
+static void s3c_audio_dma_enqueue(struct snd_pcm_substream *substream)
+{
+	struct s3c24xx_runtime_data *prtd = substream->runtime->private_data;
+	dma_addr_t pos = prtd->dma_pos;
+	int ret;
+
+	pr_debug("Entered %s\n", __func__);
+
+	while (prtd->dma_loaded < prtd->dma_limit) {
+		unsigned long len = prtd->dma_period;
+
+		pr_debug("dma_loaded: %d\n", prtd->dma_loaded);
+
+		if ((pos + len) > prtd->dma_end) {
+			len  = prtd->dma_end - pos;
+			pr_debug(KERN_DEBUG "%s: corrected dma len %ld\n",
+			       __func__, len);
+		}
+
+		ret = s3c2410_dma_enqueue(prtd->params->channel,
+			substream, pos, len);
+
+		if (ret == 0) {
+			prtd->dma_loaded++;
+			pos += prtd->dma_period;
+			if (pos >= prtd->dma_end)
+				pos = prtd->dma_start;
+		} else
+			break;
+	}
+
+	prtd->dma_pos = pos;
+}
+
+static void s3c24xx_audio_buffdone(struct s3c2410_dma_chan *channel,
+				void *dev_id, int size,
+				enum s3c2410_dma_buffresult result)
+{
+	struct snd_pcm_substream *substream = dev_id;
+	struct s3c24xx_runtime_data *prtd;
+
+	pr_debug("Entered %s\n", __func__);
+
+	if (result == S3C2410_RES_ABORT || result == S3C2410_RES_ERR)
+		return;
+
+	prtd = substream->runtime->private_data;
+
+	if (substream)
+		snd_pcm_period_elapsed(substream);
+
+	spin_lock(&prtd->lock);
+	if (prtd->state & ST_RUNNING) {
+		prtd->dma_loaded--;
+		s3c_audio_dma_enqueue(substream);
+	}
+
+	spin_unlock(&prtd->lock);
+}
+
+static int s3c_audio_hw_params(struct snd_pcm_substream *substream,
+	struct snd_pcm_hw_params *params)
+{
+	struct snd_pcm_runtime *runtime = substream->runtime;
+	struct s3c24xx_runtime_data *prtd = runtime->private_data;
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct s3c_audio_dma_params *dma = rtd->dai->cpu_dai->dma_data;
+	unsigned long totbytes = params_buffer_bytes(params);
+	int ret = 0;
+
+	pr_debug("Entered %s\n", __func__);
+
+	/* return if this is a bufferless transfer e.g.
+	 * codec <--> BT codec or GSM modem -- lg FIXME */
+	if (!dma)
+		return 0;
+
+	/* this may get called several times by oss emulation
+	 * with different params -HW */
+	if (prtd->params == NULL) {
+		/* prepare DMA */
+		prtd->params = dma;
+
+		pr_debug("params %p, client %p, channel %d\n", prtd->params,
+			prtd->params->client, prtd->params->channel);
+
+		ret = s3c2410_dma_request(prtd->params->channel,
+					  prtd->params->client, NULL);
+
+		if (ret < 0) {
+			printk(KERN_ERR "failed to get dma channel\n");
+			return ret;
+		}
+	}
+
+	s3c2410_dma_set_buffdone_fn(prtd->params->channel,
+				    s3c24xx_audio_buffdone);
+
+	snd_pcm_set_runtime_buffer(substream, &substream->dma_buffer);
+
+	runtime->dma_bytes = totbytes;
+
+	spin_lock_irq(&prtd->lock);
+	prtd->dma_loaded = 0;
+	prtd->dma_limit = runtime->hw.periods_min;
+	prtd->dma_period = params_period_bytes(params);
+	prtd->dma_start = runtime->dma_addr;
+	prtd->dma_pos = prtd->dma_start;
+	prtd->dma_end = prtd->dma_start + totbytes;
+	spin_unlock_irq(&prtd->lock);
+
+	return 0;
+}
+
+static int s3c_audio_hw_free(struct snd_pcm_substream *substream)
+{
+	struct s3c24xx_runtime_data *prtd = substream->runtime->private_data;
+
+	pr_debug("Entered %s\n", __func__);
+
+	/* TODO - do we need to ensure DMA flushed */
+	snd_pcm_set_runtime_buffer(substream, NULL);
+
+	if (prtd->params) {
+		s3c2410_dma_free(prtd->params->channel, prtd->params->client);
+		prtd->params = NULL;
+	}
+
+	return 0;
+}
+
+static int s3c_audio_prepare(struct snd_pcm_substream *substream)
+{
+	struct s3c24xx_runtime_data *prtd = substream->runtime->private_data;
+	int ret = 0;
+
+	pr_debug("Entered %s\n", __func__);
+
+	/* return if this is a bufferless transfer e.g.
+	 * codec <--> BT codec or GSM modem -- lg FIXME */
+	if (!prtd->params)
+		return 0;
+
+	/* channel needs configuring for mem=>device, increment memory addr,
+	 * sync to pclk, half-word transfers to the IIS-FIFO. */
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		s3c2410_dma_devconfig(prtd->params->channel,
+				      S3C2410_DMASRC_MEM,
+				      prtd->params->dma_addr);
+	} else {
+		s3c2410_dma_devconfig(prtd->params->channel,
+				      S3C2410_DMASRC_HW,
+				      prtd->params->dma_addr);
+	}
+
+	s3c2410_dma_config(prtd->params->channel,
+			   prtd->params->dma_size);
+
+	/* flush the DMA channel */
+	s3c2410_dma_ctrl(prtd->params->channel, S3C2410_DMAOP_FLUSH);
+	prtd->dma_loaded = 0;
+	prtd->dma_pos = prtd->dma_start;
+
+	/* enqueue dma buffers */
+	s3c_audio_dma_enqueue(substream);
+
+	return ret;
+}
+
+static int s3c_audio_trigger(struct snd_pcm_substream *substream, int cmd)
+{
+	struct s3c24xx_runtime_data *prtd = substream->runtime->private_data;
+	int ret = 0;
+
+	pr_debug("Entered %s\n", __func__);
+
+	spin_lock(&prtd->lock);
+
+	switch (cmd) {
+	case SNDRV_PCM_TRIGGER_START:
+	case SNDRV_PCM_TRIGGER_RESUME:
+	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
+		prtd->state |= ST_RUNNING;
+		s3c2410_dma_ctrl(prtd->params->channel, S3C2410_DMAOP_START);
+		break;
+
+	case SNDRV_PCM_TRIGGER_STOP:
+	case SNDRV_PCM_TRIGGER_SUSPEND:
+	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
+		prtd->state &= ~ST_RUNNING;
+		s3c2410_dma_ctrl(prtd->params->channel, S3C2410_DMAOP_STOP);
+		break;
+
+	default:
+		ret = -EINVAL;
+		break;
+	}
+
+	spin_unlock(&prtd->lock);
+
+	return ret;
+}
+
+static snd_pcm_uframes_t
+s3c_audio_pointer(struct snd_pcm_substream *substream)
+{
+	struct snd_pcm_runtime *runtime = substream->runtime;
+	struct s3c24xx_runtime_data *prtd = runtime->private_data;
+	unsigned long res;
+	dma_addr_t src, dst;
+
+	pr_debug("Entered %s\n", __func__);
+
+	spin_lock(&prtd->lock);
+	s3c2410_dma_getposition(prtd->params->channel, &src, &dst);
+
+	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
+		res = dst - prtd->dma_start;
+	else
+		res = src - prtd->dma_start;
+
+	spin_unlock(&prtd->lock);
+
+	pr_debug("Pointer %x %x\n", src, dst);
+
+	/* we seem to be getting the odd error from the pcm library due
+	 * to out-of-bounds pointers. this is maybe due to the dma engine
+	 * not having loaded the new values for the channel before being
+	 * callled... (todo - fix )
+	 */
+
+	if (res >= snd_pcm_lib_buffer_bytes(substream)) {
+		if (res == snd_pcm_lib_buffer_bytes(substream))
+			res = 0;
+	}
+
+	return bytes_to_frames(substream->runtime, res);
+}
+
+static int s3c_audio_open(struct snd_pcm_substream *substream)
+{
+	struct snd_pcm_runtime *runtime = substream->runtime;
+	struct s3c24xx_runtime_data *prtd;
+
+	pr_debug("Entered %s\n", __func__);
+
+	snd_pcm_hw_constraint_integer(runtime, SNDRV_PCM_HW_PARAM_PERIODS);
+	snd_soc_set_runtime_hwparams(substream, &s3c_audio_hardware);
+
+	prtd = kzalloc(sizeof(struct s3c24xx_runtime_data), GFP_KERNEL);
+	if (prtd == NULL)
+		return -ENOMEM;
+
+	spin_lock_init(&prtd->lock);
+
+	runtime->private_data = prtd;
+	return 0;
+}
+
+static int s3c_audio_close(struct snd_pcm_substream *substream)
+{
+	struct snd_pcm_runtime *runtime = substream->runtime;
+	struct s3c24xx_runtime_data *prtd = runtime->private_data;
+
+	pr_debug("Entered %s\n", __func__);
+
+	if (!prtd)
+		pr_debug("s3c_audio_close called with prtd == NULL\n");
+
+	kfree(prtd);
+
+	return 0;
+}
+
+static int s3c_audio_mmap(struct snd_pcm_substream *substream,
+	struct vm_area_struct *vma)
+{
+	struct snd_pcm_runtime *runtime = substream->runtime;
+
+	pr_debug("Entered %s\n", __func__);
+
+	return dma_mmap_writecombine(substream->pcm->card->dev, vma,
+				     runtime->dma_area,
+				     runtime->dma_addr,
+				     runtime->dma_bytes);
+}
+
+static struct snd_pcm_ops s3c_audio_ops = {
+	.open		= s3c_audio_open,
+	.close		= s3c_audio_close,
+	.ioctl		= snd_pcm_lib_ioctl,
+	.hw_params	= s3c_audio_hw_params,
+	.hw_free	= s3c_audio_hw_free,
+	.prepare	= s3c_audio_prepare,
+	.trigger	= s3c_audio_trigger,
+	.pointer	= s3c_audio_pointer,
+	.mmap		= s3c_audio_mmap,
+};
+
+static int s3c_audio_preallocate_dma_buffer(struct snd_pcm *pcm, int stream)
+{
+	struct snd_pcm_substream *substream = pcm->streams[stream].substream;
+	struct snd_dma_buffer *buf = &substream->dma_buffer;
+	size_t size = s3c_audio_hardware.buffer_bytes_max;
+
+	pr_debug("Entered %s\n", __func__);
+
+	buf->dev.type = SNDRV_DMA_TYPE_DEV;
+	buf->dev.dev = pcm->card->dev;
+	buf->private_data = NULL;
+	buf->area = dma_alloc_writecombine(pcm->card->dev, size,
+					   &buf->addr, GFP_KERNEL);
+	if (!buf->area)
+		return -ENOMEM;
+	buf->bytes = size;
+	return 0;
+}
+
+static void s3c_audio_free_dma_buffers(struct snd_pcm *pcm)
+{
+	struct snd_pcm_substream *substream;
+	struct snd_dma_buffer *buf;
+	int stream;
+
+	pr_debug("Entered %s\n", __func__);
+
+	for (stream = 0; stream < 2; stream++) {
+		substream = pcm->streams[stream].substream;
+		if (!substream)
+			continue;
+
+		buf = &substream->dma_buffer;
+		if (!buf->area)
+			continue;
+
+		dma_free_writecombine(pcm->card->dev, buf->bytes,
+				      buf->area, buf->addr);
+		buf->area = NULL;
+	}
+}
+
+static u64 s3c_audio_dmamask = DMA_BIT_MASK(32);
+
+static int s3c_audio_new(struct snd_card *card,
+	struct snd_soc_dai *dai, struct snd_pcm *pcm)
+{
+	int ret = 0;
+
+	pr_debug("Entered %s\n", __func__);
+
+	if (!card->dev->dma_mask)
+		card->dev->dma_mask = &s3c_audio_dmamask;
+	if (!card->dev->coherent_dma_mask)
+		card->dev->coherent_dma_mask = 0xffffffff;
+
+	if (dai->playback.channels_min) {
+		ret = s3c_audio_preallocate_dma_buffer(pcm,
+			SNDRV_PCM_STREAM_PLAYBACK);
+		if (ret)
+			goto out;
+	}
+
+	if (dai->capture.channels_min) {
+		ret = s3c_audio_preallocate_dma_buffer(pcm,
+			SNDRV_PCM_STREAM_CAPTURE);
+		if (ret)
+			goto out;
+	}
+ out:
+	return ret;
+}
+
+struct snd_soc_platform s3c24xx_soc_platform = {
+	.name		= "s3c24xx-audio",
+	.pcm_ops 	= &s3c_audio_ops,
+	.pcm_new	= s3c_audio_new,
+	.pcm_free	= s3c_audio_free_dma_buffers,
+};
+EXPORT_SYMBOL_GPL(s3c24xx_soc_platform);
+
+static int __init s3c24xx_soc_platform_init(void)
+{
+	return snd_soc_register_platform(&s3c24xx_soc_platform);
+}
+module_init(s3c24xx_soc_platform_init);
+
+static void __exit s3c24xx_soc_platform_exit(void)
+{
+	snd_soc_unregister_platform(&s3c24xx_soc_platform);
+}
+module_exit(s3c24xx_soc_platform_exit);
+
+MODULE_AUTHOR("Ben Dooks, <ben@simtec.co.uk>");
+MODULE_DESCRIPTION("Samsung S3C Audio DMA module");
+MODULE_LICENSE("GPL");
diff --git a/sound/soc/s3c24xx/s3c-audio.h b/sound/soc/s3c24xx/s3c-audio.h
new file mode 100644
index 0000000..fd1f55f
--- /dev/null
+++ b/sound/soc/s3c24xx/s3c-audio.h
@@ -0,0 +1,31 @@
+/*
+ *  s3c-audio.h --
+ *
+ *  This program is free software; you can redistribute  it and/or modify it
+ *  under  the terms of  the GNU General  Public License as published by the
+ *  Free Software Foundation;  either version 2 of the  License, or (at your
+ *  option) any later version.
+ *
+ *  ALSA PCM interface for the Samsung S3C24xx CPU
+ */
+
+#ifndef _S3C_AUDIO_H
+#define _S3C_AUDIO_H
+
+#define ST_RUNNING		(1<<0)
+#define ST_OPENED		(1<<1)
+
+struct s3c_audio_dma_params {
+	struct s3c2410_dma_client *client;	/* stream identifier */
+	int channel;				/* Channel ID */
+	dma_addr_t dma_addr;
+	int dma_size;			/* Size of the DMA transfer */
+};
+
+#define S3C24XX_DAI_I2S			0
+
+/* platform data */
+extern struct snd_soc_platform s3c24xx_soc_platform;
+extern struct snd_ac97_bus_ops s3c24xx_ac97_ops;
+
+#endif
diff --git a/sound/soc/s3c24xx/s3c-i2s-v2.c b/sound/soc/s3c24xx/s3c-i2s-v2.c
index 9788e65..4e322a0 100644
--- a/sound/soc/s3c24xx/s3c-i2s-v2.c
+++ b/sound/soc/s3c24xx/s3c-i2s-v2.c
@@ -35,7 +35,7 @@
 #include <mach/dma.h>
 
 #include "s3c-i2s-v2.h"
-#include "s3c24xx-pcm.h"
+#include "s3c-audio.h"
 
 #undef S3C_IIS_V2_SUPPORTED
 
diff --git a/sound/soc/s3c24xx/s3c2412-i2s.c b/sound/soc/s3c24xx/s3c2412-i2s.c
index 6bc13d5..593a081 100644
--- a/sound/soc/s3c24xx/s3c2412-i2s.c
+++ b/sound/soc/s3c24xx/s3c2412-i2s.c
@@ -37,7 +37,7 @@
 #include <mach/regs-gpio.h>
 #include <mach/dma.h>
 
-#include "s3c24xx-pcm.h"
+#include "s3c-audio.h"
 #include "s3c2412-i2s.h"
 
 #define S3C2412_I2S_DEBUG 0
diff --git a/sound/soc/s3c24xx/s3c2443-ac97.c b/sound/soc/s3c24xx/s3c2443-ac97.c
index d3bd29a..2b71218 100644
--- a/sound/soc/s3c24xx/s3c2443-ac97.c
+++ b/sound/soc/s3c24xx/s3c2443-ac97.c
@@ -35,7 +35,7 @@
 #include <asm/dma.h>
 #include <mach/dma.h>
 
-#include "s3c24xx-pcm.h"
+#include "s3c-audio.h"
 #include "s3c24xx-ac97.h"
 
 struct s3c24xx_ac97_info {
diff --git a/sound/soc/s3c24xx/s3c24xx-i2s.c b/sound/soc/s3c24xx/s3c24xx-i2s.c
index 998e752..2361aa6 100644
--- a/sound/soc/s3c24xx/s3c24xx-i2s.c
+++ b/sound/soc/s3c24xx/s3c24xx-i2s.c
@@ -38,7 +38,7 @@
 
 #include <plat/regs-iis.h>
 
-#include "s3c24xx-pcm.h"
+#include "s3c-audio.h"
 #include "s3c24xx-i2s.h"
 
 static struct s3c2410_dma_client s3c24xx_dma_client_out = {
diff --git a/sound/soc/s3c24xx/s3c24xx-pcm.c b/sound/soc/s3c24xx/s3c24xx-pcm.c
deleted file mode 100644
index ada4bb8..0000000
--- a/sound/soc/s3c24xx/s3c24xx-pcm.c
+++ /dev/null
@@ -1,467 +0,0 @@
-/*
- * s3c24xx-pcm.c  --  ALSA Soc Audio Layer
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
-#include <linux/module.h>
-#include <linux/init.h>
-#include <linux/io.h>
-#include <linux/platform_device.h>
-#include <linux/slab.h>
-#include <linux/dma-mapping.h>
-
-#include <sound/core.h>
-#include <sound/pcm.h>
-#include <sound/pcm_params.h>
-#include <sound/soc.h>
-
-#include <asm/dma.h>
-#include <mach/hardware.h>
-#include <mach/dma.h>
-
-#include "s3c24xx-pcm.h"
-
-static const struct snd_pcm_hardware s3c_audio_hardware = {
-	.info			= SNDRV_PCM_INFO_INTERLEAVED |
-				    SNDRV_PCM_INFO_BLOCK_TRANSFER |
-				    SNDRV_PCM_INFO_MMAP |
-				    SNDRV_PCM_INFO_MMAP_VALID |
-				    SNDRV_PCM_INFO_PAUSE |
-				    SNDRV_PCM_INFO_RESUME,
-	.formats		= SNDRV_PCM_FMTBIT_S16_LE |
-				    SNDRV_PCM_FMTBIT_U16_LE |
-				    SNDRV_PCM_FMTBIT_U8 |
-				    SNDRV_PCM_FMTBIT_S8,
-	.channels_min		= 2,
-	.channels_max		= 2,
-	.buffer_bytes_max	= 128*1024,
-	.period_bytes_min	= PAGE_SIZE,
-	.period_bytes_max	= PAGE_SIZE*2,
-	.periods_min		= 2,
-	.periods_max		= 128,
-	.fifo_size		= 32,
-};
-
-struct s3c24xx_runtime_data {
-	spinlock_t lock;
-	int state;
-	unsigned int dma_loaded;
-	unsigned int dma_limit;
-	unsigned int dma_period;
-	dma_addr_t dma_start;
-	dma_addr_t dma_pos;
-	dma_addr_t dma_end;
-	struct s3c_audio_dma_params *params;
-};
-
-/* s3c_audio_dma_enqueue
- *
- * place a dma buffer onto the queue for the dma system
- * to handle.
-*/
-static void s3c_audio_dma_enqueue(struct snd_pcm_substream *substream)
-{
-	struct s3c24xx_runtime_data *prtd = substream->runtime->private_data;
-	dma_addr_t pos = prtd->dma_pos;
-	int ret;
-
-	pr_debug("Entered %s\n", __func__);
-
-	while (prtd->dma_loaded < prtd->dma_limit) {
-		unsigned long len = prtd->dma_period;
-
-		pr_debug("dma_loaded: %d\n", prtd->dma_loaded);
-
-		if ((pos + len) > prtd->dma_end) {
-			len  = prtd->dma_end - pos;
-			pr_debug(KERN_DEBUG "%s: corrected dma len %ld\n",
-			       __func__, len);
-		}
-
-		ret = s3c2410_dma_enqueue(prtd->params->channel,
-			substream, pos, len);
-
-		if (ret == 0) {
-			prtd->dma_loaded++;
-			pos += prtd->dma_period;
-			if (pos >= prtd->dma_end)
-				pos = prtd->dma_start;
-		} else
-			break;
-	}
-
-	prtd->dma_pos = pos;
-}
-
-static void s3c24xx_audio_buffdone(struct s3c2410_dma_chan *channel,
-				void *dev_id, int size,
-				enum s3c2410_dma_buffresult result)
-{
-	struct snd_pcm_substream *substream = dev_id;
-	struct s3c24xx_runtime_data *prtd;
-
-	pr_debug("Entered %s\n", __func__);
-
-	if (result == S3C2410_RES_ABORT || result == S3C2410_RES_ERR)
-		return;
-
-	prtd = substream->runtime->private_data;
-
-	if (substream)
-		snd_pcm_period_elapsed(substream);
-
-	spin_lock(&prtd->lock);
-	if (prtd->state & ST_RUNNING) {
-		prtd->dma_loaded--;
-		s3c_audio_dma_enqueue(substream);
-	}
-
-	spin_unlock(&prtd->lock);
-}
-
-static int s3c_audio_hw_params(struct snd_pcm_substream *substream,
-	struct snd_pcm_hw_params *params)
-{
-	struct snd_pcm_runtime *runtime = substream->runtime;
-	struct s3c24xx_runtime_data *prtd = runtime->private_data;
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct s3c_audio_dma_params *dma = rtd->dai->cpu_dai->dma_data;
-	unsigned long totbytes = params_buffer_bytes(params);
-	int ret = 0;
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
-		ret = s3c2410_dma_request(prtd->params->channel,
-					  prtd->params->client, NULL);
-
-		if (ret < 0) {
-			printk(KERN_ERR "failed to get dma channel\n");
-			return ret;
-		}
-	}
-
-	s3c2410_dma_set_buffdone_fn(prtd->params->channel,
-				    s3c24xx_audio_buffdone);
-
-	snd_pcm_set_runtime_buffer(substream, &substream->dma_buffer);
-
-	runtime->dma_bytes = totbytes;
-
-	spin_lock_irq(&prtd->lock);
-	prtd->dma_loaded = 0;
-	prtd->dma_limit = runtime->hw.periods_min;
-	prtd->dma_period = params_period_bytes(params);
-	prtd->dma_start = runtime->dma_addr;
-	prtd->dma_pos = prtd->dma_start;
-	prtd->dma_end = prtd->dma_start + totbytes;
-	spin_unlock_irq(&prtd->lock);
-
-	return 0;
-}
-
-static int s3c_audio_hw_free(struct snd_pcm_substream *substream)
-{
-	struct s3c24xx_runtime_data *prtd = substream->runtime->private_data;
-
-	pr_debug("Entered %s\n", __func__);
-
-	/* TODO - do we need to ensure DMA flushed */
-	snd_pcm_set_runtime_buffer(substream, NULL);
-
-	if (prtd->params) {
-		s3c2410_dma_free(prtd->params->channel, prtd->params->client);
-		prtd->params = NULL;
-	}
-
-	return 0;
-}
-
-static int s3c_audio_prepare(struct snd_pcm_substream *substream)
-{
-	struct s3c24xx_runtime_data *prtd = substream->runtime->private_data;
-	int ret = 0;
-
-	pr_debug("Entered %s\n", __func__);
-
-	/* return if this is a bufferless transfer e.g.
-	 * codec <--> BT codec or GSM modem -- lg FIXME */
-	if (!prtd->params)
-		return 0;
-
-	/* channel needs configuring for mem=>device, increment memory addr,
-	 * sync to pclk, half-word transfers to the IIS-FIFO. */
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
-		s3c2410_dma_devconfig(prtd->params->channel,
-				      S3C2410_DMASRC_MEM,
-				      prtd->params->dma_addr);
-	} else {
-		s3c2410_dma_devconfig(prtd->params->channel,
-				      S3C2410_DMASRC_HW,
-				      prtd->params->dma_addr);
-	}
-
-	s3c2410_dma_config(prtd->params->channel,
-			   prtd->params->dma_size);
-
-	/* flush the DMA channel */
-	s3c2410_dma_ctrl(prtd->params->channel, S3C2410_DMAOP_FLUSH);
-	prtd->dma_loaded = 0;
-	prtd->dma_pos = prtd->dma_start;
-
-	/* enqueue dma buffers */
-	s3c_audio_dma_enqueue(substream);
-
-	return ret;
-}
-
-static int s3c_audio_trigger(struct snd_pcm_substream *substream, int cmd)
-{
-	struct s3c24xx_runtime_data *prtd = substream->runtime->private_data;
-	int ret = 0;
-
-	pr_debug("Entered %s\n", __func__);
-
-	spin_lock(&prtd->lock);
-
-	switch (cmd) {
-	case SNDRV_PCM_TRIGGER_START:
-	case SNDRV_PCM_TRIGGER_RESUME:
-	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
-		prtd->state |= ST_RUNNING;
-		s3c2410_dma_ctrl(prtd->params->channel, S3C2410_DMAOP_START);
-		break;
-
-	case SNDRV_PCM_TRIGGER_STOP:
-	case SNDRV_PCM_TRIGGER_SUSPEND:
-	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
-		prtd->state &= ~ST_RUNNING;
-		s3c2410_dma_ctrl(prtd->params->channel, S3C2410_DMAOP_STOP);
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
-s3c_audio_pointer(struct snd_pcm_substream *substream)
-{
-	struct snd_pcm_runtime *runtime = substream->runtime;
-	struct s3c24xx_runtime_data *prtd = runtime->private_data;
-	unsigned long res;
-	dma_addr_t src, dst;
-
-	pr_debug("Entered %s\n", __func__);
-
-	spin_lock(&prtd->lock);
-	s3c2410_dma_getposition(prtd->params->channel, &src, &dst);
-
-	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
-		res = dst - prtd->dma_start;
-	else
-		res = src - prtd->dma_start;
-
-	spin_unlock(&prtd->lock);
-
-	pr_debug("Pointer %x %x\n", src, dst);
-
-	/* we seem to be getting the odd error from the pcm library due
-	 * to out-of-bounds pointers. this is maybe due to the dma engine
-	 * not having loaded the new values for the channel before being
-	 * callled... (todo - fix )
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
-static int s3c_audio_open(struct snd_pcm_substream *substream)
-{
-	struct snd_pcm_runtime *runtime = substream->runtime;
-	struct s3c24xx_runtime_data *prtd;
-
-	pr_debug("Entered %s\n", __func__);
-
-	snd_pcm_hw_constraint_integer(runtime, SNDRV_PCM_HW_PARAM_PERIODS);
-	snd_soc_set_runtime_hwparams(substream, &s3c_audio_hardware);
-
-	prtd = kzalloc(sizeof(struct s3c24xx_runtime_data), GFP_KERNEL);
-	if (prtd == NULL)
-		return -ENOMEM;
-
-	spin_lock_init(&prtd->lock);
-
-	runtime->private_data = prtd;
-	return 0;
-}
-
-static int s3c_audio_close(struct snd_pcm_substream *substream)
-{
-	struct snd_pcm_runtime *runtime = substream->runtime;
-	struct s3c24xx_runtime_data *prtd = runtime->private_data;
-
-	pr_debug("Entered %s\n", __func__);
-
-	if (!prtd)
-		pr_debug("s3c_audio_close called with prtd == NULL\n");
-
-	kfree(prtd);
-
-	return 0;
-}
-
-static int s3c_audio_mmap(struct snd_pcm_substream *substream,
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
-static struct snd_pcm_ops s3c_audio_ops = {
-	.open		= s3c_audio_open,
-	.close		= s3c_audio_close,
-	.ioctl		= snd_pcm_lib_ioctl,
-	.hw_params	= s3c_audio_hw_params,
-	.hw_free	= s3c_audio_hw_free,
-	.prepare	= s3c_audio_prepare,
-	.trigger	= s3c_audio_trigger,
-	.pointer	= s3c_audio_pointer,
-	.mmap		= s3c_audio_mmap,
-};
-
-static int s3c_audio_preallocate_dma_buffer(struct snd_pcm *pcm, int stream)
-{
-	struct snd_pcm_substream *substream = pcm->streams[stream].substream;
-	struct snd_dma_buffer *buf = &substream->dma_buffer;
-	size_t size = s3c_audio_hardware.buffer_bytes_max;
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
-static void s3c_audio_free_dma_buffers(struct snd_pcm *pcm)
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
-static u64 s3c_audio_dmamask = DMA_BIT_MASK(32);
-
-static int s3c_audio_new(struct snd_card *card,
-	struct snd_soc_dai *dai, struct snd_pcm *pcm)
-{
-	int ret = 0;
-
-	pr_debug("Entered %s\n", __func__);
-
-	if (!card->dev->dma_mask)
-		card->dev->dma_mask = &s3c_audio_dmamask;
-	if (!card->dev->coherent_dma_mask)
-		card->dev->coherent_dma_mask = 0xffffffff;
-
-	if (dai->playback.channels_min) {
-		ret = s3c_audio_preallocate_dma_buffer(pcm,
-			SNDRV_PCM_STREAM_PLAYBACK);
-		if (ret)
-			goto out;
-	}
-
-	if (dai->capture.channels_min) {
-		ret = s3c_audio_preallocate_dma_buffer(pcm,
-			SNDRV_PCM_STREAM_CAPTURE);
-		if (ret)
-			goto out;
-	}
- out:
-	return ret;
-}
-
-struct snd_soc_platform s3c24xx_soc_platform = {
-	.name		= "s3c24xx-audio",
-	.pcm_ops 	= &s3c_audio_ops,
-	.pcm_new	= s3c_audio_new,
-	.pcm_free	= s3c_audio_free_dma_buffers,
-};
-EXPORT_SYMBOL_GPL(s3c24xx_soc_platform);
-
-static int __init s3c24xx_soc_platform_init(void)
-{
-	return snd_soc_register_platform(&s3c24xx_soc_platform);
-}
-module_init(s3c24xx_soc_platform_init);
-
-static void __exit s3c24xx_soc_platform_exit(void)
-{
-	snd_soc_unregister_platform(&s3c24xx_soc_platform);
-}
-module_exit(s3c24xx_soc_platform_exit);
-
-MODULE_AUTHOR("Ben Dooks, <ben@simtec.co.uk>");
-MODULE_DESCRIPTION("Samsung S3C Audio DMA module");
-MODULE_LICENSE("GPL");
diff --git a/sound/soc/s3c24xx/s3c24xx-pcm.h b/sound/soc/s3c24xx/s3c24xx-pcm.h
deleted file mode 100644
index d04ddf8..0000000
--- a/sound/soc/s3c24xx/s3c24xx-pcm.h
+++ /dev/null
@@ -1,31 +0,0 @@
-/*
- *  s3c24xx-pcm.h --
- *
- *  This program is free software; you can redistribute  it and/or modify it
- *  under  the terms of  the GNU General  Public License as published by the
- *  Free Software Foundation;  either version 2 of the  License, or (at your
- *  option) any later version.
- *
- *  ALSA PCM interface for the Samsung S3C24xx CPU
- */
-
-#ifndef _S3C_AUDIO_H
-#define _S3C_AUDIO_H
-
-#define ST_RUNNING		(1<<0)
-#define ST_OPENED		(1<<1)
-
-struct s3c_audio_dma_params {
-	struct s3c2410_dma_client *client;	/* stream identifier */
-	int channel;				/* Channel ID */
-	dma_addr_t dma_addr;
-	int dma_size;			/* Size of the DMA transfer */
-};
-
-#define S3C24XX_DAI_I2S			0
-
-/* platform data */
-extern struct snd_soc_platform s3c24xx_soc_platform;
-extern struct snd_ac97_bus_ops s3c24xx_ac97_ops;
-
-#endif
diff --git a/sound/soc/s3c24xx/s3c24xx_simtec.c b/sound/soc/s3c24xx/s3c24xx_simtec.c
index 1966e0d..ef75416 100644
--- a/sound/soc/s3c24xx/s3c24xx_simtec.c
+++ b/sound/soc/s3c24xx/s3c24xx_simtec.c
@@ -21,7 +21,7 @@
 
 #include <plat/audio-simtec.h>
 
-#include "s3c24xx-pcm.h"
+#include "s3c-audio.h"
 #include "s3c24xx-i2s.h"
 #include "s3c24xx_simtec.h"
 
diff --git a/sound/soc/s3c24xx/s3c24xx_simtec_hermes.c b/sound/soc/s3c24xx/s3c24xx_simtec_hermes.c
index 8346bd9..61166a5 100644
--- a/sound/soc/s3c24xx/s3c24xx_simtec_hermes.c
+++ b/sound/soc/s3c24xx/s3c24xx_simtec_hermes.c
@@ -18,7 +18,7 @@
 
 #include <plat/audio-simtec.h>
 
-#include "s3c24xx-pcm.h"
+#include "s3c-audio.h"
 #include "s3c24xx-i2s.h"
 #include "s3c24xx_simtec.h"
 
diff --git a/sound/soc/s3c24xx/s3c24xx_simtec_tlv320aic23.c b/sound/soc/s3c24xx/s3c24xx_simtec_tlv320aic23.c
index 25797e0..af0bf57 100644
--- a/sound/soc/s3c24xx/s3c24xx_simtec_tlv320aic23.c
+++ b/sound/soc/s3c24xx/s3c24xx_simtec_tlv320aic23.c
@@ -18,7 +18,7 @@
 
 #include <plat/audio-simtec.h>
 
-#include "s3c24xx-pcm.h"
+#include "s3c-audio.h"
 #include "s3c24xx-i2s.h"
 #include "s3c24xx_simtec.h"
 
diff --git a/sound/soc/s3c24xx/s3c24xx_uda134x.c b/sound/soc/s3c24xx/s3c24xx_uda134x.c
index c215d32..e8d6cc2 100644
--- a/sound/soc/s3c24xx/s3c24xx_uda134x.c
+++ b/sound/soc/s3c24xx/s3c24xx_uda134x.c
@@ -24,7 +24,7 @@
 
 #include <plat/regs-iis.h>
 
-#include "s3c24xx-pcm.h"
+#include "s3c-audio.h"
 #include "s3c24xx-i2s.h"
 #include "../codecs/uda134x.h"
 
diff --git a/sound/soc/s3c24xx/s3c64xx-i2s.c b/sound/soc/s3c24xx/s3c64xx-i2s.c
index 03f5a6b..98fa4bd 100644
--- a/sound/soc/s3c24xx/s3c64xx-i2s.c
+++ b/sound/soc/s3c24xx/s3c64xx-i2s.c
@@ -35,7 +35,7 @@
 #include <mach/map.h>
 #include <mach/dma.h>
 
-#include "s3c24xx-pcm.h"
+#include "s3c-audio.h"
 #include "s3c64xx-i2s.h"
 
 static struct s3c2410_dma_client s3c64xx_dma_client_out = {
diff --git a/sound/soc/s3c24xx/smdk2443_wm9710.c b/sound/soc/s3c24xx/smdk2443_wm9710.c
index a2a4f53..106c72d 100644
--- a/sound/soc/s3c24xx/smdk2443_wm9710.c
+++ b/sound/soc/s3c24xx/smdk2443_wm9710.c
@@ -20,7 +20,7 @@
 #include <sound/soc-dapm.h>
 
 #include "../codecs/ac97.h"
-#include "s3c24xx-pcm.h"
+#include "s3c-audio.h"
 #include "s3c24xx-ac97.h"
 
 static struct snd_soc_card smdk2443;
diff --git a/sound/soc/s3c24xx/smdk64xx_wm8580.c b/sound/soc/s3c24xx/smdk64xx_wm8580.c
index cb8a916..7956a9c 100644
--- a/sound/soc/s3c24xx/smdk64xx_wm8580.c
+++ b/sound/soc/s3c24xx/smdk64xx_wm8580.c
@@ -19,7 +19,7 @@
 #include <sound/soc-dapm.h>
 
 #include "../codecs/wm8580.h"
-#include "s3c24xx-pcm.h"
+#include "s3c-audio.h"
 #include "s3c64xx-i2s.h"
 
 #define S3C64XX_I2S_V4 2
-- 
1.6.2.5
