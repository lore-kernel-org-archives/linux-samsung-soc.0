From: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [1/3] i2c: exynos5: change internal transmission timeout to 100ms
Date: Mon, 15 Jan 2018 21:54:46 +0100
Message-ID: <20180115205445.i2ghkhj5btjymlh6@ninjato>
References: <20171130143007.30258-2-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="z2we2tscg2jax7kd"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:41629 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750752AbeAOUyr (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 15 Jan 2018 15:54:47 -0500
Content-Disposition: inline
In-Reply-To: <20171130143007.30258-2-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Andrzej Hajda <a.hajda@samsung.com>
Cc: Andi Shyti <andi.shyti@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, "open list:I2C SUBSYSTEM" <linux-i2c@vger.kernel.org>, "moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES" <linux-samsung-soc@vger.kernel.org>


--z2we2tscg2jax7kd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 30, 2017 at 03:30:05PM +0100, Andrzej Hajda wrote:
> Exynos-I2C uses default timeout of 1 second for the whole transaction,
> including re-transmissions due to arbitration lost errors (-EAGAIN).
> To allow re-transmissions driver's internal timeout should be significant=
ly
> lower, 100ms seems to be good candidate.
>=20
> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>

Applied to for-next, thanks!


--z2we2tscg2jax7kd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlpdFRUACgkQFA3kzBSg
KbZk4xAAgci3EdTigPn1CwMwf8gx6AKnEczPgrF+zMWIgYU6nW3Iz4vIjjkc44Vd
MLhmUXrRWHV1mUb191YIW0ycCSpdiIpHYwcs3lxImtAuTB5dFLEI9qVU6cTWL8+4
J4azeK9XF2TVYcpZOYCX1yo/w2NecTvplOT50cF4Da+wr3/XTeJ0uvRn25YMaZdH
MTdsyUZ5LxTjgDBOdpn4B+nx11ZNxR9fQr1uJqffQFeDj+W5JckbYDuoAn9yuhKy
aaQieVh2mfLQEt2XfZjCK5Ji8w4vG2umOCJunEFvffuY/BtJq38dLdqjQ77aRfo7
ptF/i0vtO4EtHCn4+lRHNpJJJIv1jmRSXVN1FDtmzOXFGta1NX4rdZY5MRalnM9a
k5fb8WKsTZrV1MpD4vmFs/7hJ+xt02hon7WSGJLfi4NOGo2n50gGYHDR9EAgO24r
8vzuP4TGziBsjRyIDwWVscqwqItQtRJh7XReNjR+YeQ7S1mCXYeBgWjK7B3T/ssv
LHb2/3gD8PFYT9IKj3EG+L7QLHxoHmnk7i+KLJINOOIt2xgVZvYjSqSMnPafH5Yd
M11/u7kJaRtpu0noPg33MAMyB78EYVcb4Jjh8vB3mwE+GwtiqXF9fTtczLskJdEg
XeC1uftQr3PYfanP3Moaf1+RFSEA9ltylP8J1SFdew6Hpizt5vM=
=MuHU
-----END PGP SIGNATURE-----

--z2we2tscg2jax7kd--
