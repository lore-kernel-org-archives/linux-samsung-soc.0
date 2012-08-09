From: Thierry Reding <thierry.reding@avionic-design.de>
Subject: Re: [PATCH v2 1/3] pwm: samsung: add missing device pointer to
 struct pwm_chip
Date: Thu, 9 Aug 2012 07:44:33 +0200
Message-ID: <20120809054433.GB29806@avionic-0098.mockup.avionic-design.de>
References: <001601cd7143$a29d0780$e7d71680$%han@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ZoaI/ZTpAVc4A5k6"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <001601cd7143$a29d0780$e7d71680$%han@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jingoo Han <jg1.han@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org


--ZoaI/ZTpAVc4A5k6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 03, 2012 at 03:45:56PM +0900, Jingoo Han wrote:
> This patch adds missing device pointer to struct pwm_chip. If the
> device pointer is NULL, pwmchip_add() will return error.
>=20
> Signed-off-by: Jingoo Han <jg1.han@samsung.com>

Thanks, applied to for-next and master.

Thierry

--ZoaI/ZTpAVc4A5k6
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJQI05BAAoJEN0jrNd/PrOhWesQAMFrYxor0rg11Wk0UN2CIQBl
W3sFO8/5mur23lXNbxZNGLgfHr+T7nVxbzSNCoK4FKMWHTVKSIXPKgT1H1aNCVZi
1ViV5fpS1ZMhH3Nlf2qjTMxe/U7P73cprgAkDYuy3sv4VICuyXecnG+wjeURifnf
YW461/zWld3zIhC6s197KKdNSqhvCoznPdLT8cnSrF0S5jweSNeHi1IQi0o3oFio
8ObeGbRM4zKw8VQ/ic4X+r4EHqZ/4WvpwJZYZw8bQ40XPXJ7qEa7hAGG9yENwVqK
j+UdRcooba4JPSaRpCGtifyk1hIjtH8B2J4X7dXl3JRJSrM2aNcJvcW/MtTsj3PG
r+haK2LQRwBWyuxwyvKyZEPfgrzu0C34jOSAVLIFwgDCb/IZ+XOy4FGizQrrSfhG
W+4Ja8BViPeQCq/OJk59MCp49UZGbo57O36YnWg5VKnHlguUZjY3SDKLuItOOZoZ
VQ5al9ddcdKQA0hcdydFzXWLpP297uBUA2wLC5f2+QwwpJ3ZYXDBlozExhJQzJi7
WmTo7nlJQQepd8iqiSKC7by1shwGaGTR8BUa0pbZ7099XBtmoCuCCamWMgu/5PFE
awlHMWJA3ShozIkU4ZcS73Wh5SvKiyUuOwSKYDj4babr7V0GZX8dd/ojdWL9g14p
nCrP46kbRnRqr47xQOcJ
=6rB7
-----END PGP SIGNATURE-----

--ZoaI/ZTpAVc4A5k6--
