From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH 7/7] ASoC: samsung: Remove unused now unused struct
 s3c_dma_params
Date: Thu, 04 Aug 2016 11:30:32 +0200
Message-ID: <1470303032-14582-8-git-send-email-s.nawrocki@samsung.com>
References: <1470303032-14582-1-git-send-email-s.nawrocki@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:59617 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933317AbcHDJbg (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 4 Aug 2016 05:31:36 -0400
Received: from epcpsbgm1new.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OBD00V68P3HE550@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 04 Aug 2016 18:31:08 +0900 (KST)
In-reply-to: <1470303032-14582-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: broonie@kernel.org
Cc: alsa-devel@alsa-project.org, b.zolnierkie@samsung.com, linux-samsung-soc@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>

There is no user of this data structure now, all users have been converted
to use struct snd_dmaengine_dai_dma_data instead.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 sound/soc/samsung/dma.h            | 20 +++-----------------
 sound/soc/samsung/dmaengine.c      | 31 -------------------------------
 sound/soc/samsung/idma.c           |  1 -
 sound/soc/samsung/s3c-i2s-v2.c     |  1 -
 sound/soc/samsung/smdk_wm8580pcm.c |  1 -
 sound/soc/samsung/smdk_wm8994pcm.c |  1 -
 6 files changed, 3 insertions(+), 52 deletions(-)

diff --git a/sound/soc/samsung/dma.h b/sound/soc/samsung/dma.h
index 3830f29..7ae580d 100644
--- a/sound/soc/samsung/dma.h
+++ b/sound/soc/samsung/dma.h
@@ -1,6 +1,4 @@
 /*
- *  dma.h --
- *
  *  This program is free software; you can redistribute  it and/or modify it
  *  under  the terms of  the GNU General  Public License as published by the
  *  Free Software Foundation;  either version 2 of the  License, or (at your
@@ -9,27 +7,15 @@
  *  ALSA PCM interface for the Samsung SoC
  */
 
-#ifndef _S3C_AUDIO_H
-#define _S3C_AUDIO_H
+#ifndef _SAMSUNG_DMA_H
+#define _SAMSUNG_DMA_H
 
 #include <sound/dmaengine_pcm.h>
-#include <linux/dmaengine.h>
-
-struct s3c_dma_params {
-	void *slave;				/* Channel ID */
-	dma_addr_t dma_addr;
-	int dma_size;			/* Size of the DMA transfer */
-	char *ch_name;
-	struct snd_dmaengine_dai_dma_data dma_data;
-};
 
-void samsung_asoc_init_dma_data(struct snd_soc_dai *dai,
-				struct s3c_dma_params *playback,
-				struct s3c_dma_params *capture);
 /*
  * @tx, @rx arguments can be NULL if the DMA channel names are "tx", "rx",
  * otherwise actual DMA channel names must be passed to this function.
  */
 int samsung_asoc_dma_platform_register(struct device *dev, dma_filter_fn filter,
 				       const char *tx, const char *rx);
-#endif
+#endif /* _SAMSUNG_DMA_H */
diff --git a/sound/soc/samsung/dmaengine.c b/sound/soc/samsung/dmaengine.c
index 2c87f38..9104c98 100644
--- a/sound/soc/samsung/dmaengine.c
+++ b/sound/soc/samsung/dmaengine.c
@@ -16,49 +16,18 @@
  */
 
 #include <linux/module.h>
-#include <linux/amba/pl08x.h>
-#include <linux/platform_data/dma-s3c24xx.h>
-
 #include <sound/core.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
 #include <sound/dmaengine_pcm.h>
 #include <sound/soc.h>
-#include <sound/soc-dai.h>
 
 #include "dma.h"
 
-void samsung_asoc_init_dma_data(struct snd_soc_dai *dai,
-				struct s3c_dma_params *playback,
-				struct s3c_dma_params *capture)
-{
-	struct snd_dmaengine_dai_dma_data *playback_data = NULL;
-	struct snd_dmaengine_dai_dma_data *capture_data = NULL;
-
-	if (playback) {
-		playback_data = &playback->dma_data;
-		playback_data->filter_data = playback->slave;
-		playback_data->chan_name = playback->ch_name;
-		playback_data->addr = playback->dma_addr;
-		playback_data->addr_width = playback->dma_size;
-	}
-	if (capture) {
-		capture_data = &capture->dma_data;
-		capture_data->filter_data = capture->slave;
-		capture_data->chan_name = capture->ch_name;
-		capture_data->addr = capture->dma_addr;
-		capture_data->addr_width = capture->dma_size;
-	}
-
-	snd_soc_dai_init_dma_data(dai, playback_data, capture_data);
-}
-EXPORT_SYMBOL_GPL(samsung_asoc_init_dma_data);
-
 int samsung_asoc_dma_platform_register(struct device *dev, dma_filter_fn filter,
 				       const char *tx, const char *rx)
 {
 	unsigned int flags = SND_DMAENGINE_PCM_FLAG_COMPAT;
-
 	struct snd_dmaengine_pcm_config *pcm_conf;
 
 	pcm_conf = devm_kzalloc(dev, sizeof(*pcm_conf), GFP_KERNEL);
diff --git a/sound/soc/samsung/idma.c b/sound/soc/samsung/idma.c
index 4ed29ff..3e40815 100644
--- a/sound/soc/samsung/idma.c
+++ b/sound/soc/samsung/idma.c
@@ -22,7 +22,6 @@
 
 #include "i2s.h"
 #include "idma.h"
-#include "dma.h"
 #include "i2s-regs.h"
 
 #define ST_RUNNING		(1<<0)
diff --git a/sound/soc/samsung/s3c-i2s-v2.c b/sound/soc/samsung/s3c-i2s-v2.c
index 74a7f4b..644f186 100644
--- a/sound/soc/samsung/s3c-i2s-v2.c
+++ b/sound/soc/samsung/s3c-i2s-v2.c
@@ -24,7 +24,6 @@
 
 #include "regs-i2s-v2.h"
 #include "s3c-i2s-v2.h"
-#include "dma.h"
 
 #undef S3C_IIS_V2_SUPPORTED
 
diff --git a/sound/soc/samsung/smdk_wm8580pcm.c b/sound/soc/samsung/smdk_wm8580pcm.c
index 6deec52..a6d2233 100644
--- a/sound/soc/samsung/smdk_wm8580pcm.c
+++ b/sound/soc/samsung/smdk_wm8580pcm.c
@@ -16,7 +16,6 @@
 #include <asm/mach-types.h>
 
 #include "../codecs/wm8580.h"
-#include "dma.h"
 #include "pcm.h"
 
 /*
diff --git a/sound/soc/samsung/smdk_wm8994pcm.c b/sound/soc/samsung/smdk_wm8994pcm.c
index b1c89ec..2e62149 100644
--- a/sound/soc/samsung/smdk_wm8994pcm.c
+++ b/sound/soc/samsung/smdk_wm8994pcm.c
@@ -15,7 +15,6 @@
 #include <sound/pcm_params.h>
 
 #include "../codecs/wm8994.h"
-#include "dma.h"
 #include "pcm.h"
 
 /*
-- 
1.9.1
