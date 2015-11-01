From: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH] i2c: exynos5: register driver early in subsys initcall
 to avoid probe defer
Date: Sun, 1 Nov 2015 17:02:03 +0100
Message-ID: <20151101160203.GB2295@katana>
References: <1446215008-30506-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="98e8jtXdkpgskNou"
Return-path: <linux-i2c-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1446215008-30506-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-i2c-owner@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, Krzysztof Kozlowski <k.kozlowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org


--98e8jtXdkpgskNou
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 30, 2015 at 03:23:28PM +0100, Marek Szyprowski wrote:
> i2c bus drivers should be registered earlier than typical drivers to let
> important i2c devices (like PMICs/regulators) get registered early
> enough to avoid probe defer of all devices in typical embedded system.
>=20
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>

I don't accept such patches anymore. Some more background:

http://www.spinics.net/lists/linux-i2c/msg13102.html
http://www.spinics.net/lists/linux-i2c/msg16644.html


--98e8jtXdkpgskNou
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWNjd7AAoJEBQN5MwUoCm2AYYP/AyXc0wgvKlMGerOo0CJDivX
h2vZstIXpzwTusY8rUr5bzNZO5zGd18o4upKMhaB5Dkerxc0yrG1jDn2K+gekclt
bZ/nlREANssR2k4ylnsGn17J5av/GaWSqYBHDHhYHPwihmEvgXR/9JKS/Rx9Rddb
AM+WBbS+m9ETeBvvmSefybLRXFat/Ty7slyoI3RaN1sQX1tkf1Tck0JYwkv9QCqn
JbLKkouo2wjuIq84evwsMVST0ob2TS02sFonQ4sWboci2e7LNDiR2NHfcgj5f+Rj
T/tiSxpnc4CJogsA7/1rzC6+k5nJRh+KI1m9YXnNOnloO0xH0qs6Rc7bl1BlCZ5c
SuRAPCsh0uajrzN9eYU+j70pHSgo6QYEqXOBi219PxAjPfEV1uoMth86A17TNAJ6
xqJwJg2tX9N4M5dMTGdPFjkBzDaxZjUigaHDLIbMf/B3+VxXG0v0vtJLEUVUt8aU
osR+kFrxP218BKTcdq5RQsngtKV20OzMYPGRt8gXiuQRSHQ1mmudLqCp35GRWLpz
eFubeiN5uhGvOVSYSaXaaJyws2k+s+7sds0+CDPB8hYYq4fx1fFuQ98mi6dAeJ7R
cxhbczvpc4iFHf3H8J7lLEeY2Ku6xcJHzFMjx5Y92Dff0y6/wHLwMcWxCl5ehd33
KvXE1QxvXPLJKGha8qFr
=GURY
-----END PGP SIGNATURE-----

--98e8jtXdkpgskNou--
