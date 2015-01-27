From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [alsa-devel] [PATCH v4 1/3] ASoC: samsung: Add machine driver for
 Trats2
Date: Tue, 27 Jan 2015 18:09:39 +0100
Message-ID: <54C7C653.6080904@samsung.com>
References: <1421989410-12490-1-git-send-email-ideal.song@samsung.com>
 <1421989410-12490-2-git-send-email-ideal.song@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:54892 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755367AbbA0RJy (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 27 Jan 2015 12:09:54 -0500
In-reply-to: <1421989410-12490-2-git-send-email-ideal.song@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inha Song <ideal.song@samsung.com>
Cc: alsa-devel@alsa-project.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@arm.linux.org.uk, kgene@kernel.org, sbkim73@samsung.com, lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.de, grant.likely@linaro.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

On 23/01/15 06:03, Inha Song wrote:
> +static int trats2_aif1_startup(struct snd_pcm_substream *substream)
> +{
> +	struct snd_soc_pcm_runtime *rtd = substream->private_data;
> +	struct trats2_machine_priv *priv = snd_soc_card_get_drvdata(rtd->card);
> +	int ret;
> +
> +	ret = clk_prepare_enable(priv->clk_mclk);
> +	if (ret) {
> +		dev_err(rtd->card->dev, "Failed to enable mclk: %d\n", ret);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static void trats2_aif1_shutdown(struct snd_pcm_substream *substream)
> +{
> +	struct snd_soc_pcm_runtime *rtd = substream->private_data;
> +	struct trats2_machine_priv *priv = snd_soc_card_get_drvdata(rtd->card);
> +
> +	clk_disable_unprepare(priv->clk_mclk);
> +}
> +
> +static const struct snd_soc_ops trats2_aif1_ops = {
> +	.startup = trats2_aif1_startup,
> +	.shutdown = trats2_aif1_shutdown,
> +	.hw_params = trats2_aif1_hw_params,
> +};

> +static int trats2_audio_probe(struct platform_device *pdev)
> +{

> +	priv->clk_mclk =  of_clk_get_by_name(codec_node, "MCLK1");
> +	if (IS_ERR(priv->clk_mclk)) {
> +		dev_err(&pdev->dev, "Failed to get mclk clock\n");
> +		of_node_put(codec_node);
> +		return PTR_ERR(priv->clk_mclk);
> +	}

Wouldn't it also work if we added clock handling into the wm8994 codec
driver instead? Not sure if it is correct to retrieve the codec's clock
in the machine driver like this. Or perhaps the MCLK1 (SoC CLKOUT) clock
should be added to the sound DT node and handled only by the machine
driver, together with the other (MCLK2) clock?

> +	of_node_put(codec_node);

--
Regards,
Sylwester
