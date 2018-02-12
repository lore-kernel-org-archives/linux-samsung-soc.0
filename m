From: Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v2 6/7] ASoC: samsung: Add support for HDMI audio on TM2
 board
Date: Mon, 12 Feb 2018 17:15:37 +0100
Message-ID: <20180212161538.22669-7-s.nawrocki@samsung.com>
References: <20180212161538.22669-1-s.nawrocki@samsung.com>
        <CGME20180212161705epcas1p379d012575d9ffb52d8ec7c4d49d79102@epcas1p3.samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <20180212161538.22669-1-s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, jcsing.lee-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, sbkim73-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

This patch defines I2S1 - HDMI DAI link and implements related
hw_params callback. The AUD PLL frequency is configured through
the CLK_SCLK_I2S1 leaf clock, the exynos5433 clock tree
definitions are updated in a separate patch.

The device tree parsing part is changed is a way it supports older
DTBs with just a single CPU DAI specified, without the HDMI link.

Signed-off-by: Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---
Changes since v1:
 - dropped the AUD PLL frequency adjustments, only 48k, 96k,
   192k sample rates will be supported.
---
 sound/soc/samsung/tm2_wm5110.c | 152 ++++++++++++++++++++++++++++++++++-------
 1 file changed, 129 insertions(+), 23 deletions(-)

diff --git a/sound/soc/samsung/tm2_wm5110.c b/sound/soc/samsung/tm2_wm5110.c
index a55d18703fe7..b6a492f1ec02 100644
--- a/sound/soc/samsung/tm2_wm5110.c
+++ b/sound/soc/samsung/tm2_wm5110.c
@@ -210,6 +210,59 @@ static struct snd_soc_ops tm2_aif2_ops = {
 	.hw_free = tm2_aif2_hw_free,
 };
 
+static int tm2_hdmi_hw_params(struct snd_pcm_substream *substream,
+			      struct snd_pcm_hw_params *params)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
+	unsigned int bfs;
+	int bitwidth, ret;
+
+	bitwidth = snd_pcm_format_width(params_format(params));
+	if (bitwidth < 0) {
+		dev_err(rtd->card->dev, "Invalid bit-width: %d\n", bitwidth);
+		return bitwidth;
+	}
+
+	switch (bitwidth) {
+	case 48:
+		bfs = 64;
+		break;
+	case 16:
+		bfs = 32;
+		break;
+	default:
+		dev_err(rtd->card->dev, "Unsupported bit-width: %d\n", bitwidth);
+		return -EINVAL;
+	}
+
+	switch (params_rate(params)) {
+	case 48000:
+	case 96000:
+	case 192000:
+		break;
+	default:
+		dev_err(rtd->card->dev, "Unsupported sample rate: %d\n",
+			params_rate(params));
+		return -EINVAL;
+	}
+
+	ret = snd_soc_dai_set_sysclk(cpu_dai, SAMSUNG_I2S_OPCLK,
+					0, SAMSUNG_I2S_OPCLK_PCLK);
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
+static struct snd_soc_ops tm2_hdmi_ops = {
+	.hw_params = tm2_hdmi_hw_params,
+};
+
 static int tm2_mic_bias(struct snd_soc_dapm_widget *w,
 				struct snd_kcontrol *kcontrol, int event)
 {
@@ -405,6 +458,12 @@ static struct snd_soc_dai_link tm2_dai_links[] = {
 		.dai_fmt	= SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
 				  SND_SOC_DAIFMT_CBM_CFM,
 		.ignore_suspend = 1,
+	}, {
+		.name		= "HDMI",
+		.stream_name	= "i2s1",
+		.ops		= &tm2_hdmi_ops,
+		.dai_fmt	= SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
+				  SND_SOC_DAIFMT_CBS_CFS,
 	}
 };
 
