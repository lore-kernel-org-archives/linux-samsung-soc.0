From: jassisinghbrar@gmail.com
Subject: [PATCH 1/7] S3C AUDIO: Rename s3c24xx_pcm prefix to generic s3c_audio
Date: Wed,  4 Nov 2009 17:29:03 +0900
Message-ID: <1257323349-18481-1-git-send-email-jassisinghbrar@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:37783 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751885AbZKDIdX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 4 Nov 2009 03:33:23 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Jassi Brar <jassi.brar@samsung.com>

From: Jassi Brar <jassi.brar@samsung.com>

The s3c24xx_pcm prefix for the soc_platform is inappropriate when
some Samsung SoCs have PCM controllers which will eventually have
drivers and hence namespace ambiguities.

The prefix 's3c24xx_pcm' is neither specific to 24xx nor is it
about any 'pcm' controller. It is shared across audio protocols.
And 's3c_audio' seems better suited for the purpose.

Signed-off-by: Jassi Brar <jassi.brar@samsung.com>
---
 sound/soc/s3c24xx/s3c-i2s-v2.c   |    2 +-
 sound/soc/s3c24xx/s3c-i2s-v2.h   |    4 +-
 sound/soc/s3c24xx/s3c2412-i2s.c  |    4 +-
 sound/soc/s3c24xx/s3c2443-ac97.c |   10 ++--
 sound/soc/s3c24xx/s3c24xx-i2s.c  |   10 ++--
 sound/soc/s3c24xx/s3c24xx-pcm.c  |   76 +++++++++++++++++++-------------------
 sound/soc/s3c24xx/s3c24xx-pcm.h  |    6 +-
 sound/soc/s3c24xx/s3c64xx-i2s.c  |    4 +-
 8 files changed, 58 insertions(+), 58 deletions(-)

