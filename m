From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [alsa-devel] [PATCH v3 1/4] ASoC: samsung: Add machine driver for
 Trats2
Date: Thu, 22 Jan 2015 13:16:03 +0100
Message-ID: <54C0EA03.703@samsung.com>
References: <1421925482-15861-1-git-send-email-ideal.song@samsung.com>
 <1421925482-15861-2-git-send-email-ideal.song@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:65238 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750803AbbAVMQP (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 22 Jan 2015 07:16:15 -0500
In-reply-to: <1421925482-15861-2-git-send-email-ideal.song@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inha Song <ideal.song@samsung.com>
Cc: alsa-devel@alsa-project.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@arm.linux.org.uk, kgene@kernel.org, sbkim73@samsung.com, lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.de, grant.likely@linaro.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

On 22/01/15 12:17, Inha Song wrote:
> diff --git a/sound/soc/samsung/Kconfig b/sound/soc/samsung/Kconfig
> index fc67f97..8031423 100644
> --- a/sound/soc/samsung/Kconfig
> +++ b/sound/soc/samsung/Kconfig
> @@ -245,3 +245,11 @@ config SND_SOC_ARNDALE_RT5631_ALC5631
>          depends on SND_SOC_SAMSUNG
>          select SND_SAMSUNG_I2S
>          select SND_SOC_RT5631
> +
> +config SND_SOC_SAMSUNG_TRATS2_WM1811
> +	tristate "SoC I2S Audio support for WM1811 on Tizen Trats2 board"
> +	depends on SND_SOC_SAMSUNG
> +	select SND_SOC_WM8994
> +	select SND_SAMSUNG_I2S

Shouldn't you also select the MFD part of WM8994 here ?

> +++ b/sound/soc/samsung/trats2_wm1811.c
> @@ -0,0 +1,218 @@

> +static struct snd_soc_dai_link trats2_dai[] = {
> +	{
> +		.name		= "WM1811 AIF1",
> +		.stream_name	= "Pri_Dai",

Could we have a less cryptic name here, e.g. "HiFi Primary" ?

> +		.codec_dai_name = "wm8994-aif1",
> +		.codec_name	= "wm8994-codec",
> +		.ops		= &trats2_aif1_ops,
> +		.dai_fmt	= SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
> +				  SND_SOC_DAIFMT_CBM_CFM,
> +	},
> +};

> +static int trats2_audio_probe(struct platform_device *pdev)
> +{
> +	struct device_node *np = pdev->dev.of_node;
> +	struct snd_soc_card *card = &trats2_card;
> +	struct device_node *codec_node;
> +	struct snd_soc_dai_link *dai_link = card->dai_link;
> +	struct trats2_machine_priv *priv = snd_soc_card_get_drvdata(card);
> +	int ret;
> +
> +	if (!np) {
> +		dev_err(&pdev->dev, "of node is missing.\n");
> +		return -ENODEV;

I'd say this whole np test could be dropped, we will fail right below
at the snd_soc_of_parse_card_name() function call if np is NULL.
Such a situation seems highly unlikely anyway.

> +	}
> +
> +	card->dev = &pdev->dev;
> +
> +	ret = snd_soc_of_parse_card_name(card, "samsung,model");
> +	if (ret) {
> +		dev_err(&pdev->dev,
> +			"Card name is not provided\n");

I guess it would fit in a single line.

> +		return ret;
> +	}
> +

> +static struct platform_driver trats2_audio_driver = {
> +	.driver = {
> +		.name		= "trats2-audio",
> +		.owner		= THIS_MODULE,

You can drop this .owner field assignment, it's also done in
module_platform_driver() macro.

> +		.pm		= &snd_soc_pm_ops,
> +		.of_match_table	= trats2_audio_of_match,
> +	},
> +	.probe	= trats2_audio_probe,
> +	.remove	= trats2_audio_remove,
> +};
> +
> +module_platform_driver(trats2_audio_driver);

--
Regards,
Sylwester
