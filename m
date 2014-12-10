From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC 04/15] regulator: add restrack support
Date: Wed, 10 Dec 2014 16:07:20 +0000
Message-ID: <20141210160720.GS11764@sirena.org.uk>
References: <1418226513-14105-1-git-send-email-a.hajda@samsung.com>
 <1418226513-14105-5-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="W/1XGRQlv2BMqnS3"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1418226513-14105-5-git-send-email-a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "moderated list:ARM/CLKDEV SUPPORT" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "open list:GPIO SUBSYSTEM" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:DRM PANEL DRIVERS" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "moderated list:ARM/S5P EXYNOS AR..." <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:OPEN FIRMWARE AND..." <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, boris.brezillon@
List-Id: linux-samsung-soc@vger.kernel.org


--W/1XGRQlv2BMqnS3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Dec 10, 2014 at 04:48:22PM +0100, Andrzej Hajda wrote:
> Regulators supports various methods of lookup.
> The patch adds restrack support only to DT based regulators.

Why, what does this mean and how might one use it?  I've not looked at
the code since I don't know what it's supposed to accomplish...

One very high level thing is that anything that only works for DT only
seems to be a non-starter, the API should be hiding details of the
firmware interface.

--W/1XGRQlv2BMqnS3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBAgAGBQJUiG+3AAoJECTWi3JdVIfQmAwH/jiUhtG2zZjX7a2DvVgSimtx
Ed87dh0BkNgWFNjrbsMbEBlThMTPHFJDPrA3jOuXvBkOeW1AENCdWLpHUmNhMiL5
XG1hWqS3RaPMYdFK1UBH18hzrn7QwdBh2WbTcRU5lMyvM2tCiQVMFS/LNNivcYhJ
lY1y5Ol0cTLU0uTh12vSNK53x4tsgbWCAFYOn91F3Kh572wnTYvo3WVub8Cv/7wP
KjOMQ24tzUD4fWFL2LNkRF8XM1yXesB6JdTogtXxyv0wh0GhF0bYVxeMcHFKqWoq
BqEQllGFsJHEvYSghmd2m0cd3D1csRDkmOfFUDnkoTMjtzPQsPvzk4Ti+Nr2zIs=
=1JPy
-----END PGP SIGNATURE-----

--W/1XGRQlv2BMqnS3--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