diff --git a/sound/soc/s3c24xx/s3c-i2s-v2.c b/sound/soc/s3c24xx/s3c-i2s-v2.c
index 28b0ab2..9788e65 100644
--- a/sound/soc/s3c24xx/s3c-i2s-v2.c
+++ b/sound/soc/s3c24xx/s3c-i2s-v2.c
@@ -394,7 +394,7 @@ static int s3c2412_i2s_trigger(struct snd_pcm_substream *substream, int cmd,
 	int capture = (substream->stream == SNDRV_PCM_STREAM_CAPTURE);
 	unsigned long irqs;
 	int ret = 0;
-	int channel = ((struct s3c24xx_pcm_dma_params *)
+	int channel = ((struct s3c_audio_dma_params *)
 		  rtd->dai->cpu_dai->dma_data)->channel;
 
 	pr_debug("Entered %s\n", __func__);
diff --git a/sound/soc/s3c24xx/s3c-i2s-v2.h b/sound/soc/s3c24xx/s3c-i2s-v2.h
index f66854a..02e16db 100644
--- a/sound/soc/s3c24xx/s3c-i2s-v2.h
+++ b/sound/soc/s3c24xx/s3c-i2s-v2.h
@@ -49,8 +49,8 @@ struct s3c_i2sv2_info {
 
 	unsigned char	 master;
 
-	struct s3c24xx_pcm_dma_params	*dma_playback;
-	struct s3c24xx_pcm_dma_params	*dma_capture;
+	struct s3c_audio_dma_params	*dma_playback;
+	struct s3c_audio_dma_params	*dma_capture;
 
 	u32		 suspend_iismod;
 	u32		 suspend_iiscon;
diff --git a/sound/soc/s3c24xx/s3c2412-i2s.c b/sound/soc/s3c24xx/s3c2412-i2s.c
index ac5e47b..6bc13d5 100644
--- a/sound/soc/s3c24xx/s3c2412-i2s.c
+++ b/sound/soc/s3c24xx/s3c2412-i2s.c
@@ -50,14 +50,14 @@ static struct s3c2410_dma_client s3c2412_dma_client_in = {
 	.name		= "I2S PCM Stereo in"
 };
 
-static struct s3c24xx_pcm_dma_params s3c2412_i2s_pcm_stereo_out = {
+static struct s3c_audio_dma_params s3c2412_i2s_pcm_stereo_out = {
 	.client		= &s3c2412_dma_client_out,
 	.channel	= DMACH_I2S_OUT,
 	.dma_addr	= S3C2410_PA_IIS + S3C2412_IISTXD,
 	.dma_size	= 4,
 };
 
-static struct s3c24xx_pcm_dma_params s3c2412_i2s_pcm_stereo_in = {
+static struct s3c_audio_dma_params s3c2412_i2s_pcm_stereo_in = {
 	.client		= &s3c2412_dma_client_in,
 	.channel	= DMACH_I2S_IN,
 	.dma_addr	= S3C2410_PA_IIS + S3C2412_IISRXD,
diff --git a/sound/soc/s3c24xx/s3c2443-ac97.c b/sound/soc/s3c24xx/s3c2443-ac97.c
index b25e9f9..d3bd29a 100644
--- a/sound/soc/s3c24xx/s3c2443-ac97.c
+++ b/sound/soc/s3c24xx/s3c2443-ac97.c
@@ -188,21 +188,21 @@ static struct s3c2410_dma_client s3c2443_dma_client_micin = {
 	.name = "AC97 Mic Mono in"
 };
 
-static struct s3c24xx_pcm_dma_params s3c2443_ac97_pcm_stereo_out = {
+static struct s3c_audio_dma_params s3c2443_ac97_pcm_stereo_out = {
 	.client		= &s3c2443_dma_client_out,
 	.channel	= DMACH_PCM_OUT,
 	.dma_addr	= S3C2440_PA_AC97 + S3C_AC97_PCM_DATA,
 	.dma_size	= 4,
 };
 
-static struct s3c24xx_pcm_dma_params s3c2443_ac97_pcm_stereo_in = {
+static struct s3c_audio_dma_params s3c2443_ac97_pcm_stereo_in = {
 	.client		= &s3c2443_dma_client_in,
 	.channel	= DMACH_PCM_IN,
 	.dma_addr	= S3C2440_PA_AC97 + S3C_AC97_PCM_DATA,
 	.dma_size	= 4,
 };
 
-static struct s3c24xx_pcm_dma_params s3c2443_ac97_mic_mono_in = {
+static struct s3c_audio_dma_params s3c2443_ac97_mic_mono_in = {
 	.client		= &s3c2443_dma_client_micin,
 	.channel	= DMACH_MIC_IN,
 	.dma_addr	= S3C2440_PA_AC97 + S3C_AC97_MIC_DATA,
@@ -290,7 +290,7 @@ static int s3c2443_ac97_trigger(struct snd_pcm_substream *substream, int cmd,
 {
 	u32 ac_glbctrl;
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	int channel = ((struct s3c24xx_pcm_dma_params *)
+	int channel = ((struct s3c_audio_dma_params *)
 		  rtd->dai->cpu_dai->dma_data)->channel;
 
 	ac_glbctrl = readl(s3c24xx_ac97.regs + S3C_AC97_GLBCTRL);
@@ -339,7 +339,7 @@ static int s3c2443_ac97_mic_trigger(struct snd_pcm_substream *substream,
 {
 	u32 ac_glbctrl;
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	int channel = ((struct s3c24xx_pcm_dma_params *)
+	int channel = ((struct s3c_audio_dma_params *)
 		  rtd->dai->cpu_dai->dma_data)->channel;
 
 	ac_glbctrl = readl(s3c24xx_ac97.regs + S3C_AC97_GLBCTRL);
diff --git a/sound/soc/s3c24xx/s3c24xx-i2s.c b/sound/soc/s3c24xx/s3c24xx-i2s.c
index c76b8bb..998e752 100644
--- a/sound/soc/s3c24xx/s3c24xx-i2s.c
+++ b/sound/soc/s3c24xx/s3c24xx-i2s.c
@@ -49,14 +49,14 @@ static struct s3c2410_dma_client s3c24xx_dma_client_in = {
 	.name = "I2S PCM Stereo in"
 };
 
-static struct s3c24xx_pcm_dma_params s3c24xx_i2s_pcm_stereo_out = {
+static struct s3c_audio_dma_params s3c24xx_i2s_pcm_stereo_out = {
 	.client		= &s3c24xx_dma_client_out,
 	.channel	= DMACH_I2S_OUT,
 	.dma_addr	= S3C2410_PA_IIS + S3C2410_IISFIFO,
 	.dma_size	= 2,
 };
 
-static struct s3c24xx_pcm_dma_params s3c24xx_i2s_pcm_stereo_in = {
+static struct s3c_audio_dma_params s3c24xx_i2s_pcm_stereo_in = {
 	.client		= &s3c24xx_dma_client_in,
 	.channel	= DMACH_I2S_IN,
 	.dma_addr	= S3C2410_PA_IIS + S3C2410_IISFIFO,
@@ -258,12 +258,12 @@ static int s3c24xx_i2s_hw_params(struct snd_pcm_substream *substream,
 	switch (params_format(params)) {
 	case SNDRV_PCM_FORMAT_S8:
 		iismod &= ~S3C2410_IISMOD_16BIT;
-		((struct s3c24xx_pcm_dma_params *)
+		((struct s3c_audio_dma_params *)
 		  rtd->dai->cpu_dai->dma_data)->dma_size = 1;
 		break;
 	case SNDRV_PCM_FORMAT_S16_LE:
 		iismod |= S3C2410_IISMOD_16BIT;
-		((struct s3c24xx_pcm_dma_params *)
+		((struct s3c_audio_dma_params *)
 		  rtd->dai->cpu_dai->dma_data)->dma_size = 2;
 		break;
 	default:
@@ -280,7 +280,7 @@ static int s3c24xx_i2s_trigger(struct snd_pcm_substream *substream, int cmd,
 {
 	int ret = 0;
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	int channel = ((struct s3c24xx_pcm_dma_params *)
+	int channel = ((struct s3c_audio_dma_params *)
 		  rtd->dai->cpu_dai->dma_data)->channel;
 
 	pr_debug("Entered %s\n", __func__);
diff --git a/sound/soc/s3c24xx/s3c24xx-pcm.c b/sound/soc/s3c24xx/s3c24xx-pcm.c
index 27cf097..ada4bb8 100644
--- a/sound/soc/s3c24xx/s3c24xx-pcm.c
+++ b/sound/soc/s3c24xx/s3c24xx-pcm.c
@@ -32,7 +32,7 @@
 
 #include "s3c24xx-pcm.h"
 
-static const struct snd_pcm_hardware s3c24xx_pcm_hardware = {
+static const struct snd_pcm_hardware s3c_audio_hardware = {
 	.info			= SNDRV_PCM_INFO_INTERLEAVED |
 				    SNDRV_PCM_INFO_BLOCK_TRANSFER |
 				    SNDRV_PCM_INFO_MMAP |
@@ -62,15 +62,15 @@ struct s3c24xx_runtime_data {
 	dma_addr_t dma_start;
 	dma_addr_t dma_pos;
 	dma_addr_t dma_end;
-	struct s3c24xx_pcm_dma_params *params;
+	struct s3c_audio_dma_params *params;
 };
 
-/* s3c24xx_pcm_enqueue
+/* s3c_audio_dma_enqueue
  *
  * place a dma buffer onto the queue for the dma system
  * to handle.
 */
-static void s3c24xx_pcm_enqueue(struct snd_pcm_substream *substream)
+static void s3c_audio_dma_enqueue(struct snd_pcm_substream *substream)
 {
 	struct s3c24xx_runtime_data *prtd = substream->runtime->private_data;
 	dma_addr_t pos = prtd->dma_pos;
@@ -124,19 +124,19 @@ static void s3c24xx_audio_buffdone(struct s3c2410_dma_chan *channel,
 	spin_lock(&prtd->lock);
 	if (prtd->state & ST_RUNNING) {
 		prtd->dma_loaded--;
-		s3c24xx_pcm_enqueue(substream);
+		s3c_audio_dma_enqueue(substream);
 	}
 
 	spin_unlock(&prtd->lock);
 }
 
-static int s3c24xx_pcm_hw_params(struct snd_pcm_substream *substream,
+static int s3c_audio_hw_params(struct snd_pcm_substream *substream,
 	struct snd_pcm_hw_params *params)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct s3c24xx_runtime_data *prtd = runtime->private_data;
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct s3c24xx_pcm_dma_params *dma = rtd->dai->cpu_dai->dma_data;
+	struct s3c_audio_dma_params *dma = rtd->dai->cpu_dai->dma_data;
 	unsigned long totbytes = params_buffer_bytes(params);
 	int ret = 0;
 
@@ -184,7 +184,7 @@ static int s3c24xx_pcm_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-static int s3c24xx_pcm_hw_free(struct snd_pcm_substream *substream)
+static int s3c_audio_hw_free(struct snd_pcm_substream *substream)
 {
 	struct s3c24xx_runtime_data *prtd = substream->runtime->private_data;
 
@@ -201,7 +201,7 @@ static int s3c24xx_pcm_hw_free(struct snd_pcm_substream *substream)
 	return 0;
 }
 
-static int s3c24xx_pcm_prepare(struct snd_pcm_substream *substream)
+static int s3c_audio_prepare(struct snd_pcm_substream *substream)
 {
 	struct s3c24xx_runtime_data *prtd = substream->runtime->private_data;
 	int ret = 0;
@@ -234,12 +234,12 @@ static int s3c24xx_pcm_prepare(struct snd_pcm_substream *substream)
 	prtd->dma_pos = prtd->dma_start;
 
 	/* enqueue dma buffers */
-	s3c24xx_pcm_enqueue(substream);
+	s3c_audio_dma_enqueue(substream);
 
 	return ret;
 }
 
-static int s3c24xx_pcm_trigger(struct snd_pcm_substream *substream, int cmd)
+static int s3c_audio_trigger(struct snd_pcm_substream *substream, int cmd)
 {
 	struct s3c24xx_runtime_data *prtd = substream->runtime->private_data;
 	int ret = 0;
@@ -274,7 +274,7 @@ static int s3c24xx_pcm_trigger(struct snd_pcm_substream *substream, int cmd)
 }
 
 static snd_pcm_uframes_t
-s3c24xx_pcm_pointer(struct snd_pcm_substream *substream)
+s3c_audio_pointer(struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct s3c24xx_runtime_data *prtd = runtime->private_data;
@@ -309,7 +309,7 @@ s3c24xx_pcm_pointer(struct snd_pcm_substream *substream)
 	return bytes_to_frames(substream->runtime, res);
 }
 
-static int s3c24xx_pcm_open(struct snd_pcm_substream *substream)
+static int s3c_audio_open(struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct s3c24xx_runtime_data *prtd;
@@ -317,7 +317,7 @@ static int s3c24xx_pcm_open(struct snd_pcm_substream *substream)
 	pr_debug("Entered %s\n", __func__);
 
 	snd_pcm_hw_constraint_integer(runtime, SNDRV_PCM_HW_PARAM_PERIODS);
-	snd_soc_set_runtime_hwparams(substream, &s3c24xx_pcm_hardware);
+	snd_soc_set_runtime_hwparams(substream, &s3c_audio_hardware);
 
 	prtd = kzalloc(sizeof(struct s3c24xx_runtime_data), GFP_KERNEL);
 	if (prtd == NULL)
@@ -329,7 +329,7 @@ static int s3c24xx_pcm_open(struct snd_pcm_substream *substream)
 	return 0;
 }
 
-static int s3c24xx_pcm_close(struct snd_pcm_substream *substream)
+static int s3c_audio_close(struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct s3c24xx_runtime_data *prtd = runtime->private_data;
@@ -337,14 +337,14 @@ static int s3c24xx_pcm_close(struct snd_pcm_substream *substream)
 	pr_debug("Entered %s\n", __func__);
 
 	if (!prtd)
-		pr_debug("s3c24xx_pcm_close called with prtd == NULL\n");
+		pr_debug("s3c_audio_close called with prtd == NULL\n");
 
 	kfree(prtd);
 
 	return 0;
 }
 
-static int s3c24xx_pcm_mmap(struct snd_pcm_substream *substream,
+static int s3c_audio_mmap(struct snd_pcm_substream *substream,
 	struct vm_area_struct *vma)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
@@ -357,23 +357,23 @@ static int s3c24xx_pcm_mmap(struct snd_pcm_substream *substream,
 				     runtime->dma_bytes);
 }
 
-static struct snd_pcm_ops s3c24xx_pcm_ops = {
-	.open		= s3c24xx_pcm_open,
-	.close		= s3c24xx_pcm_close,
+static struct snd_pcm_ops s3c_audio_ops = {
+	.open		= s3c_audio_open,
+	.close		= s3c_audio_close,
 	.ioctl		= snd_pcm_lib_ioctl,
-	.hw_params	= s3c24xx_pcm_hw_params,
-	.hw_free	= s3c24xx_pcm_hw_free,
-	.prepare	= s3c24xx_pcm_prepare,
-	.trigger	= s3c24xx_pcm_trigger,
-	.pointer	= s3c24xx_pcm_pointer,
-	.mmap		= s3c24xx_pcm_mmap,
+	.hw_params	= s3c_audio_hw_params,
+	.hw_free	= s3c_audio_hw_free,
+	.prepare	= s3c_audio_prepare,
+	.trigger	= s3c_audio_trigger,
+	.pointer	= s3c_audio_pointer,
+	.mmap		= s3c_audio_mmap,
 };
 
-static int s3c24xx_pcm_preallocate_dma_buffer(struct snd_pcm *pcm, int stream)
+static int s3c_audio_preallocate_dma_buffer(struct snd_pcm *pcm, int stream)
 {
 	struct snd_pcm_substream *substream = pcm->streams[stream].substream;
 	struct snd_dma_buffer *buf = &substream->dma_buffer;
-	size_t size = s3c24xx_pcm_hardware.buffer_bytes_max;
+	size_t size = s3c_audio_hardware.buffer_bytes_max;
 
 	pr_debug("Entered %s\n", __func__);
 
@@ -388,7 +388,7 @@ static int s3c24xx_pcm_preallocate_dma_buffer(struct snd_pcm *pcm, int stream)
 	return 0;
 }
 
-static void s3c24xx_pcm_free_dma_buffers(struct snd_pcm *pcm)
+static void s3c_audio_free_dma_buffers(struct snd_pcm *pcm)
 {
 	struct snd_pcm_substream *substream;
 	struct snd_dma_buffer *buf;
@@ -411,9 +411,9 @@ static void s3c24xx_pcm_free_dma_buffers(struct snd_pcm *pcm)
 	}
 }
 
-static u64 s3c24xx_pcm_dmamask = DMA_BIT_MASK(32);
+static u64 s3c_audio_dmamask = DMA_BIT_MASK(32);
 
-static int s3c24xx_pcm_new(struct snd_card *card,
+static int s3c_audio_new(struct snd_card *card,
 	struct snd_soc_dai *dai, struct snd_pcm *pcm)
 {
 	int ret = 0;
@@ -421,19 +421,19 @@ static int s3c24xx_pcm_new(struct snd_card *card,
 	pr_debug("Entered %s\n", __func__);
 
 	if (!card->dev->dma_mask)
-		card->dev->dma_mask = &s3c24xx_pcm_dmamask;
+		card->dev->dma_mask = &s3c_audio_dmamask;
 	if (!card->dev->coherent_dma_mask)
 		card->dev->coherent_dma_mask = 0xffffffff;
 
 	if (dai->playback.channels_min) {
-		ret = s3c24xx_pcm_preallocate_dma_buffer(pcm,
+		ret = s3c_audio_preallocate_dma_buffer(pcm,
 			SNDRV_PCM_STREAM_PLAYBACK);
 		if (ret)
 			goto out;
 	}
 
 	if (dai->capture.channels_min) {
-		ret = s3c24xx_pcm_preallocate_dma_buffer(pcm,
+		ret = s3c_audio_preallocate_dma_buffer(pcm,
 			SNDRV_PCM_STREAM_CAPTURE);
 		if (ret)
 			goto out;
@@ -444,9 +444,9 @@ static int s3c24xx_pcm_new(struct snd_card *card,
 
 struct snd_soc_platform s3c24xx_soc_platform = {
 	.name		= "s3c24xx-audio",
-	.pcm_ops 	= &s3c24xx_pcm_ops,
-	.pcm_new	= s3c24xx_pcm_new,
-	.pcm_free	= s3c24xx_pcm_free_dma_buffers,
+	.pcm_ops 	= &s3c_audio_ops,
+	.pcm_new	= s3c_audio_new,
+	.pcm_free	= s3c_audio_free_dma_buffers,
 };
 EXPORT_SYMBOL_GPL(s3c24xx_soc_platform);
 
@@ -463,5 +463,5 @@ static void __exit s3c24xx_soc_platform_exit(void)
 module_exit(s3c24xx_soc_platform_exit);
 
 MODULE_AUTHOR("Ben Dooks, <ben@simtec.co.uk>");
-MODULE_DESCRIPTION("Samsung S3C24XX PCM DMA module");
+MODULE_DESCRIPTION("Samsung S3C Audio DMA module");
 MODULE_LICENSE("GPL");
diff --git a/sound/soc/s3c24xx/s3c24xx-pcm.h b/sound/soc/s3c24xx/s3c24xx-pcm.h
index 0088c79..d04ddf8 100644
--- a/sound/soc/s3c24xx/s3c24xx-pcm.h
+++ b/sound/soc/s3c24xx/s3c24xx-pcm.h
@@ -9,13 +9,13 @@
  *  ALSA PCM interface for the Samsung S3C24xx CPU
  */
 
-#ifndef _S3C24XX_PCM_H
-#define _S3C24XX_PCM_H
+#ifndef _S3C_AUDIO_H
+#define _S3C_AUDIO_H
 
 #define ST_RUNNING		(1<<0)
 #define ST_OPENED		(1<<1)
 
-struct s3c24xx_pcm_dma_params {
+struct s3c_audio_dma_params {
 	struct s3c2410_dma_client *client;	/* stream identifier */
 	int channel;				/* Channel ID */
 	dma_addr_t dma_addr;
diff --git a/sound/soc/s3c24xx/s3c64xx-i2s.c b/sound/soc/s3c24xx/s3c64xx-i2s.c
index b67eed5..03f5a6b 100644
--- a/sound/soc/s3c24xx/s3c64xx-i2s.c
+++ b/sound/soc/s3c24xx/s3c64xx-i2s.c
@@ -46,7 +46,7 @@ static struct s3c2410_dma_client s3c64xx_dma_client_in = {
 	.name		= "I2S PCM Stereo in"
 };
 
-static struct s3c24xx_pcm_dma_params s3c64xx_i2s_pcm_stereo_out[2] = {
+static struct s3c_audio_dma_params s3c64xx_i2s_pcm_stereo_out[2] = {
 	[0] = {
 		.channel	= DMACH_I2S0_OUT,
 		.client		= &s3c64xx_dma_client_out,
@@ -61,7 +61,7 @@ static struct s3c24xx_pcm_dma_params s3c64xx_i2s_pcm_stereo_out[2] = {
 	},
 };
 
-static struct s3c24xx_pcm_dma_params s3c64xx_i2s_pcm_stereo_in[2] = {
+static struct s3c_audio_dma_params s3c64xx_i2s_pcm_stereo_in[2] = {
 	[0] = {
 		.channel	= DMACH_I2S0_IN,
 		.client		= &s3c64xx_dma_client_in,
-- 
1.6.2.5
