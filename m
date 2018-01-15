From: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [2/3] i2c: exynos5: implement bus recovery functionality
Date: Mon, 15 Jan 2018 21:52:50 +0100
Message-ID: <20180115205250.p5mbn3ib2paj53pv@ninjato>
References: <20171130143007.30258-3-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="s3vgoqe2jhw5qkrb"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:41617 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750714AbeAOUww (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 15 Jan 2018 15:52:52 -0500
Content-Disposition: inline
In-Reply-To: <20171130143007.30258-3-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Andrzej Hajda <a.hajda@samsung.com>
Cc: Andi Shyti <andi.shyti@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, "open list:I2C SUBSYSTEM" <linux-i2c@vger.kernel.org>, "moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES" <linux-samsung-soc@vger.kernel.org>


--s3vgoqe2jhw5qkrb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Nov 30, 2017 at 03:30:06PM +0100, Andrzej Hajda wrote:
> In some circumstances I2C clients can be in abnormal state, to allow
> recover them from it I2C master can pulse SCL line until SDA line
> goes up and then generate STOP condition. Exynos driver does not have
> possibility to manipulate I2C lines directly, but it can provide similar
> functionality using manual commands. Replacing I2C adapter reset with

Really? READ_DATA looks like 8 clock pulses, but you need 9.

> bus recovery significantly incereases I2C bus robustness in case of timeo=
uts.
>=20
> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>



> @@ -642,7 +666,7 @@ static int exynos5_i2c_xfer_msg(struct exynos5_i2c *i=
2c,
>  		ret =3D exynos5_i2c_wait_bus_idle(i2c);
> =20
>  	if (ret < 0) {
> -		exynos5_i2c_reset(i2c);
> +		exynos5_i2c_recovery(i2c);

Bus recovery is only defined for stalled busses, i.e. when SDA is stuck
low. It is not a suitable method to deal with general timeouts.


> +int exynos5_i2c_recover_bus(struct i2c_adapter *adap)
> +{
> +	struct exynos5_i2c *i2c =3D adap->algo_data;
> +
> +	i2c_lock_adapter(adap);
> +	clk_enable(i2c->clk);
> +	exynos5_i2c_recovery(i2c);
> +	clk_disable(i2c->clk);
> +	i2c_unlock_adapter(adap);

Why do you need to lock? Aren't you protected by the call to master_xfer
which then detected a problem?

Regards,

   Wolfram


--s3vgoqe2jhw5qkrb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlpdFJwACgkQFA3kzBSg
KbYRxQ/8CDbnXV+h3nB6F+MG/UNuI7SBiijL4aAyCW81KOPQhnb6rlsLBgDyARPH
b6w8iMoBuLka1D+x9Lv8L1g/WVG5m/dAYcpF3lLYdpSmF8MIRQ2FlFgOHtkzcbJc
ZEslbVsJPYM3fgXM9J7vVwv8ZEB7FCXeuU9+h/cL7uhcoZKTCWFlF/0A8vh7QqFC
BptNFpNQidRltH3glVOlkwuJFmL/6QexR3SJa5nhFR3XM7AJTV6E+gURvETLAldr
4jgFcM017bx5AIyO/4y7n2Hq//UBgffSW8MqGj+TEKfhG2NLiDKM8MRO33NqHUVN
VHzp9kNvVZwRzGR7WJt4SybqbJlToG1dGHPT1Ts+0qRL4HgqlWi+EoIimaLQA/mh
CVTTPBGxbYRM4sEGx0U4jEhUb/D3Ii675yXsK8YCq9PsSZVRmr9mN2cSx8rd859U
v9RaoT+kQke/0m8MPSgE6nNSkrhYYAowT/qSr/kiDalMmbqdM9ZGBCIRxrN9a32y
HOEiLaqPp7PZCBE9FmjCAeaJcP61O9vW71g8FJrQLU1GlvTI7XEJtbjsDic+CXqU
EftNLrAD1Q0N/gB+0y00X0lS6HS/S9hJh3QEqBaqIJYczsyK870uT6Kwr4Ir5FHD
GiO2iWYQdggt7IkRW+6QsLs5lHluSBSvmEDQmj5iB5t+ooIV5Do=
=XAwe
-----END PGP SIGNATURE-----

--s3vgoqe2jhw5qkrb--