@@ -412,7 +471,6 @@ static struct snd_soc_card tm2_card = {
 	.owner			= THIS_MODULE,
 
 	.dai_link		= tm2_dai_links,
-	.num_links		= ARRAY_SIZE(tm2_dai_links),
 	.controls		= tm2_controls,
 	.num_controls		= ARRAY_SIZE(tm2_controls),
 	.dapm_widgets		= tm2_dapm_widgets,
@@ -426,11 +484,14 @@ static struct snd_soc_card tm2_card = {
 
 static int tm2_probe(struct platform_device *pdev)
 {
+	struct device_node *cpu_dai_node[2] = {};
+	struct device_node *codec_dai_node[2] = {};
+	const char *cells_name = NULL;
 	struct device *dev = &pdev->dev;
 	struct snd_soc_card *card = &tm2_card;
 	struct tm2_machine_priv *priv;
-	struct device_node *cpu_dai_node, *codec_dai_node;
-	int ret, i;
+	struct of_phandle_args args;
+	int num_codecs, ret, i;
 
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
@@ -464,47 +525,92 @@ static int tm2_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
-	cpu_dai_node = of_parse_phandle(dev->of_node, "i2s-controller", 0);
-	if (!cpu_dai_node) {
-		dev_err(dev, "i2s-controllers property invalid or missing\n");
-		ret = -EINVAL;
-		goto amp_node_put;
+	num_codecs = of_count_phandle_with_args(dev->of_node, "audio-codec",
+						 NULL);
+
+	/* Skip the HDMI link if not specified in DT */
+	if (num_codecs > 1) {
+		card->num_links = ARRAY_SIZE(tm2_dai_links);
+		cells_name = "#sound-dai-cells";
+	} else {
+		card->num_links = ARRAY_SIZE(tm2_dai_links) - 1;
 	}
 
-	codec_dai_node = of_parse_phandle(dev->of_node, "audio-codec", 0);
-	if (!codec_dai_node) {
-		dev_err(dev, "audio-codec property invalid or missing\n");
-		ret = -EINVAL;
-		goto cpu_dai_node_put;
+	for (i = 0; i < num_codecs; i++) {
+		struct of_phandle_args args;
+
+		ret = of_parse_phandle_with_args(dev->of_node, "i2s-controller",
+						 cells_name, i, &args);
+		if (!args.np) {
+			dev_err(dev, "i2s-controller property parse error: %d\n", i);
+			ret = -EINVAL;
+			goto dai_node_put;
+		}
+		cpu_dai_node[i] = args.np;
+
+		codec_dai_node[i] = of_parse_phandle(dev->of_node,
+						     "audio-codec", i);
+		if (!codec_dai_node[i]) {
+			dev_err(dev, "audio-codec property parse error\n");
+			ret = -EINVAL;
+			goto dai_node_put;
+		}
 	}
 
+	/* Initialize WM5110 - I2S and HDMI - I2S1 DAI links */
 	for (i = 0; i < card->num_links; i++) {
+		unsigned int dai_index = 0; /* WM5110 */
+
 		card->dai_link[i].cpu_name = NULL;
 		card->dai_link[i].platform_name = NULL;
-		card->dai_link[i].codec_of_node = codec_dai_node;
-		card->dai_link[i].cpu_of_node = cpu_dai_node;
-		card->dai_link[i].platform_of_node = cpu_dai_node;
+
+		if (num_codecs > 1 && i == card->num_links - 1)
+			dai_index = 1; /* HDMI */
+
+		card->dai_link[i].codec_of_node = codec_dai_node[dai_index];
+		card->dai_link[i].cpu_of_node = cpu_dai_node[dai_index];
+		card->dai_link[i].platform_of_node = cpu_dai_node[dai_index];
+	}
+
+	if (num_codecs > 1) {
+		/* HDMI DAI link (I2S1) */
+		i = card->num_links - 1;
+
+		ret = of_parse_phandle_with_fixed_args(dev->of_node,
+						"audio-codec", 0, 1, &args);
+		if (ret) {
+			dev_err(dev, "audio-codec property parse error\n");
+			goto dai_node_put;
+		}
+
+		ret = snd_soc_get_dai_name(&args, &card->dai_link[i].codec_dai_name);
+		if (ret) {
+			dev_err(dev, "Unable to get codec_dai_name\n");
+			goto dai_node_put;
+		}
 	}
 
 	ret = devm_snd_soc_register_component(dev, &tm2_component,
 				tm2_ext_dai, ARRAY_SIZE(tm2_ext_dai));
 	if (ret < 0) {
 		dev_err(dev, "Failed to register component: %d\n", ret);
-		goto codec_dai_node_put;
+		goto dai_node_put;
 	}
 
 	ret = devm_snd_soc_register_card(dev, card);
 	if (ret < 0) {
 		dev_err(dev, "Failed to register card: %d\n", ret);
-		goto codec_dai_node_put;
+		goto dai_node_put;
+	}
+
+dai_node_put:
+	for (i = 0; i < num_codecs; i++) {
+		of_node_put(codec_dai_node[i]);
+		of_node_put(cpu_dai_node[i]);
 	}
 
-codec_dai_node_put:
-	of_node_put(codec_dai_node);
-cpu_dai_node_put:
-	of_node_put(cpu_dai_node);
-amp_node_put:
 	of_node_put(card->aux_dev[0].codec_of_node);
+
 	return ret;
 }
 
-- 
2.14.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
