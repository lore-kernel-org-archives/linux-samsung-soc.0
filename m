From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] ASoC: rt5631: Fixing compilation warning when DT is
 disabled
Date: Mon, 17 Nov 2014 14:52:30 +0000
Message-ID: <20141117145230.GD2722@sirena.org.uk>
References: <1416232589-31319-1-git-send-email-krishna.md@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="U58U7wle/RT11wuz"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:43403 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752797AbaKQOwn (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 17 Nov 2014 09:52:43 -0500
Content-Disposition: inline
In-Reply-To: <1416232589-31319-1-git-send-email-krishna.md@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krishna Mohan Dani <krishna.md@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org, kgene.kim@samsung.com, Claude Youn <claude.youn@gmail.com>


--U58U7wle/RT11wuz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 17, 2014 at 07:26:29PM +0530, Krishna Mohan Dani wrote:
> Fixes the following compilation warning:
> Warning: 'rt5631_i2c_dt_ids' defined but not used - when DT is not used.
>=20
> Signed-off-by: Claude Youn <claude.youn@gmail.com>
> Signed-off-by: Krishna Mohan Dani <krishna.md@samsung.com>

Applied, thanks.  It's really weird that such a trivial patch would have
multiple authors, if you're forwarding on a patch from someone else
please preserve their authorship as well as signoff.

--U58U7wle/RT11wuz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBAgAGBQJUagutAAoJECTWi3JdVIfQ9NEH/1eISb+Hgyz0y3r+PIIhn+LE
wkmzOmGuNTLNtDbnjf9BEaqjEB6cCGLLvUeQ4Feqxk1kiMcgJUjVrC/uTufX/dcs
mwhhBCdi84j1jN5iHk8/Ya3wWJP/vkfJ0gNPAYCCPf6dKzvtvdNwroaDWaXKjAf7
BJFy0aOS8s3OILjWZMegpqP0tJG1IlOIgMmZVSkHM3McAPHKELKLgdS45A52nkqp
2Ch/qDS6TpeSrx0NZ91iXSxnOoLQUDeE+u5/R3racPKoxzrCgI3kxvXKoxXXSjmw
hjhOgBPy0FmOxajFNzLe4f9B3nUKKTwwdXPXYfPWtdH8mnEDsAv82Du8KCnRuzw=
=H6dT
-----END PGP SIGNATURE-----

--U58U7wle/RT11wuz--
