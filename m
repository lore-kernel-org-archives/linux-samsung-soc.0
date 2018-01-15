From: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [3/3] i2c: exynos5: do not check TRANS_STATUS in case of Exynos7
 variant
Date: Mon, 15 Jan 2018 21:53:34 +0100
Message-ID: <20180115205334.6ciwq5pouthtj3kx@ninjato>
References: <20171130143007.30258-4-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="nhzwtsdtu6fgqlqu"
Return-path: <linux-i2c-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20171130143007.30258-4-a.hajda@samsung.com>
Sender: linux-i2c-owner@vger.kernel.org
To: Andrzej Hajda <a.hajda@samsung.com>
Cc: Andi Shyti <andi.shyti@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, "open list:I2C SUBSYSTEM" <linux-i2c@vger.kernel.org>, "moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES" <linux-samsung-soc@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org


--nhzwtsdtu6fgqlqu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 30, 2017 at 03:30:07PM +0100, Andrzej Hajda wrote:
> HSI2C_MASTER_ST_LOSE state is not documented properly, extensive tests
> show that hardware is usually able to recover from this state without
> interrupting the transfer. On the other side enforcing transfer repetition
> in such case does not help in many situations, especially on busy systems
> and causes -EAGAIN and -ETIMEOUT errors. Moreover documentation says that
> such state can be caused by slave clock stretching, and should not be tre=
ated
> as an error.
>=20
> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>

Can this be applied independently of my comments to patch 2?


--nhzwtsdtu6fgqlqu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlpdFM4ACgkQFA3kzBSg
KbYppA/+IH70a7+08mg4k/1woL4h2HBEKA/VWVStx0syh2L2fOU4XjTF9RJZm7Pw
lz6tuB2rnepsJvvDzeLleOZS0sKW+v1H2NCsy89kNjxy2klZKUSW4SoFuhxRjWE0
D1ayfrxrvNKxTpHqrxwRqvF3A5nBN2jP4Njqxk74Yj/isvVN0DSnLMsAbg6D85Nz
2zFbNFOysiQ6EBDLU8eYw1tOoScX6ITmp2uEeIvcd/glUdm2+Jq4BgTRbZyYaqlh
49ujAFyGHRVw5YWm0ZkWXIDnZdl2qq3+gUISS8tWBI3nLd8oZBlg6GwsHZ33Zql6
2avwq7l5L954COVFC3Ikdk9namOUZj2nc2mauVmnpzpiALlL0+UoClr19meFp8be
V3ecjXNQiyH0SB9MRNy8Ar+tzIqtZRAOZugGDBDxh1hJfH96PaxcKmeU3hLfns7x
Hhpi7+W0cWA34sA9SEwEaggTfGqrR7heIgq2//SAu4oesfvOqjlJ4M9mLS7e6gsC
e0RsN6BTq7JhC01zEdV0gIEdDt5vnidTn0xtWjtUdNIb/v1qQMAJn8faMjWNW4iY
V6q9ftFDYS/j2H4h2d4jV2YI97J8nHfYYRrtot/0hB7d1L6hRc2dwpZ2D1kRJwBp
wkKvmF/Xen4WujG9QHVF5RwT0cqmTzpd/rGWOm2sFyeVdCOwc7k=
=ccKW
-----END PGP SIGNATURE-----

--nhzwtsdtu6fgqlqu--
