From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH V3 6/7] ASoC: Samsung: wm8994: Register the osc clock.
Date: Wed, 7 Aug 2013 11:10:24 +0100
Message-ID: <20130807101024.GX6427@sirena.org.uk>
References: <1375866616-5541-1-git-send-email-padma.v@samsung.com>
 <1375866616-5541-7-git-send-email-padma.v@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="MTFjS3R2zZZVGaSB"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:38767 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932292Ab3HGKLB (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 7 Aug 2013 06:11:01 -0400
Content-Disposition: inline
In-Reply-To: <1375866616-5541-7-git-send-email-padma.v@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Padmavathi Venna <padma.v@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, padma.kvr@gmail.com, kgene.kim@samsung.com, tomasz.figa@gmail.com, abrestic@chromium.org, Mike Turquette <mturquette@linaro.org>


--MTFjS3R2zZZVGaSB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 07, 2013 at 02:40:15PM +0530, Padmavathi Venna wrote:
> This patch registers the 16MHz oscillator clock as fixed clk.

> +/* 16.9MHz fixed oscillator clock */
> +static void init_osc_clock(void)
> +{
> +	struct device_node *np;
> +
> +	np =3D of_find_compatible_node(NULL, NULL, "osc3_clk16mhz");
> +	of_fixed_clk_setup(np);
> +}
> +
>  static int smdk_hw_params(struct snd_pcm_substream *substream,
>  	struct snd_pcm_hw_params *params)
>  {
> @@ -173,6 +183,8 @@ static int smdk_audio_probe(struct platform_device *p=
dev)
>  		smdk_dai[0].platform_of_node =3D smdk_dai[0].cpu_of_node;
>  	}
> =20
> +	init_osc_clock();
> +

This doesn't seem great - it means that this machine driver needs to
know about a specifically named fixed clock which makes it hard to reuse
on other similar boards.  For example I'm intending to reuse this on
Arndale.  Mike?

--MTFjS3R2zZZVGaSB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJSAh0NAAoJELSic+t+oim9SDEQAIeNQ0spdBAT2P3S6IAPC/BB
sa2jz0Anf1JYs+WEx15Ua2igj4WMdWJk0z+Ts3nTLzj4Yj2sFY/5unq+C4L+kmCx
p7Zdr330yTntWEeFUo3sbpBk/GDoiy7BoxS7pntGBsB6VmsRS3a6kMkgM/+BKv5H
nx141HQecMprVb4SJXn2b2cQA4KldLmrG+SZD0tjsu/0Pc0Fcx8Wz5wdGlyBFg9k
qPOtC2uSRpRnhuonsOXnQLChX8t94XO0CfXgbzL4535nFDmfSODb1S54e6YyqAqW
EGMbMomcVDiPWYoOJyx7vI1yOOatYvWyb638hQroYFtdlWCescaIjZ/kDI6mZSH2
wc4xKkQAa3imSpVwuFEYuqcDslSOYOTH1xbqU4zYjPPaPGUKFAmP14qACYsXHbwe
1T4hOB9a0f7n/ELdCsox9ua7PMhSWX96DVPPEo2XkySlclDvaxDGPJ0UPwF9ooQP
kljw9qI1bzT3xKeJj/SRnIUR9HaT57g5ln2lBz4nPzh6Vg5sMJ/3peuXz++M7eed
JawMAOOyNcUSWPaPmPAy3Bn8Uv/hmBlshq4wNS4DLs1Y1zRbLiNs/QmXwz80KMy7
sdrj4oPefu3xfEVjlOY9+EDa/iSLPxGaIhaP1fbbgkIE5bDaK+s6GK1jpODAJ0KY
DISjNyu1LHDu1hkbeLO+
=22zb
-----END PGP SIGNATURE-----

--MTFjS3R2zZZVGaSB--
