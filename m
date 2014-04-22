From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] ASoC: SAMSUNG: Add sound card driver for Snow board
Date: Tue, 22 Apr 2014 11:44:47 +0100
Message-ID: <20140422104447.GK12304@sirena.org.uk>
References: <1398153834-16199-1-git-send-email-tushar.behera@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="cqUZ7tFrnhCvEBfZ"
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1398153834-16199-1-git-send-email-tushar.behera@linaro.org>
Sender: linux-doc-owner@vger.kernel.org
To: Tushar Behera <tushar.behera@linaro.org>
Cc: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, linux-doc@vger.kernel.org, devicetree@vger.kernel.org, rdunlap@infradead.org, robh+dt@kernel.org
List-Id: linux-samsung-soc@vger.kernel.org


--cqUZ7tFrnhCvEBfZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 22, 2014 at 01:33:54PM +0530, Tushar Behera wrote:

> Added machine driver to instantiate I2S based sound card on Snow
> board. It has MAX98095 audio codec on board.

In general this isn't up to modern standards, please do try to check
that new code is following best practices.  Did the support for setting
the clocking up in the device tree get merged already?

Please do also pay attention to the CC lists when posting patches, this
seems to have been sent to a fairly random selection of people and
lists.

> +	switch (params_format(params)) {

params_width().

> +	ret = snd_soc_dai_set_fmt(codec_dai, SND_SOC_DAIFMT_I2S |
> +					     SND_SOC_DAIFMT_NB_NF |
> +					     SND_SOC_DAIFMT_CBS_CFS);

Set this in the dai_link.

> +	ret = snd_soc_dai_set_sysclk(codec_dai, 0,
> +					FIN_PLL_RATE, SND_SOC_CLOCK_IN);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = snd_soc_dai_set_sysclk(cpu_dai, SAMSUNG_I2S_CDCLK,
> +					0, SND_SOC_CLOCK_OUT);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = snd_soc_dai_set_clkdiv(cpu_dai, SAMSUNG_I2S_DIV_BCLK, bfs);
> +	if (ret < 0)
> +		return ret;

Set this stuff up on probe.  I'm surprised that you need to set BCLK at
all...

> +static int snow_init(struct snd_soc_pcm_runtime *rtd)
> +{
> +	struct snd_soc_codec *codec = rtd->codec;
> +	struct snd_soc_dapm_context *dapm = &codec->dapm;
> +
> +	snd_soc_dapm_sync(dapm);
> +
> +	return 0;
> +}

This does nothing, remove it.

> +	if (!pdev->dev.platform_data && !pdev->dev.of_node) {
> +		dev_err(&pdev->dev, "No platform data supplied\n");
> +		return -EINVAL;
> +	}
> +
> +	name = of_get_property(pdev->dev.of_node, "card-name", NULL);
> +	if (name)
> +		card->name = name;
> +
> +	i2s_node = of_parse_phandle(pdev->dev.of_node,
> +				    "samsung,i2s-controller", 0);
> +	if (!i2s_node) {
> +		dev_err(&pdev->dev,
> +			"Property 'i2s-controller' missing or invalid\n");
> +		return -EINVAL;
> +	}

You're allowing platform data above but I see DT is mandatory here.

> +	ret = snd_soc_register_card(card);
> +	if (ret) {
> +		dev_err(&pdev->dev, "snd_soc_register_card failed (%d)\n", ret);
> +		return ret;
> +	}

devm_snd_soc_register_card().

--cqUZ7tFrnhCvEBfZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTVkgcAAoJELSic+t+oim9gwYQAJBsHURQWvolGhdfIdpsyJ7j
V53YeEWQBHQEq9R/FOdvHwjlbgc0Kl1dT7SwueuSBBigLx7tW1KfT32g8nV9oSgw
2/7xL1EmOTZciOHgO8hLcD7Yv29hb4YLiqfyM/gSl6Ck5o16+zJSnLbZqUdg/ffW
1gfdM7nArNl10xGdPh/3azX8R0wNUBIfRFYtuwRxjdzJHKKe0bJOyxlM6eoSYXCG
ojKQSFEBIlAdqA7acMxp+w88ssxxJAjYN5wB0sOWuz2q5oIgrhCyMCWU/xcM78qq
SQbWEEwsShAs1QxVM8zr1kU00TTzrPc8SRa4kuJo9RNXWzYnf2OymwI2qMjNNdpS
2uISuVLqzLXI6dZFw6aMJMMLOYxHzrQg5HH8sEVoKy+pDhlQMNyM//zRBWxpbc96
UIJt29yS+eheGFZcQF49WD0bQXG8ZFYp2xqRTlnbvuJMPs8lDo5hYJvtwiHR5kJA
GNf9LkJQ09QeksLgXvwWBUy9M6G6KNx2bERUejf9LhSq0GImwL20e/hkRW8CQeB4
x9+AIIG/7VKoXnIBpCs5o9n43SHKPBlBFTObxqj1G6I2tdgy0E5M67Q3K4t9lfOi
rZhjIgJLkj1gi9LZbSqVFfryM5xKB1enM79aMnpaTJDray916zSrac9X1bth1fTZ
cTfaHrEFGdLx440EM+Oq
=nbGw
-----END PGP SIGNATURE-----

--cqUZ7tFrnhCvEBfZ--
