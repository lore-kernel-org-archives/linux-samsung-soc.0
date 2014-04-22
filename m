From: Tushar Behera <tushar.behera@linaro.org>
Subject: [PATCH] ASoC: SAMSUNG: Add sound card driver for Snow board
Date: Tue, 22 Apr 2014 13:33:54 +0530
Message-ID: <1398153834-16199-1-git-send-email-tushar.behera@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f52.google.com ([209.85.220.52]:38423 "EHLO
	mail-pa0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753840AbaDVIFB (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 22 Apr 2014 04:05:01 -0400
Received: by mail-pa0-f52.google.com with SMTP id kx10so665047pab.11
        for <linux-samsung-soc@vger.kernel.org>; Tue, 22 Apr 2014 01:05:00 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, linux-doc@vger.kernel.org, devicetree@vger.kernel.org
Cc: broonie@kernel.org, rdunlap@infradead.org, robh+dt@kernel.org

Added machine driver to instantiate I2S based sound card on Snow
board. It has MAX98095 audio codec on board.

There are some other variants for Snow board which have MAX98090
audio codec. Hence support for MAX98090 is also added to this
driver.

Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
---
 Documentation/devicetree/bindings/sound/snow.txt |   17 ++
 sound/soc/samsung/Kconfig                        |   11 ++
 sound/soc/samsung/Makefile                       |    2 +
 sound/soc/samsung/snow.c                         |  190 ++++++++++++++++++++++
 4 files changed, 220 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/snow.txt
 create mode 100644 sound/soc/samsung/snow.c

diff --git a/Documentation/devicetree/bindings/sound/snow.txt b/Documentation/devicetree/bindings/sound/snow.txt
new file mode 100644
index 0000000..6f3fd02
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/snow.txt
@@ -0,0 +1,17 @@
+Audio Binding for Snow boards
+
+Required properties:
+- compatible : Can be one of the following,
+			"google,snow-audio-max98090" or
+			"google,snow-audio-max98095"
+- samsung,i2s-controller: The phandle of the Samsung I2S0 controller
+- samsung,audio-codec: The phandle of the audio codec
+
+Example:
+
+sound {
+		compatible = "google,snow-audio-max98095";
+
+		samsung,i2s-controller = <&i2s0>;
+		samsung,audio-codec = <&max98095>;
+};
diff --git a/sound/soc/samsung/Kconfig b/sound/soc/samsung/Kconfig
index f2e2891..d07b04f 100644
--- a/sound/soc/samsung/Kconfig
+++ b/sound/soc/samsung/Kconfig
@@ -231,3 +231,13 @@ config SND_SOC_LITTLEMILL
 	select SND_SAMSUNG_I2S
 	select MFD_WM8994
 	select SND_SOC_WM8994
+
+config SND_SOC_SNOW
+	tristate "Audio support for Google Snow boards"
+	depends on SND_SOC_SAMSUNG
+	select SND_SOC_MAX98090
+	select SND_SOC_MAX98095
+	select SND_SAMSUNG_I2S
+	help
+	  Say Y if you want to add audio support for various Snow
+	  boards based on Exynos5 series of SoCs.
diff --git a/sound/soc/samsung/Makefile b/sound/soc/samsung/Makefile
index 86715d8..6d0212b 100644
--- a/sound/soc/samsung/Makefile
+++ b/sound/soc/samsung/Makefile
@@ -34,6 +34,7 @@ snd-soc-h1940-uda1380-objs := h1940_uda1380.o
 snd-soc-rx1950-uda1380-objs := rx1950_uda1380.o
 snd-soc-smdk-wm8580-objs := smdk_wm8580.o
 snd-soc-smdk-wm8994-objs := smdk_wm8994.o
+snd-soc-snow-objs := snow.o
 snd-soc-smdk-wm9713-objs := smdk_wm9713.o
 snd-soc-s3c64xx-smartq-wm8987-objs := smartq_wm8987.o
 snd-soc-goni-wm8994-objs := goni_wm8994.o
@@ -58,6 +59,7 @@ obj-$(CONFIG_SND_SOC_SAMSUNG_H1940_UDA1380) += snd-soc-h1940-uda1380.o
 obj-$(CONFIG_SND_SOC_SAMSUNG_RX1950_UDA1380) += snd-soc-rx1950-uda1380.o
 obj-$(CONFIG_SND_SOC_SAMSUNG_SMDK_WM8580) += snd-soc-smdk-wm8580.o
 obj-$(CONFIG_SND_SOC_SAMSUNG_SMDK_WM8994) += snd-soc-smdk-wm8994.o
+obj-$(CONFIG_SND_SOC_SNOW) += snd-soc-snow.o
 obj-$(CONFIG_SND_SOC_SAMSUNG_SMDK_WM9713) += snd-soc-smdk-wm9713.o
 obj-$(CONFIG_SND_SOC_SMARTQ) += snd-soc-s3c64xx-smartq-wm8987.o
 obj-$(CONFIG_SND_SOC_SAMSUNG_SMDK_SPDIF) += snd-soc-smdk-spdif.o
diff --git a/sound/soc/samsung/snow.c b/sound/soc/samsung/snow.c
new file mode 100644
index 0000000..e8eedd8
--- /dev/null
+++ b/sound/soc/samsung/snow.c
@@ -0,0 +1,190 @@
+/*
+ * ASoC machine driver for Snow boards
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License
+ * version 2 as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful, but
+ * WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * General Public License for more details.
+ */
+
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+
+#include <sound/soc.h>
+#include <sound/soc-dapm.h>
+#include <sound/pcm_params.h>
+
+#include "i2s.h"
+
+#define FIN_PLL_RATE		24000000
+
+static int snow_hw_params(struct snd_pcm_substream *substream,
+	struct snd_pcm_hw_params *params)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_dai *codec_dai = rtd->codec_dai;
+	struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
+	int bfs, ret;
+
+	switch (params_format(params)) {
+	case SNDRV_PCM_FORMAT_U24:
+	case SNDRV_PCM_FORMAT_S24:
+		bfs = 48;
+		break;
+	case SNDRV_PCM_FORMAT_U16_LE:
+	case SNDRV_PCM_FORMAT_S16_LE:
+		bfs = 32;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	ret = snd_soc_dai_set_fmt(codec_dai, SND_SOC_DAIFMT_I2S |
+					     SND_SOC_DAIFMT_NB_NF |
+					     SND_SOC_DAIFMT_CBS_CFS);
+	if (ret < 0)
+		return ret;
+
+	ret = snd_soc_dai_set_fmt(cpu_dai, SND_SOC_DAIFMT_I2S |
+					   SND_SOC_DAIFMT_NB_NF |
+					   SND_SOC_DAIFMT_CBS_CFS);
+	if (ret < 0)
+		return ret;
+
+	ret = snd_soc_dai_set_sysclk(codec_dai, 0,
+					FIN_PLL_RATE, SND_SOC_CLOCK_IN);
+	if (ret < 0)
+		return ret;
+
+	ret = snd_soc_dai_set_sysclk(cpu_dai, SAMSUNG_I2S_CDCLK,
+					0, SND_SOC_CLOCK_OUT);
+	if (ret < 0)
+		return ret;
+
+	ret = snd_soc_dai_set_clkdiv(cpu_dai, SAMSUNG_I2S_DIV_BCLK, bfs);
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
+static struct snd_soc_ops snow_ops = {
+	.hw_params = snow_hw_params,
+};
+
+static int snow_init(struct snd_soc_pcm_runtime *rtd)
+{
+	struct snd_soc_codec *codec = rtd->codec;
+	struct snd_soc_dapm_context *dapm = &codec->dapm;
+
+	snd_soc_dapm_sync(dapm);
+
+	return 0;
+}
+
+static struct snd_soc_dai_link snow_dai[] = {
+	{ /* Playback DAI i/f */
+		.name = "Playback",
+		.stream_name = "Playback",
+		.codec_dai_name = "HiFi",
+		.init = snow_init,
+		.ops = &snow_ops,
+	}, { /* Capture DAI i/f */
+		.name = "Capture",
+		.stream_name = "Capture",
+		.codec_dai_name = "HiFi",
+		.ops = &snow_ops,
+	},
+};
+
+static struct snd_soc_card snow_snd = {
+	.name = "Snow-I2S",
+	.dai_link = snow_dai,
+	.num_links = ARRAY_SIZE(snow_dai),
+};
+
+static int snow_driver_probe(struct platform_device *pdev)
+{
+	struct snd_soc_card *card = &snow_snd;
+	struct device_node *i2s_node, *codec_node;
+	const char *name;
+	int i, ret;
+
+	if (!pdev->dev.platform_data && !pdev->dev.of_node) {
+		dev_err(&pdev->dev, "No platform data supplied\n");
+		return -EINVAL;
+	}
+
+	name = of_get_property(pdev->dev.of_node, "card-name", NULL);
+	if (name)
+		card->name = name;
+
+	i2s_node = of_parse_phandle(pdev->dev.of_node,
+				    "samsung,i2s-controller", 0);
+	if (!i2s_node) {
+		dev_err(&pdev->dev,
+			"Property 'i2s-controller' missing or invalid\n");
+		return -EINVAL;
+	}
+
+	codec_node = of_parse_phandle(pdev->dev.of_node,
+				      "samsung,audio-codec", 0);
+	if (!codec_node) {
+		dev_err(&pdev->dev,
+			"Property 'audio-codec' missing or invalid\n");
+		return -EINVAL;
+	}
+
+	for (i = 0; i < ARRAY_SIZE(snow_dai); i++) {
+		snow_dai[i].codec_of_node = codec_node;
+		snow_dai[i].cpu_of_node = i2s_node;
+		snow_dai[i].platform_of_node = i2s_node;
+	}
+
+	card->dev = &pdev->dev;
+
+	ret = snd_soc_register_card(card);
+	if (ret) {
+		dev_err(&pdev->dev, "snd_soc_register_card failed (%d)\n", ret);
+		return ret;
+	}
+
+	return ret;
+}
+
+static int snow_driver_remove(struct platform_device *pdev)
+{
+	struct snd_soc_card *card = platform_get_drvdata(pdev);
+
+	snd_soc_unregister_card(card);
+
+	return 0;
+}
+
+static const struct of_device_id snow_of_match[] = {
+	{ .compatible = "google,snow-audio-max98090", },
+	{ .compatible = "google,snow-audio-max98095", },
+	{},
+};
+
+static struct platform_driver snow_driver = {
+	.driver = {
+		.name = "snow-audio",
+		.owner = THIS_MODULE,
+		.pm = &snd_soc_pm_ops,
+		.of_match_table = snow_of_match,
+	},
+	.probe = snow_driver_probe,
+	.remove = snow_driver_remove,
+};
+
+module_platform_driver(snow_driver);
+
+MODULE_DESCRIPTION("ALSA SoC Audio machine driver for Snow");
+MODULE_LICENSE("GPL");
-- 
1.7.9.5
