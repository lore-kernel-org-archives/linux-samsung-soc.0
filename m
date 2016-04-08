From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH] ASoC: samsung: Remove unused Odroid x2/u3 machine driver
Date: Fri, 08 Apr 2016 18:54:57 +0200
Message-ID: <1460134497-31590-1-git-send-email-s.nawrocki@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:36857 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753538AbcDHQzj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 8 Apr 2016 12:55:39 -0400
Received: from epcpsbgm2new.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0O5B0066QR09XN40@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 09 Apr 2016 01:55:21 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: broonie@kernel.org
Cc: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>

We have been using "simple-audio-card" for Odroid X2/U3 boards,
as can be seen from sound node in arch/arm/boot/dts/
exynos4412-odroid-common.dtsi. A dedicated machine driver is not
needed and it is removed in this patch.
There is no dts files using "samsung,odroidx2-audio" or
"samsung,odroidu3-audio" compatible strings.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 .../bindings/sound/samsung,odroidx2-max98090.txt   |  35 ----
 sound/soc/samsung/Kconfig                          |   8 -
 sound/soc/samsung/Makefile                         |   2 -
 sound/soc/samsung/odroidx2_max98090.c              | 185 ---------------------
 4 files changed, 230 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/samsung,odroidx2-max98090.txt
 delete mode 100644 sound/soc/samsung/odroidx2_max98090.c

diff --git a/Documentation/devicetree/bindings/sound/samsung,odroidx2-max98090.txt b/Documentation/devicetree/bindings/sound/samsung,odroidx2-max98090.txt
deleted file mode 100644
index 9148f72..0000000
--- a/Documentation/devicetree/bindings/sound/samsung,odroidx2-max98090.txt
+++ /dev/null
@@ -1,35 +0,0 @@
-Samsung Exynos Odroid X2/U3 audio complex with MAX98090 codec
-
-Required properties:
- - compatible : "samsung,odroidx2-audio" - for Odroid X2 board,
-		"samsung,odroidu3-audio" - for Odroid U3 board
- - samsung,model : the user-visible name of this sound complex
- - samsung,i2s-controller : the phandle of the I2S controller
- - samsung,audio-codec : the phandle of the MAX98090 audio codec
- - samsung,audio-routing : a list of the connections between audio
-   components;  each entry is a pair of strings, the first being the
-   connection's sink, the second being the connection's source;
-   valid names for sources and sinks are the MAX98090's pins (as
-   documented in its binding), and the jacks on the board
-   For Odroid X2:
-     * Headphone Jack
-     * Mic Jack
-     * DMIC
-
-   For Odroid U3:
-     * Headphone Jack
-     * Speakers
-
-Example:
-
-sound {
-	compatible = "samsung,odroidu3-audio";
-	samsung,i2s-controller = <&i2s0>;
-	samsung,audio-codec = <&max98090>;
-	samsung,model = "Odroid-X2";
-	samsung,audio-routing =
-		"Headphone Jack", "HPL",
-		"Headphone Jack", "HPR",
-		"IN1", "Mic Jack",
-		"Mic Jack", "MICBIAS";
-};
diff --git a/sound/soc/samsung/Kconfig b/sound/soc/samsung/Kconfig
index 78baa26..7b722b0 100644
--- a/sound/soc/samsung/Kconfig
+++ b/sound/soc/samsung/Kconfig
@@ -224,14 +224,6 @@ config SND_SOC_SNOW
 	  Say Y if you want to add audio support for various Snow
 	  boards based on Exynos5 series of SoCs.
 
-config SND_SOC_ODROIDX2
-	tristate "Audio support for Odroid-X2 and Odroid-U3"
-	depends on SND_SOC_SAMSUNG && I2C
-	select SND_SOC_MAX98090
-	select SND_SAMSUNG_I2S
-	help
-	  Say Y here to enable audio support for the Odroid-X2/U3.
-
 config SND_SOC_ARNDALE_RT5631_ALC5631
         tristate "Audio support for RT5631(ALC5631) on Arndale Board"
         depends on SND_SOC_SAMSUNG && I2C
diff --git a/sound/soc/samsung/Makefile b/sound/soc/samsung/Makefile
index 052fe71..5d03f5c 100644
--- a/sound/soc/samsung/Makefile
+++ b/sound/soc/samsung/Makefile
@@ -43,7 +43,6 @@ snd-soc-tobermory-objs := tobermory.o
 snd-soc-lowland-objs := lowland.o
 snd-soc-littlemill-objs := littlemill.o
 snd-soc-bells-objs := bells.o
