From: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [3/3] i2c: exynos5: do not check TRANS_STATUS in case of Exynos7
 variant
Date: Thu, 18 Jan 2018 00:23:08 +0100
Message-ID: <20180117232307.aigvkl564p4jzms3@ninjato>
References: <20171130143007.30258-4-a.hajda@samsung.com>
 <CGME20180115205339epcas1p24810c38f964d43cc1b8589d3c3cc3c73@epcas1p2.samsung.com>
 <20180115205334.6ciwq5pouthtj3kx@ninjato>
 <bddb6ff4-22cd-9f01-7a63-295b19eaef90@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="leale5bytct7megg"
Return-path: <linux-i2c-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <bddb6ff4-22cd-9f01-7a63-295b19eaef90@samsung.com>
Sender: linux-i2c-owner@vger.kernel.org
To: Andrzej Hajda <a.hajda@samsung.com>
Cc: Andi Shyti <andi.shyti@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, "open list:I2C SUBSYSTEM" <linux-i2c@vger.kernel.org>, "moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES" <linux-samsung-soc@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org


--leale5bytct7megg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 16, 2018 at 10:40:36AM +0100, Andrzej Hajda wrote:
> On 15.01.2018 21:53, Wolfram Sang wrote:
> > On Thu, Nov 30, 2017 at 03:30:07PM +0100, Andrzej Hajda wrote:
> >> HSI2C_MASTER_ST_LOSE state is not documented properly, extensive tests
> >> show that hardware is usually able to recover from this state without
> >> interrupting the transfer. On the other side enforcing transfer repetition
> >> in such case does not help in many situations, especially on busy systems
> >> and causes -EAGAIN and -ETIMEOUT errors. Moreover documentation says that
> >> such state can be caused by slave clock stretching, and should not be treated
> >> as an error.
> >>
> >> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
> > Can this be applied independently of my comments to patch 2?
> >
> Yes, please apply it alone. I will continue work on patch 2.

I just thought it might be nice to have a comment where you removed the
code summarizing your findings. So we will remember about this in the
future. Makes sense?


--leale5bytct7megg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlpf2tsACgkQFA3kzBSg
KbaIxxAAsiypuNqumDWYs/bcAA4JjKQ+6xZ0PwcTLRrczo9/ZqgG7ltTQl/Fn9Ap
25L+XGvR9oNBKwFrqwFs3iXhizV00oU2QL73nBcBHEiNNdJzTYV95GmlN7p9cjun
sWNFfFYoRRWHHSntX5k6T/MMCR9gO9pPbKRTtYAW4qJuW4iAXj777GOIqnjWD9gZ
9lMQHA4MZTSu8MQxjHtQ263mDP1fXiFR6B5Kbj6RzPGX3OypP6QmDWRZ2SmfTCfg
LKDMxS7vHaFYDYK8q+QdBdGwCEOEy2Wf7EpT0jNwfNPHY1eW4+cPsliYbENkpNn8
x9qTqEDrjnaeeexQfj3GWrq1MoZt4hTz4HTkZYCkN9i8Y7Yy7YuEJTr+oJ22McVI
tcs+mYvbgv3HqciJ+FpW6hDZG6kNP1Gi77sUAz4twIGrP0yRoqqWhdK0TT4q7we4
gmTrf9LLznWsYo7RVDaYFK8P7KBDgtW7Eb3+s+loHdiKLHa8T4NBCOWn2zTjEhHN
wnbzOzxI9Rfq0MWDoWcUah0Avn7S2nJLKDg/lCv6HSCIobXdCrISP2n7E8kZGf15
K0ifDMudcI4y5FAzSJvvQkirAGScPuGAjCJqhvsiuqLG1DN6fEdjkRpfVUppS+1H
QW+w+1gQiES8kVyD/kHbgtwiNQrBWI9ddy7CU2w+FlpbnFORihU=
=EZPt
-----END PGP SIGNATURE-----

--leale5bytct7megg--
