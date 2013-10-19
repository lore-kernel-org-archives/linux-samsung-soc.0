From: Mark Brown <broonie@kernel.org>
Subject: [PATCH 3/3] ASoC: samsung: Use ASoC dmaengine code where possible
Date: Sat, 19 Oct 2013 17:43:52 +0100
Message-ID: <1382201032-13538-3-git-send-email-broonie@kernel.org>
References: <1382201032-13538-1-git-send-email-broonie@kernel.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:54709 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752998Ab3JSQoL (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 19 Oct 2013 12:44:11 -0400
In-Reply-To: <1382201032-13538-1-git-send-email-broonie@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Lars-Peter Clausen <lars@metafoo.de>, Kukjin Kim <kgene.kim@samsung.com>, Sangbeom Kim <sbkim73@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Tomasz Figa <t.figa@samsung.com>
Cc: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, linaro-kernel@lists.linaro.org, Mark Brown <broonie@linaro.org>

From: Mark Brown <broonie@linaro.org>

Since all Exynos platforms have been converted to dmaengine and many of
the older platforms are in the process of conversion they do not need to
use the legacy s3c-dma APIs for DMA but can instead use the standard ASoC
dmaengine helpers. This both allows them to benefit from improvements
implemented in the generic code and supports multiplatform.

Signed-off-by: Mark Brown <broonie@linaro.org>
---

This uses the patches I've posted over the weekend and Lars-Peter's
changes to support querying DMA capabilities from the driver is
currently failing for me on s3c64xx where the DMA controller reports an
error immediately and fails to transfer anything, I'm going to
investigate that but that shouldn't be an issue for mainline yet since
the patches converting to Tomasz haven't landed yet s3c64xx is still
using s3c-dma there.

 sound/soc/samsung/Kconfig     |  9 +++++
 sound/soc/samsung/Makefile    |  6 ++--
 sound/soc/samsung/dma.h       |  3 ++
 sound/soc/samsung/dmaengine.c | 83 +++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 99 insertions(+), 2 deletions(-)
 create mode 100644 sound/soc/samsung/dmaengine.c

diff --git a/sound/soc/samsung/Kconfig b/sound/soc/samsung/Kconfig
index 54d083c..f53b4c3 100644
--- a/sound/soc/samsung/Kconfig
+++ b/sound/soc/samsung/Kconfig
@@ -3,11 +3,20 @@ config SND_SOC_SAMSUNG
 	depends on PLAT_SAMSUNG || COMPILE_TEST
 	select S3C64XX_PL080 if ARCH_S3C64XX
 	select S3C2410_DMA if ARCH_S3C24XX
+	select SND_S3C_DMA if !(ARCH_S3C24XX || ARCH_S3C64XX)
+	select SND_S3C_DMA_LEGACY if ARCH_S3C24XX || ARCH_S3C64XX
+	select SND_SOC_GENERIC_DMAENGINE_PCM if !(ARCH_S3C24XX || ARCH_S3C64XX)
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
index 709f605..86715d8 100644
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
index fb09a1c..225e537 100644
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
index 0000000..07d2526
--- /dev/null
+++ b/sound/soc/samsung/dmaengine.c
@@ -0,0 +1,83 @@
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
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA
+ * 02110-1301 USA
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
+	}
+	if (capture) {
+		capture_data = &capture->dma_data;
+		capture_data->filter_data = (void *)capture->channel;
+		capture_data->chan_name = capture->ch_name;
+	}
+
+	snd_soc_dai_init_dma_data(dai, playback_data, capture_data);
+}
+EXPORT_SYMBOL_GPL(samsung_asoc_init_dma_data);
+
+int samsung_asoc_dma_platform_register(struct device *dev)
+{
+	return snd_dmaengine_pcm_register(dev, &samsung_dmaengine_pcm_config,
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
-- 
1.8.4.rc3
