From: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Subject: Re: [PATCH 1/4] i2c: imx: Constify platform_device_id
Date: Tue, 12 May 2015 18:29:17 +0200
Message-ID: <20150512162917.GE6805@schokonusskuchen.bad>
References: <1430495668-31878-1-git-send-email-k.kozlowski.k@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="2qXFWqzzG3v1+95a"
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1430495668-31878-1-git-send-email-k.kozlowski.k-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Krzysztof Kozlowski <k.kozlowski.k-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org


--2qXFWqzzG3v1+95a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 02, 2015 at 12:54:25AM +0900, Krzysztof Kozlowski wrote:
> The platform_device_id is not modified by the driver and core uses it as
> const.
>=20
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski.k-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Squashed the 4 patches and applied to for-next, thanks!


--2qXFWqzzG3v1+95a
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJVUipcAAoJEBQN5MwUoCm2QXUQAK02DyQbfwff7yZV8jh6aQ+j
IPHdsU14HxsZ4zayTMLyCxNYKSsCi+N9XDsdS2HQ+iOghUQ1o6/R0G968Qb51/jc
9WuaMqV0HftNPkxvIDO40j6lLX8eOrRPnoI7fIDnLlTNvCoLi2mlhyzo3QF5ASJP
faCoMGl+B07ENdP5+z1uv2EudMczz1FHEOa7klsEi++avApFasoSi9ST4FIR4cSi
9gEsUR6je+iDe4x2mAxzbUbUbhze0jfxfJ8rtJsQXCnGOO9Gz97zWvpQr+m+jTps
M+dx+XLTCzEODtY/n9QcUY1OgbDib03nd0BtNtFIF4sawAXF+UOSTh0hBSGbtgcR
9/xANt+G/h8sbSRKCAhtF31t4g13T6pEmDeK+Autfo2JhQpWeLAs1mx6y6//UEoR
j+Mk7eh9zkkH+cHyv5gQsdpbuybemvsYbHhT+Yfw3PCc4WLzDPTiJHsnNJMYl0ka
kJJQWfMuAzDivHWrWftjVVeR8a0Xvpxt2ghldSX6TzYMiYOMxRNv6hGpfauIcHxS
eUyzUX6yY6+JEoGw7sjx3uSA/wo369zy8O5FdYl+AH46G/fr/W3AunG5jhrFU0Nu
zwwSVDWhyXBoZKoWqD2eMXiT0ZNV2qWOn/hij//3Sc1q4X/4tltd5bipGama3yjJ
9OKHeXZxI9EySkZq/iLU
=ti2d
-----END PGP SIGNATURE-----

--2qXFWqzzG3v1+95a--
