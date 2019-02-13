From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH v3 06/13] ASoC: samsung: odroid: Add support for secondary
 CPU DAI
Date: Wed, 13 Feb 2019 19:42:05 +0100
Message-ID: <20190213184212.5473-7-s.nawrocki@samsung.com>
References: <20190213184212.5473-1-s.nawrocki@samsung.com>
        <CGME20190213184313epcas1p4d40c267289cd3ff64879a224b91da6d0@epcas1p4.samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <20190213184212.5473-1-s.nawrocki@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, krzk@kernel.org, sbkim73@samsung.com, m.szyprowski@samsung.com, b.zolnierkie@samsung.com, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

This patch adds DPCM links in order to support the secondary I2S interface.
For the secondary PCM interface to be actually available one more entry
should be added to the sound-dai property in sound/cpu node in DT.
The changes in driver are done in a way so we are backwards compatible with
existing DTS/DTB, i.e. if the cpu sound-dai property contains only one entry
only one PCM will be registered.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 sound/soc/samsung/odroid.c | 131 +++++++++++++++++++++++++++----------
 1 file changed, 95 insertions(+), 36 deletions(-)

diff --git a/sound/soc/samsung/odroid.c b/sound/soc/samsung/odroid.c
index e7b371b07230..18bb3bfe0300 100644
--- a/sound/soc/samsung/odroid.c
+++ b/sound/soc/samsung/odroid.c
@@ -7,6 +7,7 @@
  */
 
 #include <linux/clk.h>
+#include <linux/clk-provider.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
 #include <linux/module.h>
@@ -17,21 +18,24 @@
 
 struct odroid_priv {
 	struct snd_soc_card card;
-	struct snd_soc_dai_link dai_link;
-
 	struct clk *clk_i2s_bus;
 	struct clk *sclk_i2s;
 };
 
-static int odroid_card_startup(struct snd_pcm_substream *substream)
+static int odroid_card_fe_startup(struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 
 	snd_pcm_hw_constraint_single(runtime, SNDRV_PCM_HW_PARAM_CHANNELS, 2);
+
 	return 0;
 }
 
