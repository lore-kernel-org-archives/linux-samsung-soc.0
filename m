From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] ASoC: Samsung: Modify the I2S driver to support I2S on
 Exynos5420
Date: Thu, 11 Jul 2013 11:48:04 +0100
Message-ID: <20130711104804.GK24508@sirena.org.uk>
References: <1373526505-27115-1-git-send-email-padma.v@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="tBhgiDt8dP1efIIJ"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:52002 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755803Ab3GKKsv (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 11 Jul 2013 06:48:51 -0400
Content-Disposition: inline
In-Reply-To: <1373526505-27115-1-git-send-email-padma.v@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Padmavathi Venna <padma.v@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org, padma.kvr@gmail.com, sbkim73@samsung.com, kgene.kim@samsung.com, abrestic@chromium.org


--tBhgiDt8dP1efIIJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 11, 2013 at 12:38:24PM +0530, Padmavathi Venna wrote:

> -#define MOD_LR_LLOW		(0 << 7)
> -#define MOD_LR_RLOW		(1 << 7)
> -#define MOD_SDF_IIS		(0 << 5)
> -#define MOD_SDF_MSB		(1 << 5)
> -#define MOD_SDF_LSB		(2 << 5)
> -#define MOD_SDF_MASK		(3 << 5)

> +#define MOD_LR_LLOW		0
> +#define MOD_LR_RLOW		1
> +#define MOD_SDF_SHIFT		5
> +#define MOD_SDF_IIS		0
> +#define MOD_SDF_MSB		1
> +#define MOD_SDF_LSB		2
> +#define MOD_SDF_MASK		3

This patch has an awful lot of coding style changes like this which
are just coding style changes and not implementing TDM support.  These
should be done separately, not as part of the same patch, in order to
make the code easier to review.

>  	case 768:
> -		mod |= MOD_RCLK_768FS;
> +		mod |= (MOD_RCLK_768FS << rfs_shift);
>  		break;

This stuff is another example.

I think the change itself should be fine but I'm not 100% sure I'm
correctly identifying what's a stylistic change and what's a functional
change.

--tBhgiDt8dP1efIIJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJR3o1hAAoJELSic+t+oim9pdQP/32ZdmsNmi4zhCdEw5VH09Qj
q30ZxMGg6ZdjpiPg7b3jK81VIjF1/o43+FK1q7pQE6hzgWDRWjrl/A1kelSjrXyQ
wMWKc2NthV/k+Y7O1vsKEC+BOZJMZ4u/D1IaGbMawgxhz31vGVHPatNuh5QJX07a
jaQ6NKI13QX/wok/fY2ghr8SSankXzKTHC/rXahGGggZbet/QxTFN6YHv3/LgrDr
JcaHxzG4I4OAE0SDkhp4gP5RETmO7/1ekpVSL9kUAlVh17K+bZWPnrmxc6CtrQo1
iu7WxEUkIP0/wSN9vAfCL9lX66Nsw25PUdPC0qbE2/W8TOQjRT0ifSgiHJeKTiRp
npnlPeImu1kN65v8Gh5qQulxhqSUcQy4gQMpwvP9iA+r3STud66FcEQY1DpmrWYt
tlAyd75m3EaHNEKXh3O7eqr4dxX1WaKoCAKxzElylomneRD2IZkgZdftl+aT/5DT
4sl1GsFIAFmD37lS+720I2lOQBOiVB4rQsGgrICZUTUi2/Ae0YEhn4NEJEz5zyKj
VQCmTchkqBVqbXJZ6Z79otiwtzVjOLEU4fGCw9JKpmLHyUEC46v8t8kAzPMBUqfi
SenMZbfFaeEng4ReGxphRpqTnS1TDooIZKa9OekQtDlduZlZUC6ueEuEXnLrCH31
mcWIqNv1Ca4aSi5+Ez0k
=lqLa
-----END PGP SIGNATURE-----

--tBhgiDt8dP1efIIJ--