-snd-soc-odroidx2-max98090-objs := odroidx2_max98090.o
 snd-soc-arndale-rt5631-objs := arndale_rt5631.o
 
 obj-$(CONFIG_SND_SOC_SAMSUNG_JIVE_WM8750) += snd-soc-jive-wm8750.o
@@ -69,5 +68,4 @@ obj-$(CONFIG_SND_SOC_TOBERMORY) += snd-soc-tobermory.o
 obj-$(CONFIG_SND_SOC_LOWLAND) += snd-soc-lowland.o
 obj-$(CONFIG_SND_SOC_LITTLEMILL) += snd-soc-littlemill.o
 obj-$(CONFIG_SND_SOC_BELLS) += snd-soc-bells.o
-obj-$(CONFIG_SND_SOC_ODROIDX2) += snd-soc-odroidx2-max98090.o
 obj-$(CONFIG_SND_SOC_ARNDALE_RT5631_ALC5631) += snd-soc-arndale-rt5631.o
diff --git a/sound/soc/samsung/odroidx2_max98090.c b/sound/soc/samsung/odroidx2_max98090.c
deleted file mode 100644
index 0421727..0000000
--- a/sound/soc/samsung/odroidx2_max98090.c
+++ /dev/null
@@ -1,185 +0,0 @@
-/*
- * Copyright (C) 2014 Samsung Electronics Co., Ltd.
- *
- * This program is free software; you can redistribute  it and/or modify it
- * under  the terms of  the GNU General  Public License as published by the
- * Free Software Foundation;  either version 2 of the  License, or (at your
- * option) any later version.
- */
-
-#include <linux/of.h>
-#include <linux/module.h>
-#include <sound/soc.h>
-#include <sound/pcm_params.h>
-#include "i2s.h"
-
-struct odroidx2_drv_data {
-	const struct snd_soc_dapm_widget *dapm_widgets;
-	unsigned int num_dapm_widgets;
-};
-
-/* The I2S CDCLK output clock frequency for the MAX98090 codec */
-#define MAX98090_MCLK 19200000
-
-static struct snd_soc_dai_link odroidx2_dai[];
-
-static int odroidx2_late_probe(struct snd_soc_card *card)
-{
-	struct snd_soc_pcm_runtime *rtd;
-	struct snd_soc_dai *codec_dai;
-	struct snd_soc_dai *cpu_dai;
-	int ret;
-
-	rtd = snd_soc_get_pcm_runtime(card, card->dai_link[0].name);
-	codec_dai = rtd->codec_dai;
-	cpu_dai = rtd->cpu_dai;
-
-	ret = snd_soc_dai_set_sysclk(codec_dai, 0, MAX98090_MCLK,
-						SND_SOC_CLOCK_IN);
-
-	if (ret < 0 || of_find_property(odroidx2_dai[0].codec_of_node,
-					"clocks", NULL))
-		return ret;
-
-	/* Set the cpu DAI configuration in order to use CDCLK */
-	return snd_soc_dai_set_sysclk(cpu_dai, SAMSUNG_I2S_CDCLK,
-					0, SND_SOC_CLOCK_OUT);
-}
-
-static const struct snd_soc_dapm_widget odroidx2_dapm_widgets[] = {
-	SND_SOC_DAPM_HP("Headphone Jack", NULL),
-	SND_SOC_DAPM_MIC("Mic Jack", NULL),
-	SND_SOC_DAPM_MIC("DMIC", NULL),
-};
-
-static const struct snd_soc_dapm_widget odroidu3_dapm_widgets[] = {
-	SND_SOC_DAPM_HP("Headphone Jack", NULL),
-	SND_SOC_DAPM_SPK("Speakers", NULL),
-};
-
-static struct snd_soc_dai_link odroidx2_dai[] = {
-	{
-		.name		= "MAX98090",
-		.stream_name	= "MAX98090 PCM",
-		.codec_dai_name	= "HiFi",
-		.dai_fmt	= SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
-				  SND_SOC_DAIFMT_CBM_CFM,
-	}
-};
-
-static struct snd_soc_card odroidx2 = {
-	.owner			= THIS_MODULE,
-	.dai_link		= odroidx2_dai,
-	.num_links		= ARRAY_SIZE(odroidx2_dai),
-	.fully_routed		= true,
-	.late_probe		= odroidx2_late_probe,
-};
-
-static const struct odroidx2_drv_data odroidx2_drvdata = {
-	.dapm_widgets		= odroidx2_dapm_widgets,
-	.num_dapm_widgets	= ARRAY_SIZE(odroidx2_dapm_widgets),
-};
-
-static const struct odroidx2_drv_data odroidu3_drvdata = {
-	.dapm_widgets		= odroidu3_dapm_widgets,
-	.num_dapm_widgets	= ARRAY_SIZE(odroidu3_dapm_widgets),
-};
-
-static const struct of_device_id odroidx2_audio_of_match[] = {
-	{
-		.compatible	= "samsung,odroidx2-audio",
-		.data		= &odroidx2_drvdata,
-	}, {
-		.compatible	= "samsung,odroidu3-audio",
-		.data		= &odroidu3_drvdata,
-	},
-	{ },
-};
-MODULE_DEVICE_TABLE(of, odroidx2_audio_of_match);
-
-static int odroidx2_audio_probe(struct platform_device *pdev)
-{
-	struct device_node *snd_node = pdev->dev.of_node;
-	struct snd_soc_card *card = &odroidx2;
-	struct device_node *i2s_node, *codec_node;
-	struct odroidx2_drv_data *dd;
-	const struct of_device_id *of_id;
-	int ret;
-
-	of_id = of_match_node(odroidx2_audio_of_match, snd_node);
-	dd = (struct odroidx2_drv_data *)of_id->data;
-
-	card->num_dapm_widgets = dd->num_dapm_widgets;
-	card->dapm_widgets = dd->dapm_widgets;
-
-	card->dev = &pdev->dev;
-
-	ret = snd_soc_of_parse_card_name(card, "samsung,model");
-	if (ret < 0)
-		return ret;
-
-	ret = snd_soc_of_parse_audio_routing(card, "samsung,audio-routing");
-	if (ret < 0)
-		return ret;
-
-	codec_node = of_parse_phandle(snd_node, "samsung,audio-codec", 0);
-	if (!codec_node) {
-		dev_err(&pdev->dev,
-			"Failed parsing samsung,i2s-codec property\n");
-		return -EINVAL;
-	}
-
-	i2s_node = of_parse_phandle(snd_node, "samsung,i2s-controller", 0);
-	if (!i2s_node) {
-		dev_err(&pdev->dev,
-			"Failed parsing samsung,i2s-controller property\n");
-		ret = -EINVAL;
-		goto err_put_codec_n;
-	}
-
-	odroidx2_dai[0].codec_of_node = codec_node;
-	odroidx2_dai[0].cpu_of_node = i2s_node;
-	odroidx2_dai[0].platform_of_node = i2s_node;
-
-	ret = snd_soc_register_card(card);
-	if (ret) {
-		dev_err(&pdev->dev, "snd_soc_register_card() failed: %d\n",
-			ret);
-		goto err_put_i2s_n;
-	}
-	return 0;
-
-err_put_i2s_n:
-	of_node_put(i2s_node);
-err_put_codec_n:
-	of_node_put(codec_node);
-	return ret;
-}
-
-static int odroidx2_audio_remove(struct platform_device *pdev)
-{
-	struct snd_soc_card *card = platform_get_drvdata(pdev);
-
-	snd_soc_unregister_card(card);
-
-	of_node_put(odroidx2_dai[0].cpu_of_node);
-	of_node_put(odroidx2_dai[0].codec_of_node);
-
-	return 0;
-}
-
-static struct platform_driver odroidx2_audio_driver = {
-	.driver = {
-		.name		= "odroidx2-audio",
-		.of_match_table	= odroidx2_audio_of_match,
-		.pm		= &snd_soc_pm_ops,
-	},
-	.probe	= odroidx2_audio_probe,
-	.remove	= odroidx2_audio_remove,
-};
-module_platform_driver(odroidx2_audio_driver);
-
-MODULE_AUTHOR("Chen Zhen <zhen1.chen@samsung.com>");
-MODULE_AUTHOR("Sylwester Nawrocki <s.nawrocki@samsung.com>");
-MODULE_DESCRIPTION("ALSA SoC Odroid X2/U3 Audio Support");
-MODULE_LICENSE("GPL v2");
-- 
1.9.1
