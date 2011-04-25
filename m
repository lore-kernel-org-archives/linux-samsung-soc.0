From: Sangbeom Kim <sbkim73@samsung.com>
Subject: [PATCH 2/2] ASoC: SAMSUNG: Add WM8994 PCM Machine driver
Date: Mon, 25 Apr 2011 15:54:31 +0900
Message-ID: <1303714472-2391-2-git-send-email-sbkim73@samsung.com>
References: <1303714472-2391-1-git-send-email-sbkim73@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:51012 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756564Ab1DYH31 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 25 Apr 2011 03:29:27 -0400
In-Reply-To: <1303714472-2391-1-git-send-email-sbkim73@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org
Cc: jassisinghbrar@gmail.com, lrg@slimlogic.co.uk, broonie@opensource.wolfsonmicro.com, kgene.kim@samsung.com, Sangbeom Kim <sbkim73@samsung.com>

This patch add WM8994 PCM machine driver to support PCM audio
on SMDKV310, SMDKC210 boards.
Playback and Capture supports 8kHz sampling rates.
and It is tested on SMDKV310, SMDKC210.

Signed-off-by: Sangbeom Kim <sbkim73@samsung.com>
---
 sound/soc/samsung/Kconfig          |    8 ++
 sound/soc/samsung/Makefile         |    2 +
 sound/soc/samsung/smdk_wm8994pcm.c |  175 ++++++++++++++++++++++++++++++++++++
 3 files changed, 185 insertions(+), 0 deletions(-)
 create mode 100644 sound/soc/samsung/smdk_wm8994pcm.c

diff --git a/sound/soc/samsung/Kconfig b/sound/soc/samsung/Kconfig
index b8c7a2e..db2bc49 100644
--- a/sound/soc/samsung/Kconfig
+++ b/sound/soc/samsung/Kconfig
@@ -170,3 +170,11 @@ config SND_SOC_SMDK_WM8580_PCM
 	select SND_SAMSUNG_PCM
 	help
 	  Say Y if you want to add support for SoC audio on the SMDK.
+
+config SND_SOC_SMDK_WM8994_PCM
+	tristate "SoC PCM Audio support for WM8994 on SMDK"
+	depends on SND_SOC_SAMSUNG && (MACH_SMDKC210 || MACH_SMDKV310)
+	select SND_SOC_WM8994
+	select SND_SAMSUNG_PCM
+	help
+	  Say Y if you want to add support for SoC audio on the SMDK.
diff --git a/sound/soc/samsung/Makefile b/sound/soc/samsung/Makefile
index 6c598fc..4a3a428 100644
--- a/sound/soc/samsung/Makefile
+++ b/sound/soc/samsung/Makefile
@@ -35,6 +35,7 @@ snd-soc-s3c64xx-smartq-wm8987-objs := smartq_wm8987.o
 snd-soc-goni-wm8994-objs := goni_wm8994.o
 snd-soc-smdk-spdif-objs := smdk_spdif.o
 snd-soc-smdk-wm8580pcm-objs := smdk_wm8580pcm.o
+snd-soc-smdk-wm8994pcm-objs := smdk_wm8994pcm.o
 
 obj-$(CONFIG_SND_SOC_SAMSUNG_JIVE_WM8750) += snd-soc-jive-wm8750.o
 obj-$(CONFIG_SND_SOC_SAMSUNG_NEO1973_WM8753) += snd-soc-neo1973-wm8753.o
@@ -53,3 +54,4 @@ obj-$(CONFIG_SND_SOC_SMARTQ) += snd-soc-s3c64xx-smartq-wm8987.o
 obj-$(CONFIG_SND_SOC_SAMSUNG_SMDK_SPDIF) += snd-soc-smdk-spdif.o
 obj-$(CONFIG_SND_SOC_GONI_AQUILA_WM8994) += snd-soc-goni-wm8994.o
 obj-$(CONFIG_SND_SOC_SMDK_WM8580_PCM) += snd-soc-smdk-wm8580pcm.o
