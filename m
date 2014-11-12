From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 2/4 V2] ASoC: Samsung: Add arndale_rt5631 machine driver
Date: Wed, 12 Nov 2014 22:29:02 +0000
Message-ID: <20141112222902.GV3815@sirena.org.uk>
References: <1415781339-16089-1-git-send-email-krishna.md@samsung.com>
 <1415781339-16089-3-git-send-email-krishna.md@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="KMpoMTeiOjOCaFAr"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:35560 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752195AbaKLWaZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 12 Nov 2014 17:30:25 -0500
Content-Disposition: inline
In-Reply-To: <1415781339-16089-3-git-send-email-krishna.md@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krishna Mohan Dani <krishna.md@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org, kgene.kim@samsung.com


--KMpoMTeiOjOCaFAr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Nov 12, 2014 at 02:05:37PM +0530, Krishna Mohan Dani wrote:

> +	bfs = 32;
> +
> +	rfs = 256;
> +
> +	rclk = params_rate(params) * rfs;
> +
> +	psr = 4;
> +
> +	ret = snd_soc_dai_set_sysclk(cpu_dai, SAMSUNG_I2S_CDCLK,
> +					0, SND_SOC_CLOCK_OUT);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = snd_soc_dai_set_sysclk(cpu_dai, SAMSUNG_I2S_RCLKSRC_0,
> +					0, SND_SOC_CLOCK_OUT);
> +
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = snd_soc_dai_set_sysclk(codec_dai, 0, rclk, SND_SOC_CLOCK_OUT);
> +	if (ret < 0)
> +		return ret;

Would it make more sense to push the rate configuration into the I2S
controller driver, it doesn't look very board specific?  Ideally the I2S
driver would be smart enough by default to be used with the simple-card
driver.

> +static int arndale_alc5631_init_paiftx(struct snd_soc_pcm_runtime *rtd)
> +{
> +	struct snd_soc_codec *codec = rtd->codec;
> +	struct snd_soc_dapm_context *dapm = &codec->dapm;
> +
> +	snd_soc_dapm_sync(dapm);
> +
> +	return 0;
> +}

This does nothing and can be removed.

> +static struct snd_soc_card arndale = {
> +	.name = "Arndale-I2S",
> +	.dai_link = arndale_dai,
> +	.num_links = ARRAY_SIZE(arndale_dai),
> +};

Please give the card a more specific name like "Arndale RT5631" and
similarly update the symbol names, there are other modules for the
Arndale board.

> +	ret = snd_soc_register_card(card);

devm_snd_soc_register_card().

> +
> +	if (ret)

Extra blank line here after the function call.

> +MODULE_AUTHOR("Claude <claude@insignal.co.kr>");

You're saying Claude is the author but there is no signoff from him.  It
is very important to get signoffs from all authors.

--KMpoMTeiOjOCaFAr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBAgAGBQJUY98tAAoJECTWi3JdVIfQKiQH/Awi1KKuDbU0zg7keeJb9xiF
f5zKuWNm2d9orglu2XZe/Zc26d/fJ2APXlirOZrBsM2AvHeJm+uj1pwRYIE7VxBe
wiCdUtqRYoovm3rAhoYYJWyN8PTtU4sG03Q72rI69iz5zE4g7WpPPbf0F8iBUaHO
X+YAk2WRrsAiAIux8fQ2UyKcfW4bWc8riw0BukrbTZdwn8gwP60NzEBoNvxwlwKm
DaoIwdN0RQDjv/A3whnbr25drH4kqPAyMjuHt2ACdzS8kqBP7xBEWtopTZLnf4IQ
p8u9c39Wo76xg+QxPslXGkHGKlnZrqleRcHGxnShbfQsj6ynJZ8TK8uekLsFEgA=
=j4qV
-----END PGP SIGNATURE-----

--KMpoMTeiOjOCaFAr--
