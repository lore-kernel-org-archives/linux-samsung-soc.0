From: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Subject: Re: [PATCH] i2c: s3c2410: remove unused variable
Date: Thu, 16 Jul 2015 22:40:19 +0200
Message-ID: <20150716204019.GA1533@katana>
References: <1437078976-29145-1-git-send-email-laurent.navet@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jRHKVT23PllUwdXP"
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1437078976-29145-1-git-send-email-laurent.navet-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laurent Navet <laurent.navet-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org


--jRHKVT23PllUwdXP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 16, 2015 at 10:36:16PM +0200, Laurent Navet wrote:
> ret is assigned zero and just used to return. remove it.
> Found by using coccinelle.
>=20
> Signed-off-by: Laurent Navet <laurent.navet-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Why not make it void?


--jRHKVT23PllUwdXP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJVqBazAAoJEBQN5MwUoCm2IkEP/0+689ujUByWyV8AnvPSLydN
KEvllrTXapF10mqXQJBLBYmLG+M65azy+yDZIG5DEY2evTBWV6IkhVWIC0Gu5Cce
mQ2vcM2LdxWAB7b2L7UnjtRx3Pe5/qWw2GAO0tYDBlRAqblNltluNzxpKLFSYlH8
vcSInxu88BKyhNE56ipO0w3gXQlk6j1ol3RLd0mZ31ynEefWrezSEZ/lqNotvtZl
uz5dfc6ebBwf5Ebc3U+N5BBLCSYfXq7y3I+YUCoYAlEkKkSMgei9bWnXFok7QxSS
52EG3PWQ0+ebfLk+Gu7QaDAyY1gQRF85VEyO4atuFVx0SI0wrxuOY6azpJ43bAKs
Sr76caOsF0OGrR6BLWYuxSJVEmxOPzugC5vzDFkUlLp7XWyewiGN6S/qO76LMb5C
D0hJZgJqU8gZ6BToRR5aIeQdcpWPuYjjwpO5Oofl9SlmzMiBQB0Vv0wP1NN47s5X
VKQnhwhz72226IpTh6j/I2qw7vpBx904FkowzKOEWwZNtdy3dwERDKIac7f4PQSf
odOovuHEwj1HqrI05gNSpAAZTLj1+WQoc6Np5T4WCuALfw1bANeoWJcRJIrNo+25
laykw+CQQ4DjEJNUNJr4DhaMdiU4pZTBsZ3wwjlnHoicisRJTml6015CnvTkgtOY
W7wmYJ1aJmj4bUV1qW1X
=D1eq
-----END PGP SIGNATURE-----

--jRHKVT23PllUwdXP--