+obj-$(CONFIG_SND_SOC_SMDK_WM8994_PCM) += snd-soc-smdk-wm8994pcm.o
diff --git a/sound/soc/samsung/smdk_wm8994pcm.c b/sound/soc/samsung/smdk_wm8994pcm.c
new file mode 100644
index 0000000..756c228
--- /dev/null
+++ b/sound/soc/samsung/smdk_wm8994pcm.c
@@ -0,0 +1,175 @@
+/*
+ *  sound/soc/samsung/smdk_wm8994pcm.c
+ *
+ *  Copyright (c) 2011 Samsung Electronics Co. Ltd
+ *
+ *  This program is free software; you can redistribute  it and/or  modify it
+ *  under  the terms of  the GNU General  Public License as published by the
+ *  Free Software Foundation;  either version 2 of the  License, or (at your
+ *  option) any later version.
+ */
+#include <sound/soc.h>
+#include <sound/pcm.h>
+#include <sound/pcm_params.h>
+
+#include "../codecs/wm8994.h"
+#include "dma.h"
+#include "pcm.h"
+
+/*
+ * Board Settings:
+ *  o '1' means 'ON'
+ *  o '0' means 'OFF'
+ *  o 'X' means 'Don't care'
+ *
+ * SMDKC210, SMDKV310: CFG3- 1001, CFG5-1000, CFG7-111111
+ */
+
+/*
+ * Configure audio route as :-
+ * $ amixer sset 'DAC1' on,on
+ * $ amixer sset 'Right Headphone Mux' 'DAC'
+ * $ amixer sset 'Left Headphone Mux' 'DAC'
+ * $ amixer sset 'DAC1R Mixer AIF1.1' on
+ * $ amixer sset 'DAC1L Mixer AIF1.1' on
+ * $ amixer sset 'IN2L' on
+ * $ amixer sset 'IN2L PGA IN2LN' on
+ * $ amixer sset 'MIXINL IN2L' on
+ * $ amixer sset 'AIF1ADC1L Mixer ADC/DMIC' on
+ * $ amixer sset 'IN2R' on
+ * $ amixer sset 'IN2R PGA IN2RN' on
+ * $ amixer sset 'MIXINR IN2R' on
+ * $ amixer sset 'AIF1ADC1R Mixer ADC/DMIC' on
+ */
+
+/* SMDK has a 16.9344MHZ crystal attached to WM8994 */
+#define SMDK_WM8994_FREQ 16934400
+
+static int smdk_wm8994_pcm_hw_params(struct snd_pcm_substream *substream,
+			      struct snd_pcm_hw_params *params)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_dai *codec_dai = rtd->codec_dai;
+	struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
+	unsigned long mclk_freq;
+	int rfs, ret;
+
+	switch(params_rate(params)) {
+	case 8000:
+		rfs = 512;
+		break;
+	default:
+		printk(KERN_ERR "%s:%d Sampling Rate %u not supported!\n",
+		__func__, __LINE__, params_rate(params));
+		return -EINVAL;
+	}
+
+	mclk_freq = params_rate(params) * rfs;
+
+	/* Set the codec DAI configuration */
+	ret = snd_soc_dai_set_fmt(codec_dai, SND_SOC_DAIFMT_DSP_B
+				| SND_SOC_DAIFMT_IB_NF
+				| SND_SOC_DAIFMT_CBS_CFS);
+	if (ret < 0)
+		return ret;
+
+	/* Set the cpu DAI configuration */
+	ret = snd_soc_dai_set_fmt(cpu_dai, SND_SOC_DAIFMT_DSP_B
+				| SND_SOC_DAIFMT_IB_NF
+				| SND_SOC_DAIFMT_CBS_CFS);
+	if (ret < 0)
+		return ret;
+
+	ret = snd_soc_dai_set_sysclk(codec_dai, WM8994_SYSCLK_FLL1,
+					mclk_freq, SND_SOC_CLOCK_IN);
+	if (ret < 0)
+		return ret;
+
+	ret = snd_soc_dai_set_pll(codec_dai, WM8994_FLL1, WM8994_FLL_SRC_MCLK1,
+					SMDK_WM8994_FREQ, mclk_freq);
+	if (ret < 0)
+		return ret;
+
+	/* Set PCM source clock on CPU */
+	ret = snd_soc_dai_set_sysclk(cpu_dai, S3C_PCM_CLKSRC_MUX,
+					mclk_freq, SND_SOC_CLOCK_IN);
+	if (ret < 0)
+		return ret;
+
+	/* Set SCLK_DIV for making bclk */
+	ret = snd_soc_dai_set_clkdiv(cpu_dai, S3C_PCM_SCLK_PER_FS, rfs);
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
+static struct snd_soc_ops smdk_wm8994_pcm_ops = {
+	.hw_params = smdk_wm8994_pcm_hw_params,
+};
+
+static struct snd_soc_dai_link smdk_dai[] = {
+	{
+		.name = "WM8994 PAIF PCM",
+		.stream_name = "Primary PCM",
+		.cpu_dai_name = "samsung-pcm.0",
+		.codec_dai_name = "wm8994-aif1",
+		.platform_name = "samsung-audio",
+		.codec_name = "wm8994-codec",
+		.ops = &smdk_wm8994_pcm_ops,
+	},
+};
+
+static struct snd_soc_card smdk_pcm = {
+	.name = "SMDK-PCM",
+	.dai_link = smdk_dai,
+	.num_links = 1,
+};
+
+static int __devinit snd_smdk_probe(struct platform_device *pdev)
+{
+	int ret = 0;
+
+	smdk_pcm.dev = &pdev->dev;
+	ret = snd_soc_register_card(&smdk_pcm);
+	if (ret) {
+		dev_err(&pdev->dev, "snd_soc_register_card failed %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int __devexit snd_smdk_remove(struct platform_device *pdev)
+{
+	snd_soc_unregister_card(&smdk_pcm);
+	platform_set_drvdata(pdev, NULL);
+	return 0;
+}
+
+static struct platform_driver snd_smdk_driver = {
+	.driver = {
+		.owner = THIS_MODULE,
+		.name = "samsung-smdk-pcm",
+	},
+	.probe = snd_smdk_probe,
+	.remove = __devexit_p(snd_smdk_remove),
+};
+
+static int __init smdk_audio_init(void)
+{
+	return platform_driver_register(&snd_smdk_driver);
+}
+
+module_init(smdk_audio_init);
+
+static void __exit smdk_audio_exit(void)
+{
+	platform_driver_unregister(&snd_smdk_driver);
+}
+
+module_exit(smdk_audio_exit);
+
+MODULE_AUTHOR("Sangbeom Kim, <sbkim73@samsung.com>");
+MODULE_DESCRIPTION("ALSA SoC SMDK WM8994 for PCM");
+MODULE_LICENSE("GPL");
-- 
1.7.1
