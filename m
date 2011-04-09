From: Sangbeom Kim <sbkim73@samsung.com>
Subject: [PATCH 3/3] ASoC: SAMSUNG: Add WM8580 PCM Machine driver
Date: Sat,  9 Apr 2011 10:57:59 +0900
Message-ID: <1302314281-11466-2-git-send-email-sbkim73@samsung.com>
References: <1302314281-11466-1-git-send-email-sbkim73@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:34960 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752192Ab1DIC36 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 8 Apr 2011 22:29:58 -0400
In-Reply-To: <1302314281-11466-1-git-send-email-sbkim73@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org
Cc: jassisinghbrar@gmail.com, lrg@slimlogic.co.uk, broonie@opensource.wolfsonmicro.com, kgene.kim@samsung.com, ben-linux@fluff.org, Sangbeom Kim <sbkim73@samsung.com>

This patch add WM8580 PCM machine driver to support PCM audio
on SMDKC110, SMDKV210, SMDK6450, SMDK6440 boards.
Playback and Capture supports 8kHz sampling rates.
and It is tested on SMDKC110, SMDKV210, SMDK6450

Signed-off-by: Sangbeom Kim <sbkim73@samsung.com>
---
 sound/soc/samsung/Kconfig          |    8 ++
 sound/soc/samsung/Makefile         |    2 +
 sound/soc/samsung/smdk_wm8580pcm.c |  206 ++++++++++++++++++++++++++++++++++++
 3 files changed, 216 insertions(+), 0 deletions(-)
 create mode 100644 sound/soc/samsung/smdk_wm8580pcm.c

diff --git a/sound/soc/samsung/Kconfig b/sound/soc/samsung/Kconfig
index a3fdfb6..b8c7a2e 100644
--- a/sound/soc/samsung/Kconfig
+++ b/sound/soc/samsung/Kconfig
@@ -162,3 +162,11 @@ config SND_SOC_SAMSUNG_SMDK_SPDIF
 	select SND_SAMSUNG_SPDIF
 	help
 	  Say Y if you want to add support for SoC S/PDIF audio on the SMDK.
+
+config SND_SOC_SMDK_WM8580_PCM
+	tristate "SoC PCM Audio support for WM8580 on SMDK"
+	depends on SND_SOC_SAMSUNG && (MACH_SMDK6450 || MACH_SMDKV210 || MACH_SMDKC110)
+	select SND_SOC_WM8580
+	select SND_SAMSUNG_PCM
+	help
+	  Say Y if you want to add support for SoC audio on the SMDK.
diff --git a/sound/soc/samsung/Makefile b/sound/soc/samsung/Makefile
index 294dec0..6c598fc 100644
--- a/sound/soc/samsung/Makefile
+++ b/sound/soc/samsung/Makefile
@@ -34,6 +34,7 @@ snd-soc-smdk-wm9713-objs := smdk_wm9713.o
 snd-soc-s3c64xx-smartq-wm8987-objs := smartq_wm8987.o
 snd-soc-goni-wm8994-objs := goni_wm8994.o
 snd-soc-smdk-spdif-objs := smdk_spdif.o
+snd-soc-smdk-wm8580pcm-objs := smdk_wm8580pcm.o
 
 obj-$(CONFIG_SND_SOC_SAMSUNG_JIVE_WM8750) += snd-soc-jive-wm8750.o
 obj-$(CONFIG_SND_SOC_SAMSUNG_NEO1973_WM8753) += snd-soc-neo1973-wm8753.o
@@ -51,3 +52,4 @@ obj-$(CONFIG_SND_SOC_SAMSUNG_SMDK_WM9713) += snd-soc-smdk-wm9713.o
 obj-$(CONFIG_SND_SOC_SMARTQ) += snd-soc-s3c64xx-smartq-wm8987.o
 obj-$(CONFIG_SND_SOC_SAMSUNG_SMDK_SPDIF) += snd-soc-smdk-spdif.o
 obj-$(CONFIG_SND_SOC_GONI_AQUILA_WM8994) += snd-soc-goni-wm8994.o
