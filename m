From: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH 1/2] i2c: exynos5: simplify clock frequency handling
Date: Fri, 21 Apr 2017 14:04:10 +0200
Message-ID: <20170421120410.7wbeopelj7sc6msc@ninjato>
References: <CGME20170224111634eucas1p22340b3b86a835e90ce981a9d9d4dc64a@eucas1p2.samsung.com>
 <1487934962-8703-1-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="hhcq7tlungtap2i4"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:55315 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1038154AbdDUMEM (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 21 Apr 2017 08:04:12 -0400
Content-Disposition: inline
In-Reply-To: <1487934962-8703-1-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Andrzej Hajda <a.hajda@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, linux-i2c@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>


--hhcq7tlungtap2i4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 24, 2017 at 12:16:01PM +0100, Andrzej Hajda wrote:
> There is no need to keep separate settings for high and fast speed clock.
>=20
> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>

Applied to for-next, thanks!


--hhcq7tlungtap2i4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlj59TkACgkQFA3kzBSg
KbZFEhAAkXaK1GZMGVqvgGjJ3UDNxGc6fC7CI76VZ07wFKAeidRtSsLLZlIMw4ra
WEQaQDbZKZHD7ZIG+b/dsKg6BVuu/+V29Hk/fJ1haSXnrswNFMa8MRtjfCd1YkN1
nJ/B3kc0IPgzFBuyYdd9bRBb9+qjBMh9xArsR/hnNmJfR3/TqRuuo/7R/YGLJ1Sm
STMxQD3HxkonvowHnDVRSyXoVaABTPf7Qex67Dzi0PMd4e4AhS7TmyaIrXZj3en3
yaw28TqDqEQHJ4sIB6RFuSwrI2myaWv43ElltZ6gDTq8zgJuiuUIFBfIa9Qg9TeH
P0rh9bYu9Twf8yJUpSxkgHcqou6uiMH62p8LJGCADMMQeUMr0C1e5o5te9pumr+S
4g8R255Bf2yKps+qj92q96skngzf+gql4Z3o4hCdEMmLzQBhid3MCGe+7dWX1FbC
uMydb6ZK13nzxp7BauKoLJ54moZcgci3mu9C6INTfcfliAvJvDUoO5zQ7wMY1gCX
8iHq/n7KeyW0sgADIotKwOhrC8ThYZpmCGHSVfbuJIRJblXRHIgXglWVubHIYB5J
WuwL35G9PKWyOYK9kpR4BB3jl5prp/1mK6EPUyPcpPlNdJPyx8hLIGxbsVUI3YnO
vSHv+KcNQPbZMYVDMvhGPFExzQD0UNVzHzQSGboeHVShWSJvQG8=
=OLmo
-----END PGP SIGNATURE-----

--hhcq7tlungtap2i4--
