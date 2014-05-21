From: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Subject: Re: [PATCH] i2c: exynos5: Initialise Samsung High Speed I2C
 controller early
Date: Wed, 21 May 2014 15:00:43 +0200
Message-ID: <20140521130043.GA2628@katana>
References: <1398350916-885-1-git-send-email-ch.naveen@samsung.com>
 <20140424162558.GB12304@sirena.org.uk>
 <CAHfPSqB5+mLiC07jbEpeUgW63pZVk700SkYGxToO7GRAsFm_nQ@mail.gmail.com>
 <20140509135153.GM12304@sirena.org.uk>
 <CAHfPSqDSTyQXPT-NCZ2hE01qpdmaR54tbWCUYC_zSDGFp58+7g@mail.gmail.com>
 <20140509145425.GP12304@sirena.org.uk>
 <20140521102515.GJ2708@katana>
 <CAHfPSqCOnW4YGPfMfpBMbLSaiSxRN=CHJK6kYdkXMujKvNwAPA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="VbJkn9YxBvnuCH5J"
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAHfPSqCOnW4YGPfMfpBMbLSaiSxRN=CHJK6kYdkXMujKvNwAPA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Naveen Krishna Ch <naveenkrishna.ch-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Naveen Krishna Chatradhi <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, "linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, grundler-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, cpgs-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org


--VbJkn9YxBvnuCH5J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Kindly, suggest a workable approach for all the subsystems.

Keep this patch out-of-tree? I know that probe ordering causes problems,
and that it needs major efforts. Yet, I understood that adding more and
more subsys_initcall to mainline is not going to help the process unless
essential. Using subsys_initcall has issues, too.


--VbJkn9YxBvnuCH5J
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.15 (GNU/Linux)

iQIcBAEBAgAGBQJTfKN7AAoJEBQN5MwUoCm2hNcP/A+xeI3nO4vZCWuEdMXs2+qa
KxPBorEF0k0xzIcFFkwRWjJEcm1nq/gkQbe0XJlmdi5uSkWN0FyGKtggY+6jNxCR
JCpwk50eGKfVtR/0B0KLuzrlkDckqwY13tZG8ySTAuYzcRA8TO6oVMjS8Hdy5Tmo
fYTNFWiMOVpGa3Nws71oWiEfqSVNXJDN3JOg6kHEiTjZvR1I3UExxxojOyV6PDqe
uuFFcdXNqNPrwr/9IlzSJKqwOaJp165WQtaSNdjvVK9JNa9xiMwaL6/5lbkAYyVY
jeAIS/IuLTQwNPQ0bGSzPxjx/RAKvyEfu+GdloaPBjH9I3lhLHd7Wajd8CQlr8aZ
KDt4hiAQKpyawX2+wElQi6FCwxD3ZatMAGfXDakj4VbzjCIzhuy84wGYjfK01fJU
m1RHNiqueKTLRdwMuQsck2FtSiXnJWwROb4uy/bo09K79n71/45H9ZMRNz4+mGS/
6Bj7K4Z5zaM1lVusfmBqbz45vglL472qONZBZGAEMsUGq7hSlgkklfDdMJAIrDAp
KodVfiNR/S2iuvqXo/68wISDTtX2BLZGPqvqcsuPUfS2vdsvQwYWvLMBDTSxy8my
IpaW4OlL0p0YIgCRyM4xbRioH/aMDJQElrouL8AEqpHpbHeJTIx14Vc7Ug/t2dMA
jfk+Ywssv7mOYleBgj7U
=30LS
-----END PGP SIGNATURE-----

--VbJkn9YxBvnuCH5J--
