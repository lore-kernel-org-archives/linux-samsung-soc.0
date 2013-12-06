From: Mark Brown <broonie@kernel.org>
Subject: [PATCH 2/2] ASoC: samsung: Use ASoC dmaengine code where possible
Date: Fri,  6 Dec 2013 12:57:22 +0000
Message-ID: <1386334642-8362-2-git-send-email-broonie@kernel.org>
References: <1386334642-8362-1-git-send-email-broonie@kernel.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:38101 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753588Ab3LFM5t (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 6 Dec 2013 07:57:49 -0500
In-Reply-To: <1386334642-8362-1-git-send-email-broonie@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Padmavathi Venna <padma.v@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, alsa-devel@alsa-project.org, linaro-kernel@lists.linaro.org, Mark Brown <broonie@linaro.org>

From: Mark Brown <broonie@linaro.org>

Since all Exynos platforms have been converted to dmaengine and many of
the older platforms are in the process of conversion they do not need to
use the legacy s3c-dma APIs for DMA but can instead use the standard ASoC
dmaengine helpers. This both allows them to benefit from improvements
implemented in the generic code and supports multiplatform.

This patch includes some fixes from Padma for Exynos SoCs.

Signed-off-by: Mark Brown <broonie@linaro.org>
Tested By: Padmavathi Venna <padma.v@samsung.com>
---
 sound/soc/samsung/Kconfig     | 13 +++++--
 sound/soc/samsung/Makefile    |  6 ++--
 sound/soc/samsung/dma.h       |  3 ++
 sound/soc/samsung/dmaengine.c | 84 +++++++++++++++++++++++++++++++++++++++++++
 sound/soc/samsung/i2s.c       |  2 ++
 5 files changed, 104 insertions(+), 4 deletions(-)
 create mode 100644 sound/soc/samsung/dmaengine.c

diff --git a/sound/soc/samsung/Kconfig b/sound/soc/samsung/Kconfig
index 37459dfd168d..27930fc432dc 100644
--- a/sound/soc/samsung/Kconfig
+++ b/sound/soc/samsung/Kconfig
@@ -1,13 +1,22 @@
 config SND_SOC_SAMSUNG
 	tristate "ASoC support for Samsung"
 	depends on PLAT_SAMSUNG
-	select S3C64XX_DMA if ARCH_S3C64XX
-	select S3C24XX_DMA if ARCH_S3C24XX
+	select S3C2410_DMA if ARCH_S3C24XX
+	select S3C64XX_PL080 if ARCH_S3C64XX
+	select SND_S3C_DMA if !ARCH_S3C24XX
+	select SND_S3C_DMA_LEGACY if ARCH_S3C24XX
+	select SND_SOC_GENERIC_DMAENGINE_PCM if !ARCH_S3C24XX
 	help
 	  Say Y or M if you want to add support for codecs attached to
 	  the Samsung SoCs' Audio interfaces. You will also need to
 	  select the audio interfaces to support below.
 
+config SND_S3C_DMA
+	tristate
+
+config SND_S3C_DMA_LEGACY
+	tristate
+
 config SND_S3C24XX_I2S
 	tristate
 	select S3C2410_DMA
diff --git a/sound/soc/samsung/Makefile b/sound/soc/samsung/Makefile
index 709f6059ad67..86715d8efee6 100644
--- a/sound/soc/samsung/Makefile
+++ b/sound/soc/samsung/Makefile
@@ -1,5 +1,6 @@
 # S3c24XX Platform Support
-snd-soc-s3c24xx-objs := dma.o
+snd-soc-s3c-dma-objs := dmaengine.o
+snd-soc-s3c-dma-legacy-objs := dma.o
 snd-soc-idma-objs := idma.o
 snd-soc-s3c24xx-i2s-objs := s3c24xx-i2s.o
 snd-soc-s3c2412-i2s-objs := s3c2412-i2s.o
@@ -9,7 +10,8 @@ snd-soc-samsung-spdif-objs := spdif.o
 snd-soc-pcm-objs := pcm.o
 snd-soc-i2s-objs := i2s.o
 
-obj-$(CONFIG_SND_SOC_SAMSUNG) += snd-soc-s3c24xx.o
+obj-$(CONFIG_SND_S3C_DMA) += snd-soc-s3c-dma.o
+obj-$(CONFIG_SND_S3C_DMA_LEGACY) += snd-soc-s3c-dma-legacy.o
 obj-$(CONFIG_SND_S3C24XX_I2S) += snd-soc-s3c24xx-i2s.o
 obj-$(CONFIG_SND_SAMSUNG_AC97) += snd-soc-ac97.o
 obj-$(CONFIG_SND_S3C2412_SOC_I2S) += snd-soc-s3c2412-i2s.o
diff --git a/sound/soc/samsung/dma.h b/sound/soc/samsung/dma.h
index fb09a1c5f75b..225e5378014e 100644
--- a/sound/soc/samsung/dma.h
+++ b/sound/soc/samsung/dma.h
@@ -12,6 +12,8 @@
 #ifndef _S3C_AUDIO_H
 #define _S3C_AUDIO_H
 
+#include <sound/dmaengine_pcm.h>
+
 struct s3c_dma_params {
 	struct s3c2410_dma_client *client;	/* stream identifier */
 	int channel;				/* Channel ID */
@@ -20,6 +22,7 @@ struct s3c_dma_params {
 	unsigned ch;
 	struct samsung_dma_ops *ops;
 	char *ch_name;
+	struct snd_dmaengine_dai_dma_data dma_data;
 };
 
 void samsung_asoc_init_dma_data(struct snd_soc_dai *dai,
diff --git a/sound/soc/samsung/dmaengine.c b/sound/soc/samsung/dmaengine.c
new file mode 100644
index 000000000000..3be479d51b9b
--- /dev/null
+++ b/sound/soc/samsung/dmaengine.c
@@ -0,0 +1,84 @@
+/*
+ * dmaengine.c - Samsung dmaengine wrapper
+ *
+ * Author: Mark Brown <broonie@linaro.org>
+ * Copyright 2013 Linaro
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License
+ * version 2 as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful, but
+ * WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * General Public License for more details.
+ *
+ */
+
+#include <linux/module.h>
+#include <linux/amba/pl08x.h>
+
+#include <sound/core.h>
+#include <sound/pcm.h>
+#include <sound/pcm_params.h>
+#include <sound/dmaengine_pcm.h>
+#include <sound/soc.h>
+#include <sound/soc-dai.h>
+
+#include "dma.h"
+
+#ifdef CONFIG_ARCH_S3C64XX
+#define filter_fn pl08x_filter_id
+#else
+#define filter_fn NULL
+#endif
+
+static const struct snd_dmaengine_pcm_config samsung_dmaengine_pcm_config = {
+	.prepare_slave_config = snd_dmaengine_pcm_prepare_slave_config,
+	.compat_filter_fn = filter_fn,
+};
+
+void samsung_asoc_init_dma_data(struct snd_soc_dai *dai,
+				struct s3c_dma_params *playback,
+				struct s3c_dma_params *capture)
+{
+	struct snd_dmaengine_dai_dma_data *playback_data = NULL;
+	struct snd_dmaengine_dai_dma_data *capture_data = NULL;
+
+	if (playback) {
+		playback_data = &playback->dma_data;
+		playback_data->filter_data = (void *)playback->channel;
+		playback_data->chan_name = playback->ch_name;
+		playback_data->addr = playback->dma_addr;
+		playback_data->addr_width = playback->dma_size;
+	}
+	if (capture) {
+		capture_data = &capture->dma_data;
+		capture_data->filter_data = (void *)capture->channel;
+		capture_data->chan_name = capture->ch_name;
+		capture_data->addr = capture->dma_addr;
+		capture_data->addr_width = capture->dma_size;
+	}
+
+	snd_soc_dai_init_dma_data(dai, playback_data, capture_data);
+}
+EXPORT_SYMBOL_GPL(samsung_asoc_init_dma_data);
+
+int samsung_asoc_dma_platform_register(struct device *dev)
+{
+	return snd_dmaengine_pcm_register(dev, &samsung_dmaengine_pcm_config,
+					  SND_DMAENGINE_PCM_FLAG_CUSTOM_CHANNEL_NAME |
+					  SND_DMAENGINE_PCM_FLAG_NO_RESIDUE |
+					  SND_DMAENGINE_PCM_FLAG_COMPAT);
+}
+EXPORT_SYMBOL_GPL(samsung_asoc_dma_platform_register);
+
+void samsung_asoc_dma_platform_unregister(struct device *dev)
+{
+	return snd_dmaengine_pcm_unregister(dev);
+}
+EXPORT_SYMBOL_GPL(samsung_asoc_dma_platform_unregister);
+
+MODULE_AUTHOR("Mark Brown <broonie@linaro.org>");
+MODULE_DESCRIPTION("Samsung dmaengine ASoC driver");
+MODULE_LICENSE("GPL");
diff --git a/sound/soc/samsung/i2s.c b/sound/soc/samsung/i2s.c
index eab0050d4579..92f64363427d 100644
--- a/sound/soc/samsung/i2s.c
+++ b/sound/soc/samsung/i2s.c
@@ -702,6 +702,8 @@ static int i2s_hw_params(struct snd_pcm_substream *substream,
 	}
 	writel(mod, i2s->addr + I2SMOD);
 
+	samsung_asoc_init_dma_data(dai, &i2s->dma_playback, &i2s->dma_capture);
+
 	i2s->frmclk = params_rate(params);
 
 	return 0;
-- 
1.8.5.1
