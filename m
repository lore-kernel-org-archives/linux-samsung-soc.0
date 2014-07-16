From: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Subject: Re: [PATCH v2] i2c: s3c2410: resume the I2C controller earlier
Date: Wed, 16 Jul 2014 19:35:28 +0200
Message-ID: <20140716173528.GF2759@katana>
References: <1403654214-25072-1-git-send-email-dianders@chromium.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jkO+KyKz7TfD21mV"
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1403654214-25072-1-git-send-email-dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>, Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org, Vincent Palatin <vpalatin-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org


--jkO+KyKz7TfD21mV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 24, 2014 at 04:56:54PM -0700, Doug Anderson wrote:
> From: Vincent Palatin <vpalatin-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>=20
> When the wake-up is triggered by the PMIC RTC, the RTC driver is trying
> to read the PMIC interrupt status over I2C and fails because the I2C
> controller is not resumed yet.
> Let's resume the I2C controller earlier in the _noirq phase
> (as other hardwares are doing), so we can properly get the wake-up
> condition.
>=20
> Signed-off-by: Vincent Palatin <vpalatin-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> Signed-off-by: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

Applied to for-current (because Tomasz said it fixes issues), thanks! If
you think the exynos patch of the same style should also be in current,
please let me know...


--jkO+KyKz7TfD21mV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJTxrfgAAoJEBQN5MwUoCm2csAP/R2yIXJfGbOybLhBnLZ2ntPT
BeMeENUOjBXYKYzbDbbHiotkTsOV6d51o5+pJjDynREhxTgwJhSgO03QhReEVdGr
1Y/PdqNgEYXhcKD5ypaIXL1zLHohMSune9RlIksn5WINRo8kwkHKRx1gYUhsYofl
YFhmRad/yBsmiTOq9tNN9ML1nGJ6eWLevkGQHy5ZS3NaZiiYGC88fHR743By+vYw
sGOOX/CHVGe62aNi3UVqqO5IZIQOh2/PHCOMdmrrDtpqSqu4JMTLHRxi/ADj98Bo
7gdOSsIyKBYsb5vSszWna2/mFaNNMb11FlC40WerPAB5VGeYRq/YIC4QtJTtUJrQ
43X1v1F4W0UACry6NdAxBGwHtTTFXKRotqTQ6xkHKp0ICfpCf4/nO9NZ7/rYg24W
I2vjTuLJjZ0sBM/R4bB891KAiEFxVkbk5hwl7I+nN9WSpImwAoBgz+8kLxbR2rpe
6tKlqXstX2E7yTkeZaYQrkHEXmoU7IsYJxj0XNXwKjIENCQcrQatgwwtdjjwRxrT
pBgg2D08mO/f+fxH94wbPhlXLvc9PWjcxPkSlmwnV+R2MCrJvWopdOS6+VU231UD
vlUiJvljbQ0r4bdC64LqvJzLK9y9Y9mSmUe2q8Jnu2r8Ik1o3HnidkrrwCWPjBnq
ldeEZJHD++3fMgd5LIAL
=mZ1d
-----END PGP SIGNATURE-----

--jkO+KyKz7TfD21mV--
