From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] ASoC: Samsung: Modify the I2S driver to support I2S on
 Exynos5420
Date: Thu, 11 Jul 2013 14:01:39 +0100
Message-ID: <20130711130139.GQ24508@sirena.org.uk>
References: <1373526505-27115-1-git-send-email-padma.v@samsung.com>
 <29860116.IF545KsGYb@thinkpad>
 <20130711112023.GM24508@sirena.org.uk>
 <2214161.FSfscAvpna@thinkpad>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="CVXKxAdNG2kQIXaJ"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:51618 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753303Ab3GKNBm (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 11 Jul 2013 09:01:42 -0400
Content-Disposition: inline
In-Reply-To: <2214161.FSfscAvpna@thinkpad>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Padmavathi Venna <padma.v@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org, padma.kvr@gmail.com, sbkim73@samsung.com, kgene.kim@samsung.com, abrestic@chromium.org


--CVXKxAdNG2kQIXaJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 11, 2013 at 01:41:40PM +0200, Tomasz Figa wrote:
> On Thursday 11 of July 2013 12:20:23 Mark Brown wrote:

> > This is a bit of a larger project sadly, there was resistance to doing
> > the DT bindings based on compatible strings using the IP version :(

> I'm not sure if this case is related to this problem in any way. I just=
=20
> suggested introducing a new include like samsung,exynos5420-i2s, a oppose=
d to=20
> using samsung,exynos5250-i2s and adding flags, since the I2S in Exynos542=
0 is=20

Well, it *should* be samsung,i2s-vN where N is the version number of the
IP but documentation on the versioning has been patchy hence this whole
thinng.

> the first one to have this TDM or whatever mode. (I'd still like to hear =
what=20
> it is...)

What it *should* be is the option to send more than one audio stream
down a link using time division multiplexing.

--CVXKxAdNG2kQIXaJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJR3qywAAoJELSic+t+oim9HdsP/2JgmILg9uAIPS1Z2B9Nzso6
raM33mslSkN2mRV1eFevocEtzLaoYLSz0nxB3kInUNSKEtOJoxAYIDMxNk1HZQrG
3NFq3LncbTMi+evgqr1YCFjxKJAlnTXagCROjp4oD37coxtYAmYxAxJk/oTGbnk1
TvJJ7ZnJrsXmL42VAdAjU8WsbtY99FVxi87CyZjbk4L25UqchCE6TJhoTUmYQPav
ftxq5FQLtyIADiZ818z+S7Eosp+VFbYen5Hy2lhocse0weMPQb6LDTJzg278CooN
4JTPoKHhG0WR3GSYomp7eg8jSjVI/OB75HEc0v9kVQzR+2j98GjHI5wpQjDcIs9R
J7Mrqg4KbrTsGysEDbDJoJ+eybbYYCBoEBmvHDGscqbp2of38gyvcM2y3i2o36Hp
i6C0pCCzdRbgG+Zaojm1Q9OQYHNlZAZoeuEVb1YG2W46Ya8IETONa7inmZBfMciA
yhpWr1mb935seLKV6I4r3Ymgpkz44jCUQbJeeYnURmUCB/pn5Pp/qkz/s35OXm3d
sJqW6tXCO1d4eq27bRWU9J6U6/t1JGbllgpVV2ZghpHdNOlQz2ct7ceTrV8A2Akh
cHLA+T7LrSAhjphZvax4i45iv670+MR/RbLC8xSFJB9vG+Q1/w0/cSFMCGq291D/
YYaxq3tcfFlg+jBJdZad
=8vLd
-----END PGP SIGNATURE-----

--CVXKxAdNG2kQIXaJ--
