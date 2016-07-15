From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH v4 4/4] ASoC: samsung: Add machine driver for Exynos5433
 based TM2 board
Date: Fri, 15 Jul 2016 14:18:19 +0900
Message-ID: <5788721B.7010602@samsung.com>
References: <CGME20160705171538epcas1p14f034567982b67aad091c50e5adcec9c@epcas1p1.samsung.com>
 <1467738877-31555-1-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1467738877-31555-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>, broonie@kernel.org
Cc: robh@kernel.org, alsa-devel@alsa-project.org, devicetree@vger.kernel.org, ideal.song@samsung.com, inki.dae@samsung.com, b.zolnierkie@samsung.com, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <k.kozlowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Sylwester,

[snip]
> +static int tm2_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct snd_soc_card *card = &tm2_card;
> +	struct tm2_machine_priv *priv;
> +	struct device_node *cpu_dai_node, *codec_dai_node;
> +	int ret, i;
> +
> +	if (!dev->of_node) {
> +		dev_err(dev, "DT node is missing\n");
> +		return -ENODEV;
> +	}
> +
> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	snd_soc_card_set_drvdata(card, priv);
> +	card->dev = dev;
> +
> +	priv->gpio_mic_bias = devm_gpiod_get(dev, "mic-bias",
> +						GPIOF_OUT_INIT_LOW);
> +	if (IS_ERR(priv->gpio_mic_bias)) {
> +		dev_err(dev, "Failed to get mic bias gpio\n");
> +		return PTR_ERR(priv->gpio_mic_bias);
> +	}
> +
> +	ret = snd_soc_of_parse_card_name(card, "model");
> +	if (ret < 0) {
> +		dev_err(dev, "Card name is not specified\n");
> +		return ret;
> +	}
> +
> +	ret = snd_soc_of_parse_audio_routing(card, "samsung,audio-routing");
> +	if (ret < 0) {
> +		dev_err(dev, "Audio routing is not specified or invalid\n");
> +		return ret;
> +	}
> +
> +	card->aux_dev[0].codec_of_node = of_parse_phandle(dev->of_node,
> +							"audio-amplifier", 0);
> +	if (!card->aux_dev[0].codec_of_node) {
> +		dev_err(dev, "audio-amplifier property invalid or missing\n");
> +		return -EINVAL;
> +	}
> +
> +	cpu_dai_node = of_parse_phandle(dev->of_node, "i2s-controller", 0);
> +	if (!cpu_dai_node) {
> +		dev_err(dev, "i2s-controllers property invalid or missing\n");
> +		ret = -EINVAL;
> +		goto err_put_amp;
> +	}
> +
> +	codec_dai_node = of_parse_phandle(dev->of_node, "audio-codec", 0);
> +	if (!codec_dai_node) {
> +		dev_err(dev, "audio-codec property invalid or missing\n");
> +		ret = -EINVAL;
> +		goto err_put_cpu_dai;
> +	}
> +
> +	for (i = 0; i < card->num_links; i++) {
> +		card->dai_link[i].cpu_dai_name = NULL;
> +		card->dai_link[i].cpu_name = NULL;
> +		card->dai_link[i].platform_name = NULL;
> +		card->dai_link[i].codec_of_node = codec_dai_node;
> +		card->dai_link[i].cpu_of_node = cpu_dai_node;
> +		card->dai_link[i].platform_of_node = cpu_dai_node;
> +	}
> +
> +	priv->codec_mclk1 = of_clk_get_by_name(codec_dai_node, "mclk1");
> +	if (IS_ERR(priv->codec_mclk1)) {
> +		dev_err(dev, "Failed to get mclk1 clock\n");
> +		ret = PTR_ERR(priv->codec_mclk1);
> +		goto err_put_codec_dai;
> +	}

I think that you better to use the devm_clk_get() instead of of_clk_get_by_name()
because you don't need to handle the clk_put() when error happen and remove the this driver.

	priv->codec_mclk1 = devm_clk_get(dev, "mclk1");

> +
> +	/* mclk2 is optional */
> +	priv->codec_mclk2 = of_clk_get_by_name(codec_dai_node, "mclk2");
> +	if (IS_ERR(priv->codec_mclk2))
> +		dev_info(dev, "Not using mclk2 clock\n");

	priv->codec_mclk2 = devm_clk_get(dev, "mclk2");

> +
> +	ret = devm_snd_soc_register_component(dev, &tm2_component,
> +				tm2_ext_dai, ARRAY_SIZE(tm2_ext_dai));
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to register component: %d\n", ret);
> +		goto err_put_mclk;
> +	}
> +
> +	ret = devm_snd_soc_register_card(dev, card);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to register card: %d\n", ret);
> +		goto err_put_mclk;
> +	}
> +
> +	return 0;
> +
> +err_put_mclk:
> +	clk_put(priv->codec_mclk1);
> +	if (!IS_ERR(priv->codec_mclk2))
> +		clk_put(priv->codec_mclk2);

If using the devm_clk_get(), clk_put() is not needed

> +err_put_codec_dai:
> +	of_node_put(codec_dai_node);
> +err_put_cpu_dai:
> +	of_node_put(cpu_dai_node);
> +err_put_amp:
> +	of_node_put(card->aux_dev[0].codec_of_node);
> +	return ret;
> +}
> +
> +static int tm2_remove(struct platform_device *pdev)
> +{
> +	struct snd_soc_card *card = &tm2_card;
> +	struct tm2_machine_priv *priv = snd_soc_card_get_drvdata(card);
> +
> +	clk_put(priv->codec_mclk1);
> +	if (!IS_ERR(priv->codec_mclk2))
> +		clk_put(priv->codec_mclk2);

ditto.

> +
> +	of_node_put(card->dai_link[0].codec_of_node);
> +	of_node_put(card->dai_link[0].cpu_of_node);
> +	of_node_put(card->aux_dev[0].codec_of_node);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id tm2_of_match[] = {
> +	{ .compatible = "samsung,tm2-audio" },
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(of, tm2_of_match);
> +
> +static struct platform_driver tm2_driver = {
> +	.driver = {
> +		.name		= "tm2-audio",
> +		.pm		= &snd_soc_pm_ops,
> +		.of_match_table	= tm2_of_match,
> +	},
> +	.probe	= tm2_probe,
> +	.remove	= tm2_remove,
> +};
> +
> +module_platform_driver(tm2_driver);
> +
> +MODULE_AUTHOR("Inha Song <ideal.song@samsung.com>");
> +MODULE_DESCRIPTION("ALSA SoC Exynos TM2 Audio Support");
> +MODULE_LICENSE("GPL v2");
> 

Thanks,
Chanwoo Choi
