From: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH v2 2/2] i2c: exynos5: Fix possible ABBA deadlock by
 keeping I2C clock prepared
Date: Fri, 22 Apr 2016 15:31:46 +0200
Message-ID: <20160422133146.GC1538@katana>
References: <1460855693-28225-1-git-send-email-javier@osg.samsung.com>
 <1460855693-28225-2-git-send-email-javier@osg.samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="XMCwj5IQnwKtuyBG"
Return-path: <linux-i2c-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1460855693-28225-2-git-send-email-javier@osg.samsung.com>
Sender: linux-i2c-owner@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>
Cc: linux-kernel@vger.kernel.org, Anand Moon <linux.amoon@gmail.com>, Kukjin Kim <kgene@kernel.org>, linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org


--XMCwj5IQnwKtuyBG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 16, 2016 at 09:14:53PM -0400, Javier Martinez Canillas wrote:
> The exynos5 I2C controller driver always prepares and enables a clock
> before using it and then disables unprepares it when the clock is not
> used anymore.
>=20
> But this can cause a possible ABBA deadlock in some scenarios since a
> driver that uses regmap to access its I2C registers, will first grab
> the regmap lock and then the I2C xfer function will grab the prepare
> lock when preparing the I2C clock. But since the clock driver also
> uses regmap for I2C accesses, preparing a clock will first grab the
> prepare lock and then the regmap lock when using the regmap API.
>=20
> An example of this happens on the Exynos5422 Odroid XU4 board where a
> s2mps11 PMIC is used and both the s2mps11 regulators and clk drivers
> share the same I2C regmap.
>=20
> The possible deadlock is reported by the kernel lockdep:
>=20
>   Possible unsafe locking scenario:
>=20
>         CPU0                    CPU1

Squashed both patches into one for easier backporting, added stable and
applied to for-current, thanks!


--XMCwj5IQnwKtuyBG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXGifCAAoJEBQN5MwUoCm2QtEP/3xTxhXLVUZ19ws0rl6DKClT
fenuzBMLwt2vDcDXqPB0IcnG74L1JhXjzmtaP4BdB1NevsnVMPjkqsQoAs8/Qbh4
kdIpTaB5cXrjbyhPBIePqWZ6g+yp7zrrN4TW2yr7woDwdBuzizMAhr+/yVAtIcvs
O88Jx1/Xeic1QLr1OGDB9aw3+sZ/7DigX8OTzNM6+JQD3nB9ohitkan9g64um4vs
oarTGJrHDROVmyovh3z2x2bTeVzGsX8ttLo5+V4WRAtu51Rk8ZOBJM8D4iyh8zKf
rOS6FBvHjmaHA5D0X8d+1pD4FuiKVDD5Ie/rOyP+hp3we2BgGqql5OG5nquOaSrI
/6NUvEt/su/R6MK3b0csQiYX1+kCXFTJ7X8ej+Khtvk3nXzEPKGYsiOb6Un8mVKc
qfiNhzkZvzeyf50u0Nji1+fO/r8Spnx6gsJRrEcN/QufEGjA/BPPFG7ko7evzUT7
U32VLUaZ0AatHWqstpxGFoimKIyRhKLTKh4+ci2zjSSKFg0UYajtwdlVkXnxw+bC
06D8NhFfGyxtxTFNpfYbLmmiRtR/iNtc6qD7KDmyvXyjtayfLJM3AxV7gWGua8y0
R9LF+69d5U2pgUCknFlvrkFZbsKCHA7xgAWNJ7d2cKeI1jxmJco5MR9iEcRCeMgs
QB36SmvwSBN6+2W/Rr6M
=sP/e
-----END PGP SIGNATURE-----

--XMCwj5IQnwKtuyBG--
