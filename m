From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] ASoC: Samsung: add missing I2C/SPI dependencies
Date: Thu, 29 Jan 2015 11:41:34 +0000
Message-ID: <20150129114134.GC21293@sirena.org.uk>
References: <1815674.ObkQWLfgIW@wuerfel>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="3vWfdACk3p9Kkm6R"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:38887 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753981AbbA2LmC (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 29 Jan 2015 06:42:02 -0500
Content-Disposition: inline
In-Reply-To: <1815674.ObkQWLfgIW@wuerfel>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org


--3vWfdACk3p9Kkm6R
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jan 28, 2015 at 10:28:55PM +0100, Arnd Bergmann wrote:
> The SND_SOC_ARNDALE_RT5631_ALC5631 selects the rt5631 codec
> that requires I2C to work, so we get a build error if I2C
> is disabled:

You rather buried the lead about there being other drivers in this
changelog, makes the code a bit surprising when you find it.

>  config SND_SOC_SPEYSIDE
>  	tristate "Audio support for Wolfson Speyside"
> -	depends on SND_SOC_SAMSUNG && MACH_WLF_CRAGG_6410
> +	depends on SND_SOC_SAMSUNG && MACH_WLF_CRAGG_6410 && SPI_MASTER
>  	select SND_SAMSUNG_I2S
>  	select SND_SOC_WM8996
>  	select SND_SOC_WM9081

Why only add a dependency on SPI here?

--3vWfdACk3p9Kkm6R
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJUyhxuAAoJECTWi3JdVIfQ5fAH/1u7oE5swGgdUUZ6m0zwjoyj
+hZo1FKWwQJH6FVgCABdoo6ZUrMUUXfD5WZdJR/hEfygrzqpZS2ZI2cIC9G0udLC
/qMdVV9vwScaPDa6Ft9Sm08F+NvcX2gv/yHgrnJ9CLnVZQjdC3O4GRuD76/DH5IU
xW5DYeyBJB62B0skm6ra8WdOrl9FLqMREnVfllEtiBnrw7GpsKdls/jCV44DNs6J
xwdJbjUT37hTSbSBn5hchVKdv6faGDvelu4Z5gUSxG1ZJ3fvAOrf3OgJwUkuvCsh
VJb9zyKaQc0nUrtXpVjBoXx6zP//kTPvtLA0OZmEIO1oMBxyJKE7ppFwaLPUS1M=
=0FRX
-----END PGP SIGNATURE-----

--3vWfdACk3p9Kkm6R--