+obj-$(CONFIG_SND_SOC_SMDK_WM8580_PCM) += snd-soc-smdk-wm8580pcm.o
diff --git a/sound/soc/samsung/smdk_wm8580pcm.c b/sound/soc/samsung/smdk_wm8580pcm.c
new file mode 100644
index 0000000..0d12092
--- /dev/null
+++ b/sound/soc/samsung/smdk_wm8580pcm.c
@@ -0,0 +1,206 @@
+/*
+ *  sound/soc/samsung/smdk_wm8580pcm.c
+ *
+ *  Copyright (c) 2011 Samsung Electronics Co. Ltd
+ *
+ *  This program is free software; you can redistribute  it and/or  modify it
+ *  under  the terms of  the GNU General  Public License as published by the
+ *  Free Software Foundation;  either version 2 of the  License, or (at your
+ *  option) any later version.
+ */
+#include <sound/soc.h>
+#include <sound/pcm_params.h>
+#include <sound/pcm.h>
+
+#include <asm/mach-types.h>
+
+#include "../codecs/wm8580.h"
+#include "dma.h"
+#include "pcm.h"
+
+/*
+ * Board Settings:
+ *  o '1' means 'ON'
+ *  o '0' means 'OFF'
+ *  o 'X' means 'Don't care'
+ *
+ * SMDK6410, SMDK6440, SMDK6450 Base B/D: CFG1-0000, CFG2-1111
+ * SMDKC110, SMDKV210: CFGB11-100100, CFGB12-0000
+ */
+
+#define SMDK_WM8580_EXT_OSC 12000000
+#define SMDK_WM8580_EXT_MCLK 4096000
+#define SMDK_WM8580_EXT_VOICE 2048000
+
+static unsigned long mclk_freq;
+static unsigned long xtal_freq;
+
+/*
+ * If MCLK clock directly gets from XTAL, we don't have to use PLL
+ * to make MCLK, but if XTAL clock source connects with other codec
+ * pin (like XTI), we should have to set codec's PLL to make MCLK.
+ * Because Samsung SoC does not support pcmcdclk output like I2S.
+ */
+
+static int smdk_wm8580_pcm_hw_params(struct snd_pcm_substream *substream,
+			      struct snd_pcm_hw_params *params)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_dai *codec_dai = rtd->codec_dai;
+	struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
+	int rfs, ret;
+
+	switch (params_rate(params)) {
+	case 8000:
+		break;
+	default:
+		printk(KERN_ERR "%s:%d Sampling Rate %u not supported!\n",
+		__func__, __LINE__, params_rate(params));
+		return -EINVAL;
+	}
+
+	rfs = mclk_freq / params_rate(params) / 2;
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
+	if (mclk_freq == xtal_freq) {
+		ret = snd_soc_dai_set_sysclk(codec_dai, WM8580_CLKSRC_MCLK,
+						mclk_freq, SND_SOC_CLOCK_IN);
+		if (ret < 0)
+			return ret;
+
+		ret = snd_soc_dai_set_clkdiv(codec_dai, WM8580_MCLK,
+						WM8580_CLKSRC_MCLK);
+		if (ret < 0)
+			return ret;
+	} else {
+		ret = snd_soc_dai_set_sysclk(codec_dai, WM8580_CLKSRC_PLLA,
+						mclk_freq, SND_SOC_CLOCK_IN);
+		if (ret < 0)
+			return ret;
+
+		ret = snd_soc_dai_set_clkdiv(codec_dai, WM8580_MCLK,
+						WM8580_CLKSRC_PLLA);
+		if (ret < 0)
+			return ret;
+
+		ret = snd_soc_dai_set_pll(codec_dai, WM8580_PLLA, 0,
+						xtal_freq, mclk_freq);
+		if (ret < 0)
+			return ret;
+	}
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
+static struct snd_soc_ops smdk_wm8580_pcm_ops = {
+	.hw_params = smdk_wm8580_pcm_hw_params,
+};
+
+static struct snd_soc_dai_link smdk_dai[] = {
+	{
+		.name = "WM8580 PAIF PCM RX",
+		.stream_name = "Playback",
+		.cpu_dai_name = "samsung-pcm.0",
+		.codec_dai_name = "wm8580-hifi-playback",
+		.platform_name = "samsung-audio",
+		.codec_name = "wm8580-codec.0-001b",
+		.ops = &smdk_wm8580_pcm_ops,
+	}, {
+		.name = "WM8580 PAIF PCM TX",
+		.stream_name = "Capture",
+		.cpu_dai_name = "samsung-pcm.0",
+		.codec_dai_name = "wm8580-hifi-capture",
+		.platform_name = "samsung-audio",
+		.codec_name = "wm8580-codec.0-001b",
+		.ops = &smdk_wm8580_pcm_ops,
+	},
+};
+
+static struct snd_soc_card smdk_pcm = {
+	.name = "SMDK-PCM",
+	.dai_link = smdk_dai,
+	.num_links = 2,
+};
+
+/*
+ * After SMDKC110 Base Board's Rev is '0.1', 12MHz External OSC(X1)
+ * is absent (or not connected), so we connect EXT_VOICE_CLK(OSC4),
+ * 2.0484Mhz, directly with MCLK both Codec and SoC.
+ */
+static int __devinit snd_smdk_probe(struct platform_device *pdev)
+{
+	int ret = 0;
+
+	xtal_freq = SMDK_WM8580_EXT_OSC;
+	mclk_freq = SMDK_WM8580_EXT_MCLK;
+
+	if (machine_is_smdkc110() || machine_is_smdkv210())
+		xtal_freq = mclk_freq = SMDK_WM8580_EXT_VOICE;
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
+MODULE_DESCRIPTION("ALSA SoC SMDK WM8580 for PCM");
+MODULE_LICENSE("GPL");
-- 
1.7.1
