From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 1/1] ASoC: Samsung: Trivial cleanups in header files
Date: Mon, 30 Dec 2013 12:04:13 +0000
Message-ID: <20131230120413.GO31886@sirena.org.uk>
References: <1388038289-8953-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jASSyw8pZdwiLt00"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:50496 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755881Ab3L3MEP (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 30 Dec 2013 07:04:15 -0500
Content-Disposition: inline
In-Reply-To: <1388038289-8953-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, patches@linaro.org


--jASSyw8pZdwiLt00
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Dec 26, 2013 at 11:41:29AM +0530, Sachin Kamat wrote:
> commit 5d229ce569be ("ASoC: samsung: move plat/ headers to local directory")
> moved the header files but forgot to clean the pointers to their old locaton.
> Remove them now.

Applied, thanks.

--jASSyw8pZdwiLt00
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSwWE6AAoJELSic+t+oim9vpcP/003H0C11lePECd/vIJAK/W1
WLGQG5hu0nKoqsHj6024u9cRT9xzxRoTVj5lxYKwkDVx/X98iGVi2Zzgz1a4ULo0
W2mNYqo9PDTQFfhQSvuFpYZHqUHZfB/YiILLwOwXRRqUiypYh5KXr3iu9jE8MMGr
Xp4BjeDW+KSRvu5/ZP0rcGZnZ5O8DVxdDktHG22CShk0s+xN1TY0F9LbNYSFeQok
kfSHu9D4gyYO30cHHlyjiiecnn6J7lM9sxpUMN0g0raRFuCc931608lWVcr9s1Cg
nwPSqYcirCXMoPlvc3y7P6lUXEK9wQj8iEPNFBg5Ny7pM8zGBGkweIP502GkoddK
ELwsie28vl9U0rVKZl6EuRU+i/GrTtxO9L43sz8KlRWPK1bMOSlZsBTQa+A6LPNF
4udKmL/Um0AZBL/2dEc9XvvtSxJXDNvrhqPRlRXQJuyM/+hJSN6CdwPoFQNLc05e
fUTvbzFTDoD2h6oWqXcH/r6WTkO47F0H9CvfBOFdJqDhq34q4TyyrxW5fdVJ2kgl
V3r6UA1X8PgETx2i6duCGINgNf139cRh6oSXfbui5NqD2aITW831+BeQ2aXUoSwj
ebdui6AWXTT69XDLA9mB8XXABMNpDdRXkFJzMOce+CglhxEZZtekgJy9DO+gt+zb
uQdxN5LGJAmQgcEfTc9P
=wnjW
-----END PGP SIGNATURE-----

--jASSyw8pZdwiLt00--