-static int odroid_card_hw_params(struct snd_pcm_substream *substream,
+static const struct snd_soc_ops odroid_card_fe_ops = {
+	.startup = odroid_card_fe_startup,
+};
+
+static int odroid_card_be_hw_params(struct snd_pcm_substream *substream,
 				      struct snd_pcm_hw_params *params)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
@@ -86,19 +90,55 @@ static int odroid_card_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-static const struct snd_soc_ops odroid_card_ops = {
-	.startup = odroid_card_startup,
-	.hw_params = odroid_card_hw_params,
+static const struct snd_soc_ops odroid_card_be_ops = {
+	.hw_params = odroid_card_be_hw_params,
+};
+
+static struct snd_soc_dai_link odroid_card_dais[] = {
+	{
+		/* Primary FE <-> BE link */
+		.codec_name = "snd-soc-dummy",
+		.codec_dai_name = "snd-soc-dummy-dai",
+		.ops = &odroid_card_fe_ops,
+		.name = "Primary",
+		.stream_name = "Primary",
+		.platform_name = "3830000.i2s",
+		.dynamic = 1,
+		.dpcm_playback = 1,
+	}, {
+		/* BE <-> CODECs link */
+		.name = "I2S Mixer",
+		.cpu_name = "snd-soc-dummy",
+		.cpu_dai_name = "snd-soc-dummy-dai",
+		.platform_name = "snd-soc-dummy",
+		.ops = &odroid_card_be_ops,
+		.no_pcm = 1,
+		.dpcm_playback = 1,
+		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
+				SND_SOC_DAIFMT_CBS_CFS,
+	}, {
+		/* Secondary FE <-> BE link */
+		.playback_only = 1,
+		.codec_name = "snd-soc-dummy",
+		.codec_dai_name = "snd-soc-dummy-dai",
+		.ops = &odroid_card_fe_ops,
+		.name = "Secondary",
+		.stream_name = "Secondary",
+		.platform_name = "samsung-i2s-sec",
+		.dynamic = 1,
+		.dpcm_playback = 1,
+	}
 };
 
 static int odroid_audio_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct device_node *cpu, *codec;
+	struct device_node *cpu, *cpu_dai, *codec;
 	struct odroid_priv *priv;
-	struct snd_soc_dai_link *link;
 	struct snd_soc_card *card;
-	int ret;
+	struct snd_soc_dai_link *link, *codec_link;
+	int num_pcms, ret, i;
+	struct of_phandle_args args = {};
 
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
@@ -130,45 +170,67 @@ static int odroid_audio_probe(struct platform_device *pdev)
 			return ret;
 	}
 
-	link = &priv->dai_link;
-
-	link->ops = &odroid_card_ops;
-	link->dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
-			SND_SOC_DAIFMT_CBS_CFS;
-
-	card->dai_link = &priv->dai_link;
-	card->num_links = 1;
+	card->dai_link = odroid_card_dais;
+	card->num_links = ARRAY_SIZE(odroid_card_dais);
 
 	cpu = of_get_child_by_name(dev->of_node, "cpu");
 	codec = of_get_child_by_name(dev->of_node, "codec");
+	link = card->dai_link;
+	codec_link = &card->dai_link[1];
 
-	link->cpu_of_node = of_parse_phandle(cpu, "sound-dai", 0);
-	if (!link->cpu_of_node) {
-		dev_err(dev, "Failed parsing cpu/sound-dai property\n");
-		return -EINVAL;
+	/*
+	 * For backwards compatibility create the secondary CPU DAI link only
+	 * if there are 2 CPU DAI entries in the cpu sound-dai property in DT.
+	 */
+	num_pcms = of_count_phandle_with_args(cpu, "sound-dai",
+					      "#sound-dai-cells");
+	if (num_pcms == 1)
+		card->num_links--;
+
+	for (i = 0; i < num_pcms; i++, link += 2) {
+		ret = of_parse_phandle_with_args(cpu, "sound-dai",
+						 "#sound-dai-cells", i, &args);
+		if (ret < 0)
+			return ret;
+
+		if (!args.np) {
+			dev_err(dev, "sound-dai property parse error: %d\n", ret);
+			return -EINVAL;
+		}
+
+		ret = snd_soc_get_dai_name(&args, &link->cpu_dai_name);
+		of_node_put(args.np);
+
+		if (ret < 0)
+			return ret;
 	}
 
-	ret = snd_soc_of_get_dai_link_codecs(dev, codec, link);
+	cpu_dai = of_parse_phandle(cpu, "sound-dai", 0);
+	of_node_put(cpu);
+	of_node_put(codec);
+
+	ret = snd_soc_of_get_dai_link_codecs(dev, codec, codec_link);
 	if (ret < 0)
 		goto err_put_codec_n;
 
-	link->platform_of_node = link->cpu_of_node;
-
-	link->name = "Primary";
-	link->stream_name = link->name;
-
+	/* Set capture capability only for boards with the MAX98090 CODEC */
+	if (codec_link->num_codecs > 1) {
+		card->dai_link[0].dpcm_capture = 1;
+		card->dai_link[1].dpcm_capture = 1;
+	}
 
-	priv->sclk_i2s = of_clk_get_by_name(link->cpu_of_node, "i2s_opclk1");
+	priv->sclk_i2s = of_clk_get_by_name(cpu_dai, "i2s_opclk1");
 	if (IS_ERR(priv->sclk_i2s)) {
 		ret = PTR_ERR(priv->sclk_i2s);
-		goto err_put_i2s_n;
+		goto err_put_codec_n;
 	}
 
-	priv->clk_i2s_bus = of_clk_get_by_name(link->cpu_of_node, "iis");
+	priv->clk_i2s_bus = of_clk_get_by_name(cpu_dai, "iis");
 	if (IS_ERR(priv->clk_i2s_bus)) {
 		ret = PTR_ERR(priv->clk_i2s_bus);
 		goto err_put_sclk;
 	}
+	of_node_put(cpu_dai);
 
 	ret = devm_snd_soc_register_card(dev, card);
 	if (ret < 0) {
@@ -182,10 +244,8 @@ static int odroid_audio_probe(struct platform_device *pdev)
 	clk_put(priv->clk_i2s_bus);
 err_put_sclk:
 	clk_put(priv->sclk_i2s);
-err_put_i2s_n:
-	of_node_put(link->cpu_of_node);
 err_put_codec_n:
-	snd_soc_of_put_dai_link_codecs(link);
+	snd_soc_of_put_dai_link_codecs(codec_link);
 	return ret;
 }
 
@@ -193,8 +253,7 @@ static int odroid_audio_remove(struct platform_device *pdev)
 {
 	struct odroid_priv *priv = platform_get_drvdata(pdev);
 
-	of_node_put(priv->dai_link.cpu_of_node);
-	snd_soc_of_put_dai_link_codecs(&priv->dai_link);
+	snd_soc_of_put_dai_link_codecs(&priv->card.dai_link[1]);
 	clk_put(priv->sclk_i2s);
 	clk_put(priv->clk_i2s_bus);
 
-- 
2.17.1
