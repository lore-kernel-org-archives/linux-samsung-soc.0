From: Wolfram Sang <w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH v4] i2c: exynos5: add High Speed I2C controller driver
Date: Fri, 1 Feb 2013 20:29:23 +0100
Message-ID: <20130201192923.GA23176@pengutronix.de>
References: <1354021236-28596-2-git-send-email-ch.naveen@samsung.com>
 <1359734084-10594-1-git-send-email-ch.naveen@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="u3/rZRmxL6MmkK24"
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1359734084-10594-1-git-send-email-ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Naveen Krishna Chatradhi <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org, ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org, grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, grundler-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, naveenkrishna.ch-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org


--u3/rZRmxL6MmkK24
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 01, 2013 at 09:24:44PM +0530, Naveen Krishna Chatradhi wrote:
> Adds support for High Speed I2C driver found in Exynos5 and later
> SoCs from Samsung. This driver currently supports Auto mode.
>=20
> Driver only supports Device Tree method.
> Note: Added debugfs support for registers view, not tested.
>=20
> Signed-off-by: Taekgyun Ko <taeggyun.ko-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Signed-off-by: Naveen Krishna Chatradhi <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> ---
> Help please,
>=20
> Usual reads and writes are happening. But, when i try doing
> i2cdetect -y 0 0x10 0x59; It throws me continous interrupts at 0x1a
> i2cdetect -y 0 0x50 0x64; It throws me continous interrupts at 0x63
>=20
> There are eeproms from 0x50 till 0x58
> wm8994 codec at 0x1a
>=20
> Kindly, can anyone explain this behaviour.

You select I2C_FUNC_SMBUS_EMUL, but make sure your hardware really
supports I2C_FUNC_SMBUS_QUICK. That would be my first guess. Also, which
eeprom do you have? Check its datasheet, some in deed use 8 addresses.

Regards,

   Wolfram

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--u3/rZRmxL6MmkK24
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlEMF5MACgkQD27XaX1/VRuM3QCbBcAfzGgPKWsLTrkhFvLpB53t
S6IAn2f/VN+TgMX6H6KfBdwS2PNuXyRh
=mwNd
-----END PGP SIGNATURE-----

--u3/rZRmxL6MmkK24--
