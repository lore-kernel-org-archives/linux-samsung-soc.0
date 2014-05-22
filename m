From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 2/2] ASoC: samsung: Add machine driver for odroidx2
Date: Thu, 22 May 2014 19:53:34 +0100
Message-ID: <20140522185334.GT12304@sirena.org.uk>
References: <1400759708-25831-1-git-send-email-s.nawrocki@samsung.com>
 <1400759708-25831-2-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="zRD/YghjZ3m+oDir"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:39372 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750870AbaEVSxn (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 22 May 2014 14:53:43 -0400
Content-Disposition: inline
In-Reply-To: <1400759708-25831-2-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: alsa-devel@alsa-project.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Chen Zhen <zhen1.chen@samsung.com>


--zRD/YghjZ3m+oDir
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 22, 2014 at 01:55:08PM +0200, Sylwester Nawrocki wrote:
> From: Chen Zhen <zhen1.chen@samsung.com>
>=20
> This machine driver primary defines the audio path, the supported
> data formats and sample frequency.

I guess it can't yet, it would have been good to explain that in the
changelog for the bindings (and include the binding in this patch...).

> +	ret =3D snd_soc_dai_set_fmt(codec_dai, SND_SOC_DAIFMT_I2S
> +					| SND_SOC_DAIFMT_NB_NF
> +					| SND_SOC_DAIFMT_CBM_CFM);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret =3D snd_soc_dai_set_fmt(cpu_dai, SND_SOC_DAIFMT_I2S
> +					| SND_SOC_DAIFMT_NB_NF
> +					| SND_SOC_DAIFMT_CBM_CFM);
> +	if (ret < 0)
> +		return ret;

These are constant, set these in the dai_link.

> +
> +	ret =3D snd_soc_dai_set_sysclk(codec_dai, 3, MAX98090_MCLK_FREQ,
> +				     SND_SOC_CLOCK_IN);
> +	if (ret < 0) {
> +		dev_err(codec_dai->dev,
> +			"Unable to switch to FLL1: %d\n", ret);
> +		return ret;
> +	}

So's this - also what is 3?  Set it on init.

> +	ret =3D snd_soc_dai_set_sysclk(cpu_dai, SAMSUNG_I2S_OPCLK,
> +					0, MOD_OPCLK_PCLK);

Similarly for the rest of the function.

> +	return snd_soc_register_card(card);

devm_snd_soc_register_card().

--zRD/YghjZ3m+oDir
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTfkerAAoJELSic+t+oim9NG4P/jkFUe9ZZ9vC7mhA7YCAV04a
KnjficN87yVfMTXX2OjO1OH9SXvQnHNnYpKTkjOgLWAuODF6za+gU9a4C3EK3sDo
wMG7F6jRJAcBnD9aKFLWliISMWEmPgLhvMpAKiucLQ+NEqEUeU7XYhAcFyR154gB
yZ2oB4k8Ng/t85dugP8xn+hcHpPqwkTN2hmfNTY5sJHtqfwGLxR1aBtOCuQuhG6W
WMbq1ikfNQtqc1BrK6Mn79xsbWwEkjqGSTV3GaGV4TVWEKkegeZCHEjA+QwX+Tx4
BNFTipK2tth01IzdxFbdkB1SoEcExdQXLV+s362l3yBzcewcsyEp7j3gpkAQu8sT
BqYy7vGOzhMvz90YAt8h2U55XjZKAqUoLknXzEnRjB/MYmkphlcPHBaIleY0WxgX
hlWIefG8Qdpg+mntINZhXhk1r6UGI8Js3pt2510xZZAYofoXYNCJrSvVFM8BbfdO
+0GbkefdDu6opflIF7gx0P7jOfRW3spTHLvtGmohjM8oXfrFkuoX75hIG3KOknzT
RLW4wPe3WKcom1KtqOeYZlNcDhC7UQ7weLaM3MeSwn3qXSlYrVnaoLD95n4K5rwQ
1HVUBUCWlHkI+HudcK79mlH0/4nbfSIGHpua53JsvgX0LBm67dfvBCtEcCO6J90I
TR+Lc2Bdbm+duhKy+3Ek
=uYEf
-----END PGP SIGNATURE-----

--zRD/YghjZ3m+oDir--
