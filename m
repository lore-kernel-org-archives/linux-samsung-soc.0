From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] ASoC: Samsung: Modify the I2S driver to support I2S on
 Exynos5420
Date: Fri, 12 Jul 2013 12:18:38 +0100
Message-ID: <20130712111838.GZ24508@sirena.org.uk>
References: <1373526505-27115-1-git-send-email-padma.v@samsung.com>
 <2214161.FSfscAvpna@thinkpad>
 <20130711130139.GQ24508@sirena.org.uk>
 <2463181.bQfIDO6XJk@thinkpad>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="WeojGOqAOUQyw5FN"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:56387 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932637Ab3GLLTE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 12 Jul 2013 07:19:04 -0400
Content-Disposition: inline
In-Reply-To: <2463181.bQfIDO6XJk@thinkpad>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Padmavathi Venna <padma.v@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org, padma.kvr@gmail.com, sbkim73@samsung.com, kgene.kim@samsung.com, abrestic@chromium.org


--WeojGOqAOUQyw5FN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 12, 2013 at 12:13:17PM +0200, Tomasz Figa wrote:
> On Thursday 11 of July 2013 14:01:39 Mark Brown wrote:

> > Well, it *should* be samsung,i2s-vN where N is the version number of the
> > IP but documentation on the versioning has been patchy hence this whole
> > thinng.

> Oh, the binding for samsung-i2s uses IP versions. Isn't that slightly bro=
ken?

> At least with Samsung bindings, I think we happened to agree on a single=
=20
> convention of naming compatible values after the first SoC in which such =
block=20
> first appeared.

> I wonder what happened with this i2s binding that made it end up outside =
this=20
> convention.

I think it predates that convention, plus it's been quite common to put
two different I2S blocks in the same SoC (for totally sensible reasons)
so it's not always been clear that the SoC name is sufficiently unique.

--WeojGOqAOUQyw5FN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJR3+YHAAoJELSic+t+oim9e68P/2v3dCGjkpE+yoWcPDPgMltl
thzI7yKazDQghKlH2ifJPb1Sd4eZ3DaX3YELNlI/Ej1y60l2b01UZdNuRXVlqi2q
LiW/9hMbW6oCtVDAGSWCg/7aiXZ+CCQBzu/V6a2oVwfQt045FekfQLEeNUYFfA1D
h4Q8JQkUrjZwDkPc9NLNvvgLST2Sy7Sp+sAb+/5z+DJ4wi2U2gMnOqPLbt04vZng
p0iewtLcOac19w8sUtD45o6tMZQ/hcjMQCuVrTdNPdv2dAg4ec4fhhWiabhFgfbD
BTXv1Sq5Ny2TIIB8BXzh6w80ahvjnbKkfbE+ugtBWiiP9A78+CCfqPTsLrle1hBU
iG8Cmxs4RGRKIfg4PrPfbDk6i2Jjrh81xu66oOOcvkflubB3eR6Apm1qLjVvvupu
Yrun0Hzc/jHu8AsY4Vz4EEAcOHQ7+0Cpv/feInYKQM+uTeNhgaw3EcC6otXdEN9z
ZC5zMCPiv2obY/lgi+BXpW/nj3LftOEbBz3vzFeyuKhyqfgoMfEeMsCQwmfJczFn
902Mdvn6tB2PNPcF+Q8KFAlVrvDvHRW4h7eADLESrTmtZeNte5qcRplUTXG9M53o
i09jAIWIaxF05cxwa9con+L6GG3DyIMDpHIKrw7ICy8FkEViS0zug/721JH88NdF
XAuEeFIsm79Gk0S0hmjk
=sh+e
-----END PGP SIGNATURE-----

--WeojGOqAOUQyw5FN--
