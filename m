From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v6 0/5] regulator: of: Add initial and suspend modes
 support
Date: Wed, 26 Nov 2014 18:58:31 +0000
Message-ID: <20141126185831.GQ7712@sirena.org.uk>
References: <1415627035-3088-1-git-send-email-javier.martinez@collabora.co.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="w7HSfD5ZbgbsPGhz"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1415627035-3088-1-git-send-email-javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Javier Martinez Canillas <javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Cc: Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Abhilash Kesavan <kesavan.abhilash-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org


--w7HSfD5ZbgbsPGhz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 10, 2014 at 02:43:50PM +0100, Javier Martinez Canillas wrote:
> Hello Mark,
>=20
> This is the sixth version of the series that adds regulator initial
> and suspend operating modes support. It relies on the existing work
> that added suspend states bindings. The opmodes are parsed by the
> regulator core and drivers should only define a translation function
> to map between hardware specific to standard modes.

Applied all, thanks.

--w7HSfD5ZbgbsPGhz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBAgAGBQJUdiLWAAoJECTWi3JdVIfQXlYH/2cRfPoHO/MAkjfFjcppP70C
8E5LkrqGe5syIRFwNjWahzGOzrazSZKYiOxMoRnj/fkPbAsqMECckBUWNyL5AxUS
wBffisUV1WNeUZEfRcvMknd0hwJYv2qqF7yQmhOM/05bF2CjSx4bHHamsrs+lq44
X3o1VkjH3WNkOtpbKAAbzffDO5lsUP6EQ2XQ/SOf3UUwjPsCpI9Ma9YRBhvVDLFy
JeZLyqZXNUEHdqJ4EgWWbzIb+19fJ3bRkaEoGMVQjhnXYaaSI9TuNb41AKTBmfns
V3peGGR0SUW8mtE2vQJ1L5cIHo/36X4pnROy3JUxaQDl7CcaccQqawjIEtvBVXs=
=mDxR
-----END PGP SIGNATURE-----

--w7HSfD5ZbgbsPGhz--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
